struct XCBButtonCode{T}
    XCBButtonCode(v::Val{T}) where {T} = new{v}()
end
XCBButtonCode(mouse_event::Union{xcb_button_press_event_t, xcb_button_release_event_t}) = XCBButtonCode(Val(mouse_event.detail))

button(xcb_button::XCBButtonCode{Val(1)}) = ButtonLeft()
button(xcb_button::XCBButtonCode{Val(2)}) = ButtonMiddle()
button(xcb_button::XCBButtonCode{Val(3)}) = ButtonRight()
button(xcb_button::XCBButtonCode{Val(4)}) = ButtonScrollUp()
button(xcb_button::XCBButtonCode{Val(5)}) = ButtonScrollDown()

KeyCombination(km, key_event::Union{xcb_key_press_event_t,xcb_key_release_event_t}) = KeyCombination(get_key(km, key_event.detail), KeyModifierState(key_event))

function KeyContext(key_event::Union{xcb_key_press_event_t,xcb_key_release_event_t})
    state = key_event.state
    KeyContext((state .| [XCB_MOD_MASK_2, XCB_MOD_MASK_LOCK] .== state)...)
end

function KeyModifierState(key_event::Union{xcb_key_press_event_t,xcb_key_release_event_t})
    state = key_event.state
    KeyModifierState((state .| [XCB_MOD_MASK_SHIFT, XCB_MOD_MASK_CONTROL, XCB_MOD_MASK_1, XCB_MOD_MASK_4] .== state)...)
end

MouseState(mouse_event::Union{xcb_button_press_event_t, xcb_button_release_event_t}) = MouseState((mouse_event.state .| [XCB_BUTTON_MASK_1, XCB_BUTTON_MASK_2, XCB_BUTTON_MASK_3, XCB_BUTTON_MASK_4, XCB_BUTTON_MASK_5, XCB_BUTTON_MASK_ANY] .== mouse_event.state)...)

MouseEvent(mouse_event::xcb_button_press_event_t) = MouseEvent(button(XCBButtonCode(Val(Int(mouse_event.detail)))), MouseState(mouse_event), mouse_event.response_type == XCB_BUTTON_PRESS ? ButtonPressed() : ButtonReleased())
