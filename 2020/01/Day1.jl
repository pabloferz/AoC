module Day1


struct Part1 end
struct Part2 end
const Parts = Union{Part1, Part2}


function solve(::Part1, input::BitSet; verbose = false)
    for x in input
        if (y = 2020 - x) in input
            verbose && @show(x, y)
            return x * y
        end
    end
end

function solve(::Part2, input::BitSet; verbose = false)
    outter = iterate(input)
    while outter !== nothing
        x, state = outter
        u = 2020 - x
        inner = outter = iterate(input, state)
        while inner !== nothing
            y, state = inner
            inner = iterate(input, state)
            y > u && break
            if (z = 2020 - x - y) in input
                verbose && @show(x, y, z)
                return x * y * z
            end
        end
    end
end

solve(p::Parts, input; verbose = false) = solve(p, BitSet(input); verbose = verbose)


const EXPENSE_REPORT = BitSet(parse(Int, i) for i in eachline("input"))
const PART1 = Part1()
const PART2 = Part2()


export EXPENSE_REPORT, PART1, PART2, solve!, solve


end  # module Day1
