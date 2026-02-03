WITH booking_history AS (
    SELECT * FROM {{ ref('int_inmates__booking_history') }}
),

inmate_bookings AS (
    SELECT
        inmate_id,
        COUNT(*) AS total_bookings
    FROM booking_history
    GROUP BY 1
)

SELECT
    CASE 
        WHEN total_bookings = 1 THEN 'First Time'
        WHEN total_bookings BETWEEN 2 AND 3 THEN 'Repeat (2-3)'
        ELSE 'Frequent (4+)'
    END AS recidivism_category,
    COUNT(*) AS inmate_count
FROM inmate_bookings
GROUP BY 1
