/*Create a new database called travel_booking */   
CREATE DATABASE travel_booking;  

/* Use the Database */  
USE travel_booking;  

/*Create a traveler table in travel_booking database*/  

CREATE TABLE Traveler  
( TravelerId int  PRIMARY KEY,   
Traveler_FName varchar(50) NOT NULL,   
Traveler_LName varchar(70) NOT NULL,  
PhoneNumber Varchar(10) NOT NULL,  
TravelerAddress Varchar(50),  
EmailAddress varchar(255) NOT NULL);  

--SELECT * FROM Traveler;

/*Create a Payment table in travel_booking database*/  

CREATE TABLE Payment(  
PaymentID INT PRIMARY KEY NOT NULL,  
Amount NUMERIC(9,2) DEFAULT 0.00 NOT NULL,  
PaymentMethod Varchar(50) NOT NULL 
);  

  
-- SELECT * FROM Payment;

/*Create a Booking table in travel_booking database*/  
CREATE TABLE Booking 
(  
BookingID INT PRIMARY KEY NOT NULL,  
TravelerID INT NOT NULL,  
BookingDate DATETIME NOT NULL,  
CancelDate DATETIME,  
TravelStartDate  DATETIME NOT NULL,  
TravelEndDate DATETIME NOT NULL,  
PaymentID INTEGER NOT NULL,  
Rating INTEGER NOT NULL,  
Review VARCHAR(255),  
FOREIGN KEY(TravelerID) REFERENCES Traveler,  
FOREIGN KEY(PaymentID) REFERENCES Payment
); 
-- SELECT * FROM Booking;

/*Create a table Location in travel_booking database*/  

CREATE TABLE Location(  
LocationID INT PRIMARY KEY NOT NULL,  
LocationName varchar(50),  
LocationAddress varchar(100),  
);  

-- SELECT * FROM Location;

/*Create a table Flight in travel_booking database*/  

CREATE TABLE Flight ( 
    FlightID INT PRIMARY KEY NOT NULL, 
    Carrier VARCHAR(50) NOT NULL, 
    DepartureLocation INT NOT NULL, 
    ArrivalLocation INT NOT NULL, 
    DepartureDate DATETIME NOT NULL, 
    ArrivalDate DATETIME NOT NULL, 
    CONSTRAINT FK_DepartureLocation FOREIGN KEY (DepartureLocation) REFERENCES Location(LocationID), 
    CONSTRAINT FK_ArrivalLocation FOREIGN KEY (ArrivalLocation) REFERENCES Location(LocationID) 
);

-- SELECT * FROM Flight;

  
/*Create a table Hotel in travel_booking database*/  

CREATE TABLE Hotel(  
    HotelID INT PRIMARY KEY NOT NULL,  
    HotelName VARCHAR(50) NOT NULL,  
    LocationID INT,   
    FOREIGN KEY (LocationID) REFERENCES Location(LocationID)  
);  


--SELECT * FROM Hotel;

/*Create a table Car in travel_booking database*/  

CREATE TABLE Car( 
    CarID INT PRIMARY KEY NOT NULL, 
    CarCoName VARCHAR(50), 
    CarType VARCHAR(50), 
    PickupLocation INT, 
    DropoffLocation INT, 
    FOREIGN KEY (PickupLocation) REFERENCES Location(LocationID), 
    FOREIGN KEY (DropoffLocation) REFERENCES Location(LocationID) 
) 

--SELECT * FROM Car;

/*Create a table Service in travel_booking database*/  

CREATE TABLE Service( 
    ServiceID INT PRIMARY KEY NOT NULL, 
    ServiceType VARCHAR(50), 
    SPrice NUMERIC(9,2) DEFAULT 0.00 NOT NULL, 
    LocationID INT, -- Assuming LocationID is a foreign key referencing the Location table 
    FOREIGN KEY (LocationID) REFERENCES Location(LocationID) 
     
); 

/* Create BookingFlight Table */ 

CREATE TABLE Booking_Flight ( 
    BookingID INT, 
    FlightID INT, 
    SeatNumber VARCHAR(10), 
    FPrice NUMERIC(9,2) DEFAULT 0.00 NOT NULL, 
    PRIMARY KEY (BookingID, FlightID), 
    FOREIGN KEY (BookingID) REFERENCES Booking(BookingID), 
    FOREIGN KEY (FlightID) REFERENCES Flight(FlightID) 
); 
 

--SELECT * FROM Booking_Flight;
-- Create BookingHotel Table 

