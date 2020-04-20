use electricity_bill;
show tables;
select * from bill;
select * from meter;
select * from building;
select * from electricity_connection_type;
select * from building_type;
select * from slab;

select * from `bill` as b,`meter` as m 
where m.id=b.meter_id
order by payable_amount;


select b.owner_name,b.address,b.contact_number,m.meter_number
from `building` as b,`meter` as m
where b.id=m.building_id
order by owner_name,meter_number;


select b.owner_name,b.address,b.contact_number,m.meter_number,ect.connection_name,bt.name
from `building` as b,`meter` as m,`electricity_connection_type` as ect,building_type as bt
where ect.id=bt.connection_type_id and bt.id=b.building_type_id and b.id=m.building_id
order by owner_name,meter_number;


select ect.connection_name,s.from_unit,s.to_unit ,s.rate
from `electricity_connection_type` as ect,`slab` as s
where ect.id=s.connection_type_id 
order by rate;

select b.owner_name,b.address,count(ect.id) as connection_count 
from `building` b,`electricity_connection_type` ect ,`building_type` as bt
where b.building_type_id=bt.id and bt.connection_type_id=ect.id 
group by owner_name,address
order by owner_name; 





select * from bill;
select max(fine_amount) from bill;
select b.owner_name,b.address,m.meter_number,bi.payable_amount
from `building` as b,`meter` m,`bill` bi
where b.id=m.building_id and m.id=bi.meter_id and fine_amount=null and year=2017 and month=12 
order by owner_name;

select * from bill;
select max(fine_amount) from bill;
select b.owner_name,b.address,m.meter_number,bi.payable_amount,bi.fine_amount
from `building` as b,`meter` m,`bill` bi
 where b.id=m.building_id and m.id=bi.meter_id and fine_amount=(select max(fine_amount) from bill) 
order by owner_name;


select * from bill;
select max(fine_amount) from bill;
select b.owner_name,b.address,m.meter_number,bi.payable_amount,max(bi.fine_amount)
from `building` as b,`meter` m,`bill` bi
 where b.id=m.building_id and m.id=bi.meter_id 
order by owner_name; //wrong







