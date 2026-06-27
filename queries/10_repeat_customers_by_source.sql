-- ================================================
-- Bonus Analysis 10: Repeat Customers by Traffic Source
-- Business Question: Which marketing channel brings 
-- the most loyal, returning customers?
--
-- Finding: Organic/direct traffic has 55.5% repeat rate
-- vs gsearch at 5.8%. Organic visitors are 10x more 
-- loyal than paid search visitors.
-- Recommendation: Invest in SEO alongside paid ads.
-- ================================================

SELECT 
    utm_source AS traffic_source,
    COUNT(website_session_id) AS total_sessions,
    CASE 
        WHEN is_repeat_session = 0 THEN 'Not Repeated'
        WHEN is_repeat_session = 1 THEN 'Repeated'
    END AS session_type
FROM website_sessions
GROUP BY utm_source, is_repeat_session
ORDER BY utm_source;
