var documenterSearchIndex = {"docs":
[{"location":"utility/#Utility-tools","page":"Utility tools","title":"Utility tools","text":"","category":"section"},{"location":"utility/#Visualizing-X-events","page":"Utility tools","title":"Visualizing X events","text":"","category":"section"},{"location":"utility/","page":"Utility tools","title":"Utility tools","text":"xev is a command-line tool that setups a toy window and prints all incoming X events. It is a very useful tool to experiment with when trying to determine which events are sent upon which actions.","category":"page"},{"location":"utility/#Keyboard-configuration","page":"Utility tools","title":"Keyboard configuration","text":"","category":"section"},{"location":"utility/","page":"Utility tools","title":"Utility tools","text":"xmodmap allows one to query information about various input-related keyboard elements. Notably, it lists all the keycodes and corresponding key symbols as interpreted by the X Server.","category":"page"},{"location":"api/#API","page":"API","title":"API","text":"","category":"section"},{"location":"api/","page":"API","title":"API","text":"","category":"page"},{"location":"api/","page":"API","title":"API","text":"Modules = [XCB]\nPrivate = true","category":"page"},{"location":"api/#XCB.keysym_names_translation","page":"API","title":"XCB.keysym_names_translation","text":"Translation Dict from a keysym obtained via XCB to a standard key name defined in WindowAbstractions.\n\n\n\n\n\n","category":"constant"},{"location":"api/#WindowAbstractions.KeySymbol-Tuple{XCB.Keymap,Any}","page":"API","title":"WindowAbstractions.KeySymbol","text":"Get a KeySymbol from a physical key name.\n\nKeySymbol(km::XCB.Keymap, key_name::Any) -> WindowAbstractions.KeySymbol\n\n\n\n\n\n\n","category":"method"},{"location":"api/#WindowAbstractions.KeySymbol-Tuple{XCB.Keymap,Integer}","page":"API","title":"WindowAbstractions.KeySymbol","text":"Get a KeySymbol from a keycode.\n\nKeySymbol(km::XCB.Keymap, keycode::Integer) -> WindowAbstractions.KeySymbol\n\n\n\n\n\n\n","category":"method"},{"location":"api/#XCB.Connection","page":"API","title":"XCB.Connection","text":"Connection to the X server.\n\nmutable struct Connection <: XCB.Handle\n\nh::Any\nOpaque handle to the connection, used for API calls.\n\n\n\n\n\n","category":"type"},{"location":"api/#XCB.Connection-Tuple{}","page":"API","title":"XCB.Connection","text":"Initialize a connection to the X server.\n\nConnection(; display) -> Connection\n\n\n\n\n\n\n","category":"method"},{"location":"api/#XCB.ConnectionError","page":"API","title":"XCB.ConnectionError","text":"The X Server reported a connection error.\n\nstruct ConnectionError <: Exception\n\nmsg::Any\ncode::Any\n\n\n\n\n\n","category":"type"},{"location":"api/#XCB.FlushError","page":"API","title":"XCB.FlushError","text":"Error when flushing a connection to the X Server.\n\nstruct FlushError <: Exception\n\ncode::Any\n\n\n\n\n\n","category":"type"},{"location":"api/#XCB.GraphicsContext","page":"API","title":"XCB.GraphicsContext","text":"Graphics context attached to a window. Used to register drawing commands on the window surface.\n\nmutable struct GraphicsContext\n\nconn::Any\nid::Any\nwindow::Any\nmask::Any\nvalue_list::Any\n\n\n\n\n\n","category":"type"},{"location":"api/#XCB.Handle","page":"API","title":"XCB.Handle","text":"Structures which contain a handle (opaque pointer) as primary data. Those structures are usually defined as mutable so that a finalizer can be registered. Any Handle structure is automatically converted to its handle data on ccalls, through unsafe_convert.\n\nabstract type Handle\n\n\n\n\n\n","category":"type"},{"location":"api/#XCB.RequestError","page":"API","title":"XCB.RequestError","text":"A request to the X Server returned with an error.\n\nstruct RequestError <: Exception\n\nmsg::Any\n\n\n\n\n\n","category":"type"},{"location":"api/#XCB.Setup","page":"API","title":"XCB.Setup","text":"Connection setup handle and data.\n\nstruct Setup <: XCB.Handle\n\nh::Any\nHandle to the setup, used for API calls.\n\nvalue::XCB.Libxcb.xcb_setup_t\nSetup value, obtained when dereferencing its handle.\n\n\n\n\n\n","category":"type"},{"location":"api/#XCB.XCBWindow","page":"API","title":"XCB.XCBWindow","text":"Window type used with the XCB API.\n\nmutable struct XCBWindow <: WindowAbstractions.AbstractWindow\n\nconn::Connection\nid::Any\nparent_id::Any\nvisual_id::Any\nclass::Any\ndepth::Any\nmask::Any\nvalue_list::Any\nctx::Any\ndelete_request::Any\n\n\n\n\n\n","category":"type"},{"location":"api/#Base.run-Tuple{WindowAbstractions.EventLoop{XWindowHandler},WindowAbstractions.Synchronous}","page":"API","title":"Base.run","text":"Run an EventLoop attached to a XWindowHandler instance.\n\nrun(event_loop::WindowAbstractions.EventLoop{XWindowHandler}, ::WindowAbstractions.Synchronous; warn_unknown, poll, kwargs...)\n\n\n\n\n\n\n","category":"method"},{"location":"api/#XCB.check-Tuple{Connection}","page":"API","title":"XCB.check","text":"Check that the connection to the X server was successful. Throws a ConnectionError if the connection failed.\n\ncheck(connection::Connection) -> Connection\n\n\n\n\n\n\n","category":"method"},{"location":"api/#XCB.check_flush-Tuple{Any}","page":"API","title":"XCB.check_flush","text":"Check that the flush was successful, throwing a FlushError if the code is negative.\n\ncheck_flush(code::Any)\n\n\n\n\n\n\n","category":"method"},{"location":"api/#XCB.check_request-Tuple{Any,Any}","page":"API","title":"XCB.check_request","text":"Check that the request was successfully handled by the server, throwing a RequestError if the request failed.\n\ncheck_request(conn::Any, request::Any; raise)\n\n\n\n\n\n\n","category":"method"},{"location":"api/#XCB.keysym_name_to_keysymbol-Tuple{Any}","page":"API","title":"XCB.keysym_name_to_keysymbol","text":"Get a KeySymbol from a keysym name.\n\nkeysym_name_to_keysymbol(keysym_name::Any) -> WindowAbstractions.KeySymbol\n\n\n\n\n\n\n","category":"method"},{"location":"api/#XCB.@check-Tuple{Any}","page":"API","title":"XCB.@check","text":"Check the value returned by the function call request with check_request.\n\nWraps request with check_request. The Connection argument is taken as the first argument of the function call expression request. The request is transformed to be checkable, through the functions xcb*checked (or xcb* if there exists a xcb*_unchecked version). If no checkable substitute is found, an ArgumentError is raised.\n\nTODO: @macroexpand example\n\n\n\n\n\n","category":"macro"},{"location":"api/#XCB.@flush-Tuple{Any}","page":"API","title":"XCB.@flush","text":"Flush a connection attached to a request expr.\n\nThe connection is taken to be the first argument of expr. expr can be a call to XCB.@check.\n\nExamples\n\njulia> @macroexpand @flush xcb_unmap_window(win.conn, win.id)\nquote\n    xcb_unmap_window(win.conn, win.id)\n    (flush)(win.conn)\nend\n\n\n\n\n\n","category":"macro"},{"location":"intro/#Introduction","page":"Introduction","title":"Introduction","text":"","category":"section"},{"location":"intro/","page":"Introduction","title":"Introduction","text":"XCB is a windowing API bound to the X Server and the X11 protocol on Unix-based systems. It simplifies the older X library that was traditionally used for interacting with the X Server.","category":"page"},{"location":"interface/#interface","page":"WindowAbstractions Interface","title":"WindowAbstractions Interface","text":"","category":"section"},{"location":"interface/#Events","page":"WindowAbstractions Interface","title":"Events","text":"","category":"section"},{"location":"interface/","page":"WindowAbstractions Interface","title":"WindowAbstractions Interface","text":"A large portion of this package is dedicated to handling the events reported by the X server and interfacing them into EventDetails instances.","category":"page"},{"location":"interface/","page":"WindowAbstractions Interface","title":"WindowAbstractions Interface","text":"In order to receive events from the server, we need to tell the server which types of event we want to be reported. This is done per-window, at their instantiation, through so-called event masks. In the future, it is intended to check which event we are subscribed to with the window callbacks that are provided to an event loop.","category":"page"},{"location":"interface/#Input-events","page":"WindowAbstractions Interface","title":"Input events","text":"","category":"section"},{"location":"interface/","page":"WindowAbstractions Interface","title":"WindowAbstractions Interface","text":"Input events can be classified into different types:","category":"page"},{"location":"interface/","page":"WindowAbstractions Interface","title":"WindowAbstractions Interface","text":"Key events which are generated by pressing or releasing a key from a keyboard,\nMouse events originating from pressing or releasing mouse buttons,\nPointer events such as moving out of or entering a window with the pointer, or moving around inside the window.","category":"page"},{"location":"interface/","page":"WindowAbstractions Interface","title":"WindowAbstractions Interface","text":"Although drag actions are technically just of combination of mouse state and pointer events, they are reported as separate events.","category":"page"},{"location":"interface/#Key-events","page":"WindowAbstractions Interface","title":"Key events","text":"","category":"section"},{"location":"interface/","page":"WindowAbstractions Interface","title":"WindowAbstractions Interface","text":"X and XCB do not offer much keystroke-related utilities, unless we look at some extensions such as XKB, which was used here for processing key inputs. It allows the storage of keyboard and keymap states, as well as functions to translate keystrokes into characters. The input processing using XKB was inspired from the XKB tutorial.","category":"page"},{"location":"interface/#Mouse-events","page":"WindowAbstractions Interface","title":"Mouse events","text":"","category":"section"},{"location":"interface/","page":"WindowAbstractions Interface","title":"WindowAbstractions Interface","text":"It is a lot simpler to handle mouse events. Mouse state (e.g. which buttons were already pressed before the current mouse event) and pressed/released buttons are simply extracted from related X events, exposed in XCB via xcb_button_press_release_event_t and xcb_button_release_event_t.","category":"page"},{"location":"interface/#Pointer-events","page":"WindowAbstractions Interface","title":"Pointer events","text":"","category":"section"},{"location":"interface/","page":"WindowAbstractions Interface","title":"WindowAbstractions Interface","text":"Pointer events are handled similarly to mouse events. Moving the pointer in the window, as well as leaving or entering it send a X event from which the relevant data is extracted.","category":"page"},{"location":"troubleshooting/#Troubleshooting","page":"Troubleshooting","title":"Troubleshooting","text":"","category":"section"},{"location":"troubleshooting/#ConnectionError","page":"Troubleshooting","title":"ConnectionError","text":"","category":"section"},{"location":"troubleshooting/","page":"Troubleshooting","title":"Troubleshooting","text":"If the X Server returns an error when establishing a connection, an exception of type ConnectionError is raised. One common source of error is a badly set DISPLAY environment variable. Common values are :0 or :1.","category":"page"},{"location":"#XCB.jl","page":"Home","title":"XCB.jl","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"This package wraps the XCB library and exposes bindings for the WindowAbstractions.jl package.","category":"page"},{"location":"","page":"Home","title":"Home","text":"The core API was generated with Clang.jl, from which abstractions were derived.","category":"page"},{"location":"","page":"Home","title":"Home","text":"If you want to use a high-level windowing API, you should see the documentation for the WindowAbstractions package. This documentation is aimed at developers who want to know more about XCB-specific utilities that this package exposes. It also contains a developer documentation, which covers the implementation of the WindowAbstractions interface among other things.","category":"page"},{"location":"","page":"Home","title":"Home","text":"Pages = [\"intro.md\", \"api.md\", \"troubleshooting.md\", \"developer.md\"]","category":"page"}]
}