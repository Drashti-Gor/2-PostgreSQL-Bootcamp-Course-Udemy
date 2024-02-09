-- VIEWS

-- create a view to include all movies with directors first and last names

create or replace view movie_directors as
	select
		mv.movie_name,
		d.first_name,
		d.last_name
	from movies mv
	inner join directors d using (director_id)

-- using a view
select * from movie_directors

-- rename a view
alter view movie_directors rename to v_movie_quick

-- delete a view
-- DROP VIEW view_name

-- create a view to list all movies released after 1997

create or replace view v_movie_release as
	select *
	from movies
	where release_date >= '1997-01-01'
	order by release_date

-- select all movies with english language only from the view

select *
from v_movie_release
where movie_lang = 'English'
order by movie_name

-- select all movies with directors with American, and Japanese nationalities

create or replace view v_movies_directors_all as
	select *
	from movies mv
	inner join directors d using (director_id)

select
	movie_name,
	first_name,
	nationality
from v_movies_directors_all	
where nationality in ('American','Japanese')
order by 3

-- view for all the people in a movie like actors and directors with first, last names

create or replace view v_actors_directors as
	select
		first_name,
		last_name,
		'actors' as "people_type"
	from actors
	union all
	select
		first_name,
		last_name,
		'directors' as "people_type"
	from directors

select *
from v_actors_directors
order by people_type

-- connect movies, directors, movies revenues tables with a single view

create or replace view v_3_tables as
	select *
	from movies 
	inner join directors using (director_id)
	inner join movies_revenues using (movie_id)

select
	movie_name,
	age_certificate
from v_3_tables
where age_certificate = '12'

-- materialized views

create materialized view if not exists mv_directors as
	select
		first_name,
		last_name
	from directors
	with data
	
select * from mv_directors

create materialized view if not exists mv_directors_nodata as
	select
		first_name,
		last_name
	from directors
	with no data
	
select * from mv_directors_nodata

refresh materialized view mv_directors_nodata

-- refresh materialized view concurrently my_data
-- concurrently allows for the update of the materialized view without locking it


	