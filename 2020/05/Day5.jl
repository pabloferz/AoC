module Day5


struct Part1 end
struct Part2 end


id(s) = foldl((x, y) -> (x << 1) | ((y == 'R') | (y == 'B')), s; init = 0)

solve(::Part1, input) = maximum(input)

function solve(::Part2, input)
    lo, hi = extrema(input)
    return only(setdiff(lo:hi, input))
end


const INPUT = id.(eachline("input"))


export INPUT, Part1, Part2, solve


end  # module Day5
