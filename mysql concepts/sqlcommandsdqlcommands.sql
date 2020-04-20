create database `commands2`;
use `commands2`;

create table `student`(
id int primary key,
name varchar(20) not null,
dob date not null
);
select * from student;