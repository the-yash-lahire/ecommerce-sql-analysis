-- ================================================
-- Analysis 4: Conversion Funnel Analysis
-- Business Question: Where are visitors dropping 
-- off in the buying journey?
--
-- Finding: 57% drop-off at product to cart stage.
-- 50% drop-off at billing to order complete stage.
-- Two biggest opportunities for revenue improvement.
-- ================================================

-- Step 1: Identify all pages in the funnel
SELECT DISTINCT pageview_url 
FROM website_pageviews;


-- Step 2: Count unique sessions per funnel step
SELECT
    pageview_url,
    COUNT(DISTINCT website_session_id) AS session_count
FROM website_pageviews
GROUP BY pageview_url
ORDER BY session_count DESC;
