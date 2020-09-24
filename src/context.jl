"""
Graphics context attached to a window. Used to register drawing commands on the window surface.
"""
mutable struct GraphicsContext
    conn
    id
    window
    mask
    value_list
    function GraphicsContext(conn, window, mask, value_list)
        id = XCB.xcb_generate_id(conn)
        mask = Observable(mask)
        value_list = Observable(value_list)
        gc = new(conn, id, window, mask, value_list)
        onany(gc.mask, gc.value_list) do mask, list
            list_filled = zeros(UInt32, 23)
            setindex!.(Ref(list_filled), list, 1:length(list))
            check_request(gc.conn, xcb_change_gc_checked(gc.conn, gc.id, mask, list_filled))
        end
        check_request(gc.conn, xcb_create_gc_checked(gc.conn, gc.id, gc.window.id, 0, C_NULL))
        Observables.notify!(gc.value_list)
        Base.finalizer(x -> check_request(gc.conn, xcb_free_gc_checked(gc.conn, gc.id)), gc)
        gc
    end
end