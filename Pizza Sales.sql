--KPI's
select *from pizza_sales

SELECT SUM(total_price) as Total_Revenue from pizza_sales

select SUM(total_price) / COUNT(DISTINCT order_id) as Avg_Order_Value from pizza_sales

select SUM(quantity) as Total_Pizza_Sold from pizza_sales

select COUNT(DISTINCT order_id) as Total_Orders from pizza_sales

select CAST(CAST(SUM(quantity) as decimal(10,2)) /
CAST(COUNT(DISTINCT order_id) as decimal(10,2)) as decimal(10,2)) as Avg_Pizza_Per_Order from pizza_sales

--Daily Trend
select DATENAME(DW, order_date) as Order_Key, COUNT(DISTINCT order_id) as Total_Orders
from pizza_sales
group by DATENAME (DW, order_date)

--Hourly Trend
select DATEPART(HOUR, order_time) as Order_Hours, COUNT(DISTINCT order_id) as Total_Orders
from pizza_sales
group by DATEPART(HOUR, order_time)
order by DATEPART(HOUR, order_time)

--PCT Sales By Pizza Category
select pizza_category, SUM(total_price) as Total_Sales, CAST((SUM(total_price) * 100) / 
(select SUM(total_price) from pizza_sales) as DECIMAL(10,2)) as Percentage_Sales
from pizza_sales
--where MONTH(order_date) = 1 (filter month)
group by pizza_category

--PCT Sales by Size
select pizza_size, SUM(total_price) as Total_Sales, CAST((SUM(total_price) * 100) / 
(select SUM(total_price) from pizza_sales) as DECIMAL(10,2)) as Percentage_Sales
from pizza_sales
--where DATEPART (quarter, order_date)=1
group by pizza_size
order by Percentage_Sales DESC

--Pizza sold by category
select pizza_category, SUM(quantity) as Total_Pizzas_Sold
from pizza_sales
group by pizza_category
order by Total_Pizzas_Sold DESC

--Top 5 Best Seller By Pizza Sold
select top 5 pizza_name, SUM(quantity) as Total_Pizzaz_Sold
from pizza_sales
group by pizza_name
order by SUM(quantity) DESC

--Top 5 Underrated By Pizza Sold
select top 5 pizza_name, SUM(quantity) as Total_Pizzaz_Sold
from pizza_sales
group by pizza_name
order by SUM(quantity) ASC