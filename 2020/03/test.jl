module Tests03


include("../../AoC.jl")
include("Day03.jl")

using .AoC
using .Day03
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
    @test part1(example) == 7
end

@testset "Part 2" begin
    @test part2(example) == 336
end


end  # Tests03
