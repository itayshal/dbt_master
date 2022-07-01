{%- macro example(foo,bar) -%}

with final AS (
    SELECT '{{bar}}' AS aaa
)

SELECT * FROM final

{%- endmacro -%}