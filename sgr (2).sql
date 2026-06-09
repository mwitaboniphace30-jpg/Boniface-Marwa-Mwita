-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 08, 2026 at 12:41 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sgr`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `admin_id` int(10) UNSIGNED NOT NULL,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `last_login` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`admin_id`, `username`, `password_hash`, `last_login`) VALUES
(1, 'admin', '$2y$10$XexampleHashHerePleaseGenerateWithPHP', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `booking_id` int(10) UNSIGNED NOT NULL,
  `pnr` varchar(10) NOT NULL,
  `schedule_id` int(10) UNSIGNED NOT NULL,
  `passenger_id` int(10) UNSIGNED NOT NULL,
  `num_adults` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `num_children` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `total_price` decimal(10,2) NOT NULL,
  `booking_date` datetime DEFAULT current_timestamp(),
  `status` enum('confirmed','cancelled','pending') NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`booking_id`, `pnr`, `schedule_id`, `passenger_id`, `num_adults`, `num_children`, `total_price`, `booking_date`, `status`) VALUES
(1, 'SGR-00001', 1, 1, 2, 1, 62500.00, '2026-06-08 11:14:47', 'confirmed');

-- --------------------------------------------------------

--
-- Table structure for table `passengers`
--

CREATE TABLE `passengers` (
  `passenger_id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(120) NOT NULL,
  `email` varchar(150) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `passengers`
--

INSERT INTO `passengers` (`passenger_id`, `full_name`, `email`, `phone`, `created_at`) VALUES
(1, 'John Mwita', 'john@example.com', '+255700000001', '2026-06-08 08:13:38');

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `schedule_id` int(10) UNSIGNED NOT NULL,
  `train_id` int(10) UNSIGNED NOT NULL,
  `from_station_id` int(10) UNSIGNED NOT NULL,
  `to_station_id` int(10) UNSIGNED NOT NULL,
  `travel_date` date NOT NULL,
  `departure_time` time NOT NULL,
  `arrival_time` time NOT NULL,
  `class` enum('economy','first_class') NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `seats_available` smallint(6) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `schedules`
--

INSERT INTO `schedules` (`schedule_id`, `train_id`, `from_station_id`, `to_station_id`, `travel_date`, `departure_time`, `arrival_time`, `class`, `price`, `seats_available`, `updated_at`) VALUES
(1, 1, 1, 3, '2026-05-10', '07:00:00', '13:30:00', 'economy', 25000.00, 120, '2026-06-08 08:09:24'),
(2, 1, 1, 3, '2026-05-10', '07:00:00', '13:30:00', 'first_class', 55000.00, 30, '2026-06-08 08:09:24'),
(3, 1, 3, 1, '2026-05-10', '14:00:00', '20:30:00', 'economy', 25000.00, 100, '2026-06-08 08:09:24'),
(4, 2, 2, 4, '2026-05-11', '06:00:00', '18:00:00', 'economy', 40000.00, 80, '2026-06-08 08:09:24');

-- --------------------------------------------------------

--
-- Table structure for table `stations`
--

CREATE TABLE `stations` (
  `station_id` int(5) NOT NULL,
  `station name` int(80) NOT NULL,
  `city` int(70) NOT NULL,
  `created at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `ticket_id` int(10) UNSIGNED NOT NULL,
  `booking_id` int(10) UNSIGNED NOT NULL,
  `seat_number` varchar(10) DEFAULT NULL,
  `passenger_name` varchar(120) NOT NULL,
  `passenger_type` enum('adult','child') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`ticket_id`, `booking_id`, `seat_number`, `passenger_name`, `passenger_type`) VALUES
(1, 1, 'A01', 'John Mwita', 'adult'),
(2, 1, 'A02', 'Mary Mwita', 'adult'),
(3, 1, 'A03', 'Tom Mwita', 'child');

-- --------------------------------------------------------

--
-- Table structure for table `trains`
--

CREATE TABLE `trains` (
  `train_id` int(10) UNSIGNED NOT NULL,
  `train_name` varchar(100) NOT NULL,
  `total_seats_economy` smallint(6) NOT NULL DEFAULT 200,
  `total_seats_first` smallint(6) NOT NULL DEFAULT 50
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `uq_username` (`username`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`booking_id`),
  ADD UNIQUE KEY `uq_pnr` (`pnr`),
  ADD KEY `schedule_id` (`schedule_id`),
  ADD KEY `passenger_id` (`passenger_id`);

--
-- Indexes for table `passengers`
--
ALTER TABLE `passengers`
  ADD PRIMARY KEY (`passenger_id`),
  ADD UNIQUE KEY `uq_email` (`email`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`schedule_id`);

--
-- Indexes for table `stations`
--
ALTER TABLE `stations`
  ADD PRIMARY KEY (`station_id`),
  ADD UNIQUE KEY `station name` (`station name`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`ticket_id`),
  ADD KEY `booking_id` (`booking_id`);

--
-- Indexes for table `trains`
--
ALTER TABLE `trains`
  ADD PRIMARY KEY (`train_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `booking_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `passengers`
--
ALTER TABLE `passengers`
  MODIFY `passenger_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `schedule_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `stations`
--
ALTER TABLE `stations`
  MODIFY `station_id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `ticket_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `trains`
--
ALTER TABLE `trains`
  MODIFY `train_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`schedule_id`),
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`passenger_id`) REFERENCES `passengers` (`passenger_id`);

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`booking_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
