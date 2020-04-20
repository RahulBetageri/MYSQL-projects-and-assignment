 create table   metro_trains.employee (emp_id int primary key auto_increment, 
 name varchar(30) not null,age int check(age>18),maritalstatus varchar(10) default 'no',address varchar(50));

Create table electricity_bills.electricity_connection_type (Id int(11) primary key,
Connection_name varchar(20) not null);

Create table electricity_bills.slab(Id int(11) primary key,Connection_type_id int (11) not null,
From_unit int(11) not null,To_unit int(11) not null,Rate double not null,
Foreign key (Connection_type_id) references electricity_bill.electricity_connection_type(id));

Create table electricity_bills.building_type (Id int (11) primary key, Name varchar(100) not null,
Connection_type_id int(11) not null, Foreign key(Connection_type_id) 
references electricity_bill.electricity_connection_type(id));

Create table electricity_bills.building (Id int(11) primary key, Owner_name varchar(100) not null, Address varchar(100) not null,
Building_type_id int(11) not null, Contact_number varchar(100) not null, Email_address varchar(100),
Foreign key(Building_type_id) references electricity_bill.building_type(id));

alter table electricity_bills.building change Owner_name  building_Owner_name varchar(100);
alter table  electricity_bills.building modify column Address varchar(255);

alter table electricity_bills.electricity_connection_type
add constraint check_connection_name check(connection_name in('commercial','home'));

rename table electricity_bills.building to electricity_bills.building_details; 
drop table electricity_bills.slab;
drop table electricity_bills.building_details;


CREATE TABLE metro_trains.route (id INT(11) NOT NULL,route_name VARCHAR(255) NOT NULL, PRIMARY KEY (id));

CREATE TABLE metro_trains.station (id INT(11) NOT NULL,name VARCHAR(100) NOT NULL,
 locality VARCHAR(100) NOT NULL,is_interchange TINYINT(1) NULL,PRIMARY KEY (id));
 
 alter table metro_trains.station change locality station_locality varchar(100);
 rename table metro_trains.station to metro_trains.station_details;
 drop table metro_trains.station_details;


select branch_id,loan_amount,loan_amount+1000 as loanIncrease from bank.loan_details;

select account_number,transaction_amount,transaction_amount-100 as transaction_amount_decrease 
from bank.transaction_details;
 
select opening_balance, opening_balance+opening_balance*(1/100) from bank.account_master;
select transaction_type from bank.transaction_details where transaction_amount=2000;
select loan_amount,branch_id from bank.loan_details where loan_amount < 500000;
select branch_city from bank.branch_master where branch_name='JASOLA';
select FIRSTNAME from bank.customer_master where CUSTOMER_CITY in ('DELHI','KOLKATA');
select lastname from bank.customer_master where occupation in ('STUDENT','TEACHER');

select account_number  from bank.transaction_details where medium_of_transaction='CHEQUE' AND
medium_of_transaction='CASH';

select CUSTOMER_NUMBER from bank.customer_master where occupation='SERVICE' and occupation ='STUDENT';



select station_id,id,id+1 as Increment_id from metro_train.station_route;

select entry_station_id,entry_station_id+entry_station_id*(10/100) as entry_station_hike
from metro_train.travel_payment;

select travel_card_id,amount, amount+10 as increment_amount from metro_train.travel_payment;
select route_name from metro_train.route where id > 1;
select  travel_card_id from metro_train.travel_payment where amount <=20;
select name from metro_train.station where is_interchange <> 0;
select station_id from metro_train.station_route where position in (1,2);
select id from metro_train.metro_train where forward in (1,2);
select route_id from metro_train.station_route where position=1 and position=2;
select route_id from metro_train.station_route where id=101 and id=105;



select * from electricity_bill.electricity_connection_type order by Connection_name;
select * from electricity_bill.building_type order by Name;
select * from electricity_bill.building order by Owner_name;
select * from electricity_bill.electricity_reading  order by Total_units desc;
select Owner_name,Contact_number from electricity_bill.building order by Owner_name;
select Total_units,Payable_amount,Fine_amount from  electricity_bill.bill order by Total_units desc;
select * from electricity_bill.slab order by From_unit ;
select * from electricity_bill.bill where Total_units > 10000 order by Total_units desc;
select * from electricity_bill.bill where Due_date ='2017-10-01' order by Payable_amount desc;

select * from electricity_bill.bill where Payment_date >='2018-01-01' and Payment_date <='2018-12-31'
order by Payable_amount desc;
 
select Owner_name,Address,Contact_number from electricity_bill.building 
where Email_address is null order by Owner_name;

select * from electricity_bill.building where Building_type_id =2 order by Owner_name;
select * from electricity_bill.electricity_reading where Total_units between 500 and 1000 order by Total_units;
select * from electricity_bill.bill where Is_payed = 0 order by Due_date ;
select Meter_id,Total_units from  electricity_bill.electricity_reading where H13 < H14 order by Total_units desc;



select * from metro_train.station where is_interchange = 0 order by name ;
select * from metro_train.station where name like 'K%' order by name;
select * from metro_train.travel_payment where amount > 30 order by entry_time;
select * from metro_train.train_arrival_time where deviation = 0  order by metro_train_id;
select * from metro_train.route where route_name like 'D%';
select * from metro_train.route where route_name like '%N';
select * from metro_train.route where route_name like '_O%';



