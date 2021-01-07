module Tests06


include("Day06.jl")
using .Day06
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

const example = split.(split(raw_example, r"\R\R"), r"\R", keepempty = false)

@testset "Part 1" begin
    @test part1(example) == 11
end

@testset "Part 2" begin
    @test part2(example) == 6
end


end  # module Tests06
