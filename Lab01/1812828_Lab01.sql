CREATE DATABASE 1812828_MySQL;
USE 1812828_MySQL;


create table orders(
orderNumber INT(11) primary key not null auto_increment,
orderDate DATETIME not null,
requiredDate datetime not null,
shippedDate datetime ,
status varchar(15) not null,
comments text,
customerNumber int(11)
);

create table productlines(
productLine varchar(50) primary key not null,
textDescription varchar(4000),
htmlDescription mediumtext,
image mediumblob
);

create table products(
productCode varchar(15) not null,
productName varchar(70) not null,
productLine varchar(50) not null,
productScale varchar(10) not null,
productVendor varchar(50) not null,
productDescription text not null,
quantityInStock smallint(6) not null,
buyPrice double,
primary key (productCode, productLine),
foreign key (productLine) references productlines(productLine) on update cascade
);

create table orderdetails(
orderNumber int(11) not null auto_increment,
productCode varchar(15) not null,
quantityOrdered int(11) not null,
priceEach double not null,
orderLineNumber smallint(6) not null,
primary key(orderNumber, productCode),
foreign key	(orderNumber) references orders(orderNumber) on update cascade,
foreign key (productCode) references products(productCode) on update cascade
);

alter table orderdetails modify column orderLineNumber int(10);

alter table products rename column productLine to Branch;

-- orders
select*from orders;


insert into orders(orderDate, requiredDate, shippedDate, status, comments, customerNumber)
values('1997-10-15 00:00:00','1990-03-04 00:00:00','1990-03-05 00:00:00','ship','new',7),
		('1997-10-15 00:00:00','1990-03-04 00:00:00','1990-03-05 00:00:00','ship','new',9),
		('1997-10-15 00:00:00','1990-03-04 00:00:00','1990-03-05 00:00:00','ship','new',4),
        ('1997-10-15 00:00:00','1990-03-04 00:00:00','1990-03-05 00:00:00','cancell','new',1),
        ('1997-10-15 00:00:00','1990-03-04 00:00:00','1990-03-05 00:00:00','ship','old',10),
        ('1997-10-15 00:00:00','1990-03-04 00:00:00','1990-03-05 00:00:00','ship','new',7),
        ('1997-10-15 00:00:00','1990-03-04 00:00:00','1990-03-05 00:00:00','ship','new',11),
		('1997-10-15 00:00:00','1990-03-04 00:00:00','1990-03-05 00:00:00','cancell','new',15),
		('1997-10-15 00:00:00','1990-03-04 00:00:00','1990-03-05 00:00:00','ship','real',24),
		('1997-10-15 00:00:00','1990-03-04 00:00:00','1990-03-05 00:00:00','ship','new',12),
		('1997-10-15 00:00:00','1990-03-04 00:00:00','1990-03-05 00:00:00','ship','new',22),
		('1997-10-15 00:00:00','1990-03-04 00:00:00','1990-03-05 00:00:00','ship','new',14),
		('1997-10-15 00:00:00','1990-03-04 00:00:00','1990-03-05 00:00:00','ship','new',12),
		('1997-10-15 00:00:00','1990-03-04 00:00:00','1990-03-05 00:00:00','ship','rep',3),
		('1997-10-15 00:00:00','1990-03-04 00:00:00','1990-03-05 00:00:00','ship','new',12),
		('1997-10-15 00:00:00','1990-03-04 00:00:00','1990-03-05 00:00:00','cancell','new',47),
		('1997-10-15 00:00:00','1990-03-04 00:00:00','1990-03-05 00:00:00','ship','new',5),
		('1997-10-15 00:00:00','1990-03-04 00:00:00','1990-03-05 00:00:00','cancell','new',4),
		('1997-10-15 00:00:00','1990-03-04 00:00:00','1990-03-05 00:00:00','ship','new',3),
		('1997-10-15 00:00:00','1990-03-04 00:00:00','1990-03-05 00:00:00','ship','old',2),
		('1997-10-15 00:00:00','1990-03-04 00:00:00','1990-03-05 00:00:00','ship','new',37),
		('1997-10-15 00:00:00','1990-03-04 00:00:00','1990-03-05 00:00:00','ship','new',27),
		('1997-10-15 00:00:00','1990-03-04 00:00:00','1990-03-05 00:00:00','ship','new',17),
		('1997-10-15 00:00:00','1990-03-04 00:00:00','1990-03-05 00:00:00','cancell','new',10),
		('1997-10-15 00:00:00','1990-03-04 00:00:00','1990-03-05 00:00:00','in process','real',7);

