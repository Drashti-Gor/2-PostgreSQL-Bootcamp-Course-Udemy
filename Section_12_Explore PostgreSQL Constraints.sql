-- FOREIGN KEY

-- parent table

create table products(
	product_id int primary key,
	product_name varchar(50) not null,
	supplier_id int not null,
	foreign key (supplier_id) references suppliers (supplier_id)
);

-- child table (foreign table)

create table suppliers(
	supplier_id int primary key,
	supplier_name varchar(50) not null
);

insert into suppliers (supplier_id,supplier_name) values
(1,'SUPPLIER 1'),
(2,'SUPPLIER 2');

select * from suppliers

insert into products (product_id,product_name,supplier_id) values
(1,'ABC',2),
(2,'XYZ',1);

insert into products (product_id,product_name,supplier_id) values
(3,'PQR',3);

select * from products

-- CHECK constraint

create table prices(
	prices_id serial primary key,
	product_id int not null,
	price numeric not null,
	discount numeric not null,
	valid_from date not null
);

alter table prices
add constraint price_check
check(
	price > 0
	and discount >= 0
	and price > discount
);




