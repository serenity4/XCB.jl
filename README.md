# XCB

![tests](https://github.com/JuliaGL/XCB.jl/workflows/Run%20tests/badge.svg) [![](https://travis-ci.com/JuliaGL/XCB.jl.svg?branch=master)](https://travis-ci.com/github/JuliaGL/XCB.jl) [![](https://img.shields.io/badge/docs-stable-blue.svg)](https://juliagl.github.io/XCB.jl/stable) [![](https://img.shields.io/badge/docs-dev-blue.svg)](https://juliagl.github.io/XCB.jl/dev)

Wrapper around the [X protocol C-language Binding (XCB)](https://xcb.freedesktop.org/) library for interacting with X window systems.
Includes a Clang-generated library wrapper along with a few abstractions including setting up connections, graphics contexts and windows, handling input events, and running a window. For more information, see the [package documentation](https://serenity.github.io/XCB.jl/stable).
Users wishing to use the Clang wrapper directly will have to use `XCB.Libxcb`. For documentation, they should refer to the [XCB documentation](https://xcb.freedesktop.org/).
