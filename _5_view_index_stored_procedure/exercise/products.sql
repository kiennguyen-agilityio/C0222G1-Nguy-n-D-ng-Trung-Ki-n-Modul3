create database product ;
use product ; 
create table product(
id  int,
product_code int,
product_name varchar(50),
product_price int,
product_amount int,
product_description varchar(50),
product_status varchar(50)
);

insert into product 
values (1,112,'ly',1000,10,'hàng dễ vỡ','đã nhập kho'),
		(2,113,'chén',2000,20,'hàng dễ vỡ','chưa nhập kho'),
		(3,114,'máy rung cực mạnh',3000,30,'hàng dễ vỡ','đã nhập kho');
        
-- yêu cầu 3 -- 
explain select * from product where product_name = 'máy rung cực mạnh';

create index product_unique on product(product_code) ;
explain select * from product where product_name='chen';

create index product_composite on product (product_name,product_price);
explain select* from product where product_name= 'ly';

-- yêu cầu 4--
create view product_view as
 select id, product_name as product_name,product_price as price
from product ; 

select * from product_view;

set SQL_SAFE_UPDATES = 0;
Update product_view
set price =5000 where id = 1 ;

delete from product_view 
where price < 5000 ; 

Delimiter $$
create procedure all_product ()
begin 
select * from product;
end $$
delimiter ; 

call all_product();

delimiter $$
create procedure add_product (
in p_id int ,
in p_code int ,
 in p_name varchar(50),
 in p_price int,
in p_amount int,
in p_description varchar(50),
in p_status varchar(50))
begin
 insert into product(id,product_name,product_amount,product_description,product_status) 
 values (p_id,p_name,p_amount,p_description,p_status);
end $$
delimiter ;
call add_product(10,123,'máy ảnh',5000,10,'hàng dễ vỡ','chưa nhập kho');

delimiter $$
create procedure update_product (in p_id int , in p_price int)
begin
update product p
set  p.product_price=p_price  
where p.id= p_id; 
end $$
delimiter ;
call update_product(2,100000);

delimiter $$
create procedure delete_product (in p_id int)
begin
delete from product p
where p.id= p_id; 
end $$
delimiter ;
call delete_product(2);
                