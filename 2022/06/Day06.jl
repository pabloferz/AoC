module Day06


include("../../AoC.jl")

using .AoC


parse_input(file = joinpath(@__DIR__, "input")) = readchomp(file)

const kInput = parse_input()

function solve(str, m)
    i = m
    for outer i = m:length(str)
        allunique(@view str[i-m+1:i]) && break
    end
    return i
end
part1(input = kInput) = solve(input, 4)
part2(input = kInput) = solve(input, 14)


export parse_input, part1, part2


end  # module Day06
