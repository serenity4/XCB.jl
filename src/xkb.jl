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
    km_name_ptr == C_NULL && error("Could not fetch keymap")
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

function key_info(event_details::EventDetails)
    km = event_details.window_handler.keymap
    @unpack key_name, key, input = event_details.data
    keycode = xkb_keymap_key_by_name(km, string(key_name))
    "Key \e[31m$key_name\e[m (code \e[33m$keycode\e[m): input \"\e[36m$input\e[m\" from symbol \e[36m$key\e[m"
end

Base.Char(km::Keymap, keycode) = Char(xkb_state_key_get_utf32(km.state, keycode))
"""
Get a `KeySymbol` from a keycode.
"""
KeySymbol(km::Keymap, keycode::Integer) = keysym_name_to_keysymbol(name_from_keysym(xkb_state_key_get_one_sym(km.state, keycode)))
"""
Get a `KeySymbol` from a physical key name.
"""
KeySymbol(km::Keymap, key_name) = KeySymbol(km, xkb_keymap_key_by_name(km, key_name))
"""
Get a `KeySymbol` from a keysym name.
"""
function keysym_name_to_keysymbol(keysym_name)
    ks = Symbol(lowercase(keysym_name))
    sym = ks ∈ keys(keysym_names_translation) ? keysym_names_translation[ks] : ks
    KeySymbol(sym)
end

"""
Translation `Dict` from a keysym obtained via XCB to a standard key name defined in `WindowAbstractions`.
"""
const keysym_names_translation = Dict(
    :shift_r          => :shift_right,
    :shift_l          => :shift_left,
    :control_r        => :control_right,
    :control_l        => :control_left,
    :iso_level3_shift => :alt_gr,
    :alt_l            => :alt_left,
    :return           => :enter,
)