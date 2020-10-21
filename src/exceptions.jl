"""
Signals that the window must be closed.
"""
@with_kw struct CloseWindow <: Exception
    msg::AbstractString = ""
end

struct ConnectionError <: Exception
    msg
    code
end

struct RequestError <: Exception
    msg
end

struct InvalidWindow <: Exception end