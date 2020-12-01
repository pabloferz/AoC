include("Day1.jl")
using .Day1


# Solve Part 1
entries, solution = solve(PART1, EXPENSE_REPORT)
#
println("Part 1")
println("------")
println("Entries: $entries")
println("Solution: $solution\n")


# Solve Part 2
entries, solution = solve(PART2, EXPENSE_REPORT)
#
println("Part 2")
println("------")
println("Entries: $entries")
println("Solution: $solution\n")
