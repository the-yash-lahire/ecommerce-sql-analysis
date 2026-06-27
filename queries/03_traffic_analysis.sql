-- ================================================
-- Analysis 3: Traffic Source Performance
-- Business Question: Which marketing channel drives 
-- the most revenue and converts best?
--
-- Finding: Socialbook significantly underperforms 
-- at 1.08% CVR vs 5-7% for other channels.
-- Organic/direct traffic converts best at 6.93%.
-- ================================================

-- Basic version: Revenue and orders by traffic source
SELECT
    utm_source AS traffic_source,
    SUM(price_usd) AS total_revenue,
    SUM(price_usd) - SUM(cogs_usd) AS total_profit,
    COUNT(orders.order_id) AS total_orders
FROM orders
JOIN website_sessions ON orders.website_session_id = website_sessions.website_session_id
GROUP BY utm_source;


-- ================================================
-- Advanced Version: Conversion Rate by Traffic Source
-- using CTE
-- ================================================

WITH sessions_by_source AS (
    SELECT 
        utm_source,
        COUNT(website_session_id) AS total_sessions
    FROM website_sessions
    GROUP BY utm_source
),
orders_by_source AS (
    SELECT
        website_sessions.utm_source,
        COUNT(orders.order_id) AS total_orders
    FROM orders
    JOIN website_sessions ON orders.website_session_id = website_sessions.website_session_id
    GROUP BY utm_source
)
SELECT 
    sessions_by_source.utm_source,
    total_sessions,
    total_orders,
    (total_orders / total_sessions) * 100 AS conversion_rate
FROM sessions_by_source
JOIN orders_by_source ON sessions_by_source.utm_source = orders_by_source.utm_source;
