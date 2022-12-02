module Day02


include("../../AoC.jl")

using .AoC


const kGames = ['A'; 'B'; 'C'] .* ' ' .* ['X' 'Y' 'Z']
const kScores1 = Dict(kGames .=> [4 8 3; 1 5 9; 7 2 6])
const kScores2 = Dict(kGames .=> [3 4 8; 1 5 9; 2 6 7])


load_input(file = joinpath(@__DIR__, "input")) = readlines(file)

solve(input, scores) = sum(scores[game] for game in input)

part1(input = load_input()) = solve(input, kScores1)
part2(input = load_input()) = solve(input, kScores2)


export load_input, part1, part2


end  # module Day02
