-- INNER JOIN

select
	*
from movies
inner join directors using (director_id)
inner join movies_revenues using (movie_id)

select 
	mv.movie_name,
	d.first_name,
	mr.revenues_domestic
from movies mv
inner join directors d using (director_id)
inner join movies_revenues mr using (movie_id)
where 
	mv.movie_lang = 'English'

-- get movie name and director name where revenues domestic is greater than 100

select
	mv.movie_name,
	d.first_name
from movies mv
inner join directors d using (director_id)
inner join movies_revenues mr using (movie_id)
where
	mv.movie_lang in ('English','Chinese','Japanese')
	and mr.revenues_domestic > 100

-- top 5 movies

select
	mv.movie_name,
	d.first_name,
	d.last_name,
	mv.movie_lang,
	(mr.revenues_domestic + mr.revenues_international) as "Total Revenues"
from movies mv
inner join directors d using (director_id)
inner join movies_revenues mr using (movie_id)
order by 5 desc
limit 5

-- top 10 movies between 2005 and 2008

select
	mv.movie_name,
	d.first_name,
	d.last_name,
	mv.movie_lang,
	mr.revenues_domestic,
	mr.revenues_international,
	(mr.revenues_domestic + mr.revenues_international) as "Total Revenues"
from movies mv
inner join directors d using (director_id)
inner join movies_revenues mr using (movie_id)
where mv.release_date between '2005-01-01' and '2008-12-31'
order by 7 desc nulls last
limit 10

-- LEFT JOIN

-- count all movies for each director

select
	d.director_id,
	d.first_name,
	d.last_name,
	count(mv.movie_name) as "No of Movies"
from movies mv
left join directors d using (director_id)
group by d.director_id
order by director_id

-- get all the movies with age certification for all directors where
-- nationalities ae american chinese or japanese

select
	mv.movie_name,
	mv.age_certificate
from movies mv
left join directors d using (director_id)
where d.nationality in ('American','Chinese','Japanese')

-- RIGHT JOIN

-- list all movies with director name

select 
	mv.movie_name,
	d.first_name,
	d.last_name
from directors d
right join movies mv using (director_id)
order by movie_name

-- FULL JOIN

select 
	mv.movie_name,
	d.first_name,
	d.last_name
from directors d
full join movies mv using (director_id)
order by d.first_name

-- self join

select *
from directors t1
inner join directors t2 using (director_id)

-- find all pairs of movies that have the same movie length

select 
	t1.movie_name,
	t2.movie_name,
	t1.movie_length
from movies t1
inner join movies t2 using (movie_length)
where 
t1.movie_name <> t2.movie_name 

