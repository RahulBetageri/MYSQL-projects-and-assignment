use `electricity_bill`;
select * from `bill`;

select * from `bill` order by Due_date;
select * from `bill` order by Due_date asc;
select * from `bill` order by Due_date desc;

select * from `bill` order by Due_date asc ,month desc;
select id,Month,Total_units from `bill` order by month asc,Total_units asc;
select id,Month,Total_units from `bill` order by month asc,Total_units desc;