CREATE TABLE BookingHotel ( 
    BookingID INT, 
    HotelID INT, 
    CheckInDate DATETIME, 
    CheckOutDate DATETIME, 
    RoomNo INT, 
    HPrice NUMERIC(9,2) DEFAULT 0.00 NOT NULL,
    PRIMARY KEY (BookingID, HotelID), 
    FOREIGN KEY (BookingID) REFERENCES Booking(BookingID), 
    FOREIGN KEY (HotelID) REFERENCES Hotel(HotelID) 
); 

  
--SELECT * FROM BookingHotel;
-- Create Table Booking_Car 

CREATE TABLE Booking_car ( 
  BookingID INT NOT NULL, 
  carID INT NOT NULL, 
  RentalPrice DECIMAL(10,2) NOT NULL, 
  PRIMARY KEY (BookingID, carID), 
  FOREIGN KEY (BookingID) REFERENCES Booking(BookingID), 
  FOREIGN KEY (carID) REFERENCES car(carID) 
); 

-- Create Booking_Services Table

CREATE TABLE Booking_Services ( 
  BookingID INT NOT NULL, 
  ServiceId INT NOT NULL, 
  PRIMARY KEY (BookingID, serviceId), 
  FOREIGN KEY (BookingID) REFERENCES Booking(BookingID), 
  FOREIGN KEY (serviceId) REFERENCES service(ServiceID) 
); 

--SELECT * FROM Booking_Services;

 -- Inserting data into the Traveler table 
 
INSERT INTO Traveler (TravelerId, Traveler_FName, Traveler_LName, PhoneNumber, TravelerAddress, EmailAddress) 
VALUES 
(1, 'Md Shohidul', 'Haque', '9725710096', '123 Main St', 'shohidul@gmail.com'), 
(2, 'Christian', 'Hiner', '9876543224', '456 Oak St', 'christian@email.com'), 
(3, 'Lenin chowdary', 'Koppula', '5678901234', '789 Pine St', 'lenin@email.com'), 
(4, 'Evan', 'Sayre', '3456789012', '234 Elm St', 'evan@email.com'), 
(5, 'Adam','Gilchrist','9723314563', '134 second street','adam@rocketmail.com'), 
(6, 'Lionel','Messi','4692436654','40425 Haymeadow Drive','lionel21@yahoo.com'), 
(7,'Shams','Haque','3464534423','134 walnut drive','bappi@yahoo.com'), 
(8,'Adam','Milne','4692341892','1097 park lane','milne123@icloud.com'), 
(9,'Imad ibne','shohidul','945443998','7225 Fair Oaks Ave','imadshohidul@gmail.com'), 
(10,'Badria','Mujib','4678979987','7886 Pineland drive','badria@hotmail.com') 

-- SELECT * FROM Traveler

  
-- Inserting data into the Payment table 

INSERT INTO Payment (PaymentID, Amount, PaymentMethod) 
VALUES 
(101, 500.00, 'Credit Card'), 
(102, 600.00, 'PayPal'), 
(103, 700.00, 'Debit Card'), 
(104, 800.00, 'ACH'), 
(105, 900.00, 'PaymentBanc'), 
(106, 1000.00, 'ScratchPay'), 
(107, 1100.00, 'Telecheck'), 
(108, 1200.00, 'Stripe'), 
(109, 1300.00, 'GooglePay'), 
(110, 1400.00, 'Cash'); 

-- SELECT * FROM Payment;

-- Inserting data into the Booking table 

INSERT INTO Booking (BookingID, TravelerID, BookingDate, CancelDate, TravelStartDate, TravelEndDate, PaymentID, Rating, Review) 
VALUES 
(1, 1, '2023-01-01', NULL , '2023-02-01', '2023-02-24', 101, 5, 'Excellent service'), 
(2, 2, '2023-02-01', NULL, '2023-03-01', '2023-03-24', 102, 4, 'Good experience'), 
(3, 3, '2023-03-01', '2023-03-24', '2023-04-01', '2023-04-24', 103, 3, 'Average service'), 
(4, 4, '2023-04-01', NULL , '2023-05-01', '2023-05-24', 104, 5, 'Amazing trip'), 
(5, 5, '2023-05-01', NULL , '2023-06-01', '2023-06-24', 105, 3, 'Average service'), 
(6, 6, '2023-01-02', NULL, '2023-02-01', '2023-02-24', 106, 5, 'Excellent service'), 
(7, 7, '2023-02-02', NULL, '2023-03-01', '2023-03-24', 107, 4, 'Good experience'), 
(8, 8, '2023-03-03', '2023-03-24', '2023-04-01', '2023-04-24', 108, 3, 'Average service'), 
(9, 9, '2023-04-04', '2023-04-24', '2023-05-01', '2023-05-24', 109, 5, 'Amazing trip'), 
(10, 10, '2023-05-05', NULL, '2023-06-01', '2023-06-24', 110, 3, 'Average service'); 


