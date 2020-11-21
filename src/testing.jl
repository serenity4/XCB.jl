_xcb_translate_state(s::MouseState) = .&(UInt[s.left, s.middle, s.right, s.scroll_up, s.scroll_down, s.any] .* [XCB_BUTTON_MASK_1, XCB_BUTTON_MASK_2, XCB_BUTTON_MASK_3, XCB_BUTTON_MASK_4, XCB_BUTTON_MASK_5, XCB_BUTTON_MASK_ANY]...)

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

send_xevent(window::XCBWindow, ed::EventData) =
    @flush @check :error xcb_send_event(window.conn, false, window.id, window.mask, xevent(w, ed))

xevent(w::XCBWindow, e::EventDetails{MouseEvent{E}}) where {E} =
    xcb_button_press_event_t(_xcb_translate_event(E), _xcb_translate_button(e.data.button), e.time, w.parent_id, w.id, 0, 0, e.location..., _xcb_translate_state(e.data.state))

hex(x) = "0x$(string(x, base=16))"
