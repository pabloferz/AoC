module Tests01


include("Day01.jl")

using .Day01
using Test


const expenses = [1721, 979, 366, 299, 675, 1456]

@testset "Part 1" begin
    @test part1(expenses) == 514579
end

@testset "Part 2" begin
    @test part2(expenses) == 241861950
end


end  # Tests01
