include("Day1.jl")
using .Day1


# Solve Part 1
println("Part 1")
println("------")
println("Entries:")
println("Solution: $(solve(PART1, EXPENSE_REPORT; verbose = true))\n")


# Solve Part 2
println("Part 2")
println("------")
println("Entries:")
println("Solution: $(solve(PART2, EXPENSE_REPORT; verbose = true))\n")
