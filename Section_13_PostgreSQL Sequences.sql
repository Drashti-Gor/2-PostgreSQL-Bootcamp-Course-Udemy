-- create sequence
create sequence if not exists test_seq

-- return new value
select nextval('test_seq')

--RESTART
alter sequence test_seq restart with 1

--RENAME
alter sequence test_seq rename to my_test
select nextval('my_test')

-- increment,min,max,start with

create sequence if not exists test_seq1
increment 50
minvalue 400
maxvalue 6000
start with 500

select nextval('test_seq1');

-- desceinding sequence
create sequence if not exists seq_des
increment -1
minvalue 1
maxvalue 4
start 4
cycle

select nextval('seq_des')

-- share sequence among tables

create sequence common_fruits_seq start with 100

create table apples(
	fruit_id int default nextval('common_fruits_seq') not null,
	fruit_name varchar(50)
);

create table mangoes(
	fruit_id int default nextval('common_fruits_seq') not null,
	fruit_name varchar(50)
);

insert into apples (fruit_name) values ('red appples');
insert into mangoes (fruit_name) values ('orange mangoes');

select * from apples
select * from mangoes

-- create alphanumeric sequences

create sequence table_seq;

create table contacts(
	contact_id text not null default ('ID'|| nextval('table_seq')),
	contact_name varchar(20)
); 

insert into contacts (contact_name) values
('Harry'),
('Sam');

select * from contacts