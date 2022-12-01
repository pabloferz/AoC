module AoC


using HTTP


struct Part1 end
struct Part2 end
const BothParts = Union{Part1, Part2}

struct EndSlice
    n::Int
end

(s::EndSlice)(v) = @view v[(end - s.n + 1):end]


function get_input(year, day; session_cookie_file = joinpath(@__DIR__, "session-cookie"))
    session_cookie = (first ∘ eachline)(session_cookie_file)
    result = HTTP.get(
        "https://adventofcode.com/$year/day/$day/input";
        cookies = Dict("session" => session_cookie)
    )
    result.status != 200 && error("Unable to download input")
    input_file = joinpath(@__DIR__, string(year), lpad(day, 2, '0'), "input")
    open(input_file, "w+") do io
        write(io, result.body)
    end
    return nothing
end

function encode(lines; dict = Dict('#' => true, '.' => false))
    v = eltype(values(dict))[]
    rows = 0
    for line in lines
        append!(v, dict[c] for c in line)
        rows += 1
    end
    return reshape(v, :, rows)'
end

parse_ints(list) = parse.(Int, list)

function read_ints(file, sort = false)
    ints = parse.(Int, eachline(file))
    if sort
        sort!(ints)
    end
    return ints
end

read_blocks(file) = split(read(file, String), r"\R\R", keepempty = false)
read_split_blocks(file) = split.(read_blocks(file), r"\R", keepempty = false)
read_syms_ints(file) = split_sym_int.(eachline(file))

function split_sym_int(line)
    s, n = match(r"(\w+) ?([+-]?\d+)", line).captures
    return Symbol(s), parse(Int, n)
end


export BothParts, EndSlice, Part1, Part2,
    encode, get_input, parse_ints, read_ints, read_blocks, read_split_blocks, read_syms_ints


end  # module AoC
