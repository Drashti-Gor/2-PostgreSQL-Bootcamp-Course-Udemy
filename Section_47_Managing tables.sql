-- create a new table called movies_pg for all english movies with age rating pg

select *
into movies_pg
from movies
where 
	movie_lang = 'English' and
	age_certificate = 'PG'
select * from movies_pg

-- create a table called top_10_movies with top 10 most profitable movies

select
	m.movie_name,
	sum(r.revenues_domestic + r.revenues_international) as "Total Profit"
from movies m
inner join movies_revenues r using(movie_id)
group by m.movie_name
order by 2 desc nulls last
limit 10

drop table top_10_movies
