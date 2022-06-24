-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Jun 24, 2022 at 06:59 AM
-- Server version: 5.7.34
-- PHP Version: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `company_assets`
--
CREATE DATABASE IF NOT EXISTS `company_assets` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `company_assets`;

-- --------------------------------------------------------

--
-- Table structure for table `places`
--

CREATE TABLE `places` (
  `id` varchar(36) NOT NULL,
  `name` varchar(20) NOT NULL,
  `city` varchar(35) NOT NULL,
  `street` varchar(36) NOT NULL,
  `buildNumber` varchar(20) NOT NULL,
  `img` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` varchar(36) NOT NULL,
  `name` varchar(30) NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `pieces` int(5) NOT NULL,
  `dateOfBuy` varchar(10) NOT NULL,
  `img` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `pieces`, `dateOfBuy`, `img`) VALUES
('0e58ad16-5e9a-472b-9d88-c9b03e72fc18', 'A4 - Papier do drukarki', '0.80', 2350, '2022-06-22', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSB7a-viyHV2edyK8JPDitpm23f0dLsd34alQ&usqp=CAU'),
('81ade1e4-c2d5-4432-9871-99d1db293c3a', 'Laptop', '3299.00', 1, '2022-06-22', 'https://i.pcmag.com/imagery/articles/00tLYTqwmgFvacZlYPc5ecO-8..v1583853669.jpg'),
('926a34c5-3a12-4572-89c7-34c5507a37e7', 'Tusz do Drukarki', '90.00', 10, '2022-06-22', 'https://www.komputronik.pl/informacje/wp-content/uploads/2018/08/jaki-tusz-do-drukarki-2.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `places`
--
ALTER TABLE `places`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);
--
-- Database: `megak_cars`
--
CREATE DATABASE IF NOT EXISTS `megak_cars` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `megak_cars`;

-- --------------------------------------------------------

--
-- Table structure for table `Cars`
--

CREATE TABLE `Cars` (
  `ID` int(3) NOT NULL,
  `Brand` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Model` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Price` decimal(8,2) DEFAULT NULL,
  `RegistrationNumber` varchar(9) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Cars`
--

INSERT INTO `Cars` (`ID`, `Brand`, `Model`, `Price`, `RegistrationNumber`) VALUES
(1, 'Audi', 'a5', '10.00', 'KLI1111'),
(2, 'Opel', 'Astra', '350000.00', 'KLI2222'),
(3, 'Ford', 'Focus', '450000.00', 'KLI3333'),
(4, 'Porshe', 'GT', '750000.00', 'KLI4444'),
(120, 'AUDI', 'A6', '500000.00', 'KLI643'),
(121, 'Audi', 'A5', '126000.00', 'KLI8888'),
(122, 'Audi', 'A8', '756000.00', 'VIP1111');

-- --------------------------------------------------------

--
-- Table structure for table `Shop`
--

CREATE TABLE `Shop` (
  `id` int(3) NOT NULL,
  `adress` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Area in Square m` decimal(6,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Shop`
--

INSERT INTO `Shop` (`id`, `adress`, `Area in Square m`) VALUES
(1, 'Car Paradise', '500.00'),
(2, 'Priceless Car', '800.00');

-- --------------------------------------------------------

--
-- Table structure for table `Shop_cars`
--

CREATE TABLE `Shop_cars` (
  `ID` int(9) NOT NULL,
  `Registration Number` varchar(9) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PlacedID` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Shop_cars`
--

INSERT INTO `Shop_cars` (`ID`, `Registration Number`, `PlacedID`) VALUES
(3, 'KLI1111', 1),
(4, 'KLI3333', 1),
(5, 'KLI2222', 2),
(6, 'KLI4444', 2),
(7, 'KLI643', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Cars`
--
ALTER TABLE `Cars`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Price` (`Price`),
  ADD KEY `Brand` (`Brand`),
  ADD KEY `RegistrationNumber` (`RegistrationNumber`);

--
-- Indexes for table `Shop`
--
ALTER TABLE `Shop`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `Shop_cars`
--
ALTER TABLE `Shop_cars`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Registration Number` (`Registration Number`),
  ADD KEY `PlacedID` (`PlacedID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Cars`
--
ALTER TABLE `Cars`
  MODIFY `ID` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT for table `Shop`
--
ALTER TABLE `Shop`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Shop_cars`
--
ALTER TABLE `Shop_cars`
  MODIFY `ID` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Shop_cars`
--
ALTER TABLE `Shop_cars`
  ADD CONSTRAINT `shop_cars_ibfk_1` FOREIGN KEY (`Registration Number`) REFERENCES `Cars` (`RegistrationNumber`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `shop_cars_ibfk_2` FOREIGN KEY (`PlacedID`) REFERENCES `Shop` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
--
-- Database: `megak_courses`
--
CREATE DATABASE IF NOT EXISTS `megak_courses` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `megak_courses`;

-- --------------------------------------------------------

--
-- Table structure for table `Courses`
--

CREATE TABLE `Courses` (
  `CourseID` int(11) NOT NULL,
  `CourseStartAt` date NOT NULL,
  `Course Name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Student` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Courses`
--

INSERT INTO `Courses` (`CourseID`, `CourseStartAt`, `Course Name`, `Student`) VALUES
(1, '2020-02-02', 'Js 30 Days', NULL),
(2, '2021-09-26', 'Mega Kurs', NULL),
(3, '2021-01-06', 'Studiuje IT', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Students`
--

CREATE TABLE `Students` (
  `ID` int(36) NOT NULL,
  `Name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LastName` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Adress` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `UUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Course` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Students`
--

INSERT INTO `Students` (`ID`, `Name`, `LastName`, `Adress`, `CreatedAt`, `UUID`, `Course`) VALUES
(4, 'ONE', 'ONE', 'ONE', '2021-12-05 10:18:44', '3edefb46-55ad-11ec-b62a-eecc339c736d', 'Mega Kurs'),
(5, 'TWO', 'TWO', 'TWO', '2021-12-05 10:18:56', '3edefea2-55ad-11ec-b62a-eecc339c736d', 'Js 30 Days'),
(6, 'THREE', 'THREE', 'THREE', '2021-12-05 10:19:22', '3edeff88-55ad-11ec-b62a-eecc339c736d', 'Studiuje IT'),
(7, 'FOUR', 'FOUR', 'FOUR', '2021-12-05 10:19:32', '3edf005a-55ad-11ec-b62a-eecc339c736d', 'Mega Kurs'),
(10, 'FIVE', 'FIVE', 'FIVE', '2021-12-05 10:28:41', '1fd80c9c-fb73-4915-8185-7d71950bb42d', NULL),
(11, 'SIX', 'SIX', 'SIX', '2021-12-05 10:37:41', '54cd837d-1e88-4267-af31-e5f2f27811d6', 'Studiuje IT'),
(12, 'Seven', 'Seven', 'Seven', '2021-12-05 10:40:35', '6575c4d6-55af-11ec-b62a-eecc339c736d', NULL),
(13, 'Eight', 'Eight', 'Eight', '2021-12-05 10:41:16', '7dd5aa50-55af-11ec-b62a-eecc339c736d', 'JS 30 Days'),
(52, 'Patryk', 'Keska', 'Slopnice', '1994-09-26 00:00:00', '8329792c-5c59-11ec-802a-6f5b7849043c', 'Mega Kurs');

--
-- Triggers `Students`
--
DELIMITER $$
CREATE TRIGGER `insert_guid` BEFORE INSERT ON `Students` FOR EACH ROW BEGIN 
    SET NEW.uuid = UUID(); 
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `students_courses`
--

CREATE TABLE `students_courses` (
  `id` int(11) NOT NULL,
  `Name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Course` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students_courses`
--

INSERT INTO `students_courses` (`id`, `Name`, `Course`) VALUES
(1, 'Eight', 'Mega Kurs'),
(2, 'FOUR', 'Studiuje IT'),
(3, 'SIX', 'Studiuje IT');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Courses`
--
ALTER TABLE `Courses`
  ADD PRIMARY KEY (`CourseID`),
  ADD UNIQUE KEY `Courses_Course_Name_IDX` (`Course Name`) USING BTREE,
  ADD KEY `Course Name` (`Course Name`);

--
-- Indexes for table `Students`
--
ALTER TABLE `Students`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Students_Name_IDX` (`Name`) USING BTREE;

--
-- Indexes for table `students_courses`
--
ALTER TABLE `students_courses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `students_courses_Name_IDX` (`Name`,`Course`) USING BTREE,
  ADD KEY `students_courses_FK_1` (`Course`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Courses`
--
ALTER TABLE `Courses`
  MODIFY `CourseID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Students`
--
ALTER TABLE `Students`
  MODIFY `ID` int(36) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `students_courses`
--
ALTER TABLE `students_courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `students_courses`
--
ALTER TABLE `students_courses`
  ADD CONSTRAINT `students_courses_FK` FOREIGN KEY (`Name`) REFERENCES `Students` (`Name`),
  ADD CONSTRAINT `students_courses_FK_1` FOREIGN KEY (`Course`) REFERENCES `Courses` (`Course Name`);
--
-- Database: `megak_FullToDo`
--
CREATE DATABASE IF NOT EXISTS `megak_FullToDo` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `megak_FullToDo`;

-- --------------------------------------------------------

--
-- Table structure for table `Tasks`
--

CREATE TABLE `Tasks` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Tasks`
--

INSERT INTO `Tasks` (`id`, `name`, `priority`) VALUES
('656985bf-e585-4327-9eaa-20195f5ca29f', 'Repeat of past material', 3),
('836267d8-ffb7-406a-9b64-32db59e5a271', 'Complete MongoDB part', 4),
('86668974-3175-4d7e-8938-43d051ba94ab', 'Catch up a Mega K schedule ', 5),
('928c6a3f-ea31-4f58-ae7f-3f36efbe2d7c', 'Pass Mega K exam of Express part', 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Tasks`
--
ALTER TABLE `Tasks`
  ADD PRIMARY KEY (`id`);
--
-- Database: `megak_santa_gifts`
--
CREATE DATABASE IF NOT EXISTS `megak_santa_gifts` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `megak_santa_gifts`;

-- --------------------------------------------------------

--
-- Table structure for table `children`
--

CREATE TABLE `children` (
  `name` varchar(40) DEFAULT NULL,
  `id` varchar(36) DEFAULT NULL,
  `dbid` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `children`
--

INSERT INTO `children` (`name`, `id`, `dbid`) VALUES
('Patryk', 'l;kfasdjfl2348-94512-', 1);

-- --------------------------------------------------------

--
-- Table structure for table `gifts`
--

CREATE TABLE `gifts` (
  `name` varchar(40) DEFAULT NULL,
  `id` varchar(36) DEFAULT NULL,
  `dbid` int(3) NOT NULL,
  `count` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gifts`
--

INSERT INTO `gifts` (`name`, `id`, `dbid`, `count`) VALUES
('bike', '124', 1, 4),
('PC', '1dsafgfs234124', 2, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `children`
--
ALTER TABLE `children`
  ADD PRIMARY KEY (`dbid`);

--
-- Indexes for table `gifts`
--
ALTER TABLE `gifts`
  ADD PRIMARY KEY (`dbid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `children`
--
ALTER TABLE `children`
  MODIFY `dbid` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `gifts`
--
ALTER TABLE `gifts`
  MODIFY `dbid` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Database: `megak_todo`
--
CREATE DATABASE IF NOT EXISTS `megak_todo` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `megak_todo`;

-- --------------------------------------------------------

--
-- Table structure for table `todos`
--

CREATE TABLE `todos` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `todos`
--

INSERT INTO `todos` (`ID`, `title`) VALUES
('28b3ccde-e749-49ac-a643-3a0f635ae111', 'This is our new task for this day'),
('43e00346-b201-42fa-adb2-f8128fb3a568', 'We have a city to burn'),
('Samurai', 'We have a city to burn');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `todos`
--
ALTER TABLE `todos`
  ADD PRIMARY KEY (`ID`);
--
-- Database: `notice-board`
--
CREATE DATABASE IF NOT EXISTS `notice-board` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `notice-board`;

-- --------------------------------------------------------

--
-- Table structure for table `ads`
--

CREATE TABLE `ads` (
  `id` varchar(36) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `price` decimal(9,2) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `lat` decimal(10,7) DEFAULT NULL,
  `lon` decimal(10,7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ads`
--

INSERT INTO `ads` (`id`, `name`, `description`, `price`, `url`, `lat`, `lon`) VALUES
('2f9206a6-4457-46fd-888f-ae8daf654547', 'Kacper', 'Test', '2.00', 'https://google.pl', '49.7123583', '20.3506887'),
('7b484037-23fa-4a56-b314-0587f212c963', 'Kinia', 'Test', '44.00', 'https://google.pl', '49.7077172', '20.3546660'),
('a339f962-f172-4b1e-b44b-4178eff6a618', 'Patryk', 'Test', '4.00', 'https://google.pl', '49.7118215', '20.3499561'),
('d98d53b5-ff5b-4e5b-b0cc-d71bacdf34f6', 'Tadeusz', 'Test', '120.00', 'https://google.pl', '55.5769695', '13.0679046');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ads`
--
ALTER TABLE `ads`
  ADD PRIMARY KEY (`id`);
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;
--
-- Database: `Warrior_game`
--
CREATE DATABASE IF NOT EXISTS `Warrior_game` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `Warrior_game`;

-- --------------------------------------------------------

--
-- Table structure for table `Warriors`
--

CREATE TABLE `Warriors` (
  `id` varchar(36) NOT NULL,
  `name` varchar(25) NOT NULL,
  `health` int(3) NOT NULL,
  `stamina` int(2) NOT NULL,
  `strength` int(2) NOT NULL,
  `defence` int(2) NOT NULL,
  `agility` int(2) NOT NULL,
  `db_id` int(11) NOT NULL,
  `shield` int(3) NOT NULL,
  `wins` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Warriors`
--

INSERT INTO `Warriors` (`id`, `name`, `health`, `stamina`, `strength`, `defence`, `agility`, `db_id`, `shield`, `wins`) VALUES
('41c0da1f-6612-4266-b2e2-b6665a302195', 'Xaz', 50, 5, 3, 1, 1, 32, 1, 6),
('64db89f6-a6b8-4689-9e99-99104dce20bf', 'Yaz', 30, 3, 3, 2, 2, 33, 2, 2),
('a1999c20-e2af-4464-a7fa-950c2d46ad1b', 'Tester', 30, 3, 2, 1, 4, 34, 1, 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Warriors`
--
ALTER TABLE `Warriors`
  ADD PRIMARY KEY (`db_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Warriors`
--
ALTER TABLE `Warriors`
  MODIFY `db_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
