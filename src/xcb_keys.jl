KeyContext(state::Integer) = KeyContext((state .| [xcb.XCB_MOD_MASK_2, xcb.XCB_MOD_MASK_LOCK] .== state)...)
KeyModifierState(state::Integer) = KeyModifierState((state .| [xcb.XCB_MOD_MASK_SHIFT, xcb.XCB_MOD_MASK_CONTROL, xcb.XCB_MOD_MASK_1, xcb.XCB_MOD_MASK_4] .== state)...)

function Base.getkey(connection::Ptr{xcb.xcb_connection_t}, key_event::Union{xcb.xcb_key_press_event_t,xcb.xcb_key_release_event_t})
    keysymbols = xcb.xcb_key_symbols_alloc(connection)
    keysym = xcb.xcb_key_symbols_get_keysym(keysymbols, key_event.detail, 0)
    Char(keysym)
end

KeyBinding(connection::Ptr{xcb.xcb_connection_t}, key_event::Union{xcb.xcb_key_press_event_t,xcb.xcb_key_release_event_t}) = KeyBinding(getkey(connection, key_event), KeyModifierState(key_event))

KeyContext(key_event::Union{xcb.xcb_key_press_event_t,xcb.xcb_key_release_event_t}) = KeyContext(key_event.state)
KeyModifierState(key_event::Union{xcb.xcb_key_press_event_t,xcb.xcb_key_release_event_t}) = KeyModifierState(key_event.state)