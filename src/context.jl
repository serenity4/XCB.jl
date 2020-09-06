mutable struct GraphicsContext
    conn
    id
    window
    mask
    value_list
    _leader
    function GraphicsContext(conn, window, mask, value_list)
        id = XCB.xcb_generate_id(conn.h)
        mask = Observable(mask)
        value_list = Observable(value_list)
        leader = Observable((mask, value_list))
        bind_observables!(leader, ((mask, value_list))) do (mask, list)
            list_filled = zeros(UInt32, 23)
            setindex!.(Ref(list_filled), list[], 1:length(list[]))
            check_request(conn, xcb_change_gc_checked(conn.h, id, mask[], pointer(list_filled)))
        end
        gc = new(conn, id, window, mask, value_list, leader)
        check_request(gc.conn, xcb_create_gc_checked(gc.conn.h, gc.id, gc.window.id, 0, C_NULL))
        trigger(value_list)
        Base.finalizer(x -> check_request(gc.conn, xcb_free_gc_checked(conn.h, gc.id)), gc)
        gc
    end
end