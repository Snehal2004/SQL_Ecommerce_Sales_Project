# E-Commerce Sales & Customer Analytics using SQL

## 📌 Project Overview

This project focuses on analyzing an e-commerce business using SQL and the Brazilian E-Commerce Public Dataset by Olist. The objective is to extract meaningful business insights from sales, customer, product, payment, and order data using MySQL.


## 🎯 Project Objectives

- Analyze order volume and order status distribution.
- Identify top-performing product categories and sellers.
- Understand customer purchasing behavior and repeat purchases.
- Analyze monthly order trends and revenue performance.
- Evaluate customer satisfaction using review scores.
- Investigate delivery delays and shipping costs.
- Analyze payment methods and payment values.
- Identify data-quality issues in the dataset.

## 📂 Dataset

**Dataset Name:** Brazilian E-Commerce Public Dataset by Olist

**Source:** [Kaggle – Brazilian E-Commerce Public Dataset](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)

The dataset contains anonymized e-commerce records from Brazil, including orders, customers, products, sellers, payments, reviews, and delivery information.

### Main Tables Used

| Table Name | Description |
|---|---|
| `orders` | Order details, status, and timestamps |
| `customers` | Customer identifiers and locations |
| `order_items` | Products purchased, item prices, and freight |
| `order_payments` | Payment methods and payment values |
| `order_reviews` | Customer ratings and reviews |
| `products` | Product categories and attributes |
| `sellers` | Seller identifiers and locations |

## 🛠️ Tools & Technologies

- **Database:** MySQL
- **SQL Editor:** MySQL Workbench
- **Version Control:** Git and GitHub
- **Dataset Format:** CSV

## 📊 Business Questions & Analysis

The project includes SQL queries designed to answer practical business questions, such as:

1. How many orders and unique customer records are present in the dataset?
2. What is the distribution of orders by status?
3. Which customers are located in São Paulo state?
4. Which months have the highest order volumes?
5. What is the average customer review score?
6. What is the total item revenue and freight value for delivered orders?
7. Which product categories generate the highest revenue?
8. Which payment methods are most frequently used?
9. Which states have the largest customer bases?
10. Which orders have a value above the average order value?
11. Which customers have placed multiple orders?
12. How does monthly revenue change over time?
13. Which sellers generate the highest item revenue?
14. Which delivered orders arrived later than estimated?
15. How do average review scores vary by order status?

## 💡 SQL Concepts Practiced

- `SELECT`, `WHERE`, `ORDER BY`, and `LIMIT`
- Aggregate functions: `COUNT()`, `SUM()`, `AVG()`
- `GROUP BY` and `HAVING`
- `INNER JOIN` and multi-table joins
- `COUNT(DISTINCT)`
- Date functions: `DATE_FORMAT()` and `DATEDIFF()`
- Conditional filtering and business KPI calculations
- Subqueries
- Common Table Expressions (CTEs)
- Window functions: `LAG()` and `DENSE_RANK()`
- `CASE` expressions
- NULL handling and `NULLIF()`

## 📈 Expected Business Value

This analysis can help businesses understand sales patterns, identify high-performing categories and sellers, evaluate customer purchasing behavior, monitor delivery performance, and investigate payment discrepancies.

The insights can support data-driven decisions related to sales strategy, customer experience, and operational efficiency.


## 👩‍💻 About This Project

This project is part of my learning journey toward becoming a Data Analyst. It demonstrates my ability to use SQL to explore real-world datasets, solve business problems, and extract actionable insights from structured data.

I am continuously improving my SQL skills and expanding this project with additional analytical queries and database optimization techniques.

---

**Author:** Snehal Bahalkar

**Focus:** Data Analytics | SQL | MySQL | Business Intelligence
