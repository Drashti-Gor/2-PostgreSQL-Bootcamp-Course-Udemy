-- DOMAIN

-- create user defined data type addr

create domain addr varchar(100) not null

create table locations(
	address addr
);

insert into locations (address) values ('123 London')

select * from locations

-- create user defined data type 'positive_numeric'

create domain positive_numeric int not null check (value>0)

create table sample(
	sample_id serial primary key,
	value_num positive_numeric
);

insert into sample (value_num) values (10)

select * from sample

-- create enumeration type domain

create domain valid_color varchar(10)
check (value in ('red','green','blue'))

create table colors(
	color valid_color
);

insert into colors (color) values ('red')

select * from colors

-- create type composit address object

create type address as(
	city varchar(20),
	country varchar(20)
);

create table companies(
	comp_id serial primary key,
	address address
);

insert into companies (address) values 
(row('London','UK')('New York','US'));

select * from companies

select (address).country from companies;

-- create composite inventory item data type

create type inventory_item as(
	product_name varchar(20),
	supplier_id int,
	price numeric
);

create table inventory(
	product_id serial primary key,
	item inventory_item
);

insert into inventory (item) values
(row('pencil',001,10.00)), 
(row('pen',002,20.00));

select * from inventory

select (item).product_name from inventory where (item).price > 5.00
