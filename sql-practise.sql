create database college;
create database xyz_company;
drop database xyz_company;
use college;
create table student(
   rollno int,
   name varchar(30),
   age int
);
insert into student 
values
(101, "adam", 39),
(102, "john", 40);