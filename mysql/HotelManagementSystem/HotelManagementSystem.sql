create database Hotel
create TABLE Hotel.Staff (
	Clock_In_ID	CHAR(4) NOT NULL Primary Key,
	Name CHAR(50) NOT NULL,
	Date DATE NOT NULL,
	Time_Clocked_In	TIME NOT NULL,
	Time_Clocked_Out TIME NOT NULL,
	Type CHAR(100) NOT NULL,
	Access_Liquor CHAR(1) NULL,
	Manager CHAR(50) NULL
);
create TABLE Hotel.Rooms (
	Room_Number INT NOT NULL,
	Is_Room_Cleaned CHAR(1) NOT NULL,
	Is_Room_Occupied CHAR(1) NOT NULL,
	Clock_In_ID CHAR(4) NOT NULL,
	Room_Cost DECIMAL(16,2) NOT NULL,
	Are_There_Incidents CHAR(1) NULL,
	Avg_Room_Cost DECIMAL(16,2) NOT NULL,
	Date DATE NOT NULL,
    PRIMARY KEY(Room_Number, Date),
    FOREIGN KEY (Clock_In_ID) REFERENCES Hotel.Staff(Clock_In_ID)
);

CREATE TABLE Hotel.Reservation (
	Confirmation_Num BIGINT NOT NULL Primary Key,
	Customer_Name CHAR(50) NOT NULL,
	Payment CHAR(10) NOT NULL,
	Type CHAR(10) NULL,
	Room_Number INT NOT NULL ,
	Check_In_Date DATE NOT NULL,
	Check_Out_Date DATE NOT NULL,
	Duration INT NOT NULL,
	Cost DECIMAL(16,2) NOT NULL
);

CREATE TABLE Hotel.Customer (
	ID VARCHAR(10) NOT NULL Primary Key,
	Confirmation_Num BIGINT NOT NULL,
	Customer_Name VARCHAR(50) NOT NULL,
	Customer_Email_Address VARCHAR(100) NOT NULL UNIQUE,
	Card_Information VARCHAR(100) NOT NULL UNIQUE,
	Points INT NULL,
	Member_Tier	CHAR(50) NULL,
	Team_Member_Or_Family CHAR(1) NULL,
    Foreign Key (Confirmation_Num) references Reservation(Confirmation_Num)
); 


create TABLE Hotel.FoodKioskSales (
	Department CHAR(15) NOT NULL,
	Item_Name CHAR(100) NOT NULL,
	Item_ID VARCHAR(10) NOT NULL Primary Key,
	Item_Sale DECIMAL(16,2) NOT NULL,
	Tips DECIMAL(16,2) NULL,
	Date_Of_Purchase DATE NOT NULL,
	Time_of_Purchase TIME NOT NULL,
	Emp_Clock_In_ID	CHAR(4) NULL, 
	Room_Number	INT NULL,
    FOREIGN KEY(Emp_Clock_In_ID) REFERENCES Staff(Clock_In_ID),
    FOREIGN KEY(Room_Number) REFERENCES Rooms(Room_Number)
);

create TABLE Hotel.Payment (
	Confirmation_Num BIGINT NOT NULL, 
	Room_Number	INT NOT NULL,
    ID VARCHAR(10) NOT NULL,
	Card_Information VARCHAR(100) NOT NULL,
	Food_Kiosk_Sale DECIMAL(16,2) NULL,
	Room_Cost DECIMAL(16,2) NOT NULL,
	Payment_Due DECIMAL(16,2) NOT NULL,
	Incidental_Hold	DECIMAL(16,2) NOT NULL,
	Money_Returned_To_Credit_Card	DECIMAL(16,2) NULL,
	Date DATE NOT NULL,
	Final_Amount DECIMAL(16,2) NOT NULL,
    FOREIGN KEY (Confirmation_Num) REFERENCES Hotel.Reservation(Confirmation_Num),
    FOREIGN KEY (Room_Number) References Rooms(Room_Number),
    PRIMARY KEY (Confirmation_Num,ID)
);

