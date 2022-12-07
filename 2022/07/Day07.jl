module Day07


include("../../AoC.jl")

using .AoC


join_normalize(paths...) = abspath(joinpath(paths..., "./"))

function set_size!(sizes, tree, path)
    sizes[path] = tree[path][2][] + sum(p -> set_size!(sizes, tree, p), tree[path][1]; init = 0)
end

function parse_input(file = joinpath(@__DIR__, "input"))
    pwd = "/"
    tree = Dict(pwd => (String[], Ref(0)))
    for line in eachline(file)
        cd = match(r"\$ cd (.*)", line)
        if !isnothing(cd)
            pwd = join_normalize(pwd, only(cd.captures))
            tree[pwd] = get(tree, pwd, (String[], Ref(0)))
        elseif startswith(line, r"dir ")
            push!(tree[pwd][1], join_normalize(pwd, split(line)[2]))
        elseif startswith(line, r"\d")
            tree[pwd][2][] += parse(Int, split(line)[1])
        end
    end
    paths = sort!(collect(keys(tree)); rev = true)
    sizes = Dict{String, Int}()
    set_size!(sizes, tree, "/")
    return sort!(collect(sizes); by = last)
end

const kInput = parse_input()
part1(input = kInput) = sum(v for (k, v) in input if v ≤ 100000)
part2(input = kInput) = last(input[findfirst(p -> last(p) ≥ last(input[end]) - 40000000, input)])


export parse_input, part1, part2


end  # module Day07
