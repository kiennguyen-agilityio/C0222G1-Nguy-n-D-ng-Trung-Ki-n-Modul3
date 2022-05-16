use sales_management ; 
insert into customer (cID,cName,cAge)
values (1,'Minh Quan',10),
		(2,'Ngoc Anh',20),
		(3,'Hong Ha',50);
insert into order_customer (oID,cID,oDate,oTotalPrice)
values (1,1,'2006-03-21',null),
		(2,2,'2006-03-23',null),
		(3,1,'2006-03-16',null);
		
insert into product (pID,pName,pPrice)
values (1,'May Giat',3),
		(2,'Tu Lanh',5),
		(3,'Dieu Hoa',7),
		(4,'Quat',1),
		(5,'Bep Dien',2);
insert into order_detail (order_oID ,product_pID  ,odQTY)
values (1,1,3),
		(1,3,3),
		(1,4,3),
		(2,1,3),
		(3,1,3),
		(2,5,3),
		(2,3,3);
		
 select oID,cID,oDate,oTotalPrice
 from order_customer;
 
 select c.cName ,p.pName
 from  customer c 
join product p on cID = pID ;

select c.cName ,od.odQTY 
from  customer c 
join order_detail od on od.order_oID =c.cID
where od.odQTY=0;
 
 select od.order_oID,o.oDate,(p.pPrice*od.odQTY)
 from order_detail od 
 join order_customer o on od.order_oID=o.oID
 join product p on p.pID=od.order_oID ;
 
 