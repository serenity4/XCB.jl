module XCB

using Observables

include(joinpath(@__DIR__, "..", "gen", "Libxcb.jl"))
const xcb = Libxcb
using .Libxcb

include("input_abstractions.jl")
include("exceptions.jl")
include("connection.jl")
include("window.jl")
include("context.jl")
include("inputs.jl")
include("events.jl")



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
       Window,
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
