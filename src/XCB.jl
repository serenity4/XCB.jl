module XCB

using Parameters
using WindowAbstractions
using WindowAbstractions: Point2
import WindowAbstractions: set_title,
                           set_icon_title,
                           set_extent,
                           extent,
                           terminate_window!,
                           map_window,
                           unmap_window,
                           wait_for_event,
                           poll_for_event,
                           attach_graphics_context!,
                           get_window,
                           get_window_symbol,

                           MouseEvent,
                           MouseState,
                           KeyEvent,
                           KeyModifierState,
                           KeyContext,
                           KeyCombination,
                           EventDetails

include(joinpath(@__DIR__, "..", "gen", "Libxcb.jl"))
const xcb = Libxcb
using .Libxcb

include("exceptions.jl")
include("connection.jl")
include("window.jl")
include("window_handler.jl")
include("context.jl")
include("inputs.jl")
include("testing.jl")


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
       MouseEvent,
       left_click,
       middle_click,
       right_click,
       scroll_up,
       scroll_down,
       GraphicsContext,
       XWindowHandler,
       get_window,
       get_window_symbol,
       event_details

end # module
