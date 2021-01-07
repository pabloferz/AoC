module Alt01


include("../../AoC.jl")

using .AoC


load_input() = BitSet(parse(Int, i) for i in eachline("input"))

function solve(::Part1, input::BitSet)
    for a in input
        if (b = 2020 - a) in input
            return a * b
        end
    end
end

function solve(::Part2, input::BitSet)
    next = iterate(input)
    while next !== nothing
        a, state = next
        u = 2020 - a
        next = inext = iterate(input, state)
        while inext !== nothing
            b, state = inext
            inext = iterate(input, state)
            b > u && break
            if (c = 2020 - a - b) in input
                return a * b * c
            end
        end
    end
end

solve(p::BothParts, input = load_input()) = solve(p, BitSet(input))


end  # module Alt01
