select CARD_ID,AMOUNT,AMOUNT+10 as amountincre from LIBRARY_CARD_MASTER; 
select CUSTOMER_NAME, AGE, AGE-1 AS DecreAge from CUSTOMER_MASTER;
select CARD_ID from LIBRARY_CARD_MASTER where AMOUNT=800;
select CUSTOMER_ID,CONTACT_NO from CUSTOMER_MASTER where CUSTOMER_NAME='MOHAN';
select MOVIE_NAME from MOVIES_MASTER where MOVIE_TYPE  <> 'U/A';
select * from LIBRARY_CARD_MASTER where NUMBER_OF_YEARS < 7;
select MOVIE_NAME from MOVIES_MASTER where MOVIE_ID in ('MV001','MV002'); 
select CUSTOMER_ID from CUSTOMER_CARD_DETAILS where CARD_ID in ('CR001','CR004');
select CARD_ID from CUSTOMER_CARD_DETAILS where CUSTOMER_ID in ('CUS004','CUS005');
select MOVIE_NAME from MOVIES_MASTER where LANGUAGE IN ('ENGLISH','KANNADA');


select * from electricity_connection_type;
select * from building_type;
select * from building;
select * from electricity_reading;
select Owner_name,Contact_number from building;
select Total_units,Payable_amount,Fine_amount from bill;
select * from slab;
select Owner_name,Address,Contact_number from building;


select * from metro_train.travel_card where person_name='MICHAEL';
select * from metro_train.travel_payment where amount > 30;