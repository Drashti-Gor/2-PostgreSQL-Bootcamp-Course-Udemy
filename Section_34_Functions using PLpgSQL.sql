-- get the max price from all products

create or replace function fn_max_function() returns integer as
$$
	begin
		return max(unit_price)
		from products;
	end;
$$ language plpgsql

select fn_max_function()

-- declaring variables

do
$$
	declare
		mynum       integer :=1;
		first_name  varchar(100) :='Adnan';
		hire_date 	date := '2020-01-01';
		start_date  date := now();
		emptyvar 	integer;
		
	begin 
		raise notice 'My variables % % % % %',
		mynum,
		first_name,
		hire_date,
		start_date,
		emptyvar;
	end;
$$ 

-- alias

create or replace function function_name(int,int) returns int as
$$
	declare
		x alias for $1;
		y alias for $2;
	begin
		...
	end;
$$ language plpgsql

-- copying data types

do
$$
	declare 
		variable_name    table_name.column_name%type;
		
		empl_first_name  employees.first_name%type;
	begin 
		variable_name
	end
$$

-- assign variables from queries

-- select expression into variable_name

select * from products into product_row limit 1;
select product_row.product_name	into product_name;

do
$$
	declare
		product_title     products.product_name%type; 
	begin
		select 
			product_name
		from products
		into products_title
		where 
			product_id = 1
		limit
		raise notice 'Your product name is %', product_title;
	end;
$$

-- using IN, OUT, INOUT

create or replace function fn_my_sum_2(in x integer, in y integer, out z integer) returns int as
$$
	begin
		z := x + y;
	end;
$$ language plpgsql;	

-- to use multiple

create or replace function fn_my_sum(in x integer, in y integer, out z integer, out w integer) as
$$
	begin	
		z := x + y;
		w := x*y;
	end;
$$ language plpgsql;	

select * from fn_my_sum(1,2)

-- conditonal statements

--sort data in categories using price of product

create or replace function fn_products_category(price real) returns text as
$$
	begin
		if price > 50 then
			return 'HIGH';
		elsif price > 25 then 
			return 'MEDIUM';
		else
			return 'LOW';
		end if;
	end;
$$ language plpgsql

select fn_products_category(unit_price),* 
from products
order by 1 desc

-- CASE statement

create or replace function fn_check_value(x integer default 0) returns text as
$$
	begin
		case x
			when 10 then
				return 'value = 10';
			when 20 then
				return 'value = 20';
			else
				return 'No values found';
		end case;
	end;
$$ language plpgsql

select fn_check_value(10);

-- FOR loop

do
$$
	begin
		for counter in 1..10 by 2
		loop
			raise notice 'Counter : %', counter;
		end loop;
	end;
$$ language plpgsql