module Test01


include("Day01.jl")

using .Day01
using Test


const kCalories = load_input(IOBuffer(
"""
1000
2000
3000

4000

5000
6000

7000
8000
9000

10000
"""
))


@testset "Part 1" begin
    @test part1(kCalories) == 24000
end

@testset "Part 2" begin
    @test part2(kCalories) == 45000
end


end  # Test01
