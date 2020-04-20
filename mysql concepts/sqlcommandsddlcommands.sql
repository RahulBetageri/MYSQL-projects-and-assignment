create database `commands`;
use `commands`;

create table `student`(
id int primary key,
name varchar(20) not null,
dob date not null
);

alter table `student` add column gender varchar(30);
alter table `student` add  nationality varchar(30);
show tables;
select * from student;

alter table `student` drop column gender;
alter table `student` drop  nationality;
show tables;
select * from student;

alter table `student` change id abcid int;
select * from student;


insert into `student` values(1,'rahul','2019-02-14'),(2,'amar','2019-01-15'),(3,'amar','2019-03-16');
truncate table `student`;
select * from student;

rename table `student` to `abcstudents`;
select * from abcstudents;

drop table `abcstudents`;
show tables;




