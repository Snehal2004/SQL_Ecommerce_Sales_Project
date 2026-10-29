USE ecommerce_analytics;
SHOW TABLES;

-- Query 1. How many orders are in the dataset?
SELECT
    COUNT(*) AS total_orders,
    COUNT(DISTINCT customer_id) AS unique_customer_records
FROM orders;

-- Query 2. How many orders are in each status?
SELECT
    order_status,
    COUNT(*) AS total_orders
FROM orders
GROUP BY order_status
ORDER BY total_orders DESC;

-- Query 3. Which customers are from São Paulo?Business problem: Find customer records associated with São Paulo state.
SELECT
    customer_id,
    customer_unique_id,
    customer_city,
    customer_state
FROM customers
WHERE customer_state = 'SP'
ORDER BY customer_city;

-- Query 4. Which months have the most orders?Business problem: Identify seasonal patterns in purchasing activity.
SELECT
    DATE_FORMAT(order_purchase_timestamp, '%Y-%m') AS order_month,
    COUNT(*) AS total_orders
FROM orders
GROUP BY DATE_FORMAT(order_purchase_timestamp, '%Y-%m')
ORDER BY order_month;

-- Query 5. What is the average review score?Business problem: Establish a baseline for customer satisfaction.
SELECT
    ROUND(AVG(review_score), 2) AS average_review_score,
    COUNT(review_score) AS reviews_with_scores
FROM order_reviews;


-- Query 6. What is the total revenue generated from delivered orders?

SELECT
    ROUND(SUM(oi.price), 2) AS total_item_revenue,
    ROUND(SUM(oi.freight_value), 2) AS total_freight,
    ROUND(SUM(oi.price + oi.freight_value), 2) AS item_revenue_plus_freight
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE o.order_status = 'delivered';

-- Query 7. Which product categories generate the most revenue?usiness problem: Decide which categories deserve more marketing attention.
SELECT
    p.product_category_name,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(oi.order_item_id) AS item_count,
    ROUND(SUM(oi.price), 2) AS item_revenue
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
WHERE o.order_status = 'delivered'
GROUP BY p.product_category_name
ORDER BY item_revenue DESC
LIMIT 10;

-- Query 8. Which payment methods are most popular?Business problem: Understand how customers prefer to pay.
SELECT
    payment_type,
    COUNT(*) AS payment_records,
    COUNT(DISTINCT order_id) AS orders_using_method,
    ROUND(SUM(payment_value), 2) AS total_payment_value,
    ROUND(AVG(payment_value), 2) AS average_payment_value
FROM order_payments
GROUP BY payment_type
ORDER BY total_payment_value DESC;

-- Query 9. Which states have the most customers?
SELECT
    customer_state,
    COUNT(DISTINCT customer_unique_id) AS unique_customers,
    COUNT(*) AS customer_order_records
FROM customers
GROUP BY customer_state
ORDER BY unique_customers DESC
LIMIT 10;

-- Query 10. Which orders have a value above the average order value?

WITH order_values AS (
    SELECT
        order_id,
        SUM(price + freight_value) AS order_value
    FROM order_items
    GROUP BY order_id
)
SELECT
    order_id,
    ROUND(order_value, 2) AS order_value
FROM order_values
WHERE order_value > (
    SELECT AVG(order_value)
    FROM order_values
)
ORDER BY order_value DESC;

-- Query 11. Which customers have placed more than one order?

SELECT
    c.customer_unique_id,
    COUNT(DISTINCT o.order_id) AS total_orders
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_unique_id
HAVING COUNT(DISTINCT o.order_id) > 1
ORDER BY total_orders DESC;

-- Query 13. Who are the top five sellers by revenue?
SELECT
    s.seller_id,
    s.seller_state,
    COUNT(DISTINCT oi.order_id) AS total_orders,
    ROUND(SUM(oi.price), 2) AS total_revenue
FROM sellers s
JOIN order_items oi
    ON s.seller_id = oi.seller_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.order_status = 'delivered'
GROUP BY s.seller_id, s.seller_state
ORDER BY total_revenue DESC
LIMIT 5;

-- Query 14. Which delivered orders arrived late?

SELECT
    order_id,
    order_purchase_timestamp,
    order_delivered_customer_date,
    order_estimated_delivery_date,
    DATEDIFF(
        order_delivered_customer_date,
        order_estimated_delivery_date
    ) AS days_late
FROM orders
WHERE order_status = 'delivered'
  AND order_delivered_customer_date >
      order_estimated_delivery_date
ORDER BY days_late DESC;

-- Query 15. Which order statuses have the lowest customer ratings?

SELECT
    o.order_status,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(AVG(r.review_score), 2) AS average_rating
FROM orders o
JOIN order_reviews r
    ON o.order_id = r.order_id
GROUP BY o.order_status
ORDER BY average_rating ASC;









