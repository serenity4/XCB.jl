"""
The X Server reported a connection error.
"""
struct ConnectionError <: Exception
    msg
    code
end

"""
A request to the X Server returned with an error.
"""
struct RequestError <: Exception
    msg
end

"""
Error when flushing a connection to the X Server.
"""
struct FlushError <: Exception
    code
end
