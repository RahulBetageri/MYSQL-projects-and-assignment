create database `commands3`;
use `commands3`;

create table `student`(
id int primary key,
name varchar(20) not null,
dob date not null
);

insert into `student` values(1,'rahul','2019-02-14'),(2,'amar','2019-01-15'),(3,'amar','2019-03-16');
select * from student;

update `student` set id=10 where id=3;
select * from student;

delete from `student`;