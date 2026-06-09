
Markdown
 SGR Ticket Booking System

 Project Overview
SGR Ticket Booking System is a web-based application developed to help passengers book train tickets online, view their bookings, and retrieve tickets using a booking reference number.

 Features
- User Registration
- User Login
- Train Schedule Viewing
- Ticket Booking
- Booking Reference Generation
- Ticket Retrieval Using Booking Reference
- Admin Management
- Passenger Information Management

Technologies Used
- HTML
- CSS
- JavaScript
- PHP
- MySQL
- XAMPP
- Visual Studio Code

System Requirements
- XAMPP (Apache and MySQL)
- Web Browser
- PHP 8.0 or above
- MySQL Database
 Installation Guide

Step 1: Clone the Repository
```bash
git clone https://github.com/yourusername/sgr-ticket-booking-system.git
Step 2: Move Project Files
Copy the project folder into the htdocs directory of XAMPP.
Step 3: Start XAMPP
Start:
Apache
MySQL
Step 4: Create Database
Create a database named:
SQL
sgr_ticket_system
Import the provided SQL file into the database.
Step 5: Configure Database Connection
Update database settings in the connection file:
PHP
$conn = mysqli_connect("localhost", "root", "", "sgr_ticket_system");
Step 6: Run the Project
Open your browser and visit:

http://localhost/sgr-ticket-booking-system
Usage
Register a new account.
Login to the system.
View available train schedules.
Book a ticket.
Receive a booking reference.
Use the booking reference to view ticket details.
Future Improvements
Online Payment Integration
SMS Notifications
Email Ticket Delivery
QR Code Ticket Verification
Author
Boniphace Marwa Mwita
License
This project was developed for academic purposes at Mzumbe University.


