create database `joins`;
use `joins`;

create table `tab1`(
A int,
name varchar(30),
mgr_id int
);
insert into `tab1` values (1,'A',3),(2,'B',1),(3,'C',3);

select a.name as emp_name,b.name as manager_name from `tab1` as a,`tab1` as b
where a.mgr_id=b.A;
