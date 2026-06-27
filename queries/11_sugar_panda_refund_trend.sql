-- ================================================
-- Bonus Analysis 11: Sugar Panda Refund Trend Over Time
-- Business Question: Is Sugar Panda's high refund rate 
-- getting better or worse over time?
--
-- Finding: Refund rate fluctuates between 4-7% monthly
-- with no consistent improvement since launch.
-- Problem has persisted through 2014 and into 2015.
-- Recommendation: Conduct customer feedback analysis
-- to identify root cause of persistent refund issue.
-- ================================================

SELECT 
    COUNT(order_items.order_item_id) AS total_orders,
    COUNT(order_item_refunds.order_item_refund_id) AS total_refunds,
    (COUNT(order_item_refunds.order_item_refund_id) / 
        COUNT(order_items.order_item_id) * 100) AS refund_rate,
    YEAR(order_items.created_at) AS yr,
    MONTH(order_items.created_at) AS mo
FROM order_items
LEFT JOIN order_item_refunds ON order_items.order_item_id = order_item_refunds.order_item_id
LEFT JOIN products ON products.product_id = order_items.product_id
WHERE product_name = 'The Birthday Sugar Panda'
GROUP BY YEAR(order_items.created_at), MONTH(order_items.created_at)
ORDER BY YEAR(order_items.created_at), MONTH(order_items.created_at);
