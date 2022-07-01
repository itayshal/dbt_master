WITH supplier AS (
    SELECT *
    FROM {{ ref('stg_tpch_sf1__supplier') }}
),

part AS (
    SELECT *
    FROM {{ ref('stg_tpch_sf1__part') }}
),

partsupp AS (
    SELECT *
    FROM {{ ref('stg_tpch_sf1__partsupp') }}
),

final AS (
    SELECT
        s_nationkey,
        max(s_name) AS s_name
    FROM partsupp
         INNER JOIN part ON ps_partkey = p_partkey
         INNER JOIN supplier ON ps_suppkey = s_suppkey
    GROUP BY  s_nationkey
)

SELECT *
FROM final
