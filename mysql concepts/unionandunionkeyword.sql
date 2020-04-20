create database `college`;
use `college`;


create table `emp1_table`(
name varchar(30),
salary int,
emp_id int
);
insert into `emp1_table` (name,`emp_id`) values ('a',10),('b',20),('c',30),('x',40);


create table `stud_table`(
name varchar(30),
marks int,
s_id int
);
insert into `stud_table` (name,s_id) values ('aa',1),('ab',2),('ac',3),('xa',4);
select * from stud_table;

select emp_id from `emp1_table` union all select s_id from `stud_table`;

select emp_id from `emp1_table` union  select s_id from `stud_table`;

