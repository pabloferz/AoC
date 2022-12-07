module Test06

include("Day06.jl")

using .Day06
using Test


const kTestInput = parse_input(IOBuffer(
    "mjqjpqmgbljsphdztnvjfqwrcgsmlb"
))


@testset "Part 1" begin
    @test part1(kTestInput) == 7
end

@testset "Part 2" begin
    @test part2(kTestInput) == 19
end


end  # Test06
