use electricity_bill;

select * from meter;
select meter_number from `meter`;

select * from `building`;
select * from `building` where owner_name='nicholas';


select * from `building` where building_type_id=2;


select * from `bill`;
select meter_id,payable_amount-1000 from `bill`;
select meter_id,payable_amount-1000 as final_amt from `bill`;

select * from `bill`;
select payable_amount,fine_amount+100 as final_fine_amount from `bill`;

select * from `bill`;
select  meter_id,fine_amount+(fine_amount*5/100) as fianl_fine_amount from `bill`;

select * from `bill`;
select payment_date,meter_id,fine_amount-(fine_amount*3/100) as final_fine_amount from `bill`;

select * from `bill`;
select meter_id,fine_amount*12 as annual_fine_amount from `bill`;


select * from `bill`;
select id,fine_amount-(fine_amount*2/100) as final_fine_amount from `bill` where id=2 ;

select * from `bill`;
select meter_id,fine_amount+50,(fine_amount+50)*12 as annual_fine_amount from `bill`;


select * from building_type;
select name from `building_type` where connection_type_id=2;


select * from meter;
select id,meter_number from `meter` where id>10;

select * from bill;
select fine_amount from `bill` where payable_amount<30000;

select * from `bill`;
select * from `bill` where total_units>10000;

select * from `bill`;
select * from `bill` where due_date='2017-10-01';

select * from `bill`;
select * from `bill` where payment_date>='2018-01-01' and payment_date<='2018-12-31';

select * from `bill`;
select meter_id,fine_amount from `bill` where (fine_amount*12)>30000;
select meter_id,fine_amount as annual_fine_amount from `bill` where (fine_amount*12)>30000;


select * from slab;
select rate from `slab` where from_unit=2001 and to_unit=4500;

select * from `electricity_reading` ;
select * from `electricity_reading` where total_units>=500 and total_units<=1000;

select * from `electricity_reading`;
select meter_id from `electricity_reading` where H13<H14;

select * from building;
select owner_name from building where building_type_id=1 or building_type_id=2;

select * from bill;
select *  from bill where due_date<'2018-01-01' and fine_amount>10000 and fine_amount<20000;














