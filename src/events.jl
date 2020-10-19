"""
Run an event loop on the target `window`, calling `process_event` at each event, with an optional graphics context `ctx` and resize callback `resize_callback`.

`process_event` will be given the window, graphics context, event and event time (from the beginning of `run_window`) upon new events. However, only the events that are registered in the window configuration will be signaled by the X server: for example, to receive key press events, the window must hold the `XCB_EVENT_MASK_KEY_PRESS` flag in its value list. Additional custom keyword arguments can be passed along to `process_event` through `states...`.

The resize callback will be provided the window, along with new width and height values, every time the window's dimensions change. Since a resize event is an event, it must have been registered, with the `XCB_EVENT_MASK_STRUCTURE_NOTIFY` flag.

Both window and connection are properly finalized upon termination, if `finalize` is true. Termination can be caused through a `CloseWindow` exception, which indicates a successful termination, or upon any other error which will be propagated.
"""
# function run_window(window, process_event; finalize=true, ctx=nothing, resize_callback=(win, x, y) -> (), states...)
#     connection = window.conn
#     try
#         t0 = time()
#         while true
#             event = xcb_wait_for_event(connection)
#             e_generic = unsafe_load(event)
#             if e_generic.response_type == XCB_CONFIGURE_NOTIFY
#                 cfg_event = unsafe_load(convert(Ptr{xcb_configure_notify_event_t}, event))
#                 width, height = dimensions(window)
#                 if (width, height) ≠ (window.width[], window.height[])
#                     resize_callback(window, width, height)
#                     window.width.val = width
#                     window.height.val = height
#                 end
#             end
#             process_event(window, ctx, event, time() - t0; states...)
#         end
#     catch e
#         if e isa CloseWindow
#             !isempty(e.msg) ? @info(e.msg) : nothing
#         else
#             @error(exception = e)
#             Base.show_backtrace(stderr, catch_backtrace())
#         end
#     finally
#         Base.finalize.([window, connection])
#     end
# end

function run_window(window, process_event; ctx=nothing, resize_callback=(win, x, y) -> (), finalize_window=true, finalize_connection=true, wait_until_finished=true, states...)
    obs = window_event_observable(window; finalize_window, finalize_connection, wait_until_finished)
    function wrap_process_event(window, ctx, event, t; states...)
        e_generic = unsafe_load(event)
        if e_generic.response_type == XCB_CONFIGURE_NOTIFY
            cfg_event = unsafe_load(convert(Ptr{xcb_configure_notify_event_t}, event))
            width, height = dimensions(window)
            if (width, height) ≠ (window.width[], window.height[])
                resize_callback(window, width, height)
                window.width.val = width
                window.height.val = height
            end
        end
        process_event(window, ctx, event, time() - t0; states...)
    end

    t0 = time()
    subscribe!(obs, lambda(
        on_next = (event) -> wrap_process_event(window, ctx, event, time() - t0; states...),
        on_error = rethrow,
        on_complete = () -> nothing,
    ))
end

function window_event_observable(window::Window; finalize_window=true, finalize_connection=true, wait_until_finished=true)
    connection = window.conn
    make(Ptr{xcb_generic_event_t}) do actor
        task = @async begin
            try
                while true
                    event = xcb_wait_for_event(connection)
                    next!(actor, event)
                end
            catch e
                if e isa CloseWindow
                    !isempty(e.msg) ? @info(e.msg) : nothing
                    complete!(actor)
                else
                    error!(actor, e)
                end
            finally
                finalize_window && finalize(window)
                finalize_connection && finalize(connection)
            end
        end
        wait_until_finished && wait(task)
    end
end