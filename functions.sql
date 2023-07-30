drop table users
create table users(
ID int generated always as identity,
name varchar(100) not null,
age int not null,
status varchar(100) not null,
primary key(id));

insert into users (name, age, status) values ('user1', 19, 'abc'), ('user2', 21, 'xyz'), ('user3', 17, 'def')
select * from users;
Select * from users where age > 18 order by age DESC;

create or replace function GetAge18()
RETURNS TABLE (name varchar(100), age int) AS $$

   select name, age from users where age > 18 order by age DESC;
$$ LANGUAGE SQL;

select * from GetAge18()

create or replace function GetAgeGreaterThanX(x int)
RETURNS TABLE (name varchar(100), age int) AS $$

   select name, age from users where age > $1 order by age DESC;
$$ LANGUAGE SQL;

select * from GetAgeGreaterThanX(18)
