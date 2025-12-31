using MosaicPlots
using Test
using Plots

@testset "MosaicPlots.jl" begin
    M = [50 25 15; 40 30 20; 30 20 30]
    
    # Test basic functionality
    p = mosaicplot(M)
    @test p isa Plots.Plot
    
    # Test with labels
    p = mosaicplot(M, 
                   row_labels=["Under 30", "30-60", "Over 60"],
                   col_labels=["Satisfied", "Neutral", "Dissatisfied"],
                   title="Test Plot")
    @test p isa Plots.Plot
end