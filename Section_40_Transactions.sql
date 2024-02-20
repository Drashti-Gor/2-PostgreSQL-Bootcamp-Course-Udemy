-- transactions

create table accounts(
	account_id serial primary key,
	name varchar(100) not null,
	balance integer not null
);

insert into accounts(name, balance) values
('Adnan',100),
('Bob', 100),
('Linda',100)

select * from accounts

-- partial transactions

begin
	update accounts
	set balance = balance - 50
	where name = 'Adnan'
	
	select * from accounts
	
	savepoint first_update
	
	update accounts
	set balance = balance - 50
	where name = 'Adnan'

	select * from accounts
	
	rollback to first_update
	
	select * from accounts
commit