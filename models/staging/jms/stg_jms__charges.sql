WITH source AS (
    SELECT * FROM {{ source('jms', 'charges') }}
),

staged AS (
    SELECT
        charge_id,
        booking_id,
        charge_code,
        charge_description,
        charge_date
    FROM source
)

SELECT * FROM staged
