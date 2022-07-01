WITH example AS (
    SELECT *
    FROM {{ ref('run_macro_example') }}
),

final AS (

    SELECT
    aaa,
    current_timestamp () as bar

    FROM example

)

SELECT * FROM final

