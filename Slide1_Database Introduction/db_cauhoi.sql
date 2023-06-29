-- ***Dùng các hàm gộp 
-- Câu 1: Cho biết số lượng giáo viên của toàn trường
select count(giaovien.maGV) from giaovien;
-- Câu 2: Cho biết số lượng giáo viên của bộ môn HTTT
select count(giaovien.mabm) from giaovien where MABM = 'HTTT';
-- Câu 3: Tính số lượng giáo viên có người quản lý về mặt chuyên môn
select count(giaovien.gvqlcm) from giaovien where GVQLCM is not null;
-- Câu 4: Tính số lượng giáo viên làm nhiệm vụ quản lý chuyên môn cho giáo viên khác mà
-- thuộc bộ môn HTTT.
select count(giaovien.gvqlcm) from giaovien where GVQLCM and MABM = 'HTTT';
-- Câu 5:  Tính lương trung bình của giáo viên bộ môn Hệ thống thông tin
select avg(giaovien.luong) from giaovien;
-- ***Dùng group by
-- Câu 6: Với mỗn bộ môn cho biết bộ môn (MAMB) và số lượng giáo viên của bộ môn đó.
select MABM, count(MAGV) from giaovien group by MABM; 
-- Câu 7: Với mỗi giáo viên, cho biết MAGV và số lượng công việc mà giáo viên đó có tham
-- gia.
select MAGV, count(madt) from thamgiadt group by MAGV;
-- Câu 8: Với mỗi giáo viên, cho biết MAGV và số lượng đề tài mà giáo viên đó có tham gia.
select MAGV, count(DISTINCT madt) from thamgiadt group by MAGV;
-- Câu 9:  Với mỗi bộ môn, cho biết số đề tài mà giáo viên của bộ môn đó chủ trì
select giaovien.MABM, count(DISTINCT MADT) from detai, giaovien where detai.GVCNDT = giaovien.MAGV group by giaovien.MABM;
-- Câu 10: Với mỗn bộ môn cho biết tên bộ môn và số lượng giáo viên của bộ môn đó.
select bomon.TENBM, count(MAGV) from giaovien, bomon where giaovien.MABM = bomon.MABM group by bomon.MABM, bomon.TENBM;
-- --***Dùng GROUP BY + HAVING
-- Câu 11: Cho biết những bộ môn từ 2 giáo viên trở lên.
-- Câu 12: Cho tên những giáo viên và số lượng đề tài của những GV tham gia từ 3 đề tài trở
-- lên.
-- Câu 13: Cho biết số lượng đề tài được thực hiện trong từng năm.
-- ************************************************A
-- Dùng truy vấn con + mệnh đề SELECT
-- Câu A1: Với mỗi bộ môn, cho biết tên bộ môn và số lượng giáo viên của bộ môn đó.
-- Dùng truy vấn con + mệnh đề FROM
-- Câu A2: Cho biết họ tên và lương của các giáo viên bộ môn HTTT
-- Dùng truy vấn con + mệnh đề WHERE
-- Câu A3: Cho biết những giáo viên có lương lớn hơn lương của giáo viên có MAGV=‘001’
-- Câu A4: Cho biết họ tên những giáo viên mà không có một người thân nào
-- Câu A5: Cho những giáo viên có tham gia đề tài
-- Câu A6: Cho những giáo viên có lương nhỏ nhất
-- Câu A7: Cho những giáo viên có lương cao hơn tất cả các giáo viên của bộ môn HTTT
-- Câu A8: Cho biết bộ môn (MABM) có đông giáo viên nhất
-- Câu A9: Cho biết họ tên những giáo viên mà không có một người thân nào. (Sử dụng ALL
-- thay vì NOT IN)
-- Câu A10: Cho biết họ tên những giáo viên có tham gia đề tài. (Sử dụng = ANY thay vì IN)
-- Câu A11: Cho biết các giáo viên có tham gia đề tài.
-- Câu A12: Cho biết các giáo viên không có người thân
-- Câu A14: Cho biết những giáo viên có lương lớn hơn lương trung bình của bộ môn mà giáo
-- viên đó làm việc.
-- Câu A15: Cho biết những giáo viên có lương lớn nhất
-- Câu A16: Cho biết những đề tài mà giáo viên ‘001’ không tham gia.
-- Câu A17: Cho biết họ tên những giáo viên có vai trò quản lý về mặt chuyên môn với các giáo
-- viên khác
-- Câu A18: Cho biết những giáo viên có lương lớn nhất.
-- Câu A19: Cho biết những bộ môn (MABM) có đông giáo viên nhấ
-- Câu A20: Cho biết những tên bộ môn, họ tên của trưởng bộ môn và số lượng giáo viên của
-- bộ môn có đông giáo viên nhất
-- Câu A21: Cho biết những giáo viên có lương lớn hơn mức lương trung bình của giáo viên bộ
-- môn Hệ thống thông tin mà không trực thuộc bộ môn hệ thống thông tin
-- Câu A22: Cho tên biết đề tài có đông giáo viên tham gia nhất
-- viên bộ môn Hệ thống thông tin mà không trực thuộc bộ môn hệ thống thông tin
-- ************************************************B
-- Câu B2: Tìm các giáo viên không tham gia đề tài nào
-- Câu B3: Tìm các giáo viên vừa tham gia đề tài vừa là trưởng bộ môn.
-- Câu B4: Liệt kê những giáo viên có tham gia đề tài và những giáo viên là trưởng bộ môn.
-- Câu B5: Tìm các giáo viên (MAGV) mà tham gia tất cả các đề tài
-- Câu B6: Tìm các giáo viên (MAGV) mà tham gia tất cả các đề tài (Dùng NOT EXISTS)
-- Câu B7: Tìm các giáo viên (MAGV) mà tham gia tất cả các đề tài (Dùng NOT EXISTS)
-- Câu B9: Tìm tên các giáo viên ‘HTTT’ mà tham gia tất cả các đề tài thuộc chủ đề ‘QLGD


