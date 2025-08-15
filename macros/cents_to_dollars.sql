{% macro cents_to_dollars(column_name, precision=2) %}
    CAST({{ column_name }} / 100 AS NUMERIC(16, {{ precision }}))
{% endmacro %}
