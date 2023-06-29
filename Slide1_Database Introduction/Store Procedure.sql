DROP PROCEDURE IF EXISTS ps_findAllCustomers
delimiter //
create procedure ps_findAllCustomers()
begin
	select *
    from customers
    where customerNumber = 175;
end//
