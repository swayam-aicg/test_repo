WITH source AS (
    SELECT * FROM {{ source('courts', 'hearings') }}
),

staged AS (
    SELECT
        hearing_id,
        case_id,
        hearing_date,
        hearing_type,
        courtroom
    FROM source
)

SELECT * FROM staged
