using Clang
import Xorg_libxcb_jll
import Xorg_xcb_util_keysyms_jll
import xkbcommon_jll

xcb_include_dir = joinpath(Xorg_libxcb_jll.artifact_dir, "include", "xcb")
xcb_util_keysims_dir = joinpath(Xorg_xcb_util_keysyms_jll.artifact_dir, "include", "xcb")
xkb_include_dir = joinpath(xkbcommon_jll.artifact_dir, "include", "xkbcommon")
xkb_headers = joinpath.(Ref(xkb_include_dir), ["xkbcommon.h", "xkbcommon-x11.h"])
xcb_headers = [joinpath.(Ref(xcb_include_dir), ["xkb.h"])..., joinpath(xcb_util_keysims_dir, "xcb_keysyms.h")]

# Set up include paths
clang_xcb_includes = [xcb_include_dir, xcb_util_keysims_dir]
clang_xkb_includes = [xkb_include_dir]

# Clang arguments
clang_extraargs = ["-v"]

# Test if a header should be wrapped
function wrap_header(top_hdr, cursor_header)
    any(startswith.(Ref(dirname(cursor_header)), [xcb_include_dir, xcb_util_keysims_dir, xkb_include_dir]))
end

wc_xcb = init(;
                        headers=xcb_headers,
                        output_file=joinpath(@__DIR__, "..", "gen", "xcb_api.jl"),
                        common_file=joinpath(@__DIR__, "..", "gen", "xcb_common.jl"),
                        clang_includes=clang_xcb_includes,
                        clang_args=clang_extraargs,
                        header_wrapped=wrap_header,
                        header_library=x -> basename(x) == "xcb_keysyms.h" ? "libxcb_keysyms" : basename(x) == "xkb.h" ? "libxcb_xkb" : "libxcb",
                        clang_diagnostics=true,
                        )
run(wc_xcb)

wc_xkb = init(;
                        headers=xkb_headers,
                        output_file=joinpath(@__DIR__, "..", "gen", "xkb_api.jl"),
                        common_file=joinpath(@__DIR__, "..", "gen", "xkb_common.jl"),
                        clang_includes=clang_xkb_includes,
                        clang_args=clang_extraargs,
                        header_wrapped=wrap_header,
                        header_library=x -> endswith(x, "xkbcommon-x11.h") ? "libxkbcommon_x11" : "libxkbcommon",
                        clang_diagnostics=true,
                        )
run(wc_xkb)