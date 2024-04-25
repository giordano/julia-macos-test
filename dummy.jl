run(`g++ dummy.cpp -shared -fPIC -o dummy.so`)

dummy = Libc.Libdl.dlopen("./dummy.so")


num_threads = -1
println("num_threads in Julia:\t", num_threads)

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
        Cint, # really bool
        Cint, # really bool
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
    Int32(true),
    Int32(false),
    0,
    Int32(-1), # THIS IS THE ONE THAT GETS PRINTED
    out,
    length(out),
    C_NULL,
)

println("ret in Julia:\t\t", ret)
