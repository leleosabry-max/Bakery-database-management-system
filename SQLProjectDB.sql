use master;
DROP TABLE IF EXISTS order_details;
DROP TABLE IF EXISTS order_;
DROP TABLE IF EXISTS CustomerPhone;
DROP TABLE IF EXISTS CustomerAddress;
DROP TABLE IF EXISTS driver;
DROP TABLE IF EXISTS product_;
DROP TABLE IF EXISTS kitchen;
DROP TABLE IF EXISTS customer;
create table customer(
customer_ID int primary key,
customer_name varchar(50),

);
create table CustomerPhone(
customer_ID int,
PhoneNumber varchar(20),
primary key (customer_ID,PhoneNumber),
foreign key (customer_ID) references customer(customer_ID)
);
create table CustomerAddress(
customer_ID int,
CustomerAddress varchar(255),
primary key (customer_ID,CustomerAddress),
foreign key (customer_ID) references customer(customer_ID)
);
create table product_(
product_Name varchar(20),
product_ID int primary key,
price decimal(10,2),
stock_quantity int,
expiry__date date,
);

create table kitchen(
kitchen_ID int primary key,
kitchen_location varchar(50)
);
create table driver(
driver_ID int primary key,
driver_name varchar(50),
phoneNumber varchar(20)
);

create table order_(
order_ID int primary key,
customer_ID int foreign key references customer (customer_ID),
kitchen_ID int foreign key references kitchen(kitchen_ID),
order_date date,
driver_ID int foreign key references driver(driver_ID)
);
create table order_details(
order_ID int foreign key references order_(order_ID),
tracking_status varchar(50),
product_ID int foreign key references product_(product_ID),
quantity int,
preorder bit,
total decimal(10,2)
);

insert into customer(customer_ID,customer_name)
values
(1,'bob ross'),
(2,'alice kyle'),
(3,'omar eldesouky'),
(4,'laila amer'),
(5,'menna amr'),
(6,'nourhan khalil'),
(7,'hussien elmohamady'),
(8,'mohamed hassan'),
(9,'enjy ali'),
(10,'galal elsharkawy');

insert into CustomerPhone(customer_ID,PhoneNumber)
values
(1,'77687483'),
(2,'95849653'),
(2,'59376095'),
(3,'02859385'),
(4,'94876598'),
(5,'28359840'),
(5,'32328576'),
(6,'38956739'),
(6,'49837698'),
(7,'25378123'),
(8,'58789652'),
(9,'58967834'),
(10,'198509898'),
(10,'73940576');

insert into CustomerAddress(customer_ID,CustomerAddress)
values
(1,'123 Maple Street, Springfield, IL 62704'),

(1,'456 Elmwood Avenue, Centerville, OH 45459'),

(2,'789 Pine Crest Lane, Rivertown, TX 75001'),

(2,'1024 Oak Drive, Lakeview, CA 90210'),

(3,'555 Sunset Boulevard, Pleasantville, NY 10570'),
(4,'12 Baker Street, London, W1U 3BW'),

(5,'87 Queen''s Road, Manchester, M13 9PL'),

(6,'44 Highgate Crescent, Birmingham, B12 8AB'),

(7,'22 Park Lane, Bristol, BS1 4ST'),

(7,'9 Riverbank Way, Edinburgh, EH8 9JF'),
(8,'101 Maple Leaf Road, Toronto, ON M4C 1Z3'),

(8,'88 Snowcap Drive, Vancouver, BC V5K 1Z8'),

(9,'35 Polar Avenue, Calgary, AB T2P 3N4'),

(9,' North Ridge Blvd, Ottawa, ON K1A 0B1'),

(10,'200 Hudson Street, Montreal, QC H3Z 2Y7');

