use `electricity_bill`;
select * from bill;

select ifnull(payment_date,10) from bill;


select coalesce(null,null,null,null,null,'facebook',null,null,'whatsapp'); 
