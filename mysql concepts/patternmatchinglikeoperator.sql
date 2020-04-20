use `electricity_bill`;
select * from `building`;

select * from `building` where `owner_name` like 'h%';

select * from `building` where owner_name like '%n';

select * from `building` where owner_name like '%a%';

select * from `building` where owner_name like '______';
select * from `building` where owner_name like '_______';
select * from `building` where owner_name like 'h_';
select * from `building` where owner_name like 'h_____';


select * from `building` where owner_name not like 'h%';

select * from `building` where owner_name not like '%n';

select * from `building` where owner_name not like '%a%';

INSERT INTO `electricity_bill`.`building` (`Id`, `Owner_name`, `Address`, `Building_type_id`, `Contact_number`, `Email_address`) VALUES
 ('101', 'HAIDILdfh', 'VIVOCITYdf, 1 HARBOsURFRONT WALK, SINGAPOsRE 098585', '2', '+65 63777 6860', 'VIVO_SUPPORT@VIVOCITY.COM.SG');
select * from `building`;
select * from `building` where Email_address  like '%_%';
select * from `building` where Email_address  like '%!_%' escape '!';


INSERT INTO `electricity_bill`.`building` (`Id`, `Owner_name`, `Address`, `Building_type_id`, `Contact_number`, `Email_address`) VALUES
 ('102', 'HAIDILdfh', 'VIVOCITYdf, 1 HARBOsURFRONT WALK, SINGAPOsRE 098585', '2', '+65 63777 6860', 'VIVO%SUPPORT@VIVOCITY.COM.SG');
select * from `building`;
select * from `building` where Email_address  like '%%%';
select * from `building` where Email_address  like '%^%%' escape '^';


