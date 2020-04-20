use `electricity_bill`;
select * from `building`;

select * from `building` where `owner_name` regexp '^h';

select * from `building` where owner_name regexp 'a$';

select * from `building` where owner_name regexp 'a';
select * from `building` where owner_name regexp '[a]';
select * from `building` where owner_name regexp '[abc]';

select * from `building` where owner_name not regexp 'a';
select * from `building` where owner_name not regexp '[abc]';

select * from `building` where binary owner_name regexp 'a';
select * from `building` where binary owner_name regexp 'A';

select * from `building` where owner_name  regexp '[a-d]';

select * from `building` where owner_name  not regexp '[a-d]';

select * from `building` where owner_name  regexp '^......$';
select * from `building` where owner_name  regexp '^.{10}';










