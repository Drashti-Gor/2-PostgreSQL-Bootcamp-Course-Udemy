-- CTE

-- create a number series from 1 to 10

with num as
(
	select * from generate_series(1,10) as id
)
select * from num

-- list all movies by director id = 1

with cte_director_1 as
(
	select *
	from movies
	inner join directors using(director_id)
	where directors.director_id = 1
)
select * from cte_director_1

-- let's view all long movies where long movies are 120 mins and more

with cte_long_movies as
(
	select
		movie_name,
		movie_length,
		(
			case
				when movie_length < 100 then 'short'
				when movie_length < 120 then 'medium'
				else 'long'
			end
		)as m_length
	from movies
)
select * from cte_long_movies
where
	m_length = 'long'

-- combine cte with table
-- calculate total revenues for each directors

with cte_revenue_count as
(
	select
	d.director_id,
	sum(r.revenues_domestic + r.revenues_international) as "total_revenues"
	from directors d
	inner join movies mv using (director_id)
	inner join movies_revenues r using (movie_id)
	group by d.director_id
)
select
	director_id,
	first_name,
	last_name,
	total_revenues
from cte_revenue_count
inner join directors using (director_id)

-- simultaneously delete and insert via cte

-- articles table

create table articles(
	article_id serial primary key,
	title varchar(100)
)

--delete articles table

create table delete_articles as select * from articles limit 0; 

insert into articles (title) values
('article1'),
('article2'),
('article3'),
('article4')

select * from articles
select * from delete_articles

with cte_delete_articles as
(
	delete from articles
	--where article_id = 1
	returning *
)
insert into delete_articles
select * from cte_delete_articles

-- recursive cte

with recursive series (list_num) as
(
	select 10
	
	union all
	
	select list_num + 5 from series
	where list_num + 5 <= 50
)
select list_num from series;