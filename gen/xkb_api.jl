# Julia wrapper for header: xkbcommon.h
# Automatically generated using Clang.jl


function xkb_keysym_get_name(keysym, buffer, size)
    ccall((:xkb_keysym_get_name, libxkbcommon), Cint, (xkb_keysym_t, Cstring, Cint), keysym, buffer, size)
end

function xkb_keysym_from_name(name, flags)
    ccall((:xkb_keysym_from_name, libxkbcommon), xkb_keysym_t, (Cstring, xkb_keysym_flags), name, flags)
end

function xkb_keysym_to_utf8(keysym, buffer, size)
    ccall((:xkb_keysym_to_utf8, libxkbcommon), Cint, (xkb_keysym_t, Cstring, Cint), keysym, buffer, size)
end

function xkb_keysym_to_utf32(keysym)
    ccall((:xkb_keysym_to_utf32, libxkbcommon), UInt32, (xkb_keysym_t,), keysym)
end

function xkb_keysym_to_upper(ks)
    ccall((:xkb_keysym_to_upper, libxkbcommon), xkb_keysym_t, (xkb_keysym_t,), ks)
end

function xkb_keysym_to_lower(ks)
    ccall((:xkb_keysym_to_lower, libxkbcommon), xkb_keysym_t, (xkb_keysym_t,), ks)
end

function xkb_context_new(flags)
    ccall((:xkb_context_new, libxkbcommon), Ptr{xkb_context}, (xkb_context_flags,), flags)
end

function xkb_context_ref(context)
    ccall((:xkb_context_ref, libxkbcommon), Ptr{xkb_context}, (Ptr{xkb_context},), context)
end

function xkb_context_unref(context)
    ccall((:xkb_context_unref, libxkbcommon), Cvoid, (Ptr{xkb_context},), context)
end

function xkb_context_set_user_data(context, user_data)
    ccall((:xkb_context_set_user_data, libxkbcommon), Cvoid, (Ptr{xkb_context}, Ptr{Cvoid}), context, user_data)
end

function xkb_context_get_user_data(context)
    ccall((:xkb_context_get_user_data, libxkbcommon), Ptr{Cvoid}, (Ptr{xkb_context},), context)
end

function xkb_context_include_path_append(context, path)
    ccall((:xkb_context_include_path_append, libxkbcommon), Cint, (Ptr{xkb_context}, Cstring), context, path)
end

function xkb_context_include_path_append_default(context)
    ccall((:xkb_context_include_path_append_default, libxkbcommon), Cint, (Ptr{xkb_context},), context)
end

function xkb_context_include_path_reset_defaults(context)
    ccall((:xkb_context_include_path_reset_defaults, libxkbcommon), Cint, (Ptr{xkb_context},), context)
end

function xkb_context_include_path_clear(context)
    ccall((:xkb_context_include_path_clear, libxkbcommon), Cvoid, (Ptr{xkb_context},), context)
end

function xkb_context_num_include_paths(context)
    ccall((:xkb_context_num_include_paths, libxkbcommon), UInt32, (Ptr{xkb_context},), context)
end

function xkb_context_include_path_get(context, index)
    ccall((:xkb_context_include_path_get, libxkbcommon), Cstring, (Ptr{xkb_context}, UInt32), context, index)
end

function xkb_context_set_log_level(context, level)
    ccall((:xkb_context_set_log_level, libxkbcommon), Cvoid, (Ptr{xkb_context}, xkb_log_level), context, level)
end

function xkb_context_get_log_level(context)
    ccall((:xkb_context_get_log_level, libxkbcommon), xkb_log_level, (Ptr{xkb_context},), context)
end

function xkb_context_set_log_verbosity(context, verbosity)
    ccall((:xkb_context_set_log_verbosity, libxkbcommon), Cvoid, (Ptr{xkb_context}, Cint), context, verbosity)
end

function xkb_context_get_log_verbosity(context)
    ccall((:xkb_context_get_log_verbosity, libxkbcommon), Cint, (Ptr{xkb_context},), context)
end

function xkb_context_set_log_fn(context, log_fn)
    ccall((:xkb_context_set_log_fn, libxkbcommon), Cvoid, (Ptr{xkb_context}, Ptr{Cvoid}), context, log_fn)
end

function xkb_keymap_new_from_names(context, names, flags)
    ccall((:xkb_keymap_new_from_names, libxkbcommon), Ptr{xkb_keymap}, (Ptr{xkb_context}, Ptr{xkb_rule_names}, xkb_keymap_compile_flags), context, names, flags)
