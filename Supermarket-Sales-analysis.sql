-- CREATE NEW DATABASES 
-- CREATED DATABASE supermarket_analysis ;
SHOW DATABASES ;
USE supermarket_analysis ;

-- CREATE NEW TABLE 
-- CREATE TABLE superstore (
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

SHOW TABLES ;

-- PROBLEM STATEMENTS ---

SELECT * FROM superstore LIMIT 5 ;

-- 1 List all orders placed in 2017.

SELECT * 
FROM superstore 
WHERE YEAR(order_date) = 2017;

-- Find the top 5 customers by total sales.

select customer_name , SUM(sales) as total_sales
from superstore
GROUP BY customer_name 
ORDER BY total_sales DESC 
LIMIT 5 ;

-- Show the total sales for each product category.

SELECT category , SUM(sales) as total_sales 
from superstore 
GROUP BY category ;

-- Retrieve all orders where the discount > 0.3.

SELECT * 
FROM superstore 
WHERE discount > 0.3 ;

-- List the distinct shipping modes available in the dataset.

SELECT distinct ship_mode 
FROM superstore ;


-- Calculate the total sales and profit per region.

SELECT region , SUM(sales) AS total_sales  , SUM(profit) AS total_profit
from superstore 
GROUP BY region ;

-- Find the average delivery time (Ship Date - Order Date) for each shipping mode.

SELECT ship_mode , AVG(datediff( ship_date , order_date))
FROM superstore
GROUP BY ship_mode ;

-- Show the top 10 products by sales and bottom 10 products by profit

-- Top 10 Products by Sales
SELECT product_name, SUM(sales) AS Total_Sales
FROM superstore
GROUP BY product_name
ORDER BY Total_Sales DESC
LIMIT 10;

-- Bottom 10 Products by Profitn
SELECT product_name, SUM(profit) AS Total_profit
FROM superstore
GROUP BY product_name
ORDER BY Total_profit  ASC
LIMIT 10;


-- For each customer segment, calculate the total sales, average discount, and total profit.
SELECT segment , SUM(sales) AS total_sales , AVG(discount) AS Average_discount , SUM(profit) AS total_profit
from superstore
GROUP BY segment ;





