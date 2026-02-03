WITH bookings AS (
    SELECT * FROM {{ ref('stg_jms__bookings') }}
)

SELECT
    booking_date AS date,
    COUNT(DISTINCT inmate_id) AS daily_population
FROM bookings
WHERE release_date IS NULL OR release_date >= booking_date
GROUP BY 1
