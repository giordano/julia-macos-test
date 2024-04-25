run(`gcc dummy.c -shared -fPIC -o dummy.so`)

num_threads = -1
println("in Julia:\t", num_threads)

out = [0.0]
ret = @ccall "./dummy.so".very_long(
    C_NULL::Ptr{Cvoid},
    1::Csize_t,
    "dummy"::Cstring,
    1234::Cuint,
    1::Cuint,
    2.0::Cdouble,
    1000::Cint,
    5::Cint,
    0.1::Cdouble,
    0.1::Cdouble,
    0.1::Cdouble,
    0.1::Cdouble,
    0.1::Cdouble,
    0.1::Cdouble,
    1000::Cint,
    1000::Cint,
    1000::Cint,
    true::Bool,  # really bool
    false::Bool, # really bool
    0::Cint,
    num_threads::Cint, # THIS IS THE ONE THAT GETS PRINTED
    out::Ref{Cdouble},
    length(out)::Csize_t,
    C_NULL::Ref{Ptr{Cvoid}},
)::Cint

println("in Julia:\t", ret)
