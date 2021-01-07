module Day03


include("../../AoC.jl")

using .AoC


load_input() = encode(eachline(joinpath(@__DIR__, "input")))

function count_trees(input, right, down)
    m, n = size(input)
    trees = 0
    col = row = 1
    while row < m
        row = row + down
        col = mod1(col + right, n)
        trees += input[row, col]
    end
    return trees
end

solve(input, slopes) = prod(count_trees(input, r, d) for (r, d) in slopes)

part1(input = load_input()) = solve(input, ((3, 1),))
part2(input = load_input()) = solve(input, ((1, 1), (3, 1), (5, 1), (7, 1), (1, 2)))


export part1, part2


end  # module Day03
