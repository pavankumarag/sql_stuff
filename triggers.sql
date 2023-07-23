create table clients(
ID int generated always as identity,
fname varchar(50) NOT NULL,
lname varchar(50) NOT NULL,
PRIMARY KEY (ID)
);

create table client_audits(
CLIENT_ID int generated always as identity,
fname varchar(50) NOT NULL,
lname varchar(50) NOT NULL,
changed_on TIMESTAMP(5) NOT NULL
);

drop table client_audits;

create or replace function log_first_name_changes()
RETURNS TRIGGER
LANGUAGE PLPGSQL
AS $$
BEGIN

IF NEW.fname <> OLD.fname then
INSERT INTO client_audits (fname, lname, changed_on)
VALUES(OLD.fname, OLD.lname, now());
END IF;
RETURN NEW;
END;
$$

create trigger fname_changes
BEFORE UPDATE
ON clients
FOR EACH ROW
EXECUTE PROCEDURE log_first_name_changes();

insert into clients(fname, lname) VALUES ('pavan', 'kumar')

select * from clients;

update clients 
SET fname = 'Druv'
where id = 1;

select * from client_audits;

