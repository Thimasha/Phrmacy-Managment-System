-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 13, 2021 at 10:02 PM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pharmacy_management_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `Category_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Category_Name` varchar(30) NOT NULL,
  `Shelves_Location` varchar(15) NOT NULL,
  PRIMARY KEY (`Category_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`Category_ID`, `Category_Name`, `Shelves_Location`) VALUES
(1, 'Liquid', 'A01'),
(2, 'Tablet', 'A02'),
(3, 'Antibiotics', 'A03'),
(4, 'Anesthesia', 'A04');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE IF NOT EXISTS `employee` (
  `Employee_ID` int(11) NOT NULL AUTO_INCREMENT,
  `User_Name` varchar(12) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `First_Name` varchar(15) NOT NULL,
  `Middle_Name` varchar(15) NOT NULL,
  `Last_Name` varchar(15) NOT NULL,
  `Postal_Code` int(5) NOT NULL,
  `Street` varchar(20) NOT NULL,
  `City` varchar(20) NOT NULL,
  `Area` varchar(20) NOT NULL,
  `Phone_Number` int(10) NOT NULL,
  `Email` varchar(256) NOT NULL,
  `NIC` int(12) NOT NULL,
  `Gender` varchar(6) NOT NULL,
  `First_Appointed_Date` date NOT NULL,
  PRIMARY KEY (`Employee_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`Employee_ID`, `User_Name`, `Password`, `First_Name`, `Middle_Name`, `Last_Name`, `Postal_Code`, `Street`, `City`, `Area`, `Phone_Number`, `Email`, `NIC`, `Gender`, `First_Appointed_Date`) VALUES
(1, 'Chathurika', '$2a$11$NhsSNmZBhSMo32M9rKMGpu0dLjIpJ/0sZbs.rUnDOQHrYlQ1IMYDi', 'Chathurika', 'Samanmali', 'Hewage', 90, 'Rit Rit Park', 'Weherahena', 'Matara', 703272453, 'chathu.hewage@gmail.com', 985302253, 'Female', '2021-10-01'),
(2, 'Wijesinghe', '$2a$11$X2sQycZ9Bs11B6aFXGl2peNSeDffq0b01Nzqkq8mWzUF0U/OFljgC', 'CT', 'M', 'Wijesinghe', 102, 'Saketha', 'Weedagama', 'Bandaragama', 710637618, 'wijesinghe@gmail.com', 685522124, 'Male', '2021-09-30'),
(3, 'Thimasha', '$2a$11$QrDxSgYeIwmMmCtd.bsul.EzDoFeoYtbZ.if0j1G2fytQcQzdrxHW', 'Thimasha', 'Janani', 'Gallage', 325, 'Temple Road', 'Miriswatta', 'Benthota', 756288686, 'jthimasha@gmail.com', 986051659, 'Female', '2021-10-01'),
(4, 'Madupa', '$2a$11$GFiuOeNaLhl5BaUbJrLw7u7ka2C9hpjhRESn3JrW2C1JyXYqTmgoK', 'Madupa', 'Minod', 'Wijesuriya', 100, 'Temple Road', 'Dabadeniya', 'Kurunagala', 712362752, 'madupa@gmail.com', 980741508, 'Male', '2021-10-01');

-- --------------------------------------------------------

--
-- Table structure for table `employee_appointed_info`
--

