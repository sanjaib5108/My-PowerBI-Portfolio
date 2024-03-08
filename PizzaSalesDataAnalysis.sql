use PizzaSalesDB;

-- Query to Find the Total Revenue.

select sum(total_price) as TotalRevenue from pizza_sales;

-- Query to find the Average Order Value;

select (sum(total_price)/count(order_id)) as AverageOrderValue from pizza_sales;

-- Query to find Total Pizzas sold.

select sum(quantity) as TotalPizzasSold from pizza_sales;

-- Query to Find Total Orders Placed.

select count(distinct order_id) as TotalOrders from pizza_sales;

-- Query to find Average Pizzas per Order.

select cast(cast(sum(quantity) as decimal(10,2)) /
cast(count(distinct order_id) as decimal(10,2)) as decimal(10,2))
as AvgPizzasPerOrder
from pizza_sales;

-- Query to find Daily Trend for Total Orders.

select datename (dw, order_date) as OrderDay, 
count (distinct order_id) 
as TotalOrders
from pizza_sales
group by datename (dw, order_date);

-- Query to find Monthly Trend for Orders.

select datename (month, order_date) as MonthName, 
count (distinct order_id) 
as TotalOrders
from pizza_sales
group by datename (month, order_date);

-- Query to find % of Sales by Pizza Category.

select pizza_category as PizzaCategory, cast(sum(total_price) as decimal (10,2)) 
as TotalRevenue,
cast(sum(total_price) * 100 / (select sum(total_price) from pizza_sales)
as decimal (10,2)) as PercentageofRevenue
from pizza_sales
group by pizza_category;

-- Query to find % of Sales by Pizza Category.

select pizza_size as PizzaSize, cast(sum(total_price) as decimal (10,2)) 
as TotalRevenue,
cast(sum(total_price) * 100 / (select sum(total_price) from pizza_sales) 
as decimal (10,2)) 
as PercentageofSales
from pizza_sales
group by pizza_size
order by pizza_size;

-- Query to Find Total Pizzas Sold By Pizza CAtegory.

select pizza_category as PizzaCategory, sum(quantity) as TotalQuantitySold
from pizza_sales
where month(order_date) = 2
group by pizza_category
order by TotalQuantitySold desc;

-- Query to find Top 5 Pizzas By Revenue.

select top 5 pizza_name as PizzaName, 
sum(total_price) as TotalRevenue
from pizza_sales
group by pizza_name
order by TotalRevenue desc;

-- Query to find Bottom 5 Pizzas by Revenue.

select top 5 pizza_name as PizzaName, sum(total_price) 
as TotalRevenue
from pizza_sales
group by pizza_name
order by TotalRevenue asc;


-- Query to find Top 5 Pizzas By Quantity.

select top 5 pizza_name as PizzaName, sum(quantity) 
as TotalPizzasSold
from pizza_sales
group by pizza_name
order by TotalPizzasSold desc;


-- Query to find Bottom 5 Pizzas By Quantity.

select top 5 pizza_name as PizzaName, sum(quantity) 
as TotalPizzasSold
from pizza_sales
group by pizza_name
order by TotalPizzasSold asc;


-- Query to find Top 5 Pizzas by Total Orders.

select top 5 pizza_name as PizzaName, 
count (distinct order_id) as TotalOrders
from pizza_sales
group by pizza_name
order by TotalOrders desc;

-- Query to find Bottom 5 Pizzas by Total Orders.

select top 5 pizza_name as PizzaName, count (distinct order_id) as TotalOrders
from pizza_sales
group by pizza_name
order by TotalOrders asc;
