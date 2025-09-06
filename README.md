# 🛒 Superstore Sales Analysis – SQL Project

## 📁 Project Overview
This project involves creating a structured relational database named `supermarket_analysis` to analyze retail sales data from a fictional Superstore. The dataset captures customer orders, product details, shipping logistics, and financial metrics. The goal is to extract actionable insights using SQL queries.

---

## 🧱 Database & Table Setup

### 🔹 Database Creation
```sql
CREATE DATABASE supermarket_analysis;
USE supermarket_analysis;

🔹 Table Schema: superstore

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


🔍 SQL Queries & Insights

1️⃣ View Sample Data
SELECT * FROM superstore LIMIT 5;

2️⃣ Orders Placed in 2017

SELECT * 
FROM superstore 
WHERE YEAR(order_date) = 2017;

3️⃣ Top 5 Customers by Total Sales

SELECT customer_name, SUM(sales) AS total_sales
FROM superstore
GROUP BY customer_name
ORDER BY total_sales DESC
LIMIT 5;

4️⃣ Total Sales by Product Category

SELECT category, SUM(sales) AS total_sales
FROM superstore
GROUP BY category;

5️⃣ Orders with Discount > 30%

SELECT * 
FROM superstore 
WHERE discount > 0.3;

6️⃣ Distinct Shipping Modes

SELECT DISTINCT ship_mode 
FROM superstore;

7️⃣ Sales & Profit by Region

SELECT region, SUM(sales) AS total_sales, SUM(profit) AS total_profit
FROM superstore
GROUP BY region;

8️⃣ Average Delivery Time by Shipping Mode

SELECT ship_mode, AVG(DATEDIFF(ship_date, order_date)) AS avg_delivery_days
FROM superstore
GROUP BY ship_mode;

9️⃣ Top 10 Products by Sales

SELECT product_name, SUM(sales) AS total_sales
FROM superstore
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 10;

🔟 Bottom 10 Products by Profit

SELECT product_name, SUM(profit) AS total_profit
FROM superstore
GROUP BY product_name
ORDER BY total_profit ASC
LIMIT 10;

🔹 Segment-Wise Sales, Discount & Profit

SELECT segment, 
       SUM(sales) AS total_sales, 
       AVG(discount) AS average_discount, 
       SUM(profit) AS total_profit
FROM superstore
GROUP BY segment;

📌 Key Takeaways
Identify top customers and products

Analyze regional performance and profitability

Evaluate discount strategies and shipping efficiency

Segment customers for targeted insights

🛠️ Tools Used
MySQL 
 
SQL Workbench / DBeaver

Optional: Tableau, Power BI, Python (pandas)

