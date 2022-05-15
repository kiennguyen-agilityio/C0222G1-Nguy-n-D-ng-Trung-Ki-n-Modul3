select count(h.ma_khach_hang) as 'so_lan_thue', kh.ho_ten, kh.ma_loai_khach
from hop_dong h join khach_hang kh on h.ma_khach_hang = kh.ma_khach_hang
where kh.ma_loai_khach = 1
group by h.ma_khach_hang
order by count(h.ma_khach_hang) asc;