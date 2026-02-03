WITH demographics AS (
    SELECT * FROM {{ ref('int_inmates__demographics') }}
)

SELECT
    inmate_id,
    first_name,
    last_name,
    date_of_birth,
    gender,
    age
FROM demographics
