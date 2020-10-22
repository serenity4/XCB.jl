using XCB
using Rocket

include("events.jl")

function resize_callback(window, width, height)
    @info "Window size changed: $width, $height"
end

r = Ref(XCB.xcb_rectangle_t(20, 20, 60, 60))

function process_event(win, ctx, event, t)
    e_generic = unsafe_load(event)
    if e_generic.response_type == XCB.XCB_EXPOSE
        @info "Window exposed"
    elseif any(e_generic.response_type .== [XCB.XCB_KEY_PRESS, XCB.XCB_KEY_RELEASE])
        XCB.change_graphics_context!(ctx, ctx.mask, [rand(1:16_777_215), 0])
        XCB.@flush XCB.xcb_poly_fill_rectangle(win.conn, win.id, ctx.id, UInt32(1), r)
        key_event = unsafe_load(convert(Ptr{XCB.xcb_key_press_event_t}, event))
        keychar = getkey(win.conn, key_event)
        key = KeyCombination(win.conn, key_event)
        keyctx = KeyContext(key_event)
        @info "Pressed key $keychar ; combination $key; context $keyctx"
        XCB.set_title(win, "Random title $(rand())")
        if key ∈ [key"q", key"ctrl+q", key"f4"]
            throw(CloseWindow("Closing window ($key)"))
        elseif key == key"s"
            curr_extent = XCB.extent(win)
            XCB.set_extent(win, curr_extent .+ 1)
        end
    elseif e_generic.response_type == XCB.XCB_EVENT_MASK_BUTTON_PRESS
        button_event = unsafe_load(convert(Ptr{XCB.xcb_button_press_event_t}, event))
        click = Button(button_event)
        state = ButtonState(button_event)
        state_dict = Dict(state)
        printed_state = keys(filter(x -> x.second, state_dict))
        printed_state = isempty(printed_state) ? "" : "with $(join(printed_state, ", ")) button$(length(printed_state) > 1 ? "s" : "") held"
        @info "$click at $(button_event.event_x), $(button_event.event_y) $(printed_state)"
    # elseif e_generic.response_type == XCB.XCB_CLIENT_MESSAGE # close the window; never gets signaled
    #     if unsafe_load(convert(Ptr{xcb.xcb_client_message_event_t}, event)).data.data32[1] == wm_delete_win # does nothing for now
    #         throw(CloseWindow("Closing window"))
    #     end
    end
end

function test()
    ENV["DISPLAY"] = ":1.0"
    # ENV["XAUTHORITY"] = "/run/user/1000/gdm/Xauthority"


    connection = Connection(display=nothing)
    setup = Setup(connection)
    println(setup.value)
    iter = XCB.xcb_setup_roots_iterator(setup)
    screen = unsafe_load(iter.data)
    println(screen)
    
    value_masks = |(XCB.XCB_CW_BACK_PIXEL, XCB.XCB_CW_EVENT_MASK)
    value_list = [screen.black_pixel, |(XCB.XCB_EVENT_MASK_EXPOSURE, XCB.XCB_EVENT_MASK_KEY_PRESS, XCB.XCB_EVENT_MASK_KEY_RELEASE, XCB.XCB_EVENT_MASK_BUTTON_PRESS, XCB.XCB_EVENT_MASK_BUTTON_RELEASE, XCB.XCB_EVENT_MASK_STRUCTURE_NOTIFY)]
    
    window = XCBWindow(connection, screen, value_masks, value_list; x=0, y=1000, border_width=50, window_title="XCB window", icon_title="XCB")
    println("Window ID: ", window.id)
    mask = |(XCB.XCB_GC_FOREGROUND, XCB.XCB_GC_GRAPHICS_EXPOSURES)
    value_list[1] = screen.black_pixel
    value_list[2] = 0
    ctx = GraphicsContext(connection, window, mask, value_list)
    
#=    # I tried to setup a property which sends an event upon window termination (e.g. closing it manually, or right-click etc), but it does not work! in that case xcb_wait_for_event returns C_NULL so for now the event loop closes upon such event and logs an error

    wm_protocols_cookie = XCB.xcb_intern_atom(connection, 1, length("WM_PROTOCOLS"), "WM_PROTOCOLS")
    wm_protocols_reply = XCB.xcb_intern_atom_reply(connection, wm_protocols_cookie, C_NULL)
    wm_delete_cookie = XCB.xcb_intern_atom(connection, 0, length("WM_DELETE_WINDOW"), "WM_DELETE_WINDOW")
    wm_delete_reply = XCB.xcb_intern_atom_reply(connection, wm_delete_cookie, C_NULL)
    XCB.xcb_change_property(connection, xcb.XCB_PROP_MODE_REPLACE, window.id, unsafe_load(wm_protocols_reply).atom, 4, 32, 1, Ref(unsafe_load(wm_delete_reply).atom))
    wm_delete_win = unsafe_load(wm_delete_reply).atom
     =#

    # async = !isempty(ARGS) && ARGS[1] == "--async"
    #  async = true
     async = false

     sub = run_window(window, process_event; ctx, resize_callback, async)
     if async # window should run in parallel
        sleep(1)
        println(1)
        println(2)
        println(3)
        println(4)
        println(5)
        sleep(5)
    end
end

test()