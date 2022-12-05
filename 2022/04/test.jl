module Test04

include("Day04.jl")

using .Day04
using Test


const kTestInput = load_input(IOBuffer(
"""
2-4,6-8
2-3,4-5
5-7,7-9
2-8,3-7
6-6,4-6
2-6,4-8
"""
))


@testset "Part 1" begin
    @test part1(kTestInput) == 2
end

@testset "Part 2" begin
    @test part2(kTestInput) == 4
end


end  # Test04
