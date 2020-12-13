module AoC


struct Part1 end
struct Part2 end


function read_ints(file, sort = false)
    ints = parse.(Int, eachline(file))
    if sort
        sort!(ints)
    end
    return ints
end

read_blocks(file) = split(read(file, String), r"\n\n")
read_split_blocks(file) = split.(read_blocks(file), r"\n", keepempty = false)
read_syms_ints(file) = split_sym_int.(eachline(file))

function split_sym_int(line)
    s, n = match(r"(\w+) ?([+-]?\d+)", line).captures
    return Symbol(s), parse(Int, n)
end


export Part1, Part2, read_ints, read_blocks, read_split_blocks, read_syms_ints


end  # module AoC
