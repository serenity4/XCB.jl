using Parameters


"Provide information about key modifier state (shift, control, alt and the OS key)."
@with_kw struct KeyModifierState
    shift::Bool = 0
    ctrl::Bool = 0
    alt::Bool = 0
    super::Bool = 0
end

"Key binding associated to a character and a key modifier."
struct KeyCombination
    key::AbstractString
    state::KeyModifierState
    KeyCombination(key, state) = new(key ∈ keys(fkeys) ? fkeys[key] : string(key), state)
end

"State of the keyboard, with regards to numlock and caps states."
struct KeyContext
    numlock::Bool
    caps::Bool
end
    

abstract type KeyAction end

struct KeyReleased <: KeyAction end
struct KeyPressed <: KeyAction end

struct KeyEvent
    kc::KeyCombination
    action::KeyAction
end

@enum Button left_click = 1 middle_click = 2 right_click = 3 scroll_up = 4 scroll_down = 5

@with_kw struct ButtonState
    left::Bool = false
    middle::Bool = false
    right::Bool = false
    scroll_up::Bool = false
    scroll_down::Bool = false
    any::Bool = false
end

Base.show(io::IO, keyctx::KeyContext) = print(io, "num_lock=", keyctx.numlock, ", caps=", keyctx.caps)

function KeyCombination(key_combination::AbstractString)
    els = split(key_combination, "+")
    if endswith(last(els), r"f\d+")
        char_part = match(r"f\d+", pop!(els)).match
    else
        char_part = pop!(els)
        @assert length(char_part) == 1 "Character part $char_part of $key_combination must be a single character"
    end
    KeyCombination(char_part, KeyModifierState(; zip(Symbol.(els), [true for _ ∈ els])...))
end

const fkeys = Dict(
    '\uffbe' => "f1",
    '\uffbf' => "f2",
    '\uffc0' => "f3",
    '\uffc1' => "f4",
    '\uffc2' => "f5",
    '\uffc3' => "f6",
    '\uffc4' => "f7",
    '\uffc5' => "f8",
    '\uffc6' => "f9",
    '\uffc7' => "f10",
    '\uffc8' => "f11",
    '\uffc9' => "f12",
)

function Base.string(key::KeyCombination)
    states = String[]
    for field ∈ reverse(fieldnames(KeyModifierState))
        getproperty(key.state, field) ? push!(states, string(field)) : nothing
    end
    push!(states, key.key)
    join(states, "+")
end

Base.show(io::IO, key::KeyCombination) = print(io, string(key))

function Base.string(button::ButtonState)
    states = String[]
    for field ∈ fieldnames(ButtonState)
        push!(states, string(field) * "=$(getproperty(button, field))")
    end
    join(states, ", ")
end

"""
Construct a KeyCombination instance from a string as `"[<state_1>+[...<state_n>+]]<key>"`.
The string must be a list of elements separated by '+' characters, with only one non-state character or fkey (or fkey as string). For example, `"k"`, `"alt+k"` and `"ctrl+alt+shift+k"` are valid strings, but `"k+a"` is not. Casing is ignored. Fkeys are simply f<1-12> keys, for example `key"alt+f4"` is valid.
"""
macro key_str(expr) esc(:(KeyCombination($(Meta.parse("\"$(escape_string(expr))\""))))) end

Base.Dict(button_state::ButtonState) = Dict((string(k) => getproperty(button_state, k)) for k ∈ fieldnames(ButtonState))
