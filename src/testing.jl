send_xevent(window::XCBWindow, ed::EventData) = @flush @check xcb_send_event(window.conn, false, window.id, window.mask, xevent(w, ed))

xevent(w::XCBWindow, e::EventDetails{MouseEvent{E}}) where {E} = xcb_button_press_event_t(_xcb_translate_event(E), _xcb_translate_button(e.data.button), e.time, w.parent_id, w.id, 0, 0, e.location..., _xcb_translate_state(e.data.state))