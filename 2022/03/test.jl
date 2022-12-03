module Test03


include("Day03.jl")

using .Day03
using Test


const kTestInput = load_input(IOBuffer(
"""
vJrwpWtwJgWrhcsFMMfFFhFp
jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
PmmdzqPrVvPwwTWBwg
wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
ttgJtRGJQctTZtZT
CrZsJsPPZsGzwwsLwLmpwMDw
"""
))


@testset "Part 1" begin
    @test part1(kTestInput) == 157
end

@testset "Part 2" begin
    @test part2(kTestInput) == 70
end


end  # Test03
