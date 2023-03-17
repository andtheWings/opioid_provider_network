library(targets)



# Set target-specific options such as packages.
tar_option_set(
    packages = c(
        "dplyr", "readr",
        "ggraph", "tidygraph"
    )
)

# End this file with a list of target objects.
list(
    tar_target(
        nodes_raw_file,
        "data/deidentified_providers.csv",
        format = "file"
    ),
    tar_target(
        edges_raw_file,
        "data/edges.csv",
        format = "file"
    ),
    tar_target(
        nodes_raw,
        read_csv(nodes_raw_file) |> 
            mutate(ID = as.character(ID))
    ),
    tar_target(
        edges_raw,
        read_csv(edges_raw_file) |> 
            rename(from = SOURCE, to = TARGET)
    )
)
