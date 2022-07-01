WITH customer AS (
    SELECT *
    FROM {{ ref('stg_tpch_sf1__customer') }}
),

nation AS (
    SELECT *
    FROM {{ ref('stg_tpch_sf1__nation') }}
),

final AS (
    SELECT
        c_nationkey,
        c_custkey,
        max(n_regionkey) AS n_regionkey
    FROM customer
         INNER JOIN nation ON c_nationkey = n_nationkey
    GROUP BY c_nationkey, c_custkey
)

SELECT *
FROM final
