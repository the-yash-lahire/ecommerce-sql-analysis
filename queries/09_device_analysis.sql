-- ================================================
-- Bonus Analysis 9: Device Type Conversion
-- Business Question: Does mobile or desktop convert 
-- better? Where should UX efforts be focused?
--
-- Finding: Desktop converts at 7.45% vs mobile 2.74%
-- Nearly 3x gap. 74k mobile sessions with low conversion
-- represents a major untapped revenue opportunity.
-- ================================================

SELECT 
    device_type,
    COUNT(website_sessions.website_session_id) AS total_sessions,
    COUNT(orders.order_id) AS total_orders,
    (COUNT(orders.order_id) / 
        COUNT(website_sessions.website_session_id) * 100) AS conversion_rate
FROM website_sessions
LEFT JOIN orders ON website_sessions.website_session_id = orders.website_session_id
GROUP BY device_type
ORDER BY conversion_rate DESC;
