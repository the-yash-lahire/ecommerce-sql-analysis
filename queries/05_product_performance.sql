-- ================================================
-- Analysis 5: Product Performance
-- Business Question: Which products drive the most 
-- revenue and profit?
--
-- Finding: Mr. Fuzzy accounts for 73% of all orders
-- creating significant product concentration risk.
-- ================================================

SELECT  
    product_name,
    COUNT(order_items.order_item_id) AS total_orders,
    SUM(order_items.price_usd) AS total_revenue,
    SUM(order_items.cogs_usd) AS total_cost,
    SUM(order_items.price_usd) - SUM(order_items.cogs_usd) AS total_profit,
    (SUM(order_items.price_usd) - SUM(order_items.cogs_usd)) 
        / SUM(order_items.price_usd) * 100 AS profit_margin_pct
FROM order_items
JOIN products ON products.product_id = order_items.product_id
GROUP BY products.product_id
ORDER BY total_revenue DESC;
