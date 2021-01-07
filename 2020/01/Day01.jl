module Day01


include("../../AoC.jl")

using .AoC
using Combinatorics


load_input() = read_ints(joinpath(@__DIR__,  "input"))

solve(input, k) = only(prod(ₙCₖ) for ₙCₖ in combinations(input, k) if sum(ₙCₖ) == 2020)

part1(input = load_input()) = solve(input, 2)
part2(input = load_input()) = solve(input, 3)


export part1, part2


end  # module Day01
