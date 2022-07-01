WITH source AS (

    SELECT * FROM {{ source('tpch_sf1', 'partsupp') }}

),

renamed AS (

    SELECT
        ps_partkey,
        ps_suppkey,
        ps_availqty,
        ps_supplycost,
        ps_comment

    FROM source

)

SELECT * FROM renamed
