module Day05


include("../../AoC.jl")

using .AoC


load_input() = id.(eachline(joinpath(@__DIR__, "input")))

id(s) = foldl((x, y) -> (x << 1) | ((y == 'R') | (y == 'B')), s; init = 0)

#function id(s; codes = Dict('F' => '0', 'B' => '1', 'L' => '0', 'R' => '1'))
#    return parse(Int, map(c -> codes[c], s); base = 2)
#end

part1(input = load_input()) = maximum(input)
part2(input = load_input()) = ((α, ω) = extrema(input); only(setdiff(α:ω, input)))


export part1, part2


end  # module Day05
