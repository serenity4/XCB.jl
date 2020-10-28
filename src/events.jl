event_type(::Val{XCB_CONFIGURE_NOTIFY}) = xcb_configure_notify_event_t
event_type(::Union{Val{XCB_KEY_PRESS}, Val{XCB_KEY_RELEASE}}) = xcb_key_press_event_t
event_type(::Union{Val{XCB_ENTER_NOTIFY}, Val{XCB_LEAVE_NOTIFY}}) = xcb_enter_notify_event_t
event_type(::Union{Val{XCB_BUTTON_PRESS}, Val{XCB_BUTTON_RELEASE}}) = xcb_button_press_event_t
event_type(::Val{XCB_MOTION_NOTIFY}) = xcb_motion_notify_event_t
event_type(::Val{XCB_EXPOSE}) = xcb_expose_event_t
event_type(::Val{XCB_CLIENT_MESSAGE}) = xcb_client_message_event_t
event_type(::Union{Val{85}}) = xcb.xcb_xkb_state_notify_event_t # very hacky, but response type XCB_XKB_STATE_NOTIFY never gets signaled and 85 is emitted instead...
event_type(::Val{XCB_KEYMAP_NOTIFY}) = xcb_keymap_notify_event_t
event_type(rt) = nothing

function unsafe_load_event(xge_ptr; warn_unknown=false)
    xge = unsafe_load(xge_ptr)
    rt = xge.response_type % 128
    et = event_type(Val(Int(rt)))
    if isnothing(et)
        warn_unknown && @warn "Unknown event $(xge.response_type) (modulo 128: $rt)"
        nothing
    else
        unsafe_load(convert(Ptr{et}, xge_ptr))
    end
end