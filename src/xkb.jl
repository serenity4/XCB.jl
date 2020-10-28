mutable struct Keymap <: Handle
    h::Ptr{xkb_keymap}
    ctx::Ptr{xkb_context}
    state::Ptr{xkb_state}
    conn::Connection
    device_id
    function Keymap(h, ctx, state, conn, id)
        km = new(h, ctx, state, conn, id)
        finalizer(km) do x
            xkb_state_unref(x.state)
            xkb_keymap_unref(x.h)
            xkb_context_unref(x.ctx)
        end
    end
end

function event_details_xkb(fields::Dict{String, Bool})
    names = fieldnames(xcb_xkb_select_events_details_t)
    flags = zeros(length(names))
    fields_affect = Dict("affect" * uppercasefirst(k) => v for (k, v) ∈ fields)
    for i ∈ 1:2:length(names)
        access_field = string(names[i])
        if access_field ∈ keys(fields_affect)
            flags[i] = 1 # affect
            flags[i + 1] = fields_affect[access_field] # details
        end
    end
    xcb_xkb_select_events_details_t(flags...)
end

function Keymap(conn::Connection; setup_xkb=true)
    if setup_xkb
        ret_code = xkb_x11_setup_xkb_extension(conn, 1, 0, XKB_X11_SETUP_XKB_EXTENSION_NO_FLAGS, C_NULL, C_NULL, C_NULL, C_NULL)
        ret_code == 0 && error("XKB extension could not be setup")
    end
    ctx = xkb_context_new(XKB_CONTEXT_NO_DEFAULT_INCLUDES)
    ctx == C_NULL && error("Context could not be created: $ctx")
    device_id = xkb_x11_get_core_keyboard_device_id(conn)
    device_id == -1 && error("Invalid device ID retrieved: $device_id")
    keymap = xkb_x11_keymap_new_from_device(ctx, conn, device_id, XKB_KEYMAP_COMPILE_NO_FLAGS)
    state = xkb_x11_state_new_from_device(keymap, conn, device_id)
    state == C_NULL && error("State could not be created: $state")
    Keymap(keymap, ctx, state, conn, device_id)
end

function keymap_info(km)
    km_name_ptr = xkb_keymap_get_as_string(km, XKB_KEYMAP_FORMAT_TEXT_V1)
    km_name_ptr == C_NULL && error("Could not fetch keymap name")
    unsafe_string(km_name_ptr)
end


function name_from_keysym(keysym; max_chars=50)
    char_tmp = zeros(UInt8, max_chars)
    char_tmp_ptr = pointer(char_tmp)
    GC.@preserve char_tmp begin
        val = xkb_keysym_get_name(keysym, pointer(char_tmp), sizeof(eltype(char_tmp)) * length(char_tmp))
        val == -1 && @error("Could not find keysym name for $(hex(keysym))")
        str = unsafe_string(char_tmp_ptr)
    end
    str
end

function name_from_keycode(km::Keymap, keycode)
    ptr = xkb_keymap_key_get_name(km, keycode)
    ptr == C_NULL && error("Could not get name from keycode $keycode")
    unsafe_string(ptr)
end

function key_info(km, keycode)
    sym = xkb_state_key_get_one_sym(km.state, keycode)
    """
Keycode \e[33m$(keycode)\e[m:
        keycode name: \e[36m$(name_from_keycode(km, keycode))\e[m
              keysym: \e[36m$(hex(sym))\e[m
         keysym name: \e[36m$(name_from_keysym(sym))\e[m
        utf32 symbol: \e[36m$(Char(xkb_state_key_get_utf32(km.state, keycode)))\e[m
    """
end

get_key(km::Keymap, keycode) = begin @info(key_info(km, keycode)); Char(xkb_state_key_get_utf32(km.state, keycode)) end