{% macro clean_name(field) %}
    TRIM(UPPER({{ field }}))
{% endmacro %}
