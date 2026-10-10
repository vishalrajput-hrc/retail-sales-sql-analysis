# Retail Sales Analysis (SQL)

A retail sales exploratory data analysis project using MySQL. This project cleans raw transactional data and answers critical business questions around customer behavior, category performance, temporal demand patterns, and sales trends.

---

## Database & Schema Overview

- **Database Engine:** MySQL
- **Table Name:** `retail_sales`

| Column Name | Data Type | Description |
| :--- | :--- | :--- |
| `transactions_id` | INT (PK) | Unique invoice identifier |
| `sale_date` | DATE | Date of transaction |
| `sale_time` | TIME | Time of transaction |
| `customer_id` | INT | Unique customer ID |
| `gender` | VARCHAR(15) | Customer gender |
| `age` | INT | Customer age |
| `category` | VARCHAR(25) | Product department |
| `quantiy` | INT | Units purchased |
| `price_per_unit` | DECIMAL(10,2) | Unit selling price |
| `cogs` | DECIMAL(10,2) | Cost of goods sold |
| `total_sale` | DECIMAL(10,2) | Total revenue |

---

## Key Business Problems Solved

1. **Transactional Auditing:** Filtered records by exact calendar dates and high-ticket value benchmarks (`> 1000`).
2. **Category Performance:** Computed aggregated revenue and demographic profiles (average customer age per product line).
3. **Customer Segmentation:** Extracted top 5 high-value accounts by cumulative spend and tracked unique customer reach per category.
4. **Time-Series Analysis:** Extracted peak operating months by year using Window Functions (`RANK() OVER PARTITION BY`).
5. **Shift Scheduling & Traffic Optimization:** Segmented orders into Morning, Afternoon, and Evening windows using `CASE` expressions to identify store traffic peaks.

---

## Core SQL Techniques Demonstrated

* **Data Filtering & Cleaning:** `WHERE`, `DATE_FORMAT()`, `IS NULL` audits
* **Aggregations & Grouping:** `GROUP BY`, `SUM()`, `AVG()`, `COUNT(DISTINCT)`
* **Window Functions:** `RANK() OVER (PARTITION BY ... ORDER BY ...)`
* **Subqueries & CTEs:** `WITH cte AS (...)` for multi-stage transformations
* **Conditional Logic:** `CASE WHEN ... THEN ... ELSE ... END`