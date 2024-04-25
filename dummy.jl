run(`gcc dummy.c -shared -fPIC -o dummy.so`)

dummy = Libc.Libdl.dlopen("./dummy.so")


num_threads = -1
println("in Julia:\t", num_threads)

out = [0.0]
ret = ccall(Libc.Libdl.dlsym(dummy, "very_long"),
    Cint,
    (
        Ptr{Cvoid},
        Csize_t,
        Cstring,
        Cuint,
        Cuint,
        Cdouble,
        Cint,
        Cint,
        Cdouble,
        Cdouble,
        Cdouble,
        Cdouble,
        Cdouble,
        Cdouble,
        Cint,
        Cint,
        Cint,
        Bool, # really bool
        Bool, # really bool
        Cint,
        Cint,
        Ref{Cdouble},
        Csize_t,
        Ref{Ptr{Cvoid}},
    ),
    C_NULL,
    1,
    "dummy",
    1234,
    1,
    2.0,
    1000,
    5,
    0.1,
    0.1,
    0.1,
    0.1,
    0.1,
    0.1,
    1000,
    1000,
    1000,
    (true),
    (false),
    0,
    num_threads, # THIS IS THE ONE THAT GETS PRINTED
    out,
    length(out),
    C_NULL,
)

println("in Julia:\t", ret)
