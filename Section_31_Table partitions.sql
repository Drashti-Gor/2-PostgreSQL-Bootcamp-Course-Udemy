-- table partitions

-- inheritance

create table master(
	pk integer primary key,
	tag text,
	parent integer
);

create table master_child() inherits (master);
alter table master_child
add constraint master_pk primary key (pk)

insert into master (pk,tag,parent) values
(1,'pen',0)

insert into master_child (pk,tag,parent) values
(2,'pencil',0)

select * from master;
select * from master_child;

select * from only master;
select * from only master_child;

-- partition by range

create table employees_range(
	id bigserial,
	birth_date date not null,
	country_code varchar(2) not null
)partition by range (birth_date);

create table employees_range_y2000 partition of employees_range
	for values from ('2000-01-01') to ('2001-01-01')	
	
create table employees_range_y2001 partition of employees_range
	for values from ('2001-01-01') to ('2002-01-01')	
	
insert into employees_range (birth_date, country_code) values
('2000-01-01','US'),
('2000-01-01','US'),
('2000-12-31','US'),
('2001-01-01','US');

select * from employees_range
select * from only employees_range

select * from only employees_range_y2000
select * from only employees_range_y2001

-- partition by list

create table employees_list(
	id bigserial,
	birth_date date not null,
	country_code varchar(2) not null
) partition by list (country_code)

create table employees_list_us partition of employees_list
	for values in ('US');
	
create table employees_list_eu partition of employees_list
	for values in ('UK','DE','IT','FR','ES');
	
insert into employees_list (id, birth_date, country_code) values
('1','2000-01-01','US'),
('2','2000-01-02','US'),
('3','2000-12-31','UK'),
('4','2001-01-01','DE');

select * from employees_list
select * from employees_list_us
select * from employees_list_eu

-- partition by hash

create table employees_hash(
	id bigserial,
	birth_date date not null,
	country_code varchar(2) not null
) partition by hash (country_code)

create table employees_hash_1 partition of 	employees_hash
	for values with (modulus 3, remainder 0)

create table employees_hash_2 partition of 	employees_hash
	for values with (modulus 3, remainder 1)

create table employees_hash_3 partition of 	employees_hash
	for values with (modulus 3, remainder 2)
	
insert into employees_hash (id, birth_date, country_code) values
('1','2000-01-01','US'),
('2','2000-01-02','US'),
('3','2000-12-31','UK'),
('4','2001-01-01','DE');

select * from employees_hash
select * from employees_hash_1
select * from employees_hash_2
select * from employees_hash_3

-- what happens when you try to insert a record that can't fit into any partition?

insert into employees_list (id, birth_date, country_code) values
(10,'2001-01-01','JP');

create table employees_list_default partition of employees_list default;

select * from employees_list_default
select * from employees_list

-- attach a partition

create table employees_list_sp partition of employees_list
for values in ('SP')

insert into employees_list (id, birth_date, country_code) values
('1','2020-01-01','SP')

select * from employees_list_sp

-- detach a partition 

alter table employees_list detach partition employees_list_sp