-- productlines-----------------------------------------------------------------------

insert into productlines(productLine, textDescription, htmlDescription, image)
values('cars','test','test.html','home.img'),
		('truck','test','m.html','8.img'),
		('moto','test','1.html','7.img'),
		('bus','test','2.html','6.img'),
		('wave','test','3.html','5.img'),
		('honda','test','4.html','4.img'),
		('clasic','test','5.html','3.img'),
		('cast','test','6.html','2.img'),
		('d','test','8.html','1.img'),
		('h','test','test.html','home.img'),
		('l','test','test.html','home.img'),
		('rs','test','test.html','home.img'),
		('ars','test','test.html','home.img'),
		('car','test','test.html','home.img'),
		('s','test','test.html','home.img'),
		('cs','test','test.html','home.img'),
		('crs','test','test.html','home.img'),
		('cas','test','test.html','home.img'),
		('cers','test','test.html','home.img'),
		('ces','test','test.html','home.img'),
		('case','test','test.html','home.img'),
		('m','test','test.html','home.img'),
		('k','test','test.html','home.img'),
		('p','test','test.html','home.img'),
		('q','test','test.html','home.img');

-- products------------------------------------------------------------------------ 

insert into products(productCode, productName, Branch, productScale, productVendor, productDescription, quantityInStock, buyPrice)
values('a','ford','cars','1:100','1a','good',12223,12.3333),
		('p','ford','h','1:100','1a','good',12223,12.3333),
		('cas','ford','l','1:100','1a','good',12223,12.333),
		('c','ford','p','1:100','1a','good',12223,12.3333),
		('q','ford','k','1:100','1a','good',12223,12.3333),
		('rs','ford','q','1:100','1a','good',12223,12.3333),
		('cs','ford','p','1:100','1a','good',12223,12.3333),
		('crs','ford','m','1:100','1a','good',12223,12.3333),
		('ca','ford','crs','1:100','1a','good',12223,12.3333),
		('cb','ford','bus','1:100','1a','good',12223,12.3333),
		('cc','ford','honda','1:100','1a','good',12223,12.3333),
		('b','ford','wave','1:100','1a','good',12223,12.3333),
		('l','ford','moto','1:100','1a','good',12223,12.3333);

-- orderdetails---------------------------------------------------------------------- 

insert into orderdetails(orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber)
values(1,'p',12,12.22222,33),
		(21,'b',12,12.22222,33),
		(20,'c',12,12.22222,33),
		(19,'ca',12,12.22222,33),
		(18,'cb',12,12.22222,33),
		(17,'cc',12,12.22222,33),
		(16,'cs',12,12.22222,33),
		(15,'crs',12,12.22222,33),
		(14,'cas',12,12.22222,33),
		(13,'a',12,12.22222,33),
		(12,'a',12,12.22222,33),
		(11,'a',12,12.22222,33),
		(10,'a',12,12.22222,33),
		(9,'a',12,12.22222,33),
		(8,'a',12,12.22222,33),
		(7,'ca',12,12.22222,33),
		(6,'c',12,12.22222,33),
		(5,'p',12,12.22222,33),
		(4,'cs',12,12.22222,33),
		(3,'ca',12,12.22222,33),
		(2,'q',12,12.22222,33);

select *from orders;
select*from productlines;
select*from products;
select*from orderdetails;

DROP TABLE products;
-- không thể drop table products được vì khi ràng buộc khóa ngoại On update cascade, dữ liệu cột productCode trong products thay đổi 
-- thì dữ liệu cột productCode trong orderdetail sẽ đc cập nhập lại vì thế nó sẽ không cho xóa bảng đó đi  