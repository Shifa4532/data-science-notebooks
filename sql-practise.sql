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

select * from student;