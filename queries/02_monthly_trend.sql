-- ================================================
-- Analysis 2: Monthly Revenue Trend
-- Business Question: Is the business growing 
-- month over month? What drives the growth?
--
-- Finding: Revenue grew 26x from $2,999 (Mar 2012) 
-- to $78,951 (Mar 2015). Both volume and average 
-- order value increased over time.
-- ================================================

-- Monthly revenue, profit, order volume and average order value
SELECT 
    YEAR(created_at) AS yr,
    MONTH(created_at) AS mo,
    SUM(price_usd) AS revenue,
    SUM(price_usd) - SUM(cogs_usd) AS profit,
    COUNT(order_id) AS total_orders,
    AVG(price_usd) AS avg_order_value
FROM orders
GROUP BY YEAR(created_at), MONTH(created_at)
ORDER BY YEAR(created_at), MONTH(created_at);


-- ================================================
-- Advanced Version: Month over Month Growth %
-- using Window Function (LAG)
-- ================================================

SELECT 
    YEAR(created_at) AS yr,
    MONTH(created_at) AS mo,
    SUM(price_usd) AS revenue,
    SUM(price_usd) - SUM(cogs_usd) AS profit,
    COUNT(order_id) AS total_orders,
    AVG(price_usd) AS avg_order_value,
    LAG(SUM(price_usd)) OVER (ORDER BY YEAR(created_at), 
        MONTH(created_at)) AS prev_month_revenue,
    (SUM(price_usd) - LAG(SUM(price_usd)) OVER (ORDER BY YEAR(created_at), 
        MONTH(created_at))) / LAG(SUM(price_usd)) OVER (ORDER BY YEAR(created_at), 
        MONTH(created_at)) * 100 AS mom_growth_pct
FROM orders
GROUP BY YEAR(created_at), MONTH(created_at)
ORDER BY YEAR(created_at), MONTH(created_at);
