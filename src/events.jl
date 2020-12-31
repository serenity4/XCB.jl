event_type(::Union{Val{XCB_KEY_PRESS}, Val{XCB_KEY_RELEASE}}) = xcb_key_press_event_t
event_type(::Union{Val{XCB_BUTTON_PRESS}, Val{XCB_BUTTON_RELEASE}}) = xcb_button_press_event_t
event_type(::Union{Val{XCB_ENTER_NOTIFY}, Val{XCB_LEAVE_NOTIFY}}) = xcb_enter_notify_event_t
event_type(::Val{XCB_MOTION_NOTIFY}) = xcb_motion_notify_event_t
event_type(::Val{XCB_EXPOSE}) = xcb_expose_event_t
event_type(::Val{XCB_CLIENT_MESSAGE}) = xcb_client_message_event_t
event_type(::Val{XCB_CONFIGURE_NOTIFY}) = xcb_configure_notify_event_t
event_type(::Val{85}) = xcb.xcb_xkb_state_notify_event_t # very hacky, but response type 85 is emitted instead of XCB_XKB_STATE_NOTIFY...
event_type(::Val{XCB_KEYMAP_NOTIFY}) = xcb_keymap_notify_event_t
event_type(rt) = nothing

response_type(data) = Int(data.response_type % 128)

function unsafe_load_event(xge_ptr; warn_unknown=false)
    xge = unsafe_load(xge_ptr)
    rt = response_type(xge)
    et = event_type(Val(rt))
    if isnothing(et)
        warn_unknown && @warn "Unknown event $(xge.response_type) (modulo 128: $rt)"
        nothing
    else
        unsafe_load(convert(Ptr{et}, xge_ptr))
    end
end

window_id_field(event::xcb_button_press_event_t) = :event
window_id_field(event::xcb_key_press_event_t) = :event
window_id_field(event::xcb_enter_notify_event_t) = :event
window_id_field(event::xcb_motion_notify_event_t) = :event
window_id_field(event::xcb_expose_event_t) = :window
window_id_field(event::xcb_client_message_event_t) = :window
window_id_field(event::xcb_configure_notify_event_t) = :window

window_id(event) = getproperty(event, window_id_field(event))

location(event::xcb_button_press_event_t) = (event.event_x, event.event_y)
location(event::xcb_key_press_event_t) = (event.event_x, event.event_y)
location(event::xcb_enter_notify_event_t) = (event.event_x, event.event_y)
location(event::xcb_motion_notify_event_t) = (event.event_x, event.event_y)
location(event::xcb_expose_event_t) = (event.x, event.y)
location(event::xcb_configure_notify_event_t) = (event.x, event.y)

EventDetails(wh::XWindowHandler, win::XCBWindow, data::EventData, event, t) =
    EventDetails(data, Int.(location(event)), t, win, wh)
EventDetails(wh::XWindowHandler, win::XCBWindow, data::xcb_button_press_event_t, t) =
    EventDetails(wh, win, MouseEvent(data), data, t)

function EventDetails(wh::XWindowHandler, win::XCBWindow, data::xcb_key_press_event_t, t)
    keycode_symbol = key_name(wh.keymap, data.detail)
    key_symbol = KeySymbol(wh.keymap, data.detail)
    input_char = Char(wh.keymap, data.detail)
    event_type = response_type(data) == XCB_KEY_PRESS ? KeyPressed() : KeyReleased()
    EventDetails(wh, win, KeyEvent(keycode_symbol, key_symbol, input_char, KeyModifierState(data), event_type), data, t)
end

EventDetails(wh::XWindowHandler, win::XCBWindow, data::xcb_enter_notify_event_t, t) =
    EventDetails(wh, win, response_type(data) == XCB_ENTER_NOTIFY ? PointerEntersWindowEvent() : PointerLeavesWindowEvent(), data, t)
EventDetails(wh::XWindowHandler, win::XCBWindow, data::xcb_motion_notify_event_t, t) =
    EventDetails(wh, win, PointerMovesEvent(), data, t)
EventDetails(wh::XWindowHandler, win::XCBWindow, data::xcb_expose_event_t, t) =
    EventDetails(wh, win, ExposeEvent((data.width, data.height), data.count), data, t)
EventDetails(wh::XWindowHandler, win::XCBWindow, data::xcb_configure_notify_event_t, t) =
    EventDetails(wh, win, ResizeEvent((data.width, data.height)), data, t)

process_xevent(wh, event_loop, xge::Nothing, t; warn_unknown=false, kwargs...) = nothing

function process_xevent(wh::XWindowHandler, xge, t; warn_unknown=false, kwargs...)
    event = unsafe_load_event(xge; warn_unknown)
    if !isnothing(event) # unknown event
        win = get_window(wh, event)
        if event isa xcb_client_message_event_t
            ed_8 = Int.(event.data.data8)
            event_data32_1 = ed_8[1] + ed_8[2] * 2^8 + ed_8[3] * 2^16 + ed_8[4] *2^24
            event_data32_1 == win.delete_request && throw(CloseWindow(wh, win, ""))
        elseif event isa xcb_xkb_state_notify_event_t
            xkb_state_update_mask(wh.keymap.state, event.baseMods, event.latchedMods, event.lockedMods, event.baseGroup, event.latchedGroup, event.lockedGroup)
        elseif event isa xcb_keymap_notify_event_t
            wh.keymap = Keymap(wh.conn; setup_xkb=false)
        elseif !isnothing(win) # event happened on inexistant window
            details = EventDetails(wh, win, event, t)
            execute_callback(callbacks(wh, win), details; kwargs...)
        end
    end
end

function listen_for_events(wh::XWindowHandler, t0, next_event::Function; warn_unknown=false, on_iter_first=() -> nothing, on_iter_last=() -> nothing, kwargs...)
    while !isempty(wh.windows)
        try
            on_iter_first()
            xge = next_event(wh)
            t = time() - t0
            process_xevent(wh, xge, t; warn_unknown, kwargs...)
            on_iter_last()
        catch e
            if e isa CloseWindow || e isa InvalidWindow
                execute_callback(callbacks(wh, e.win), e)
            else
                rethrow(e)
                break
            end
        end
    end
end

"""
Run an `EventLoop` attached to a `XWindowHandler` instance.
"""
function Base.run(wh::XWindowHandler, ::Synchronous; warn_unknown=false, poll=false, kwargs...)
    t0 = time()
    next_event = poll ? poll_for_event : wait_for_event
    listen_for_events(wh, t0, next_event; warn_unknown, kwargs...)
end

function Base.run(wh::XWindowHandler, ::Asynchronous; warn_unknown=false, kwargs...)
    t0 = time()
    @async listen_for_events(wh, t0, poll_for_event; warn_unknown, kwargs...)
end
