    a = Channel{Int}(100)
    event_loop_2 = EventLoop(
    window_handler=handler,
    callbacks=Dict(
        :window_1 => WindowCallbacks(;
            on_resize = x -> put!(a, 1),
            on_mouse_button_pressed = x -> put!(a, 2),
            on_mouse_button_released = x -> put!(a, 3),
            on_key_pressed = x -> begin x.data.kc == key"p" && put!(a, 4); on_key_pressed(x) end,
            on_key_released = x -> x.data.kc == key"p" && put!(a, 5),
            on_pointer_enter = x -> put!(a, 6),
            on_pointer_leave = x -> put!(a, 7),
            on_pointer_move = x -> put!(a, 8),
            on_expose = x -> put!(a, 9),
        ),
        :window_2 => WindowCallbacks(;
        on_mouse_button_pressed = x -> put!(a, 10),
        on_key_pressed,
        ),
    ),
)
run(event_loop_2, Synchronous(); warn_unknown=true, poll=true)
@test take!(a) == 1
@test take!(a) == 1
@test take!(a) == 1
@test take!(a) == 9
@test isempty(a)