module Day07


include("../../AoC.jl"); using .AoC


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
init(::Part2) = (("shiny gold", 1), Tuple{String,Int}[])

gather(::Part1, rules, rule) = (k for (k, v) in rules if haskey(v, rule))
gather(::Part2, rules, rule) = ((bag, n) = rule; (k, n * v) for (k, v) in rules[bag])

count(::Part1, found) = length(found)
count(::Part2, found) = sum(last, found)

function solve(p::Union{Part1, Part2}, input)
    start, found = init(p)
    queue = collect(gather(p, input, start))
    while !isempty(queue)
        rule = pop!(queue)
        push!(found, rule)
        append!(queue, gather(p, input, rule))
    end
    return count(p, found)
end


const INPUT = Dict(parse_rule(line) for line in eachline("input"))


export INPUT, Part1, Part2, solve


end  # module Day07
