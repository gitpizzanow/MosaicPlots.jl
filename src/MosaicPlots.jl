module MosaicPlots

using Plots

export mosaicplot

"""
    mosaicplot(M::Matrix; row_labels=nothing, col_labels=nothing, title="Mosaic Plot", kwargs...)

Create a stacked bar plot from a matrix M.

# Arguments
- `M::Matrix`: Data matrix where rows are groups and columns are categories
- `row_labels`: Labels for rows (groups), e.g., ["Under 30", "30-60", "Over 60"]
- `col_labels`: Labels for columns (categories), e.g., ["Satisfied", "Neutral", "Dissatisfied"]
- `title`: Plot title (default: "Mosaic Plot")
- `ylabel`: Y-axis label (default: "Count")
- `colors`: Color scheme (default: [:blue, :orange, :green])
- `size`: Plot size (default: (600, 400))
- Additional kwargs are passed to groupedbar

# Examples
```julia
M = [50 25 15; 40 30 20; 30 20 30]
mosaicplot(M)

# With labels
mosaicplot(M, 
    row_labels=["Under 30", "30-60", "Over 60"],
    col_labels=["Satisfied", "Neutral", "Dissatisfied"],
    title="Satisfaction by Age Group")
```
"""
function mosaicplot(M::Matrix; 
                   row_labels=nothing,
                   col_labels=nothing,
                   title="Mosaic Plot",
                   ylabel="Count",
                   colors=[:blue, :orange, :green],
                   size=(600, 400),
                   kwargs...)
    
    nrows, ncols = size(M)
    
    # Default labels if not provided
    if isnothing(row_labels)
        row_labels = ["Group $i" for i in 1:nrows]
    end
    
    if isnothing(col_labels)
        col_labels = ["Category $i" for i in 1:ncols]
    end
    
    # Create the plot
    p = groupedbar(M', 
                   bar_position=:stack,
                   labels=permutedims(row_labels),
                   xticks=(1:ncols, col_labels),
                   ylabel=ylabel,
                   title=title,
                   legend=:topright,
                   color=colors[1:nrows],
                   size=size;
                   kwargs...)
    
    return p
end

end # module