function unsafe_load_event(xge_ptr; warn_unknown=false)
    xge = unsafe_load(xge_ptr)
    rt = xge.response_type
    rt = rt > 128 ? rt - 128 : rt
    if rt == XCB.XCB_CONFIGURE_NOTIFY
        unsafe_load(convert(Ptr{XCB.xcb_configure_notify_event_t}, xge_ptr))
    elseif rt ∈ (XCB.XCB_KEY_PRESS, XCB.XCB_KEY_RELEASE)
        unsafe_load(convert(Ptr{XCB.xcb_key_press_event_t}, xge_ptr))
    elseif rt ∈ (XCB.XCB_ENTER_NOTIFY, XCB.XCB_LEAVE_NOTIFY)
        unsafe_load(convert(Ptr{XCB.xcb_enter_notify_event_t}, xge_ptr))
    elseif rt ∈ (XCB.XCB_BUTTON_PRESS, XCB.XCB_BUTTON_RELEASE)
        unsafe_load(convert(Ptr{XCB.xcb_button_press_event_t}, xge_ptr))
    elseif rt == XCB.XCB_MOTION_NOTIFY
        unsafe_load(convert(Ptr{XCB.xcb_motion_notify_event_t}, xge_ptr))
    elseif rt == XCB.XCB_EXPOSE
        unsafe_load(convert(Ptr{XCB.xcb_expose_event_t}, xge_ptr))
    elseif rt == XCB.XCB_CLIENT_MESSAGE
        unsafe_load(convert(Ptr{xcb.xcb_client_message_event_t}, xge_ptr)) # delete window request
    else
        warn_unknown && @warn "Unknown event $(rt)"
        nothing
        # throw(ErrorException("Unknown event with response_type $rt"))
    end
end

process_xevent(wh, event_loop, xge::Nothing, t; warn_unknown=false, kwargs...) = nothing
function process_xevent(wh, event_loop, xge, t; warn_unknown=false, kwargs...)
    event = unsafe_load_event(xge; warn_unknown)
    if !isnothing(event) # unknown event
        window = get_window(wh, event)
        if event isa XCB.xcb_client_message_event_t
            ed_8 = Int.(event.data.data8)
            event_data32_1 = ed_8[1] + ed_8[2] * 2^8 + ed_8[3] * 2^16 + ed_8[4] *2^24
            event_data32_1 == window.delete_request && throw(CloseWindow(wh, window, ""))
        elseif !isnothing(window) # event happened on inexistant window
            details = EventDetails(wh, window, event, t)
            execute_callback(event_loop, details; kwargs...)
        end
    end
end

function main_loop(wh::XWindowHandler, event_loop::EventLoop{XWindowHandler}, t0, next_event::Function; warn_unknown=false, kwargs...)
    while !isempty(wh.windows)
        try
            event_loop.on_iter_first()
            xge = next_event(wh, t0)
            t = time() - t0
            process_xevent(wh, event_loop, xge, t; warn_unknown, kwargs...)
            event_loop.on_iter_last()
        catch e
            if e isa CloseWindow || e isa InvalidWindow
                execute_callback(event_loop, e)
            else
                rethrow(e)
                break
            end
        end
    end
end

"""
Run an `EventLoop` attached to a `XWindowHandler` instance.
"""
function Base.run(event_loop::EventLoop{XWindowHandler}, ::Synchronous; warn_unknown=false, poll=false, kwargs...)
    wh = event_loop.window_handler
    t0 = time()
    next_event = poll ? poll_for_event : wait_for_event
    main_loop(wh, event_loop, t0, next_event; warn_unknown, kwargs...)
end

function Base.run(event_loop::EventLoop{XWindowHandler}, ::Asynchronous; warn_unknown=false, kwargs...)
    wh = event_loop.window_handler
    t0 = time()
    @async main_loop(wh, event_loop, t0, poll_for_event; warn_unknown, kwargs...)
end