WITH source AS (
    SELECT * FROM {{ source('jms', 'facilities') }}
),

staged AS (
    SELECT
        facility_id,
        facility_name,
        facility_type,
        capacity,
        address,
        city,
        state,
        zip_code,
        created_at,
        updated_at
    FROM source
)

SELECT * FROM staged
