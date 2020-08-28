using XCB
using Test

function test()
    scr = Ref{Cint}()
    # connect to xserver
    connection = XCB.xcb_connect(C_NULL, scr)
    println(connection)
    #
    setup = XCB.xcb_get_setup(connection)
    println(setup)
    iter = XCB.xcb_setup_roots_iterator(setup)
    screen = unsafe_load(iter.data, 1)

    window = XCB.xcb_generate_id(connection)
    mask = XCB.XCB_CW_BACK_PIXEL | XCB.XCB_CW_EVENT_MASK
    value_list = zeros(UInt32, 32)
    value_list[1] = screen.white_pixel
    value_list[2] = XCB.XCB_EVENT_MASK_EXPOSURE | XCB.XCB_EVENT_MASK_KEY_PRESS

    XCB.xcb_create_window(
        connection, UInt8(XCB.XCB_COPY_FROM_PARENT), window,
        screen.root, Int16(0), Int16(0), UInt16(512), UInt16(512), UInt16(1),
        UInt16(XCB.XCB_WINDOW_CLASS_INPUT_OUTPUT), screen.root_visual,
        mask, value_list
    )
    mask = XCB.XCB_GC_FOREGROUND | XCB.XCB_GC_GRAPHICS_EXPOSURES
    value_list[1] = screen.black_pixel
    value_list[2] = 0
    g = XCB.xcb_generate_id(connection)
    XCB.xcb_create_gc(connection, g, window, mask, value_list)

    XCB.xcb_map_window(connection, window)
    XCB.xcb_flush(connection)
    r = Ref(XCB.xcb_rectangle_t(20,20,60,60))
    # event loop
    done = false
    while !done
        e = unsafe_load(XCB.xcb_wait_for_event(connection))
        if e.response_type == XCB.XCB_EXPOSE
            println("EXPOSE")
            XCB.xcb_poly_fill_rectangle(connection, window, g, UInt32(1), r)
            XCB.xcb_flush(connection)
        elseif e.response_type == XCB.XCB_KEY_PRESS
            # exit on keypress */
            done = true
        end
    end
    XCB.xcb_disconnect(connection)
end

test()
