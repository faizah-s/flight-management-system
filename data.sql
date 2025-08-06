-- Add a constraint to ensure that the ArrivalTime is after the DepartureTime in the Flight table
ALTER TABLE Flight
ADD CONSTRAINT CK_ArrivalTime CHECK (ArrivalTime > DepartureTime);

-- Modify the name column in the airport table to have a maximum length of 95 characters
ALTER TABLE airport
MODIFY name VARCHAR(95);

-- Insert multiple customer records into the Customer table
INSERT INTO Customer (CustomerID, FullName, Email, Phone, PassportNumber) VALUES 
(1, 'John Doe', NULL, '555-9821', 'P987654321'),
(2, 'Jane Smith', 'jane.smith@gmail.com', '555-1342', 'P123456789'),
(3, 'Mike Johnson', 'mike.johnson@gmail.com', '555-2394', 'P543210987'), 
(4, 'Emily Davis', NULL, '555-9876', 'P654321012'),
(5, 'Ali Brown', 'ali.brown@gmail.com', '555-4712', 'P876543210'),
(6, 'Linda White', NULL, '555-6235', 'P567890123'),
(7, 'David Taylor', 'david.taylor@gmail.com', '555-7598', 'P234567890'), 
(8, 'Susan Moore', 'susan.moore@gmail.com', '555-8510', 'P345678901'), 
(9, 'James Harris', NULL, '555-4723', 'P210987654'),
(10, 'Maryam Martin', 'maryam.martin@gmail.com', '555-5921', 'P123890765'), 
(11, 'Robert Thompson', 'robert.thompson@gmail.com', '555-3467', 'P678901234'), 
(12, 'Patricia Garcia', NULL, '555-8674', 'P234567321'),
(13, 'Charles Martinez', 'charles.martinez@gmail.com', '555-7198', 'P876543321'), 
(14, 'Barbara Robinson', 'barbara.robinson@gmail.com', '555-6245', 'P345987654'), 
(15, 'Thomas Clark', 'thomas.clark@gmail.com', '555-8709', 'P567890432'),
(16, 'Jessica Rodriguez', NULL, '555-7364', 'P234890765'),
(17, 'Christopher Lewis', 'christopher.lewis@gmail.com', '555-8246', 'P678903456'), 
(18, 'Sarah Hall', 'sarah.hall@gmail.com', '555-5142', 'P987654567'),
(19, 'Daniel Walker', NULL, '555-3948', 'P432109876'),
(20, 'Nancy Hall', 'nancy.hall@gmail.com', '555-2765', 'P123456432');

-- Select all customers from the customer table in the flight_booking_management_system schema
SELECT * FROM flight_booking_management_system.customer;

-- Insert airport data into the Airport table
INSERT INTO Airport (AirportID, Name, City, Country) VALUES
(1, 'Melbourne Airport', 'Melbourne', 'Australia'),
(2, 'Gaza International Airport', 'Gaza', 'Palestine'),
(3, 'King Khalid International Airport', 'Riyadh', 'Saudi Arabia'),
(4, 'Esenboğa Airport', 'Ankara', 'Turkey'),
(5, 'Prince Mohammad bin Abdulaziz International Airport', 'Medina', 'Saudi Arabia'), 
(6, 'Perth Airport', 'Perth', 'Australia'),
(7, 'Rafah International Airport', 'Rafah', 'Palestine'),
(8, 'Adana Şakirpaşa Airport', 'Adana', 'Turkey'),
(9, 'Adelaide Airport', 'Adelaide', 'Australia'),
(10, 'Abha International Airport', 'Abha', 'Saudi Arabia'),
(11, 'Istanbul Airport', 'Istanbul', 'Turkey'),
(12, 'Brisbane Airport', 'Brisbane', 'Australia'),
(13, 'King Abdulaziz International Airport', 'Jeddah', 'Saudi Arabia'),
(14, 'Sabiha Gökçen International Airport', 'Istanbul', 'Turkey'),
(15, 'Sydney Kingsford Smith Airport', 'Sydney', 'Australia');

-- Select all airports from the airport table in the flight_booking_management_system schema
SELECT * FROM flight_booking_management_system. airport;

