
-- Project: Retail Business Intelligence
-- Purpose: Analyse sales performance using SQL

-- Query 1: Overall business KPIs
SELECT
    ROUND(SUM(Revenue), 2) AS total_revenue,
    SUM(Quantity) AS total_units_sold,
    COUNT(DISTINCT InvoiceNo) AS total_orders,
    COUNT(DISTINCT StockCode) AS unique_products,
    COUNT(DISTINCT CustomerID) AS identified_customers
FROM retail_sales;

-- Query 2: Monthly revenue ranking
SELECT
    InvoiceMonth,
    ROUND(SUM(Revenue), 2) AS monthly_revenue
FROM retail_sales
GROUP BY InvoiceMonth
ORDER BY monthly_revenue DESC;

-- Query 3: Top 10 products by revenue
SELECT
    Description,
    ROUND(SUM(Revenue), 2) AS total_revenue,
    SUM(Quantity) AS units_sold
FROM retail_sales
GROUP BY Description
ORDER BY total_revenue DESC
LIMIT 10;

-- Query 4: Country performance
SELECT
    Country,
    ROUND(SUM(Revenue), 2) AS total_revenue,
    COUNT(DISTINCT InvoiceNo) AS total_orders
FROM retail_sales
GROUP BY Country
ORDER BY total_revenue DESC;

-- Query 5: Average and median order value
WITH order_totals AS (
    SELECT InvoiceNo, SUM(Revenue) AS order_value
    FROM retail_sales
    GROUP BY InvoiceNo
)
SELECT
    ROUND(AVG(order_value), 2) AS average_order_value,
    ROUND(MEDIAN(order_value), 2) AS median_order_value
FROM order_totals;

-- Query 6: Country revenue contribution
WITH country_sales AS (
    SELECT Country, SUM(Revenue) AS country_revenue
    FROM retail_sales
    GROUP BY Country
)
SELECT
    Country,
    ROUND(country_revenue, 2) AS revenue,
    ROUND(
        100.0 * country_revenue / SUM(country_revenue) OVER (),
        2
    ) AS revenue_share_pct
FROM country_sales
ORDER BY revenue DESC;

-- Query 7: Month-over-month revenue growth
WITH monthly_sales AS (
    SELECT InvoiceMonth, SUM(Revenue) AS revenue
    FROM retail_sales
    GROUP BY InvoiceMonth
),
comparison AS (
    SELECT
        InvoiceMonth,
        revenue,
        LAG(revenue) OVER (ORDER BY InvoiceMonth) AS previous_revenue
    FROM monthly_sales
)
SELECT
    InvoiceMonth,
    ROUND(revenue, 2) AS revenue,
    ROUND(previous_revenue, 2) AS previous_revenue,
    ROUND(
        100.0 * (revenue - previous_revenue)
        / NULLIF(previous_revenue, 0),
        2
    ) AS growth_pct
FROM comparison
ORDER BY InvoiceMonth;

-- Query 8: Top 10 identified customers
SELECT
    CustomerID,
    ROUND(SUM(Revenue), 2) AS customer_revenue,
    COUNT(DISTINCT InvoiceNo) AS order_count
FROM retail_sales
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID
ORDER BY customer_revenue DESC
LIMIT 10;

-- Query 9: Top products by sales volume
SELECT
    StockCode,
    Description,
    SUM(Quantity) AS units_sold
FROM retail_sales
GROUP BY StockCode, Description
ORDER BY units_sold DESC
LIMIT 10;

-- Query 10: Revenue by day of the week
SELECT
    DayOfWeek,
    ROUND(SUM(Revenue), 2) AS revenue,
    COUNT(DISTINCT InvoiceNo) AS order_count
FROM retail_sales
GROUP BY DayOfWeek
ORDER BY CASE DayOfWeek
    WHEN 'Monday' THEN 1
    WHEN 'Tuesday' THEN 2
    WHEN 'Wednesday' THEN 3
    WHEN 'Thursday' THEN 4
    WHEN 'Friday' THEN 5
    WHEN 'Saturday' THEN 6
    WHEN 'Sunday' THEN 7
END;
