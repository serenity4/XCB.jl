function Base.getkey(connection::Connection, key_event::Union{xcb_key_press_event_t,xcb_key_release_event_t})
    keysymbols = xcb_key_symbols_alloc(connection.h)
    keysym = xcb_key_symbols_get_keysym(keysymbols, key_event.detail, 0)
    Char(keysym)
end

KeyCombination(connection::Connection, key_event::Union{xcb_key_press_event_t,xcb_key_release_event_t}) = KeyCombination(getkey(connection, key_event), KeyModifierState(key_event))

function KeyContext(key_event::Union{xcb_key_press_event_t,xcb_key_release_event_t})
    state = key_event.state
    KeyContext((state .| [XCB_MOD_MASK_2, XCB_MOD_MASK_LOCK] .== state)...)
end

function KeyModifierState(key_event::Union{xcb_key_press_event_t,xcb_key_release_event_t})
    state = key_event.state
    KeyModifierState((state .| [XCB_MOD_MASK_SHIFT, XCB_MOD_MASK_CONTROL, XCB_MOD_MASK_1, XCB_MOD_MASK_4] .== state)...)
end

function Button(button_event::Union{xcb_button_press_event_t, xcb_button_release_event_t})
    detail = button_event.detail
    Button(detail)
end

function ButtonState(button_event::Union{xcb_button_press_event_t, xcb_button_release_event_t})
    state = button_event.state
    @show(UInt32(state))
    println(UInt32[XCB_BUTTON_MASK_1, XCB_BUTTON_MASK_2, XCB_BUTTON_MASK_3, XCB_BUTTON_MASK_4, XCB_BUTTON_MASK_5, XCB_BUTTON_MASK_ANY])
    ButtonState((state .| [XCB_BUTTON_MASK_1, XCB_BUTTON_MASK_2, XCB_BUTTON_MASK_3, XCB_BUTTON_MASK_4, XCB_BUTTON_MASK_5, XCB_BUTTON_MASK_ANY] .== state)...)
end

Base.Dict(button_state::ButtonState) = Dict((string(k) => getproperty(button_state, k)) for k ∈ fieldnames(ButtonState))