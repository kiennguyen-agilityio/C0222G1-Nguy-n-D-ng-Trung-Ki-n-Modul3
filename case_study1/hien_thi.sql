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
select hd.ma_hop_dong , 
		nv.ho_ten as ten_nhan_vien,
		kh.ho_ten as ten_khach_hang,
		kh.so_dien_thoai,
		dv.ten_dich_vu,
        sum(hdct.so_luong) 
		as so_luong_dich_vu_di_kem,
		hd.tien_dat_coc
from hop_dong hd
left join hop_dong_chi_tiet hdct on hd.ma_hop_dong=hdct.ma_hop_dong
join nhan_vien nv on hd.ma_nhan_vien = nv.ma_nhan_vien
join khach_hang kh on hd.ma_khach_hang=kh.ma_khach_hang
join dich_vu dv on hd.ma_dich_vu=dv.ma_dich_vu
where quarter(hd.ngay_lam_hop_dong)= 4 and year(hd.ngay_lam_hop_dong)= 2020 and hd.ma_hop_dong
not in (select hd.ma_hop_dong from hop_dong hd where quarter (hd.ngay_lam_hop_dong) in (1,2) and year(hd.ngay_lam_hop_dong)=2021)
group by ma_hop_dong ;

-- task 13--
select dvdk.ma_dich_vu_di_kem , 
		dvdk.ten_dich_vu_di_kem,
		sum(hdct.so_luong) as su_dung_nhieu_nhat
from hop_dong_chi_tiet hdct 
join hop_dong hd on hd.ma_hop_dong=hdct.ma_hop_dong
join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem=hdct.ma_dich_vu_di_kem
join khach_hang kh on kh.ma_khach_hang=hd.ma_khach_hang
group by dvdk.ma_dich_vu_di_kem
having sum(hdct.so_luong)=(select sum(hdct.so_luong) from hop_dong_chi_tiet hdct
group by hdct.ma_dich_vu_di_kem
order by sum(hdct.so_luong ) desc limit 1);

-- task 14 --
select hd.ma_hop_dong ,
		dv.ten_dich_vu,
		dvdk.ten_dich_vu_di_kem,
		count(dvdk.ma_dich_vu_di_kem) as so_lan_su_dung
from hop_dong_chi_tiet hdct
join hop_dong hd on hd.ma_hop_dong=hdct.ma_hop_dong
join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem=hdct.ma_dich_vu_di_kem
group by dvdk.ma_dich_vu_di_kem
having ma_dich_vu_di_kem  = (select ma_dich_vu_di_kem from hop_dong_chi_tiet
group by (ma_dich_vu_di_kem)
having count(ma_dich_vu_di_kem) =1);

-- task 15 -- 
select nv.ma_nhan_vien,nv.ho_ten,td.ten_trinh_do,bp.ten_bo_phan,nv.so_dien_thoai,nv.dia_chi
from hop_dong hd
join nhan_vien nv on nv.ma_nhan_vien = hd.ma_nhan_vien
join trinh_do td on td.ma_trinh_do=nv.ma_trinh_do
join bo_phan bp on bp.ma_bo_phan=nv.ma_bo_phan
where year(hd.ngay_lam_hop_dong) between 2020 and 2021
group by hd.ma_nhan_vien
having count(hd.ma_nhan_vien) <= 3;

-- task 16 -- 
-- ALTER TABLE hop_dong DROP FOREIGN KEY hop_dong_ibfk_1;
-- alter table hop_dong add foreign key (ma_nhan_vien) references nhan_vien (ma_nhan_vien)  on delete set null;
delete 
from nhan_vien nv
where nv.ma_nhan_vien
not in (select hd.ma_nhan_vien from hop_dong hd where year(hd.ngay_lam_hop_dong) between 2019 and 2021);
select * from nhan_vien;

-- task 17 -- 
update khach_hang kh  set kh.ma_loai_khach = 1 where kh.ma_khach_hang in (
select ma_khach_hang 
from (select kh.ma_khach_hang from khach_hang kh
join hop_dong hd on hd.ma_khach_hang=kh.ma_khach_hang  
join loai_khach lk on lk.ma_loai_khach=kh.ma_loai_khach
join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem =hdct.ma_dich_vu_di_kem
join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
where year (hd.ngay_lam_hop_dong)=2021 and lk.ma_loai_khach=2
group by hd.ma_khach_hang
having sum(chi_phi_thue +(so_luong*gia))>100
) as tong_tien);

-- task 18 -- 
ALTER TABLE hop_dong DROP FOREIGN KEY hop_dong_ibfk_2;
alter table hop_dong add foreign key (ma_khach_hang) references khach_hang (ma_khach_hang)  on delete set null;
delete from khach_hang kh where kh.ma_khach_hang in (select hd.ma_khach_hang from hop_dong hd where year(hd.ngay_lam_hop_dong)<2021);
-- task 19 -- 
update dich_vu_di_kem dvdk set gia=gia*2
where dvdk.ma_dich_vu_di_kem in 
(
select hdct.ma_dich_vu_di_kem
from hop_dong_chi_tiet hdct 
group by hdct.ma_dich_vu_di_kem
having count(hdct.ma_dich_vu_di_kem) >0 
);
select hdct.ma_dich_vu_di_kem , count(hdct.ma_dich_vu_di_kem) so_lan_su_dung
from hop_dong_chi_tiet hdct 
group by hdct.ma_dich_vu_di_kem
having count(hdct.ma_dich_vu_di_kem) >0 ;
-- task 20 -- 
select nv.ma_nhan_vien as id ,nv.ho_ten,nv.email,nv.so_dien_thoai,nv.ngay_sinh,nv.dia_chi
from nhan_vien nv
union
select kh.ma_khach_hang as id ,kh.ho_ten,kh.email,kh.so_dien_thoai,kh.ngay_sinh,kh.dia_chi
from khach_hang kh;

 