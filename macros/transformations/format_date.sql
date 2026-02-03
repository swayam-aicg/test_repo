{% macro format_date(field, format='YYYY-MM-DD') %}
    TO_CHAR({{ field }}, '{{ format }}')
{% endmacro %}
