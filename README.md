# DoWhile

[![Build Status](https://travis-ci.org/Ismael-VC/DoWhile.jl.svg?branch=master)](https://travis-ci.org/Ismael-VC/DoWhile.jl)

    @do block :while condition

Control flow statement that executes in a **local** scope a `block` of code at least once,
and then repeatedly executes the `block` or not, depending on a given boolean `condition`
after the `:while` symbol at the end of the `block`.

# Examples
```julia
julia> Pkg.clone("https://github.com/Ismael-VC/DoWhile.jl.git")

julia> using DoWhile

julia> i = 0
0

julia> @do begin
           @show i
           i += 1
       end :while i < 5
i = 0
i = 1
i = 2
i = 3
i = 4

julia> @do (
           @show i;
           i += 1
       ) :while i < 5
i = 5

julia> i
6

julia> @do (@show i; i += 1) :while i ≤ 10
i = 6
i = 7
i = 8
i = 9
i = 10

julia> @do begin @show i; i += 1 end :while i ≤ 10
i = 11

julia> i
12
```

# Help
```julia
help?> DoWhile

?help?> @do

julia> @doc DoWhile

julia> @doc @do
