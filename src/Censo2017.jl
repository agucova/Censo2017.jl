module Censo2017

export query_census

using DataDeps
using JLD2
using CSV
using DuckDB

include("schema.jl")

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
    # Index each table into the DuckDB database 
    create_and_index("censo2017.db")
end

function create_and_index(db_path)
    @info "Saving to DuckDB database..."
    # Index each table into the DuckDB database 
    con = DuckDB.connect(db_path)
    for table in TABLES
        @info "Creating and populating table $(table)..."
        path = "$(table).tsv"
        # Create the table according to schema
        try
            DuckDB.execute(con, SCHEMAS[table])
            DuckDB.execute(con, "COPY $table FROM '$path' (DELIMITER '\t', HEADER 1, NULL 'NA');")
        catch error
            if error isa DuckDB.DuckDBException
                @error "Error when creating and populating table $table." error
            end
        end
    end
    @info "Indexing finished. All tables ready."
end

function query_census(query::AbstractString)
    """Load a specific table from the 2017 chilean census.
    Available tables: :comunas, :hogares, :personas, :provincias, :regiones, :variables, :variables_codificacion, :viviendas, :zonas
    """
    @info datadep"Censo2017"
    try
        con = DuckDB.connect("$(datadep"Censo2017")/duckdb.sql")
        return DuckDB.toDataFrame(DuckDB.execute(con, query))
    catch error
        if error isa DuckDB.DuckDBException
            @error "Error while connecting to DuckDB or returning its results." error
        end
    end
end

end