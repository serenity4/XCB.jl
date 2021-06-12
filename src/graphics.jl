"""
Graphics context attached to a window. Used to register drawing commands on the window surface.
"""
mutable struct GraphicsContext
    conn::Connection
    id::xcb_window_t
    function GraphicsContext(conn::Connection, win_id::xcb_window_t)
        id = XCB.xcb_generate_id(conn)
        gc = new(conn, id)
        @check :error xcb_create_gc(gc.conn, gc.id, win_id, 0, C_NULL)
        Base.finalizer(x -> @check(:error, xcb_free_gc(gc.conn, gc.id)), gc)
    end
end

function GraphicsContext(conn, win_id; attributes=[], values=[])
    gc = GraphicsContext(convert(Connection, conn), convert(xcb_window_t, win_id))
    set_attributes(gc, attributes, values)
    gc
end

function set_attributes(gc::GraphicsContext, attributes, values)
    values = values[sortperm(collect(attributes))]
    list = zeros(UInt32, 32)
    setindex!.(Ref(list), values, 1:length(values))
    @flush @check xcb_change_gc(gc.conn, gc.id, reduce(|, attributes), list)
end
