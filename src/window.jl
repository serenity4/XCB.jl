"""
Window 
"""
mutable struct Window
    conn::Connection
    id
    width::Observable
    height::Observable
    parent_id
    visual_id
    class
    depth
    mask
    value_list
    window_title::Observable
    icon_title::Observable
    function Window(conn, parent_id, visual_id, mask, value_list; depth=XCB_COPY_FROM_PARENT, x=0, y=0, width=512, height=512, border_width=1, class=XCB_WINDOW_CLASS_INPUT_OUTPUT, window_title="", icon_title=nothing, map=true)
        id = XCB.xcb_generate_id(conn)
        icon_title = isnothing(icon_title) ? window_title : icon_title
        value_list_filled = zeros(UInt32, 32)
        setindex!.(Ref(value_list_filled), value_list, 1:length(value_list))
        window_title, icon_title = Observable.([window_title, icon_title])
        on(window_title) do val
            check_request(win.conn, xcb_change_property_checked(win.conn, XCB_PROP_MODE_REPLACE, win.id, XCB_ATOM_WM_NAME, XCB_ATOM_STRING, 8, length(val), pointer(val)), raise=true)
        end
        on(icon_title) do val
            val_c = val * "\0"
            check_request(win.conn, xcb_change_property_checked(win.conn, XCB_PROP_MODE_REPLACE, win.id, XCB_ATOM_WM_CLASS, XCB_ATOM_STRING, 8, length(val_c) * 2, pointer(val_c^2)), raise=true)
        end
        win = new(conn, id, Observable(width), Observable(height), parent_id, visual_id, class, depth, mask, value_list, window_title, icon_title)
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
        onany(win.width, win.height) do nw, nh
            check_request(win.conn, xcb_configure_window_checked(win.conn, win.id, XCB_CONFIG_WINDOW_WIDTH | XCB_CONFIG_WINDOW_HEIGHT, UInt32[nw, nh]))
        end
        Base.finalizer(x -> check_request(x.conn, xcb_destroy_window_checked(x.conn, x.id)), win)
        win.window_title[] = window_title[]
        win.icon_title[] = icon_title[]
        if map
            xcb_map_window(win.conn, win.id)
            flush(win.conn)
        end
        win
    end
end

function dimensions(win::Window)
    geometry_cookie = xcb_get_geometry(win.conn, win.id)
    geometry_reply = xcb_get_geometry_reply(win.conn, geometry_cookie, C_NULL)
    geometry_reply == C_NULL && throw(InvalidWindow())
    getproperty.(Ref(unsafe_load(geometry_reply)), (:width, :height))
end

Window(conn, screen, mask, value_list; kwargs...) = Window(conn, screen.root, screen.root_visual, mask, value_list; kwargs...)
