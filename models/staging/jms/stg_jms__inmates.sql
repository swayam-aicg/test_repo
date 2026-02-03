WITH source AS (
    SELECT * FROM {{ source('jms', 'inmates') }}
),

staged AS (
    SELECT
        inmate_id,
        first_name,
        last_name,
        date_of_birth,
        gender
    FROM source
)

SELECT * FROM staged
