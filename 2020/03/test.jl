module Day3Tests


include("Day3.jl")
using .Day3
using Test


const example = encode(split("""
    ..##.......
    #...#...#..
    .#....#..#.
    ..#.#...#.#
    .#...##..#.
    ..#.##.....
    .#.#.#....#
    .#........#
    #.##...#...
    #...##....#
    .#..#...#.#""",
    '\n'
))


@testset "Part 1" begin
    @test solve(Part1(), example) == 7
end

@testset "Part 2" begin
    @test solve(Part2(), example) == 336
end


end
