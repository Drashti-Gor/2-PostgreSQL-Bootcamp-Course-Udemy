--using where

select * 
from movies
where movie_lang = 'English'

--using and

select * 
from movies
where 
	movie_lang = 'English' and age_certificate = '18'
	
--using or

select * 
from movies
where
	movie_lang = 'English' or movie_lang = 'Chinese'
	
--and & or

select * 
from movies
where
	(movie_lang = 'English' or movie_lang = 'Chinese')
	and age_certificate = '12'
	
-- get all the movies where movie length is greater than 100

select movie_name,movie_length 
from movies
where 
	movie_length > '100'
order by movie_length

-- get all the movies where movie length is greater than and equal to  100

select movie_name,movie_length 
from movies
where 
	movie_length >= 100
order by movie_length

-- get all movies where release date is greater 2000

select *
from movies
where 
	release_date >= '2001-01-01'
order by 1

--get all movies which greater than english language

select *
from movies 
where movie_lang > 'English'
order by movie_lang

--get all movies not equal to english

select *
from movies
where movie_lang != 'English'
order by movie_lang

-- use limit
--get top 5 biggest movies by movie length

select *
from movies
order by movie_length
limit 5;

-- get top 10 youngest female actors

select *
from actors
where gender = 'F'
order by date_of_birth desc
limit 10;

-- get top 10 most domestic profitable movies

select *
from movies_revenues 
order by revenues_domestic desc nulls last
limit 10

--use offset
--list 5 films starting from fourth one ordered by movie_id

select * 
from movies
order by movie_id
limit 5 offset 3

--list top 5 movies afer top 5 highest domestic profits movies

select * 
from movies_revenues
order by revenues_domestic desc nulls last 
limit 5 offset 5

--use fetch

select *
from movies
order by movie_length desc
fetch first 5 rows only
offset 5

--get all movies for english,chinese and japanese languages

--using and & or

select *
from movies
where
	movie_lang = 'English'
	or movie_lang = 'Chinese'
	or movie_lang = 'Japanese'
order by movie_lang

--using in operator

select *
from movies
where movie_lang in ('English','Chinese','Japanese')
order by movie_lang

--director id is not 13 or 10

select *
from directors
where director_id not in (13,10)
order by director_id

--get all actors where birth_date between 1991 and 1995

select *
from actors
where date_of_birth between '1991-01-01' and '1995-12-31'
order by date_of_birth

-- like and ilike

-- full character search

select 'hello' like 'hello';

-- partial search
select 'hello' like 'h%'
select 'hello' like '%e%'

--single character search using '_'
select 'hello' like '_ello'

--checking multiple characters
select 'hello' like '__ll_'

--using % and _ together
select 'hello' like '%ll_'

--get all actors name starting with 'A'

select *
from actors
where first_name like 'A%'
order by 1

--get all actors where first name contains 5 letters only

select *
from actors
where first_name like '_____'
order by first_name

-- checking case senstitivity
-- get actor name Tim

select *
from actors
where first_name like 'Tim'

select *
from actors
where first_name like 'tim'

--ilike is not case sensitive

select *
from actors
where first_name ilike 'tim'

-- is null and is not null

--get actors with missing birth date

select * 
from actors
where date_of_birth is null

-- get movies where domestic revenue is not null

select *
from movies_revenues
where revenues_domestic is not null

-- combine string 'Hello' and 'World'
select 'Hello '||'World' as new_string

--combine 2 columns
select 
concat(first_name,' ',last_name) as Actor Name
from actors

--dealing with null values in concat (concat_ws ignores null values)

select 'Hello' || null || 'World'

select 
	revenues_domestic,
	revenues_international,
	concat(revenues_domestic,' | ', revenues_international) as Profits
from movies_revenues

select 
	revenues_domestic,
	revenues_international,
	concat_ws(' | ',revenues_domestic, revenues_international) as Profits
from movies_revenues

--combine columns with a seperator
select
concat_ws(', ',first_name,last_name,date_of_birth) as "Actor Details"
from actors
order by first_name
































