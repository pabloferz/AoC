module Day1


struct Part1 end
struct Part2 end
const Parts = Union{Part1, Part2}


function solve(::Part1, input::BitSet; verbose = false)
    for a in input
        if (b = 2020 - a) in input
            verbose && @show(a, b)
            return a * b
        end
    end
end

function solve(::Part2, input::BitSet; verbose = false)
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
                verbose && @show(a, b, c)
                return a * b * c
            end
        end
    end
end

solve(p::Parts, input; verbose = false) = solve(p, BitSet(input); verbose = verbose)


const INPUT = BitSet(parse(Int, i) for i in eachline("input"))


export INPUT, Part1, Part2, solve


end  # module Day1
