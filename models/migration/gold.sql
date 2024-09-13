WITH silver AS (
    SELECT 
        Invoice,
        StockCode, 
        Description, 
        Quantity, 
        InvoiceDate, 
        Price,
        Country,
        (Quantity * Price) AS total_value
    FROM {{ ref('silver') }}  -- Reference the silver table
    WHERE Country = 'United Kingdom'
      AND Quantity > 0       -- Filter for valid quantities
      AND Price > 0          -- Filter for valid prices
),
gold_data AS (
    SELECT 
        COUNT(DISTINCT Invoice) AS invoice_count,
        SUM(total_value) AS total_sales_value,    -- Total sales value for the filtered data
        AVG(total_value) AS avg_invoice_value     -- Average sales value per invoice
    FROM silver
)

SELECT * FROM gold_data;
