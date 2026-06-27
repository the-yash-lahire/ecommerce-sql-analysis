-- ================================================
-- Analysis 7: New vs Repeat Customer Behavior
-- Business Question: Do repeat customers spend more 
-- than new customers? How loyal is the customer base?
--
-- Finding: Only 17% of orders come from repeat customers.
-- Business is heavily dependent on new customer acquisition.
-- Repeat customers spend marginally more ($56.59 vs $55.19).
-- ================================================

-- Basic version: Orders and avg order value by customer type
SELECT 
    is_repeat_session,
    COUNT(orders.order_id) AS total_orders,
    AVG(orders.price_usd) AS avg_order_value
FROM orders
JOIN website_sessions ON orders.website_session_id = website_sessions.website_session_id
GROUP BY is_repeat_session;


-- ================================================
-- Advanced Version: Using CASE WHEN for readable labels
-- ================================================

SELECT 
    CASE 
        WHEN is_repeat_session = 0 THEN 'New Customer'
        WHEN is_repeat_session = 1 THEN 'Repeat Customer'
    END AS customer_type,
    COUNT(orders.order_id) AS total_orders,
    AVG(orders.price_usd) AS avg_order_value
FROM orders
JOIN website_sessions ON orders.website_session_id = website_sessions.website_session_id
GROUP BY is_repeat_session;