select * from bank.customer_master where FIRSTNAME like 'R%';
select substr(branch_name,10,5) from bank.branch_master where branch_name='NEW DELHI MAIN BRANCH';
select * from customer_master where lastname like '__R%';
select * from branch_master where branch_name like '%M';



select Due_date,Payable_amount,Payment_date from electricity_bill.bill 
where Payment_date not between '2017-09-10' and '2017-10-10';

select * from electricity_bill.building_type where Name like '%L' order by Name;
select * from electricity_bill.building where Owner_name like '%DI%' order by Owner_name;
select substr("Tendulkar",2,5);
select substr("RajaRamMohanRoy",9,3);
select Owner_name,substr(Owner_name,1,1) from electricity_bill.building;
select Owner_name,instr(Owner_name,"A") from electricity_bill.building;
select Owner_name,substr(Owner_name,6,3) from electricity_bill.building where Owner_name ='MUHAMMAD HAFAZ';
select Owner_name,instr(Owner_name,"MAD") from electricity_bill.building where Owner_name ='MUHAMMAD HAFAZ';



select name as station_code,substr(name,1,3) from metro_train.station order by station_code desc;
select name as modified_station_name, rpad(name,25,"#") from metro_train.station order by name;
select  replace("Madan","a","*") as modified_name;


select * from electricity_bill.building where Id%2=0;
select round(1234.356,1);
select truncate(1234.356,1);
select timestampdiff(MONTH,'1993-08-15',now());
select timestampdiff(YEAR,'1993-08-15',now());
select timestampdiff(DAY,'1993-08-15',now());


select CUSTOMER_NUMBER,FIRSTNAME,CUSTOMER_DATE_OF_BIRTH  from bank.customer_master 
order by CUSTOMER_DATE_OF_BIRTH,FIRSTNAME;

select CUSTOMER_NUMBER,FIRSTNAME,middlename,ifnull(middlename,lastname) as Middle_Name
from bank.customer_master order by CUSTOMER_NUMBER;


 select CUSTOMER_ID,CUSTOMER_NAME,AGE,CONTACT_NO,ifnull(CONTACT_NO,"N/A") as CONTACT_NO_NA,
 concat(("+91-"),left(CONTACT_NO,3), "-",mid(CONTACT_NO,4,3) , "-", right(CONTACT_NO,4)) as CONTACT_ISD 
 from movie.customer_master where AGE > 25 and DATE_OF_REGISTRATION between '2012-01-01' and '2012-12-31'
 order by AGE,CUSTOMER_NAME;
 
select CUSTOMER_ID,CUSTOMER_NAME,AGE,CONTACT_NO,ifnull(CONTACT_NO,"N/A") as CONTACT_NO_NA,
concat(("+91-"),left(CONTACT_NO,3), "-",mid(CONTACT_NO,4,3) , "-", right(CONTACT_NO,4)) as CONTACT_ISD 
from movie.customer_master where AGE > 18 and DATE_OF_REGISTRATION between '2012-01-01' and '2012-12-31'
order by AGE,CUSTOMER_NAME;


select avg(H8) as 'average_8th_hour_consumption' from electricity_bill.electricity_reading;
select avg(Total_units) as 'average_units_of_electricity' from electricity_bill.electricity_reading;
select avg(Payable_amount) as 'average_payable_amount' from electricity_bill.bill where Payable_amount > 10000;
select sum(Payable_amount) as 'sum_payable_amount' from electricity_bill.bill;
select sum(H12) as 'sum_12th_hour_consumption' from electricity_bill.electricity_reading;
select sum(Payable_amount) as 'sum_payable_amount' from electricity_bill.bill where Due_date = '2017-10-01';
select min(Total_units) as 'min_total_units' from electricity_bill.electricity_reading;
select min(Fine_amount) as 'min_fine_amount' from  electricity_bill.bill;
select sum(Payable_amount) as 'sum_payable_amount' from electricity_bill.bill
where Payment_date between '2018-01-01' and '2018-12-31';
select max(Payable_amount) as 'max_payable_amount' from electricity_bill.bill;
select count(Fine_amount) as 'count_of_bills_with_fine' from electricity_bill.bill;
select count(Payment_date) as bill_count from electricity_bill.bill where Payment_date = '2017-09-23';



select count(balance) as min_balance_count from metro_train.travel_card where balance < 45;
select count(balance) as max_balance_count from metro_train.travel_card where balance >= 45;
select * from metro_train.travel_card where balance >= 45 order by balance desc;
select sum(amount) as total_payment from travel_payment;

select count(metro_train_id) as total_trains from metro_train.train_arrival_time
where actual_time between'2017-12-21 00:00:00' and '2017-12-21 23:59:59';

select travel_card_id,entry_station_id,sum(amount) as total_amount from metro_train.travel_payment
where entry_time between '2017-12-21 00:00:00' and '2019-12-23 23:59:59' ;


select count(CUSTOMER_NUMBER) as Cust_Count from bank.customer_master where CUSTOMER_CITY="DELHI";