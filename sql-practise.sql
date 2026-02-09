create database college;
use college;
create table teacher(
   id int primary key,
   name varchar(30),
   subject varchar(15),
   salary int
);
insert into teacher 
(id, name, subject, salary)
values 
(23, "ajay", "math", 50000),
(47, "bharat", "english", 60000),
(18, "chetan", "chemistry", 45000),
(19, "divya", "physics", 75000);

select * from teacher;