-- ADVANCED
-- Cho biết tên giáo viên và tên của giáo viên có nhiều người thân nhất
-- Cho biết tên của giáo viên lớn tuổi nhất của bộ môn hệ thống thông tin
-- Cho biết tên những đề tài mà giáo viên Nguyễn Hoài An chưa tham gia
-- Cho biết tên của giáo viên chủ nhiệm nhiều đề tài nhất.
-- Cho biết tên giáo viên và tên bộ môn của giáo viên tham gia nhiều đề tài nhất
-- Cho biết tên đề tài nào mà được tất cả giáo viên của bộ môn hóa hữu cơ tham gia

-- left join, right join
SELECT c.*,p.*
FROM categories c left join products as p on  p.category_id = c.id ; 

-- join 3 bang
SELECT * 
FROM orders as o join orderitems as ot on o.id = ot.id_order
	join products as p on p.id = ot.id_product
    left join product_infos as pi on p.id = pi.id_product
where o.id = 1;

-- dung toan tu in: de tim ra san pham co bán được và ko bán được
SELECT * FROM shopping_management.products
WHERE products.id in (select orderitems.id_product from orderitems);
SELECT * FROM shopping_management.products
WHERE products.id not in (select orderitems.id_product from orderitems);


-- dùng toán từ all
SELECT * FROM shopping_management.products
where products.price >= all (select price from products);

-- count *: đếm dòng
SELECT count(*) as tongso_gv
from giaovien;
-- count cột: đếm những giá trị của cột mà không null
SELECT count(GVQLCM) as tongso_gv
from giaovien;

select MABM, count(*) as soluong_gv
from GIAOVIEN 
group by MABM
having soluong_gv > 2;

-- tìm xem mỗi bộ môn có bao nhiêu giáo viên nam
select MABM, count(*) as sl
from giaovien 
where phai = 'Nam'
group by MABM;

-- tìm xem mỗi bộ môn có bao nhiêu giáo viên nam, hiển thị thêm thông tin khoa
select gv.MABM,k.TENKHOA, count(*) as sl
from giaovien gv join bomon bm on gv.MABM = bm.MABM join khoa k on k.MAKHOA = bm.MAKHOA
where phai = 'Nam'
group by MABM;

