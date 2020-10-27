module Libxkb

import xkbcommon_jll

using CEnum

const libxkbcommon = xkbcommon_jll.libxkbcommon
const libxkbcommon_x11 = first(filter( x -> occursin("libxkbcommon-x11", basename(x)), readdir(joinpath(xkbcommon_jll.artifact_dir, "lib"), join=true)))

const FILE=Ptr{Cvoid}

include("xcb_common.jl")
include("xkb_common.jl")
include("xkb_api.jl")

# export everything
foreach(names(@__MODULE__, all=true)) do s
    if startswith(string(s), r"(?:X|XKB|xkb)") && !startswith(string(s), r"(?:XCB|xcb)")
        @eval export $s
    end
end

end