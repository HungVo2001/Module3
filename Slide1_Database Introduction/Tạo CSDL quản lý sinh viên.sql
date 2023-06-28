insert into Class values (1,'A1', '2008-12-20', 1), (2, 'A2', '2008-12-22', 1), (3, 'B3', current_date, 0);
insert into Student (StudentName, Address, Phone, Status, ClassId) values ('Hung', 'Ha Noi', '0912113113', 1, 1), ('Manh', 'HCM', '0123123123', 0, 2);
insert into Student (StudentName, Address, Status, ClassId) values ('Hoa', 'Hai phong', 1, 1);
insert into Subject values (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);
insert into Mark values (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);