-- create a transaction

create table t_accounts(
	recid serial primary key,
	name varchar not null,
	balance dec(15,2) not null
);

insert into t_accounts(name,balance) values
('Adam',100),
('Linda',100)

money_transfer(from,to,amount)

create or replace procedure pr_money_transfer(
	sender int,
	receiver int,
	amount dec
)
as
$$
	begin
	-- subtract amount from senders account
	
		update t_accounts
		set balance = balance - amount
		where recid = sender;

	--adding amount to the rec end
	
		update t_accounts
		set balance = balance + amount
		where recid = receiver;
	
		commit;
	end;
$$ language plpgsql

call pr_money_transfer(1,2,50);

select * from t_accounts

-- returning a value using INOUT

create or replace procedure pr_orders_count(INOUT total_count integer default 0) as
$$
	begin
		select count(*)
		into total_count
		from orders;
	end;
$$ language plpgsql

call pr_orders_count();

-- drop a procedure

drop procedure pr_orders_count;