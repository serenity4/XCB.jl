mutable struct XWindowHandler <: AbstractWindowHandler
    conn::Connection
    windows::Vector{XCBWindow}
    keymap::Keymap
    callbacks::Dict{XCBWindow, WindowCallbacks}
end

XWindowHandler(conn::Connection, windows::Vector{XCBWindow}) = XWindowHandler(conn, windows, Keymap(conn), Dict())

function XWindowHandler(conn::Connection, windows::Vector{XCBWindow}, callbacks::Dict{XCBWindow, WindowCallbacks})
    wh = XWindowHandler(conn, windows, Keymap(conn))
    for (win, cb) ∈ callbacks
        set_callbacks!(wh, win, cb)
    end
end

function set_callbacks!(wh::XWindowHandler, win::XCBWindow, callbacks::WindowCallbacks)
    wh.callbacks[win] = callbacks
    set_event_mask(win, callbacks)
end

function poll_for_event(wh::XWindowHandler)
    while true
        event = xcb_poll_for_event(wh.conn)
        event ≠ C_NULL && return event
        yield()
    end
end

function wait_for_event(wh::XWindowHandler)
    event = xcb_wait_for_event(wh.conn)
    event == C_NULL ? nothing : event
end

function terminate_window!(wh::XWindowHandler, win::XCBWindow)
    deleteat!(wh.windows, window_index(wh, win))
    finalize(win)
end

window_index(wh::XWindowHandler, win::XCBWindow) = findfirst(x -> x.id == win.id, wh.windows)
window_index(wh::XWindowHandler, id::Integer) = findfirst(x -> x.id == id, wh.windows)

get_window(wh::XWindowHandler, id::Integer) = wh.windows[window_index(wh, id)]
get_window(wh::XWindowHandler, event::xcb_xkb_state_notify_event_t) = nothing
get_window(wh::XWindowHandler, event::xcb_keymap_notify_event_t) = nothing
get_window(wh::XWindowHandler, event) = get_window(wh, window_id(event))

callbacks(wh::XWindowHandler, win::XCBWindow) = get(wh.callbacks, win, WindowCallbacks())

"""
Extract a keycode from an key event.
"""
keycode(wh::XWindowHandler, details::EventDetails{<:KeyEvent}) = keycode(wh.keymap, details.data.key_name)

"""
Return condensed information regarding a keystroke as a `String`. Includes key name, keycode, character input and key symbol.
"""
keystroke_info(wh::XWindowHandler, event_details::EventDetails) = keystroke_info(wh.keymap, event_details)
