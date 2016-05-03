"""
    @do block :while condition

Control flow statement that executes a `block` of code at least once,
and then repeatedly executes the `block` in a **local** scope or not,
depending on a given boolean `condition` after the `:while` symbol at
the end of the `block`.

# Examples
```julia
julia> Pkg.clone("")

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
```
"""
module DoWhile

export @do

let
    do_while = quote
        macro fo(block, sym, cond)
            s = sym.args[1]
            s != :while && error("@do expected :while symbol, got :$s")

            quote
                let
                    $(esc(block))
                    while $(esc(cond))
                        $(esc(block))
                    end
                end
            end
        end
    end

    do_while.args[2].args[1].args[1] = :do

    eval(do_while)
end

@doc (@doc DoWhile) :(@do)


end # module
