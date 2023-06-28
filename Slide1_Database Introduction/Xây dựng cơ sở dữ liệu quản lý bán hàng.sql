create table customer(
cID int not null primary key auto_increment,
cName varchar (50),
cAge int
);

create table `order`(
oID int not null primary key auto_increment,
cID int not null,
oDate datetime,
oTotalPrice float,
foreign key (cID) references customer (cID)
);

create table product(
pID int not null primary key auto_increment,
pName varchar (50),
pPrice float
);

create table orderdetail(
oID int not null,
pID int not null,
primary key (oID, pID),
odQTY int,
foreign key (oID) references `order` (oID),
foreign key (pID) references product (pID)
);

INSERT INTO customer values (1, "Hung", 18), (2, "Dat", 17), (3,"Huy", 17);
INSERT INTO `order` values (1, 1, '2023-6-25', null), (2, 2, '2023-6-26', null), (3, 1, '2023-6-27', null);
insert into product values (1,"Giày", 2);
insert into product (pName, pPrice) values  ("Dép", 1), ("Áo", 3), ("Quần", 4);
insert into orderdetail values (1,1,3), (1,3,3), (2,4,7), (3,4,5);

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select oID, oDate, oTotalPrice
from `order`;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select tb_temp.cID, tb_temp.cName, tb_temp.oID, p.pName, tb_temp.odQTY, p.pPrice
from (
	select c.cID, c.cName, o.oID, od.pID, od.odQTY
    from customer c 
    join `order` o on c.cID = o.cID
    join orderdetail od on od.oID = o.oID
	) as tb_temp
join product p on p.pID = tb_temp.pID;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select c.cName, od.oID
from customer c
left join `order` od on c.cID = od.cID 
having od.oID is null;

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
select o.oID, o.oDate, sum(od.odQTY * p.pPrice) as total
from `order` o
join orderdetail od on o.oID = od.oID
join product p on od.pID = p.pID
group by o.oID
;
