-- Tạo View có tên customer_views truy vấn dữ liệu từ bảng customers để lấy các dữ liệu: customerNumber, customerName, phone bằng câu lệnh SELECT:
create view customer_view as
select customerNumber, customerName, phone
from customers;


-- Cập nhật customer_view
create or replace view customer_view as
select customerNumber, customerName, contactFirstName, contactLastName, phone
from customers
where city = 'Nantes';

-- Xóa customer_view
drop view customer_view;


