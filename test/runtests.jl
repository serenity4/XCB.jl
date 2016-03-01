using XCB
using Base.Test

# write your own tests here
scr = Ref{Cint}()
connection = XCB.xcb_connect(C_NULL, scr)
println(connection)
setup = XCB.xcb_get_setup(connection)
println(setup)
iter = Ref(XCB.xcb_setup_roots_iterator(setup))
println(iter)

for i=scr[]:-1:0
    XCB.xcb_screen_next(iter)
end
screen = unsafe_load(iter[].data, 1)

window = XCB.xcb_generate_id(connection)
value_mask = UInt32(XCB.XCB_CW_BACK_PIXEL) | UInt32(XCB.XCB_CW_EVENT_MASK)
value_list = zeros(UInt32, 32)
value_list[1] = screen.black_pixel
value_list[2] = (
	UInt32(XCB.XCB_EVENT_MASK_KEY_RELEASE) |
	UInt32(XCB.XCB_EVENT_MASK_EXPOSURE) |
    UInt32(XCB.XCB_EVENT_MASK_STRUCTURE_NOTIFY)
)
println(screen)
XCB.xcb_create_window(
	connection, UInt8(0), window,
	screen.root, Int16(0), Int16(0), UInt16(512), UInt16(512), UInt16(0),
	UInt16(XCB.XCB_WINDOW_CLASS_INPUT_OUTPUT), screen.root_visual,
	UInt32(0), C_NULL
)
println(window)

XCB.xcb_map_window(connection, window)
XCB.xcb_flush(connection)

sleep(3)
