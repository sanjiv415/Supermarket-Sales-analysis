📁 Project Overview
This project involves creating a structured relational database named supermarket_analysis to analyze retail sales data from a fictional Superstore. The dataset captures customer orders, product details, shipping logistics, and financial metrics. The goal is to extract actionable insights using SQL queries.

🧱 Database & Table Setup
🔹 Database Creation
sql
CREATE DATABASE supermarket_analysis;
USE supermarket_analysis;
🔹 Table Schema: superstore
sql
CREATE TABLE superstore (
    row_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id VARCHAR(20) NOT NULL,
    order_date DATE NOT NULL,
    ship_date DATE NOT NULL,
    ship_mode VARCHAR(50),
    customer_id VARCHAR(20) NOT NULL,
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    country VARCHAR(50),
    city VARCHAR(100),
    state VARCHAR(100),
    postal_code VARCHAR(20),
    region VARCHAR(50),
    product_id VARCHAR(20) NOT NULL,
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(255),
    sales DECIMAL(10,2),
    quantity INT,
    discount DECIMAL(5,2),
    profit DECIMAL(10,2)
);
🔍 Analytical Queries
1️⃣ Preview the Data
sql
SELECT * FROM superstore LIMIT 5;
2️⃣ Orders Placed in 2017
sql
SELECT * 
FROM superstore 
WHERE YEAR(order_date) = 2017;
3️⃣ Top 5 Customers by Total Sales
sql
SELECT customer_name, SUM(sales) AS total_sales
FROM superstore
GROUP BY customer_name
ORDER BY total_sales DESC
LIMIT 5;
4️⃣ Total Sales by Product Category
sql
SELECT category, SUM(sales) AS total_sales
FROM superstore
GROUP BY category;
5️⃣ Orders with High Discounts (> 30%)
sql
SELECT * 
FROM superstore 
WHERE discount > 0.3;
6️⃣ Distinct Shipping Modes
sql
SELECT DISTINCT ship_mode 
FROM superstore;
7️⃣ Sales & Profit by Region
sql
SELECT region, SUM(sales) AS total_sales, SUM(profit) AS total_profit
FROM superstore
GROUP BY region;
8️⃣ Average Delivery Time by Shipping Mode
sql
SELECT ship_mode, AVG(DATEDIFF(ship_date, order_date)) AS avg_delivery_days
FROM superstore
GROUP BY ship_mode;
9️⃣ Top 10 Products by Sales
sql
SELECT product_name, SUM(sales) AS total_sales
FROM superstore
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 10;
🔟 Bottom 10 Products by Profit
sql
SELECT product_name, SUM(profit) AS total_profit
FROM superstore
GROUP BY product_name
ORDER BY total_profit ASC
LIMIT 10;
🔹 Segment-Wise Sales, Discount & Profit
sql
SELECT segment, 
       SUM(sales) AS total_sales, 
       AVG(discount) AS average_discount, 
       SUM(profit) AS total_profit
FROM superstore
GROUP BY segment;
📌 Insights & Applications
This SQL-based analysis helps uncover:

High-performing customers and products

Regional profitability trends

Impact of discounts on margins

Delivery efficiency across shipping modes

Segment-wise customer behavior

🛠️ Tools Used
MySQL / MariaDB for database management

SQL Workbench / DBeaver for query execution

Optional: Connect to Power BI, Tableau, or Python (pandas) for visualization
