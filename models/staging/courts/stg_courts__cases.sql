WITH source AS (
    SELECT * FROM {{ source('courts', 'cases') }}
),

staged AS (
    SELECT
        case_id,
        case_number,
        case_type,
        filed_date,
        status
    FROM source
)

SELECT * FROM staged
