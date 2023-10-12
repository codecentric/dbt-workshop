{# See https://github.com/EqualExperts/dbt-unit-testing#requirement #}
{% macro ref() %}
   {{ return(dbt_unit_testing.ref(*varargs, **kwargs)) }}
{% endmacro %}

{% macro source() %}
   {{ return(dbt_unit_testing.source(*varargs, **kwargs)) }}
{% endmacro %}
