select @@autocommit;
set autocommit = 0;
create database prime;
use prime;
create table accounts(
   id int primary key auto_increment,
   name varchar(50),
   balance decimal (10, 2)
);

insert into accounts (name, balance) values
("Adam", 500.00),
("Eve", 300.00),
("Gabriel", 1000.00),
("Moses", 1500.00),
("Jacob", 700.00),
("Jesus", 1300.00);

select * from accounts;

start transaction;

update accounts set balance = balance - 50 where id = 1;
update accounts set balance = balance + 50 where id = 2;

commit;
















