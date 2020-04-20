create database `students`;
use `students`;
create table `uniques`(
id int unique,
nam varchar(30),
age int
);
insert into uniques values(1,'rahul',18),(1,'amar',19),(null,'amar',19),(null,'amar',19);
select * from uniques;
show tables;

create table `notnull`(
id int ,
nam varchar(30) not null,
age int not null
);
insert into notnull values(1,'rahul',18),(2,'amar',19),(3,'amar',19),(4,null,null);
select * from notnull;

create table `checks`(
id int ,
nam varchar(30) not null,
age int not null check(age>18)
);
insert into checks values(1,'rahul',18),(2,'amar',18),(3,'amar',19);
select * from checks;

create table `defaults`(
id int ,
nam varchar(30) not null,
age int not null,
married varchar(30) default 'unmarried',
nationality varchar(20) default 'indian'
);
insert into defaults(`id`,`nam`,`age`) values(1,'rahul',18),(2,'amar',18),(3,'amar',19);
select * from defaults;


create table `primary_key`(
id int primary key,
name varchar(30),
age int
);
insert into primary_key(`id`,`name`,`age`) values(1,'rahul',18),(2,'amar',18),(3,'amar',19);
select * from primary_key;

create table `department`(
d_id int primary key,
d_name varchar(30) not null
);

create table `student`(
s_id int primary key,
s_name varchar(30),
s_age int not null,
foreign key(s_id) references department(d_id)
);

create table `autoincrement1`(
id int auto_increment,
nam varchar(20),
age int
);











