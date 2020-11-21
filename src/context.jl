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
        gc = new(conn, id, window, mask, value_list)
        @check :error xcb_create_gc(gc.conn, gc.id, gc.window.id, 0, C_NULL)
        change_graphics_context!(gc, mask, value_list)
        Base.finalizer(x -> @check(:error, xcb_free_gc(gc.conn, gc.id)), gc)
        gc
    end
end

function change_graphics_context!(gc::GraphicsContext, mask, value_list)
    list_filled = zeros(UInt32, 23)
    setindex!.(Ref(list_filled), value_list, 1:length(value_list))
    @check xcb_change_gc(gc.conn, gc.id, mask, list_filled)
    gc.mask = mask; gc.value_list = value_list
end
