module Day3


struct Part1 end
struct Part2 end


function encode(lines)
    b = Bool[]
    rows = 0
    for line in lines
        append!(b, c == '#' for c in line)
        rows += 1
    end
    cols = div(length(b), rows)
    return reshape(b, (cols, rows))'
end

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


const INPUT = encode(eachline("input"))
const SLOPES = ((1, 1), (3, 1), (5, 1), (7, 1), (1, 2))


solve(::Part1, input) = count_trees(input, 3, 1)
solve(::Part2, input; slopes = SLOPES) = prod(count_trees(input, r, d) for (r, d) in slopes)


export INPUT, Part1, Part2, encode, solve


end  # module Day3
