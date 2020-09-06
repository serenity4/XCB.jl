struct RequestError <: Exception
    msg
end

function check_request(conn, request; raise=true)
    errcode_ptr = xcb_request_check(conn.h, request)
    if errcode_ptr != C_NULL
        errcode = Base.unsafe_load(errcode_ptr).error_code
        raise ? throw(RequestError("Request unsuccessful: (error code " * string(errcode) * ")")) : @warn("Error " * string(errcode) * " thrown during request")
    end
end