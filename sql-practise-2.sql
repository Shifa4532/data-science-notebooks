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
rollback;


create table customers (
    cust_id int primary key,
    name varchar(50),
    city varchar(50)
);

insert into customers values
(1, 'alice', 'mumbai'),
(2, 'bob', 'delhi'),
(3, 'charlie', 'bangalore'),
(4, 'davide', 'mumbai');

create table orders (
   order_id int primary key,
   cust_id int,
   amount int
);

insert into orders values
(101, 1, 500),
(102, 1, 900),
(103, 2, 300),
(104, 5, 700);

select * from customers;
select * from orders;

   




















