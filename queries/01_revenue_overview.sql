-- ================================================
-- Analysis 1: Revenue & Profit Overview
-- Business Question: How much total revenue, cost, 
-- and profit has the business generated over 3 years?
-- 
-- Finding: $1.94M revenue with 62.7% profit margin
-- ================================================

SELECT 
    SUM(price_usd) AS total_revenue,
    SUM(cogs_usd) AS total_cost,
    SUM(price_usd) - SUM(cogs_usd) AS total_profit,
    (SUM(price_usd) - SUM(cogs_usd)) / SUM(price_usd) * 100 AS profit_margin_pct
FROM orders;
