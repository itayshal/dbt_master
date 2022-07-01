WITH source AS (

    SELECT * FROM {{ source('tpch_sf1', 'orders') }}

),

renamed AS (

    SELECT
        o_orderkey,
        o_custkey,
        o_orderstatus,
        o_totalprice,
        o_orderdate,
        o_orderpriority AS o_orderpriority_1,
        o_clerk AS  o_clerk,
        o_shippriority,
        o_comment AS o_comment

    FROM source
    WHERE O_ORDERSTATUS = 'F'

)

SELECT * FROM renamed
