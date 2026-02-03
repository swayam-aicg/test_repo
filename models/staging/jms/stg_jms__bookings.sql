WITH source AS (
    SELECT * FROM {{ source('jms', 'bookings') }}
),

staged AS (
    SELECT
        booking_id,
        inmate_id,
        booking_date,
        release_date,
        facility_id,
        -- Fix: Add proper null handling for release_date
        CASE 
            WHEN release_date < booking_date THEN NULL 
            ELSE release_date 
        END AS validated_release_date,
        -- Fix: Add booking duration calculation
        DATEDIFF(day, booking_date, COALESCE(release_date, CURRENT_DATE)) AS days_in_custody
    FROM source
    WHERE booking_id IS NOT NULL
)

SELECT * FROM staged
