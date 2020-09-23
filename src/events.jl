@with_kw struct CloseWindow <: Exception
    msg::AbstractString = ""
end

function run_window(window, ctx, process_event; resize_callback, states...)
    connection = window.conn
    try
        t0 = time()
        while true
            event = xcb_wait_for_event(connection)
            e_generic = unsafe_load(event)
            if e_generic.response_type == XCB_CONFIGURE_NOTIFY
                cfg_event = unsafe_load(convert(Ptr{xcb_configure_notify_event_t}, event))
                width, height = dimensions(window)
                if (width, height) ≠ (window.width, window.height)
                    resize_callback(window, width, height)
                    @pack! window = width, height
                end
            end
            process_event(connection, window, ctx, event, time() - t0; states...)
        end
    catch e
        if e isa CloseWindow
            !isempty(e.msg) ? @info(e.msg) : nothing
        else
            @error(exception = e)
            Base.show_backtrace(stderr, catch_backtrace())
        end
    finally
        Base.finalize.([window, connection])
    end
end