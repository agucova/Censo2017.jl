using Censo2017
using Documenter

DocMeta.setdocmeta!(Censo2017, :DocTestSetup, :(using Censo2017); recursive=true)

makedocs(;
    modules=[Censo2017],
    authors="Agustín Covarrubias <agucova@uc.cl> and contributors",
    repo="https://github.com/agucova/Censo2017.jl/blob/{commit}{path}#{line}",
    sitename="Censo2017.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://agucova.github.io/Censo2017.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/agucova/Censo2017.jl",
    devbranch="main",
)
