include("Day1.jl")
using .Day1
using Test


const expense_report = [1721, 979, 366, 299, 675, 1456]


@testset "Part 1" begin
    @test solve(PART1, expense_report) == 514579
end


@testset "Part 2" begin
    @test solve(PART2, expense_report) == 241861950
end
