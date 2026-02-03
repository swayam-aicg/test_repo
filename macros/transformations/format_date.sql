{% macro format_date(field, format='YYYY-MM-DD', timezone='UTC') %}
    TO_CHAR(CONVERT_TIMEZONE('{{ timezone }}', {{ field }}), '{{ format }}')
{% endmacro %}

{% macro format_timestamp(field, format='YYYY-MM-DD HH24:MI:SS') %}
    TO_CHAR({{ field }}, '{{ format }}')
{% endmacro %}