end

function xkb_keymap_new_from_file(context, file, format, flags)
    ccall((:xkb_keymap_new_from_file, libxkbcommon), Ptr{xkb_keymap}, (Ptr{xkb_context}, Ptr{FILE}, xkb_keymap_format, xkb_keymap_compile_flags), context, file, format, flags)
end

function xkb_keymap_new_from_string(context, string, format, flags)
    ccall((:xkb_keymap_new_from_string, libxkbcommon), Ptr{xkb_keymap}, (Ptr{xkb_context}, Cstring, xkb_keymap_format, xkb_keymap_compile_flags), context, string, format, flags)
end

function xkb_keymap_new_from_buffer(context, buffer, length, format, flags)
    ccall((:xkb_keymap_new_from_buffer, libxkbcommon), Ptr{xkb_keymap}, (Ptr{xkb_context}, Cstring, Cint, xkb_keymap_format, xkb_keymap_compile_flags), context, buffer, length, format, flags)
end

function xkb_keymap_ref(keymap)
    ccall((:xkb_keymap_ref, libxkbcommon), Ptr{xkb_keymap}, (Ptr{xkb_keymap},), keymap)
end

function xkb_keymap_unref(keymap)
    ccall((:xkb_keymap_unref, libxkbcommon), Cvoid, (Ptr{xkb_keymap},), keymap)
end

function xkb_keymap_get_as_string(keymap, format)
    ccall((:xkb_keymap_get_as_string, libxkbcommon), Cstring, (Ptr{xkb_keymap}, xkb_keymap_format), keymap, format)
end

function xkb_keymap_min_keycode(keymap)
    ccall((:xkb_keymap_min_keycode, libxkbcommon), xkb_keycode_t, (Ptr{xkb_keymap},), keymap)
end

function xkb_keymap_max_keycode(keymap)
    ccall((:xkb_keymap_max_keycode, libxkbcommon), xkb_keycode_t, (Ptr{xkb_keymap},), keymap)
end

function xkb_keymap_key_for_each(keymap, iter, data)
    ccall((:xkb_keymap_key_for_each, libxkbcommon), Cvoid, (Ptr{xkb_keymap}, xkb_keymap_key_iter_t, Ptr{Cvoid}), keymap, iter, data)
end

function xkb_keymap_key_get_name(keymap, key)
    ccall((:xkb_keymap_key_get_name, libxkbcommon), Cstring, (Ptr{xkb_keymap}, xkb_keycode_t), keymap, key)
end

function xkb_keymap_key_by_name(keymap, name)
    ccall((:xkb_keymap_key_by_name, libxkbcommon), xkb_keycode_t, (Ptr{xkb_keymap}, Cstring), keymap, name)
end

function xkb_keymap_num_mods(keymap)
    ccall((:xkb_keymap_num_mods, libxkbcommon), xkb_mod_index_t, (Ptr{xkb_keymap},), keymap)
end

function xkb_keymap_mod_get_name(keymap, idx)
    ccall((:xkb_keymap_mod_get_name, libxkbcommon), Cstring, (Ptr{xkb_keymap}, xkb_mod_index_t), keymap, idx)
end

function xkb_keymap_mod_get_index(keymap, name)
    ccall((:xkb_keymap_mod_get_index, libxkbcommon), xkb_mod_index_t, (Ptr{xkb_keymap}, Cstring), keymap, name)
end

function xkb_keymap_num_layouts(keymap)
    ccall((:xkb_keymap_num_layouts, libxkbcommon), xkb_layout_index_t, (Ptr{xkb_keymap},), keymap)
end

function xkb_keymap_layout_get_name(keymap, idx)
    ccall((:xkb_keymap_layout_get_name, libxkbcommon), Cstring, (Ptr{xkb_keymap}, xkb_layout_index_t), keymap, idx)
end

function xkb_keymap_layout_get_index(keymap, name)
    ccall((:xkb_keymap_layout_get_index, libxkbcommon), xkb_layout_index_t, (Ptr{xkb_keymap}, Cstring), keymap, name)
end

function xkb_keymap_num_leds(keymap)
    ccall((:xkb_keymap_num_leds, libxkbcommon), xkb_led_index_t, (Ptr{xkb_keymap},), keymap)
end

function xkb_keymap_led_get_name(keymap, idx)
    ccall((:xkb_keymap_led_get_name, libxkbcommon), Cstring, (Ptr{xkb_keymap}, xkb_led_index_t), keymap, idx)
end

