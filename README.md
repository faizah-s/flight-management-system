# Flight Management System

## Project Overview  
This project implements a Flight Management System database designed to manage key aspects of airline operations, including customers, airports, flights, seat availability, bookings, and payments. The database schema and queries are designed and tested using MySQL.

## Database Schema  
The database consists of the following tables:  

- **Customer**: Stores customer details (ID, full name, email, phone, passport number).  
- **Airport**: Contains information about airports (ID, name, city, country).  
- **Flight**: Holds flight details including flight number, departure and arrival airports, and schedule.  
- **Seats**: Tracks seat availability per flight.  
- **Booking**: Records flight bookings made by customers, linking customers, flights, and seats.  
- **Payment**: Manages payments for bookings with validation on positive amounts.

## Features  
- Enforces data integrity with primary keys, foreign keys, and unique constraints.  
- Supports booking management and seat availability tracking.  
- Handles payments associated with bookings.

## Usage  
1. Run the provided SQL scripts to create tables and insert sample data.  
2. Use SQL queries to manage flights, customers, bookings, and payments.  
3. Extend or modify the schema as needed for additional features.

## Files  
- `sql/` — Contains all SQL scripts for schema creation, data insertion, and queries.  
- `docs/` — Contains the PDF document which includes the ERD (Entity Relationship Diagram), all SQL queries, and their output results.
