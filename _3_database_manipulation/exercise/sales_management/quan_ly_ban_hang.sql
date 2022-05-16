create database sales_management ;
use sales_management ;
create table customer (
cID int primary key ,
cName varchar(50),
cAge int 
);
create table order_customer (
oID int primary key,
cID int, 
oDate date,
oTotalPrice int ,
foreign key (cID) references customer(cID)
) ; 

create table product(
pID int primary key, 
pName varchar(50),
pPrice int 
);
create table order_detail(
 order_oID int,
product_pID int ,
odQTY int,
primary key (order_oID,product_pID),
constraint fk_order_oID foreign key (order_oID) references order_customer(oID),
constraint fk_product_pID foreign key (product_pID) references product(pID)
);