INSERT INTO Hotel.Rooms
VALUES (101, 'Y', 'N', '9821', 290.38,'N',215.92, '2025-12-14'),
	   (213, 'N', 'Y', '9821', 140.98, NULL, 125.83, '2025-12-07'),
       (299, 'Y', 'N', '0278', 150.35, 'N', 155.30, '2025-11-09'),
       (207, 'Y', 'N', '7821', 145.98, 'Y', 135.92, '2025-12-10'), 
       (150, 'N', 'N','0278', 168.93, 'N', 135.10, '2025-12-02'),
       (132, 'Y', 'Y', '7821', 130.02, NULL, 135.50, '2025-12-02'),
	   (209, 'N','N','7821',321.50, 'N',310.92, '2025-12-05'),
       (121, 'N', 'N', '1024', 127.77, 'N', 129.93, '2025-12-10'),
       (287, 'Y', 'N', '1024', 287.09, 'N', 215.92, '2025-12-14'),
       (140, 'N', 'N', '0278', 192.29, 'N', 200.91, '2025-12-13');
 
 INSERT INTO Hotel.Reservation 
 VALUES (7362717273819, 'Mary Stuck', 'Card', 'Individual', 101, '2025-12-12', '2025-12-15', 3, 892.20),
		(9373717275310, 'Jay Wilson', 'Card', 'Group', 213, '2025-12-06', '2025-12-08', 2, 314.92),
        (1273678228819, 'Keturah White', 'Cash', 'Individual', 299, '2025-12-09', '2025-12-10', 1,145.20),
        (9287465162838, 'Chinedu Opara', 'Card', 'Group',207, '2025-12-06','2025-12-08',2, 278.12),
        (9374748838109, 'Kelly Salmon', 'Cash', NULL, 150, '2025-11-30', '2025-12-02',2, 523.09),
        (1098273792838, 'Misha Pink', 'Card', 'Individual',132 , '2025-12-03', '2025-12-10', 7, 1493.20),
        (0182717273783, 'Breelyn Johnson', 'Cash', 'Group', 209, '2025-12-06','2025-12-08',2, 302.12),
        (9019298177374, 'Sarah Lopez', 'Card', 'Individual', 121, '2025-12-23', '2025-12-26', 3, 390.92),
        (0182737383737, 'Kathryn Pierce', 'Card', 'Individual', 287, '2025-12-07','2025-12-10', 3, 498.02),
        (9187272019292, 'Seonghwa Park', 'Card','Individual',140, '2025-12-27','2025-12-29',2,312.92);
       
INSERT INTO Hotel.Customer
VALUES ('72637378', 7362717273819, 'Mary Stuck', 'MaryStuck@gmail.com', '7372 7272 8920 0918', 8282, 'Gold', 'Y'),
	   ('82738129', 9373717275310, 'Jay Wilson', 'JayWilson@yahoo.com', '8278 8171 9091 0987', 1283, 'Silver', 'N'),
       ('01928380', 1273678228819, 'Keturah White', 'KeturahWhite@live.com', '7263 6172 9201 8272', NULL, NULL, NULL),
       ('09172638', 9287465162838, 'Chinedu Opara', 'ChineduOpara@yahoo.com', '8276 7278 9282 8228', 21982, 'Diamond', 'N'),
       ('87738838', 9374748838109, 'Kelly Salmon', 'Kel1208fish@gmail.com', '8283 8281 0098 8793', NULL, NULL, NULL),
       ('91838399', 1098273792838, 'Misha Pink', 'MishaPink1022@yahoo.com', '1029 9292 9281 8238', NULL, NULL, NULL),
       ('82737372', 0182717273783, 'Breelyn Johnson', 'Breelynkitkat@gmail.com', '9283 8282 8282 8282', 1912, 'Silver', 'N'),
	   ('72781828', 9019298177374, 'Sarah Lopez', 'SarahLop1993@live.com', '8282 9228 9282 9292', 4120, 'Gold', 'N'),
       ('12938302', 0182737383737, 'Kathryn Pierce', 'KathrynPierce@gmail.com', '9283 9100 5267 5143', NULL,NULL, NULL),
       ('01928374', 9187272019292, 'Seonghwa Park', 'SeonghwaPark@gmail.com', '1727 8273 8182 8900', 29380, 'Diamond', 'N');
       
INSERT INTO Hotel.Staff 
VALUES ('1024','Destiny Archer', '2025-12-04', '08:01:33','17:25:09', 'Housekeeping', 'N', 'Marlon Richie'),
	   ('2342','Willow Lover', '2025-12-13', '04:34:24','11:05:30','Breakfast Server', 'N', 'Marlon Richie'),
       ('1834', 'Lorraine Webber', '2025-12-07', '15:30:12','22:37:56', 'Night Cook', 'N', 'Chris Rules'),
       ('6738', 'Chris Rules', '2025-12-14', '13:57:58','21:23:43', 'Food and Beverage Manager', 'Y', NULL),
       ('7821', 'Sandra Willis', '2025-12-05', '07:56:12','17:28:52', 'Housekeeping', 'N', 'Marlon Richie'),
       ('9852', 'Amy Swift', '2025-12-09', '15:02:02','23:02:23', 'Front Desk', 'N', 'Gertrude Plate'),
       ('7632', 'Gertrude Plate', '2025-12-09', '13:09:43','22:09:10','Front Desk Manager', 'Y', NULL),
       ('2173', 'Matthew Mccough','2025-12-13', '16:34:55','23:09:21', 'Bartender', 'Y', 'Chris Rules'),
       ('9821', 'Walter Cunnings', '2025-12-15', '08:09:10','17:19:09', 'Housekeeping', 'N', 'Marlon Richie'),
       ('0278', 'Milo Manheim', '2025-12-18', '08:05:23', '17:30:34', 'Housekeeping', 'N', 'Marlon Richie');

