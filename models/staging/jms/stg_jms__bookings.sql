WITH source AS (
    SELECT * FROM {{ source('jms', 'bookings') }}
),

staged AS (
    SELECT
        booking_id,
        inmate_id,
        booking_date,
        release_date,
        facility_id
    FROM source
)

SELECT * FROM staged
