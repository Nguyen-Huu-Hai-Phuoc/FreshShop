use master
go

if exists (select * from sys.databases where name=N'asmjv5')
	drop database asmjv5
go

create database asmjv5
go
use asmjv5
go

create table Accounts(
	Username nvarchar(50) primary key not null, 
	Password nvarchar(50) not null,
	Fullname nvarchar(50) not null,
	Email nvarchar(50) not null,
	Photo nvarchar(50) not null,
	Activated bit not null,
	Admin bit not null
)


create table Orders(
	Id bigint identity(1,1) primary key not null,
	Username nvarchar(50) not null,
	CreateDate datetime not null,
	Address nvarchar(100) not null,
	Paid bit not null,
	foreign key (Username) references Accounts(Username)
)

ALTER TABLE Orders
ADD Phone nvarchar(10);

create table Categories(
	Id char(4) primary key not null,
	Name nvarchar(50) not null,
)
ALTER TABLE Categories
ADD Image nvarchar(50);

create table Products(
	Id int identity(1,1) primary key not null,
	Name nvarchar(50) not null,
	Image nvarchar(50) not null,
	Price float not null,
	CreateDate datetime not null,
	Available bit not null,
	CategoryId char(4) not null,
	foreign key (CategoryId) references Categories(Id)
)

create table OrderDetails(
	Id bigint identity(1,1) primary key not null,
	OrderId bigint not null,
	ProductId int not null,
	Price float not null,
	Quantity int not null,
	foreign key (OrderId) references Orders(Id),
	foreign key (ProductId) references Products(Id)
)

use asmjv5

insert into Accounts(Username, Password, Fullname, Email, Photo, Activated, Admin)
values ('admin', '123', N'Nguyễn Văn Tèo', 'teonv@gmail', 'admin.jpg', 1, 1),
	   ('user1', '1234', N'Nguyễn Thị Diu sờ', 'user1@gmail', 'user1.jpg', 1, 0)

insert into Categories (Id, Name)
values (N'1000', N'Samsung4'),
	   (N'1001', N'Oppo'),
	   (N'1002', N'VSMart2')

insert into Products (Name, Image, Price, CreateDate, Available, CategoryId)
values (N'Samsung', N'samsung.png', 234.5, CAST(N'2001-12-29' AS Date), 1, N'1001'),
	   (N'Oppo', N'oppo.png', 123.5, CAST(N'2021-05-11' AS Date), 1, N'1001'),
	   ( N'BPhone', N'bphone.png', 211.7, CAST(N'2021-03-11' AS Date), 1, N'1001'),
	   (N'Tiki', N'tiki.png', 200.1, CAST(N'2021-04-23' AS Date), 1, N'1002'),
	   (N'Lazada', N'lazada.jpg', 156.4, CAST(N'2011-05-07' AS Date), 1, N'1002'),
	   (N'Shoppe', N'shoppe.png', 99.7, CAST(N'2003-03-06' AS Date), 1, N'1002'),
	   (N'Alibaba', N'alibaba.jpg', 100.5, CAST(N'2004-05-02' AS Date), 1, N'1001'),
	   (N'Doremon', N'doremon.png', 121.6, CAST(N'2012-11-29' AS Date), 1, N'1001'),
	   (N'Doremi', N'doremi.png', 125.7, CAST(N'2014-12-29' AS Date), 1, N'1002')

insert into Products (Name, Image, Price, CreateDate, Available, CategoryId)
values (N'Rau muống đỏ', N'rmd.jpg', 234.5, CAST(N'2022-06-15' AS Date), 1, N'1007'),
(N'Rau muống nước', N'rmn.png', 115.5, CAST(N'2022-06-15' AS Date), 1, N'1007'),
(N'Rau muống tre', N'rmt.jpg', 234.5, CAST(N'2022-06-15' AS Date), 1, N'1007'),
(N'Rau muống đỏ', N'rmd.jpg', 234.5, CAST(N'2022-06-15' AS Date), 1, N'1007'),
(N'Rau muống nước', N'rmn.png', 115.5, CAST(N'2022-06-15' AS Date), 1, N'1007'),

(N'Cải đen', N'caiden.jpg', 314.5, CAST(N'2022-06-15' AS Date), 1, N'1010'),
(N'Cải đỏ', N'caido.jpg', 265.5, CAST(N'2022-06-15' AS Date), 1, N'1010'),
(N'Cải đỏ mini', N'caimini.jpg', 214.5, CAST(N'2022-06-15' AS Date), 1, N'1010'),
(N'Cải trắng', N'caitrang.jpg', 126.5, CAST(N'2022-06-15' AS Date), 1, N'1010'),
(N'Cải trắng hồng', N'caitranghong.jpg', 115.5, CAST(N'2022-06-15' AS Date), 1, N'1010'),
(N'Cải đỏ', N'caido.jpg', 265.5, CAST(N'2022-06-15' AS Date), 1, N'1010')

insert into Orders(Username, CreateDate, Address, Paid)
values ('user1', '2022-02-02', '123 Quang Trung', 1)

insert into OrderDetails(OrderId, ProductId, Price, Quantity)
values (1, 1, 234.5, 1),
	   (1, 2, 247, 2)


create table Students(
	MaSV int primary key not null, 
	Fullname nvarchar(50) not null,
	Marks float not null,
	Specialized nvarchar(50) not null
)


insert into Students(MaSV, Fullname, Marks, Specialized)
values (1000, N'Nguyễn Hữu Hải Phước', 9.0,'UDPM'),
	   (1001, N'Nguyễn Văn B', 10.0,'UDPM'),
	   (1002, N'Nguyễn Văn C', 8.0,'UDPM'),
	   (1003, N'Nguyễn Văn D', 6.0,'UDPM'),
	   (1004, N'Nguyễn Văn E', 10.0,'UDPM')

