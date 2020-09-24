
"""
Structures which contain a handle (opaque pointer) as primary data. Those structures are usually defined as mutable so that a finalizer can be registered. Any Handle structure is automatically converted to its handle data on `ccall`s, through `unsafe_convert`.
"""
abstract type Handle end

Base.unsafe_convert(::Type{<: Ptr}, handle::Handle) = handle.h

"""
Connection to the X server.
"""
mutable struct Connection <: Handle
    h
    function Connection(h)
        conn = new(h)
        Base.finalizer(xcb_disconnect, conn)
        conn
    end
end

"""
Connection setup handle and data.
"""
struct Setup <: Handle
    h
    value::xcb_setup_t
end

"""
Initialize a connection to the X server.
"""
function Connection(; display=nothing)
    display = isnothing(display) ? C_NULL : display
    connection = Connection(xcb_connect(display, C_NULL))
    check(connection)
end

@enum XCB_CONN_ERROR_CODE begin
    XCB_CONN_ERROR = 1
    XCB_CONN_CLOSED_EXT_NOTSUPPORTED = 2
    XCB_CONN_CLOSED_MEM_INSUFFICIENT = 3
    XCB_CONN_CLOSED_REQ_LEN_EXCEED = 4
    XCB_CONN_CLOSED_PARSE_ERR = 5
    XCB_CONN_CLOSED_INVALID_SCREEN = 6
    XCB_CONN_CLOSED_FDPASSING_FAILED = 7
end


function Base.show(io::IO, setup::xcb_setup_t)
    desc = ["Version"]
    vals = [VersionNumber(setup.protocol_major_version, setup.protocol_minor_version, setup.release_number)]
    println(io, "Setup")
    prettyprint(io, desc, vals)
end

function format_bignumber(number)
    number_str = string(number)
    join(map((i, x) -> (mod(i, 3) == 0 && i ≠ length(number_str) ? "," : "") * x, length(number_str):-1:1, number_str))
end

prettyprint(io, desc, vals) = (description = join.(zip(rpad.(desc, 20), vals), ": "); print(io, join("    " .* description, "\n")))

function Base.show(io::IO, screen::xcb_screen_t)
    desc = ["White pixel value", "Black pixel value", "Width", "Height"]
    vals = Any[format_bignumber(screen.white_pixel), format_bignumber(screen.black_pixel), "$(screen.width_in_pixels) pixels, $(screen.width_in_millimeters / 10) cm", "$(screen.height_in_pixels) pixels, $(screen.height_in_millimeters / 10) cm"]
    println(io, "Screen details")
    prettyprint(io, desc, vals)
end

"""
Check that the connection to the X server was successful. Throws an 
"""
function check(connection::Connection)
    code = xcb_connection_has_error(connection)
    code ≠ 0 && throw(ConnectionError("XCB connection not successful ($(XCB_CONN_ERROR_CODE(code)))", code))
    connection
end

function Setup(connection::Connection)
    stp = xcb_get_setup(connection)
    Setup(stp, unsafe_load(stp))
end
