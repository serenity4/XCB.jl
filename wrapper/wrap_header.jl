using Clang.cindex
using Clang.wrap_c
using Compat

XCB_INCLUDE = "/usr/include/xcb"

xcb_header = [joinpath(XCB_INCLUDE, "xcb.h")]

# Set up include paths
clang_includes = ASCIIString[]
push!(clang_includes, XCB_INCLUDE)

# Clang arguments
clang_extraargs = ["-v"]
# clang_extraargs = ["-D", "__STDC_LIMIT_MACROS", "-D", "__STDC_CONSTANT_MACROS"]

# Callback to test if a header should actually be wrapped (for exclusion)
function wrap_header(top_hdr::ASCIIString, cursor_header::ASCIIString)
    return startswith(dirname(cursor_header), XCB_INCLUDE)
end

lib_file(hdr::ASCIIString) = "xcb"
output_file(hdr::ASCIIString) = Pkg.dir("XCB", "src", "c_interface.jl")

function wrap_cursor(name::ASCIIString, cursor)
    exc = false
    exc |= contains(name, "XCB")
    return !exc
end

const wc = wrap_c.init(;
                        headers = xcb_header,
                        output_file = Pkg.dir("XCB", "src", "c_interface.jl"),
                        common_file = Pkg.dir("XCB", "src", "c_types.jl"),
                        clang_includes      = clang_includes,
                        clang_args          = clang_extraargs,
                        header_wrapped      = wrap_header,
                        header_library      = lib_file,
                        header_outputfile   = output_file,
                        cursor_wrapped      = wrap_cursor,
                        clang_diagnostics = true)

run(wc)
