using Clang
import Xorg_libxcb_jll

xcb_include_dir = joinpath(Xorg_libxcb_jll.artifact_dir, "include", "xcb")
xcb_header =  [joinpath(xcb_include_dir, "xcb.h")]


# Set up include paths
clang_includes = xcb_header

# Clang arguments
clang_extraargs = ["-v"]
# clang_extraargs = ["-D", "__STDC_LIMIT_MACROS", "-D", "__STDC_CONSTANT_MACROS"]

# Callback to test if a header should actually be wrapped (for exclusion)
function wrap_header(top_hdr, cursor_header)
    return startswith(dirname(cursor_header), xcb_include_dir)
end

function wrap_cursor(name, cursor)
    return true
end

const wc = init(;
                        headers = xcb_header,
                        output_file = joinpath(@__DIR__, "..", "gen", "xcb_api.jl"),
                        common_file = joinpath(@__DIR__, "..", "gen", "xcb_common.jl"),
                        clang_includes      = clang_includes,
                        clang_args          = clang_extraargs,
                        header_wrapped      = wrap_header,
                        header_library      = x -> "xcb",
                        cursor_wrapped      = wrap_cursor,
                        clang_diagnostics = true)

run(wc)
