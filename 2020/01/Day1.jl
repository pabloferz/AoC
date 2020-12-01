module Day1


using Combinatorics


struct Part1 end
struct Part2 end


function solve(::Part1, expense_report)
    sort!(expense_report)
    for entry in expense_report
        i = searchsortedlast(expense_report, 2020 - entry)
        complement = expense_report[i]
        if entry + complement == 2020
            return (entry, complement), entry * complement
        end
    end
end

function solve(::Part2, expense_report)
    for (l, m, n) in combinations(expense_report, 3)
        if l + m + n == 2020
            return (l, m, n), l * m * n
        end
    end
end


const EXPENSE_REPORT = sort!(parse.(Int, eachline("input")))
const PART1 = Part1()
const PART2 = Part2()


export EXPENSE_REPORT, PART1, PART2, solve


end  # module Day1
