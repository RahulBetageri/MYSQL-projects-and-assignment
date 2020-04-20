use `electricity_bill`;
select * from `bill`;

select * from `bill` where id=5;

select * from `bill` where id=5 and year=2017;

select * from `bill` where id=5 or year=2018;

select * from `bill` where id in(1,2,4);

select * from `bill` where id not in(1,2,4);

select * from `bill` where id=1;
select * from `bill` where id>5;
select * from `bill` where id>=5;
select * from `bill` where id<5;
select * from `bill` where id<=5;
select * from `bill` where id<>5;


