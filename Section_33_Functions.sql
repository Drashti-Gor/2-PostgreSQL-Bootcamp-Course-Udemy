-- Functions with SQL language

create or replace function fn_mysum(int,int)
returns int as 
'
	select $1 + $2;
'language sql

select fn_mysum(1,2)

-- get the minimum price of a product

create or replace function fn_minprice() returns real as
$$
	select
		min(unit_price)
	from products
$$ language sql

select fn_minprice()

-- get the maximum price of a product

create or replace function fn_maxprice() returns real as
$$
	select
		max(unit_price)
	from products
$$ language sql

select fn_maxprice()

-- get the biggest order ever placed

create or replace function fn_biggest_order() returns double precision as
$$
	select
	max(amount) from
	(
		select
			order_id,
			sum(unit_price * quantity) as amount
		from order_details
		group by order_id
		order by 2 desc
	)as total_amount
$$ language sql 

select fn_biggest_order()

-- get total count of customers

create or replace function fn_customer_count() returns int as
$$
	select
		count(customer_id)
	from customers
$$ language sql

select fn_customer_count()

-- get total count of products

create or replace function fn_product_count() returns int as
$$
	select count (*) from products
$$ language sql

select fn_product_count()

-- get total customers by city

create or replace function fn_customer_city(city_name varchar) returns int as
$$
	select count (*) from customers
	where city = city_name
$$ language sql
select fn_customer_city('London')

-- get total orders by a customer

create or replace function fn_total_orders_customer(p_customer_id char) returns int as
$$
	select
		count(order_id)
	from orders
	where 
		customer_id = p_customer_id
	group by customer_id
$$ language sql

select fn_total_orders_customer('VINET')

-- get the biggest order placed by a customer

create or replace function fn_biggest_order_customer(p_customer_id char) returns real as
$$
select
	max(amount) from
	(
		select 
			order_id,
			sum((unit_price * quantity) - discount) as amount
		from order_details
		inner join orders using (order_id)
		where 
			customer_id = p_customer_id
		group by order_id
	)
$$ language sql

select fn_biggest_order_customer('ALFKI')

-- get the most ordered product by a customer

create or replace function fn_most_ordered(p_customer_id char) returns varchar as
$$
select
	product_name
from
(
	select
		product_name,
		sum(quantity) as "total_quantity"
	from order_details
	inner join orders using (order_id)
	inner join products using (product_id)
	where 
		customer_id = 'CACTU'
	group by product_name
	order by 2 desc, 1 desc
) limit 1
$$ language sql

select fn_most_ordered('CACTU')

-- get most recent hire

create or replace function fn_recent_hire() returns employees as
$$
	select *
	from employees
	order by hire_date desc
	limit 1
$$ language sql

select (fn_recent_hire()).*
select (fn_recent_hire()).first_name
select first_name(fn_recent_hire())

-- list all employees hired in a particular year (returns multiple rows)

create or replace function fn_hire_year(p_year integer) returns setof employees as
$$
	select
	*
	from employees
	where
		date_part('Year', hire_date)= p_year
$$ language sql

select (fn_hire_year(1992)).*

-- list all products where total amount is greater than an input amount

create or replace function fn_product_total_amount(p_input_amount real) returns setof products as
$$
	select *
	from products
	where product_id in 
	(
		select
			product_id
		from 
		(
			select 
				od.product_id,
				sum((od.unit_price * od.quantity)- od.discount) as "total_amount"
			from order_details od
			inner join products p using (product_id)
			group by od.product_id
			order by 2 desc
		)where total_amount > p_input_amount
	)
$$ language sql

select (fn_product_total_amount(100000)).*

-- functions as a table source

select 
	product_id,
	product_name
from fn_product_total_amount(100000)

-- default values

create or replace function fn_sum_3(x int, y int default 10, z int default 10) returns integer as
$$
	select x + y + z;
$$ language sql

select fn_sum_3(1)