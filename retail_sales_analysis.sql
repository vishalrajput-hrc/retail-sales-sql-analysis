use retail_sales_project;

-- Q.1: Write a SQL query to retrieve all columns for sales made on '2022-11-05
SELECT *    
from retail_sales
WHERE DATE(sale_date) = '2022-11-05';

-- Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022.

SELECT *
FROM retail_sales
WHERE 
    category = 'Clothing'
    AND quantiy >= 10
    AND DATE_FORMAT(sale_date, '%Y-%m') = '2022-11';

-- Write a SQL query to calculate the total sales (total_sale) for each category.
Select 
category,
SUM(total_sale) AS Total_sale 
FROM retail_sales 
GROUP by category;

-- Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category

SELECT 
category,
AVG(age) AS avg_age
FROM retail_sales
WHERE category ='Beauty';

-- Write a SQL query to find all transactions where the total_sale is greater than 1000.

SELECT *
from retail_sales
WHERE total_sale >= 1000;

-- Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.

SELECT 
category,
gender,
COUNT(transactions_id) as Total_trans
from retail_sales
GROUP by category, gender
ORDER BY total_trans DESC;

-- Write a SQL query to calculate the average sale for each month. Find out best selling month in each year


