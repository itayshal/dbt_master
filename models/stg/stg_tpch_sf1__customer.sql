

WITH source AS (

    SELECT * FROM {{ source('tpch_sf1', 'customer') }}

),

renamed AS (

    SELECT
        c_custkey,
        c_name,
        c_address,
        c_nationkey,
        c_phone,
        c_acctbal,
        c_mktsegment,
        c_comment AS c_comment_1

    FROM source

)

SELECT * FROM renamed
