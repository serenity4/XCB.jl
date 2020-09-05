module XCB

include(joinpath(@__DIR__, "..", "gen", "Libxcb.jl"))
const xcb = Libxcb

include("key_abstractions.jl")
include("xcb_keys.jl")
include("connection.jl")
include("flush.jl")

using .Libxcb


export xcb, KeyBinding, KeyContext, KeyModifierState, key, @key_str, Connection, Setup, check, check_flush, flush

end # module
