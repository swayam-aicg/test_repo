-- dim_facilities.sql
-- Dimension table for jail facilities

WITH facilities AS (
    SELECT DISTINCT
        facility_id,
        facility_name,
        facility_type,
        capacity,
        address,
        city,
        state,
        zip_code
    FROM {{ source('jms', 'facilities') }}
)

SELECT * FROM facilities
