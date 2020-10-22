module XCB

using Reexport
using Parameters
@reexport using WindowAbstractions

include(joinpath(@__DIR__, "..", "gen", "Libxcb.jl"))
const xcb = Libxcb
using .Libxcb

include("input_abstractions.jl")
include("exceptions.jl")
include("connection.jl")
include("window.jl")
include("context.jl")
include("inputs.jl")


export xcb,
       KeyCombination,
       KeyContext,
       KeyModifierState,
       key,
       @key_str,
       Connection,
       Setup,
       check,
       check_flush,
       flush,
       CloseWindow,
       run_window,
       XCBWindow,
       Button,
       ButtonState,
       left_click,
       middle_click,
       right_click,
       scroll_up,
       scroll_down,
       GraphicsContext,
       dimensions

end # module
