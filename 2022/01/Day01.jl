module Day01


include("../../AoC.jl")

using .AoC


function load_input(file = joinpath(@__DIR__, "input"))
    list = parse_ints.(read_split_blocks(file))
    return sort!(sum.(list))
end

part1(input = load_input()) = last(input)
part2(input = load_input()) = (sum ∘ EndSlice(3))(input)


export load_input, part1, part2


end  # module Day01
