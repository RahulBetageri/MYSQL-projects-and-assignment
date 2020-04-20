create database `joins`;
use `joins`;

create table `table1`(
A int,
B int
);
insert into `table1` values (1,2),(3,4),(5,6),(7,8);
create table `table2`(
B int,
C int
);
insert into `table2` values (2,1),(8,1),(9,1);

select * from table1;
select * from table2;

select * from `table1` inner join `table2`;

select * from `table1` inner join `table2`
on table1.B=table2.B;

select * from `table1` inner join `table2`
on table1.A=table2.C;

select * from `table1` inner join `table2`
on table1.B=table2.C;

select * from `table1`,`table2`
where table1.B=table2.B;  equijoin

select * from `table1`,`table2`
where table1.B=table2.B;   simplejoin