/*Creating a New Databese*/
create database cab_booking;
use cab_booking;

/*Creating all the required tables in the new database*/
/*Table 1 : Customers*/
create table Customers(
cust_id int primary key auto_increment,
cust_name varchar(20),
cust_phone_no int check (length(cust_phone_no)=10),
cust_gender char(1) check(cust_gender in ("M","F")));
alter table Customers modify column cust_phone_no varchar(10) check (length(cust_phone_no)=10);

/*Table 2 : Cabs*/
create table Cabs(
cab_id int primary key auto_increment,
cab_type varchar(10) check(cab_type in ("Sedan","Mini","SUV","Auto")),
license_no varchar(20),
model_year Year);
alter table Cabs auto_increment=1001;


/*Table 3 : Drivers*/
create table Drivers(
dr_id int primary key auto_increment,
dr_name varchar(20),
dr_phone int check(length(dr_phone)=10),
exp_years int check(exp_years>=0),
dr_cab_id int,
foreign key (dr_cab_id) references Cabs(cab_id));
alter table Drivers auto_increment=101;
alter table Drivers modify column dr_phone varchar(10) check (length(dr_phone)=10);


/*Table 4 : Booking*/
create table Bookings(
b_id int primary key auto_increment,
cust_id int,
b_date_time datetime,
pickup varchar(200),
dropoff varchar(200),
transport_type varchar(5) check(transport_type in ("Sedan","SUV","Mini","Auto")),
fare int,
foreign key (cust_id) references Customers(cust_id));
alter table Bookings auto_increment=501;
alter table Bookings add b_status varchar(20) check(b_status in ("Accepted","Cancelled")); 


/*Table 5 : Trip Details*/
create table Trip_Details(
t_id int primary key auto_increment,
b_id int,
dr_id int,
t_accept_time datetime,
start_time datetime,
endtime datetime,
payment_method varchar(20) check(payment_method in ("Online","Cash")),
foreign key (b_id) references Bookings(b_id) on delete cascade,
foreign key (dr_id) references Drivers(dr_id) on delete cascade); 
alter table Trip_Details auto_increment=2001;

/*Table 6 : Reviews*/
create table Reviews(
r_id int primary key auto_increment,
cust_id int,
t_id int,
rating int check(rating between 1 and 5),
review varchar(200),
foreign key (cust_id) references Customers(cust_id),
foreign key (t_id) references Trip_Details(t_id));

/*Checking and Describing the Tables*/
show tables;
desc bookings;
desc customers;
desc cabs;
desc drivers;
desc trip_details;
desc reviews;

/*Insering Values in The Tables*/ 
/*Inserting into Customers*/
INSERT INTO Customers (cust_name, cust_phone_no, cust_gender) VALUES
('Amit Sharma','9876543210','M'),
('Rohit Verma','9876543211','M'),
('Sneha Patel','9876543212','F'),
('Priya Nair','9876543213','F'),
('Karan Gupta','9876543214','M'),
('Meera Joshi','9876543215','F'),
('Vikas Singh','9876543216','M'),
('Ananya Rao','9876543217','F'),
('Rajesh Kumar','9876543218','M'),
('Neha Sharma','9876543219','F'),
('Arjun Mehta','9876543220','M'),
('Shreya Jain','9876543221','F'),
('Manish Yadav','9876543222','M'),
('Pooja Iyer','9876543223','F'),
('Saurabh Das','9876543224','M'),
('Divya Reddy','9876543225','F'),
('Nikhil Bansal','9876543226','M'),
('Kavya Kapoor','9876543227','F'),
('Ashish Kumar','9876543228','M'),
('Simran Kaur','9876543229','F'),
('Rahul Chauhan','9876543230','M'),
('Ishita Malhotra','9876543231','F'),
('Aditya Mishra','9876543232','M'),
('Tanvi Agarwal','9876543233','F'),
('Rajat Saxena','9876543234','M'),
('Aishwarya Menon','9876543235','F'),
('Sandeep Ghosh','9876543236','M'),
('Nisha Thakur','9876543237','F'),
('Deepak Rana','9876543238','M'),
('Ritika Singh','9876543239','F');

