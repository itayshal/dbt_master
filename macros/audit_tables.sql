{# in dbt Develop #}

{% set old_etl_relation=adapter.get_relation(
      database=target.database,
      schema="PUBLIC",
      identifier="FACT"
) -%}

{% set dbt_relation=ref('fact') %}

{{ audit_helper.compare_relations(
    a_relation=old_etl_relation,
    b_relation=dbt_relation,
    primary_key="C_CUSTKEY"
) }}