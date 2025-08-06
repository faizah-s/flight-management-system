-- 1. Retrieves customer names, payment amounts, service fee (+5), and total with 10% tax added
SELECT
    c.FullName,
    p.Amount,
    (p.Amount + 5) AS ServiceFee,
    (p.Amount * 1.1) AS TotalWithTax
FROM Customer c
JOIN Booking b
    ON c.CustomerID = b.CustomerID
JOIN Payment p
    ON b.BookingID = p.BookingID;

-- 2. Retrieves flight number, departure and arrival times, and flight duration in hours
SELECT
    FlightNumber,
    DepartureTime,
    ArrivalTime,
    TIMESTAMPDIFF(HOUR, DepartureTime, ArrivalTime) AS DurationHours
FROM Flight;

-- 3. Retrieves customer name, contact info (phone and email), and arrival country for customers with an email
SELECT
    c.FullName,
    CONCAT('Contact: ', c.Phone, ' | Email: ', c.Email) AS ContactInfo,
    a.Country AS ArrivalCountry
FROM Customer c
JOIN Booking b ON c.CustomerID = b.CustomerID
JOIN Flight f ON b.FlightID = f.FlightID
JOIN Airport a ON f.ArrivalAirportID = a.AirportID
WHERE c.Email IS NOT NULL;

-- 4. Retrieves distinct arrival countries from bookings via flights and airports
SELECT DISTINCT
    a.Country AS ArrivalCountry
FROM Booking b
JOIN Flight f ON b.FlightID = f.FlightID
JOIN Airport a ON f.ArrivalAirportID = a.AirportID;

-- 5. Retrieves flight details with duration, filtering flights arriving after 5 PM and lasting over 1 hour
SELECT 
    f.FlightNumber, 
    f.DepartureTime, 
    f.ArrivalTime,
    TIMESTAMPDIFF(HOUR, f.DepartureTime, f.ArrivalTime) AS FlightDuration
FROM Flight f
JOIN Airport a1 ON f.DepartureAirportID = a1.AirportID
JOIN Airport a2 ON f.ArrivalAirportID = a2.AirportID
WHERE
    TIME(f.ArrivalTime) > '17:00:00'
    AND TIMESTAMPDIFF(HOUR, f.DepartureTime, f.ArrivalTime) > 1;

-- 6. Retrieves customers with phone or email matching a pattern and name matching a pattern 
SELECT FullName, Phone, Email
FROM Customer
WHERE (Phone LIKE '%71%' OR Email LIKE '%n@%')
  AND FullName LIKE '%A%';

-- 7. Retrieves flight details and duration for flights longer than 1 hour and with arrival time after a specific time 
SELECT 
    f.FlightNumber, 
    f.DepartureTime, 
    f.ArrivalTime,
    TIMESTAMPDIFF(HOUR, f.DepartureTime, f.ArrivalTime) AS FlightDuration
FROM Flight f
JOIN Airport a1 ON f.DepartureAirportID = a1.AirportID
JOIN Airport a2 ON f.ArrivalAirportID = a2.AirportID
WHERE
    TIME(f.ArrivalTime) > '17:00:00'
    AND TIMESTAMPDIFF(HOUR, f.DepartureTime, f.ArrivalTime) > 1;

-- 8. Retrieves customer and booking details for customers with ID > 10 and either high payment or booking ID, ordered by amount
SELECT 
    c.FullName, 
    c.CustomerID, 
    b.BookingID, 
    p.Amount
FROM Customer c
JOIN Booking b ON c.CustomerID = b.CustomerID
JOIN Payment p ON b.BookingID = p.BookingID
WHERE c.CustomerID > 10
  AND (p.Amount > 200 OR b.BookingID > 20)
ORDER BY p.Amount DESC;

-- 9. Retrieves customer, booking, and payment info (if available), ordered by customer ID
SELECT 
    c.CustomerID, 
    c.FullName, 
    b.BookingID, 
    p.Amount
FROM Customer c
JOIN Booking b ON c.CustomerID = b.CustomerID
LEFT JOIN Payment p ON b.BookingID = p.BookingID
ORDER BY c.CustomerID;

-- 10. Retrieves each customer’s total bookings and date of their latest booking
SELECT 
    c.CustomerID,
    c.FullName,
    COUNT(b.BookingID) AS TotalBookings,
    MAX(b.BookingDate) AS LastBookingDate
