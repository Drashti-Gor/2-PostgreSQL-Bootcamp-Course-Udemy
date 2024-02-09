-- create schema

create schema sales;
create schema hr

-- rename a schema
alter schema sales rename to programming

-- drop a schema

drop schema programming;
drop schema hr


select * from sales.students_records

set search_path to '$user', sales, public
select * from students_records 
-- we don't have to search explicitly as sales schema is added to search path

