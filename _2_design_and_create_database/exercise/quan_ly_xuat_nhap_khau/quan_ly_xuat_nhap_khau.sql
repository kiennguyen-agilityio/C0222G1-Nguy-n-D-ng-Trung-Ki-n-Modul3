create database quan_ly_xuat_nhap_khau;
use quan_ly_xuat_nhap_khau ;
create table phieu_xuat (
SoPX int primary key,
NgayXuat date
);
create table vat_tu(
MaVTU int primary key , 
TenVTU varchar(50)
);

create table chi_tiet_xuat_khau(
DGxuat int ,
SLxuat int,
phieu_xuat_SoPX int , 
vat_tu_MaVTU int ,
primary key(phieu_xuat_SoPX,vat_tu_MaVTU),
foreign key (phieu_xuat_SoPX) references phieu_xuat(SoPX),
foreign key (vat_tu_MaVTU) references vat_tu(MaVTU)
);

 create table phieu_nhap(
 SoPN int primary key  ,
 NgayNhap date 
 );

 create table chi_tiet_nhap_khau(
 DGNhap int,
 SLNhap int,
 phieu_nhap_MaVTU int,
 phieu_nhap_soPN int, 
 primary key (phieu_nhap_MaVTU, phieu_nhap_soPN),
 foreign key (phieu_nhap_MaVTU) references vat_tu(MaVTU),
 foreign key (phieu_nhap_soPN) references phieu_nhap(SoPN)
 
 );
 
 create table nha_cc(
 MaNCC int primary key ,
 TenNCC varchar(50),
 dia_chi varchar(50)
 );
 create table so_dien_thoai(
 MaNCC int,
 so_dien_thoai_sdt int ,
 primary key ( so_dien_thoai_sdt),
 foreign key ( MaNCC) references nha_cc(MaNCC)
 );

 create table don_dh(
 SoDH int primary key,
ngayDH date,
NHACC_MaNCC int,
foreign key(NHACC_MaNCC)references nha_cc(MaNCC)
 );
 
create table chi_tiet_don_hang(
vat_tu_MaVTU int , 
DONDH_soDH int,
primary key(vat_tu_MaVTU,DONDH_soDH),
foreign key (vat_tu_MaVTU) references vat_tu(MaVTU),
foreign key (DONDH_soDH) references don_dh(SoDH)
);

 
 
 