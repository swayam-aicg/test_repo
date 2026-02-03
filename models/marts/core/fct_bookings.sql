WITH booking_history AS (
    SELECT * FROM {{ ref('int_inmates__booking_history') }}
),

charges AS (
    SELECT * FROM {{ ref('stg_jms__charges') }}
)

SELECT
    bh.booking_id,
    bh.inmate_id,
    bh.booking_date,
    bh.release_date,
    bh.days_in_custody,
    COUNT(c.charge_id) AS total_charges
FROM booking_history bh
LEFT JOIN charges c ON bh.booking_id = c.booking_id
GROUP BY 1, 2, 3, 4, 5
