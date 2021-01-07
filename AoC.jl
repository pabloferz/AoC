module AoC


struct Part1 end
struct Part2 end
const BothParts = Union{Part1, Part2}


function encode(lines; dict = Dict('#' => true, '.' => false))
    v = eltype(values(dict))[]
    rows = 0
    for line in lines
        append!(v, dict[c] for c in line)
        rows += 1
    end
    return reshape(v, :, rows)'
end

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


export BothParts, Part1, Part2,
    encode, read_ints, read_blocks, read_split_blocks, read_syms_ints


end  # module AoC
