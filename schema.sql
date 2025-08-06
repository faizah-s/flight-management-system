-- Table to store customer details
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    FullName VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(20) UNIQUE NOT NULL,
    PassportNumber VARCHAR(20) UNIQUE NOT NULL
);

-- Table to store airport information
CREATE TABLE Airport (
    AirportID INT PRIMARY KEY,
    Name VARCHAR(100),
    City VARCHAR(50),
    Country VARCHAR(50)
);

-- Table to store flight details
CREATE TABLE Flight (
    FlightID INT PRIMARY KEY,
    FlightNumber VARCHAR(10) UNIQUE,
    DepartureAirportID INT,
    ArrivalAirportID INT,
    DepartureTime DATETIME,
    ArrivalTime DATETIME,
    CONSTRAINT FK_DeparutureAirport FOREIGN KEY (DepartureAirportID) REFERENCES Airport(AirportID),
    CONSTRAINT FK_ArrivalAirport FOREIGN KEY (ArrivalAirportID) REFERENCES Airport(AirportID)
);

-- Table to store seat availability for each flight
CREATE TABLE Seats (
    FlightID INT,
    SeatNumber VARCHAR(10),
    IsAvailable BOOLEAN DEFAULT TRUE,
    CONSTRAINT FK_SeatFlight FOREIGN KEY (FlightID) REFERENCES Flight(FlightID),
    CONSTRAINT PK_Seat PRIMARY KEY (FlightID, SeatNumber)
);

-- Table to store bookings made by customers
CREATE TABLE Booking (
    BookingID INT PRIMARY KEY,
    CustomerID INT,
    FlightID INT,
    SeatNumber VARCHAR(10),
    BookingDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT FK_BookingCustomer FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    CONSTRAINT FK_BookingFlight FOREIGN KEY (FlightID) REFERENCES Flight(FlightID),
    CONSTRAINT FK_BookingSeat FOREIGN KEY (FlightID, SeatNumber) REFERENCES Seats(FlightID, SeatNumber)
);

-- Table to store payments for bookings
CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY,
    BookingID INT,
    Amount DECIMAL(10,2),
    PaymentDate DATETIME,
    CONSTRAINT FK_PaymentBooking FOREIGN KEY (BookingID) REFERENCES Booking(BookingID),
    CONSTRAINT CK_PositiveAmount CHECK (Amount > 0)
);
