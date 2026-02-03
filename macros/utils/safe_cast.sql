{% macro safe_cast(field, type, default_value=none) %}
    {%- if default_value is not none -%}
        COALESCE(TRY_CAST({{ field }} AS {{ type }}), {{ default_value }})
    {%- else -%}
        TRY_CAST({{ field }} AS {{ type }})
    {%- endif -%}
{% endmacro %}
