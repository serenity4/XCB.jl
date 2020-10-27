module XCB

using DocStringExtensions

@template (FUNCTIONS, METHODS, MACROS) =
    """
    $(DOCSTRING)
    $(TYPEDSIGNATURES)
    """

@template TYPES =
    """
    $(DOCSTRING)
    $(TYPEDEF)
    $(TYPEDSIGNATURES)
    $(TYPEDFIELDS)
    """

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
include(joinpath(@__DIR__, "..", "gen", "Libxkb.jl"))
const xcb = Libxcb
using .Libxcb
using .Libxkb

include("exceptions.jl")
include("connection.jl")
include("window.jl")
include("inputs.jl")
include("xkb.jl")
include("window_handler.jl")
include("context.jl")
include("testing.jl")


export xcb,
       key,
       Connection,
       Setup,
       check,
       check_flush,
       flush,
       XCBWindow,
       GraphicsContext,
       XWindowHandler,
       get_window,
       get_window_symbol,
       event_details_xkb,
       @check,
       @flush,
       keymap_info,
       key_info,
       name_from_keycode,
       name_from_keysym

end # module
