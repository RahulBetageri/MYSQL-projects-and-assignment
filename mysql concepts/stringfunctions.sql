select lcase("ABC");
select lower('ABC');

select ucase('abc');
select upper('abc');

select length('abcde');

select concat('abc','hello');
select concat('abc',' ','hello');


select concat_ws('-','hello','world');
select concat_ws(' ','hello','world');
select concat_ws('_','hello','world');

select replace('hello spiderman','spiderman','abc');
select replace('hello spiderman','hello spiderman','abc');


select repeat('abc',5);

select reverse('abcians');


select instr('abcians','i');
select instr('abciiansii','i');


select ascii('z');
select ascii('A');
select ascii(0);

select quote('hello');

select lpad('abcians',10,'*');
select lpad('abcian',12,'*');

select rpad('abcians',10,'*');
select rpad('abcian',12,'*');


select trim(leading 'm' from 'madam');
select trim(trailing 'm' from 'madam');
select trim(leading 'd' from 'madam'); noop 
select trim(trailing 'm' from 'madammmm');
select trim(leading 'm' from 'mmmamdam');
select trim( 'm' from 'madam');


select substr('abcians',4,2);
select substring('abcians',2,4);

select substring_index2('www.facebook.com','.',2);


select format(412.23124,2);
select format(412.23524,2);
select format(412.23724,2);

select insert('abc',2,1,'hello');
select insert('abc',2,2,'hello');
select insert('abc',2,0,'hello');


select left('abcians',2);

select right('abcians',2);
