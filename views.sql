create table dbms_course(
ID int generated always as identity,
name varchar(100) not null,
age varchar(100) not null,
adsress varchar(100) not null,
salary dec(15,2) not null,
primary key(id));
insert into dbms_course(name, age, adsress, salary) values ('name1', 22, 'bengaluru', 100000), ('name2', 32, 'chennai', 200000), ('name3', 33,'hyderabad', 300000)
select * from dbms_course

create view dbms_salary_details as
select name,salary from dbms_course

select * from dbms_salary_details
