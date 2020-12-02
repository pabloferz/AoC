include("Day2.jl")
using .Day2
using Test

const example = [
    "1-3 a: abcde"
    "1-3 b: cdefg"
    "2-9 c: ccccccccc"
]

@testset "Part 1" begin
    @test solve(Part1(), policy_and_password.(example)) == 2
end

@testset "Part 2" begin
    @test solve(Part2(), policy_and_password.(example)) == 1
end
