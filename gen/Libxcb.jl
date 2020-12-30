module Libxcb

import Xorg_libxcb_jll: libxcb, libxcb_xkb
import Xorg_xcb_util_jll: libxcb_util

using CEnum

const Ctm = Base.Libc.TmStruct
const Ctime_t = UInt
const Cclock_t = UInt

include("xcb_common.jl")
include("xcb_api.jl")

export Ctm, Ctime_t, Cclock_t

# export everything
foreach(names(@__MODULE__, all=true)) do s
   if startswith(string(s), r"(?:X|XCB|xcb)") && !startswith(string(s), "XCB_CONN_") # XCB_CONN_* are replaced by an appropriate enum type (see connection.jl)
       @eval export $s
   end
end

end # module
