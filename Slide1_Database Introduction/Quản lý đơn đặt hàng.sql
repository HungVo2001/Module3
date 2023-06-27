CREATE TABLE `quanlydondathang`.`dondathang` (
  idDondathang INT NOT NULL,
  nameDDH VARCHAR(255) NULL,
  addres VARCHAR(255) NULL,
  phone INT NULL,
  creat_At DATE NULL,
  tenHang VARCHAR(255) NULL,
  descriptions VARCHAR(255) NULL,
  donViTinh FLOAT NULL,
  quantity INT NULL,
  nguoiDatHang VARCHAR(255) NULL,
  PRIMARY KEY (`idDondathang`)
  );
  
  create table `quanlydondathang`.`DeliveryNotes`(
	idSoPG int not null,
    tenDV varchar (255) null,
	address varchar(255) null,
    tenNoiGH varchar(255) null,
	ngayGiao date null,
	tenHang varchar(255),
	DVtinh float null,
	quantity int null,
	price float null,
	total float null,
	HotenNN varchar(255),
	HotenNG varchar(255),
    PRIMARY KEY (`idSoPG`)
  );
  
  create table donViDH(
  idMaDV int not null,
  tenDV varchar (255) null,
  address varchar (255) null,
  phone int null
  );
  
  create table donViKH(
  idMaDV int not null,
  tenDV varchar (255) null,
  address varchar (255) null
  );
  
  create table hang(
  idMaHang int not null,
  tenHang varchar (255),
  donViTinh float null,
  moTaHang varchar (255) null
  );
  
  create table nguoiDat(
  idMaSoND int not null,
  tenND varchar (255) null
  );
  
  create table noiGiao(
  idMaSoDDG int not null,
  tenNoiGiao varchar (255) null
  );
  
  create table nguoiNhan(
  idMaSoNN int not null,
  hoTenNN varchar (255) null
  );
  
  create table nguoiGiao(
  idMaSoNG int not null,
  hoTenNG varchar (255) null
  );