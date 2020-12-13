module Day07Tests


include("Day07.jl")
using .Day07
using Test

import .Day07: parse_rule


const example = Dict(parse_rule.([
    "light red bags contain 1 bright white bag, 2 muted yellow bags."
    "dark orange bags contain 3 bright white bags, 4 muted yellow bags."
    "bright white bags contain 1 shiny gold bag."
    "muted yellow bags contain 2 shiny gold bags, 9 faded blue bags."
    "shiny gold bags contain 1 dark olive bag, 2 vibrant plum bags."
    "dark olive bags contain 3 faded blue bags, 4 dotted black bags."
    "vibrant plum bags contain 5 faded blue bags, 6 dotted black bags."
    "faded blue bags contain no other bags."
    "dotted black bags contain no other bags."
]))

const another_example = Dict(parse_rule.([
    "shiny gold bags contain 2 dark red bags."
    "dark red bags contain 2 dark orange bags."
    "dark orange bags contain 2 dark yellow bags."
    "dark yellow bags contain 2 dark green bags."
    "dark green bags contain 2 dark blue bags."
    "dark blue bags contain 2 dark violet bags."
    "dark violet bags contain no other bags."
]))


@testset "Part 1" begin
    @test solve(Part1(), example) == 4
end

@testset "Part 2" begin
    @test solve(Part2(), example) == 32
    @test solve(Part2(), another_example) == 126
end


end  # module Day07Tests
