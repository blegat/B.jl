Bug example of [JuliaLang/julia#22355](https://github.com/JuliaLang/julia/issues/22355)
To reproduce:
```julia
julia> Pkg.clone("https://github.com/blegat/A.jl.git")
julia> Pkg.clone("https://github.com/blegat/B.jl.git")
julia> using B
INFO: Precompiling module B.
WARNING: An error occurred during inference. Type inference is now partially disabled.
Base.MethodError(f=typeof(Core.Inference.convert)(), args=(Base.AssertionError, "invalid age range update"), world=0x0000000000000ac2)
unknown function (ip: 0x7fc123746d57)
unknown function (ip: 0x7fc12371e341)
jl_throw at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc123702f0c)
unknown function (ip: 0x7fc123703007)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
Type at ./coreimg.jl:14
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11bae9294)
unknown function (ip: 0x7fc11bae949c)
unknown function (ip: 0x7fc11bafdd07)
unknown function (ip: 0x7fc11bafde3a)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11bafb609)
unknown function (ip: 0x7fc11bafbcb6)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baf7335)
unknown function (ip: 0x7fc11baf7b5e)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baf1472)
unknown function (ip: 0x7fc11baf1ca7)
unknown function (ip: 0x7fc11baf2ad6)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baf0e23)
unknown function (ip: 0x7fc11baf11a0)
unknown function (ip: 0x7fc11baf1ca7)
unknown function (ip: 0x7fc11baf2ad6)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baeb729)
unknown function (ip: 0x7fc11baeca8d)
unknown function (ip: 0x7fc11bafd8fa)
unknown function (ip: 0x7fc11bafdc9e)
unknown function (ip: 0x7fc11bafde3a)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11bafb609)
unknown function (ip: 0x7fc11bafbcb6)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baf7335)
unknown function (ip: 0x7fc11baf7b5e)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baf1472)
unknown function (ip: 0x7fc11baf1ca7)
unknown function (ip: 0x7fc11baf2ad6)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baf0e23)
unknown function (ip: 0x7fc11baf11a0)
unknown function (ip: 0x7fc11baf1ca7)
unknown function (ip: 0x7fc11baf2ad6)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baeb729)
unknown function (ip: 0x7fc11baeca8d)
unknown function (ip: 0x7fc11bafd8fa)
unknown function (ip: 0x7fc11bafdc9e)
unknown function (ip: 0x7fc11bafde3a)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11bafb609)
unknown function (ip: 0x7fc11bafbcb6)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baf7335)
unknown function (ip: 0x7fc11baf7b5e)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baf1472)
unknown function (ip: 0x7fc11baf1ca7)
unknown function (ip: 0x7fc11baf2d4c)
unknown function (ip: 0x7fc11baf3136)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baeac6e)
unknown function (ip: 0x7fc11baeca8d)
unknown function (ip: 0x7fc11bafd8fa)
unknown function (ip: 0x7fc11bafdc9e)
unknown function (ip: 0x7fc11bafde3a)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11bafb609)
unknown function (ip: 0x7fc11bafbcb6)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baf7335)
unknown function (ip: 0x7fc11baf7b5e)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baf1472)
unknown function (ip: 0x7fc11baf1ca7)
unknown function (ip: 0x7fc11baf2d4c)
unknown function (ip: 0x7fc11baf3136)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baeac6e)
unknown function (ip: 0x7fc11baeca8d)
unknown function (ip: 0x7fc11bafd8fa)
unknown function (ip: 0x7fc11bafdc9e)
unknown function (ip: 0x7fc11bafde3a)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11bafb609)
unknown function (ip: 0x7fc11bafbcb6)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baf7335)
unknown function (ip: 0x7fc11baf7b5e)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baf1472)
unknown function (ip: 0x7fc11baf1ca7)
unknown function (ip: 0x7fc11baf2ad6)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baeb729)
unknown function (ip: 0x7fc11baeca8d)
unknown function (ip: 0x7fc11bafd8fa)
unknown function (ip: 0x7fc11bafdc9e)
unknown function (ip: 0x7fc11bafde3a)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11bafb609)
unknown function (ip: 0x7fc11bafbcb6)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baf7335)
unknown function (ip: 0x7fc11baf7b5e)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baf1472)
unknown function (ip: 0x7fc11baf1ca7)
unknown function (ip: 0x7fc11baf2ad6)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baf0e23)
unknown function (ip: 0x7fc11baf11a0)
unknown function (ip: 0x7fc11baf1ca7)
unknown function (ip: 0x7fc11baf2d4c)
unknown function (ip: 0x7fc11baf3136)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baeac6e)
unknown function (ip: 0x7fc11baeca8d)
unknown function (ip: 0x7fc11bafd8fa)
unknown function (ip: 0x7fc11bafdc9e)
unknown function (ip: 0x7fc11bafde3a)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11bafb609)
unknown function (ip: 0x7fc11bafbcb6)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baf7335)
unknown function (ip: 0x7fc11baf7b5e)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baf1472)
unknown function (ip: 0x7fc11baf1ca7)
unknown function (ip: 0x7fc11baf2d4c)
unknown function (ip: 0x7fc11baf3136)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baeac6e)
unknown function (ip: 0x7fc11baecc67)
unknown function (ip: 0x7fc11bb01fb7)
unknown function (ip: 0x7fc11bb0e081)
unknown function (ip: 0x7fc11bb0e42d)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baed42e)
unknown function (ip: 0x7fc11baed832)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
jl_apply_with_saved_exception_state at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc1237009a3)
unknown function (ip: 0x7fc12370353b)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11bb13527)
unknown function (ip: 0x7fc11bb1358b)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc12371996f)
unknown function (ip: 0x7fc123718a9e)
unknown function (ip: 0x7fc1237198a3)
unknown function (ip: 0x7fc1237307e6)
unknown function (ip: 0x7fc123731191)
unknown function (ip: 0x7fc123731a37)
unknown function (ip: 0x7fc12370e316)
jl_load at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11bc6d858)
unknown function (ip: 0x7fc11bc6da3b)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11bb13527)
unknown function (ip: 0x7fc11bb1358b)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc12371996f)
unknown function (ip: 0x7fc123718a9e)
unknown function (ip: 0x7fc1237198a3)
unknown function (ip: 0x7fc1237307e6)
jl_toplevel_eval_in at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
anonymous at ./<missing>:2
unknown function (ip: 0x7fc123730ca6)
jl_toplevel_eval_in at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11bc378d9)
unknown function (ip: 0x7fc11bc378ef)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11bc7638c)
unknown function (ip: 0x7fc11bc78b24)
unknown function (ip: 0x7fc11bc795a8)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x401acb)
unknown function (ip: 0x401502)
__libc_start_main at /usr/bin/../lib/libc.so.6 (unknown line)
unknown function (ip: 0x4015b9)
fatal: error thrown and no exception handler available.
Base.MethodError(f=typeof(Core.Inference.convert)(), args=(Base.AssertionError, "invalid age range update"), world=0x0000000000000ac2)
unknown function (ip: 0x7fc123746d57)
unknown function (ip: 0x7fc12371e341)
jl_throw at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc123702f0c)
unknown function (ip: 0x7fc123703007)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
Type at ./coreimg.jl:14
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11bae9294)
unknown function (ip: 0x7fc11bafce5b)
unknown function (ip: 0x7fc11bafd8e7)
unknown function (ip: 0x7fc11bafdc9e)
unknown function (ip: 0x7fc11bafde3a)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11bafb609)
unknown function (ip: 0x7fc11bafbcb6)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baf7335)
unknown function (ip: 0x7fc11baf7b5e)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baf1472)
unknown function (ip: 0x7fc11baf1ca7)
unknown function (ip: 0x7fc11baf2ad6)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baeb729)
unknown function (ip: 0x7fc11baeca8d)
unknown function (ip: 0x7fc11bafd8fa)
unknown function (ip: 0x7fc11bafdc9e)
unknown function (ip: 0x7fc11bafde3a)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11bafb609)
unknown function (ip: 0x7fc11bafbcb6)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baf7335)
unknown function (ip: 0x7fc11baf7b5e)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baf1472)
unknown function (ip: 0x7fc11baf1ca7)
unknown function (ip: 0x7fc11baf2ad6)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baeb729)
unknown function (ip: 0x7fc11baeca8d)
unknown function (ip: 0x7fc11bafd8fa)
unknown function (ip: 0x7fc11bafdc9e)
unknown function (ip: 0x7fc11bafde3a)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11bafb609)
unknown function (ip: 0x7fc11bafbcb6)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baf7335)
unknown function (ip: 0x7fc11baf7b5e)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baf1472)
unknown function (ip: 0x7fc11baf1ca7)
unknown function (ip: 0x7fc11baf2ad6)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baeb729)
unknown function (ip: 0x7fc11baeca8d)
unknown function (ip: 0x7fc11bafd8fa)
unknown function (ip: 0x7fc11bafdc9e)
unknown function (ip: 0x7fc11bafde3a)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11bafb609)
unknown function (ip: 0x7fc11bafbcb6)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baf7335)
unknown function (ip: 0x7fc11baf7b5e)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baf1472)
unknown function (ip: 0x7fc11baf1ca7)
unknown function (ip: 0x7fc11baf2ad6)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baeb729)
unknown function (ip: 0x7fc11baeca8d)
unknown function (ip: 0x7fc11bafd8fa)
unknown function (ip: 0x7fc11bafdc9e)
unknown function (ip: 0x7fc11bafde3a)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11bafb609)
unknown function (ip: 0x7fc11bafbcb6)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baf7335)
unknown function (ip: 0x7fc11baf7b5e)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baf1472)
unknown function (ip: 0x7fc11baf1ca7)
unknown function (ip: 0x7fc11baf2ad6)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baeb729)
unknown function (ip: 0x7fc11baeca8d)
unknown function (ip: 0x7fc11bafd8fa)
unknown function (ip: 0x7fc11bafdc9e)
unknown function (ip: 0x7fc11bafde3a)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11bafb609)
unknown function (ip: 0x7fc11bafbcb6)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baf7335)
unknown function (ip: 0x7fc11baf7b5e)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baf1472)
unknown function (ip: 0x7fc11baf1ca7)
unknown function (ip: 0x7fc11baf2ad6)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baf0e23)
unknown function (ip: 0x7fc11baf11a0)
unknown function (ip: 0x7fc11baf1ca7)
unknown function (ip: 0x7fc11baf2ad6)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baf0e23)
unknown function (ip: 0x7fc11baf11a0)
unknown function (ip: 0x7fc11baf1ca7)
unknown function (ip: 0x7fc11baf2ad6)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baeb729)
unknown function (ip: 0x7fc11baeca8d)
unknown function (ip: 0x7fc11bafd8fa)
unknown function (ip: 0x7fc11bafdc9e)
unknown function (ip: 0x7fc11bafde3a)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11bafb609)
unknown function (ip: 0x7fc11bafbcb6)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baf7335)
unknown function (ip: 0x7fc11baf7b5e)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baf1472)
unknown function (ip: 0x7fc11baf1ca7)
unknown function (ip: 0x7fc11baf2ad6)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baf0e23)
unknown function (ip: 0x7fc11baf11a0)
unknown function (ip: 0x7fc11baf1ca7)
unknown function (ip: 0x7fc11baf2ad6)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baeb729)
unknown function (ip: 0x7fc11baeca8d)
unknown function (ip: 0x7fc11bafd8fa)
unknown function (ip: 0x7fc11bafdc9e)
unknown function (ip: 0x7fc11bafde3a)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11bafb609)
unknown function (ip: 0x7fc11bafbcb6)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baf7335)
unknown function (ip: 0x7fc11baf7b5e)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baf1472)
unknown function (ip: 0x7fc11baf1ca7)
unknown function (ip: 0x7fc11baf2ad6)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baf2ddf)
unknown function (ip: 0x7fc11baf3136)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baeac6e)
unknown function (ip: 0x7fc11baeca8d)
unknown function (ip: 0x7fc11bafd8fa)
unknown function (ip: 0x7fc11bafdc9e)
unknown function (ip: 0x7fc11bafde3a)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11bafb609)
unknown function (ip: 0x7fc11bafbcb6)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baf7335)
unknown function (ip: 0x7fc11baf7b5e)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baf1472)
unknown function (ip: 0x7fc11baf1ca7)
unknown function (ip: 0x7fc11baf2ad6)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baf0e23)
unknown function (ip: 0x7fc11baf11a0)
unknown function (ip: 0x7fc11baf1ca7)
unknown function (ip: 0x7fc11baf2ad6)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baeb729)
unknown function (ip: 0x7fc11baeca8d)
unknown function (ip: 0x7fc11bafd8fa)
unknown function (ip: 0x7fc11bafdc9e)
unknown function (ip: 0x7fc11bafde3a)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11bafb609)
unknown function (ip: 0x7fc11bafbcb6)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baf7335)
unknown function (ip: 0x7fc11baf7b5e)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baf1472)
unknown function (ip: 0x7fc11baf1ca7)
unknown function (ip: 0x7fc11baf2ad6)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baf0e23)
unknown function (ip: 0x7fc11baf11a0)
unknown function (ip: 0x7fc11baf1ca7)
unknown function (ip: 0x7fc11baf2ad6)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baeb729)
unknown function (ip: 0x7fc11baeca8d)
unknown function (ip: 0x7fc11bafd8fa)
unknown function (ip: 0x7fc11bafdc9e)
unknown function (ip: 0x7fc11bafde3a)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11bafb609)
unknown function (ip: 0x7fc11bafbcb6)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11bb1988b)
unknown function (ip: 0x7fc11bb19c7a)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baf393f)
unknown function (ip: 0x7fc11baf51b6)
unknown function (ip: 0x7fc11baf7b5e)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baf1472)
unknown function (ip: 0x7fc11baf1ca7)
unknown function (ip: 0x7fc11baf2ad6)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baeb729)
unknown function (ip: 0x7fc11baeca8d)
unknown function (ip: 0x7fc11bafd8fa)
unknown function (ip: 0x7fc11bafdc9e)
unknown function (ip: 0x7fc11bafde3a)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11bafb609)
unknown function (ip: 0x7fc11bafbcb6)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baf7335)
unknown function (ip: 0x7fc11baf7b5e)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baf1472)
unknown function (ip: 0x7fc11baf1ca7)
unknown function (ip: 0x7fc11baf2ad6)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baf0e23)
unknown function (ip: 0x7fc11baf11a0)
unknown function (ip: 0x7fc11baf1ca7)
unknown function (ip: 0x7fc11baf2ad6)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baeb729)
unknown function (ip: 0x7fc11baeca8d)
unknown function (ip: 0x7fc11bafd8fa)
unknown function (ip: 0x7fc11bafdc9e)
unknown function (ip: 0x7fc11bafde3a)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11bafb609)
unknown function (ip: 0x7fc11bafbcb6)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baf7335)
unknown function (ip: 0x7fc11baf7b5e)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baf1472)
unknown function (ip: 0x7fc11baf1ca7)
unknown function (ip: 0x7fc11baf2ad6)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baeb729)
unknown function (ip: 0x7fc11baeca8d)
unknown function (ip: 0x7fc11bafd8fa)
unknown function (ip: 0x7fc11bafdc9e)
unknown function (ip: 0x7fc11bafde3a)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11bafb609)
unknown function (ip: 0x7fc11bafbcb6)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baf7335)
unknown function (ip: 0x7fc11baf7b5e)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baf1472)
unknown function (ip: 0x7fc11baf1ca7)
unknown function (ip: 0x7fc11baf2ad6)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baeb729)
unknown function (ip: 0x7fc11baeca8d)
unknown function (ip: 0x7fc11bafd8fa)
unknown function (ip: 0x7fc11bafdc9e)
unknown function (ip: 0x7fc11bafde3a)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11bafb609)
unknown function (ip: 0x7fc11bafbcb6)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baf7335)
unknown function (ip: 0x7fc11baf7b5e)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baf1472)
unknown function (ip: 0x7fc11baf1ca7)
unknown function (ip: 0x7fc11baf2ad6)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baf0e23)
unknown function (ip: 0x7fc11baf11a0)
unknown function (ip: 0x7fc11baf1ca7)
unknown function (ip: 0x7fc11baf2ad6)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baf0e23)
unknown function (ip: 0x7fc11baf11a0)
unknown function (ip: 0x7fc11baf1ca7)
unknown function (ip: 0x7fc11baf2ad6)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baf2ddf)
unknown function (ip: 0x7fc11baf3136)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baeac6e)
unknown function (ip: 0x7fc11baeca8d)
unknown function (ip: 0x7fc11bafd8fa)
unknown function (ip: 0x7fc11bafdc9e)
unknown function (ip: 0x7fc11bafde3a)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11bafb609)
unknown function (ip: 0x7fc11bafbcb6)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baf7335)
unknown function (ip: 0x7fc11baf7b5e)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baf1472)
unknown function (ip: 0x7fc11baf1ca7)
unknown function (ip: 0x7fc11baf2ad6)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baeb729)
unknown function (ip: 0x7fc11baeca8d)
unknown function (ip: 0x7fc11bafd8fa)
unknown function (ip: 0x7fc11bafdc9e)
unknown function (ip: 0x7fc11bafde3a)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11bafb609)
unknown function (ip: 0x7fc11bafbcb6)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baf7335)
unknown function (ip: 0x7fc11baf7b5e)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baf1472)
unknown function (ip: 0x7fc11baf1ca7)
unknown function (ip: 0x7fc11baf2ad6)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baf2ddf)
unknown function (ip: 0x7fc11baf3136)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baeac6e)
unknown function (ip: 0x7fc11baeca8d)
unknown function (ip: 0x7fc11bafd8fa)
unknown function (ip: 0x7fc11bafdc9e)
unknown function (ip: 0x7fc11bafde3a)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11bafb609)
unknown function (ip: 0x7fc11bafbcb6)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baf7335)
unknown function (ip: 0x7fc11baf7b5e)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baf1472)
unknown function (ip: 0x7fc11baf1ca7)
unknown function (ip: 0x7fc11baf2ad6)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baeb729)
unknown function (ip: 0x7fc11baeca8d)
unknown function (ip: 0x7fc11bb01fb7)
unknown function (ip: 0x7fc11bb0e081)
unknown function (ip: 0x7fc11bb0e42d)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11baed42e)
unknown function (ip: 0x7fc11baed832)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
jl_apply_with_saved_exception_state at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc1237009a3)
unknown function (ip: 0x7fc12370353b)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc12371996f)
unknown function (ip: 0x7fc123718a9e)
unknown function (ip: 0x7fc12371a0d9)
unknown function (ip: 0x7fc12371a45c)
unknown function (ip: 0x7fc123730d2f)
jl_toplevel_eval_in at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11bc378d9)
unknown function (ip: 0x7fc11bc378ef)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x7fc11bc78aef)
unknown function (ip: 0x7fc11bc795a8)
jl_apply_generic at /usr/bin/../lib/libjulia.so.0.6 (unknown line)
unknown function (ip: 0x401acb)
unknown function (ip: 0x401502)
__libc_start_main at /usr/bin/../lib/libc.so.6 (unknown line)
unknown function (ip: 0x4015b9)

atexit hook threw an error: Base.MethodError(f=typeof(Core.Inference.convert)(), args=(Base.AssertionError, "invalid age range update"), world=0x0000000000000ac2)ERROR: Failed to precompile B to /home/blegat/.julia/lib/v0.6/B.ji.
Stacktrace:
 [1] macro expansion at ./REPL.jl:97 [inlined]
 [2] (::Base.REPL.##1#2{Base.REPL.REPLBackend})() at ./event.jl:73
```
