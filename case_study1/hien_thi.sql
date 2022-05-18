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
SELECT kh.ma_khach_hang, kh.ho_ten, 
loai_khach.ten_loai_khach,
 hd.ma_hop_dong, 
 hd.ngay_lam_hop_dong,
 hd.ngay_ket_thuc,
 dv.ten_dich_vu,
 sum(dv.chi_phi_thue + (hop_dong_chi_tiet.so_luong * dich_vu_di_kem.gia))as tong_tien,
 count(hd.ma_khach_hang) AS so_lan_dat_phong 
 FROM hop_dong_chi_tiet
 JOIN hop_dong hd on hd.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
 JOIN dich_vu_di_kem on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
 JOIN dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
RIGHT JOIN khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
JOIN loai_khach on loai_khach.ma_loai_khach = kh.ma_loai_khach
GROUP BY ma_khach_hang;
-- task 6 --
use furama;
select dv.ma_dich_vu,dv.ten_dich_vu,dv.dien_tich,dv.so_nguoi_toi_da,dv.chi_phi_thue,ldv.ten_loai_dich_vu
from dich_vu dv 
join loai_dich_vu ldv on dv.ma_loai_dich_vu=ldv.ma_loai_dich_vu
join hop_dong hd on hd.ma_dich_vu=dv.ma_dich_vu
where month (hd.ngay_lam_hop_dong)>= 1 and  month (hd.ngay_lam_hop_dong)<=3;
-- task 7 --
select dv.ma_dich_vu,dv.ten_dich_vu,dv.dien_tich,dv.so_nguoi_toi_da,dv.chi_phi_thue,ldv.ten_loai_dich_vu
from dich_vu dv 
join loai_dich_vu ldv on dv.ma_loai_dich_vu=ldv.ma_loai_dich_vu
join hop_dong hd on hd.ma_dich_vu=dv.ma_dich_vu
where hd.ma_dich_vu 
in (select hd.ma_dich_vu from hop_dong hd where year(hd.ngay_lam_hop_dong)=2020)
and hd.ma_dich_vu not in (select hd.ma_dich_vu from hop_dong hd where year(hd.ngay_lam_hop_dong)=2021);

-- task 8 -- 
select ho_ten
from khach_hang
group by ho_ten;

select distinct ho_ten
from khach_hang;

select  ho_ten
from  khach_hang union 
select  ho_ten
from  khach_hang;

-- task 9 --
select  Month(ngay_lam_hop_dong) as thang , count(ngay_lam_hop_dong)as so_luong
from hop_dong 
where Year(ngay_lam_hop_dong) = 2021 group by thang ; 

-- task 10-- 
select hd.ma_hop_dong,hd.ngay_lam_hop_dong,hd.ngay_ket_thuc,hd.tien_dat_coc , sum(hdct.so_luong) as so_luong_dich_vu_di_kem
from hop_dong hd
left join  hop_dong_chi_tiet hdct  on hdct.ma_hop_dong=hd.ma_hop_dong
group by ma_hop_dong 
order by hd.ma_hop_dong;

-- task 11-- 
select lk.ten_loai_khach , kh.dia_chi
from khach_hang kh 
join loai_khach lk on lk.ma_loai_khach=kh.ma_loai_khach
where lk.ten_loai_khach  = "Diamond" and (kh.dia_chi="Vinh" or kh.dia_chi="Quảng Ngãi");

-- task 12 -- 

 