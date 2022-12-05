module Day03


include("../../AoC.jl")

using .AoC


const kPriorities = Dict(k => v for (v, k) in enumerate(prod('a':'z') * prod('A':'Z')))


load_input(file = joinpath(@__DIR__, "input")) = readlines(file)

split_half(str) = (n = length(str) ÷ 2; (str[1:n], str[n+1:end]))

solve(input, f, indices) = sum(kPriorities[(only ∘ ∩)(f(i)...)] for i in indices)

part1(input = load_input()) = solve(input, i -> split_half(input[i]), 1:length(input))
part2(input = load_input()) = solve(input, i -> input[(0:2) .+ i], 1:3:length(input))


export load_input, part1, part2


end  # module Day03