INSERT INTO Hotel.FoodKioskSales
VALUES ('Kiosk', 'Steak Mash House', '3212', 28.99, 10.00, '2025-12-14', '22:01:21', NULL, NULL),
	   ('Restaurant', 'Sprite 20 OZ', '8192', 3.95, NULL, '2025-12-18','19:02:23', '2173', 213),
       ('Restaurant', 'Breakfast Buffet', '0912', '16.00', 7.23, '2025-12-10','07:23:12', '2342', NULL),
       ('Restaurant', 'Grey Goose 1 OZ', '09282', '15.92', 3.00, '2025-12-03', '18:30:12', '2173', NULL),
       ('Kiosk', 'Lays Original', '1823', 4.55, NULL, '2025-12-06', '14:09:52', NULL, NULL),
	   ('Kiosk', 'Oreo Cookies SM', '9871', 3.39, NULL, '2025-12-18', '17:42:21', NULL, 299),
       ('Kiosk', 'Tree Frt Red 230ML', '12092', 12.00, NULL, '2025-12-04', '18:09:22', NULL, 207),
       ('Restaurant', 'Dinner Special', '1203', 18.00, 10.00, '2025-12-17', '17:09:02', '2173',140),
       ('Restaurant', 'Jack Daniels 2OZ', '92810', 14.50, 5.50, '2025-12-13', '20:09:21', '2173', 287),
       ('Restaurant', 'Burger Fries', '1929', 16.00, 8.00, '2025-12-12', '21:45:09', NULL, NULL);

INSERT INTO Hotel.Payment
VALUES (7362717273819, 101,'72637378', '7372 7272 8920 0918', 12.02, 892.20,910.22,150.00,150.00,'2025-12-15',904.44),
	   (9373717275310, 213,'82738129','8278 8171 9091 0987', 4.55,314.92,319.47,100.00,100.00,'2025-12-08',319.47),
       (1273678228819, 299,'01928380', '7263 6172 9201 8272',45.93,145.20,191.13,50.00,50.00,'2025-12-10',191.13),
       (9287465162838,207,'09172638', '8276 7278 9282 8228', 33.02, 278.12,311.14,100.00,100.00,'2025-12-08',311.14),
       (9374748838109, 150,'87738838', '8283 8281 0098 8793',NULL, 523.09,523.09,100.00,100.00,'2025-12-02',523.09),
       (1098273792838, 132,'91838399','1029 9292 9281 8238',125.02,1493.20,1618.22,350.00,350.00,'2025-12-10',1618.22),
       (0182717273783, 209,'82737372', '9283 8282 8282 8282',NULL,302.12,302.12,100.00,100.00,'2025-12-08',301.12),
       (9019298177374,121,'72781828', '8282 9228 9282 9292', 11.17,390.92,402.09,150.00,150.00,'2025-12-26',402.09),
       (0182737383737,287,'12938302', '9283 9100 5267 5143', 70.93,498.02,568.95,150.00,150.00,'2025-12-10',568.95),
	   (9187272019292,140,'01928374','1727 8273 8182 8900',90.04,312.92,402.96,100.00,100.00,'2025-12-29',402.96);

Select * from hotel.staff;      
Select * from hotel.rooms;  
SELECT * from hotel.Reservation;
SELECT * from hotel.Customer;
Select * from hotel.FoodKioskSales;  
Select * from hotel.Payment; 

SELECT COUNT(*) as Stays_More_Than_Two
FROM Hotel.Reservation
	WHERE Duration > 2;
    
SELECT C.Member_Tier as Tier, SUM(Final_Amount) as Total_Amount_Spent
FROM Hotel.Payment P
JOIN Hotel.Customer C on P.ID = C.ID
GROUP BY Member_Tier;

SELECT HOUR(Time_of_Purchase) as Hour_Sales, 
	   SUM(Item_Sale) as Cost
FROM Hotel.FoodKioskSales
GROUP BY Hour_Sales
ORDER BY Cost;

SELECT C.Customer_Name as Names,C.Points as Points, Sum(P.Food_Kiosk_Sale + P.Room_Cost) as Total_Amount_Spent
FROM Hotel.Reservation R
JOIN Hotel.Customer C 
on R.Confirmation_Num = C.Confirmation_Num
JOIN Hotel.Payment P
on C.ID = P.ID 
GROUP BY Names,Points
ORDER BY Total_Amount_Spent

