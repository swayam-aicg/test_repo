WITH charges AS (
    SELECT * FROM {{ ref('stg_jms__charges') }}
)

SELECT
    charge_id,
    charge_code,
    charge_description
FROM charges
GROUP BY 1, 2, 3, 4