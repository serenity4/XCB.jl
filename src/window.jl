"""
Window type used with the XCB API.
"""
mutable struct XCBWindow <: AbstractWindow
    conn::Connection
    id
    parent_id
    visual_id
    class
    depth
    gc
    delete_request
    function XCBWindow(conn, parent_id, visual_id; depth=XCB_COPY_FROM_PARENT, x=0, y=0, width=512, height=512, border_width=1, class=XCB_WINDOW_CLASS_INPUT_OUTPUT, window_title="", icon_title=nothing, attributes=[], values=[], map=true)
        id = XCB.xcb_generate_id(conn)
        icon_title = isnothing(icon_title) ? window_title : icon_title
        win = new(conn, id, parent_id, visual_id, class, depth, nothing, nothing)
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
            0,
            C_NULL,
        )

        set_attributes(win, [XCB_CW_EVENT_MASK], [base_event_mask])
        set_attributes(win, attributes, values)
        set_title(win, window_title)
        set_icon_title(win, icon_title)
        set_delete_request!(win) # to close window on X11 requests
        map && map_window(win)
        Base.finalizer(x -> @check(:error, xcb_destroy_window(x.conn, x.id)), win)
    end
end

Base.:(==)(x::XCBWindow, y::XCBWindow) = x.id == y.id

Base.hash(win::XCBWindow, h::UInt) = h + hash(win.id)

function set_attributes(win::XCBWindow, attributes, values)
    values = values[sortperm(attributes)]
    list = zeros(UInt32, 32)
    setindex!.(Ref(list), values, 1:length(values))
    @flush @check xcb_change_window_attributes(win.conn, win.id, reduce(|, attributes), list)
end

function set_delete_request!(win::XCBWindow)
    @unpack conn, id = win
    wm_protocols_cookie = xcb_intern_atom(conn, 1, length("WM_PROTOCOLS"), "WM_PROTOCOLS")
    wm_protocols_reply = xcb_intern_atom_reply(conn, wm_protocols_cookie, C_NULL)
    wm_delete_cookie = xcb_intern_atom(conn, 0, length("WM_DELETE_WINDOW"), "WM_DELETE_WINDOW")
    wm_delete_reply = xcb_intern_atom_reply(conn, wm_delete_cookie, C_NULL)
    @check xcb_change_property(conn, XCB_PROP_MODE_REPLACE, id, unsafe_load(wm_protocols_reply).atom, 4, 32, 1, Ref(unsafe_load(wm_delete_reply).atom))
    win.delete_request = unsafe_load(wm_delete_reply).atom
end

XCBWindow(conn, screen; kwargs...) = XCBWindow(conn, screen.root, screen.root_visual; kwargs...)

function extent(win::XCBWindow)
    geometry_cookie = xcb_get_geometry(win.conn, win.id)
    geometry_reply = xcb_get_geometry_reply(win.conn, geometry_cookie, C_NULL)
    geometry_reply == C_NULL && throw(InvalidWindow(win))
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

const base_event_mask = XCB_EVENT_MASK_SUBSTRUCTURE_REDIRECT | XCB_EVENT_MASK_KEYMAP_STATE | XCB_EVENT_MASK_STRUCTURE_NOTIFY

const event_bits_mapping = Dict(
    :on_key_pressed => XCB_EVENT_MASK_KEY_PRESS,
    :on_key_released => XCB_EVENT_MASK_KEY_RELEASE,
    :on_mouse_button_pressed => XCB_EVENT_MASK_BUTTON_PRESS,
    :on_mouse_button_released => XCB_EVENT_MASK_BUTTON_RELEASE,
    :on_pointer_enter => XCB_EVENT_MASK_ENTER_WINDOW,
    :on_pointer_move => XCB_EVENT_MASK_POINTER_MOTION | XCB_EVENT_MASK_BUTTON_MOTION | XCB_EVENT_MASK_BUTTON_PRESS,
    :on_pointer_leave => XCB_EVENT_MASK_LEAVE_WINDOW,
    :on_expose => XCB_EVENT_MASK_EXPOSURE,
    :on_resize => XCB_EVENT_MASK_STRUCTURE_NOTIFY,
)

event_bit(prop::Symbol, callbacks::WindowCallbacks) = !isnothing(getproperty(callbacks, prop)) * UInt32(event_bits_mapping[prop])
event_bits(callbacks::WindowCallbacks) = reduce(|, (event_bit(prop, callbacks) for prop ∈ keys(event_bits_mapping)))

function set_event_mask(win::XCBWindow, callbacks::WindowCallbacks)
    mask = base_event_mask | event_bits(callbacks)
    set_attributes(win, [XCB_CW_EVENT_MASK], [mask])
end
