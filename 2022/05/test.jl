module Test05

include("Day05.jl")

using .Day05
using Test


const kTestInput = parse_input(IOBuffer(
"""
    [D]
[N] [C]
[Z] [M] [P]
 1   2   3 

move 1 from 2 to 1
move 3 from 1 to 3
move 2 from 2 to 1
move 1 from 1 to 2
"""
))


@testset "Part 1" begin
    @test part1(kTestInput) == "CMZ"
end

@testset "Part 2" begin
    @test part2(kTestInput) == "MCD"
end


end  # Test05
