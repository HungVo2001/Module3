alter table customers add index idx_customerName(customerName);
explain select * 
FROM customers
where customerName = 'Land of Toys Inc.';

alter table customers add index idx_full_name (contactFirstName, contactLastName);
explain select * 
FROM customers
where contactFirstName = 'Jean' or contactFirstName = 'King';

alter table customers drop index idx_full_name;
