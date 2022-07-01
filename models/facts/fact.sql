{{ config(
    tags=["marketing","sales"]
) }}

WITH customer AS (
    SELECT *
    FROM {{ ref('customer') }}
),

supplier AS (
    SELECT *
    FROM {{ ref('supplier') }}
),

region AS (
    SELECT *
    FROM {{ ref('region') }}
),

final AS (
    SELECT
        customer.c_custkey,
        customer.c_nationkey,
        supplier.s_name,
        region.r_name as r_name_2
    FROM customer
         INNER JOIN supplier ON c_nationkey = s_nationkey
         INNER JOIN region ON n_regionkey = r_regionkey
)

SELECT *
FROM final
