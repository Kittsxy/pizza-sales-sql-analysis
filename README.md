# 🍕 Pizza Sales – SQL-Based Data Analysis

This project showcases how structured SQL queries can be used to extract actionable insights from transactional pizza sales data. The analysis focuses on performance metrics, customer ordering trends, and product breakdowns using Microsoft SQL Server.

---

## 📌 Objective

To analyze sales patterns and business KPIs from a fictional pizza store dataset using T-SQL, simulating real-world retail reporting scenarios.

---

## 🛠 Tools & Technologies

- **Microsoft SQL Server**
- **SQL Server Management Studio (SSMS)**
- Dataset: `pizza_sales` table (CSV imported to SQL)

---

## 📊 Key Metrics Analyzed

- **Total Revenue**
- **Average Order Value**
- **Total Pizzas Sold**
- **Orders per Day and Hour**
- **Sales Percentage by Category & Size**
- **Top 5 Best-Selling and Least-Selling Pizzas**

---

## 🔍 Sample SQL Queries

```sql
-- Total Revenue
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales;

-- Average Order Value
SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS Avg_Order_Value FROM pizza_sales;

-- Top 5 Best-Selling Pizzas
SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Sold DESC;