-- SELECT * FROM Booking;
  
  -- Inserting data into the Location table 


INSERT INTO Location (LocationID, LocationName, LocationAddress) 

VALUES 

(1, 'Austin, TX', '123 Main St'), 

(2, 'San Antonio, TX', '456 Oak St'), 

(3, 'New York City, NY ', '789 Pine St'), 

(4, 'Los Angeles, CA', '234 Elm St'), 

(5, 'London, UK ', '123 Main St'), 

(6, 'Tokyo, Japan', '456 Oak St'), 

(7, 'Beijing, China', '789 Pine St'), 

(8, 'Sydney Australia', '234 Elm St'), 

(9, 'Dubai, UAE', '123 Main St'), 

(10, 'Mumbai, India', '456 Oak St'), 

(11, 'Honolulu, Hawaii', '456 Oak St'); 

-- SELECT * FROM Location;

-- Inserting data into the Flight table 

INSERT INTO Flight (FlightID, Carrier, DepartureLocation, ArrivalLocation, DepartureDate, ArrivalDate) 

VALUES 

(1, 'Delta Airlines', 1, 2, '2023-02-01', '2023-02-02'), 

(2, 'United Airlines', 1, 3, '2023-03-01', '2023-03-02'), 

(3, 'Spirit Airlines', 1, 4, '2023-04-01', '2023-04-02'), 

(4, 'Southwest Airlines', 1, 5, '2023-05-01', '2023-05-02'), 

(5, 'American Airlines', 1, 6, '2023-06-01', '2023-06-02'), 

(6, 'Jet Blue', 1, 7, '2023-07-01', '2023-07-02'), 

(7, 'Allegiant Air', 1, 8, '2023-08-01', '2023-08-02'), 

(8, 'Alaska Airlines', 1, 9, '2023-09-01', '2023-09-02'), 

(9, 'Hawaiin Airlines', 1, 11, '2023-10-01', '2023-10-02'), 

(10, 'Republic Airways', 1, 10, '2023-11-01', '2023-11-02'); 


--SELECT * FROM Flight;

-- Inserting data into the Hotel table 

INSERT INTO Hotel (HotelID, HotelName, LocationID) 
VALUES 
(1, 'Hilton', 1), 
(2, 'Hilton', 2), 
(3, 'Hilton', 3), 
(4, 'Motel 6', 4), 
(5, 'Motel 6', 1), 
(6, 'Holiday Inn', 2), 
(7, 'Sheraton', 3), 
(8, 'Four Seasons', 4), 
(9, 'Holiday Inn', 1), 
(10, 'Marriott', 2); 

-- SELECT * FROM Hotel;

-- Inserting data into the Car table 

INSERT INTO Car (CarID, CarCoName, CarType, PickupLocation, DropoffLocation) 
VALUES 
(1, 'Hertz', 'Sedan', 1, 2), 
(2, 'Avis', 'SUV', 3, 4), 
(3, 'Thrifty', 'Convertible', 5, 6), 
(4, 'Budget', 'Van', 7, 8), 
(5, 'Hertz', 'Van', 1, 2), 
(6, 'Avis', 'Convertible', 3, 4), 
(7, 'Thrifty', 'Van', 5, 6), 
(8, 'Budget', 'Sedan', 7, 8), 
(9, 'Hertz', 'Economy', 1, 2), 
(10, 'Avis', 'Economy', 3, 4); 

-- SELECT * FROM Car;

-- Inserting data into the Service table 
 

INSERT INTO Service (ServiceID, ServiceType, SPrice, LocationID) 
VALUES 
(1, 'Tour Guide', 50.00, 1), 
(2, 'Airport Transfer', 25.00, 2), 
(3, 'City Tour', 30.00, 3), 
(4, 'Concierge', 20.00, 4), 
(5, 'Travel Insurance', 40.00, 5), 
(6, 'Car Rental Assistance', 35.00, 6), 
(7, 'Language Translation', 15.00, 7), 
(8, 'VIP Lounge Access', 60.00, 8), 
(9, 'Guided Hiking Tour', 45.00, 9), 
(10, 'Cruise Excursion', 75.00, 10); 

-- Inserting data into the BookingFlight table 

INSERT INTO Booking_Flight (BookingID, FlightID, SeatNumber, FPrice) 
VALUES 
(1, 1, 'A1', 200.00), 
(2, 2, 'B2', 250.00), 
(3, 3, 'C3', 300.00), 
(4, 4, 'D4', 350.00), 
(5, 5, 'A1', 200.00), 
(6, 6, 'B2', 250.00), 
(7, 7, 'C3', 300.00), 
(8, 8, 'D4', 350.00), 
(9, 9, 'A1', 200.00), 
(10, 10, 'B2', 250.00); 

