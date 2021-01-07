module Day04


include("../../AoC.jl")

using .AoC


load_input() = read_blocks(joinpath(@__DIR__, "input"))

fields1() = (r"byr", r"iyr", r"eyr", r"hgt", r"hcl", r"ecl", r"pid")

fields2() = (
    r"byr:(19[2-9][0-9]|200[0-2])\b",
    r"iyr:20(1[0-9]|20)\b",
    r"eyr:20(2[0-9]|30)\b",
    r"hgt:(1([5-8][0-9]|9[0-3])cm|(59|6[0-9]|7[0-6])in)\b",
    r"hcl:#[0-9a-f]{6}\b",
    r"ecl:(amb|blu|brn|gry|grn|hzl|oth)\b",
    r"pid:\d{9}\b"
)

solve(input, fields) = count(p -> all(r -> contains(p, r), fields), input)

part1(input = load_input()) = solve(input, fields1())
part2(input = load_input()) = solve(input, fields2())


export part1, part2


end  # module Day04
