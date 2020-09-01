using XCB
using Test

abstract type Handle end
struct Connection <: Handle
    h
end

struct Setup <: Handle
    h
    value
end

"""
Initialize a connection to the X server.
"""
function Connection(; display_number=nothing)
    display_number = isnothing(display_number) ? C_NULL : pointer(":" * string(display_number))
    connection = Connection(XCB.xcb_connect(display_number, C_NULL))
    check(connection)
end

function state(detail)
    
end

@enum XCB_CONN_ERROR_CODE begin
    XCB_CONN_ERROR = 1
    XCB_CONN_CLOSED_EXT_NOTSUPPORTED = 2
    XCB_CONN_CLOSED_MEM_INSUFFICIENT = 3
    XCB_CONN_CLOSED_REQ_LEN_EXCEED = 4
    XCB_CONN_CLOSED_PARSE_ERR = 5
    XCB_CONN_CLOSED_INVALID_SCREEN = 6
    XCB_CONN_CLOSED_FDPASSING_FAILED = 7
end


function Base.show(io::IO, setup::XCB.xcb_setup_t)
    desc = ["Version"]
    vals = [VersionNumber(setup.protocol_major_version, setup.protocol_minor_version, setup.release_number)]
    println(io, "Setup")
    prettyprint(io, desc, vals)
end

function format_bignumber(number)
    number_str = string(number)
    join(map((i, x) -> (mod(i, 3) == 0 && i ≠ length(number_str) ? "," : "") * x, length(number_str):-1:1, number_str))
end

prettyprint(io, desc, vals) = (description = join.(zip(rpad.(desc, 20), vals), ": "); print(io, join("    " .* description, "\n")))

function Base.show(io::IO, screen::XCB.xcb_screen_t)
    desc = ["White pixel value", "Black pixel value", "Width", "Height"]
    vals = Any[format_bignumber(screen.white_pixel), format_bignumber(screen.black_pixel), "$(screen.width_in_pixels) pixels, $(screen.width_in_millimeters / 10) cm", "$(screen.height_in_pixels) pixels, $(screen.height_in_millimeters / 10) cm"]
    println(io, "Screen details")
    prettyprint(io, desc, vals)
end


function check_flush(code)
    if code <= 0
        error("Error during flush ($code)")
    end
end

flush(connection::Connection) = check_flush(XCB.xcb_flush(connection.h))

function check(connection::Connection)
    code = XCB.xcb_connection_has_error(connection.h)
    @assert connection.h != C_NULL
    if code ≠ 0
        error("XCB connection not successful: $(XCB_CONN_ERROR_CODE(code))")
    end
    connection
end

function Setup(connection::Connection)
    stp = XCB.xcb_get_setup(connection.h)
    @assert stp != C_NULL
    Setup(stp, unsafe_load(stp))
end

function test()
    ENV["DISPLAY"] = ":0"
    # connection = connect()
    connection = Connection(display_number=0)
    setup = Setup(connection)
    println(setup.value)
    iter = XCB.xcb_setup_roots_iterator(setup.h)
    screen = unsafe_load(iter.data)
    println(screen)
    
    window_id = XCB.xcb_generate_id(connection.h)
    mask = XCB.XCB_CW_BACK_PIXEL | XCB.XCB_CW_EVENT_MASK
    value_list = zeros(UInt32, 32)
    value_list[1] = screen.black_pixel
    value_list[2] = XCB.XCB_EVENT_MASK_EXPOSURE | XCB.XCB_EVENT_MASK_KEY_PRESS | XCB.XCB_EVENT_MASK_KEY_RELEASE
    
    XCB.xcb_create_window(
        connection.h,
        XCB.XCB_COPY_FROM_PARENT,
        window_id,
        screen.root,
        Int16(0),
        Int16(0),
        UInt16(512),
        UInt16(512),
        UInt16(1),
        UInt16(XCB.XCB_WINDOW_CLASS_INPUT_OUTPUT),
        screen.root_visual,
        mask,
        value_list,
        )
    println("Window ID: ", window_id)
    mask = XCB.XCB_GC_FOREGROUND | XCB.XCB_GC_GRAPHICS_EXPOSURES
    value_list[1] = screen.black_pixel
    value_list[2] = 0
    g = XCB.xcb_generate_id(connection.h)
    XCB.xcb_create_gc(connection.h, g, window_id, mask, value_list)
    
    XCB.xcb_map_window(connection.h, window_id)
    flush(connection)
    r = Ref(XCB.xcb_rectangle_t(20, 20, 60, 60))
    wm_delete_cookie = XCB.xcb_intern_atom(connection.h, 0, length("WM_DELETE_WINDOW"), pointer("WM_DELETE_WINDOW"))
    wm_protocols_cookie = XCB.xcb_intern_atom(connection.h, 0, length("WM_PROTOCOLS"), pointer("WM_PROTOCOLS"))
    wm_delete_reply = XCB.xcb_intern_atom_reply(connection.h, wm_delete_cookie, C_NULL)
    wm_protocols_reply = XCB.xcb_intern_atom_reply(connection.h, wm_protocols_cookie, C_NULL)
    XCB.xcb_change_property(connection.h, xcb.XCB_PROP_MODE_REPLACE, window_id, unsafe_load(wm_protocols_reply).atom, 4, 32, 1, Ref(unsafe_load(wm_delete_reply).atom))
    wm_delete_win = unsafe_load(wm_delete_reply).atom
    # event loop
    while true
        event = XCB.xcb_wait_for_event(connection.h)
        e_generic = unsafe_load(event)
        if e_generic.response_type == XCB.XCB_EXPOSE
            @info "Window exposed"
            XCB.xcb_poly_fill_rectangle(connection.h, window_id, g, UInt32(1), r)
            flush(connection)
        elseif any(e_generic.response_type .== [XCB.XCB_KEY_PRESS, XCB.XCB_KEY_RELEASE])
            key_event = unsafe_load(convert(Ptr{XCB.xcb_key_press_event_t}, event))
            keychar = getkey(connection.h, key_event)
            key = KeyBinding(connection.h, key_event)
            ctx = KeyContext(key_event)
            @info "Pressed key $keychar ; combination $key; context $ctx"
            if key ∈ [key"q", key"ctrl+q"]
                @info "Closing window ($key)"
                break
            end
        elseif e_generic.response_type == XCB.XCB_CLIENT_MESSAGE
            if unsafe_load(convert(Ptr{xcb.xcb_client_message_event_t}, event)).data.data8[1] == wm_delete_win # does nothing for now
                @warn "HAAA"
                break
            end
        end
    end
    XCB.xcb_destroy_window(connection.h, window_id)
    XCB.xcb_disconnect(connection.h)
end

test()