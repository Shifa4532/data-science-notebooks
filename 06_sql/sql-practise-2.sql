select @@autocommit;
set autocommit = 0;
create database prime;
use prime;
create table accounts2(
   id int primary key auto_increment,
   name varchar(50),
   balance decimal (10, 2),
   branch varchar(30)
);
drop table accounts;
insert into accounts2 (name, balance, branch) values
("Adam", 500.00, "goa"),
("Eve", 300.00, "juhu"),
("Gabriel", 1000.00, "miami"),
("Moses", 1500.00, "maldives"),
("Jacob", 700.00, "bali"),
("Jesus", 1300.00, "hawaii");

select * from accounts;

start transaction;
update accounts set balance = balance - 1000 where id = 1;
savepoint after_wallet_topup;
update accounts set balance = balance + 10 where id = 1;
rollback to after_wallet_topup;
commit;

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

select *
from customers c
inner join orders o
on c.cust_id = o.cust_id;

select *
from customers c
left join orders o
on c.cust_id = o.cust_id
union
select *
from customers c
right join orders o
on c.cust_id = o.cust_id;

select *
from customers
cross join orders;

select *
from customers as a
join customers as b
on a.cust_id = b.cust_id;

select *
from customers as a
left join orders as b
on a.cust_id = b.cust_id
where b.cust_id is null;

select *
from customers as a
right join orders as b
on a.cust_id = b.cust_id
where a.cust_id is null;

select *
from orders
where amount > (
     select avg(amount)
     from orders
     );
     
select name,
       (
       select count(*)
       from orders o
       where o.cust_id = c.cust_id
       ) 
       as order_count
from customers c;


select 
   summary.cust_id,
   summary.avg_amount
from
   ( 
     select
         cust_id,
         avg(amount) as avg_amount
	 from orders
     group by cust_id
	) 
    as summary;
    
create view view4 as
select c.cust_id, c.name, o.order_id
from customers c
inner join orders o
on c.cust_id = o.cust_id;

select * from view4;

select* from accounts2;

create index idx_branch on accounts2(branch);

show index from accounts2;

select * from accounts2 
where branch = "goa";
     
create index idx2 on accounts2(branch, balance);
     
drop index idx2 on accounts2;
     
delimiter //

create procedure check_balance(in acc_id int, out bal decimal(10, 2))
begin
       select balance into bal
       from accounts2
       where id = acc_id;
end //
 delimiter ;
 
call check_balance(3, @balance);
select @balance;

drop procedure if exists check_balance;