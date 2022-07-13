-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Jul 13, 2022 at 06:43 PM
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
  `img` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `places`
--

INSERT INTO `places` (`id`, `name`, `city`, `street`, `buildNumber`, `img`) VALUES
('970fa643-0737-4082-949b-7382f0e6c035', 'Krakow Center', 'Krakow', 'Krakow 3', '1', 'http://localhost:3000/static/media/office.929e7651334293b5e310.jpeg'),
('991a328c-5768-4466-a48d-b04258690b8c', 'Test Center', 'Stockholm', 'Test Street', '44a', 'https://directoffice.pl/wp-content/uploads/wpallimport/files/export_icea/pictures/132103_Klimeckiego/KLIM-1.jpg'),
('ea7e9ac8-7ff3-4e3d-b4e0-e72612569be3', 'Warsaw Center', 'Warsaw', 'Warsaw 12', '1', 'https://www.officemanagement.se/globalassets/web.2.0/startsida/animation-startsida.jpg?width=720&upscale=false');

-- --------------------------------------------------------

--
-- Table structure for table `places_products`
--

CREATE TABLE `places_products` (
  `place_id` varchar(36) NOT NULL,
  `item_id` varchar(36) NOT NULL,
  `amount` int(5) NOT NULL,
  `db_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `dateOfBuy` varchar(10) NOT NULL,
  `img` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `places_products`
--

INSERT INTO `places_products` (`place_id`, `item_id`, `amount`, `db_id`, `name`, `price`, `dateOfBuy`, `img`) VALUES
('636860d8-6bfb-4ea9-8e7e-0e8a2c398f30', '376a7a32-0481-4ca9-9be0-160b8ba67bbf', 10, 121, 'Small Things', '299.00', '2022-07-14', '/static/media/item.605d8a9be5f89388c7e5.jpeg'),
('ea7e9ac8-7ff3-4e3d-b4e0-e72612569be3', '5656dd39-e348-48c3-aac3-857e66002478', 1, 132, 'test2', '20.00', '2022-07-29', '/static/media/item.605d8a9be5f89388c7e5.jpeg'),
('970fa643-0737-4082-949b-7382f0e6c035', 'c45377c5-3c35-4b8a-ae0c-37456c9ee7e5', 10, 135, 'Pencil', '2.00', '2022-07-03', '/static/media/item1.e4e989d4183709f8f9fe.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` varchar(36) NOT NULL,
  `name` varchar(30) NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `amount` int(5) NOT NULL,
  `dateOfBuy` varchar(10) NOT NULL,
  `img` varchar(200) DEFAULT NULL,
  `curr_loc` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `amount`, `dateOfBuy`, `img`, `curr_loc`) VALUES
('c45377c5-3c35-4b8a-ae0c-37456c9ee7e5', 'Pencil', '2.00', 190, '2022-07-03', '/static/media/item1.e4e989d4183709f8f9fe.jpeg', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `places`
--
ALTER TABLE `places`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `places_products`
--
ALTER TABLE `places_products`
  ADD PRIMARY KEY (`db_id`),
  ADD KEY `place_id` (`place_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_curr_loc_IDX` (`curr_loc`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `places_products`
--
ALTER TABLE `places_products`
  MODIFY `db_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `places_products`
--
ALTER TABLE `places_products`
  ADD CONSTRAINT `itemID_itemID` FOREIGN KEY (`item_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `placeID_placeID` FOREIGN KEY (`place_id`) REFERENCES `places` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_FK` FOREIGN KEY (`curr_loc`) REFERENCES `places` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
