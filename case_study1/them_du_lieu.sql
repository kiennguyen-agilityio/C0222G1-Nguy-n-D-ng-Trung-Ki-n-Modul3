use furama;
insert into vi_tri 
values(1,'manager'),
		(2,'assistant'),
		(3,'superior'),
		(4,'waiter');
 insert into trinh_do 
 values(1,'trung cấp'),       
		(2,'cao đẳng'),      
		(3,'đại học'),       
		(4,'sau đại học');
insert into bo_phan 
values (1,'điều hành '),        
		(2,'lễ tân '),        
		(3,'buồng phòng '),        
		(4,'ẩm thực');
insert into loai_khach 
values(1,'diamon'),        
		(2,'platinium'),   
		(3,'gold'),   
		(4,'silver'),   
		(5,'member');   
 insert into kieu_thue
 values(1,'theo giờ'),
		(2,'theo ngày'),       
		(3,'theo tháng'),       
		(4,'theo năm');   
insert into loai_dich_vu 
values (1,'villa'),        
		(2,'house'),        
		(3,'room');        
insert into dich_vu_di_kem
values (1,'massa',200,'vnd','open'),       
		(2,'hồ bơi',100,'vnd','open'),       
		(3,'thức ăn',300,'vnd','open'),
        (4,'thuê xe',50,'vnd','open');
insert into nhan_vien 
values (1,'Hoàng Trung Kiên','1999-4-12','12345678','1000.0','0777648604','kk@jjj','phan tu',1,2,3),        
		(2,'Trần Hoàn Hảo','2000-5-6','98765442','2000.0','0905147019','hh@oo','hoa an 14',3,2,1);
insert into khach_hang 
values (1,1,'Nguyễn Duy Trung','2001-01-10', 1,'828628262','0888777666','tt@ppp','da nang'),         
		(2,2,'Trần Mạnh Cường','1997-06-09', 1,'272726222','089993377322','cc@zzz','quang tri');   
        
insert into dich_vu
values (1,'villa',30 , 1.500,  5, 1,1,'standard', 'có hồ bơi',40.6,5),       
		(2,'house',25, 700.0,  4, 2,2,'standard','có điều hòa',null,5),       
		(3,'room',15 , 500.0,  2, 3,3,null,null,null,null);             
insert into hop_dong
values(1,'2022-05-14 00:00:00','2022-05-14 00:00:00',1000.0,1,1,1),
		(2,'2022-05-15 00:00:00','2022-05-15 00:00:00',2000.0,2,2,2);
insert into hop_dong_chi_tiet 
values (1,1,2,2),
		(2,2,3,3);
