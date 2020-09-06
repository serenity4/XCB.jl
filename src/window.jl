mutable struct Window
    conn::Connection
    id
    parent_id
    visual_id
    class
    depth
    mask
    value_list
    window_title::Observable
    icon_title::Observable
    function Window(conn, parent_id, visual_id, mask, value_list; depth=XCB_COPY_FROM_PARENT, x=0, y=0, width=512, height=512, border_width=1, class=XCB_WINDOW_CLASS_INPUT_OUTPUT, window_title="", icon_title=nothing)
        id = XCB.xcb_generate_id(conn.h)
        icon_title = isnothing(icon_title) ? window_title : icon_title
        value_list_filled = zeros(UInt32, 32)
        setindex!.(Ref(value_list_filled), value_list, 1:length(value_list))
        window_title, icon_title = Observable.([window_title, icon_title])
        on(window_title) do val
            check_request(win.conn, xcb_change_property_checked(win.conn.h, XCB_PROP_MODE_REPLACE, win.id, XCB_ATOM_WM_NAME, XCB_ATOM_STRING, 8, length(val), pointer(val)), raise=true)
        end
        on(icon_title) do val
            val_c = val * "\0"
            check_request(win.conn, xcb_change_property_checked(win.conn.h, XCB_PROP_MODE_REPLACE, win.id, XCB_ATOM_WM_CLASS, XCB_ATOM_STRING, 8, length(val_c) * 2, pointer(val_c^2)), raise=true)
        end
        win = new(conn, id, parent_id, visual_id, class, depth, mask, value_list, window_title, icon_title)
        xcb_create_window(
            win.conn.h,
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
        Base.finalizer(x -> xcb_destroy_window(win.conn.h, x.id), win)
        xcb_change_window_attributes
        win.window_title[] = window_title[]
        win.icon_title[] = icon_title[]
        win
    end
end

Window(conn, screen, mask, value_list; kwargs...) = Window(conn, screen.root, screen.root_visual, mask, value_list; kwargs...)
