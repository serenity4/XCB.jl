using Clang
import Xorg_libxcb_jll
import Xorg_xcb_util_keysyms_jll

xcb_include_dir = joinpath(Xorg_libxcb_jll.artifact_dir, "include", "xcb")
xcb_util_keysims_dir = joinpath(Xorg_xcb_util_keysyms_jll.artifact_dir, "include", "xcb")
xcb_header =  [joinpath(xcb_include_dir, "xcb.h"), joinpath(xcb_util_keysims_dir, "xcb_keysyms.h")]


# Set up include paths
clang_includes = xcb_header

# Clang arguments
clang_extraargs = ["-v"]
# clang_extraargs = ["-D", "__STDC_LIMIT_MACROS", "-D", "__STDC_CONSTANT_MACROS"]

# Callback to test if a header should actually be wrapped (for exclusion)
function wrap_header(top_hdr, cursor_header)
    return any(startswith.(Ref(dirname(cursor_header)), [xcb_include_dir, xcb_util_keysims_dir]))
end

function wrap_cursor(name, cursor)
    return true
end

const wc = init(;
                        headers=xcb_header,
                        output_file=joinpath(@__DIR__, "..", "gen", "xcb_api.jl"),
                        common_file=joinpath(@__DIR__, "..", "gen", "xcb_common.jl"),
                        clang_includes=clang_includes,
                        clang_args=clang_extraargs,
                        header_wrapped=wrap_header,
                        header_library=x -> "libxcb",
                        cursor_wrapped=wrap_cursor,
                        clang_diagnostics=true)

run(wc)
