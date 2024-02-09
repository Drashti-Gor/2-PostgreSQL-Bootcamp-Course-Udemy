-- JSON

select '{
	"title":"The lord of rings"
}'::json

select '{
	"title":"The lord of rings"
}'::jsonb

-- directors table into json format

select row_to_json(directors) from directors;

select row_to_json(t) from
(
	select 
		director_id,
		first_name,
		last_name, 
		nationality
	from directors
) as t

-- build json array
select json_build_array(1,2,3,4,5)