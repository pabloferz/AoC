module Test02


include("Day02.jl")

using .Day02
using Test


const kTestInput = load_input(IOBuffer(
"""
A Y
B X
C Z
"""
))


@testset "Part 1" begin
    @test part1(kTestInput) == 15
end

@testset "Part 2" begin
    @test part2(kTestInput) == 12
end


end  # Test02
