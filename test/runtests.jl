using XCB
using WindowAbstractions
using Test
using Parameters

include("events.jl")

function on_button_pressed(details::EventDetails)
    x, y = details.location
    click = details.data.button
    state = details.data.state
    buttons_pressed = pressed_buttons(state)
    printed_state = isempty(buttons_pressed) ? "" : "with $(join(string.(buttons_pressed), ", ")) button$(length(buttons_pressed) > 1 ? "s" : "") held"
    @info "$click at $x, $y $printed_state"
end

function on_key_pressed(details::EventDetails)
    win = details.window
    km = details.window_handler.keymap
    @info(key_info(details))
    @unpack key_name, key, input, modifiers = details.data
    kc = KeyCombination(key, modifiers)
    ctx = win.ctx
    set_title(win, "Random title $(rand())")
    # @info("Input from key $key_name: \"\e[33m$(input)\e[m\" from pressing \e[33m$(key)\e[m")
    if kc ∈ [key"q", key"ctrl+q", key"f4"]
        throw(CloseWindow(details.window_handler, win))
    elseif kc == key"s"
        curr_extent = XCB.extent(win)
        XCB.set_extent(win, curr_extent .+ 1)
    elseif kc == key"i"
        open("keymap.txt", "w") do io
            write(io, keymap_info(km))
        end
    else
        XCB.change_graphics_context!(ctx, ctx.mask, [rand(1:16_777_215), 0])
        XCB.@flush XCB.xcb_poly_fill_rectangle(win.conn, win.id, ctx.id, UInt32(1), r)
    end
end

r = Ref(XCB.xcb_rectangle_t(20, 20, 60, 60))

function test()
    !get(ENV, "CI", false) && setindex!(ENV, ":1.0", "DISPLAY")

    connection = Connection(display=nothing)
    setup = Setup(connection)
    println(setup.value)
    iter = XCB.xcb_setup_roots_iterator(setup)
    screen = unsafe_load(iter.data)
    println(screen)
    
    value_masks = |(XCB.XCB_CW_BACK_PIXEL, XCB.XCB_CW_EVENT_MASK)
    value_list = [screen.black_pixel, |(XCB.XCB_EVENT_MASK_EXPOSURE, XCB.XCB_EVENT_MASK_KEY_PRESS, XCB.XCB_EVENT_MASK_KEY_RELEASE, XCB.XCB_EVENT_MASK_BUTTON_PRESS, XCB.XCB_EVENT_MASK_BUTTON_RELEASE, XCB.XCB_EVENT_MASK_STRUCTURE_NOTIFY, XCB.XCB_EVENT_MASK_ENTER_WINDOW, XCB.XCB_EVENT_MASK_LEAVE_WINDOW, XCB.XCB_EVENT_MASK_POINTER_MOTION, XCB.XCB_EVENT_MASK_SUBSTRUCTURE_REDIRECT, XCB.XCB_EVENT_MASK_KEYMAP_STATE)]
    
    window = XCBWindow(connection, screen, value_masks, value_list; x=0, y=1000, border_width=50, window_title="XCB window", icon_title="XCB")
    println("Window ID: ", window.id)
    mask = |(XCB.XCB_GC_FOREGROUND, XCB.XCB_GC_GRAPHICS_EXPOSURES)
    value_list[1] = screen.black_pixel
    value_list[2] = 0
    ctx = GraphicsContext(connection, window, mask, value_list)
    attach_graphics_context!(window, ctx)
    # window_2 = XCBWindow(connection, screen, value_masks, value_list; x=200, y=500, border_width=50, window_title="XCB window 2", icon_title="XCB2")
    # ctx_2 = GraphicsContext(connection, window_2, mask, value_list)
    # attach_graphics_context!(window_2, ctx_2)

    handler = XWindowHandler(connection, [window])

    xkb_event_details = event_details_xkb(Dict("state" => true))
    @show xkb_event_details
    @check XCB.xcb_xkb_select_events_aux(connection, handler.keymap.device_id, XCB.XCB_XKB_EVENT_TYPE_STATE_NOTIFY, true, true, false, 0, Ref(xkb_event_details))

    event_loop = EventLoop(
        window_handler=handler,
        callbacks=Dict(
            :window_1 => WindowCallbacks(;
                on_resize = x -> @info("Window size changed: $(x.data.new_dimensions)"),
                on_mouse_button_pressed = on_button_pressed,
                on_mouse_button_released = x -> @info("Released mouse button $(x.data.button)"),
                on_key_pressed,
                # on_key_released = x -> println("Released $(x.data.kc)"),
                # on_pointer_enter = x -> @info("Entering window at $(x.location)"),
                # on_pointer_leave = x -> @info("Leaving window at $(x.location)"),
                # on_pointer_move = x -> @info("Moving pointer at $(x.location)"),
                on_expose = x -> @info("Window exposed"),
            ),
            :window_2 => WindowCallbacks(;
            on_key_pressed,
            ),
        ),
    )
    run(event_loop, Synchronous(); warn_unknown=true, poll=true)
end

test()