/*Inserting into Cabs*/
INSERT INTO Cabs (cab_type, license_no, model_year) VALUES
('Sedan','MH12AB1234',2018),
('SUV','MH12AB1235',2019),
('Mini','MH12AB1236',2020),
('Auto','MH12AB1237',2017),
('Sedan','MH12AB1238',2021),
('SUV','MH12AB1239',2022),
('Mini','MH12AB1240',2019),
('Auto','MH12AB1241',2018),
('Sedan','MH12AB1242',2020),
('SUV','MH12AB1243',2021),
('Mini','MH12AB1244',2017),
('Auto','MH12AB1245',2019),
('Sedan','MH12AB1246',2022),
('SUV','MH12AB1247',2018),
('Mini','MH12AB1248',2020),
('Auto','MH12AB1249',2021),
('Sedan','MH12AB1250',2019),
('SUV','MH12AB1251',2017),
('Mini','MH12AB1252',2022),
('Auto','MH12AB1253',2018),
('Sedan','MH12AB1254',2020),
('SUV','MH12AB1255',2021),
('Mini','MH12AB1256',2019),
('Auto','MH12AB1257',2022),
('Sedan','MH12AB1258',2018),
('SUV','MH12AB1259',2020),
('Mini','MH12AB1260',2017),
('Auto','MH12AB1261',2021),
('Sedan','MH12AB1262',2019),
('SUV','MH12AB1263',2022);

/*Inserting into Drivers*/
INSERT INTO Drivers (dr_name, dr_phone, exp_years, dr_cab_id) VALUES
('Driver1','9876500010',5,1001),
('Driver2','9876500011',3,1002),
('Driver3','9876500012',2,1003),
('Driver4','9876500013',6,1004),
('Driver5','9876500014',4,1005),
('Driver6','9876500015',7,1006),
('Driver7','9876500016',1,1007),
('Driver8','9876500017',2,1008),
('Driver9','9876500018',5,1009),
('Driver10','9876500019',3,1010),
('Driver11','9876500020',8,1011),
('Driver12','9876500021',4,1012),
('Driver13','9876500022',6,1013),
('Driver14','9876500023',7,1014),
('Driver15','9876500024',3,1015),
('Driver16','9876500025',2,1016),
('Driver17','9876500026',5,1017),
('Driver18','9876500027',4,1018),
('Driver19','9876500028',1,1019),
('Driver20','9876500029',6,1020),
('Driver21','9876500030',7,1021),
('Driver22','9876500031',5,1022),
('Driver23','9876500032',3,1023),
('Driver24','9876500033',2,1024),
('Driver25','9876500034',8,1025),
('Driver26','9876500035',4,1026),
('Driver27','9876500036',6,1027),
('Driver28','9876500037',5,1028),
('Driver29','9876500038',7,1029),
('Driver30','9876500039',3,1030);

