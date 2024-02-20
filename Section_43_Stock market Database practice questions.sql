-- select first or last 10 records in a table

-- first
select *
from stocks_prices
where
	symbol_id = 1
order by 
	price_date asc
limit 10

-- last
select *
from stocks_prices
where
	symbol_id = 1
order by 
	price_date desc
limit 10

-- get the first or last record per each group

-- first
select
	symbol_id,
	min(price_date)
from stocks_prices
group by 
	symbol_id
order by 1

-- last
select
	symbol_id,
	max(price_date)
from stocks_prices
group by 
	symbol_id
order by 1

-- how to get cube root in PostgreSQL

select
	close_price,
	cbrt(close_price)
from stocks_prices
where
	symbol_id = 1
order by price_date desc