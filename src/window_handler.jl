struct XWindowHandler <: AbstractWindowHandler
    conn::Connection
    windows::Dict{Symbol, XCBWindow}
end
XWindowHandler(conn, windows::Vector{XCBWindow}) = XWindowHandler(conn, Dict(Symbol.("window_" .* string.(1:length(windows))) .=> windows))

function poll_for_event(handler::XWindowHandler, t0)
    event = xcb_poll_for_event(handler.conn)
    event == C_NULL ? nothing : event
end

function wait_for_event(handler::XWindowHandler, t0)
    event = xcb_wait_for_event(handler.conn)
    event == C_NULL ? nothing : event
end

function terminate_window!(handler::XWindowHandler, win::XCBWindow)
    delete!(handler.windows, get_window_symbol(handler, win))
    finalize(win)
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
EventDetails(handler::XWindowHandler, window::XCBWindow, data::xcb_key_press_event_t, t) = EventDetails(handler, window, KeyEvent(KeyCombination(handler.conn, data), data.response_type == XCB_KEY_PRESS ? KeyPressed() : KeyReleased()), data, t)
EventDetails(handler::XWindowHandler, window::XCBWindow, data::xcb_configure_notify_event_t, t) = EventDetails(handler, window, ResizeEvent(Point2{Int}(data.width, data.height)), data, t)
EventDetails(handler::XWindowHandler, window::XCBWindow, data::xcb_expose_event_t, t) = EventDetails(handler, window, ExposeEvent(Point2{Int}(data.width, data.height), data.count), data, t)
EventDetails(handler::XWindowHandler, window::XCBWindow, data::xcb_enter_notify_event_t, t) = EventDetails(handler, window, data.response_type == XCB_ENTER_NOTIFY ? PointerEntersWindowEvent() : PointerLeavesWindowEvent(), data, t)
EventDetails(handler::XWindowHandler, window::XCBWindow, data::xcb_motion_notify_event_t, t) = EventDetails(handler, window, PointerMovesEvent(), data, t)

function get_window(handler::XWindowHandler, id::Integer)
    windows = collect(values(handler.windows))
    index = findfirst(x -> id == x.id, windows)
    isnothing(index) && return nothing
    windows[index]
end

get_window(handler::XWindowHandler, event) = get_window(handler, window_id(event))
get_window(handler::XWindowHandler, id::Symbol) = handler.windows[id]
get_window_symbol(handler::XWindowHandler, window::XCBWindow) = collect(keys(handler.windows))[findfirst(values(handler.windows) .== window)]