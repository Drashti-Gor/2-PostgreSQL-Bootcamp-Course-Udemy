-- 1. boolean

create table table_boolean(
	product_id serial primary key,
	is_available boolean not null
);

insert into table_boolean (is_available)
values (true),(false),('t'),('f'),('yes'),('no'),('y'),('n')

select * from table_boolean

--condition checks

select *
from table_boolean
where is_available = '1'

select *
from table_boolean
where not is_available

-- set default values

alter table table_boolean
alter column is_available
set default false

-- date

create table table_dates(
	id serial primary key,
	employee_name varchar(100) not null,
	hire_date date not null,
	add_date date default current_date
);

insert into table_dates(employee_name, hire_date) values
('Adam','2020-01-01'),
('Linda','2020-02-01');

select * from table_dates

-- current date
select current_date;

--current date and time
select now();

--time

create table table_time(
	id serial primary key,
	class_name varchar(100) not null,
	start_time time not null,
	end_time time not null
);

insert into table_time(class_name,start_time,end_time) values
('MATH','08:00:00','09:00:00'),
('CHEMISTRY','09:01:00','10:00:00')

select * from table_time;

-- getting current time
select current_time;

-- getting current time with precision
select current_time(4);

-- getting local time
select localtime;

--arthmetic operations
select time '10:00' - time '04:00' as result;

--using interval
interval 'n type'

n = number
type = second, minute, hour, day, month, year...

select 
current_time,
current_time + interval '2 hours' as result;

-- TIMESTAMP and TIMESTAMPTZ

create table table_time_tz(
	ts timestamp,
	tsz timestamptz
);

insert into table_time_tz(ts,tsz) values
('2020-02-01 10:00:00-07','2020-02-01 10:00:00-07')

select * from table_time_tz

--show timezone
show timezone

-- let's change the timezone
set timezone = 'America/New_York'

-- current_timestamp
select current_timestamp;

-- current time of the day
select timeofday()

-- using timezone function to convert time based on timezone
select timezone('Asia/Singapore','2020-01-01 00:00:00')

-- UUID 

create extension if not exists "uuid-ossp"

create table table_uuid(
	product_id uuid default uuid_generate_v1(),
	product_name varchar(100) not null
);

insert into table_uuid (product_name) values
('ABC'),('XYZ')

select * from table_uuid

-- Array

create table table_array(
	id serial ,
	name varchar(100),
	phones text[]
);

insert into table_array (name, phones) values
('Adam', array['111-222-3333','111-444-5555']),
('Linda',array['111-666-7777','111-888-9999']);

select * from table_array

select
	name,
	phones[1]
from
	table_array;
	
-- hstore

create extension if not exists hstore;

create table table_hstore(
	book_id serial primary key,
	title varchar(100) not null,
	book_info hstore
);

insert into table_hstore(title,book_info) values
(
	'TITLE 1',
	'
		"Publisher" => "ABC",
		"Publishing cost" => 10.00
	'
),
(
	'TITLE 2',
	'
		"Publisher" => "XYZ",
		"Publishing cost" => 20.00
	'
);

select * from table_hstore
select book_info -> 'Publisher' from table_hstore;

--json

create table table_json(
	id serial primary key,
	docs json
);

insert into table_json(docs) values
('[1,2,3,4,5,6]'),
('[8,6,4,9,1,7]'),
('{"key":"value"}');

select * from table_json


