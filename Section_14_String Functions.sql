-- upper,lower,initcap

select
	upper(first_name) as first_name,
	lower(last_name) as last_name
from directors;

select
	initcap(
		concat(first_name,' ',last_name)
	) as full_name
from directors
order by first_name;

-- LEFT

select left ('ABCD',2)
select left('ABCDE',-1)

select
	left(first_name,1) as initial
from directors
order by 1;

select
	left(first_name,1) as initial,
	count (*) as total_initials
from directors
group by 1	
order by 1;

-- RIGHT
select right('ABCD',1)

select
	last_name,
	right(last_name,2)
from directors
where 
	right(last_name,2) = 'on';
	
-- split 
select split_part('a,b,c,d',',',2)

-- LPAD, RPAD
select lpad('Database',15,'*');
select rpad('Database',15,'*');

-- substring
select substring('Hello world' from 1 for 5)

-- repeat
select repeat('A',10)

-- replace
select replace('ABC XYZ','X','1')

