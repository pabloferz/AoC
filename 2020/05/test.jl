module Day5Tests


include("Day5.jl")
using .Day5
using Test


const example = nothing


@testset "Seats IDs" begin
    @test Day5.id("BFFFBBFRRR") == 567
    @test Day5.id("FFFBBBFRRR") == 119
    @test Day5.id("BBFFBBFRLL") == 820
end


end
