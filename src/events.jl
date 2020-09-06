@with_kw struct CloseWindow <: Exception
    msg::AbstractString = ""
end

function run_window(window, process_event)
    connection = window.conn
    try
        while true
            event = xcb_wait_for_event(connection.h)
            process_event(connection, window, event)
        end
    catch e
        if e isa CloseWindow
            !isempty(e.msg) ? @info(e.msg) : nothing
        else
            @error(exception=e)
            Base.show_backtrace(stderr, catch_backtrace())
        end
    finally
        Base.finalize.([window, connection])
    end
end