-- Insert multiple flight records with details like flight number, airport IDs, and times
INSERT INTO Flight (FlightID, FlightNumber, DepartureAirportID, ArrivalAirportID, DepartureTime, ArrivalTime) VALUES
(1, 'AU1001', 1, 3, '2025-05-15 06:20:00', '2025-05-15 14:10:00'),
(2, 'TK1002', 4, 11, '2025-06-03 13:30:00', '2025-06-03 16:00:00'),
(3, 'SA1003', 13, 6, '2025-05-20 22:10:00', '2025-05-21 06:45:00'),
(4, 'PL1004', 2, 5, '2025-06-01 09:00:00', '2025-06-01 14:25:00'),
(5, 'AU1005', 9, 10, '2025-06-10 18:00:00', '2025-06-11 01:30:00'),
(6, 'TK1006', 14, 8, '2025-05-28 07:40:00', '2025-05-28 10:00:00'),
(7, 'SA1007', 5, 12, '2025-05-30 11:00:00', '2025-05-30 19:15:00'),
(8, 'PL1008', 7, 13, '2025-06-05 04:30:00', '2025-06-05 09:55:00'),
(9, 'AU1009', 15, 4, '2025-06-02 15:50:00', '2025-06-02 21:20:00'),
(10, 'TK1010', 11, 1, '2025-06-08 17:10:00', '2025-06-09 00:05:00'),
(11, 'SA1011', 3, 9, '2025-05-25 08:15:00', '2025-05-25 14:20:00'),
(12, 'AU1012', 6, 2, '2025-06-04 23:10:00', '2025-06-05 05:35:00'),
(13, 'TK1013', 8, 14, '2025-06-06 10:00:00', '2025-06-06 12:45:00'),
(14, 'PL1014', 2, 7, '2025-05-26 06:30:00', '2025-05-26 07:20:00'),
(15, 'SA1015', 10, 15, '2025-06-09 20:30:00', '2025-06-10 04:00:00');

-- Select all flight records from the flight table in the booking_management_system schema
SELECT * FROM booking_management_system.flight;

-- Insert seat data for each flight with availability status
INSERT INTO Seats (FlightID, SeatNumber, IsAvailable) VALUES
(1, 'A1', true), (1, 'B2', false), (1, 'C3', true), (1, 'D4', true), (1, 'E5', true),
(1, 'F6', true), (1, 'G7', true), (1, 'H8', true), (1, 'I9', false), (1, 'J10', true),
(2, 'A1', true), (2, 'B2', false), (2, 'C3', true), (2, 'D4', true), (2, 'E5', true),
(2, 'F6', true), (2, 'G7', true), (2, 'H8', false), (2, 'I9', false), (2, 'J10', true),
(3, 'A1', true), (3, 'B2', true), (3, 'C3', true), (3, 'D4', true), (3, 'E5', true),
(3, 'F6', false), (3, 'G7', true), (3, 'H8', true), (3, 'I9', true), (3, 'J10', true),
(4, 'A1', true), (4, 'B2', false), (4, 'C3', true), (4, 'D4', true), (4, 'E5', false),
(4, 'F6', true), (4, 'G7', true), (4, 'H8', true), (4, 'I9', false), (4, 'J10', true),
(5, 'A1', true), (5, 'B2', true), (5, 'C3', true), (5, 'D4', true), (5, 'E5', true),
(5, 'F6', true), (5, 'G7', true), (5, 'H8', false), (5, 'I9', true), (5, 'J10', true),
(6, 'A1', false), (6, 'B2', true), (6, 'C3', true), (6, 'D4', true), (6, 'E5', true),
(6, 'F6', true), (6, 'G7', false), (6, 'H8', true), (6, 'I9', false), (6, 'J10', false),
(7, 'A1', true), (7, 'B2', true), (7, 'C3', true), (7, 'D4', true), (7, 'E5', true),
(7, 'F6', true), (7, 'G7', true), (7, 'H8', true), (7, 'I9', false), (7, 'J10', true),
(8, 'A1', true), (8, 'B2', true), (8, 'C3', true), (8, 'D4', true), (8, 'E5', true),
(8, 'F6', true), (8, 'G7', true), (8, 'H8', true), (8, 'I9', true), (8, 'J10', true),
(9, 'A1', true), (9, 'B2', true), (9, 'C3', true), (9, 'D4', true), (9, 'E5', true),
(9, 'F6', true), (9, 'G7', true), (9, 'H8', true), (9, 'I9', true), (9, 'J10', true),
(10, 'A1', true), (10, 'B2', true), (10, 'C3', true), (10, 'D4', true), (10, 'E5', true),
(10, 'F6', true), (10, 'G7', true), (10, 'H8', true), (10, 'I9', true), (10, 'J10', true),
(11, 'A1', true), (11, 'B2', true), (11, 'C3', true), (11, 'D4', true), (11, 'E5', true),
(11, 'F6', true), (11, 'G7', true), (11, 'H8', true), (11, 'I9', true), (11, 'J10', true),
(12, 'A1', true), (12, 'B2', true), (12, 'C3', true), (12, 'D4', true), (12, 'E5', true),
(12, 'F6', true), (12, 'G7', false), (12, 'H8', false), (12, 'I9', false), (12, 'J10', true),
(13, 'A1', true), (13, 'B2', true), (13, 'C3', true), (13, 'D4', true), (13, 'E5', true),
(13, 'F6', false), (13, 'G7', false), (13, 'H8', true), (13, 'I9', true), (13, 'J10', false),
(14, 'A1', true), (14, 'B2', true), (14, 'C3', true), (14, 'D4', false), (14, 'E5', true),
(14, 'F6', true), (14, 'G7', false), (14, 'H8', true), (14, 'I9', true), (14, 'J10', false),
(15, 'A1', false), (15, 'B2', true), (15, 'C3', true), (15, 'D4', true), (15, 'E5', true),
(15, 'F6', true), (15, 'G7', true), (15, 'H8', true), (15, 'I9', true), (15, 'J10', true);

