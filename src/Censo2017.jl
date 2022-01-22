module Censo2017

export load_census_table

using DataDeps
using DataFrames
using JLD2
using CSV

# TODO: Update dynamically or host in our side
const LINK = "https://github.com/ropensci/censo2017/releases/download/v0.4/files-for-user-db.zip"
const TABLES = [:comunas, :hogares, :personas, :provincias, :regiones, :variables, :variables_codificacion, :viviendas, :zonas]

function __init__()
    return DataDeps.register(
        DataDeps.DataDep(
            "Censo2017",
            "Dataset: Censo2017",
            LINK,
            "03f588ef512473a0570517bc13d5bd7ea3c7e89af74eeff4a76a44ef6086ce54";
            post_fetch_method=zip2db
        ),
    )
end

function zip2db(f)
    @info "Extracting census data..."
    # Unpack
    DataDeps.unpack(f)
    @info "Serializing census data for storage..."
    # Load the CSV File into a CSV Table
    jldopen(f, "w") do file
        censo = JLD2.Group(file, "censo2017")
        for table in TABLES
            @info "Serializing table $(table)..."
            path = "$(table).tsv"
            censo[String(table)] = CSV.read(path, DataFrame)
        end
    end
    @info "Serialization finished. All tables ready."
end

function load_census_table(table_name::Symbol)
    """Load a specific table from the 2017 chilean census.
    Available tables: :comunas, :hogares, :personas, :provincias, :regiones, :variables, :variables_codificacion, :viviendas, :zonas
    """
    if ! (table_name in TABLES)
        throw(ArgumentError("The table doesn't exist in the Census."))
    end
    jldopen(datadep"Censo2017") do file
        return file["censo2017/$(table_name)"]
    end
end

end