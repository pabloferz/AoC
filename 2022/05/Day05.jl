module Day05


include("../../AoC.jl")

using .AoC


function parse_input(file = joinpath(@__DIR__, "input"))
    b₁, b₂ = read_split_blocks(file)
    n = parse(Int, only(match(r".*(\d+)\s*", b₁[end]).captures))
    rows = rpad.(b₁[1:end-1], 4n - 1)
    cranes = [Char[] for i = 1:n]
    for row in rows
        for (c, crane) in zip(row[2:4:end], cranes)
            c != ' ' && pushfirst!(crane, c)
        end
    end
    rx = r"move (\d+) from (\d+) to (\d+)"
    procedure = NTuple{3, Int}[]
    for l in b₂
        push!(procedure, NTuple{3}(parse(Int, n) for n in match(rx, l).captures))
    end
    return cranes, procedure
end

function solve(input; push_fn! = push!)
    cranes, procedure = deepcopy(first(input)), last(input)
    slice = Char[]
    for (n, from, to) in procedure
        empty!(slice)
        for _ in 1:n
            push_fn!(slice, pop!(cranes[from]))
        end
        append!(cranes[to], slice)
    end
    return prod(last, cranes)
end

const kInput = parse_input()

part1(input = kInput) = solve(input)
part2(input = kInput) = solve(input; push_fn! = pushfirst!)


export parse_input, part1, part2


end  # module Day05
