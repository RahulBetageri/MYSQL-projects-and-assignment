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

select * from `table1` natural join `table2`;
