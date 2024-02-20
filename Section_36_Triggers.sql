-- Triggers

create table players(
	player_id serial primary key,
	name varchar(100)
);

create table players_audits(
	player_audit_id serial primary key,
	player_id int not null,
	name varchar(100) not null,
	edit_date timestamp not null
);

create or replace function fn_player_name_changes()
	returns trigger
	language plpgsql
	as
$$
	begin
		if new.name <> old.name then
			insert into players_audits
			(
				player_id,
				name,
				edit_date
			)
			values
			(
				old.player_id,
				old.name,
				NOW()
			);
		end if;
		return new;
	end;
$$

create trigger trg_players_name_changes
	before update
	on players
	for each row
	execute procedure fn_player_name_changes();
	
insert into players (name) values
('Adam'),
('Linda')

update players
set name = 'Linda3'
where player_id = 2

select * from players
select * from players_audits