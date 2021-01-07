module Day02


include("../../AoC.jl")

using .AoC


load_input() = split_and_parse.(eachline(joinpath(@__DIR__, "input")))

function split_and_parse(line; dlms = ('-', ' ', ':'))
    lo, hi, char, pwd = split(line, dlms, keepempty = false)
    return (parse(Int, lo), parse(Int, hi), first(char), pwd)
end

matches_policy1(t) = ( (lo, hi, char, pwd) = t; lo ≤ count(==(char), pwd) ≤ hi )
matches_policy2(t) = ( (lo, hi, char, pwd) = t; (pwd[lo] == char) ⊻ (pwd[hi] == char) )

part1(input = load_input()) = count(matches_policy1, input)
part2(input = load_input()) = count(matches_policy2, input)


export part1, part2


end  # module Day02
