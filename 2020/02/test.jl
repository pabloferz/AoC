module Tests02


include("Day02.jl")

using .Day02
using Test


const example = Day02.split_and_parse.([
    "1-3 a: abcde"
    "1-3 b: cdefg"
    "2-9 c: ccccccccc"
])

@testset "Part 1" begin
    @test part1(example) == 2
end

@testset "Part 2" begin
    @test part2(example) == 1
end


end  # module Tests02
