drop procedure if exists getCusById
delimiter //
create procedure getCusById(
	IN cusNum int(11)
)
begin
	select *
    from customers 
    where customerNumber = cusNum;
end//

call getCusById(175);

drop procedure if exists GetCustomersCountByCity
delimiter //
create procedure GetCustomersCountByCity(
	IN in_city varchar(50),
    OUT total INT
)
begin
	select count(customerNumber)
    INTO total
    from customers
    where city = in_city;
end//

CALL GetCustomersCountByCity('Lyon',@total);

SELECT @total;

drop procedure if exists SetCounter
delimiter //
create procedure SetCounter(
	INOUT counter INT,
    IN inc INT
)
begin
	
    SET counter = counter + inc;
    
end//

set @counter = 1 ;
call SetCounter(@counter, 1);
call SetCounter(@counter, 1);
call SetCounter(@counter, 5);
select @counter;