-- Select only unavailable (false) seats from the Seats table
SELECT * FROM SEATS
WHERE isavailable = 0;

-- Insert booking records linking customers to flights and seat numbers
INSERT INTO Booking (BookingID, CustomerID, FlightID, SeatNumber, BookingDate) VALUES
(1, 4, 1, 'B2', '2025-05-01 08:30:00'),
(2, 17, 1, 'I9', '2025-05-01 10:15:00'),
(3, 9, 2, 'B2', '2025-05-01 12:30:00'),
(4, 3, 2, 'H8', '2025-05-02 06:45:00'),
(5, 12, 2, 'I9', '2025-05-02 09:00:00'),
(6, 19, 3, 'F6', '2025-05-02 11:00:00'),
(7, 5, 4, 'B2', '2025-05-03 07:30:00'),
(8, 13, 4, 'E5', '2025-05-03 09:15:00'),
(9, 8, 4, 'I9', '2025-05-03 12:00:00'),
(10, 14, 5, 'H8', '2025-05-03 14:15:00'),
(11, 6, 6, 'A1', '2025-05-04 06:30:00'),
(12, 1, 6, 'G7', '2025-05-04 08:00:00'),
(13, 16, 6, 'I9', '2025-05-04 09:45:00'),
(14, 18, 6, 'J10', '2025-05-04 11:00:00'),
(15, 11, 7, 'I9', '2025-05-04 13:30:00'),
(16, 2, 12, 'G7', '2025-05-05 06:45:00'),
(17, 10, 12, 'H8', '2025-05-05 08:15:00'),
(18, 20, 12, 'I9', '2025-05-05 10:30:00'),
(19, 15, 13, 'F6', '2025-05-05 12:45:00'),
(20, 7, 13, 'G7', '2025-05-06 07:30:00'),
(21, 4, 13, 'J10', '2025-05-06 09:00:00'),
(22, 13, 14, 'D4', '2025-05-06 10:15:00'),
(23, 19, 14, 'G7', '2025-05-06 11:30:00');

-- Select all bookings from the booking table
SELECT * FROM flight_booking_management_system.booking;

-- Insert payment records for bookings
-- NULL values for Amount and PaymentDate indicate payment not yet made
INSERT INTO Payment (PaymentID, BookingID, Amount, PaymentDate) VALUES
(1, 1, 150.00, '2025-05-01 08:45:00'),
(2, 2, 200.00, '2025-05-01 10:30:00'),
(3, 3, NULL, NULL),
(4, 4, 220.00, '2025-05-02 07:00:00'),
(5, 5, NULL, NULL),
(6, 6, 230.00, '2025-05-02 11:30:00'),
(7, 7, 210.00, '2025-05-03 08:00:00'),
(8, 8, NULL, NULL),
(9, 9, 240.00, '2025-05-03 12:00:00'),
(10, 10, 260.00, '2025-05-03 14:30:00'),
(11, 11, 175.00, '2025-05-04 07:30:00'),
(12, 12, 210.00, '2025-05-04 09:00:00'),
(13, 13, NULL, NULL),
(14, 14, 200.00, '2025-05-04 12:00:00'),
(15, 15, 190.00, '2025-05-04 13:30:00'),
(16, 16, 180.00, '2025-05-05 06:30:00'),
(17, 17, 240.00, '2025-05-05 08:00:00'),
(18, 18, 250.00, '2025-05-05 09:30:00'),
(19, 19, NULL, NULL),
(20, 20, 215.00, '2025-05-06 07:00:00'),
(21, 21, 225.00, '2025-05-06 08:30:00'),
(22, 22, NULL, NULL),
(23, 23, 245.00, '2025-05-06 11:30:00');

-- Select all payment records from the payment table
SELECT * FROM flight_booking_management_system.payment;
