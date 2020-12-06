module Day5


struct Part1 end
struct Part2 end


const P = 2 .^ (6:-1:0)


function id(s)
    sum(P[i] * (s[i  ] == 'B') for i = 1:7) * 8 + 
    sum(P[i] * (s[i+3] == 'R') for i = 5:7)
end


const INPUT = id.(eachline("input"))


solve(::Part1, input) = maximum(input)
solve(::Part2, input) = (sort!(input); only(setdiff(input[1]:input[end], input)))


export INPUT, Part1, Part2, solve


end  # module Day5
