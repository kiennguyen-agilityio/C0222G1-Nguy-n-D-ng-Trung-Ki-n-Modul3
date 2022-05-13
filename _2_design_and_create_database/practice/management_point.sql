create table HocSinh  (
MaHS varchar(20) primary key,
TenHS varchar(50),
NgaySinh DateTime,
lop varchar(20),
gt varchar(20));


create table MonHoc(
MaMH varchar(20) primary key,
TenMH varchar(50));


CREATE TABLE BangDiem (
    MaHS VARCHAR(20),
    MaMH VARCHAR(20),
    DiemThi INT,
    NgayKT DATETIME,
    PRIMARY KEY (MaHS , MaHS),
    FOREIGN KEY (MaHS)
        REFERENCES HocSinh (MaHS),
    FOREIGN KEY (MaMH)
        REFERENCES MonHoc (MaMH)
);


create table GiaoVien(
MaGv varchar(20) primary key,
TenGV varchar(20),
SDT varchar (10));
alter table MonHoc add MaGV varchar(20);
alter table MonHoc add constraint FK_MaGV foreign key (MaGV) references GiaoVien(MaGV);

