-- Retail Sales Analysis Project

CREATE DATABASE IF NOT EXISTS retail_sales_project;
USE retail_sales_project;

-- Table Schema
DROP TABLE IF EXISTS retail_sales;
CREATE TABLE retail_sales (
    transactions_id INT PRIMARY KEY,
    sale_date DATE,
    sale_time TIME,
    customer_id INT,
    gender VARCHAR(15),
    age INT,
    category VARCHAR(25),
    quantiy INT,
    price_per_unit DECIMAL(10, 2),
    cogs DECIMAL(10, 2),
    total_sale DECIMAL(10, 2)
);

-- ======================================================
-- Business Analysis & Solutions (10 Questions)
-- ======================================================

-- Q.1: Retrieve all columns for sales made on '2022-11-05'
SELECT * 
FROM retail_sales
WHERE DATE(sale_date) = '2022-11-05';

-- Q.2: Retrieve transactions where category is 'Clothing' and quantity >= 10 in Nov-2022
SELECT *
FROM retail_sales
WHERE 
    category = 'Clothing'
    AND quantiy >= 10
    AND DATE_FORMAT(sale_date, '%Y-%m') = '2022-11';

-- Q.3: Calculate total sales for each category
SELECT 
    category,
    SUM(total_sale) AS Total_sale 
FROM retail_sales 
GROUP BY category;

-- Q.4: Find the average age of customers purchasing from 'Beauty' category
SELECT 
    category,
    AVG(age) AS avg_age
FROM retail_sales
WHERE category = 'Beauty'
GROUP BY category;

-- Q.5: Find all transactions where total_sale is greater than 1000
SELECT *
FROM retail_sales
WHERE total_sale > 1000;

-- Q.6: Find total number of transactions made by each gender in each category
SELECT 
    category,
    gender,
    COUNT(transactions_id) AS Total_trans
FROM retail_sales
GROUP BY category, gender
ORDER BY Total_trans DESC;

-- Q.7: Calculate average sale for each month and find the best-selling month per year
WITH monthly_sale AS (
    SELECT 
        YEAR(sale_date) AS sale_year,
        MONTH(sale_date) AS sale_month,
        ROUND(AVG(total_sale), 2) AS avg_sale,
        RANK() OVER(
            PARTITION BY YEAR(sale_date) 
            ORDER BY AVG(total_sale) DESC
        ) AS sale_rank
    FROM retail_sales
    GROUP BY YEAR(sale_date), MONTH(sale_date)
)
SELECT
    sale_year,
    sale_month,
    avg_sale
FROM monthly_sale
WHERE sale_rank = 1;

-- Q.8: Find the top 5 customers based on highest total sales
SELECT
    customer_id,
    SUM(total_sale) AS total_sale
FROM retail_sales
GROUP BY customer_id 
ORDER BY total_sale DESC
LIMIT 5;

-- Q.9: Find the number of unique customers who purchased from each category
SELECT
    category,
    COUNT(DISTINCT customer_id) AS unique_cust
FROM retail_sales
GROUP BY category 
ORDER BY unique_cust DESC;

-- Q.10: Shift analysis (Morning <12, Afternoon 12-17, Evening >17)
WITH hourly_sale AS (
    SELECT *,
        CASE 
            WHEN HOUR(sale_time) < 12 THEN 'Morning'
            WHEN HOUR(sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
            ELSE 'Evening'
        END AS shift 
    FROM retail_sales 
)
SELECT
    shift,
    COUNT(*) AS total_orders
FROM hourly_sale
GROUP BY shift
ORDER BY total_orders DESC;
