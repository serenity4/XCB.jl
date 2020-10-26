module Libxkb

import xkbcommon_jll

using CEnum

libxkbcommon = xkbcommon_jll.libxkbcommon

const FILE=Ptr{Cvoid}

include("xkb_common.jl")
include("xkb_api.jl")

# export everything
foreach(names(@__MODULE__, all=true)) do s
    if startswith(string(s), r"(?:X|XKB|xkb)")
        @eval export $s
    end
end

end