WITH bookings AS (
    SELECT * FROM {{ ref('fct_bookings') }}
)

SELECT
    DATE_TRUNC('day', booking_date) AS booking_day,
    COUNT(*) AS total_bookings,
    AVG(days_in_custody) AS avg_days_in_custody
FROM bookings
GROUP BY 1
