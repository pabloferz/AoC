module Day2


struct Part1 end
struct Part2 end


function policy_and_password(line)
    lo, hi, char, pw = split(line, r"[-:\s]", keepempty = false)
    return (
        lo = parse(Int, lo),
        hi = parse(Int, hi),
        char = first(char),
        pw = pw
    )
end


policy1(t) = t.lo ≤ count(==(t.char), t.pw) ≤ t.hi
policy2(t) = (t.pw[t.lo] == t.char) ⊻ (t.pw[t.hi] == t.char)


solve(::Part1, input) = count(policy1, input)
solve(::Part2, input) = count(policy2, input)


const INPUT = [policy_and_password(line) for line in eachline("input")]


export Part1, Part2, INPUT, policy_and_password, solve


end  # module Day2