/*Inserting in Bookings*/
INSERT INTO Bookings (cust_id, b_date_time, pickup, dropoff, transport_type, fare, b_status) VALUES
(1,'2025-09-01 10:00:00','Pune Station','Kothrud','Sedan',350,'Accepted'),
(2,'2025-09-01 11:30:00','Baner','Hinjewadi','SUV',500,'Accepted'),
(3,'2025-09-02 09:00:00','Hadapsar','Viman Nagar','Mini',250,'Cancelled'),
(4,'2025-09-02 14:30:00','Kothrud','Shivaji Nagar','Auto',120,'Accepted'),
(5,'2025-09-03 08:15:00','Camp','Magarpatta','Sedan',400,'Accepted'),
(6,'2025-09-03 19:00:00','Aundh','Pimpri','SUV',600,'Cancelled'),
(7,'2025-09-04 07:45:00','Koregaon Park','Swargate','Mini',220,'Accepted'),
(8,'2025-09-04 18:30:00','Hinjewadi','Balewadi','Sedan',300,'Accepted'),
(9,'2025-09-05 09:45:00','Yerwada','Kalyani Nagar','Auto',100,'Accepted'),
(10,'2025-09-05 15:20:00','Hadapsar','FC Road','SUV',550,'Accepted'),
(11,'2025-09-06 07:00:00','Swargate','Pimpri','Sedan',420,'Accepted'),
(12,'2025-09-06 20:00:00','Camp','Akurdi','Mini',280,'Accepted'),
(13,'2025-09-07 09:10:00','Baner','Hinjewadi','SUV',500,'Accepted'),
(14,'2025-09-07 19:30:00','Wakad','Viman Nagar','Sedan',350,'Cancelled'),
(15,'2025-09-08 08:40:00','Koregaon Park','Hadapsar','Auto',150,'Accepted'),
(16,'2025-09-08 17:50:00','Magarpatta','Baner','Mini',260,'Accepted'),
(17,'2025-09-09 10:10:00','Shivaji Nagar','Kothrud','SUV',480,'Accepted'),
(18,'2025-09-09 19:30:00','Aundh','Swargate','Sedan',400,'Accepted'),
(19,'2025-09-10 09:00:00','Yerwada','Viman Nagar','Mini',230,'Accepted'),
(20,'2025-09-10 15:45:00','FC Road','Pimpri','SUV',520,'Accepted'),
(21,'2025-09-11 07:20:00','Balewadi','Camp','Sedan',390,'Accepted'),
(22,'2025-09-11 18:30:00','Hadapsar','Baner','Mini',250,'Accepted'),
(23,'2025-09-12 09:00:00','Kalyani Nagar','Akurdi','SUV',600,'Cancelled'),
(24,'2025-09-12 14:30:00','Magarpatta','Swargate','Auto',140,'Accepted'),
(25,'2025-09-13 08:00:00','Yerwada','FC Road','Sedan',360,'Accepted'),
(26,'2025-09-13 17:10:00','Baner','Koregaon Park','Mini',240,'Accepted'),
(27,'2025-09-14 09:40:00','Pimpri','Viman Nagar','SUV',580,'Accepted'),
(28,'2025-09-14 18:00:00','Camp','Wakad','Sedan',400,'Accepted'),
(29,'2025-09-15 08:30:00','Kothrud','Balewadi','Mini',260,'Accepted'),
(30,'2025-09-15 19:20:00','Swargate','Hinjewadi','SUV',610,'Accepted');

INSERT INTO Bookings (cust_id, b_date_time, pickup, dropoff, transport_type, fare, b_status) VALUES
(12,'2025-09-16 08:00:00','Aundh','Camp','Sedan',380,'Accepted'),
(7,'2025-09-16 09:30:00','Swargate','Baner','SUV',520,'Accepted'),
(25,'2025-09-16 18:15:00','Viman Nagar','Yerwada','Mini',240,'Cancelled'),
(19,'2025-09-17 07:20:00','Hadapsar','Koregaon Park','Auto',130,'Accepted'),
(4,'2025-09-17 10:00:00','Magarpatta','FC Road','Sedan',400,'Accepted'),
(28,'2025-09-17 14:45:00','Shivaji Nagar','Kothrud','SUV',570,'Accepted'),
(15,'2025-09-17 19:00:00','Hinjewadi','Balewadi','Mini',260,'Accepted'),
(9,'2025-09-18 08:30:00','Pimpri','Chinchwad','Auto',110,'Accepted'),
(30,'2025-09-18 11:00:00','Camp','Kalyani Nagar','Sedan',420,'Cancelled'),
(2,'2025-09-18 20:10:00','Akurdi','Swargate','SUV',610,'Accepted'),
(18,'2025-09-19 07:45:00','Yerwada','Hinjewadi','Mini',250,'Accepted'),
(6,'2025-09-19 09:15:00','Viman Nagar','Koregaon Park','Sedan',390,'Accepted'),
(23,'2025-09-19 17:50:00','Balewadi','Aundh','SUV',560,'Accepted'),
(11,'2025-09-20 08:20:00','Shivaji Nagar','Camp','Auto',150,'Accepted'),
(20,'2025-09-20 10:40:00','Baner','Magarpatta','Mini',270,'Cancelled'),
(1,'2025-09-20 18:00:00','Pimpri','Wakad','Sedan',410,'Accepted'),
(16,'2025-09-21 07:55:00','Aundh','FC Road','SUV',590,'Accepted'),
(22,'2025-09-21 09:35:00','Hinjewadi','Hadapsar','Mini',280,'Accepted'),
(8,'2025-09-21 16:10:00','Swargate','Yerwada','Auto',140,'Accepted'),
(29,'2025-09-21 19:25:00','Viman Nagar','Balewadi','Sedan',450,'Accepted');

