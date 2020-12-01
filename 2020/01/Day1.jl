module Day1


struct Part1 end
struct Part2 end


function solve!(::Part1, input; debug = false)
    sort!(input)
    for x in input
        i = searchsortedlast(input, 2020 - x)
        i == 0 && continue
        y = input[i]
        if x + y == 2020
            debug && @show(x, y)
            return x * y
        end
    end
end

function solve!(::Part2, input; debug = false)
    sort!(input)
    for (i, x) in enumerate(input)
        j = searchsortedlast(input, 2020 - x)
        j == 0 && continue
        subinput = view(input, (i + 1):j)
        for y in subinput
            k = searchsortedlast(subinput, 2020 - x - y)
            k == 0 && continue
            z = subinput[k]
            if x + y + z == 2020
                debug && @show(x, y, z)
                return x * y * z
            end
        end
    end
end

solve(p::Union{Part1, Part2}, input; debug = false) = solve!(p, copy(input); debug = debug)


const EXPENSE_REPORT = sort!(parse.(Int, eachline("input")))
const PART1 = Part1()
const PART2 = Part2()


export EXPENSE_REPORT, PART1, PART2, solve!, solve


end  # module Day1
