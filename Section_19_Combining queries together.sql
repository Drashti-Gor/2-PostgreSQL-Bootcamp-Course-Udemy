-- UNION

select 
	first_name,
	last_name,
	'directors' as "tablename"
from directors
union
select 
	first_name,
	last_name,
	'actors' as "tablename"
from actors

-- combine all directors where nationality are american, chinese and japanese with all female actors

select
	first_name,
	last_name,
	'directors' as "tablename"
from directors
where 
	nationality in ('English','Chinese','Japanese')
union
select
	first_name,
	last_name,
	'actors' as "tablename"
from actors
where
	gender = 'F'

-- INTERSECT

-- get first name and last name of directors and actors

select 
	first_name,
	last_name
from directors
intersect
select
	first_name,
	last_name
from actors

-- EXCEPT

select 
	first_name,
	last_name
from directors
except
select
	first_name,
	last_name
from actors

-- list all the directors first name,last name unless they have the same first name in female

select 
	first_name,
	last_name
from directors
except
select
	first_name,
	last_name
from actors
where 
	gender = 'F'
order by first_name