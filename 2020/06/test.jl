module Day6Tests


include("Day6.jl")
using .Day6
using Test


const raw_example = """
abc

a
b
c

ab
ac

a
a
a
a

b
"""

const example = split.(split(raw_example, r"\n\n"), r"\n", keepempty = false)



@testset "Part 1" begin
    @test solve(Part1(), example) == 11
end

@testset "Part 2" begin
    @test solve(Part2(), example) == 6
end


end
