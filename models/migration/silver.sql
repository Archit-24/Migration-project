WITH raw_data AS (
    SELECT * FROM {{ ref('bronze') }}  -- Reference the bronze table in dbt
),
silver_table AS (
    SELECT 
        Invoice,
        StockCode, 
        Description, 
        Quantity, 
        InvoiceDate, 
        Price,
        Country
    FROM raw_data
    WHERE Country = 'United Kingdom'
)

SELECT * FROM silver_table;