WITH source AS (

    SELECT * FROM {{ source('tpch_sf1', 'supplier') }}

),

renamed AS (

    SELECT
        s_suppkey,
        s_name,
        s_address,
        s_nationkey,
        s_phone,
        s_acctbal,
        s_comment

    FROM source

)

SELECT * FROM renamed
