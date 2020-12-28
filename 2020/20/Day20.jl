module Day20


function encode(lines)
    v = Bool[]
    rows = 0
    for line in lines
        append!(v, c == '#' for c in line)
        rows += 1
    end
    return reshape(v, :, rows)'
end

function parse_tiles(file)
    groups = split(read(file, String), r"\n\n"; keepempty = false)
    tiles = Dict{Int, Matrix{Bool}}()
    for item in groups
        tile = split(item, r"\n"; keepempty = false)
        n, = match(r"(\d+):", popfirst!(tile)).captures
        tiles[parse(Int, n)] = encode(tile)
    end
    return tiles
end

# Borders views
l⭯(tile) = @view tile[:, 1]           # Left CW
b⭯(tile) = @view tile[end, :]         # Bottom CW
r⭯(tile) = @view tile[end:-1:1, end]  # Right CW
t⭯(tile) = @view tile[1, end:-1:1]    # Top CW
l⭮(tile) = @view tile[end:-1:1, 1]    # Left CCW
b⭮(tile) = @view tile[end, end:-1:1]  # Bottom CCW
r⭮(tile) = @view tile[:, end]         # Right CCW
t⭮(tile) = @view tile[1, :]           # Top CCW

function view_borders(tile; only_ccw = true)
    if only_ccw
        return (l⭯(tile), b⭯(tile), r⭯(tile), t⭯(tile))
    end
    return (l⭯(tile), b⭯(tile), r⭯(tile), t⭯(tile), t⭮(tile), r⭮(tile), b⭮(tile), l⭮(tile))
end

function adjacencies(input)
    neighbors = Dict{Int, Set{Int}}()
    for (i, u) in input
        neighbors[i] = Set{Int}()
        bs = view_borders(u)
        for (j, v) in input
            i == j && continue
            bs′ = view_borders(v; only_ccw = false)
            for b in bs, b′ in bs′
                b == b′ && push!(neighbors[i], j)
            end
        end
    end
    return neighbors
end

part1(input) = prod(k for (k, v) in adjacencies(input) if length(v) == 2)

function get_id!(ids, group, dict, i, j)
    k = findfirst(k -> ids[i, j] ∈ dict[k], group)
    id = group[k]
    deleteat!(group, k)
    return id
end

function arrange(neighbors)
    n = isqrt(length(neighbors))
    ids = zeros(Int, (n, n))

    corners  = [k for (k, v) in neighbors if length(v) == 2]
    sides    = [k for (k, v) in neighbors if length(v) == 3]
    interior = [k for (k, v) in neighbors if length(v) == 4]

    # First border
    ids[1, 1] = popfirst!(corners)
    ids[2, 1] = get_id!(ids, sides, neighbors, 1, 1)
    for i = 3:(n - 1)
        ids[i, 1] = get_id!(ids, sides, neighbors, i - 1, 1)
    end
    ids[n, 1] = get_id!(ids, corners, neighbors, n - 1, 1)

    # Rest of borders
    for i = 2:(n - 1)
        ids[1, i] = get_id!(ids, sides, neighbors, 1, i - 1)
        ids[n, i] = get_id!(ids, sides, neighbors, n, i - 1)
    end
    ids[1, n] = get_id!(ids, corners, neighbors, 1, n - 1)
    ids[n, n] = get_id!(ids, corners, neighbors, n, n - 1)
    for i = 2:(n - 1)
        ids[i, n] = get_id!(ids, sides, neighbors, i - 1, n)
    end

    # Interior
    for i = 2:(n - 1), j = 2:(n - 1)
        ids[i, j] = get_id!(ids, interior, neighbors, i - 1, j)
    end

    return ids
end

# Symmetry group of the Square
# Notation from http://mathonline.wikidot.com/the-group-of-symmetries-of-the-square
ρ₀(tile) = tile
ρ₁(tile) = rotl90(tile)
ρ₂(tile) = rot180(tile)
ρ₃(tile) = rotr90(tile)
μ₁(tile) = tile[:, end:-1:1]
μ₂(tile) = tile[end:-1:1, :]
δ₁(tile) = permutedims(tile)
δ₂(tile) = (rot180 ∘ transpose)(tile)

const D₄ = (ρ₀, ρ₁, ρ₂, ρ₃, μ₁, μ₂, δ₁, δ₂)

function reorient_down(tile, ref)
    b = b⭯(ref)
    b == t⭮(tile) && return ρ₀(tile)
    b == r⭮(tile) && return ρ₁(tile)
    b == b⭮(tile) && return ρ₂(tile)
    b == l⭮(tile) && return ρ₃(tile)
    b == t⭯(tile) && return μ₁(tile)
    b == b⭯(tile) && return μ₂(tile)
    b == l⭯(tile) && return δ₁(tile)
    b == r⭯(tile) && return δ₂(tile)
    return nothing
end

function reorient_right(tile, ref)
    b = r⭮(ref)
    b == l⭯(tile) && return ρ₀(tile)
    b == t⭯(tile) && return ρ₁(tile)
    b == r⭯(tile) && return ρ₂(tile)
    b == b⭯(tile) && return ρ₃(tile)
    b == r⭮(tile) && return μ₁(tile)
    b == l⭮(tile) && return μ₂(tile)
    b == t⭮(tile) && return δ₁(tile)
    b == b⭮(tile) && return δ₂(tile)
    return nothing
end

function assemble!(input, ids)
    m = size(ids, 1)
    n = size(first(values(input)), 1) - 2
    image = zeros(Bool, m * n, m * n)
    tile = input[ids[1, 1]]
    for transform in D₄
        corner = transform(tile)
        down = reorient_down(input[ids[2, 1]], corner)
        right = reorient_right(input[ids[1, 2]], corner)
        if down !== nothing && right !== nothing
            image[1:n, 1:n] .= @view corner[2:end-1, 2:end-1]
            input[ids[1, 1]] .= corner
            input[ids[2, 1]] .= down
            input[ids[1, 2]] .= right
            break
        end
    end
    o = (1 - n):0  # Offset
    # Left band of tiles
    for i = 2:m
        tile = input[ids[i, 1]]
        tile .= reorient_down(tile, input[ids[i - 1, 1]])
        image[o .+ (i * n), 1:n] .= @view tile[2:end-1, 2:end-1]
    end
    # Rest of image
    for j = 2:m, i = 1:m
        tile = input[ids[i, j]]
        tile .= reorient_right(tile, input[ids[i, j - 1]])
        image[o .+ (i * n), o .+ (j * n)] .= @view tile[2:end-1, 2:end-1]
    end
    return image
end

const monster = encode([
    "                  # "
    "#    ##    ##    ###"
    " #  #  #  #  #  #   "
])

function part2(input)
    image = assemble!(input, arrange(adjacencies(input)))
    c = CartesianIndex(size(image))
    for transform in D₄
        mask = transform(monster)
        offsets = CartesianIndex(0, 0):(CartesianIndex(size(image) .- size(mask)))
        C = CartesianIndices(mask)
        m = count(o -> (image[(o .+ C)] .& mask) == mask, offsets)
        if m != 0
            return count(image) - m * count(mask)
        end
    end
end


end  # module Day20
