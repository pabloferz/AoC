module Day04


include("../../AoC.jl")

using .AoC


function load_input(file = joinpath(@__DIR__, "input"))
    return [NTuple{4}(parse(Int, s) for s in split(l, ('-', ','))) for l in eachline(file)]
end

const kInput = load_input()
part1(input = kInput) = count(≤(0), ((a - c) * (b - d) for (a, b, c, d) in input))
part2(input = kInput) = count(≤(0), ((a - d) * (b - c) for (a, b, c, d) in input))


export load_input, part1, part2


end  # module Day04
