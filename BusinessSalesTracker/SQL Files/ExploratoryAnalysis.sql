# Business Sales Tracker (Exploratory Data Analysis)

-- Show whole table
SELECT *
FROM pizza_sales;

# KPI REQUIREMENTS

-- Total revenue
SELECT SUM(total_price) AS total_revenue
FROM pizza_sales;

-- Average order Value
SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS avg_order_value
FROM pizza_sales;

-- Total pizzas sold
SELECT SUM(quantity) AS total_pizza_sold
FROM pizza_sales;

-- Total orders
SELECT COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales;

-- Average pizzas per order
SELECT ROUND(SUM(quantity) / COUNT(DISTINCT order_id),2) AS Avg_pizza_per_order
FROM pizza_sales;



# REQUIREMENTS

-- Hourly trend of total pizzas sold
SELECT HOUR(order_time) AS order_hour, SUM(quantity) AS total_pizzas_sold
FROM pizza_sales
GROUP BY order_hour
ORDER BY order_hour;

-- Percentage of sales by category
SELECT pizza_category, ROUND(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales), 2) AS per_of_sales, ROUND(SUM(total_price), 2) AS total_revenue
FROM pizza_sales
GROUP BY pizza_category;

--  Percentage of sales by pizza size
SELECT pizza_size, ROUND(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales), 2) AS per_of_sales, ROUND(SUM(total_price), 2) AS total_revenue
FROM pizza_sales
GROUP BY pizza_size;

-- Total pizzas sold by category
SELECT pizza_category, SUM(quantity) AS total_quantity
FROM pizza_sales
GROUP BY pizza_category;


-- Top 5 best sellers by revenue
SELECT pizza_name, ROUND(SUM(total_price), 2) AS total_revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_revenue DESC
LIMIT 5;

-- Top 5 best sellers by quantity
SELECT pizza_name, SUM(quantity) AS total_quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_quantity DESC
LIMIT 5;

-- Top 5 best sellers by orders
SELECT pizza_name, COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_orders DESC
LIMIT 5;

-- Bottom 5 worst sellers by revenue
SELECT pizza_name, ROUND(SUM(total_price), 2) AS total_revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_revenue ASC
LIMIT 5;

-- Bottom 5 worst sellers by quantity
SELECT pizza_name, SUM(quantity) AS total_quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_quantity ASC
LIMIT 5;

-- Bottom 5 worst sellers by orders
SELECT pizza_name, COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_orders ASC
LIMIT 5;

