WITH inmates AS (
    SELECT * FROM {{ ref('stg_jms__inmates') }}
),

demographics AS (
    SELECT
        inmate_id,
        first_name,
        last_name,
        date_of_birth,
        gender,
        DATEDIFF(year, date_of_birth, CURRENT_DATE) AS age
    FROM inmates
)

SELECT * FROM demographics
