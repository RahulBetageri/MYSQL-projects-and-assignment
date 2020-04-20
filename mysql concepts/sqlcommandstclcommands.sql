create database `commands4`;
use `commands4`;

create table `student`(
id int primary key,
name varchar(20) not null,
dob date not null
);

set autocommit=0;
insert into `student` values(1,'rahul','2019-02-14'),(2,'amar','2019-01-15'),(3,'amar','2019-03-16');
select * from student;
commit;
delete from `student`;
rollback;
select * from student;
truncate table `student`;
rollback;
select * from student;

