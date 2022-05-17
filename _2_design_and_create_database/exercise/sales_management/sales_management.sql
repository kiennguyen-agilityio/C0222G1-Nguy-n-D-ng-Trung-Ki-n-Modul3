create database sales_management ;
use sales_management ;
create table customer (
c_id int primary key ,
c_name varchar(50),
c_age int 
);
create table order_customer (
o_date int,
o_total_price int ,
o_id int primary key,
c_id int, 
foreign key (c_id) references customer(c_id)
) ; 

create table product(
p_id int primary key, 
p_name varchar(50),
p_price int 
);
create table order_detail(
 order_o_id int,
product_p_id int ,
od_qty int,
primary key (order_o_id,product_p_id),
constraint fk_order_o_id foreign key (order_o_id) references order_customer(o_id),
constraint fk_product_p_id foreign key (product_p_id) references product(p_id)
);

