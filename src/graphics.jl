"""
Graphics context attached to a window. Used to register drawing commands on the window surface.
"""
mutable struct GraphicsContext
    conn
    id
    function GraphicsContext(conn::Connection, win::XCBWindow; attributes=[], values=[])
        id = XCB.xcb_generate_id(conn)
        gc = new(conn, id)
        @check :error xcb_create_gc(gc.conn, gc.id, win.id, 0, C_NULL)
        set_attributes(gc, attributes, values)
        Base.finalizer(x -> @check(:error, xcb_free_gc(gc.conn, gc.id)), gc)
    end
end

function set_attributes(gc::GraphicsContext, attributes, values)
    values = values[sortperm(collect(attributes))]
    list = zeros(UInt32, 32)
    setindex!.(Ref(list), values, 1:length(values))
    @flush @check xcb_change_gc(gc.conn, gc.id, reduce(|, attributes), list)
end

attach_graphics_context!(win::XCBWindow, gc::GraphicsContext) = setproperty!(win, :gc, gc)
