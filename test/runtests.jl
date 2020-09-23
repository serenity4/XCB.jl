using XCB

function resize_callback(window, width, height)
    old_width, old_height = Int.((window.width, window.height))
    width, height = Int.((width, height))
    @info "Window size changed: $old_width, $old_height -> $width, $height"
end

function test()
    # ENV["DISPLAY"] = ":1.0"
    # ENV["XAUTHORITY"] = "/run/user/1000/gdm/Xauthority"

    r = Ref(XCB.xcb_rectangle_t(20, 20, 60, 60))
    function process_event(connection, window, ctx, event, t)
        e_generic = unsafe_load(event)
        if e_generic.response_type == XCB.XCB_EXPOSE
            @info "Window exposed"
            XCB.xcb_poly_fill_rectangle(connection, window.id, ctx.id, UInt32(1), r)
            flush(connection)
        elseif any(e_generic.response_type .== [XCB.XCB_KEY_PRESS, XCB.XCB_KEY_RELEASE])
            key_event = unsafe_load(convert(Ptr{XCB.xcb_key_press_event_t}, event))
            keychar = getkey(connection, key_event)
            display(keychar)
            key = KeyCombination(connection, key_event)
            keyctx = KeyContext(key_event)
            @info "Pressed key $keychar ; combination $key; context $keyctx"
            window.window_title[] = "Random title $(rand())"
            if key ∈ [key"q", key"ctrl+q", key"f4"]
                throw(CloseWindow("Closing window ($key)"))
            end
        elseif e_generic.response_type == XCB.XCB_EVENT_MASK_BUTTON_PRESS
            button_event = unsafe_load(convert(Ptr{XCB.xcb_button_press_event_t}, event))
            click = Button(button_event)
            state = ButtonState(button_event)
            state_dict = Dict(state)
            printed_state = keys(filter(x -> x.second, state_dict))
            printed_state = isempty(printed_state) ? "" : "with $(join(printed_state, ", ")) button$(length(printed_state) > 1 ? "s" : "") held"
            @info "$click at $(button_event.event_x), $(button_event.event_y) $(printed_state)"
        elseif e_generic.response_type == XCB.XCB_CLIENT_MESSAGE
            if unsafe_load(convert(Ptr{xcb.xcb_client_message_event_t}, event)).data.data8[1] == wm_delete_win # does nothing for now
                @warn "HAAA"
                throw(CloseWindow("Closing window"))
            end
        end
    end

    connection = Connection(display=nothing)
    setup = Setup(connection)
    println(setup.value)
    iter = XCB.xcb_setup_roots_iterator(setup)
    screen = unsafe_load(iter.data)
    println(screen)
    
    value_masks = |(XCB.XCB_CW_BACK_PIXEL, XCB.XCB_CW_EVENT_MASK)
    value_list = [screen.black_pixel, |(XCB.XCB_EVENT_MASK_EXPOSURE, XCB.XCB_EVENT_MASK_KEY_PRESS, XCB.XCB_EVENT_MASK_KEY_RELEASE, XCB.XCB_EVENT_MASK_BUTTON_PRESS, XCB.XCB_EVENT_MASK_BUTTON_RELEASE, XCB.XCB_EVENT_MASK_STRUCTURE_NOTIFY)]
    
    window = Window(connection, screen, value_masks, value_list; x=0, y=1000, border_width=50, window_title="XCB window", icon_title="XCB")
    println("Window ID: ", window.id)
    mask = |(XCB.XCB_GC_FOREGROUND, XCB.XCB_GC_GRAPHICS_EXPOSURES)
    value_list[1] = screen.black_pixel
    value_list[2] = 0
    ctx = GraphicsContext(connection, window, mask, value_list)
    
    XCB.xcb_map_window(connection, window.id)
    flush(connection)
    wm_delete_cookie = XCB.xcb_intern_atom(connection, 0, length("WM_DELETE_WINDOW"), pointer("WM_DELETE_WINDOW"))
    wm_protocols_cookie = XCB.xcb_intern_atom(connection, 0, length("WM_PROTOCOLS"), pointer("WM_PROTOCOLS"))
    wm_delete_reply = XCB.xcb_intern_atom_reply(connection, wm_delete_cookie, C_NULL)
    wm_protocols_reply = XCB.xcb_intern_atom_reply(connection, wm_protocols_cookie, C_NULL)
    XCB.xcb_change_property(connection, xcb.XCB_PROP_MODE_REPLACE, window.id, unsafe_load(wm_protocols_reply).atom, 4, 32, 1, Ref(unsafe_load(wm_delete_reply).atom))
    wm_delete_win = unsafe_load(wm_delete_reply).atom
    # event loop
    run_window(window, ctx, process_event; resize_callback)

end

test()