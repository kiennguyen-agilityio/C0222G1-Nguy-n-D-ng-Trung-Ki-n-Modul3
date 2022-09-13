USE furama;

-- Task 2
SELECT *
FROM nhan_vien
WHERE ((SELECT SUBSTRING_INDEX(ho_ten, ' ', -1)) LIKE 'H%' OR (SELECT SUBSTRING_INDEX(ho_ten, ' ', -1)) LIKE 'I%' 
OR (SELECT SUBSTRING_INDEX(ho_ten, ' ', -1)) LIKE  'K%')
AND LENGTH(ho_ten) <= 50;

-- Task 3
SELECT *
FROM khach_hang
WHERE ngay_sinh HAVING (TIMESTAMPDIFF(YEAR, ngay_sinh, CURRENT_DATE()) BETWEEN 18 AND 50)
AND dia_chi = 'Đà Nẵng' OR dia_chi = 'Quảng Trị';

-- Task 4
SELECT count(h.ma_khach_hang) AS 'so_lan_thue', kh.ho_ten, kh.ma_loai_khach
FROM hop_dong h JOIN khach_hang kh ON h.ma_khach_hang = kh.ma_khach_hang
WHERE kh.ma_loai_khach = 1
GROUP BY h.ma_khach_hang
ORDER BY COUNT(h.ma_khach_hang) ASC;

-- Task 5
SELECT kh.ma_khach_hang, kh.ho_ten, lk.ten_loai_khach, hd.ma_hop_dong, dv.ten_dich_vu, hd.ngay_lam_hop_dong, 
hd.ngay_ket_thuc, (dv.chi_phi_thue + hdct.so_luong * dvdk.gia) tong_tien
FROM 
khach_hang kh
JOIN loai_khach lk ON kh.ma_loai_khach = lk.ma_loai_khach
LEFT JOIN hop_dong hd ON kh.ma_khach_hang = hd.ma_khach_hang
LEFT JOIN dich_vu dv ON hd.ma_dich_vu = dv.ma_dich_vu
LEFT JOIN hop_dong_chi_tiet hdct ON hdct.ma_hop_dong = hd.ma_hop_dong
LEFT JOIN dich_vu_di_kem dvdk ON dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
GROUP BY kh.ma_khach_hang;

-- Task 6
SELECT dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, ldv.ten_loai_dich_vu
FROM dich_vu dv
JOIN loai_dich_vu ldv ON dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
LEFT JOIN hop_dong hd ON hd.ma_dich_vu = dv.ma_dich_vu
WHERE dv.ma_dich_vu NOT IN (SELECT ma_dich_vu FROM hop_dong WHERE (SELECT EXTRACT(YEAR FROM ngay_lam_hop_dong)) >= 2021);

-- Task 7
SELECT dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.so_nguoi_toi_da, dv.chi_phi_thue, ldv.ten_loai_dich_vu, hd.ngay_lam_hop_dong
FROM dich_vu dv
JOIN loai_dich_vu ldv ON dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
LEFT JOIN hop_dong hd ON hd.ma_dich_vu = dv.ma_dich_vu
WHERE YEAR(hd.ngay_lam_hop_dong) = 2020 AND dv.ma_dich_vu

NOT IN

(SELECT dv.ma_dich_vu
FROM dich_vu dv
JOIN loai_dich_vu ldv ON dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
LEFT JOIN hop_dong hd ON hd.ma_dich_vu = dv.ma_dich_vu
WHERE YEAR(hd.ngay_lam_hop_dong) = 2021);

-- Task 8
SELECT ho_ten
FROM khach_hang
GROUP BY ho_ten;

-- Task 9
SELECT MONTH(hd.ngay_lam_hop_dong) thang, COUNT(*) so_lan_dat
FROM hop_dong hd
WHERE YEAR(hd.ngay_lam_hop_dong) = 2022
GROUP BY (SELECT MONTH(hd.ngay_lam_hop_dong))
ORDER BY thang;

-- Task 10
SELECT hd.ma_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, hd.tien_dat_coc, hdct.so_luong
FROM hop_dong hd
JOIN hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong;

