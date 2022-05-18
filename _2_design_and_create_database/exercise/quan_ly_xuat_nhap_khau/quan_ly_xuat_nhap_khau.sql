create database quan_ly_xuat_nhap_khau;
use quan_ly_xuat_nhap_khau ;
create table phieu_xuat (
so_phieu_xuat int primary key,
ngay_xuat date
);
create table vat_tu(
ma_vat_tu int primary key , 
ten_vat_tu varchar(50)
);

create table chi_tiet_xuat_khau(
don_gia_xuat int ,
so_luong_xuat int,
phieu_xuat_so_phieu_xuat int , 
vat_tu_ma_vat_tu int ,
primary key(phieu_xuat_so_phieu_xuat,vat_tu_ma_vat_tu),
foreign key (phieu_xuat_so_phieu_xuat) references phieu_xuat(so_phieu_xuat),
foreign key (vat_tu_ma_vat_tu) references vat_tu(ma_vat_tu)
);

 create table phieu_nhap(
 so_phieu_nhap int primary key  ,
 ngay_nhap date 
 );

 create table chi_tiet_nhap_khau(
 don_gia_nhap int,
 so_luong_nhap int,
 phieu_nhap_ma_vat_tu int,
 phieu_nhap_so_phieu_nhap int, 
 primary key (phieu_nhap_ma_vat_tu, phieu_nhap_so_phieu_nhap),
 foreign key (phieu_nhap_ma_vat_tu) references vat_tu(ma_vat_tu),
 foreign key (phieu_nhap_so_phieu_nhap) references phieu_nhap(so_phieu_nhap)
 
 );
 
 create table nha_cc(
 ma_ncc int primary key ,
 ten_ncc varchar(50),
 dia_chi varchar(50)
 );
 create table so_dien_thoai(
 ma_ncc int,
 so_dien_thoai_sdt int ,
 primary key ( so_dien_thoai_sdt),
 foreign key ( ma_ncc) references nha_cc(ma_ncc)
 );

 create table don_dh(
 so_dh int primary key,
ngay_dh date,
nha_cc_ma_ncc int,
foreign key(nha_cc_ma_ncc)references nha_cc(ma_ncc)
 );
 
create table chi_tiet_don_hang(
vat_tu_ma_vat_tu int , 
don_dh_so_dh int,
primary key(vat_tu_ma_vat_tu,don_dh_so_dh),
foreign key (vat_tu_ma_vat_tu) references vat_tu(ma_vat_tu),
foreign key (don_dh_so_dh) references don_dh(so_dh)
);

 
 
 