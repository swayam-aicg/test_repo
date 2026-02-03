{% macro cents_to_dollars(amount_cents) %}
    ROUND({{ amount_cents }} / 100.0, 2)
{% endmacro %}

{% macro calculate_age(birth_date) %}
    DATEDIFF(year, {{ birth_date }}, CURRENT_DATE)
{% endmacro %}

{% macro days_between(start_date, end_date) %}
    DATEDIFF(day, {{ start_date }}, COALESCE({{ end_date }}, CURRENT_DATE))
{% endmacro %}