insert into product_(product_Name,product_ID,price,stock_quantity,expiry__date)
values
('strawberry croissant',1234,29.99,7,'2025-05-05'),
('chocolate croissant',1231,27.99,5,'2025-05-07'),
('sourdough bread',1233,15,3,'2025-05-08'),
('vanilla swissroll',1235,16.5,8,'2025-05-06'),
('strawberry swissroll',1236,17.5,5,'2025-05-06'),
('chocolate swissroll',1237,17,1,'2025-05-09'),
('blueberry cheesecake',1238,20,7,'2025-05-09'),
('plain croissant',1239,25,10,'2025-05-08'),
('chocolate cake',1230,22.5,6,'2025-05-10'),
('vanilla cake',1232,22.5,9,'2025-05-07');
 
 insert into kitchen(kitchen_ID,kitchen_location)
 values
 (11,'london'),
 (12,'paris'),
 (13,'toronto'),
 (14,'cairo'),
 (15,'california'),
 (16,'new york'),
 (17,'alexandria'),
 (18,'frankfurt'),
 (19,'berlin'),
 (20,'hamburg');

 insert into driver(driver_ID,driver_name,phoneNumber)
 values
(21,'jake','1234568'),
(22,'randi','23456781'),
(23,'mark','34567812'),
(24,'lisa','45678123'),
(25,'noah','56781234'),
(26,'emma','67812345'),
(27,'lucas','78923456'),
(28,'mia','89034567'),
(29,'oliver','90145678'),
(30,'ava','01256789'),
(31,'ethan','12367890');

insert into order_(order_ID,customer_ID,kitchen_ID,order_date,driver_ID)
values
(61,1,11,'2025-05-06',21),
(62,2,12,'2025-04-05',22),
(63, 3, 13, '2025-05-01', 23),
(64, 4, 14, '2025-04-29', 24),
(65, 5, 15, '2025-05-03', 25),
(66, 6, 16, '2025-05-02', 26),
(67, 7, 17, '2025-05-01', 27),
(68, 8, 18, '2025-05-04', 28),
(69, 9, 19, '2025-05-03', 29),
(70, 10, 20, '2025-04-30', 30);

insert into order_details(order_ID,tracking_status,product_ID,quantity,preorder,total)
values
(61, 'Out for delivery', 1234, 2, 0, 59.98),
(62, 'Preparing', 1231, 1, 1, 27.99),
(63, 'Delivered', 1233, 1, 0, 15.00),
(64, 'Delivered', 1235, 3, 0, 49.50),
(65, 'In transit', 1236, 2, 1, 35.00),
(66, 'Preparing', 1237, 1, 1, 17.00),
(67, 'Out for delivery', 1238, 2, 0, 40.00),
(68, 'Delivered', 1239, 3, 0, 75.00),
(69, 'Preparing', 1230, 1, 1, 22.50),
(70, 'Delivered', 1232, 2, 0, 45.00);

select count(*) from order_details where tracking_status='Delivered';
alter table driver
add driver_salary decimal(10,2);
update driver 
set driver_salary = case driver_ID

when 21 then 3200.00
when 22 then 3450.50
when 23 then 3100.75
when 24 then 3600.00
when 25 then 3300.25
when 26 then 3400.00
when 27 then 3250.50
when 28 then 3550.00
when 29 then 3150.00
when 30 then 3700.00
end
where driver_ID in(21,22,23,24,25,26,27,28,29,30);
DELETE FROM order_details WHERE order_ID IN (
    SELECT order_ID FROM order_ WHERE customer_ID = 1
);
begin try 
begin transaction;
insert into customer (customer_ID,customer_name)
values
(50,'john doe');
insert into CustomerPhone(customer_ID,PhoneNumber)
values
(50,'77688883');
insert into CustomerAddress(customer_ID,CustomerAddress)
values
(50,'123 Maple Street, Springfield, IL 62704');
commit transaction;
print'transaction completed successfully. all changes commited';
end try
begin catch
rollback transaction
print'transaction failed and rolled back.error';
end catch

DELETE FROM order_ WHERE customer_ID = 1;
DELETE FROM CustomerPhone WHERE customer_ID = 1;
DELETE FROM CustomerAddress WHERE customer_ID = 1;
DELETE FROM customer WHERE customer_ID = 1;
select * from order_ inner join kitchen 
on order_.kitchen_ID=kitchen.kitchen_ID;
grant select on customer(customer_name) to kitchen;
revoke all on customer from kitchen cascade;









