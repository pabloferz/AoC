module Day2


struct Part1 end
struct Part2 end


function split_and_parse(line; dlms = ('-', ' ', ':'))
    lo, hi, char, pwd = split(line, dlms, keepempty = false)
    return (parse(Int, lo), parse(Int, hi), first(char), pwd)
end

function matches_policy1(t)
    lo, hi, char, pwd = t
    return lo ≤ count(==(char), pwd) ≤ hi
end
function matches_policy2(t)
    lo, hi, char, pwd = t
    return (pwd[lo] == char) ⊻ (pwd[hi] == char)
end

solve(::Part1, input) = count(matches_policy1, input)
solve(::Part2, input) = count(matches_policy2, input)


const INPUT = split_and_parse.(eachline("input"))


export Part1, Part2, INPUT, split_and_parse, solve


end  # module Day2
