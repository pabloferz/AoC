module Day06


include("../../AoC.jl")

using .AoC


load_input() = read_split_blocks(joinpath(@__DIR__, "input"))

solve(op, input) = sum(g -> length(reduce(op, g)), input)

part1(input = load_input()) = solve(∪, input)
part2(input = load_input()) = solve(∩, input)


export part1, part2


end  # module Day06
