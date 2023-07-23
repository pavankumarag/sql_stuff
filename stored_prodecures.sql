create table accounts(ID int generated always as identity,
					  name varchar(250) not null, 
					  bal dec(15,2) not null,
					  primary key(id));
select * from accounts;
insert into accounts(name, bal)
values ('pavan', '10000'),
('shwetha','20000'),
('aarohi', '25000')

create or replace procedure transfer(
sender int,
receiver int,
amt dec)
language plpgsql
as $$
begin
	update accounts set bal= bal-amt where id=sender;
	update accounts set bal= bal+amt where id=receiver;
	commit;
end;
$$

call transfer(1,2,1000)
call transfer(1,3,1000)

drop table actor;
create table actor(
ID int generated always as identity,
fname varchar(100) not null,
lname varchar(100) not null,
last_update TIMESTAMP(5) not null,
primary key(id))
insert into actor(fname, lname, last_update)
values ('fname1', 'lname1', now()),
('fname2', 'lname2', now()),
('fname3', 'lname3', now())
select * from actor;

create or replace procedure insert_to_actor(
fname varchar,
lname varchar
)
language plpgsql
as $$
begin
	insert into actor (fname, lname, last_update) values (fname, lname, now());
	commit;
end;
$$

call insert_to_actor('fname4', 'lname4')
select * from actor;

create or replace procedure update_to_actor(
actor_id int,
fname1 varchar
)
language plpgsql
as $$
begin
	update actor 
	set fname=fname1,
	last_update = now()
	where id = actor_id;
end;
$$
select * from actor;
call update_to_actor(1, 'new_fname1');
select * from actor;

create or replace procedure delete_from_actor(
id1 int
)
language plpgsql
as $$
begin
	delete from actor where id=id1;
	commit;
end;
$$
call delete_from_actor(1);
select * from actor;