function xkb_keymap_led_get_index(keymap, name)
    ccall((:xkb_keymap_led_get_index, libxkbcommon), xkb_led_index_t, (Ptr{xkb_keymap}, Cstring), keymap, name)
end

function xkb_keymap_num_layouts_for_key(keymap, key)
    ccall((:xkb_keymap_num_layouts_for_key, libxkbcommon), xkb_layout_index_t, (Ptr{xkb_keymap}, xkb_keycode_t), keymap, key)
end

function xkb_keymap_num_levels_for_key(keymap, key, layout)
    ccall((:xkb_keymap_num_levels_for_key, libxkbcommon), xkb_level_index_t, (Ptr{xkb_keymap}, xkb_keycode_t, xkb_layout_index_t), keymap, key, layout)
end

function xkb_keymap_key_get_syms_by_level(keymap, key, layout, level, syms_out)
    ccall((:xkb_keymap_key_get_syms_by_level, libxkbcommon), Cint, (Ptr{xkb_keymap}, xkb_keycode_t, xkb_layout_index_t, xkb_level_index_t, Ptr{Ptr{xkb_keysym_t}}), keymap, key, layout, level, syms_out)
end

function xkb_keymap_key_repeats(keymap, key)
    ccall((:xkb_keymap_key_repeats, libxkbcommon), Cint, (Ptr{xkb_keymap}, xkb_keycode_t), keymap, key)
end

function xkb_state_new(keymap)
    ccall((:xkb_state_new, libxkbcommon), Ptr{xkb_state}, (Ptr{xkb_keymap},), keymap)
end

function xkb_state_ref(state)
    ccall((:xkb_state_ref, libxkbcommon), Ptr{xkb_state}, (Ptr{xkb_state},), state)
end

function xkb_state_unref(state)
    ccall((:xkb_state_unref, libxkbcommon), Cvoid, (Ptr{xkb_state},), state)
end

function xkb_state_get_keymap(state)
    ccall((:xkb_state_get_keymap, libxkbcommon), Ptr{xkb_keymap}, (Ptr{xkb_state},), state)
end

function xkb_state_update_key(state, key, direction)
    ccall((:xkb_state_update_key, libxkbcommon), xkb_state_component, (Ptr{xkb_state}, xkb_keycode_t, xkb_key_direction), state, key, direction)
end

function xkb_state_update_mask(state, depressed_mods, latched_mods, locked_mods, depressed_layout, latched_layout, locked_layout)
    ccall((:xkb_state_update_mask, libxkbcommon), xkb_state_component, (Ptr{xkb_state}, xkb_mod_mask_t, xkb_mod_mask_t, xkb_mod_mask_t, xkb_layout_index_t, xkb_layout_index_t, xkb_layout_index_t), state, depressed_mods, latched_mods, locked_mods, depressed_layout, latched_layout, locked_layout)
end

function xkb_state_key_get_syms(state, key, syms_out)
    ccall((:xkb_state_key_get_syms, libxkbcommon), Cint, (Ptr{xkb_state}, xkb_keycode_t, Ptr{Ptr{xkb_keysym_t}}), state, key, syms_out)
end

function xkb_state_key_get_utf8(state, key, buffer, size)
    ccall((:xkb_state_key_get_utf8, libxkbcommon), Cint, (Ptr{xkb_state}, xkb_keycode_t, Cstring, Cint), state, key, buffer, size)
end

function xkb_state_key_get_utf32(state, key)
    ccall((:xkb_state_key_get_utf32, libxkbcommon), UInt32, (Ptr{xkb_state}, xkb_keycode_t), state, key)
end

function xkb_state_key_get_one_sym(state, key)
    ccall((:xkb_state_key_get_one_sym, libxkbcommon), xkb_keysym_t, (Ptr{xkb_state}, xkb_keycode_t), state, key)
end

function xkb_state_key_get_layout(state, key)
    ccall((:xkb_state_key_get_layout, libxkbcommon), xkb_layout_index_t, (Ptr{xkb_state}, xkb_keycode_t), state, key)
end

function xkb_state_key_get_level(state, key, layout)
    ccall((:xkb_state_key_get_level, libxkbcommon), xkb_level_index_t, (Ptr{xkb_state}, xkb_keycode_t, xkb_layout_index_t), state, key, layout)
end

function xkb_state_serialize_mods(state, components)
    ccall((:xkb_state_serialize_mods, libxkbcommon), xkb_mod_mask_t, (Ptr{xkb_state}, xkb_state_component), state, components)
end