/*Insering into Trip Details*/
insert into Trip_Details(b_id,dr_id,t_accept_time,start_time,endtime,payment_method) values
(501,101,'2025-09-01 10:05:00','2025-09-01 10:15:00','2025-09-01 10:50:00',"Online"),
(502,102,'2025-09-01 11:38:00','2025-09-01 11:50:00','2025-09-01 12:50:00',"Cash"),
(504,103,'2025-09-02 14:35:00','2025-09-02 14:40:00','2025-09-02 14:50:00',"Cash"),
(505,104,'2025-09-03 08:30:00','2025-09-03 08:40:00','2025-09-03 09:15:00',"Online"),
(507,105,'2025-09-04 07:55:00','2025-09-04 08:15:00','2025-09-04 08:25:00',"Online"),
(508,106,'2025-09-04 18:35:00','2025-09-04 18:40:00','2025-09-04 19:15:00',"Cash"),
(509,107,'2025-09-05 10:00:00','2025-09-05 10:20:00','2025-09-05 10:55:00',"Cash"),
(510,108,'2025-09-05 15:40:00','2025-09-05 16:00:00','2025-09-05 16:55:00',"Cash"),
(511,109,'2025-09-06 07:10:00','2025-09-06 07:25:00','2025-09-06 07:55:00',"Online"),
(512,110,'2025-09-06 20:10:00','2025-09-06 20:20:00','2025-09-06 20:40:00',"Online"),
(513,111,'2025-09-07 09:15:00','2025-09-07 09:25:00','2025-09-07 10:15:00',"Online"),
(515,112,'2025-09-08 08:45:00','2025-09-08 09:00:00','2025-09-08 09:20:00',"Online"),
(516,113,'2025-09-08 18:00:00','2025-09-08 18:15:00','2025-09-08 18:35:00',"Cash"),
(517,114,'2025-09-09 10:25:00','2025-09-09 10:35:00','2025-09-09 11:10:00',"Cash"),
(518,115,'2025-09-09 19:45:00','2025-09-09 20:00:00','2025-09-09 20:45:00',"Online"),
(519,116,'2025-09-10 09:05:00','2025-09-10 09:15:00','2025-09-10 09:35:00',"Online"),
(520,117,'2025-09-10 16:00:00','2025-09-10 16:10:00','2025-09-10 17:10:00',"Cash"),
(521,118,'2025-09-11 07:30:00','2025-09-11 07:45:00','2025-09-11 08:20:00',"Cash"),
(522,119,'2025-09-11 18:35:00','2025-09-11 18:50:00','2025-09-11 19:15:00',"Cash"),
(524,120,'2025-09-12 14:35:00','2025-09-12 14:40:00','2025-09-12 14:50:00',"Online"),
(525,121,'2025-09-13 08:15:00','2025-09-13 08:25:00','2025-09-13 08:55:00',"Online"),
(526,122,'2025-09-13 17:15:00','2025-09-13 17:25:00','2025-09-13 17:50:00',"Online"),
(527,123,'2025-09-14 09:45:00','2025-09-14 10:00:00','2025-09-14 11:10:00',"Cash"),
(528,124,'2025-09-14 18:15:00','2025-09-14 18:25:00','2025-09-14 19:10:00',"Cash"),
(529,125,'2025-09-15 08:35:00','2025-09-15 08:45:00','2025-09-15 09:05:00',"Online"),
(530,126,'2025-09-15 19:25:00','2025-09-15 19:40:00','2025-09-15 20:55:00',"Online"),
(531,127,'2025-09-16 08:10:00','2025-09-16 08:25:00','2025-09-16 09:05:00',"Cash"),
(532,128,'2025-09-16 09:35:00','2025-09-16 09:45:00','2025-09-16 10:35:00',"Cash"),
(534,129,'2025-09-17 07:25:00','2025-09-17 07:35:00','2025-09-17 07:50:00',"Cash"),
(535,130,'2025-09-17 10:10:00','2025-09-17 10:25:00','2025-09-17 11:10:00',"Online");

