module XCB

using Parameters
using WindowAbstractions
import WindowAbstractions: on_close,
                           on_invalid,
                           set_title,
                           set_icon_title,
                           set_extent,
                           extent,
                           terminate,
                           map_window,
                           unmap_window

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
       XCBWindow,
       Button,
       ButtonState,
       left_click,
       middle_click,
       right_click,
       scroll_up,
       scroll_down,
       GraphicsContext

end # module
