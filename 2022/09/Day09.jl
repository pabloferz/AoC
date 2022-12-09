module Day09


include("../../AoC.jl")

using .AoC


parse_input(file = joinpath(@__DIR__, "input")) = split_sym_int.(eachline(file))

const kStep = Dict(:R => (0, 1), :L => (0, -1), :U => (-1, 0), :D => (1, 0))

function update((t₁, t₂), (h₁, h₂))
    Δ₁, Δ₂ = h₁ - t₁, h₂ - t₂
    abs(Δ₁) ≤ 1 && abs(Δ₂) ≤ 1 && return (t₁, t₂)
    return (t₁ + sign(Δ₁), t₂ + sign(Δ₂))
end

function solve(moves, rope)
    visited = Set((first(rope),))
    for move in moves
        direction, n = move
        C = kStep[direction]
        @inbounds for _ = 1:n
            rope[1] = rope[1] .+ C
            for i in 2:length(rope)
                rope[i] = update(rope[i], rope[i-1])
            end
            push!(visited, rope[end])
        end
    end
    return length(visited)
end

const kInput = parse_input()
part1(input = kInput) = solve(input, fill((0, 0), 2))
part2(input = kInput) = solve(input, fill((0, 0), 10))


export parse_input, part1, part2


end  # module Day09
