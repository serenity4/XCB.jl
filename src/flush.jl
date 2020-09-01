function check_flush(code)
    if code <= 0
        error("Error during flush ($code)")
    end
end

flush(connection::Connection) = check_flush(XCB.xcb_flush(connection.h))