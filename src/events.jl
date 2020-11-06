event_type(::Val{XCB_CONFIGURE_NOTIFY}) = xcb_configure_notify_event_t
event_type(::Union{Val{XCB_KEY_PRESS}, Val{XCB_KEY_RELEASE}}) = xcb_key_press_event_t
event_type(::Union{Val{XCB_ENTER_NOTIFY}, Val{XCB_LEAVE_NOTIFY}}) = xcb_enter_notify_event_t
event_type(::Union{Val{XCB_BUTTON_PRESS}, Val{XCB_BUTTON_RELEASE}}) = xcb_button_press_event_t
event_type(::Val{XCB_MOTION_NOTIFY}) = xcb_motion_notify_event_t
event_type(::Val{XCB_EXPOSE}) = xcb_expose_event_t
event_type(::Val{XCB_CLIENT_MESSAGE}) = xcb_client_message_event_t
event_type(::Val{85}) = xcb.xcb_xkb_state_notify_event_t # very hacky, but response type 85 is emitted instead of XCB_XKB_STATE_NOTIFY...
event_type(::Val{XCB_KEYMAP_NOTIFY}) = xcb_keymap_notify_event_t
event_type(rt) = nothing

function unsafe_load_event(xge_ptr; warn_unknown=false)
    xge = unsafe_load(xge_ptr)
    rt = xge.response_type % 128
    et = event_type(Val(Int(rt)))
    if isnothing(et)
        warn_unknown && @warn "Unknown event $(xge.response_type) (modulo 128: $rt)"
        nothing
    else
        unsafe_load(convert(Ptr{et}, xge_ptr))
    end
end

window_id_field(event::xcb_button_press_event_t) = :event
window_id_field(event::xcb_key_press_event_t) = :event
window_id_field(event::xcb_configure_notify_event_t) = :window
window_id_field(event::xcb_expose_event_t) = :window
window_id_field(event::xcb_enter_notify_event_t) = :event
window_id_field(event::xcb_motion_notify_event_t) = :event
window_id_field(event::xcb_client_message_event_t) = :window

window_id(event) = getproperty(event, window_id_field(event))

WindowAbstractions.Point2(event::xcb_button_press_event_t) = Point2{Int}(event.event_x, event.event_y)
WindowAbstractions.Point2(event::xcb_key_press_event_t) = Point2{Int}(event.event_x, event.event_y)
WindowAbstractions.Point2(event::xcb_configure_notify_event_t) = Point2{Int}(event.x, event.y)
WindowAbstractions.Point2(event::xcb_expose_event_t) = Point2{Int}(event.x, event.y)
WindowAbstractions.Point2(event::xcb_enter_notify_event_t) = Point2{Int}(event.event_x, event.event_y)
WindowAbstractions.Point2(event::xcb_motion_notify_event_t) = Point2{Int}(event.event_x, event.event_y)

EventDetails(handler::XWindowHandler, window::XCBWindow, data::EventData, event, t) = EventDetails(data, Point2(event), t, get_window_symbol(handler, window), window, handler)

EventDetails(handler::XWindowHandler, window::XCBWindow, data::xcb_button_press_event_t, t) = EventDetails(handler, window, MouseEvent(data), data, t)
EventDetails(handler::XWindowHandler, window::XCBWindow, data::xcb_key_press_event_t, t) = EventDetails(handler, window, KeyEvent(Symbol(name_from_keycode(handler.keymap, data.detail)), KeySymbol(handler.keymap, data.detail), Char(handler.keymap, data.detail), KeyModifierState(data), data.response_type == XCB_KEY_PRESS ? KeyPressed() : KeyReleased()), data, t)
EventDetails(handler::XWindowHandler, window::XCBWindow, data::xcb_configure_notify_event_t, t) = EventDetails(handler, window, ResizeEvent(Point2{Int}(data.width, data.height)), data, t)
EventDetails(handler::XWindowHandler, window::XCBWindow, data::xcb_expose_event_t, t) = EventDetails(handler, window, ExposeEvent(Point2{Int}(data.width, data.height), data.count), data, t)
EventDetails(handler::XWindowHandler, window::XCBWindow, data::xcb_enter_notify_event_t, t) = EventDetails(handler, window, data.response_type == XCB_ENTER_NOTIFY ? PointerEntersWindowEvent() : PointerLeavesWindowEvent(), data, t)
EventDetails(handler::XWindowHandler, window::XCBWindow, data::xcb_motion_notify_event_t, t) = EventDetails(handler, window, PointerMovesEvent(), data, t)