function xkb_state_serialize_layout(state, components)
    ccall((:xkb_state_serialize_layout, libxkbcommon), xkb_layout_index_t, (Ptr{xkb_state}, xkb_state_component), state, components)
end

function xkb_state_mod_name_is_active(state, name, type)
    ccall((:xkb_state_mod_name_is_active, libxkbcommon), Cint, (Ptr{xkb_state}, Cstring, xkb_state_component), state, name, type)
end

function xkb_state_mod_index_is_active(state, idx, type)
    ccall((:xkb_state_mod_index_is_active, libxkbcommon), Cint, (Ptr{xkb_state}, xkb_mod_index_t, xkb_state_component), state, idx, type)
end

function xkb_state_key_get_consumed_mods2(state, key, mode)
    ccall((:xkb_state_key_get_consumed_mods2, libxkbcommon), xkb_mod_mask_t, (Ptr{xkb_state}, xkb_keycode_t, xkb_consumed_mode), state, key, mode)
end

function xkb_state_key_get_consumed_mods(state, key)
    ccall((:xkb_state_key_get_consumed_mods, libxkbcommon), xkb_mod_mask_t, (Ptr{xkb_state}, xkb_keycode_t), state, key)
end

function xkb_state_mod_index_is_consumed2(state, key, idx, mode)
    ccall((:xkb_state_mod_index_is_consumed2, libxkbcommon), Cint, (Ptr{xkb_state}, xkb_keycode_t, xkb_mod_index_t, xkb_consumed_mode), state, key, idx, mode)
end

function xkb_state_mod_index_is_consumed(state, key, idx)
    ccall((:xkb_state_mod_index_is_consumed, libxkbcommon), Cint, (Ptr{xkb_state}, xkb_keycode_t, xkb_mod_index_t), state, key, idx)
end

function xkb_state_mod_mask_remove_consumed(state, key, mask)
    ccall((:xkb_state_mod_mask_remove_consumed, libxkbcommon), xkb_mod_mask_t, (Ptr{xkb_state}, xkb_keycode_t, xkb_mod_mask_t), state, key, mask)
end

function xkb_state_layout_name_is_active(state, name, type)
    ccall((:xkb_state_layout_name_is_active, libxkbcommon), Cint, (Ptr{xkb_state}, Cstring, xkb_state_component), state, name, type)
end

function xkb_state_layout_index_is_active(state, idx, type)
    ccall((:xkb_state_layout_index_is_active, libxkbcommon), Cint, (Ptr{xkb_state}, xkb_layout_index_t, xkb_state_component), state, idx, type)
end

function xkb_state_led_name_is_active(state, name)
    ccall((:xkb_state_led_name_is_active, libxkbcommon), Cint, (Ptr{xkb_state}, Cstring), state, name)
end

function xkb_state_led_index_is_active(state, idx)
    ccall((:xkb_state_led_index_is_active, libxkbcommon), Cint, (Ptr{xkb_state}, xkb_led_index_t), state, idx)
end
# Julia wrapper for header: xkbcommon-x11.h
# Automatically generated using Clang.jl


function xkb_x11_setup_xkb_extension(connection, major_xkb_version, minor_xkb_version, flags, major_xkb_version_out, minor_xkb_version_out, base_event_out, base_error_out)
    ccall((:xkb_x11_setup_xkb_extension, libxkbcommon), Cint, (Ptr{xcb_connection_t}, UInt16, UInt16, xkb_x11_setup_xkb_extension_flags, Ptr{UInt16}, Ptr{UInt16}, Ptr{UInt8}, Ptr{UInt8}), connection, major_xkb_version, minor_xkb_version, flags, major_xkb_version_out, minor_xkb_version_out, base_event_out, base_error_out)
end

function xkb_x11_get_core_keyboard_device_id(connection)
    ccall((:xkb_x11_get_core_keyboard_device_id, libxkbcommon), Int32, (Ptr{xcb_connection_t},), connection)
end

function xkb_x11_keymap_new_from_device(context, connection, device_id, flags)
    ccall((:xkb_x11_keymap_new_from_device, libxkbcommon), Ptr{xkb_keymap}, (Ptr{xkb_context}, Ptr{xcb_connection_t}, Int32, xkb_keymap_compile_flags), context, connection, device_id, flags)
end

function xkb_x11_state_new_from_device(keymap, connection, device_id)
    ccall((:xkb_x11_state_new_from_device, libxkbcommon), Ptr{xkb_state}, (Ptr{xkb_keymap}, Ptr{xcb_connection_t}, Int32), keymap, connection, device_id)
end
