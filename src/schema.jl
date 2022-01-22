SCHEMAS = Dict(
    :comunas => """
    CREATE TABLE comunas (
        comuna_ref_id INTEGER NOT NULL,
        provincia_ref_id INTEGER NULL,
        idcomuna VARCHAR NULL,
        redcoden VARCHAR(5) NOT NULL,
        nom_comuna VARCHAR NULL
    )
    """,
    :hogares => """
    CREATE TABLE hogares (
        hogar_ref_id INTEGER NOT NULL,
        vivienda_ref_id INTEGER NULL,
        nhogar INTEGER NULL,
        tipo_hogar INTEGER NULL,
        ncu_yern_nuer INTEGER NULL,
        n_herm_cun INTEGER NULL,
        nuc_herm_cun INTEGER NULL,
        num_sueg_pad_abu INTEGER NULL,
        nuc_pad_sueg_abu INTEGER NULL,
        num_otros INTEGER NULL,
        nuc_otros INTEGER NULL,
        num_no_par INTEGER NULL,
        nuc_no_par INTEGER NULL,
        tot_nucleos INTEGER NULL
    )
    """,
    :personas => """
    CREATE TABLE personas (
        persona_ref_id DOUBLE NULL,
        hogar_ref_id INTEGER NULL,
        personan INTEGER NULL,
        p07 INTEGER NULL,
        p08 INTEGER NULL,
        p09 INTEGER NULL,
        p10 INTEGER NULL,
        p10comuna INTEGER NULL,
        p10pais INTEGER NULL,
        p10pais_grupo INTEGER NULL,
        p11 INTEGER NULL,
        p11comuna INTEGER NULL,
        p11pais INTEGER NULL,
        p11pais_grupo INTEGER NULL,
        p12 INTEGER NULL,
        p12comuna INTEGER NULL,
        p12pais INTEGER NULL,
        p12pais_grupo INTEGER NULL,
        p12a_llegada INTEGER NULL,
        p12a_tramo INTEGER NULL,
        p13 INTEGER NULL,
        p14 INTEGER NULL,
        p15 INTEGER NULL,
        p15a INTEGER NULL,
        p16 INTEGER NULL,
        p16a INTEGER NULL,
        p16a_otro INTEGER NULL,
        p16a_grupo INTEGER NULL,
        p17 INTEGER NULL,
        p18 VARCHAR NULL,
        p19 INTEGER NULL,
        p20 INTEGER NULL,
        p21m INTEGER NULL,
        p21a INTEGER NULL,
        escolaridad INTEGER NULL,
        rec_parentesco INTEGER NULL
    )
    """,
    :provincias => """
    CREATE TABLE provincias (
        provincia_ref_id INTEGER NULL,
        region_ref_id INTEGER NULL,
        idprovincia INTEGER NULL,
        redcoden VARCHAR(3) NOT NULL,
        nom_provincia VARCHAR NULL
    )
    """,
    :regiones => """
    CREATE TABLE regiones (
        region_ref_id INTEGER NOT NULL,
        censo_ref_id INTEGER NULL,
        idregion VARCHAR NULL,
        redcoden VARCHAR(2) NOT NULL,
        nom_region VARCHAR NULL
    )
    """,
    :viviendas => """CREATE TABLE viviendas (
        vivienda_ref_id INTEGER NOT NULL,
        zonaloc_ref_id INTEGER NULL,
        nviv INTEGER NULL,
        p01 INTEGER NULL,
        p02 INTEGER NULL,
        p03a INTEGER NULL,
        p03b INTEGER NULL,
        p03c INTEGER NULL,
        p04 INTEGER NULL,
        p05 INTEGER NULL,
        cant_hog INTEGER NULL,
        cant_per INTEGER NULL,
        ind_hacin DOUBLE NULL,
        ind_hacin_rec INTEGER NULL,
        ind_material INTEGER NULL
    )
    """,
    :variables => """
    CREATE TABLE variables (
        tabla VARCHAR NULL,
        variable VARCHAR NULL,
        descripcion VARCHAR NULL,
        tipo VARCHAR NULL,
        rango VARCHAR NULL
    )
    """,
    :variables_codificacion => """
    CREATE TABLE variables_codificacion (
        tabla VARCHAR NULL,
        variable VARCHAR NULL,
        valor INTEGER NULL,
        descripcion VARCHAR NULL
    )
    """,
    :zonas => """
    CREATE TABLE zonas (
        zonaloc_ref_id INTEGER NOT NULL,
        geocodigo VARCHAR NOT NULL,
        observacion VARCHAR NULL
    )
    """
)