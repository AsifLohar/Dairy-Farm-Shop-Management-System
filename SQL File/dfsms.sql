-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 05, 2020 at 05:29 AM
-- Server version: 10.4.16-MariaDB
-- PHP Version: 7.3.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dfsms`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbladmin`
--

CREATE TABLE `tbladmin` (
  `ID` int(5) NOT NULL,
  `AdminName` varchar(45) DEFAULT NULL,
  `UserName` char(45) DEFAULT NULL,
  `MobileNumber` bigint(11) DEFAULT NULL,
  `Email` varchar(120) DEFAULT NULL,
  `Password` varchar(120) DEFAULT NULL,
  `AdminRegdate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbladmin`
--

INSERT INTO `tbladmin` (`ID`, `AdminName`, `UserName`, `MobileNumber`, `Email`, `Password`, `AdminRegdate`, `UpdationDate`) VALUES
(1, 'THE BOYS', 'admin', 6969696969, 'theboys@ymail.com', 'f925916e2754e5e03f75dd58a5733251', '2020-11-28 18:30:00', '2020-12-05 03:15:52');

-- --------------------------------------------------------

--
-- Table structure for table `tblcategory`
--

CREATE TABLE `tblcategory` (
  `id` int(11) NOT NULL,
  `CategoryName` varchar(200) DEFAULT NULL,
  `CategoryCode` varchar(50) DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcategory`
--

INSERT INTO `tblcategory` (`id`, `CategoryName`, `CategoryCode`, `PostingDate`) VALUES
(1, 'Milk', 'MK01', '2020-11-29 16:27:43'),
(2, 'Butter', 'BT01', '2020-11-29 16:27:59'),
(3, 'Bread', 'BD01', '2020-11-29 16:28:12'),
(4, 'Paneer', 'PN01', '2020-11-29 16:29:18'),
(5, 'Soya', 'SY01', '2020-11-29 16:29:58'),
(7, 'Ghee', 'GH01', '2020-11-29 14:52:08');

-- --------------------------------------------------------

--
-- Table structure for table `tblcompany`
--

CREATE TABLE `tblcompany` (
  `id` int(11) NOT NULL,
  `CompanyName` varchar(150) DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcompany`
--

INSERT INTO `tblcompany` (`id`, `CompanyName`, `PostingDate`) VALUES
(1, 'Amul', '2020-11-29 03:30:51'),
(2, 'Mother Diary', '2020-11-29 03:30:59'),
(3, 'Patanjali', '2020-11-29 03:31:09'),
(4, 'Namaste India', '2020-11-29 03:31:21'),
(10, 'Paras', '2020-11-29 14:52:50');

-- --------------------------------------------------------

--
-- Table structure for table `tblorders`
--

CREATE TABLE `tblorders` (
  `id` int(11) NOT NULL,
  `ProductId` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `InvoiceNumber` int(11) DEFAULT NULL,
  `CustomerName` varchar(150) DEFAULT NULL,
  `CustomerContactNo` bigint(12) DEFAULT NULL,
  `PaymentMode` varchar(100) DEFAULT NULL,
  `InvoiceGenDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblorders`
--

INSERT INTO `tblorders` (`id`, `ProductId`, `Quantity`, `InvoiceNumber`, `CustomerName`, `CustomerContactNo`, `PaymentMode`, `InvoiceGenDate`) VALUES
(1, 4, 2, 753947547, 'Anuj', 9354778033, 'cash', '2020-11-29 08:32:47'),
(2, 1, 1, 979148350, 'Sanjeen', 1234567890, 'card', '2020-11-29 11:38:08'),
(3, 1, 1, 861354457, 'Rahul', 9876543210, 'cash', '2020-11-29 03:03:24'),
(4, 5, 1, 276794782, 'Sarita', 1122334455, 'cash', '2020-11-29 11:48:06'),
(5, 6, 2, 744608164, 'Babu Pandey', 123458962, 'card', '2020-11-29 12:07:50'),
(6, 7, 1, 139640585, 'John', 45632147892, 'cash', '2020-11-29 14:54:24'),
(7, 1, 1, 530589234, 'saad', 93014920913, 'cash', '2020-12-05 03:05:39'),
(8, 1, 3, 1234, 'Adnan', 8989898, 'cash', '2020-12-05 03:28:35'),
(9, 4, 1, 413916185, 'Asif', 8374902374, 'cash', '2020-12-05 03:30:04'),
(10, 2, 3, 1234, 'faisal', 8989898, 'cash', '2020-12-05 03:34:17');

--
-- Triggers `tblorders`
--
DELIMITER $$
CREATE TRIGGER `transaction` AFTER INSERT ON `tblorders` FOR EACH ROW UPDATE tblproducts
SET tblproducts.Quantity=tblproducts.Quantity-tblorders.Quantity
WHERE id=NEW.id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tblproducts`
--

CREATE TABLE `tblproducts` (
  `id` int(11) NOT NULL,
  `CategoryName` varchar(150) DEFAULT NULL,
  `CompanyName` varchar(150) DEFAULT NULL,
  `ProductName` varchar(150) DEFAULT NULL,
  `Quantity` int(100) DEFAULT NULL,
  `ProductPrice` decimal(10,0) DEFAULT current_timestamp(),
  `PostingDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblproducts`
--

INSERT INTO `tblproducts` (`id`, `CategoryName`, `CompanyName`, `ProductName`, `Quantity`, `ProductPrice`, `PostingDate`, `UpdationDate`) VALUES
(1, 'Paneer', 'Amul', 'Fresh Paneer', 50, '100', '2020-12-05 03:28:56', '2020-12-05 03:28:56'),
(2, 'Milk', 'Amul', 'Toned Milk 500ml', 30, '22', '2020-12-05 03:26:49', '2020-12-05 03:26:49'),
(3, 'Milk', 'Amul', 'Toned Milk 1L', 40, '44', '2020-12-05 03:26:52', '2020-12-05 03:26:52'),
(4, 'Butter', 'Amul', 'Smooth Butter', 30, '50', '2020-12-05 03:26:55', '2020-12-05 03:26:55'),
(5, 'Bread', 'Patanjali', 'Brown Bread', 30, '14', '2020-12-05 03:27:00', '2020-12-05 03:27:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblcategory`
--
ALTER TABLE `tblcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcompany`
--
ALTER TABLE `tblcompany`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblorders`
--
ALTER TABLE `tblorders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblproducts`
--
ALTER TABLE `tblproducts`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbladmin`
--
ALTER TABLE `tbladmin`
  MODIFY `ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblcategory`
--
ALTER TABLE `tblcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tblcompany`
--
ALTER TABLE `tblcompany`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tblorders`
--
ALTER TABLE `tblorders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tblproducts`
--
ALTER TABLE `tblproducts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
