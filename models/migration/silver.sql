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
        Country,
        (Quantity * Price) AS total_value  -- New calculated column for total value
    FROM raw_data
    WHERE Country = 'United Kingdom'  -- Filter by Country
      AND Quantity > 0                -- Filter negative values
      AND Price > 0                   -- Filter negative values
)

SELECT * FROM silver_table;