-- Inserting data into the BookingHotel table 
 
INSERT INTO BookingHotel (BookingID, HotelID, CheckInDate, CheckOutDate, RoomNo) 
VALUES 
(1, 1, '2023-02-01', '2023-02-24', 101), 
(2, 2, '2023-03-01', '2023-03-24', 102), 
(3, 3, '2023-04-01', '2023-04-24', 103), 
(4, 4, '2023-05-01', '2023-05-24', 104), 
(5, 5, '2023-06-01', '2023-06-07', 105), 
(6, 6, '2023-07-05', '2023-07-09', 106), 
(7, 7, '2023-08-04', '2023-08-07', 107), 
(8, 8, '2023-09-03', '2023-09-07', 108), 
(9, 9, '2023-10-20', '2023-10-23', 109), 
(10, 10, '2023-11-15', '2023-11-22', 110); 

-- Inserting data into the Booking_car table 

INSERT INTO Booking_car (BookingID, CarID, RentalPrice) 
VALUES 
(1, 1, 50.00), 
(2, 2, 60.00), 
(3, 3, 70.00), 
(4, 4, 80.00), 
(5,5, 93.00), 
(6,6, 99.00), 
(7,7, 75.00), 
(8,8, 199.00), 
(9,9, 119.00), 
(10,10, 130.00); 

-- Inserting data into the Booking_Services table 

INSERT INTO Booking_Services (BookingID, ServiceId) 
VALUES 
(1, 1), 
(2, 2), 
(3, 3), 
(4, 4), 
(5,5), 
(6,6), 
(7,7), 
(8,8), 
(9,9), 
(10,10); 

/* Query 1:  List all rental cars under $100. */
Select BookingID, CarID, RentalPrice  
From Booking_car  
Where RentalPrice < 100 
Order by RentalPrice asc; 

/* Query 2: How many travelers have a last name that begins with “M”? */

Select TravelerId, Traveler_FName, Traveler_LName, PhoneNumber, TravelerAddress, EmailAddress From Traveler   

Where Traveler_LName like 'M%'  

Order by Traveler_LName asc; 

/* Query 3: What services cost between $50 and 100?  */

Select ServiceId, Servicetype, SPrice  

From Service  

Where SPrice  >= 50 AND SPrice <= 100  

Order by Sprice asc; 

/* Query 4:  select all flight in 1st February 23 and 1st April 23 */
SELECT * FROM Flight
WHERE DepartureDate IN ('2023-02-01 00:00:00.000','2023-04-01 00:00:00.000');




/*Query 5: Find the total amount spent by each traveler.*/

SELECT Traveler.TravelerId, Traveler.Traveler_FName, Traveler.Traveler_LName, SUM(Payment.Amount) AS TotalAmount
FROM Traveler
Inner JOIN Booking ON Traveler.TravelerId = Booking.TravelerID
Inner JOIN Payment ON Booking.PaymentID = Payment.PaymentID
GROUP BY Traveler.TravelerId, Traveler.Traveler_FName, Traveler.Traveler_LName;

/*Query 6: Find the average rating for each hotel.*/

SELECT Hotel.HotelID, Hotel.HotelName, AVG(Booking.Rating) AS AvgRating
FROM Hotel
LEFT JOIN BookingHotel ON Hotel.HotelID = BookingHotel.HotelID
LEFT JOIN Booking ON BookingHotel.BookingID = Booking.BookingID
GROUP BY Hotel.HotelID, Hotel.HotelName;

/*Query 7: Retrieve all services booked for a specific traveler.*/

SELECT Traveler.Traveler_FName, Traveler.Traveler_LName, Service.*
FROM Traveler
INNER JOIN Booking ON Traveler.TravelerId = Booking.TravelerID
INNER JOIN Booking_Services ON Booking.BookingID = Booking_Services.BookingID
INNER JOIN Service ON Booking_Services.ServiceId = Service.ServiceID
WHERE Traveler.Traveler_FName = 'Adam' AND Traveler.Traveler_LName = 'Gilchrist';

/*Query 8: Retrieve the details of all flights with their departure and arrival locations.*/
SELECT Flight.*, DepartureLocation.LocationName AS DepartureLocationName, ArrivalLocation.LocationName AS ArrivalLocationName
FROM Flight
INNER JOIN Location AS DepartureLocation ON Flight.DepartureLocation = DepartureLocation.LocationID
INNER JOIN Location AS ArrivalLocation ON Flight.ArrivalLocation = ArrivalLocation.LocationID;



