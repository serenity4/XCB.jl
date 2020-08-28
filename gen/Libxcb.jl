module Libxcb

import Xorg_libxcb_jll
import Libdl

const xcb = Libdl.find_library(Xorg_libxcb_jll.libxcb)

using CEnum

const Ctm = Base.Libc.TmStruct
const Ctime_t = UInt
const Cclock_t = UInt

include("xcb_common.jl")
include("xcb_api.jl")

export Ctm, Ctime_t, Cclock_t

include(joinpath(@__DIR__, "..", "gen", "xcb_common.jl"))
include(joinpath(@__DIR__, "..", "gen", "xcb_api.jl"))

# export everything
foreach(names(@__MODULE__, all=true)) do s
   if startswith(string(s), r"(?:X|XCB|xcb)")
       @eval export $s
   end
end

end # module
