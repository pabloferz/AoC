module Test09

include("Day09.jl")

using .Day09
using Test


const kTestInput = parse_input(IOBuffer(
raw"""
R 4
U 4
L 3
D 1
R 4
D 1
L 5
R 2
"""
))


@testset "Part 1" begin
    @test part1(kTestInput) == 13
end

@testset "Part 2" begin
    @test part2(kTestInput) == 1
end


end  # Test09
