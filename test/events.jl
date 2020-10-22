using XCB: xcb_configure_notify_event_t, xcb_generic_event_t, XCB_CONFIGURE_NOTIFY, xcb_wait_for_event, xcb_poll_for_event

"""
Run an event loop on the target `window`, calling `event_callback` at each event, with an optional graphics context `ctx` and resize callback `resize_callback`.

`event_callback` will be given the window, graphics context, event and event time (from the beginning of `run_window`) upon new events. However, only the events that are registered in the window configuration will be signaled by the X server: for example, to receive key press events, the window must hold the `XCB_EVENT_MASK_KEY_PRESS` flag in its mask. Additional custom keyword arguments are automatically passed to `event_callback`.

The resize callback will be provided the window, along with new width and height values, every time the window's dimensions change. Since a resize event is an event, it must have been registered, with the `XCB_EVENT_MASK_STRUCTURE_NOTIFY` flag.

At some point, the window may become invalid, but the X server has no way of communicating it. Therefore, it is necessary to mitigate invalid requests or events which may oringinate from an invalid window. In synchronous mode, if the event is `C_NULL`, then the window is assumed invalid.

By default, the event loop is run synchronously; however, asynchronous support is possible by setting `async` to true. While in asynchronous mode, the execution regularly polls for window events, sleeping `sleep_time` seconds between each poll (or not sleeping at all if `sleep_time` is zero); in synchronous mode, the execution waits for events, causing the CPU to be idle between events (but not allowing task switch).

The window is properly finalized upon termination. Termination can be caused through a `CloseWindow` exception, which indicates a successful termination, or upon any other error which will be safely wrapped and propagated.
"""
function run_window(window, event_callback; ctx=nothing, resize_callback=(win, x, y) -> (), async=false, sleep_time=1e-4, kwargs...)
    function wrap_process_event(window, ctx, event, t; kwargs...)
        event == C_NULL && throw(InvalidWindow(window))
        e_generic = unsafe_load(event)
        if e_generic.response_type == XCB_CONFIGURE_NOTIFY
            cne = unsafe_load(convert(Ptr{xcb_configure_notify_event_t}, event))
            resize_callback(window, cne.width, cne.height)
        end
        event_callback(window, ctx, event, time() - t0; kwargs...)
    end
    obs = window_event_observable(window; async, sleep_time)
    t0 = time()
    subscribe!(
        obs,
        lambda(
            on_next = event -> wrap_process_event(window, ctx, event, time() - t0; kwargs...),
            on_error = e -> begin terminate(window); rethrow(e) end,
            on_complete = () -> terminate(window),
        )
    )
end

window_next!(actor, connection::Connection) = next!(actor, xcb_wait_for_event(connection))
function window_next!(actor, connection::Connection, sleep_time)
    event = xcb_poll_for_event(connection)
    event ≠ C_NULL && next!(actor, event)
    sleep_time == 0 ? yield() : sleep(sleep_time) # allow task switching between events
end

"""
Create an observable which emits XCB events, either synchronously or asynchronously.
"""
function window_event_observable(window::XCBWindow; async=false, sleep_time=1e-4)
    connection = window.conn
    _window_next! = async ? actor -> window_next!(actor, connection, sleep_time) : actor -> window_next!(actor, connection)
    make(Ptr{xcb_generic_event_t}) do actor
        task = @async begin
            try
                while true; _window_next!(actor); end
            catch e
                if e isa CloseWindow
                    !isempty(e.msg) ? @info(e.msg) : nothing
                    complete!(actor)
                elseif e isa InvalidWindow
                    @error("Invalid window state, destroying window")
                    complete!(actor)
                else
                    error!(actor, e)
                end
            end
        end
        !async && wait(task)
    end
end