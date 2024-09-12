WITH silver AS (
    SELECT 
        Invoice
    FROM {{ ref('silver') }}  -- Reference the silver table
    WHERE Country = 'United Kingdom'
),
gold_data AS (
    SELECT 
        COUNT(DISTINCT Invoice) AS invoice_count
    FROM silver
)

SELECT * FROM gold_data;