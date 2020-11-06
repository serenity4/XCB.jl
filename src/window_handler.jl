mutable struct XWindowHandler <: AbstractWindowHandler
    conn::Connection
    windows::Dict{Symbol, XCBWindow}
    keymap::Keymap
end
XWindowHandler(conn::Connection, windows::Dict{Symbol, XCBWindow}) = XWindowHandler(conn, windows, Keymap(conn))
XWindowHandler(conn::Connection, windows::Vector{XCBWindow}) = XWindowHandler(conn, Dict(Symbol.("window_" .* string.(1:length(windows))) .=> windows))

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

function get_window(handler::XWindowHandler, id::Integer)
    windows = collect(values(handler.windows))
    index = findfirst(x -> id == x.id, windows)
    isnothing(index) && return nothing
    windows[index]
end

get_window(handler::XWindowHandler, event::xcb_xkb_state_notify_event_t) = nothing
get_window(handler::XWindowHandler, event::xcb_keymap_notify_event_t) = nothing
get_window(handler::XWindowHandler, event) = get_window(handler, window_id(event))
get_window(handler::XWindowHandler, id::Symbol) = handler.windows[id]
get_window_symbol(handler::XWindowHandler, window::XCBWindow) = collect(keys(handler.windows))[findfirst(values(handler.windows) .== window)]