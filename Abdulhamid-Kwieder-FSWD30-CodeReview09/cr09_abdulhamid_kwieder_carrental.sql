-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 03, 2018 at 03:14 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr09_abdulhamid_kwieder_carrental`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `address_id` int(11) NOT NULL,
  `city` varchar(55) DEFAULT NULL,
  `country` varchar(55) DEFAULT NULL,
  `post_number` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`address_id`, `city`, `country`, `post_number`) VALUES
(1, 'Vienna', 'Austria', 1010),
(2, 'Linz', 'Austria', 2014),
(3, 'Barlin', 'Germany', 1354);

-- --------------------------------------------------------

--
-- Table structure for table `agency`
--

CREATE TABLE `agency` (
  `agency_id` int(11) NOT NULL,
  `address` varchar(55) DEFAULT NULL,
  `fk_employee` int(11) DEFAULT NULL,
  `fk_person` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `agency`
--

INSERT INTO `agency` (`agency_id`, `address`, `fk_employee`, `fk_person`) VALUES
(1, 'Vienna-Austria', 3, 2),
(2, 'Linz-Austria', 1, 1),
(3, 'Barlin-Germany', 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE `car` (
  `car_id` int(11) NOT NULL,
  `manufacturer` varchar(55) DEFAULT NULL,
  `model` varchar(55) DEFAULT NULL,
  `color` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `car`
--

INSERT INTO `car` (`car_id`, `manufacturer`, `model`, `color`) VALUES
(1, 'BMW', 'sport', 'red'),
(2, 'Toiota', 'classic', 'blue'),
(3, 'Audi', 'sport', 'black'),
(4, 'Audi', 'small', 'green');

-- --------------------------------------------------------

--
-- Table structure for table `cheking_center`
--

CREATE TABLE `cheking_center` (
  `cheking_center_id` int(11) NOT NULL,
  `address` varchar(55) DEFAULT NULL,
  `fk_agency` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cheking_center`
--

INSERT INTO `cheking_center` (`cheking_center_id`, `address`, `fk_agency`) VALUES
(1, 'Vienna-Austria', 1),
(2, 'Linz-Austria', 3),
(3, 'Frankfort-Germany', 2);

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `company_id` int(11) NOT NULL,
  `employee_name` varchar(55) DEFAULT NULL,
  `fk_address` int(11) DEFAULT NULL,
  `fk_reservation` int(11) DEFAULT NULL,
  `fk_car` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`company_id`, `employee_name`, `fk_address`, `fk_reservation`, `fk_car`) VALUES
(1, 'Pauli', 3, 2, 1),
(2, 'Mohammed', 2, 1, 3),
(3, 'Sofia', 1, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `bithdate` date DEFAULT NULL,
  `driving_licence` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `first_name`, `last_name`, `bithdate`, `driving_licence`) VALUES
(1, 'Samer', 'Hamad', '1990-02-13', 'yes'),
(2, 'juni', 'zimmer', '1980-01-25', 'yes'),
(3, 'Anna', 'ime', '1985-07-12', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employee_id`, `first_name`, `last_name`) VALUES
(1, 'Tereza', 'Lou Lou'),
(2, 'Ramadan', 'Ramzi'),
(3, 'Fabiano', 'Adel');

-- --------------------------------------------------------

--
-- Table structure for table `online`
--

CREATE TABLE `online` (
  `online_id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `fk_customer` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `online`
--

INSERT INTO `online` (`online_id`, `date`, `fk_customer`) VALUES
(1, '2017-03-25', 3),
(2, '2017-07-24', 1),
(3, '2017-01-02', 2);

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `person_id` int(11) NOT NULL,
  `fk_company` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`person_id`, `fk_company`) VALUES
(2, 1),
(1, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `reservation_id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `fk_online` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`reservation_id`, `date`, `fk_online`) VALUES
(1, '2017-02-16', 1),
(2, '2017-07-28', 3),
(3, '2017-01-24', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_id`);

--
-- Indexes for table `agency`
--
ALTER TABLE `agency`
  ADD PRIMARY KEY (`agency_id`),
  ADD KEY `fk_employee` (`fk_employee`),
  ADD KEY `fk_person` (`fk_person`);

--
-- Indexes for table `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`car_id`);

--
-- Indexes for table `cheking_center`
--
ALTER TABLE `cheking_center`
  ADD PRIMARY KEY (`cheking_center_id`),
  ADD KEY `fk_agency` (`fk_agency`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`company_id`),
  ADD KEY `fk_address` (`fk_address`),
  ADD KEY `fk_reservation` (`fk_reservation`),
  ADD KEY `fk_car` (`fk_car`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indexes for table `online`
--
ALTER TABLE `online`
  ADD PRIMARY KEY (`online_id`),
  ADD KEY `fk_customer` (`fk_customer`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`person_id`),
  ADD KEY `fk_company` (`fk_company`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `fk_online` (`fk_online`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `car`
--
ALTER TABLE `car`
  MODIFY `car_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cheking_center`
--
ALTER TABLE `cheking_center`
  MODIFY `cheking_center_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `company_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `online`
--
ALTER TABLE `online`
  MODIFY `online_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `reservation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `agency`
--
ALTER TABLE `agency`
  ADD CONSTRAINT `agency_ibfk_1` FOREIGN KEY (`fk_employee`) REFERENCES `employee` (`employee_id`),
  ADD CONSTRAINT `agency_ibfk_2` FOREIGN KEY (`fk_person`) REFERENCES `person` (`person_id`);

--
-- Constraints for table `cheking_center`
--
ALTER TABLE `cheking_center`
  ADD CONSTRAINT `cheking_center_ibfk_1` FOREIGN KEY (`fk_agency`) REFERENCES `agency` (`agency_id`);

--
-- Constraints for table `company`
--
ALTER TABLE `company`
  ADD CONSTRAINT `company_ibfk_1` FOREIGN KEY (`fk_address`) REFERENCES `address` (`address_id`),
  ADD CONSTRAINT `company_ibfk_2` FOREIGN KEY (`fk_reservation`) REFERENCES `reservation` (`reservation_id`),
  ADD CONSTRAINT `company_ibfk_3` FOREIGN KEY (`fk_car`) REFERENCES `car` (`car_id`);

--
-- Constraints for table `online`
--
ALTER TABLE `online`
  ADD CONSTRAINT `online_ibfk_1` FOREIGN KEY (`fk_customer`) REFERENCES `customer` (`customer_id`);

--
-- Constraints for table `person`
--
ALTER TABLE `person`
  ADD CONSTRAINT `person_ibfk_1` FOREIGN KEY (`fk_company`) REFERENCES `company` (`company_id`);

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`fk_online`) REFERENCES `online` (`online_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
