-- subqueries

-- a. find the movies avg movie length and then
-- b. use the results from the first query and then use select to find movies which
-- are more than the average movie length

select
	movie_name,
	movie_length
from movies
where 
movie_length >
(	
	select
		avg(movie_length)
	from movies
)
order by movie_length

-- can we filter the previous records for english movies only

select
	movie_name,
	movie_length,
	movie_lang
from movies
where 
movie_length >
(	
	select
		avg(movie_length)
	from movies
	where movie_lang = 'English'
)
and movie_lang = 'English'
order by movie_length

-- get the first and last names of all the actors who are younger than Douglas Silva

select
	first_name,
	last_name,
	date_of_birth
from actors 
where
date_of_birth >
(
	select 
		date_of_birth
	from actors
	where 
		first_name = 'Douglas'
		and last_name = 'Silva'
)
order by date_of_birth desc

-- subquery with IN operator (due to inner query returning multiple records)

-- find all movies where domestic revenues are greater than 200

select 
	movie_name
from movies
where 
	movie_id in
(
	select 
		movie_id
	from movies_revenues
	where 
		revenues_domestic > 200
)

-- find all movies where domestic revenues are higher than the international revenues

select 
	movie_name
from movies
where 
	movie_id in
(
	select 
		movie_id
	from movies_revenues
	where 
		revenues_domestic > revenues_international
)

-- subqueries with joins

-- list all the directors where their movies made more than the average total revenues
-- of all english movies

select
	first_name,
	last_name,
	director_id,
	sum(revenues_domestic + revenues_international) as "Total Revenues"
from directors
inner join movies using (director_id)
inner join movies_revenues using (movie_id)
where revenues_domestic + revenues_international >
(
	select
		avg(revenues_domestic + revenues_international)
	from movies_revenues
	inner join movies using (movie_id)
	where movie_lang = 'English'
)
group by director_id
order by 4 desc