module Day08


include("../../AoC.jl")

using .AoC


function parse_input(file = joinpath(@__DIR__, "input"))
    lines = readlines(file)
    trees = zeros(Int8, length.((lines, first(lines))))
    for (i, line) in enumerate(lines)
        trees[i, :] .= codeunits(line) .- Int8('0')
    end
    return trees
end

function tree_lines(c, n)
    i, j = Tuple(c)
    U = (reverse(1:i-1), j:j)
    D = (i+1:n, j:j)
    L = (i:i, reverse(1:j-1))
    R = (i:i, j+1:n)
    return (U, D, L, R)
end

probe(trees, c, ranges) = count_to_first(≥(trees[c]), @view trees[ranges...])

function solve(trees, reduce, evaluate)
    n = size(trees, 1)
    return reduce(evaluate(probe.((trees,), (c,), tree_lines(c, n))) for c in CartesianIndices(trees))
    # The following should in theory be faster, but it allocates
    # return reduce(evaluate(probe(trees, c, r) for r in tree_lines(c, n)) for c in CartesianIndices(trees))
end

const kInput = parse_input()
part1(input = kInput) = solve(input, count, Base.Fix1(any, !last))
part2(input = kInput) = solve(input, maximum, Base.Fix1(prod, first))


export parse_input, part1, part2


end  # module Day08
