WITH bookings AS (
    SELECT * FROM {{ ref('stg_jms__bookings') }}
),

inmates AS (
    SELECT * FROM {{ ref('stg_jms__inmates') }}
),

booking_history AS (
    SELECT
        i.inmate_id,
        i.first_name,
        i.last_name,
        b.booking_id,
        b.booking_date,
        b.release_date,
        DATEDIFF(day, b.booking_date, COALESCE(b.release_date, CURRENT_DATE)) AS days_in_custody
    FROM inmates i
    LEFT JOIN bookings b ON i.inmate_id = b.inmate_id
)

SELECT * FROM booking_history
