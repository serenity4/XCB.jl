function check_flush(code)
    if code <= 0
        error("Error during flush ($code)")
    end
end

Base.flush(connection::Connection) = check_flush(xcb_flush(connection))