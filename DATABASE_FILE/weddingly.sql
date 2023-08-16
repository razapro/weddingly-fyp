-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 04, 2023 at 05:11 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `weddingly`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_cred`
--

CREATE TABLE `admin_cred` (
  `sr_no` int(11) NOT NULL,
  `admin_name` varchar(150) NOT NULL,
  `admin_pass` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin_cred`
--

INSERT INTO `admin_cred` (`sr_no`, `admin_name`, `admin_pass`) VALUES
(1, 'raza', '12345');

-- --------------------------------------------------------

--
-- Table structure for table `booking_details`
--

CREATE TABLE `booking_details` (
  `sr_no` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `venue_name` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `total_pay` int(11) NOT NULL,
  `venue_no` varchar(100) DEFAULT NULL,
  `user_name` varchar(100) NOT NULL,
  `phonenum` varchar(100) NOT NULL,
  `address` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booking_details`
--

INSERT INTO `booking_details` (`sr_no`, `booking_id`, `venue_name`, `price`, `total_pay`, `venue_no`, `user_name`, `phonenum`, `address`) VALUES
(1, 1, 'Simple venue', 300, 300, NULL, 'raza', '123', 'ad'),
(2, 2, 'Simple venue', 300, 600, 'a2', 'raza', '123', 'ad'),
(3, 3, 'Simple venue', 300, 1800, NULL, 'raza', '123', 'ad'),
(4, 4, 'Supreme deluxe venue', 900, 4500, NULL, 'raza', '123', 'ad'),
(5, 5, 'Supreme deluxe venue', 900, 900, NULL, 'raza', '123', 'ad'),
(6, 6, 'Supreme deluxe venue', 900, 7200, '52', 'raza', '12323432', 'ad2342343'),
(7, 7, 'Supreme deluxe venue', 900, 900, NULL, 'raza', '123', 'ad'),
(8, 8, 'Simple venue', 300, 600, NULL, 'raza', '123', 'ad'),
(9, 9, 'Luxury venue', 600, 3000, '159A', 'raza', '123', 'ad'),
(10, 10, 'Luxury venue', 600, 1800, '15S', 'raza', '123', 'ad'),
(11, 11, 'Supreme deluxe venue', 900, 2700, '1', 'raza', '123', 'ad'),
(12, 12, 'Simple venue', 300, 1200, '2', 'raza', '123', 'ad'),
(13, 13, 'Deluxe venue', 500, 3000, '23', 'raza', '123', 'ad'),
(14, 14, 'Luxury venue', 600, 2400, '44', 'raza', '123', 'ad'),
(15, 15, 'Luxury venue', 600, 1200, NULL, 'raza', '123', 'ad'),
(16, 16, 'Luxury venue', 600, 1200, '1', 'raza', '123', 'ad'),
(17, 17, 'Simple venue', 300, 900, '20A', 'raza', '123', 'ad'),
(18, 18, 'Simple venue', 300, 900, NULL, 'raza ahmed', '1233434', 'nz 56114\r\n4547894'),
(19, 19, 'Luxury venue', 600, 1200, NULL, 'raza ahmed', '1233434', 'abc street'),
(20, 20, 'Deluxe venue', 500, 1000, NULL, 'raza ahmed', '1233434', 'nz 56114\r\n4547894'),
(21, 21, 'Deluxe venue', 500, 4500, NULL, 'raza ahmed', '1233434', 'nz 56114\r\n4547894'),
(22, 22, 'Simple venue', 300, 1800, NULL, 'raza ahmed', '1233434', 'nz 56114\r\n4547894'),
(23, 23, 'Simple venue', 300, 1200, NULL, 'raza ahmed', '1233434', 'nz 56114\r\n4547894'),
(24, 24, 'Simple venue', 300, 1800, NULL, 'raza ahmed', '1233434', 'nz 56114\r\n4547894'),
(25, 25, 'Luxury venue', 600, 5400, NULL, 'raza ahmed', '1233434', 'nz 56114\r\n4547894'),
(26, 26, 'Luxury venue', 600, 2400, NULL, 'raza ahmed', '1233434', 'nz 56114\r\n4547894'),
(27, 27, 'Deluxe venue', 500, 4500, NULL, 'raza ahmed', '1233434', 'nz 56114\r\n4547894'),
(28, 28, 'Deluxe venue', 500, 3000, '2', 'raza ahmed@', '1233434', 'nz 56114\r\n4547894'),
(29, 29, 'Deluxe venue', 500, 6500, '1', 'hammad', '12334342433243', 'nz 56114\r\n4547894'),
(30, 30, 'Supreme deluxe venue', 900, 6300, NULL, 'tom', '1233434', 'nz 56114\r\n4547894'),
(31, 31, 'Deluxe venue', 500, 9500, '1', 'raza ahmed', '1233434', 'nz 56114\r\n4547894'),
(32, 32, 'Supreme deluxe venue', 900, 17100, '1', 'xxa', '1233434', 'nz 56114\r\n4547894'),
(33, 33, 'Deluxe venue', 500, 35500, '1', 'uu', '1233434', 'nz 56114\r\n4547894'),
(34, 34, 'Deluxe venue', 500, 5000, '1', 'raza ahmed', '1233434', 'nz 56114\r\n4547894'),
(35, 35, 'Deluxe venue', 500, 7500, '1', 'raza ahmed', '1233434', 'nz 56114\r\n4547894'),
(36, 36, 'Simple venue', 300, 5700, '1', 'raza ahmed', '1233434', 'nz 56114\r\n4547894'),
(37, 37, 'Deluxe venue', 500, 30000, '1', 'raza ahmed', '1233434', 'nz 56114\r\n4547894'),
(38, 38, 'Luxury venue', 600, 21000, NULL, 'raza ahmed 22', '12334345255', 'nz 56114\r\n4547894'),
(39, 39, 'Supreme deluxe venue', 900, 31500, NULL, 'raza ahmed22', '1233434', 'nz 56114\r\n4547894'),
(40, 40, 'Supreme deluxe venue', 900, 30600, NULL, 'tra', '1233434', 'nz 56114\r\n4547894'),
(41, 41, 'Supreme deluxe venue', 900, 49500, '1', 'traial', '1233434555', 'nz 56114\r\n4547894');

-- --------------------------------------------------------

--
-- Table structure for table `booking_order`
--

CREATE TABLE `booking_order` (
  `booking_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `venue_id` int(11) NOT NULL,
  `check_in` date NOT NULL,
  `check_out` date NOT NULL,
  `arrival` int(11) NOT NULL DEFAULT 0,
  `refund` int(11) DEFAULT NULL,
  `booking_status` varchar(100) NOT NULL DEFAULT 'booked',
  `order_id` varchar(150) NOT NULL,
  `trans_id` varchar(200) DEFAULT NULL,
  `trans_amt` int(11) NOT NULL,
  `trans_status` varchar(100) NOT NULL DEFAULT 'pending',
  `trans_resp_msg` varchar(200) DEFAULT NULL,
  `rate_review` int(11) DEFAULT NULL,
  `datentime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booking_order`
--

INSERT INTO `booking_order` (`booking_id`, `user_id`, `venue_id`, `check_in`, `check_out`, `arrival`, `refund`, `booking_status`, `order_id`, `trans_id`, `trans_amt`, `trans_status`, `trans_resp_msg`, `rate_review`, `datentime`) VALUES
(1, 2, 3, '2022-07-20', '2022-07-21', 0, NULL, 'pending', 'ORD_21055700', NULL, 0, 'pending', NULL, NULL, '2022-07-20 01:50:12'),
(2, 2, 3, '2022-07-20', '2022-07-22', 1, NULL, 'booked', 'ORD_24215693', '20220720111212800110168128204225279', 600, 'TXN_SUCCESS', 'Txn Success', NULL, '2022-07-20 02:14:44'),
(3, 2, 3, '2022-07-20', '2022-07-26', 0, 1, 'cancelled', 'ORD_26312547', '20220720111212800110168165603901976', 1800, 'TXN_SUCCESS', 'Txn Success', NULL, '2022-07-20 02:19:00'),
(4, 2, 6, '2022-07-20', '2022-07-25', 0, NULL, 'payment failed', 'ORD_28394638', '20220720111212800110168372503893816', 4500, 'TXN_FAILURE', 'Your payment has been declined by your bank. Please try again or use a different method to complete the payment.', NULL, '2022-07-20 02:30:52'),
(5, 2, 6, '2022-07-20', '2022-07-21', 0, 1, 'cancelled', 'ORD_22877860', '20220720111212800110168627705312020', 900, 'TXN_SUCCESS', 'Txn Success', NULL, '2022-07-20 02:32:09'),
(6, 2, 6, '2022-07-20', '2022-07-28', 1, NULL, 'booked', 'ORD_28689687', '20220720111212800110168303704048087', 7200, 'TXN_SUCCESS', 'Txn Success', 1, '2022-07-20 02:34:46'),
(7, 2, 6, '2022-07-29', '2022-07-30', 0, NULL, 'pending', 'ORD_24272313', NULL, 0, 'pending', NULL, NULL, '2022-07-29 01:13:42'),
(8, 2, 3, '2022-08-14', '2022-08-16', 0, 1, 'cancelled', 'ORD_22541670', '20220814111212800110168092803967754', 600, 'TXN_SUCCESS', 'Txn Success', NULL, '2022-08-14 01:16:05'),
(9, 2, 5, '2022-08-15', '2022-08-20', 1, NULL, 'booked', 'ORD_25267746', '20220815111212800110168656003990120', 3000, 'TXN_SUCCESS', 'Txn Success', 1, '2022-08-15 19:32:05'),
(10, 2, 5, '2022-08-18', '2022-08-21', 1, NULL, 'booked', 'ORD_27668816', '20220815111212800110168905703947446', 1800, 'TXN_SUCCESS', 'Txn Success', 1, '2022-08-15 19:32:58'),
(11, 2, 6, '2022-08-20', '2022-08-23', 1, NULL, 'booked', 'ORD_25750549', '20220820111212800110168431303975409', 2700, 'TXN_SUCCESS', 'Txn Success', 1, '2022-08-20 00:19:57'),
(12, 2, 3, '2022-08-20', '2022-08-24', 1, NULL, 'booked', 'ORD_2445093', '20220820111212800110168173403969278', 1200, 'TXN_SUCCESS', 'Txn Success', 1, '2022-08-20 00:20:23'),
(13, 2, 4, '2022-08-20', '2022-08-26', 1, NULL, 'booked', 'ORD_29233995', '20220820111212800110168584503978338', 3000, 'TXN_SUCCESS', 'Txn Success', 1, '2022-08-20 00:20:45'),
(14, 2, 5, '2022-08-20', '2022-08-24', 1, NULL, 'booked', 'ORD_28902800', '20220820111212800110168816503988359', 2400, 'TXN_SUCCESS', 'Txn Success', 1, '2022-08-20 00:21:06'),
(15, 2, 5, '2022-08-25', '2022-08-27', 0, 1, 'cancelled', 'ORD_2240367', '20220825111212800110168807304010818', 1200, 'TXN_SUCCESS', 'Txn Success', NULL, '2019-08-21 01:51:28'),
(16, 2, 5, '2022-08-26', '2022-08-28', 1, NULL, 'booked', 'ORD_28784829', '20220825111212800110168627505415606', 1200, 'TXN_SUCCESS', 'Txn Success', 1, '2022-08-25 01:52:04'),
(17, 2, 3, '2022-09-08', '2022-09-11', 1, NULL, 'booked', 'ORD_21289330', '20220908111212800110168809204050263', 900, 'TXN_SUCCESS', 'Txn Success', 0, '2022-09-08 01:15:30'),
(18, 5, 3, '2022-12-05', '2022-12-08', 0, NULL, 'pending', 'ORD_5585288', NULL, 0, 'pending', NULL, NULL, '2022-12-05 17:46:54'),
(19, 5, 5, '2023-02-19', '2023-02-21', 0, NULL, 'pending', 'ORD_56768570', NULL, 0, 'pending', NULL, NULL, '2023-02-19 02:10:07'),
(20, 5, 4, '2023-02-19', '2023-02-21', 0, NULL, 'pending', 'ORD_51476175', NULL, 0, 'pending', NULL, NULL, '2023-02-19 02:15:14'),
(21, 5, 4, '2023-02-19', '2023-02-28', 0, NULL, 'pending', 'ORD_52815559', NULL, 0, 'pending', NULL, NULL, '2023-02-19 02:17:16'),
(22, 5, 3, '2023-02-19', '2023-02-25', 0, NULL, 'pending', '', NULL, 0, 'pending', NULL, NULL, '2023-02-19 03:18:10'),
(23, 5, 3, '2023-02-19', '2023-02-23', 0, NULL, 'pending', '', NULL, 0, 'pending', NULL, NULL, '2023-02-19 03:18:37'),
(24, 5, 3, '2023-02-19', '2023-02-25', 0, NULL, 'pending', 'ORD_52875795', NULL, 0, 'pending', NULL, NULL, '2023-02-19 03:19:05'),
(25, 5, 5, '2023-02-19', '2023-02-28', 0, NULL, 'pending', 'ORD_52918232', NULL, 0, 'pending', NULL, NULL, '2023-02-19 21:13:52'),
(26, 5, 5, '2023-02-19', '2023-02-23', 0, NULL, 'pending', 'ORD_59838397', NULL, 0, 'pending', NULL, NULL, '2023-02-19 21:20:19'),
(27, 5, 4, '2023-02-19', '2023-02-28', 0, NULL, 'pending', 'ORD_57862732', NULL, 0, 'pending', NULL, NULL, '2023-02-19 21:58:18'),
(28, 5, 4, '2023-02-19', '2023-02-25', 1, NULL, 'booked', 'ORD_55125458', NULL, 0, 'pending', NULL, 1, '2023-02-19 22:00:03'),
(29, 5, 4, '2023-02-19', '2023-03-04', 1, NULL, 'booked', 'ORD_55557630', NULL, 0, 'pending', NULL, 1, '2023-02-19 22:01:16'),
(30, 5, 6, '2023-02-19', '2023-02-26', 0, 1, 'cancelled', 'ORD_51994931', NULL, 0, 'pending', NULL, NULL, '2023-02-19 22:21:30'),
(31, 5, 4, '2023-02-20', '2023-03-11', 1, NULL, 'booked', 'ORD_58836938', NULL, 0, 'pending', NULL, 0, '2023-02-20 01:12:09'),
(32, 5, 6, '2023-02-20', '2023-03-11', 1, NULL, 'booked', 'ORD_56037953', NULL, 0, 'pending', NULL, 0, '2023-02-20 02:03:32'),
(33, 5, 4, '2023-02-20', '2023-05-02', 1, NULL, 'booked', 'ORD_55798616', NULL, 0, 'pending', NULL, 0, '2023-02-20 02:34:23'),
(34, 5, 4, '2023-02-22', '2023-03-04', 1, NULL, 'booked', 'ORD_59105851', NULL, 0, 'pending', NULL, 0, '2023-02-20 02:36:02'),
(35, 5, 4, '2023-02-20', '2023-03-07', 1, NULL, 'booked', 'ORD_53112762', NULL, 0, 'pending', NULL, 0, '2023-02-20 02:38:44'),
(36, 5, 3, '2023-02-20', '2023-03-11', 1, NULL, 'booked', 'ORD_54767179', NULL, 0, 'pending', NULL, 0, '2023-02-20 18:18:47'),
(37, 5, 4, '2023-02-27', '2023-04-28', 1, NULL, 'booked', 'ORD_52956989', NULL, 0, 'pending', NULL, 0, '2023-02-27 00:13:21'),
(38, 5, 5, '2023-03-04', '2023-04-08', 0, NULL, 'booked', 'ORD_54708905', NULL, 0, 'pending', NULL, NULL, '2023-03-04 20:32:43'),
(39, 5, 6, '2023-03-04', '2023-04-08', 0, NULL, 'booked', 'ORD_56588233', NULL, 0, 'pending', NULL, NULL, '2023-03-04 20:52:41'),
(40, 5, 6, '2023-03-04', '2023-04-07', 0, NULL, 'booked', 'ORD_55454915', NULL, 0, 'pending', NULL, NULL, '2023-03-04 21:07:26'),
(41, 5, 6, '2023-03-04', '2023-04-28', 1, NULL, 'booked', 'ORD_5771058', NULL, 0, 'pending', NULL, 0, '2023-03-04 21:08:17');

-- --------------------------------------------------------

--
-- Table structure for table `carousel`
--

CREATE TABLE `carousel` (
  `sr_no` int(11) NOT NULL,
  `image` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `carousel`
--

INSERT INTO `carousel` (`sr_no`, `image`) VALUES
(4, 'IMG_62045.png'),
(5, 'IMG_93127.png'),
(6, 'IMG_99736.png'),
(8, 'IMG_40905.png'),
(9, 'IMG_55677.png');

-- --------------------------------------------------------

--
-- Table structure for table `contact_details`
--

CREATE TABLE `contact_details` (
  `sr_no` int(11) NOT NULL,
  `address` varchar(50) NOT NULL,
  `gmap` varchar(100) NOT NULL,
  `pn1` bigint(20) NOT NULL,
  `pn2` bigint(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `fb` varchar(100) NOT NULL,
  `insta` varchar(100) NOT NULL,
  `tw` varchar(100) NOT NULL,
  `iframe` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact_details`
--

INSERT INTO `contact_details` (`sr_no`, `address`, `gmap`, `pn1`, `pn2`, `email`, `fb`, `insta`, `tw`, `iframe`) VALUES
(1, 'XYZ, Prayagraj, Uttar Pradesh', 'https://goo.gl/maps/T1YM8d4fJsoczstd6', 918529636985, 91111222333558, 'ask.raza@gm.com', 'https://www.facebook.com/', 'https://www.facebook.com/', 'https://www.facebook.com/', 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d461321.73752665165!2d81.801585!3d25.402264!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x398534c9b20bd49f:0xa2237856ad4041a!2sPrayagraj, Uttar Pradesh!5e0!3m2!1sen!2sin!4v1644867099910!5m2!1sen!2sin');

-- --------------------------------------------------------

--
-- Table structure for table `facilities`
--

CREATE TABLE `facilities` (
  `id` int(11) NOT NULL,
  `icon` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `facilities`
--

INSERT INTO `facilities` (`id`, `icon`, `name`, `description`) VALUES
(13, 'IMG_43553.svg', 'Wifi', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Temporibus incidunt odio quos dolore commodi repudiandae tenetur.'),
(14, 'IMG_49949.svg', 'Air conditioner', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Temporibus incidunt odio quos dolore commodi repudiandae tenetur.'),
(15, 'IMG_41622.svg', 'Television', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Temporibus incidunt odio quos dolore commodi repudiandae tenetur.'),
(17, 'IMG_47816.svg', 'Spa', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Temporibus incidunt odio quos dolore commodi repudiandae tenetur.'),
(18, 'IMG_96423.svg', 'venue Heater', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Temporibus incidunt odio quos dolore commodi repudiandae tenetur.'),
(19, 'IMG_27079.svg', 'Geyser', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Temporibus incidunt odio quos dolore commodi repudiandae tenetur.');

-- --------------------------------------------------------

--
-- Table structure for table `features`
--

CREATE TABLE `features` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `features`
--

INSERT INTO `features` (`id`, `name`) VALUES
(13, 'bedvenue'),
(14, 'balcony'),
(15, 'kitchen'),
(17, 'sofa');

-- --------------------------------------------------------

--
-- Table structure for table `rating_review`
--

CREATE TABLE `rating_review` (
  `sr_no` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `venue_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `review` varchar(200) NOT NULL,
  `seen` int(11) NOT NULL DEFAULT 0,
  `datentime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rating_review`
--

INSERT INTO `rating_review` (`sr_no`, `booking_id`, `venue_id`, `user_id`, `rating`, `review`, `seen`, `datentime`) VALUES
(4, 14, 5, 2, 5, '1asdlkfj Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quos voluptate vero sed tempore illo atque beatae asperiores, adipisci dicta quia nisi voluptates impedit perspiciatis, nobis libero ', 1, '2022-08-20 00:22:25'),
(5, 13, 4, 2, 3, '2asdlkfj Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quos voluptate vero sed tempore illo atque beatae asperiores, adipisci dicta quia nisi voluptates impedit perspiciatis, nobis libero ', 1, '2022-08-20 00:22:30'),
(6, 12, 3, 2, 1, '3asdlkfj Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quos voluptate vero sed tempore illo atque beatae asperiores, adipisci dicta quia nisi voluptates impedit perspiciatis, nobis libero ', 1, '2022-08-20 00:22:34'),
(8, 14, 5, 2, 5, '1asdlkfj Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quos voluptate vero sed tempore illo atque beatae asperiores, adipisci dicta quia nisi voluptates impedit perspiciatis, nobis libero ', 1, '2022-08-20 00:22:25'),
(9, 12, 3, 2, 1, '3asdlkfj Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quos voluptate vero sed tempore illo atque beatae asperiores, adipisci dicta quia nisi voluptates impedit perspiciatis, nobis libero ', 1, '2022-08-20 00:22:34'),
(10, 12, 3, 2, 1, '3asdlkfj Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quos voluptate vero sed tempore illo atque beatae asperiores, adipisci dicta quia nisi voluptates impedit perspiciatis, nobis libero ', 1, '2022-08-20 00:22:34'),
(12, 29, 4, 5, 5, 'good event', 1, '2023-02-19 22:22:16'),
(13, 28, 4, 5, 2, 'not good venue', 1, '2023-02-19 22:24:40');

-- --------------------------------------------------------

--
-- Table structure for table `venues`
--

CREATE TABLE `venues` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `area` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `adult` int(11) NOT NULL,
  `children` int(11) NOT NULL,
  `description` varchar(350) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `removed` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `venues`
--

INSERT INTO `venues` (`id`, `name`, `area`, `price`, `quantity`, `adult`, `children`, `description`, `status`, `removed`) VALUES
(1, 'simple venue', 159, 58, 56, 12, 2, 'asdf asd', 1, 1),
(2, 'simple venue 2', 785, 159, 85, 452, 10, 'adfasdfa sd', 1, 1),
(3, 'Simple venue', 250, 300, 10, 5, 3, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quos voluptate vero sed tempore illo atque beatae asperiores, adipisci dicta quia nisi voluptates impedit perspiciatis, nobis libero culpa error officiis totam?Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quos voluptate vero sed tempore illo atque beatae asperiores, adipisci dic', 1, 0),
(4, 'Deluxe venue', 300, 500, 10, 3, 2, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quos voluptate vero sed tempore illo atque beatae asperiores, adipisci dicta quia nisi voluptates impedit perspiciatis, nobis libero culpa error officiis totam?Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quos voluptate vero sed tempore illo atque beatae asperiores, adipisci dic', 1, 0),
(5, 'Luxury venue', 600, 600, 2, 8, 6, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quos voluptate vero sed tempore illo atque beatae asperiores, adipisci dicta quia nisi voluptates impedit perspiciatis, nobis libero culpa error officiis totam?Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quos voluptate vero sed tempore illo atque beatae asperiores, adipisci dic', 1, 0),
(6, 'Supreme deluxe venue', 500, 900, 12, 9, 10, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quos voluptate vero sed tempore illo atque beatae asperiores, adipisci dicta quia nisi voluptates impedit perspiciatis, nobis libero culpa error officiis totam?Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quos voluptate vero sed tempore illo atque beatae asperiores, adipisci dic', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `venue_facilities`
--

CREATE TABLE `venue_facilities` (
  `sr_no` int(11) NOT NULL,
  `venue_id` int(11) NOT NULL,
  `facilities_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `venue_facilities`
--

INSERT INTO `venue_facilities` (`sr_no`, `venue_id`, `facilities_id`) VALUES
(29, 4, 14),
(30, 4, 18),
(31, 4, 19),
(35, 6, 13),
(36, 6, 14),
(37, 6, 18),
(38, 6, 19),
(39, 5, 13),
(40, 5, 14),
(41, 5, 18),
(46, 3, 14),
(47, 3, 15),
(48, 3, 18),
(49, 3, 19);

-- --------------------------------------------------------

--
-- Table structure for table `venue_features`
--

CREATE TABLE `venue_features` (
  `sr_no` int(11) NOT NULL,
  `venue_id` int(11) NOT NULL,
  `features_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `venue_features`
--

INSERT INTO `venue_features` (`sr_no`, `venue_id`, `features_id`) VALUES
(16, 4, 13),
(17, 4, 14),
(18, 4, 15),
(22, 6, 13),
(23, 6, 14),
(24, 6, 15),
(25, 5, 13),
(26, 5, 14),
(27, 5, 15),
(31, 3, 13),
(32, 3, 14),
(33, 3, 15),
(34, 3, 17);

-- --------------------------------------------------------

--
-- Table structure for table `venue_images`
--

CREATE TABLE `venue_images` (
  `sr_no` int(11) NOT NULL,
  `venue_id` int(11) NOT NULL,
  `image` varchar(150) NOT NULL,
  `thumb` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `venue_images`
--

INSERT INTO `venue_images` (`sr_no`, `venue_id`, `image`, `thumb`) VALUES
(15, 3, 'IMG_39782.png', 0),
(16, 3, 'IMG_65019.png', 1),
(17, 4, 'IMG_44867.png', 0),
(18, 4, 'IMG_78809.png', 1),
(19, 4, 'IMG_11892.png', 0),
(21, 5, 'IMG_17474.png', 0),
(22, 5, 'IMG_42663.png', 1),
(23, 5, 'IMG_70583.png', 0),
(24, 6, 'IMG_67761.png', 0),
(25, 6, 'IMG_69824.png', 1);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `sr_no` int(11) NOT NULL,
  `site_title` varchar(50) NOT NULL,
  `site_about` varchar(250) NOT NULL,
  `shutdown` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`sr_no`, `site_title`, `site_about`, `shutdown`) VALUES
(1, 'TJ Website', 'asdlkfj Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quos voluptate vero sed tempore illo atque beatae asperiores, adipisci dicta quia nisi voluptates impedit perspiciatis, nobis libero culpa error officiis totam?', 0);

-- --------------------------------------------------------

--
-- Table structure for table `team_details`
--

CREATE TABLE `team_details` (
  `sr_no` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `picture` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `team_details`
--

INSERT INTO `team_details` (`sr_no`, `name`, `picture`) VALUES
(9, 'person 1', 'IMG_69318.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user_cred`
--

CREATE TABLE `user_cred` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `address` varchar(120) NOT NULL,
  `phonenum` varchar(100) NOT NULL,
  `pincode` int(11) NOT NULL,
  `dob` date NOT NULL,
  `profile` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `is_verified` int(11) NOT NULL DEFAULT 0,
  `token` varchar(200) DEFAULT NULL,
  `t_expire` date DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `datentime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_cred`
--

INSERT INTO `user_cred` (`id`, `name`, `email`, `address`, `phonenum`, `pincode`, `dob`, `profile`, `password`, `is_verified`, `token`, `t_expire`, `status`, `datentime`) VALUES
(2, 'raza', 'raza@gmail.com', 'ad', '123', 123324, '2022-06-12', 'IMG_91058.jpeg', '$2y$10$2IsUjaIwxb/UuaR7abvUNOs/VKmwy848VPsNnswF4bIFRIMDE36zm', 1, NULL, NULL, 1, '2022-06-12 16:05:59'),
(5, 'raza ahmed', 'razaahmed305@gmail.com', 'nz 56114\r\n4547894', '1233434', 123, '2022-11-15', 'IMG_65062.jpeg', '$2y$10$PGGGZbvtkdC34C/X7BBtpOcA2uPc5MBL91VXDbWWW3EZVC5v4S17a', 1, NULL, NULL, 1, '2022-11-26 20:43:40');

-- --------------------------------------------------------

--
-- Table structure for table `user_queries`
--

CREATE TABLE `user_queries` (
  `sr_no` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(150) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `message` varchar(500) NOT NULL,
  `datentime` datetime NOT NULL DEFAULT current_timestamp(),
  `seen` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_queries`
--

INSERT INTO `user_queries` (`sr_no`, `name`, `email`, `subject`, `message`, `datentime`, `seen`) VALUES
(11, 'touseef', 'ask.raza@gmail.com', 'This is one subject', 'orem ipsum dolor sit amet, consectetur adipisicing elit. Quos voluptate vero sed tempore illo atque beatae asperiores, adipisci dicta quia nisi voluptates im', '2022-03-11 00:00:00', 1),
(13, 'tom', 'razaahmed305@gmail.com', 'ffgcf', 'adadavg', '2023-02-19 22:23:29', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_cred`
--
ALTER TABLE `admin_cred`
  ADD PRIMARY KEY (`sr_no`);

--
-- Indexes for table `booking_details`
--
ALTER TABLE `booking_details`
  ADD PRIMARY KEY (`sr_no`),
  ADD KEY `booking_id` (`booking_id`);

--
-- Indexes for table `booking_order`
--
ALTER TABLE `booking_order`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `venue_id` (`venue_id`);

--
-- Indexes for table `carousel`
--
ALTER TABLE `carousel`
  ADD PRIMARY KEY (`sr_no`);

--
-- Indexes for table `contact_details`
--
ALTER TABLE `contact_details`
  ADD PRIMARY KEY (`sr_no`);

--
-- Indexes for table `facilities`
--
ALTER TABLE `facilities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `features`
--
ALTER TABLE `features`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rating_review`
--
ALTER TABLE `rating_review`
  ADD PRIMARY KEY (`sr_no`),
  ADD KEY `booking_id` (`booking_id`),
  ADD KEY `venue_id` (`venue_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `venues`
--
ALTER TABLE `venues`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `venue_facilities`
--
ALTER TABLE `venue_facilities`
  ADD PRIMARY KEY (`sr_no`),
  ADD KEY `facilities id` (`facilities_id`),
  ADD KEY `venue id` (`venue_id`);

--
-- Indexes for table `venue_features`
--
ALTER TABLE `venue_features`
  ADD PRIMARY KEY (`sr_no`),
  ADD KEY `features id` (`features_id`),
  ADD KEY `rm id` (`venue_id`);

--
-- Indexes for table `venue_images`
--
ALTER TABLE `venue_images`
  ADD PRIMARY KEY (`sr_no`),
  ADD KEY `venue_id` (`venue_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`sr_no`);

--
-- Indexes for table `team_details`
--
ALTER TABLE `team_details`
  ADD PRIMARY KEY (`sr_no`);

--
-- Indexes for table `user_cred`
--
ALTER TABLE `user_cred`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_queries`
--
ALTER TABLE `user_queries`
  ADD PRIMARY KEY (`sr_no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_cred`
--
ALTER TABLE `admin_cred`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `booking_details`
--
ALTER TABLE `booking_details`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `booking_order`
--
ALTER TABLE `booking_order`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `carousel`
--
ALTER TABLE `carousel`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `contact_details`
--
ALTER TABLE `contact_details`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `facilities`
--
ALTER TABLE `facilities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `features`
--
ALTER TABLE `features`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `rating_review`
--
ALTER TABLE `rating_review`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `venues`
--
ALTER TABLE `venues`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `venue_facilities`
--
ALTER TABLE `venue_facilities`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `venue_features`
--
ALTER TABLE `venue_features`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `venue_images`
--
ALTER TABLE `venue_images`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `team_details`
--
ALTER TABLE `team_details`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `user_cred`
--
ALTER TABLE `user_cred`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_queries`
--
ALTER TABLE `user_queries`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking_details`
--
ALTER TABLE `booking_details`
  ADD CONSTRAINT `booking_details_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `booking_order` (`booking_id`);

--
-- Constraints for table `booking_order`
--
ALTER TABLE `booking_order`
  ADD CONSTRAINT `booking_order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_cred` (`id`),
  ADD CONSTRAINT `booking_order_ibfk_2` FOREIGN KEY (`venue_id`) REFERENCES `venues` (`id`);

--
-- Constraints for table `rating_review`
--
ALTER TABLE `rating_review`
  ADD CONSTRAINT `rating_review_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `booking_order` (`booking_id`),
  ADD CONSTRAINT `rating_review_ibfk_2` FOREIGN KEY (`venue_id`) REFERENCES `venues` (`id`),
  ADD CONSTRAINT `rating_review_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user_cred` (`id`);

--
-- Constraints for table `venue_facilities`
--
ALTER TABLE `venue_facilities`
  ADD CONSTRAINT `facilities id` FOREIGN KEY (`facilities_id`) REFERENCES `facilities` (`id`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `venue id` FOREIGN KEY (`venue_id`) REFERENCES `venues` (`id`) ON UPDATE NO ACTION;

--
-- Constraints for table `venue_features`
--
ALTER TABLE `venue_features`
  ADD CONSTRAINT `features id` FOREIGN KEY (`features_id`) REFERENCES `features` (`id`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `rm id` FOREIGN KEY (`venue_id`) REFERENCES `venues` (`id`) ON UPDATE NO ACTION;

--
-- Constraints for table `venue_images`
--
ALTER TABLE `venue_images`
  ADD CONSTRAINT `venue_images_ibfk_1` FOREIGN KEY (`venue_id`) REFERENCES `venues` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
