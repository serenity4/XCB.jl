struct XCBButtonCode{T}
    XCBButtonCode(v::Val{T}) where {T} = new{v}()
end
XCBButtonCode(mouse_event::Union{xcb_button_press_event_t, xcb_button_release_event_t}) = XCBButtonCode(Val(mouse_event.detail))

button(xcb_button::XCBButtonCode{Val(1)}) = ButtonLeft()
button(xcb_button::XCBButtonCode{Val(2)}) = ButtonMiddle()
button(xcb_button::XCBButtonCode{Val(3)}) = ButtonRight()
button(xcb_button::XCBButtonCode{Val(4)}) = ButtonScrollUp()
button(xcb_button::XCBButtonCode{Val(5)}) = ButtonScrollDown()

function get_key(connection::Connection, key_event::Union{xcb_key_press_event_t,xcb_key_release_event_t})
    keysymbols = xcb_key_symbols_alloc(connection)
    keysym = xcb_key_symbols_get_keysym(keysymbols, key_event.detail, 0)
    Char(keysym)
end

KeyCombination(connection::Connection, key_event::Union{xcb_key_press_event_t,xcb_key_release_event_t}) = KeyCombination(get_key(connection, key_event), KeyModifierState(key_event))

function KeyContext(key_event::Union{xcb_key_press_event_t,xcb_key_release_event_t})
    state = key_event.state
    KeyContext((state .| [XCB_MOD_MASK_2, XCB_MOD_MASK_LOCK] .== state)...)
end

function KeyModifierState(key_event::Union{xcb_key_press_event_t,xcb_key_release_event_t})
    state = key_event.state
    KeyModifierState((state .| [XCB_MOD_MASK_SHIFT, XCB_MOD_MASK_CONTROL, XCB_MOD_MASK_1, XCB_MOD_MASK_4] .== state)...)
end

MouseState(mouse_event::Union{xcb_button_press_event_t, xcb_button_release_event_t}) = MouseState((mouse_event.state .| [XCB_BUTTON_MASK_1, XCB_BUTTON_MASK_2, XCB_BUTTON_MASK_3, XCB_BUTTON_MASK_4, XCB_BUTTON_MASK_5, XCB_BUTTON_MASK_ANY] .== mouse_event.state)...)

_xcb_translate_state(s::MouseState) = &.(Int[s.left, s.middle, s.right, s.scroll_up, s.scroll_down, s.any] .* [XCB_BUTTON_MASK_1, XCB_BUTTON_MASK_2, XCB_BUTTON_MASK_3, XCB_BUTTON_MASK_4, XCB_BUTTON_MASK_5, XCB_BUTTON_MASK_ANY])

_xcb_translate_event(::Type{ButtonPressed}) = XCB_BUTTON_PRESS
_xcb_translate_event(::Type{ButtonReleased}) = XCB_BUTTON_RELEASE
_xcb_translate_event(::KeyPressed) = XCB_KEY_PRESS
_xcb_translate_event(::KeyReleased) = XCB_KEY_RELEASE
_xcb_translate_event(::PointerMoves) = XCB_MOTION_NOTIFY
_xcb_translate_event(::PointerEntersWindow) = XCB_ENTER_NOTIFY
_xcb_translate_event(::PointerLeavesWindow) = XCB_LEAVE_NOTIFY
_xcb_translate_event(::ExposeEvent) = XCB_EXPOSE

_xcb_translate_button(::ButtonLeft) = XCB_BUTTON_MASK_1
_xcb_translate_button(::ButtonMiddle) = XCB_BUTTON_MASK_2
_xcb_translate_button(::ButtonRight) = XCB_BUTTON_MASK_3
_xcb_translate_button(::ButtonScrollUp) = XCB_BUTTON_MASK_4
_xcb_translate_button(::ButtonScrollDown) = XCB_BUTTON_MASK_5

MouseEvent(mouse_event::xcb_button_press_event_t) = MouseEvent(button(XCBButtonCode(Val(Int(mouse_event.detail)))), MouseState(mouse_event), mouse_event.response_type == XCB_BUTTON_PRESS ? ButtonPressed() : ButtonReleased())