module Day4


struct Part1 end
struct Part2 end


const INPUT = split(String(read("input")), r"\n\n")

const FIELDS1 = (r"byr", r"iyr", r"eyr", r"hgt", r"hcl", r"ecl", r"pid")

const FIELDS2 = (
    r"byr:(19[2-9][0-9]|200[0-2])\b",
    r"iyr:20(1[0-9]|20)\b",
    r"eyr:20(2[0-9]|30)\b",
    r"hgt:(1([5-8][0-9]|9[0-3])cm|(59|6[0-9]|7[0-6])in)\b",
    r"hcl:#[0-9a-f]{6}\b",
    r"ecl:(amb|blu|brn|gry|grn|hzl|oth)\b",
    r"pid:\d{9}\b"
)


solve(input, fields) = count(p -> all(r -> contains(p, r), fields), input)

solve(::Part1, input) = solve(input, FIELDS1)
solve(::Part2, input) = solve(input, FIELDS2)


export INPUT, Part1, Part2, solve


end  # module Day4
