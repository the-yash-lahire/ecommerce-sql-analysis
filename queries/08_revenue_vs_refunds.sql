-- ================================================
-- Analysis 8: Monthly Revenue vs Refunds
-- Business Question: How do refunds impact net revenue 
-- over time? Are refunds a growing problem?
--
-- Finding: Refunds stay between 2-6% of monthly revenue
-- throughout the period. Net revenue closely tracks 
-- gross revenue -- refunds are not a major threat.
--
-- Note: March 2015 shows apparent decline but dataset 
-- ends March 19 -- incomplete data, not actual decline.
-- ================================================

SELECT
    YEAR(orders.created_at) AS yr,
    MONTH(orders.created_at) AS mo,
    SUM(orders.price_usd) AS total_revenue,
    SUM(refund_amount_usd) AS total_refunds,
    SUM(orders.price_usd) - SUM(refund_amount_usd) AS net_revenue
FROM orders
LEFT JOIN order_items ON orders.order_id = order_items.order_id
LEFT JOIN order_item_refunds ON order_item_refunds.order_item_id = order_items.order_item_id
GROUP BY YEAR(orders.created_at), MONTH(orders.created_at)
ORDER BY YEAR(orders.created_at), MONTH(orders.created_at);
