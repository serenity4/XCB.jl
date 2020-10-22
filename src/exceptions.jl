struct ConnectionError <: Exception
    msg
    code
end

struct RequestError <: Exception
    msg
end