-- Task 11
SELECT kh.ho_ten, lk.ten_loai_khach, dvdk.ten_dich_vu_di_kem
FROM khach_hang kh
JOIN loai_khach lk ON kh.ma_loai_khach = lk.ma_loai_khach
JOIN hop_dong hd ON kh.ma_khach_hang = hd.ma_khach_hang
JOIN hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
JOIN dich_vu_di_kem dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
WHERE lk.ten_loai_khach = 'Diamond' AND (kh.dia_chi = 'Đà Nẵng' OR kh.dia_chi = 'Quảng Ngãi');

-- Task 12
SELECT hd.ma_hop_dong, nv.ho_ten ho_ten_nhan_vien, kh.ho_ten ho_ten_khach,
kh.so_dien_thoai sdt_khach, dv.ten_dich_vu, hdct.so_luong, hd.tien_dat_coc
FROM hop_dong hd
JOIN nhan_vien nv ON hd.ma_nhan_vien = nv.ma_nhan_vien
JOIN khach_hang kh ON hd.ma_khach_hang = kh.ma_khach_hang
JOIN dich_vu dv ON hd.ma_dich_vu = dv.ma_dich_vu
LEFT JOIN hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
WHERE QUARTER(hd.ngay_lam_hop_dong) = 2 AND YEAR(hd.ngay_lam_hop_dong) = 2020 AND dv.ma_dich_vu
NOT IN 
(SELECT dv.ma_dich_vu
FROM hop_dong hd
JOIN nhan_vien nv ON hd.ma_nhan_vien = nv.ma_nhan_vien
JOIN khach_hang kh ON hd.ma_khach_hang = kh.ma_khach_hang
JOIN dich_vu dv ON hd.ma_dich_vu = dv.ma_dich_vu
LEFT JOIN hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
WHERE (QUARTER(hd.ngay_lam_hop_dong) = 1 OR QUARTER(hd.ngay_lam_hop_dong) = 2) AND YEAR(hd.ngay_lam_hop_dong) = 2022);

-- Task 13
SELECT *, COUNT(*) so_lan_su_dung
FROM hop_dong_chi_tiet hdct
JOIN dich_vu_di_kem dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
GROUP BY hdct.ma_dich_vu_di_kem
ORDER BY so_lan_su_dung DESC;

-- Task 14
SELECT hd.ma_hop_dong, ldv.ten_loai_dich_vu, dvdk.ten_dich_vu_di_kem, COUNT(hdct.ma_dich_vu_di_kem) so_lan_su_sung
FROM hop_dong hd
JOIN dich_vu dv ON hd.ma_dich_vu = dv.ma_dich_vu
JOIN loai_dich_vu ldv ON dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
JOIN hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
JOIN dich_vu_di_kem dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
GROUP BY ten_loai_dich_vu
HAVING COUNT(hdct.ma_dich_vu_di_kem) = 1;

-- Task 15
SELECT nv.ma_nhan_vien, nv.ho_ten, td.ten_trinh_do, bp.ten_bo_phan, 
nv.so_dien_thoai, nv.dia_chi, COUNT(hd.ma_nhan_vien) so_hop_dong
FROM nhan_vien nv
JOIN trinh_do td ON nv.ma_trinh_do = td.ma_trinh_do
JOIN bo_phan bp ON nv.ma_bo_phan = bp.ma_bo_phan
JOIN hop_dong hd ON nv.ma_nhan_vien = hd.ma_nhan_vien
WHERE YEAR(hd.ngay_lam_hop_dong) = 2020 OR YEAR(hd.ngay_lam_hop_dong) = 2021
GROUP BY nv.ma_nhan_vien;

-- Task 16
SET SQL_SAFE_UPDATES = 0;
DELETE FROM nhan_vien
WHERE ho_ten IN (
SELECT ho_ten FROM
(SELECT ho_ten
FROM nhan_vien
WHERE ho_ten NOT IN
(SELECT ho_ten
FROM nhan_vien nv
JOIN hop_dong hd ON nv.ma_nhan_vien = hd.ma_nhan_vien
WHERE YEAR(hd.ngay_lam_hop_dong) = 2020 OR YEAR(hd.ngay_lam_hop_dong) = 2021 OR YEAR(hd.ngay_lam_hop_dong) = 2022)) AS X);

