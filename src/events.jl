@with_kw struct CloseWindow <: Exception
    msg::AbstractString = ""
end

function run_window(window, ctx, process_event; states...)
    connection = window.conn
    try
        t0 = time()
        while true
            event = xcb_wait_for_event(connection)
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