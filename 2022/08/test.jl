module Test08

include("Day08.jl")

using .Day08
using Test


const kTestInput = parse_input(IOBuffer(
raw"""
30373
25512
65332
33549
35390
"""
))


@testset "Part 1" begin
    @test part1(kTestInput) == 21
end

@testset "Part 2" begin
    @test part2(kTestInput) == 8
end


end  # Test08