-- Task 17
SET SQL_SAFE_UPDATES = 0;
UPDATE khach_hang 
SET ma_loai_khach = 1
WHERE ho_ten IN (
SELECT ho_ten FROM (
SELECT ho_ten
FROM khach_hang kh
JOIN hop_dong hd ON kh.ma_khach_hang = hd.ma_khach_hang
JOIN hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
JOIN dich_vu_di_kem dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
WHERE (hd.tien_dat_coc + hdct.so_luong * dvdk.gia) > 600
GROUP BY kh.ho_ten) AS X);

-- Task 18
SET SQL_SAFE_UPDATES = 0;
DELETE FROM khach_hang
WHERE ma_khach_hang IN (
SELECT ma_khach_hang FROM
(SELECT kh.ma_khach_hang
FROM khach_hang kh
JOIN hop_dong hd ON kh.ma_khach_hang = hd.ma_khach_hang
WHERE YEAR(hd.ngay_lam_hop_dong) < 2021 AND hd.ma_khach_hang 
NOT IN (
SELECT kh.ma_khach_hang
FROM khach_hang kh
JOIN hop_dong hd ON kh.ma_khach_hang = hd.ma_khach_hang
WHERE YEAR(hd.ngay_lam_hop_dong) >= 2021)
GROUP BY hd.ma_khach_hang
) AS X);

-- Task 19
UPDATE dich_vu_di_kem
SET gia = gia * 2
WHERE ma_dich_vu_di_kem IN (
SELECT ma_dich_vu_di_kem
FROM hop_dong_chi_tiet
GROUP BY ma_dich_vu_di_kem
HAVING SUM(so_luong) > 2
);

-- Task 20
SELECT ma_nhan_vien AS ma, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi
FROM nhan_vien
UNION
SELECT ma_khach_hang AS ma, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi
FROM khach_hang;

-- Task 21
CREATE VIEW v_nhan_vien AS
SELECT nv.ma_nhan_vien, nv.ho_ten, nv.ngay_sinh, nv.so_cmnd, nv.luong, nv.so_dien_thoai, nv.email, nv.dia_chi
FROM nhan_vien nv
JOIN hop_dong hd ON nv.ma_nhan_vien = hd.ma_nhan_vien
WHERE YEAR(hd.ngay_lam_hop_dong) = 2022 AND nv.dia_chi = 'Sơn Trà';

SELECT * FROM v_nhan_vien;

-- Task 22
UPDATE v_nhan_vien
SET dia_chi = 'Hải Châu'
WHERE ma_nhan_vien = 1;

-- Task 23
DELIMITER $$
CREATE PROCEDURE sp_xoa_khach_hang(ma_khach_hang INT)
BEGIN
DELETE FROM khach_hang kh
WHERE kh.ma_khach_hang = ma_khach_hang;
END $$
DELIMITER ;

CALL sp_xoa_khach_hang(2);

-- Task 24
DELIMITER $$
CREATE PROCEDURE sp_them_moi_hop_dong(ma_hop_dong INT,
									  ngay_lam_hop_dong DATETIME,
                                      ngay_ket_thuc DATETIME,
                                      tien_dat_coc DOUBLE,
									  ma_nhan_vien INT,
									  ma_khach_hang INT,
									  ma_dich_vu INT)
