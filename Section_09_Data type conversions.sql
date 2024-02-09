--Data type conversion
select cast('10' as integer)

-- expression::type

select
	'10'::integer,
	'2020-01-01'::date,
	'True'::boolean;

--CAST

create table ratings(
	rating_id serial primary key,
	rating varchar(1) not null
);

insert into ratings (rating) values
('A'),('B'),('C'),('D');

insert into ratings (rating) values
(1),(2),(3),(4);

select * from ratings

select
	rating_id,
	case
		when rating~E'^\\d+$' then
			cast (rating as integer)
		else
			0
		end as rating_id
from ratings	
	
	
	
	
	
	






