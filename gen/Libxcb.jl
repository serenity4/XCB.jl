module Libxcb

import Xorg_libxcb_jll
import Xorg_xcb_util_keysyms_jll
import Libdl

const libxcb = Libdl.find_library(Xorg_libxcb_jll.libxcb)
const libxcb_keysyms = Libdl.find_library(Xorg_xcb_util_keysyms_jll.libxcb_keysyms)

using CEnum

const Ctm = Base.Libc.TmStruct
const Ctime_t = UInt
const Cclock_t = UInt

include("xcb_common.jl")
include("xcb_api.jl")

export Ctm, Ctime_t, Cclock_t

# export everything
foreach(names(@__MODULE__, all=true)) do s
   if startswith(string(s), r"(?:X|XCB|xcb)") && !startswith(string(s), "XCB_CONN_")
       @eval export $s
   end
end

end # module
