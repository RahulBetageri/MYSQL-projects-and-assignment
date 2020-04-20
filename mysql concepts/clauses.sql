use electricity_bill;
show tables;
select * from `bill`;

//distinct
select distinct Month from `bill`;
select distinct year,due_date from `bill`;
select distinct fine_amount from `bill`;

//between
select * from `bill` where id between 2 and 6;
select * from `bill` where payment_date between '2017-01-01' and '2017-12-31';

//not between
select * from `bill` where id not between 2 and 6;
select * from `bill` where payment_date not between '2017-01-01' and '2017-12-31';

//in
select * from `bill` where id in(1.3,5);
select * from `building` where id in(5,10,15);

//not in
select * from `building` where id not in(10,20,30);

//null
select * from `bill` where Payment_date is null;

//not null
select * from `bill` where Payment_date is not null;

//limit
select * from `bill` where Payment_date is not null limit 6;
select * from `bill` where Payment_date is not null limit 2,4;
select total_units from `bill` where fine_amount is not null;






