USE furama;

INSERT INTO vi_tri 
VALUES  (1,'Lễ tân'),
		(2,'Phục vụ'),
		(3,'Chuyên viên'),
		(4,'Giám sát'),
        (5,'Quản lí'),
        (6,'Giám đốc');
        
 INSERT INTO trinh_do 
 VALUES (1,'Trung cấp'),       
		(2,'Cao đẳng'),      
		(3,'Đại học'),       
		(4,'Sau đại học');
        
INSERT INTO bo_phan 
VALUES  (1,'Sale-Marketing'),        
		(2,'Hành chính'),        
		(3,'Phục vụ'),        
		(4,'Quản lí');
        
INSERT INTO loai_khach 
VALUES  (1,'Diamond'),        
		(2,'Platinium'),   
		(3,'Gold'),   
		(4,'Silver'),   
		(5,'Member');   
        
INSERT INTO kieu_thue
VALUES  (1,'Theo giờ'),
		(2,'Theo ngày'),       
		(3,'Theo tháng'),       
		(4,'Theo năm');   
        
INSERT INTO loai_dich_vu 
VALUES  (1,'Villa'),        
		(2,'House'),        
		(3,'Room');      
        
INSERT INTO dich_vu_di_kem
VALUES  (1,'Hồ bơi',30,'USD','Open'),       
		(2,'Bữa sáng',20,'USD','Open'),       
		(3,'Xông hơi',50,'USD','Open');
        
INSERT INTO dich_vu
VALUES  (1,'Villa', 60, 2000, 4, 1, 1,'Luxury', 'Hồ bơi',25,4),       
		(2,'House', 100, 3000, 10, 2, 2,'Standard','Miễn phí bữa sáng',40,6),       
		(3,'Room', 40, 300, 2, 3, 3,'Standard','Miễn phí nước uống',null,null),
        (4,'House', 200, 500, 15, 2, 2,'Standard','Miễn phí bữa tối',40,6);    
        
INSERT INTO nhan_vien 
VALUES  (1,'Trần Văn Khánh','1995-01-12','1231313131','1500','0913213120','khanh@gmail.com','Sơn Trà',1,1,1),        
		(2,'Hồng Nhung','1997-01-28','31313123311','2000','07131231132','hongnhung@gmail.com','Thanh Khê',2,2,2),
        (3,'Hoàng Thanh Thanh Huyền','1995-03-28','31313112311','2000','09051471231','huyenhoang@gmail.com','Phú Nhuận',3,3,3),
        (4,'Kha Nguyễn','1994-05-12','12312323131','2000','091321312321','khanguyen@gmail.com','Thủ Đức',1,1,1);
        
INSERT INTO khach_hang 
VALUES  (1,1,'Nguyễn Thanh Kha','1994-05-14', 1,'12391232131','09123123112','khanguyen@gmail.com','Đà Nẵng'),         
		(2,1,'Trần Kiều Oanh','1984-02-15', 0,'12321931231','071321312312','oanhtran@gmail.com','Quảng Trị'),
        (3,3,'Trần Văn Thắng','1985-02-25', 1,'124213213911','091231231231','thangtran@gmail.com','Quảng Nam');   
        
INSERT INTO hop_dong
VALUES  (1,'2022-07-25 00:00:00','2022-07-25 00:00:00',500,1,1,1),
		(2,'2022-05-30 00:00:00','2022-07-30 00:00:00',600,2,2,2),
        (3,'2020-05-30 00:00:00','2020-08-25 00:00:00',600,2,2,2),
		(4,'2020-05-30 00:00:00','2020-09-30 00:00:00',600,2,2,4),
		(5,'2021-05-30 00:00:00','2021-10-30 00:00:00',600,2,2,4),
        (6,'2020-03-30 00:00:00','2020-05-30 00:00:00',300,2,3,3);
        
INSERT INTO hop_dong_chi_tiet 
VALUES  (1,1,2,2),
		(2,2,3,3),
        (3,2,1,1),
        (4,2,3,1);
