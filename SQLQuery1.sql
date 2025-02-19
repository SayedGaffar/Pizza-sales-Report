KPI requirements
select * from pizza_sales

select sum (total_price)

select  count (distinct order_id) as Total_orders from pizza_sales

select sum(total_price) /count (distinct order_id) as Average from pizza_sales

select sum(quantity) as total_pizzas_ordered from pizza_sales

select Cast (sum(quantity) as decimal(10,2))/  cast (count (distinct order_id) as decimal (10,2))as avg_pizza_orders from pizza_sales

Problem statement and chart requirements


Daily trend for total orders

select datename(DW, order_date)as order_day, count (distinct order_id) as total_orders
from pizza_sales
group by  datename(DW, order_date)

Hourly trend for total orders

select datename(Month, order_date)as Month_order, count (distinct order_id) as total_orders
from pizza_sales
group by  datename(Month, order_date) 
order by total_orders desc


Percentage of sales by pizza category

select pizza_category , sum(total_price)*100 / (select sum(total_price) from pizza_sales where month(order_date) = 1 )as total_sales
from pizza_sales
where month(order_date) = 1
group by pizza_category 

percentage of sales by pizza size

select pizza_size  , sum(total_price)*100 / (select sum(total_price) from pizza_sales )as total_sales
from pizza_sales
group by pizza_size

Top 5 best seller pizzas by revenue

select top 5 pizza_name, sum(total_price) as total_revenue from pizza_sales 
group by pizza_name
order by total_revenue desc
