using XCB
using Test

"""
Initialize a connection to the X server.
"""
function connect(; display_name=nothing)
    display_name = isnothing(display_name) ? C_NULL : pointer(display_name)
    connection = XCB.xcb_connect(display_name, C_NULL)
    connection
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
    desc = ["White pixels", "Black pixels", "Width", "Height"]
    vals = Any[format_bignumber(screen.white_pixel), format_bignumber(screen.black_pixel), "$(screen.width_in_pixels) pixels, $(screen.width_in_millimeters / 10) cm", "$(screen.height_in_pixels) pixels, $(screen.height_in_millimeters / 10) cm"]
    println(io, "Screen details")
    prettyprint(io, desc, vals)
end

function test()
    ENV["DISPLAY"] = ":0"
    connection = connect()
    # connection = connect(display_name="MyDisplay")
    @test connection ≠ C_NULL
    error_code = XCB.xcb_connection_has_error(connection)
    @assert error_code == 0 "XCB connection not successful: $error_code"
    setup = XCB.xcb_get_setup(connection)
    @test setup ≠ C_NULL
    # all fields are 0, why??
    setup_deref = unsafe_load(setup)
    println(setup_deref)
    iter = XCB.xcb_setup_roots_iterator(setup)
    screen = unsafe_load(iter.data)
    println(screen)
    
    window_id = XCB.xcb_generate_id(connection)
    mask = XCB.XCB_CW_BACK_PIXEL | XCB.XCB_CW_EVENT_MASK
    value_list = zeros(UInt32, 32)
    value_list[1] = screen.white_pixel
    value_list[2] = XCB.XCB_EVENT_MASK_EXPOSURE | XCB.XCB_EVENT_MASK_KEY_PRESS
    
    XCB.xcb_create_window(
        connection,
        UInt8(XCB.XCB_COPY_FROM_PARENT),
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
    println("ID: ", window_id)
    mask = XCB.XCB_GC_FOREGROUND | XCB.XCB_GC_GRAPHICS_EXPOSURES
    value_list[1] = screen.black_pixel
    value_list[2] = 0
    g = XCB.xcb_generate_id(connection)
    XCB.xcb_create_gc(connection, g, window_id, mask, value_list)
    
    XCB.xcb_map_window(connection, window_id)
    XCB.xcb_flush(connection)
    r = Ref(XCB.xcb_rectangle_t(20, 20, 60, 60))
    # event loop
    done = false
    XCB.xcb_disconnect(connection)
    return
    while !done
        e = unsafe_load(XCB.xcb_wait_for_event(connection))
        if e.response_type == XCB.XCB_EXPOSE
            println("EXPOSE")
            XCB.xcb_poly_fill_rectangle(connection, window_id, g, UInt32(1), r)
            XCB.xcb_flush(connection)
        elseif e.response_type == XCB.XCB_KEY_PRESS
            # exit on keypress */
            done = true
        end
    end
end

test()
