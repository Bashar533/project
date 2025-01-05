-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 05, 2025 at 08:48 PM
-- Server version: 8.0.36
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `obakha22`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`obakha22`@`localhost` PROCEDURE `insert_user` (IN `email` VARCHAR(255), IN `username` VARCHAR(255), IN `password` VARCHAR(255), IN `first_name` VARCHAR(255), IN `last_name` VARCHAR(255), IN `role` INT)   BEGIN
    INSERT INTO USERS (Email, Username, PasswordHash, FirstName, LastName, RoleID, CreatedAt, UpdatedAt)
    VALUES (email, username, password, first_name, last_name, role, CURDATE(), CURDATE());
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `AFFECTED_ASSETS`
--

CREATE TABLE `AFFECTED_ASSETS` (
  `IncidentID` int NOT NULL,
  `AssetID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ASSETS`
--

CREATE TABLE `ASSETS` (
  `AssetID` int NOT NULL,
  `AssetName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `COMMENTS`
--

CREATE TABLE `COMMENTS` (
  `CommentID` int NOT NULL,
  `IncidentID` int NOT NULL,
  `CommentedBy` int NOT NULL,
  `CommentText` text NOT NULL,
  `Timestamp` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `INCIDENTS`
--

CREATE TABLE `INCIDENTS` (
  `IncidentID` int NOT NULL,
  `ReportedBy` int NOT NULL,
  `TypeID` int NOT NULL,
  `SeverityID` int NOT NULL,
  `Description` text NOT NULL,
  `CreatedAt` date NOT NULL,
  `UpdatedAt` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `INCIDENT_FILES`
--

CREATE TABLE `INCIDENT_FILES` (
  `FileID` int NOT NULL,
  `IncidentID` int NOT NULL,
  `FilePath` varchar(255) NOT NULL,
  `UploadedAt` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `INCIDENT_SEVERITIES`
--

CREATE TABLE `INCIDENT_SEVERITIES` (
  `SeverityID` int NOT NULL,
  `SeverityLevel` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `INCIDENT_SEVERITIES`
--

INSERT INTO `INCIDENT_SEVERITIES` (`SeverityID`, `SeverityLevel`) VALUES
(4, 'Critical'),
(3, 'High'),
(1, 'Low'),
(2, 'Medium');

-- --------------------------------------------------------

--
-- Table structure for table `INCIDENT_STATUSES`
--

CREATE TABLE `INCIDENT_STATUSES` (
  `StatusChangeID` int NOT NULL,
  `IncidentID` int NOT NULL,
  `StatusID` int NOT NULL,
  `UpdatedBy` int NOT NULL,
  `Timestamp` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `INCIDENT_TYPES`
--

CREATE TABLE `INCIDENT_TYPES` (
  `TypeID` int NOT NULL,
  `TypeName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `PAGE_URLS`
--

CREATE TABLE `PAGE_URLS` (
  `PageURLID` int NOT NULL,
  `URL` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `PAGE_VISITS`
--

CREATE TABLE `PAGE_VISITS` (
  `VisitID` int NOT NULL,
  `PageURLID` int NOT NULL,
  `BrowserID` int NOT NULL,
  `HostIP` varchar(45) NOT NULL,
  `Timestamp` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `name` varchar(256) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `description`, `created_at`) VALUES
(1, 'Milk', 1.00, 'Straight from a cow', '2024-12-06 22:56:23'),
(2, 'Chocolate Milk', 1.20, 'Straight from a cocoa cow', '2024-12-06 23:00:45'),
(3, 'Almond Milk', 1.89, 'Straight from an almond cow, (Lactose free)', '2024-12-06 23:01:38'),
(5, 'Oat Milk', 1.89, 'Straight from an oat cow, (Lactose free)', '2024-12-06 23:29:47');

-- --------------------------------------------------------

--
-- Table structure for table `ROLES`
--

CREATE TABLE `ROLES` (
  `RoleID` int NOT NULL,
  `RoleName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `ROLES`
--

INSERT INTO `ROLES` (`RoleID`, `RoleName`) VALUES
(1, 'Administrator'),
(4, 'Guest'),
(2, 'Reporter'),
(3, 'Responder');

-- --------------------------------------------------------

--
-- Table structure for table `STATUS_TYPES`
--

CREATE TABLE `STATUS_TYPES` (
  `StatusID` int NOT NULL,
  `StatusName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `STATUS_TYPES`
--

INSERT INTO `STATUS_TYPES` (`StatusID`, `StatusName`) VALUES
(2, 'Pending'),
(3, 'Proccessing'),
(1, 'Resolved');

-- --------------------------------------------------------

--
-- Table structure for table `USERS`
--

CREATE TABLE `USERS` (
  `UserID` int NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `PasswordHash` varchar(255) NOT NULL,
  `RoleID` int NOT NULL,
  `CreatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `USERS`
--

INSERT INTO `USERS` (`UserID`, `FirstName`, `LastName`, `Username`, `Email`, `PasswordHash`, `RoleID`, `CreatedAt`, `UpdatedAt`) VALUES
(1, 'Obada', 'Khalaf', 'obakha22', 'obakha22@student.hh.se', '$2y$10$jTmAKgAQxLX1gjIj.v9I3u.aew56JeABfFSHtTXXPRx6xkr/kjoZO', 1, '2025-01-01 21:12:44', '2025-01-05 21:03:54');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `fname` varchar(30) DEFAULT NULL,
  `lname` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `fname`, `lname`) VALUES
(1, 'admin', 'password', NULL, NULL, NULL),
(2, 'user', 'pass', ' \nemail@mail.com', '', ''),
(3, '', '', ' \n    ', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `USER_VISITS`
--

CREATE TABLE `USER_VISITS` (
  `UserVisitID` int NOT NULL,
  `UserID` int NOT NULL,
  `VisitID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `WEB_BROWSERS`
--

CREATE TABLE `WEB_BROWSERS` (
  `BrowserID` int NOT NULL,
  `BrowserName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `AFFECTED_ASSETS`
--
ALTER TABLE `AFFECTED_ASSETS`
  ADD PRIMARY KEY (`IncidentID`,`AssetID`),
  ADD KEY `AssetID` (`AssetID`);

--
-- Indexes for table `ASSETS`
--
ALTER TABLE `ASSETS`
  ADD PRIMARY KEY (`AssetID`),
  ADD UNIQUE KEY `AssetName` (`AssetName`);

--
-- Indexes for table `COMMENTS`
--
ALTER TABLE `COMMENTS`
  ADD PRIMARY KEY (`CommentID`),
  ADD KEY `IncidentID` (`IncidentID`),
  ADD KEY `CommentedBy` (`CommentedBy`);

--
-- Indexes for table `INCIDENTS`
--
ALTER TABLE `INCIDENTS`
  ADD PRIMARY KEY (`IncidentID`),
  ADD KEY `ReportedBy` (`ReportedBy`),
  ADD KEY `TypeID` (`TypeID`),
  ADD KEY `SeverityID` (`SeverityID`);

--
-- Indexes for table `INCIDENT_FILES`
--
ALTER TABLE `INCIDENT_FILES`
  ADD PRIMARY KEY (`FileID`),
  ADD KEY `IncidentID` (`IncidentID`);

--
-- Indexes for table `INCIDENT_SEVERITIES`
--
ALTER TABLE `INCIDENT_SEVERITIES`
  ADD PRIMARY KEY (`SeverityID`),
  ADD UNIQUE KEY `SeverityLevel` (`SeverityLevel`);

--
-- Indexes for table `INCIDENT_STATUSES`
--
ALTER TABLE `INCIDENT_STATUSES`
  ADD PRIMARY KEY (`StatusChangeID`),
  ADD KEY `IncidentID` (`IncidentID`),
  ADD KEY `StatusID` (`StatusID`),
  ADD KEY `UpdatedBy` (`UpdatedBy`);

--
-- Indexes for table `INCIDENT_TYPES`
--
ALTER TABLE `INCIDENT_TYPES`
  ADD PRIMARY KEY (`TypeID`),
  ADD UNIQUE KEY `TypeName` (`TypeName`);

--
-- Indexes for table `PAGE_URLS`
--
ALTER TABLE `PAGE_URLS`
  ADD PRIMARY KEY (`PageURLID`),
  ADD UNIQUE KEY `URL` (`URL`);

--
-- Indexes for table `PAGE_VISITS`
--
ALTER TABLE `PAGE_VISITS`
  ADD PRIMARY KEY (`VisitID`),
  ADD KEY `PageURLID` (`PageURLID`),
  ADD KEY `BrowserID` (`BrowserID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ROLES`
--
ALTER TABLE `ROLES`
  ADD PRIMARY KEY (`RoleID`),
  ADD UNIQUE KEY `RoleName` (`RoleName`);

--
-- Indexes for table `STATUS_TYPES`
--
ALTER TABLE `STATUS_TYPES`
  ADD PRIMARY KEY (`StatusID`),
  ADD UNIQUE KEY `StatusName` (`StatusName`);

--
-- Indexes for table `USERS`
--
ALTER TABLE `USERS`
  ADD PRIMARY KEY (`UserID`),
  ADD UNIQUE KEY `Username` (`Username`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD KEY `RoleID` (`RoleID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `USER_VISITS`
--
ALTER TABLE `USER_VISITS`
  ADD PRIMARY KEY (`UserVisitID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `VisitID` (`VisitID`);

--
-- Indexes for table `WEB_BROWSERS`
--
ALTER TABLE `WEB_BROWSERS`
  ADD PRIMARY KEY (`BrowserID`),
  ADD UNIQUE KEY `BrowserName` (`BrowserName`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ASSETS`
--
ALTER TABLE `ASSETS`
  MODIFY `AssetID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `COMMENTS`
--
ALTER TABLE `COMMENTS`
  MODIFY `CommentID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `INCIDENTS`
--
ALTER TABLE `INCIDENTS`
  MODIFY `IncidentID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `INCIDENT_FILES`
--
ALTER TABLE `INCIDENT_FILES`
  MODIFY `FileID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `INCIDENT_SEVERITIES`
--
ALTER TABLE `INCIDENT_SEVERITIES`
  MODIFY `SeverityID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `INCIDENT_STATUSES`
--
ALTER TABLE `INCIDENT_STATUSES`
  MODIFY `StatusChangeID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `INCIDENT_TYPES`
--
ALTER TABLE `INCIDENT_TYPES`
  MODIFY `TypeID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `PAGE_URLS`
--
ALTER TABLE `PAGE_URLS`
  MODIFY `PageURLID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `PAGE_VISITS`
--
ALTER TABLE `PAGE_VISITS`
  MODIFY `VisitID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ROLES`
--
ALTER TABLE `ROLES`
  MODIFY `RoleID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `STATUS_TYPES`
--
ALTER TABLE `STATUS_TYPES`
  MODIFY `StatusID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `USERS`
--
ALTER TABLE `USERS`
  MODIFY `UserID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `USER_VISITS`
--
ALTER TABLE `USER_VISITS`
  MODIFY `UserVisitID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `WEB_BROWSERS`
--
ALTER TABLE `WEB_BROWSERS`
  MODIFY `BrowserID` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `AFFECTED_ASSETS`
--
ALTER TABLE `AFFECTED_ASSETS`
  ADD CONSTRAINT `AFFECTED_ASSETS_ibfk_1` FOREIGN KEY (`IncidentID`) REFERENCES `INCIDENTS` (`IncidentID`),
  ADD CONSTRAINT `AFFECTED_ASSETS_ibfk_2` FOREIGN KEY (`AssetID`) REFERENCES `ASSETS` (`AssetID`);

--
-- Constraints for table `COMMENTS`
--
ALTER TABLE `COMMENTS`
  ADD CONSTRAINT `COMMENTS_ibfk_1` FOREIGN KEY (`IncidentID`) REFERENCES `INCIDENTS` (`IncidentID`),
  ADD CONSTRAINT `COMMENTS_ibfk_2` FOREIGN KEY (`CommentedBy`) REFERENCES `USERS` (`UserID`);

--
-- Constraints for table `INCIDENTS`
--
ALTER TABLE `INCIDENTS`
  ADD CONSTRAINT `INCIDENTS_ibfk_1` FOREIGN KEY (`ReportedBy`) REFERENCES `USERS` (`UserID`),
  ADD CONSTRAINT `INCIDENTS_ibfk_2` FOREIGN KEY (`TypeID`) REFERENCES `INCIDENT_TYPES` (`TypeID`),
  ADD CONSTRAINT `INCIDENTS_ibfk_3` FOREIGN KEY (`SeverityID`) REFERENCES `INCIDENT_SEVERITIES` (`SeverityID`);

--
-- Constraints for table `INCIDENT_FILES`
--
ALTER TABLE `INCIDENT_FILES`
  ADD CONSTRAINT `INCIDENT_FILES_ibfk_1` FOREIGN KEY (`IncidentID`) REFERENCES `INCIDENTS` (`IncidentID`);

--
-- Constraints for table `INCIDENT_STATUSES`
--
ALTER TABLE `INCIDENT_STATUSES`
  ADD CONSTRAINT `INCIDENT_STATUSES_ibfk_1` FOREIGN KEY (`IncidentID`) REFERENCES `INCIDENTS` (`IncidentID`),
  ADD CONSTRAINT `INCIDENT_STATUSES_ibfk_2` FOREIGN KEY (`StatusID`) REFERENCES `STATUS_TYPES` (`StatusID`),
  ADD CONSTRAINT `INCIDENT_STATUSES_ibfk_3` FOREIGN KEY (`UpdatedBy`) REFERENCES `USERS` (`UserID`);

--
-- Constraints for table `PAGE_VISITS`
--
ALTER TABLE `PAGE_VISITS`
  ADD CONSTRAINT `PAGE_VISITS_ibfk_1` FOREIGN KEY (`PageURLID`) REFERENCES `PAGE_URLS` (`PageURLID`),
  ADD CONSTRAINT `PAGE_VISITS_ibfk_2` FOREIGN KEY (`BrowserID`) REFERENCES `WEB_BROWSERS` (`BrowserID`);

--
-- Constraints for table `USERS`
--
ALTER TABLE `USERS`
  ADD CONSTRAINT `USERS_ibfk_1` FOREIGN KEY (`RoleID`) REFERENCES `ROLES` (`RoleID`);

--
-- Constraints for table `USER_VISITS`
--
ALTER TABLE `USER_VISITS`
  ADD CONSTRAINT `USER_VISITS_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `USERS` (`UserID`),
  ADD CONSTRAINT `USER_VISITS_ibfk_2` FOREIGN KEY (`VisitID`) REFERENCES `PAGE_VISITS` (`VisitID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
