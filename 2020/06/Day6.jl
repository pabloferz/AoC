module Day6


struct Part1 end
struct Part2 end


count(op, input) = sum(g -> length(reduce(op, g)), input)

solve(::Part1, input) = count(∪, input)
solve(::Part2, input) = count(∩, input)


const INPUT = split.(split(read("input", String), r"\n\n"), r"\n", keepempty = false)


export INPUT, Part1, Part2, count, solve


end  # module Day6
