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

select * from teacher
where salary > 55000;

alter table teacher
change column salary ctc int;

set sql_safe_updates = 0;

update teacher
set ctc = ctc + ctc * 0.25;

alter table teacher 
add column city varchar(50) default "gurgaon";

alter table teacher
drop column ctc;

create table student(
   rollno int primary key,
   name varchar(30),
   city varchar(20),
   marks int
   );
   
insert into student
(rollno, name, city, marks)
values
(110, "adam", "delhi", 76),
(108, "bob", "mumbai", 65),
(124, "casey", "pune", 80);

select * from student
where marks > 75;

select city, max(marks)
from student
group by city;

select avg(marks) from student;

alter table student
add column grade varchar(2);

set sql_safe_updates = 0;

update student
set grade = "O"
where marks >= 80;

update student
set grade = "A"
where marks >= 70 and marks < 80;

update student
set grade = "B"
where marks >= 60 and marks < 70;

create database company;

use company;

create table employee(
   EmpId int primary key,
   FirstName varchar(30),
   LastName varchar(30),
   Department varchar(10),
   Salary int,
   HireDate int 
);

alter table employee
modify HireDate Date;

insert into employee
(EmpId, FirstName, LastName, Department, Salary, HireDate)
values
(101, 'Alice', 'Johnson', 'IT', 6500, '2020-03-15'),
(102, 'Mark', 'Rivera', 'HR', 4800, '2019-07-22'),
(103, 'Sophia', 'Lee', 'Finance', 7200, '2021-01-10'),
(104, 'Daniel','Kim', 'IT', 5800, '2018-11-05'),
(105, 'Emma', 'Brown', 'Marketing', 5300, '2022-04-18'),
(106, 'Liam','Patel', 'Finance', 6900, '2020-09-29'),
(107, 'Olivia','Garcia', 'HR', 4600, '2017-06-30'),
(108, 'Noah', 'Thompson', 'IT', 7500, '2023-02-12'),
(109, 'Ava', 'Martinez', 'Marketing', 5100, '2019-12-02'),
(110, 'Ethan','Davis', 'Finance', 8000, '2016-05-14');

select * from employee;

select FirstName, LastName, Salary from employee;

select * from employee 
where Department = 'IT';

select * from employee
where salary > 6000;

select * from employee
order by HireDate desc;

select distinct Department from employee;

select avg(Salary) from employee;

select * from employee
where Salary between 4000 and 7000;

select * from employee
where FirstName like 'A%';

select Department, count(*) as NumEmployees
from employee
group by Department
having count(*) > 3;
