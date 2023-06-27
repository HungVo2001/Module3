create table HocSinh(
MaHS int PRIMARY KEY,
TenHS varchar (50),
 NgaySinh DATETIME,
 Lop varchar (20),
 GT varchar (20)
);

create table MonHoc(
MaMH  int PRIMARY KEY,
TenMH varchar (50)
);

create table BangDiem(
MaHS int,
MaMH int,
DiemThi int,
NgayKT DATETIME,
PRIMARY KEY (MaHS, MaMH),
FOREIGN KEY (MaHS) REFERENCES HocSinh(MaHS),
FOREIGN KEY (MaMH) REFERENCES MonHoc(MaMH)
);

create table GiaoVien(
MaGV int PRIMARY KEY,
TenGV varchar (20),
SDT int
);

 alter table MonHoc add MaGV int;
 alter table MonHoc add constraint FK_MaGV FOREIGN KEY (MaGV) REFERENCES GiaoVien(MaGV);