insert into Trip_Details(b_id,dr_id,t_accept_time,start_time,endtime,payment_method) values
(536,101,'2025-09-17 15:00:00','2025-09-17 15:10:00','2025-09-17 16:00:00',"Online"),
(537,102,'2025-09-17 19:10:00','2025-09-17 19:25:00','2025-09-17 19:55:00',"Cash"),
(538,103,'2025-09-18 08:35:00','2025-09-18 08:40:00','2025-09-18 08:55:00',"Cash"),
(540,104,'2025-09-18 20:20:00','2025-09-18 20:35:00','2025-09-18 22:00:00',"Cash"),
(541,105,'2025-09-19 08:00:00','2025-09-19 08:10:00','2025-09-19 08:30:00',"Online"),
(542,106,'2025-09-19 09:30:00','2025-09-19 09:45:00','2025-09-19 10:40:00',"Online"),
(543,107,'2025-09-19 18:05:00','2025-09-19 18:15:00','2025-09-19 19:00:00',"Cash"),
(544,108,'2025-09-20 08:30:00','2025-09-20 08:40:00','2025-09-20 08:50:00',"Cash"),
(546,109,'2025-09-20 18:20:00','2025-09-20 18:35:00','2025-09-20 19:15:00',"Online"),
(547,110,'2025-09-21 08:00:00','2025-09-21 08:10:00','2025-09-21 09:00:00',"Cash"),
(548,111,'2025-09-21 09:45:00','2025-09-21 10:00:00','2025-09-21 10:30:00',"Cash"),
(549,112,'2025-09-21 16:15:00','2025-09-21 16:25:00','2025-09-21 16:55:00',"Online"),
(550,113,'2025-09-21 19:30:00','2025-09-21 19:45:00','2025-09-21 20:20:00',"Cash");

/*Inserting into Reviews*/

INSERT INTO Reviews (cust_id, t_id, rating, review) VALUES
(1,2001,5,'Great ride, very comfortable!'),
(2,2002,4,'Smooth trip but a bit costly.'),
(4,2003,5,'Friendly driver, good experience.'),
(5,2004,4,'Nice clean car.'),
(7,2005,5,'Quick and smooth journey!'),
(8,2006,4,'Good driving skills.'),
(9,2007,3,'Average ride, nothing special.'),
(10,2008,5,'Excellent service, will book again!'),
(11,2009,4,'Comfortable ride, polite driver.'),
(12,2010,5,'Perfect timing and clean cab.'),
(13,2011,3,'Bit of traffic but okay experience.'),
(15,2012,5,'Smooth and comfortable!'),
(16,2013,2,'Driver was rude.'),
(17,2014,4,'Overall good, but AC not working.'),
(18,2015,5,'Best cab ride I had in months!'),
(19,2016,3,'Could improve cleanliness.'),
(20,2017,4,'Punctual and polite driver.'),
(21,2018,5,'Amazing experience!'),
(22,2019,3,'Cab condition was average.'),
(24,2020,5,'Driver knew the best route, quick arrival.'),
(25,2021,2,'Uncomfortable ride, suspension issue.'),
(26,2022,4,'Good experience overall.'),
(27,2023,5,'Perfect ride, friendly driver.'),
(28,2024,4,'Clean and punctual.'),
(29,2025,3,'Mediocre service.'),
(30,2026,5,'Fantastic ride, highly recommended!'),
(12,2027,3,'Driver was slightly late.'),
(7,2028,2,'Cab was late, not satisfied.'),
(19,2029,4,'Driver was professional.'),
(4,2030,4,'Trip was fine.'),
(28,2031,2,'Uncomfortable ride, suspension issue.'),
(15,2032,4,'Driver was professional.'),
(9,2033,3,'Could improve cleanliness.'),
(30,2034,5,'Smooth and comfortable!'),
(2,2035,4,'Good driving skills.'),
(18,2036,5,'Best cab ride I had in months!'),
(6,2037,3,'Could improve cleanliness.'),
(23,2038,4,'Good experience overall.'),
(11,2039,4,'Good driving skills.'),
(20,2040,5,'Smooth and comfortable!'),
(1,2041,3,'Average ride, nothing special.'),
(16,2042,3,'Average ride, nothing special.'),
(22,2043,3,'Could improve cleanliness.');

