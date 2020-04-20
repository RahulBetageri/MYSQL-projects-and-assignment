select date('2017-02-12 22:20:15');

select time('2017-02-12 22:20:15');

select current_date();
select curdate();

select current_time();
select curtime();

select current_timestamp();
select now();


select adddate('2017-04-12',interval 2 day);
select adddate('2017-04-12',interval 4 month);


select addtime('22:15:30','35');
select addtime('22:15:30','00:15:00');


select datediff('2017-12-31','2018-12-31');


select date_format('2017-12-31','%d-%m-%y');


select day('2017-12-31');


select month('2017-12-31');


select year('2017-12-31');

select now();

select dayname('2017-12-31');
select dayname(now());
select dayname(current_date());

select monthname('2017-12-31');
select monthname(now());
select monthname(current_date());

select dayofmonth(now());
select dayofmonth('2017-12-31');

select dayofweek(now());
select dayofweek('2017-12-31');

select dayofyear(now());
select dayofyear('2017-12-31');


select subdate('2017-12-31',interval 10 day);
select subdate(now(),interval 10 day);

select subtime('11:45:35', '00:10:00');

select hour('22:15:20');

select minute('22:15:20');

select second('22:15:20');


select time_to_sec('23:59:59');

select sec_to_time('2400');

select makedate(2017,13);

select maketime('23','52','11');

select time_format('23:15:00','%s:%m:%h');

select extract(day from now());
select extract(month  from now());
select extract(year from now());
select extract(day from '2017-12-21');


select system_user();


