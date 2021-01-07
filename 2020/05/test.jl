module Tests05


include("Day05.jl")
using .Day05
using Test


@testset "Seats IDs" begin
    @test Day05.id("BFFFBBFRRR") == 567
    @test Day05.id("FFFBBBFRRR") == 119
    @test Day05.id("BBFFBBFRLL") == 820
end


end  # module Tests05
