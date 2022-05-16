-- task2--
use furama ;
select *
from nhan_vien
where (ho_ten like 'H%' or ho_ten like 'K%' or ho_ten like 'T%')
and(length(ho_ten)<=15);
-- task3--
select *
from khach_hang
where ngay_sinh having (timestampdiff(year, ngay_sinh, current_date()) between 18 and 50)
and dia_chi = 'Đà Nẵng' or dia_chi = 'Quảng Trị';

-- task4--
select count(h.ma_khach_hang) as 'so_lan_thue', kh.ho_ten, kh.ma_loai_khach
from hop_dong h join khach_hang kh on h.ma_khach_hang = kh.ma_khach_hang
where kh.ma_loai_khach = 1
group by h.ma_khach_hang
order by count(h.ma_khach_hang) asc;
-- task5--

SELECT khach_hang.ma_khach_hang, khach_hang.ho_ten, loai_khach.ten_loai_khach,
 hd.ma_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, dich_vu.ten_dich_vu,
 sum(dich_vu.chi_phi_thue + (hop_dong_chi_tiet.so_luong * dich_vu_di_kem.gia))as tong_tien,
 count(hop_dong.ma_khach_hang) AS so_lan_dat_phong 
 FROM hop_dong_chi_tiet
 JOIN hop_dong hd on hd.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
 JOIN dich_vu_di_kem on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
 JOIN dich_vu on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
RIGHT JOIN khach_hang on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
JOIN loai_khach on loai_khach.ma_loai_khach = khach_hang.ma_loai_khach
GROUP BY ma_khach_hang;
 