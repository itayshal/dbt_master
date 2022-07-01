WITH source AS (

    SELECT * FROM {{ source('tpch_sf1', 'part') }}

),

renamed AS (

    SELECT
        p_partkey,
        p_name,
        p_mfgr,
        p_brand,
        p_type,
        p_size,
        p_container,
        p_retailprice,
        p_comment

    FROM source

)

SELECT * FROM renamed