DROP TABLE IF EXISTS `employee_appointed_info`;
CREATE TABLE IF NOT EXISTS `employee_appointed_info` (
  `Employee_ID` int(11) NOT NULL,
  `Job_Role` varchar(30) NOT NULL,
  `Appointed_Date` date NOT NULL,
  `End_Date` date DEFAULT NULL,
  `Status` varchar(15) NOT NULL,
  KEY `Employee_FK` (`Employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee_appointed_info`
--

INSERT INTO `employee_appointed_info` (`Employee_ID`, `Job_Role`, `Appointed_Date`, `End_Date`, `Status`) VALUES
(2, 'Manager', '2021-09-30', '2021-10-14', 'Work'),
(1, 'Pharmacist', '2021-10-01', '2021-10-14', 'Work'),
(3, 'Operator', '2021-10-01', '2021-10-14', 'Work'),
(4, 'Worker', '2021-10-01', '2021-10-14', 'Work');

-- --------------------------------------------------------

--
-- Table structure for table `medicine`
--

DROP TABLE IF EXISTS `medicine`;
CREATE TABLE IF NOT EXISTS `medicine` (
  `Medicine_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Category_ID` int(11) NOT NULL,
  `Generic_Name` varchar(25) NOT NULL,
  `Short_Name` varchar(20) NOT NULL,
  PRIMARY KEY (`Medicine_ID`),
  KEY `Category_FK` (`Category_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `medicine`
--

INSERT INTO `medicine` (`Medicine_ID`, `Category_ID`, `Generic_Name`, `Short_Name`) VALUES
(1, 2, 'Zestril', 'Lisinopril'),
(2, 2, 'Synthroid', 'Levohthyroxine'),
(3, 2, 'Metforming', 'Glucophage'),
(4, 3, 'Pencillins', 'Penkilles'),
(5, 3, 'Ciprofloxacin', 'Cipro');

-- --------------------------------------------------------

--
-- Table structure for table `shelves`
--

DROP TABLE IF EXISTS `shelves`;
CREATE TABLE IF NOT EXISTS `shelves` (
  `Shelves_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Shelves_Location` varchar(15) NOT NULL,
  PRIMARY KEY (`Shelves_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shelves`
--

INSERT INTO `shelves` (`Shelves_ID`, `Shelves_Location`) VALUES
(1, 'A01'),
(2, 'A02'),
(3, 'A03'),
(4, 'A04');

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
CREATE TABLE IF NOT EXISTS `stock` (
  `Stock_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Medicine_ID` int(11) NOT NULL,
  `Supplier_ID` int(11) NOT NULL,
  `Quantity` int(20) NOT NULL,
  `Manufactured_Date` date NOT NULL,
  `Expired_Date` date NOT NULL,
  `Per_Tablet_Price` decimal(12,2) NOT NULL,
  `Per_Unit_Price` decimal(12,2) NOT NULL,
  `Selling_Price` decimal(12,2) NOT NULL,
  `Added_Date` date DEFAULT NULL,
  `Added_By` varchar(12) DEFAULT NULL,
  `Update_Date` date DEFAULT NULL,
  `Update_By` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`Stock_ID`),
  KEY `Medicine_FK` (`Medicine_ID`),
  KEY `Supplier_FK` (`Supplier_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`Stock_ID`, `Medicine_ID`, `Supplier_ID`, `Quantity`, `Manufactured_Date`, `Expired_Date`, `Per_Tablet_Price`, `Per_Unit_Price`, `Selling_Price`, `Added_Date`, `Added_By`, `Update_Date`, `Update_By`) VALUES
(1, 5, 1, 5000, '2021-10-05', '2023-01-01', '200.00', '20.00', '22.00', '2021-10-14', 'Chathurika', NULL, NULL),
(2, 3, 2, 2000, '2021-10-04', '2023-02-08', '100.00', '10.00', '12.00', '2021-10-07', 'Chathurika', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
CREATE TABLE IF NOT EXISTS `supplier` (
  `Supplier_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Ref_No` varchar(30) NOT NULL,
  `Company_Name` varchar(20) NOT NULL,
  `Supplier_Name` varchar(20) NOT NULL,
  `Phone_number` int(10) NOT NULL,
  `Email` varchar(256) NOT NULL,
  `Postal_Code` int(5) NOT NULL,
  `Street` varchar(20) NOT NULL,
  `City` varchar(20) NOT NULL,
  `Area` varchar(20) NOT NULL,
  `Bank_Name` varchar(20) NOT NULL,
  `Branch_Name` varchar(20) NOT NULL,
  `Account_Number` int(15) NOT NULL,
  PRIMARY KEY (`Supplier_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`Supplier_ID`, `Ref_No`, `Company_Name`, `Supplier_Name`, `Phone_number`, `Email`, `Postal_Code`, `Street`, `City`, `Area`, `Bank_Name`, `Branch_Name`, `Account_Number`) VALUES
(1, '1709 AA 4826', 'Alaris Lanka PVT LTD', 'HR Kemasiri', 774480056, 'kumarasiri@gmail.com', 504, 'Horana Road', 'Kesbewa', 'Piliyandala', 'Peoples Bank', 'Piliyandala', 1972001700),
(2, '53131', 'Smith Kline PVT LTD', 'SWR Weththamuni', 114562536, 'smith@gmail.com', 11730, 'Galle Road', 'Kidemella', 'Moratuwa', 'BOC', 'Moratuwa', 4522356),
(3, 'T0584', 'Pharmaco PVT LTD', 'Mariom Akhi', 756288686, 'pharmacol@gmail.com', 75896, 'Union Road', 'Union Place', 'Colombo 02', 'BOC', 'Borella', 45236958);

-- --------------------------------------------------------

--
-- Table structure for table `supplier_payment`
--

DROP TABLE IF EXISTS `supplier_payment`;
CREATE TABLE IF NOT EXISTS `supplier_payment` (
  `Payment_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Stock_ID` int(11) NOT NULL,
  `Invoice_Amount` decimal(12,2) NOT NULL,
  `Payment_Date` date NOT NULL,
  `Payment_Amount` decimal(10,0) NOT NULL,
  `Payment_Method` varchar(10) NOT NULL,
  `Check_No` varchar(5) DEFAULT NULL,
  `Payment_Info` varchar(20) NOT NULL,
  `Update_By` varchar(20) NOT NULL,
  `Issue_Date` date NOT NULL,
  PRIMARY KEY (`Payment_ID`),
  KEY `Stock_FK` (`Stock_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier_payment`
--

INSERT INTO `supplier_payment` (`Payment_ID`, `Stock_ID`, `Invoice_Amount`, `Payment_Date`, `Payment_Amount`, `Payment_Method`, `Check_No`, `Payment_Info`, `Update_By`, `Issue_Date`) VALUES
(1, 2, '20000.00', '2021-10-07', '10000', 'Cash', '', 'Half Paymet', 'Madupa', '2021-10-07');

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

DROP TABLE IF EXISTS `system_info`;
CREATE TABLE IF NOT EXISTS `system_info` (
  `Reg_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Company_Name` varchar(30) NOT NULL,
  `Owner_Name` varchar(20) NOT NULL,
  `Mobile_Number` int(10) NOT NULL,
  `Land_Number` int(10) NOT NULL,
  `Email` varchar(256) NOT NULL,
  `Postal_Code` int(5) NOT NULL,
  `Street` varchar(20) NOT NULL,
  `City` varchar(20) NOT NULL,
  `Area` varchar(20) NOT NULL,
  PRIMARY KEY (`Reg_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employee_appointed_info`
--
ALTER TABLE `employee_appointed_info`
  ADD CONSTRAINT `Employee_FK` FOREIGN KEY (`Employee_ID`) REFERENCES `employee` (`Employee_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `medicine`
--
ALTER TABLE `medicine`
  ADD CONSTRAINT `Category_FK` FOREIGN KEY (`Category_ID`) REFERENCES `category` (`Category_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `Medicine_FK` FOREIGN KEY (`Medicine_ID`) REFERENCES `medicine` (`Medicine_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Supplier_FK` FOREIGN KEY (`Supplier_ID`) REFERENCES `stock` (`Stock_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `supplier_payment`
--
ALTER TABLE `supplier_payment`
  ADD CONSTRAINT `Stock_FK` FOREIGN KEY (`Stock_ID`) REFERENCES `stock` (`Stock_ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
