"""
XCBWindow 
"""
mutable struct XCBWindow <: AbstractWindow
    conn::Connection
    id
    parent_id
    visual_id
    class
    depth
    mask
    value_list
    function XCBWindow(conn, parent_id, visual_id, mask, value_list; depth=XCB_COPY_FROM_PARENT, x=0, y=0, width=512, height=512, border_width=1, class=XCB_WINDOW_CLASS_INPUT_OUTPUT, window_title="", icon_title=nothing, map=true)
        id = XCB.xcb_generate_id(conn)
        icon_title = isnothing(icon_title) ? window_title : icon_title
        value_list_filled = zeros(UInt32, 32)
        setindex!.(Ref(value_list_filled), value_list, 1:length(value_list))
        win = new(conn, id, parent_id, visual_id, class, depth, mask, value_list)
        xcb_create_window(
            win.conn,
            depth,
            win.id,
            parent_id,
            x,
            y,
            width,
            height,
            border_width,
            class,
            visual_id,
            mask,
            value_list,
        )
        set_title(win, window_title)
        set_icon_title(win, icon_title)
        Base.finalizer(x -> @check(xcb_destroy_window(x.conn, x.id)), win)
        map && map_window(win)
        win
    end
end
XCBWindow(conn, screen, mask, value_list; kwargs...) = XCBWindow(conn, screen.root, screen.root_visual, mask, value_list; kwargs...)

function extent(win::XCBWindow)
    geometry_cookie = xcb_get_geometry(win.conn, win.id)
    geometry_reply = xcb_get_geometry_reply(win.conn, geometry_cookie, C_NULL)
    geometry_reply == C_NULL && throw(InvalidWindow(window))
    getproperty.(Ref(unsafe_load(geometry_reply)), (:width, :height))
end

function set_extent(win::XCBWindow, extent)
    @flush @check xcb_configure_window(win.conn, win.id, XCB_CONFIG_WINDOW_WIDTH | XCB_CONFIG_WINDOW_HEIGHT, UInt32[extent...])
end

map_window(win::XCBWindow) = @flush @check xcb_map_window(win.conn, win.id)

unmap_window(win::XCBWindow) = @flush @check xcb_unmap_window(win.conn, win.id)

function set_title(win::XCBWindow, title)
    GC.@preserve title begin
        @flush @check xcb_change_property(win.conn, XCB_PROP_MODE_REPLACE, win.id, XCB_ATOM_WM_NAME, XCB_ATOM_STRING, 8, length(title), pointer(title))
    end
end

function set_icon_title(win::XCBWindow, title)
    title_c = title * "\0"
    @flush @check xcb_change_property(win.conn, XCB_PROP_MODE_REPLACE, win.id, XCB_ATOM_WM_CLASS, XCB_ATOM_STRING, 8, length(title_c) * 2, pointer(title_c^2))
end

terminate(win::XCBWindow) = finalize(win)