/*Identify customers who have completed the most bookings. What insights can you draw about their behavior? */
select c.cust_id,c.cust_name,COUNT(b.b_id) AS total_bookings
from Customers c
join Bookings b ON c.cust_id = b.cust_id
where b.b_status = 'Accepted'
group by c.cust_id, c.cust_name
having COUNT(b.b_id) = (select MAX(bookings_count) from (
            select COUNT(b_id) as bookings_count from Bookings
            where b_status = 'Accepted'
            group by cust_id) as sub);
            
/* Find customers who have canceled their bookings */
select c.cust_name,b.b_status from Customers c
inner join Bookings b
on c.cust_id = b.cust_id
where b.b_status = "Cancelled";

/* Determine the busiest day of the week for bookings.*/
select dayname(t_accept_time) AS day_of_week,count(*) AS total_bookings from Trip_Details
group by day_of_week
order by total_bookings desc
LIMIT 1;

/* Identify drivers who have received an average rating below 3.0 */
select d.dr_id,d.dr_name,round(avg(r.rating), 2) AS avg_rating
from Drivers d
join Trip_Details t on d.dr_id = t.dr_id
join Reviews r on t.t_id = r.t_id
group by d.dr_id, d.dr_name
having avg(r.rating) < 3.0;

/* Find the top 5 drivers who have completed the Highest fare trips in terms of distance.*/
select d.dr_id,d.dr_name,b.fare from Drivers d
inner join Trip_Details t on d.dr_id = t.dr_id
inner join Bookings b on t.b_id = b.b_id
order by fare desc
limit 5;

/* Calculate the total revenue generated by completed bookings*/
select sum(fare) as Total_Revenue from Bookings
where b_status = "Accepted";

/* Identify the top 3 most frequently traveled routes based on PickupLocation and DropoffLocation.*/
select pickup AS PickupLocation,dropoff AS DropoffLocation,COUNT(*) AS total_trips
from Bookings
group by  pickup, dropoff
order by total_trips DESC
LIMIT 3;

(select pickup as Location from Bookings
group by pickup 
order by count(pickup) desc
limit 1)
union
(select dropoff as Location from Bookings
group by dropoff
order by count(dropoff) desc
limit 1);

/* Analyze the average waiting time (difference between booking time and trip start time) for different pickup locations.*/
select b.pickup AS PickupLocation,
round(avg(TIMESTAMPDIFF(minute, b.b_date_time, t.start_time)), 2) AS avg_waiting_minutes
from Bookings b
join Trip_Details t ON b.b_id = t.b_id
where t.start_time IS NOT NULL
group by b.pickup
order by avg_waiting_minutes DESC;

/* Compare the revenue generated from 'Sedan' and 'SUV' cabs*/
select transport_type,sum(fare) from Bookings
where transport_type in ("Sedan","SUV")
group by transport_type;

/* Analyze whether weekend bookings differ significantly from weekday bookings.*/
select dayname(b_date_time) as days ,sum(fare) from Bookings
where b_status = "Accepted"
group by days;