-- tìm xem mỗi bộ môn có bao nhiêu giáo viên nam nếu không có hiển thị là 0
SELECT *, (SELECT count(*)
			FROM giaovien where PHAI = 'NAM' and MABM = bm.MABM) as sl
FROM bomon bm; 

--  Cho biết những giáo viên có lương lớn hơn lương của giáo viên có MAGV=‘001’
SELECT *
FROM GIAOVIEN GV
WHERE GV.LUONG > (SELECT GV1.LUONG FROM GIAOVIEN GV1 WHERE GV1.MAGV = '001');

--  Cho biết những giáo viên có lương lớn hơn lương của giáo viên có MAGV=‘001’
SELECT *, (SELECT GV1.LUONG FROM GIAOVIEN GV1 WHERE GV1.MAGV = '001') AS LUONG001
FROM GIAOVIEN GV
WHERE GV.LUONG > (SELECT GV1.LUONG FROM GIAOVIEN GV1 WHERE GV1.MAGV = '001');

-- HIỂN THỊ NHỮNG GIÁO VIÊN KO CÓ NGƯỜI THÂN
SELECT *
FROM GIAOVIEN GV 
WHERE GV.MAGV NOT IN (SELECT DISTINCT MAGV FROM NGUOITHAN);


-- TÌM GIÁO VIÊN CÓ LƯƠNG NHỎ NHẤT
-- CÁCH 1:
SELECT *
FROM GIAOVIEN GV
WHERE GV.LUONG = (SELECT MIN(LUONG)
		FROM c03_quanlydetai.giaovien);
-- CÁCH 2 DÙNG ALL
SELECT *
FROM GIAOVIEN GV
WHERE GV.LUONG <= ALL (SELECT DISTINCT GV2.LUONG FROM GIAOVIEN GV2);

-- TÌM BỘ MÔN CÓ SỐ LƯỢNG GIÁO VIÊN ĐÔNG NHẤT
SELECT GV.MABM, COUNT(*)
FROM GIAOVIEN GV
GROUP BY GV.MABM
HAVING COUNT(*) >= ALL (
	SELECT COUNT(*)
	FROM GIAOVIEN GV
	GROUP BY GV.MABM
);
SELECT GV.MABM, COUNT(*)
FROM GIAOVIEN GV
GROUP BY GV.MABM
HAVING COUNT(*) = (
		SELECT MAX(TEMP.COUNT) AS MAX
		FROM (
			SELECT COUNT(*) AS COUNT
			FROM GIAOVIEN GV
			GROUP BY GV.MABM) AS TEMP
    );
    
-- Cho biết những giáo viên có lương lớn hơn lương trung bình của bộ môn mà giáo
-- viên đó làm việc
SELECT *, (SELECT AVG(GV2.LUONG) FROM GIAOVIEN GV2 WHERE GV2.MABM = GV.MABM) AS LTB
FROM giaovien GV
WHERE GV.LUONG > (SELECT AVG(GV2.LUONG) FROM GIAOVIEN GV2 WHERE GV2.MABM = GV.MABM);

-- CHO BIẾT THÔNG TIN CÁC TRƯỞNG BM CÓ THAM GIA ĐỀ TÀi
SELECT DISTINCT BM.TRUONGBM, GV.HOTEN, BM.TENBM
FROM BOMON BM JOIN THAMGIADT TGDT ON BM.TRUONGBM = TGDT.MAGV
	JOIN GIAOVIEN GV ON GV.MAGV = BM.TRUONGBM;
-- Tính số lượng đề tài mà 1 giáo viên đang làm
drop procedure if exists  sp_TinhLuongGiaoVienDeTai;
delimiter //
create procedure sp_TinhLuongGiaoVienDeTai(
	
)
begin
select thamgiadt.MAGV,giaovien.HOTEN, count(thamgiadt.MAGV) as SLDT
from thamgiadt
join giaovien on giaovien.MAGV = thamgiadt.MAGV
group by MAGV,giaovien.HOTEN;
end // 
-- (select count(distinct tgdt.MADT) from thamgiadt tgdt join giaovien on giaovien.MAGV = tgdt.MADT) as SoLuongGVDeTai
-- group by MAGV;