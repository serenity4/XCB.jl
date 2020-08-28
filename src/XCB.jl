module XCB

include(joinpath(@__DIR__, "..", "gen", "Libxcb.jl"))

using .Libxcb

const xcb = Libxcb

export xcb

end # module
