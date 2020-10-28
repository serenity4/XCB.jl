# XCB.jl

This package wraps the [XCB](https://xcb.freedesktop.org/) library and exposes bindings for the [WindowAbstractions.jl](https://github.com/serenity4/WindowAbstractions.jl.git) package.

The core API was generated with [Clang.jl](https://github.com/JuliaInterop/Clang.jl), from which abstractions were derived.

If you want to use a high-level windowing API, you should see the [documentation](https://serenity4.github.io/WindowAbstractions.jl/stable) for the WindowAbstractions package. This documentation is aimed at developers who want to know more about XCB-specific utilities that this package exposes. It also contains a developer documentation, which covers the [implementation](@ref interface) of the WindowAbstractions interface among other things.

```@contents
Pages = ["intro.md", "api.md", "troubleshooting.md", "developer.md"]
```
