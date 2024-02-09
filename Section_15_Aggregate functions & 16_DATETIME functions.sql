-- count

select
	 count(movie_lang)
from movies

-- count distinct movie languages

select
	count(distinct(movie_lang))
from movies

-- sum

-- sum of domestic revenues

select
	sum(revenues_domestic)
from movies_revenues

-- sum of movie length of all english movies

select
	sum(movie_length)
from movies
where
	movie_lang = 'English'

-- MAX, MIN

select
	max(movie_length)
from movies

select
	min(movie_length)
from movies


-- date_part
select date_part('year', timestamp '2017-01-01');

-- date_trunc
select date_trunc('minute', timestamp '2020-10-01 05:15:45')
