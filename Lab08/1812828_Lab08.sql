use 1812828_database_lab02;

-- ================================Câu hỏi Lab08=============================
-- a. Lấy danh sách các khách hàng theo FirstName
DELIMITER $$
create procedure GetAllCustomer()
begin
select contactFirstName from customers;
end; $$
call GetAllCustomer;
-- b. Đổi tên nhân viên có lastName “Vanauf” thành “Trump”
DELIMITER $$
create procedure ConvertEmployee()
begin
select
(case when lastName='Vanauf' then 'Trump'
else lastName
end)lastName
from employees;
end; $$
call ConvertEmployee;
-- c. Kiểm tra trạng thái của các khách hàng đã đặt hàng trong năm 2004
DELIMITER $$
create procedure StatusCustomerOrdered()
begin
select B.status, B.orderDate, A.*
from customers A, orders B
where A.customerNumber=B.customerNumber and year(B.orderDate)=2004;
end; $$
call StatusCustomerOrdered;
-- d. Lấy ra danh sách các khách hàng dựa theo tên của nhân viên phụ trách
DELIMITER $$
create procedure ListCustomerByName(In firstNameVal varchar(50))
begin
select B.firstName, A.*
from customers A, employees B
where A.salesRepEmployeeNumber =B.employeeNumber and B.firstName=firstNameVal;
end; $$
call ListCustomerByName('Andy');

-- e. Lấy thông tin các khách hàng mà đơn hàng đã bị hủy
DELIMITER $$
create procedure InfomationCustomerStatusCancelled()
begin
select A.* 
from customers A, orders B
where A.customerNumber=B.customerNumber and B.status='Cancelled';
end; $$
call InfomationCustomerStatusCancelled();

-- f. Lấy thông tin phòng ban nhân viên dựa vào mã employeeNumber
DELIMITER $$
create procedure InfomationByEmployeeNumber(In employeeNumberVal int(11))
begin
select distinct A.* 
from offices A, employees B
where A.officeCode=B.officeCode and B.employeeNumber=employeeNumberVal;
end; $$
call InfomationByEmployeeNumber(1002);

-- g. Liệt kê các sản phẩm của một dòng sản phẩm
DELIMITER $$
create procedure ListProductByProductLine(In productLineVal varchar(50))
begin
select A.productName, A.productLine
from products A, productLines B
where A.productLine=B.productLine and B.productLine=productLineVal;
end; $$
call ListProductByProductLine('Classic Cars');
-- h. Lấy ra các nhân viên của employeeNumber của nhân viên quản lý
DELIMITER $$
create procedure EmployeeManager()
begin
select *
from employees
where jobTitle like '%Manager%';
end; $$
call EmployeeManager();

-- i. Đổi tên các dòng sản phẩm theo yêu cầu sau: (Yêu cầu sử dụng IF)
-- • Classic Cars => Xe cổ
-- • Motorcycles => Xe Mô tô
-- • Planes => Máy bay
-- • Ships => Tàu Thủy
-- • Trains => Tàu Hỏa
-- • Trucks and Buses => Xe Tải và Buýt
-- • Vintage Cars = > Xe cũ
DELIMITER $$
create procedure ConvertProductLine()
begin
select 
if(productLine='Classic Cars','Xe cổ',
if(productLine='Motocrycles','Xe Mô tô',
if(productLine='Planes', 'Máy bay',
if(productLine='Ships', 'Tàu Thủy',
if(productLine='Trains', 'Tàu Hỏa',
if(productLine='Trucks and Buses', 'Xe Tải và Buýt','Xe cũ'
)))))) as productLine
from productlines;
end; $$
DELIMITER ;
call ConvertProductLine();
-- j. Như yêu cầu trong câu h nhưng sử dụng CASE
DELIMITER $$
create procedure EmployeeManagerCase()
begin
select 
(case when jobTitle like '%Manager%' 
then employeeNumber end)employeeNumber
from employees;
end; $$
call EmployeeManagerCase();
-- k. Lấy ra dòng sản phẩm dựa theo tên của một sản phẩm
DELIMITER $$
create procedure ProductLineByName(In ProductNameVal varchar(50))
begin
select productLine 
from products where productName=productNameVal;
end; $$
DELIMITER ;
call ProductLineByName('2002 Suzuki XREO');
-- l. Sử dụng vòng lặp liệt kê các sản phẩm thuộc dòng Xe cũ có giá mua thấp 
-- hơn 50
-- 2. Viết Trigger thực hiện các yêu cầu sau:
-- a. Nhắc nhở khi quên nhập email lúc thêm dữ liệu vào bảng Nhân viên
DELIMITER $$
create trigger beforewmployee_insert
before insert
on employees for each row
begin
declare errorMessage varchar(255);
set errorMessage=concat('Chua nhap dia chi email', new.lastName,'',new.firstName);

if new.email is null then
signal sqlstate '45000'
	set MESSAGE_TEXT=errorMessage;
    end if;
end; $$
DELIMITER ;
insert into employees(employeeNumber,lastName,firstName) value(200,'Vo Thi Thuy', 'Phuong');
-- b. Thông báo lỗi không cho phép sửa tên của các dòng sản phẩm
DELIMITER $$
create trigger before_product_update
before update
on products for each row
begin
declare errorMessage varchar(255);
set errorMessage='Không cho phép sửa tên của productLine';
if new.productLine not like old.productLine then
signal sqlstate '45000'
	set MESSAGE_TEXT=errorMessage;
    end if;
end; $$
DELIMITER ;
update products
set productLine='Cars'
where productCode='S10_1678';
-- c. Lưu lại thông tin các bảng khi thực hiện thao tác xóa.
create table productArchives(
 `productCode` varchar(15) NOT NULL,
  `productName` varchar(70) NOT NULL,
  `productLine` varchar(50) NOT NULL,
  `productScale` varchar(10) NOT NULL,
  `productVendor` varchar(50) NOT NULL,
  `productDescription` text NOT NULL,
  `quantityInStock` smallint(6) NOT NULL,
  `buyPrice` decimal(10,2) NOT NULL,
  `MSRP` decimal(10,2) NOT NULL,
  PRIMARY KEY (`productCode`),
  KEY `productLine` (`productLine`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
DELIMITER $$
create trigger before_product_delete
before delete
on products for each row
begin
insert into productArchives(productCode, productName, productLine, productScale, productVendor, productDescription, quantityInstock,buyPrice, MSRP)
value(old.productCode, old.productName, old.productLine, old.productScale, old.productVendor, old.productDescription,old.quantityInstock,old.buyPrice,old.MSRP);
end; $$
DELIMITER ;
delete from products;
select*from productArchives;