FROM Customer c
LEFT JOIN Booking b ON c.CustomerID = b.CustomerID
GROUP BY c.CustomerID, c.FullName;

-- 11. Retrieves seat numbers with corresponding customer info for booked (unavailable) seats
SELECT 
    s.SeatNumber, 
    c.CustomerID, 
    c.FullName
FROM Seats s
JOIN Flight f ON s.FlightID = f.FlightID
JOIN Booking b ON s.FlightID = b.FlightID AND s.SeatNumber = b.SeatNumber
JOIN Customer c ON b.CustomerID = c.CustomerID
WHERE s.IsAvailable = FALSE;

-- 12. Retrieves customer's name, name start, email length, and position of '@' for those with valid emails, ordered by ID
SELECT 
    c.FullName,
    SUBSTR(c.FullName, 1, 3) AS NameStart,
    LENGTH(c.Email) AS EmailLength,
    INSTR(c.Email, '@') AS AtSymbolPos
FROM Customer c
INNER JOIN Booking b ON c.CustomerID = b.CustomerID
INNER JOIN Flight f ON b.FlightID = f.FlightID
WHERE INSTR(c.Email, '@') > 0
ORDER BY c.CustomerID;

-- 13. Retrieves flights that have more than 8 available seats
SELECT 
    f.FlightID, 
    f.FlightNumber
FROM Flight f
JOIN Seats s ON f.FlightID = s.FlightID
GROUP BY f.FlightID
HAVING SUM(s.IsAvailable = TRUE) > 8;

-- 14. Retrieves customers who have never made a booking
SELECT 
    c.CustomerID, 
    c.FullName
FROM Customer c
LEFT JOIN Booking b ON c.CustomerID = b.CustomerID
WHERE b.BookingID IS NULL;

-- 15. Retrieves booking and payment details for customer with ID 5
SELECT 
    c.FullName, 
    f.FlightNumber, 
    b.BookingID, 
    p.PaymentID, 
    p.Amount, 
    p.PaymentDate
FROM Customer c
JOIN Booking b ON c.CustomerID = b.CustomerID
JOIN Flight f ON b.FlightID = f.FlightID
LEFT JOIN Payment p ON b.BookingID = p.BookingID
WHERE c.CustomerID = 5;

-- 16. Retrieves each customer's destination countries, grouped by customer and country, ordered by country and customer ID
SELECT 
    c.CustomerID, 
    c.FullName, 
    a.Country AS DestinationCountry
FROM Customer c
JOIN Booking b ON c.CustomerID = b.CustomerID
JOIN Flight f ON b.FlightID = f.FlightID
JOIN Airport a ON f.ArrivalAirportID = a.AirportID
GROUP BY c.CustomerID, a.Country
ORDER BY a.Country, c.CustomerID;

-- 17. Retrieves each customer's destination countries, grouped and ordered by country and customer ID
SELECT 
    c.CustomerID, 
    c.FullName, 
    a.Country AS DestinationCountry
FROM Customer c
JOIN Booking b ON c.CustomerID = b.CustomerID
JOIN Flight f ON b.FlightID = f.FlightID
JOIN Airport a ON f.ArrivalAirportID = a.AirportID
GROUP BY c.CustomerID, a.Country
ORDER BY a.Country, c.CustomerID;

-- 18. Retrieves flights with the count of available seats for each flight
SELECT 
    f.FlightID, 
    f.FlightNumber, 
    COUNT(s.SeatNumber) AS AvailableSeats
FROM Flight f
JOIN Seats s ON f.FlightID = s.FlightID
WHERE s.IsAvailable = TRUE
GROUP BY f.FlightID;

-- 19. Retrieves the customer with the highest number of bookings along with their total payments
SELECT 
    c.CustomerID, 
    c.FullName,
    COUNT(b.BookingID) AS TotalBookings,
    (SELECT SUM(p.Amount)
     FROM Payment p
     JOIN Booking b2 ON p.BookingID = b2.BookingID
     WHERE b2.CustomerID = c.CustomerID) AS TotalPayments
FROM Customer c
JOIN Booking b ON c.CustomerID = b.CustomerID
GROUP BY c.CustomerID, c.FullName
ORDER BY TotalBookings DESC
LIMIT 1;
