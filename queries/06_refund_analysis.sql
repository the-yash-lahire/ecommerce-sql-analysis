-- ================================================
-- Analysis 6: Refund Rate by Product
-- Business Question: Which products have the highest 
-- refund rates and what is the business impact?
--
-- Finding: Sugar Panda has highest refund rate at 6.04%
-- despite not being the top seller. Mini Bear is most 
-- reliable at 1.28% refund rate.
-- ================================================

SELECT 
    product_name,
    COUNT(order_items.order_item_id) AS total_orders,
    COUNT(order_item_refunds.order_item_refund_id) AS total_refunds,
    (COUNT(order_item_refunds.order_item_refund_id) / 
        COUNT(order_items.order_item_id)) * 100 AS refund_rate
FROM order_items
LEFT JOIN products ON products.product_id = order_items.product_id
LEFT JOIN order_item_refunds ON order_items.order_item_id = order_item_refunds.order_item_id
GROUP BY products.product_id
ORDER BY refund_rate DESC;
