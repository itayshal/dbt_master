
{%- set columns_to_compare=adapter.get_columns_in_relation(ref('fact'))  -%}

{% set old_etl_relation_query %}
    select * from public.fact
{% endset %}

{% set new_etl_relation_query %}
    select * from {{ ref('fact') }}
{% endset %}

{% if execute %}
    {% for column in columns_to_compare %}
        {{ log('Comparing column "' ~ column.name ~'"', info=True) }}

        {% set audit_query = audit_helper.compare_column_values(
            a_query=old_etl_relation_query,
            b_query=new_etl_relation_query,
            primary_key="C_CUSTKEY",
            column_to_compare=column.name
        ) %}

        {% set audit_results = run_query(audit_query) %}
        {% do audit_results.print_table() %}
        {{ log("", info=True) }}

    {% endfor %}
{% endif %}