BEGIN
IF (EXISTS (SELECT hd.ma_hop_dong FROM hop_dong hd where hd.ma_hop_dong = ma_hop_dong)
OR NOT EXISTS(SELECT nv.ma_nhan_vien FROM nhan_vien nv WHERE nv.ma_nhan_vien = ma_nhan_vien)
OR NOT EXISTS(SELECT kh.ma_khach_hang FROM khach_hang kh WHERE kh.ma_khach_hang = ma_khach_hang)
OR NOT EXISTS(SELECT dv.ma_dich_vu FROM dich_vu dv WHERE dv.ma_dich_vu = ma_dich_vu))
THEN
INSERT INTO them_hop_dong_log 
VALUES ('Nhập lại mã');
ELSE
INSERT INTO them_hop_dong_log 
VALUES ('Thêm thành công');
INSERT INTO hop_dong
VALUES (ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, ma_nhan_vien, ma_khach_hang, ma_dich_vu);
END IF;
END $$
DELIMITER ;
CALL sp_them_moi_hop_dong(7, '2022-05-30 00:00:00', '2022-06-30 00:00:00', 500, 1, 1, 1);
-- declare error_ms varchar(250);
-- ma_hop_dong NOT IN (SELECT ma_hop_dong FROM hop_dong)
-- SIGNAL SQLSTATE '45000'
-- SET MESSAGE_TEXT = 'Nhập lại mã' ;

-- Task 25
DELIMITER $$
CREATE TRIGGER tr_xoa_hop_dong 
AFTER DELETE ON hop_dong
FOR EACH ROW
BEGIN
INSERT INTO hop_dong_log SELECT COUNT(*) FROM hop_dong;
END $$
DELIMITER ;

DROP TRIGGER tr_xoa_hop_dong;

SET SQL_SAFE_UPDATES = 0;
DELETE FROM hop_dong 
WHERE ma_hop_dong = 6;

-- Task 26
DELIMITER $$
CREATE TRIGGER tr_cap_nhat_hop_dong
BEFORE UPDATE ON hop_dong
FOR EACH ROW
BEGIN
IF DATEDIFF(NEW.ngay_ket_thuc, OLD.ngay_lam_hop_dong) > 2
THEN
INSERT INTO update_hop_dong_log VALUES('Cập nhật thành công');
ELSE
INSERT INTO update_hop_dong_log VALUES('Cập nhật lỗi');
END IF;
END $$
DELIMITER ;

DROP TRIGGER tr_cap_nhat_hop_dong;

UPDATE hop_dong
SET ngay_ket_thuc = '2020-03-30 00:00:00'
WHERE ma_hop_dong = 6;

-- Task 27
-- a
DELIMITER $$
CREATE FUNCTION func_dem_dich_vu()
RETURNS INT
DETERMINISTIC
BEGIN
DECLARE so_dich_vu INT;
SET so_dich_vu = (
SELECT COUNT(*) AS so_luong FROM hop_dong hd
JOIN dich_vu dv ON hd.ma_dich_vu = dv.ma_dich_vu
WHERE dv.chi_phi_thue >= 2000);
RETURN so_dich_vu;
END $$
DELIMITER ;

INSERT INTO so_dich_vu_log VALUES (func_dem_dich_vu());

-- b
DELIMITER $$
CREATE FUNCTION func_tinh_thoi_gian_hop_dong(kh_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
DECLARE khoang_thoi_gian INT;
SET khoang_thoi_gian = (
SELECT MAX(DATEDIFF(hd.ngay_ket_thuc, hd.ngay_lam_hop_dong)) AS khoang_thoi_gian
FROM hop_dong hd WHERE hd.ma_khach_hang = 2 GROUP BY hd.ma_khach_hang);
RETURN khoang_thoi_gian;
END $$
DELIMITER ;

INSERT INTO khoang_thoi_gian_log VALUES (2, func_tinh_thoi_gian_hop_dong(1));

-- Task 28
DELIMITER $$
CREATE PROCEDURE sp_xoa_dich_vu_va_hd_house()
BEGIN
SET SQL_SAFE_UPDATES = 0;
DELETE FROM dich_vu
WHERE ma_dich_vu IN (
SELECT ma_dich_vu FROM (
SELECT dv.ma_dich_vu
FROM dich_vu dv
JOIN hop_dong hd ON dv.ma_dich_vu = hd.ma_dich_vu
WHERE (YEAR(hd.ngay_lam_hop_dong) BETWEEN 2015 AND 2025) AND dv.ten_dich_vu = 'House'
GROUP BY dv.ma_dich_vu) AS X);
END $$
DELIMITER ;
DROP PROCEDURE sp_xoa_dich_vu_va_hd_house;
CALL sp_xoa_dich_vu_va_hd_house();