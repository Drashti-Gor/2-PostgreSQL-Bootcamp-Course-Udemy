-- orders shipping to either USA or France

select * from orders
where 
	ship_country in ('USA', 'France')
order by ship_country

-- count total number of orders shipping to USA or France

select 
	ship_country,
	count(*) 
from orders
where 
	ship_country in ('USA', 'France')
group by ship_country
order by 1

--order shipping to any country within latin america

select * from orders
where
	ship_country in ('Brazil','Mexico','Argentina','Venezuela')
order by ship_country

-- show order total amount per each line order

select *,
((unit_price * quantity)-discount) as "Total Amount"
from order_details
order by 6 desc

-- find the first and latest order dates

select
	min(order_date) as "First order date",
	max(order_date) as "Latest order date"
from orders

-- total products in each categories

select 
	c.category_name,
	count(*) as "Total products"
from products
inner join categories c using (category_id)
group by c.category_name
order by 1

-- list products that need re-ordering

select 
	product_id,
	product_name,
	units_in_stock,
	reorder_level
from products
where
	units_in_stock <= reorder_level
	order by 1
	
-- list top 5 highest frieght charges

select
	ship_country,
	avg(freight)
from orders
group by ship_country
order by 2 desc
limit 5

-- list top 5 highest frieght charges in year 1997

select
	ship_country,
	avg(freight)
from orders
where
	extract('Year' from shipped_date) = 1997
group by ship_country
order by 2 desc
limit 5

-- customers with no orders

select 
*
from customers c
left join orders o on c.customer_id = o.customer_id
where o.customer_id is NULL

-- top customers with their total order amount spend

select
	o.customer_id,
	sum((od.unit_price * od.quantity) - od.discount) as "Total_amount"
from customers c
inner join orders o using (customer_id)
inner join order_details od using (order_id)
group by 1
order by 2 desc
limit 10

-- orders with many lines of items

select 
	order_id,
	count(*) as "Total_orders"
from order_details
group by order_id
order by 2 desc

-- list all late shipped orders

select * from orders
where shipped_date > required_date

-- list employees with late shipped orders

select
	e.employee_id,
	e.first_name,
	e.last_name,
	count(*) as "total_late_orders"
from orders o
inner join employees e using (employee_id)
where shipped_date > required_date
group by
	e.employee_id
order by 1

-- countries with customers or suppliers

select
	country
from customers
union
select
	country
from suppliers
order by 1

-- first order from each country

with orders_by_country as
(
	select distinct
		order_id,
		order_date,
		ship_country,
		row_number() over (partition by ship_country order by ship_country, order_date desc) country_row_number
	from orders
)
select 
	ship_country,
	order_id,
	order_date
from orders_by_country
where country_row_number = 1
order by ship_country	

