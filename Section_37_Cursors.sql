-- cursors

-- create a cursor with query parameters

declare
	cur_all_movies_by_year cursor (custom_year integer)
	for
		select
			movie_name,
			movie_length
		from movies
		where extract ('Year' from release_date) = custom_year
		
-- use cursor to list all movie names

do
$$
	declare
		output_text text default '';
		rec_movie record;
		
		cur_all_movies cursor
		for
			select * from movies;
	begin
		open cur_all_movies;
		
		loop 
			fetch cur_all_movies into rec_movie;
			exit when not found;
			
			output_text := output_text || ',' || rec_movie.movie_name;
		end loop;
		
		raise notice 'ALL MOVIE NAMES %',output_text;
	end;
$$