WITH source AS (

    SELECT * FROM {{ source('tpch_sf1', 'nation') }}

),

renamed AS (

    SELECT
        n_nationkey,
        n_name,
        n_regionkey,
        n_comment

    FROM source

)

SELECT * FROM renamed
