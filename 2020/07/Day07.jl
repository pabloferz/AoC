module Day07


include("../../AoC.jl")

using .AoC


load_input() = Dict(parse_rule(line) for line in eachline(joinpath(@__DIR__, "input")))

function parse_rule(line)
    outer, inner = split(line, r" bags contain ")
    list = Dict{String, Int}()
    for m in eachmatch(r"(\d+) (.*?) bag", inner)
        n, bag = m.captures
        list[bag] = parse(Int, n)
    end
    return outer => list
end

init(::Part1) = ("shiny gold", Set{String}())
init(::Part2) = (("shiny gold", 1), nothing)

gather(::Part1, rules, rule) = (k for (k, v) in rules if haskey(v, rule))
gather(::Part2, rules, rule) = ((bag, n) = rule; (k, n * v) for (k, v) in rules[bag])

count!(::Part1, found, rule) = rule in found ? 0 : (push!(found, rule); 1)
count!(::Part2, found, rule) = last(rule)

function solve(p::BothParts, input)
    bags = 0
    start, found = init(p)
    queue = collect(gather(p, input, start))
    while !isempty(queue)
        rule = pop!(queue)
        bags += count!(p, found, rule)
        append!(queue, gather(p, input, rule))
    end
    return bags
end

part1(input = load_input()) = solve(Part1(), input)
part2(input = load_input()) = solve(Part2(), input)


export part1, part2


end  # module Day07
