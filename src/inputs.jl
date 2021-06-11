struct XCBButtonCode{T}
    XCBButtonCode(v::Val{T}) where {T} = new{v}()
end

# xcb_button_release_event_t is a type alias for xcb_button_press_event_t
# so there is no need to define methods for xcb_button_release_event_t

XCBButtonCode(mouse_event::xcb_button_press_event_t) = XCBButtonCode(Val(Int(mouse_event.detail)))

button(::XCBButtonCode{Val(1)}) = ButtonLeft()
button(::XCBButtonCode{Val(2)}) = ButtonMiddle()
button(::XCBButtonCode{Val(3)}) = ButtonRight()
button(::XCBButtonCode{Val(4)}) = ButtonScrollUp()
button(::XCBButtonCode{Val(5)}) = ButtonScrollDown()

MouseState(mouse_event::Union{xcb_button_press_event_t,xcb_motion_notify_event_t}) = MouseState((mouse_event.state .| [XCB_BUTTON_MASK_1, XCB_BUTTON_MASK_2, XCB_BUTTON_MASK_3, XCB_BUTTON_MASK_4, XCB_BUTTON_MASK_5, XCB_BUTTON_MASK_ANY] .== mouse_event.state)...)

MouseEvent(mouse_event::xcb_button_press_event_t) = MouseEvent(button(XCBButtonCode(mouse_event)), MouseState(mouse_event), response_type(mouse_event) == XCB_BUTTON_PRESS ? ButtonPressed() : ButtonReleased())

PointerMovesEvent(motion_event::xcb_motion_notify_event_t) = PointerMovesEvent(MouseState(motion_event), KeyModifierState(motion_event))

function KeyContext(key_event::xcb_key_press_event_t)
    state = key_event.state
    KeyContext((state .| [XCB_MOD_MASK_2, XCB_MOD_MASK_LOCK] .== state)...)
end

function KeyModifierState(key_event::Union{xcb_key_press_event_t,xcb_motion_notify_event_t})
    state = key_event.state
    KeyModifierState((state .| [XCB_MOD_MASK_SHIFT, XCB_MOD_MASK_CONTROL, XCB_MOD_MASK_1, XCB_MOD_MASK_4] .== state)...)
end
