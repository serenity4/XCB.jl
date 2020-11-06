# Automatically generated using Clang.jl


const XKB_KEYCODE_INVALID = Float32(0x0fffffff)
const XKB_LAYOUT_INVALID = Float32(0x0fffffff)
const XKB_LEVEL_INVALID = Float32(0x0fffffff)
const XKB_MOD_INVALID = Float32(0x0fffffff)
const XKB_LED_INVALID = Float32(0x0fffffff)
const XKB_KEYCODE_MAX = Float32(0x0fffffff) - 1

# Skipping MacroDefinition: xkb_keycode_is_legal_ext ( key ) ( key <= XKB_KEYCODE_MAX )
# Skipping MacroDefinition: xkb_keycode_is_legal_x11 ( key ) ( key >= 8 && key <= 255 )
# Skipping MacroDefinition: XKB_KEYMAP_USE_ORIGINAL_FORMAT ( ( enum xkb_keymap_format ) - 1 )

const xkb_context = Cvoid
const xkb_keymap = Cvoid
const xkb_state = Cvoid
const xkb_keycode_t = UInt32
const xkb_keysym_t = UInt32
const xkb_layout_index_t = UInt32
const xkb_layout_mask_t = UInt32
const xkb_level_index_t = UInt32
const xkb_mod_index_t = UInt32
const xkb_mod_mask_t = UInt32
const xkb_led_index_t = UInt32
const xkb_led_mask_t = UInt32

struct xkb_rule_names
    rules::Cstring
    model::Cstring
    layout::Cstring
    variant::Cstring
    options::Cstring
end

@cenum xkb_keysym_flags::UInt32 begin
    XKB_KEYSYM_NO_FLAGS = 0
    XKB_KEYSYM_CASE_INSENSITIVE = 1
end

@cenum xkb_context_flags::UInt32 begin
    XKB_CONTEXT_NO_FLAGS = 0
    XKB_CONTEXT_NO_DEFAULT_INCLUDES = 1
    XKB_CONTEXT_NO_ENVIRONMENT_NAMES = 2
end

@cenum xkb_log_level::UInt32 begin
    XKB_LOG_LEVEL_CRITICAL = 10
    XKB_LOG_LEVEL_ERROR = 20
    XKB_LOG_LEVEL_WARNING = 30
    XKB_LOG_LEVEL_INFO = 40
    XKB_LOG_LEVEL_DEBUG = 50
end

@cenum xkb_keymap_compile_flags::UInt32 begin
    XKB_KEYMAP_COMPILE_NO_FLAGS = 0
end

@cenum xkb_keymap_format::UInt32 begin
    XKB_KEYMAP_FORMAT_TEXT_V1 = 1
end


const xkb_keymap_key_iter_t = Ptr{Cvoid}

@cenum xkb_key_direction::UInt32 begin
    XKB_KEY_UP = 0
    XKB_KEY_DOWN = 1
end

@cenum xkb_state_component::UInt32 begin
    XKB_STATE_MODS_DEPRESSED = 1
    XKB_STATE_MODS_LATCHED = 2
    XKB_STATE_MODS_LOCKED = 4
    XKB_STATE_MODS_EFFECTIVE = 8
    XKB_STATE_LAYOUT_DEPRESSED = 16
    XKB_STATE_LAYOUT_LATCHED = 32
    XKB_STATE_LAYOUT_LOCKED = 64
    XKB_STATE_LAYOUT_EFFECTIVE = 128
    XKB_STATE_LEDS = 256
end

@cenum xkb_state_match::UInt32 begin
    XKB_STATE_MATCH_ANY = 1
    XKB_STATE_MATCH_ALL = 2
    XKB_STATE_MATCH_NON_EXCLUSIVE = 65536
end

@cenum xkb_consumed_mode::UInt32 begin
    XKB_CONSUMED_MODE_XKB = 0
    XKB_CONSUMED_MODE_GTK = 1
end


const XKB_X11_MIN_MAJOR_XKB_VERSION = 1
const XKB_X11_MIN_MINOR_XKB_VERSION = 0

@cenum xkb_x11_setup_xkb_extension_flags::UInt32 begin
    XKB_X11_SETUP_XKB_EXTENSION_NO_FLAGS = 0
end

