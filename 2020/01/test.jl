include("Day1.jl")
using .Day1
using Test


const expenses = [1721, 979, 366, 299, 675, 1456]


@testset "Part 1" begin
    @test solve(Part1(), expenses) == 514579
end


@testset "Part 2" begin
    @test solve(Part2(), expenses) == 241861950
end
