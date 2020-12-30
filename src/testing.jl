"""
Translate mouse or modifier state into the corresponding API value.
"""
function _xcb_translate_state end

_xcb_translate_state(s::MouseState) = .&(UInt[s.left, s.middle, s.right, s.scroll_up, s.scroll_down, s.any] .* UInt[XCB_BUTTON_MASK_1, XCB_BUTTON_MASK_2, XCB_BUTTON_MASK_3, XCB_BUTTON_MASK_4, XCB_BUTTON_MASK_5, XCB_BUTTON_MASK_ANY]...)
_xcb_translate_state(s::KeyModifierState) = sum(2 .^ (0:3) .* Int[s.shift, s.ctrl, s.alt, s.super])

"""
Translate an event type into its API value.
"""
function _xcb_translate_event end

_xcb_translate_event(::ButtonPressed) = XCB_BUTTON_PRESS
_xcb_translate_event(::ButtonReleased) = XCB_BUTTON_RELEASE
_xcb_translate_event(::KeyPressed) = XCB_KEY_PRESS
_xcb_translate_event(::KeyReleased) = XCB_KEY_RELEASE
_xcb_translate_event(::PointerMoves) = XCB_MOTION_NOTIFY
_xcb_translate_event(::PointerEntersWindow) = XCB_ENTER_NOTIFY
_xcb_translate_event(::PointerLeavesWindow) = XCB_LEAVE_NOTIFY
_xcb_translate_event(::ExposeEvent) = XCB_EXPOSE

_xcb_translate_button(::ButtonLeft) = XCB_BUTTON_INDEX_1
_xcb_translate_button(::ButtonMiddle) = XCB_BUTTON_INDEX_2
_xcb_translate_button(::ButtonRight) = XCB_BUTTON_INDEX_3
_xcb_translate_button(::ButtonScrollUp) = XCB_BUTTON_INDEX_4
_xcb_translate_button(::ButtonScrollDown) = XCB_BUTTON_INDEX_5

send_fake_event(details::EventDetails) = send_event(details.window, fake_event(details))

function send_event(window::XCBWindow, event)
    ref = Ref(event)
    GC.@preserve ref begin
        @flush @check :error xcb_send_event(window.conn, false, window.id, window.mask, Base.reinterpret(Cstring, Base.unsafe_convert(Ptr{typeof(event)}, ref)))
    end
end

fake_event(e::EventDetails, type, args...) = type(
    _xcb_translate_event(e.data.action), # response type
    args...                              # event payload
)

function fake_event(e::EventDetails{<:MouseEvent})
    button = _xcb_translate_button(e.data.button)
    state = _xcb_translate_state(e.data.state)
    fake_event(e, xcb_button_press_event_t, button, 0, e.time, e.window.parent_id, e.window.id, 0, 0, 0, e.location..., state, true, false)
end

function fake_event(e::EventDetails{<:KeyEvent})
    key = keycode(e)
    state = _xcb_translate_state(e.data.modifiers)
    fake_event(e, xcb_key_press_event_t, key, 0, e.time, e.window.parent_id, e.window.id, 0, 0, 0, e.location..., state, true, false)
end

hex(x) = "0x$(string(x, base=16))"
