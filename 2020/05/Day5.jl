module Day5


struct Part1 end
struct Part2 end


id(s) = foldl((x, y) -> (x << 1) | ((y == 'R') | (y == 'B')), s; init = 0)

solve(::Part1, input) = maximum(input)
solve(::Part2, input) = ((α, ω) = extrema(input); only(setdiff(α:ω, input)))


const INPUT = id.(eachline("input"))


export INPUT, Part1, Part2, solve


end  # module Day5
