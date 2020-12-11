module Day2Tests


include("Day2.jl")
using .Day2
using Test

import .Day2: split_and_parse


const example = [
    "1-3 a: abcde"
    "1-3 b: cdefg"
    "2-9 c: ccccccccc"
]

@testset "Part 1" begin
    @test solve(Part1(), split_and_parse.(example)) == 2
end

@testset "Part 2" begin
    @test solve(Part2(), split_and_parse.(example)) == 1
end


end # module Day2Tests
