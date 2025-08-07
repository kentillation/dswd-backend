-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 07, 2025 at 04:13 AM
-- Server version: 8.3.0
-- PHP Version: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dswd_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tokenable_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `expires_at` timestamp NULL DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `expires_at`, `last_used_at`, `created_at`, `updated_at`) VALUES
(2, 'App\\Models\\AdminModel', 2, 'auth_token', '603c8ea3d8cc023bf06cfefff231aa47c5bfceeff1064c1c572dc8405f6226a5', '[\"*\"]', NULL, '2025-08-05 05:14:19', '2025-08-05 04:58:24', '2025-08-05 05:14:19'),
(10, 'App\\Models\\AdminModel', 2, 'auth_token', '9f66d421f528d94dbca027bbbb75b560d6e966f768ba7e1aec77da8cdfe55462', '[\"*\"]', NULL, '2025-08-07 04:10:39', '2025-08-07 02:42:28', '2025-08-07 04:10:39');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

DROP TABLE IF EXISTS `tbl_admin`;
CREATE TABLE IF NOT EXISTS `tbl_admin` (
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `admin_email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `admin_password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `admin_mpin` int NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`admin_id`, `admin_name`, `admin_email`, `admin_password`, `admin_mpin`, `created_at`, `updated_at`) VALUES
(2, 'Juan Delacruz', 'juandelacruz@gmail.com', '$2y$10$ZeAEMGewmBdbbo3PqUjI6OfzFC5SH6dL51oA4HvzYKhSlTGUGBljS', 123456, '2025-08-05 02:35:11', '2025-08-05 02:35:11');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_benefeciaries`
--

DROP TABLE IF EXISTS `tbl_benefeciaries`;
CREATE TABLE IF NOT EXISTS `tbl_benefeciaries` (
  `benefeciary_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `middle_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `benef_age` int NOT NULL,
  `address_line1` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `address_line2` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `address_line3` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `contact_number` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `gender_id` int NOT NULL,
  `suffix` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `bloodtype_id` int NOT NULL,
  `category_id` int NOT NULL,
  `registration_type_id` int NOT NULL,
  `benef_status_id` int NOT NULL,
  `user_id` int NOT NULL,
  `reference_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`benefeciary_id`),
  KEY `gender_id` (`gender_id`),
  KEY `blood_type_id` (`bloodtype_id`),
  KEY `category_id` (`category_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_benefeciaries`
--

INSERT INTO `tbl_benefeciaries` (`benefeciary_id`, `first_name`, `middle_name`, `last_name`, `benef_age`, `address_line1`, `address_line2`, `address_line3`, `contact_number`, `gender_id`, `suffix`, `bloodtype_id`, `category_id`, `registration_type_id`, `benef_status_id`, `user_id`, `reference_number`, `created_at`, `updated_at`) VALUES
(1, 'Joseph', 'Protacio', 'Rizal', 25, 'Purok Kamatis', 'Barangay Pob. II', 'Sagay City', '01234567890', 3, 'II', 2, 1, 1, 1, 2, '114928619302', '2025-08-07 03:19:48', '2025-08-07 03:39:14'),
(2, 'Juan', 'Tamad', 'Dela Cruz', 65, 'Purok Pag-asa', 'Baragay Plaridel', 'Sagay City', '01234565412', 2, NULL, 3, 2, 1, 1, 2, '526253728085', '2025-08-07 03:44:52', '2025-08-07 03:44:52');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_benef_history_modif`
--

DROP TABLE IF EXISTS `tbl_benef_history_modif`;
CREATE TABLE IF NOT EXISTS `tbl_benef_history_modif` (
  `benef_history_modif_id` int NOT NULL AUTO_INCREMENT,
  `benefeciary_id` int NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `manage_id` int NOT NULL,
  `user_id` int NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`benef_history_modif_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_benef_history_modif`
--

INSERT INTO `tbl_benef_history_modif` (`benef_history_modif_id`, `benefeciary_id`, `description`, `manage_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'First name: From [Jose] To [Joseph].', 2, 2, '2025-08-07 03:37:32', '2025-08-07 03:37:32'),
(2, 1, 'Gender: From [Male] To [Prefer not to say].', 2, 2, '2025-08-07 03:39:14', '2025-08-07 03:39:14');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bloodtype`
--

DROP TABLE IF EXISTS `tbl_bloodtype`;
CREATE TABLE IF NOT EXISTS `tbl_bloodtype` (
  `bloodtype_id` int NOT NULL AUTO_INCREMENT,
  `bloodtype_label` varchar(10) NOT NULL,
  PRIMARY KEY (`bloodtype_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_bloodtype`
--

INSERT INTO `tbl_bloodtype` (`bloodtype_id`, `bloodtype_label`) VALUES
(1, 'Type A'),
(2, 'Type B'),
(3, 'Type AB'),
(4, 'Type O+'),
(5, 'Type O-');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cashier`
--

DROP TABLE IF EXISTS `tbl_cashier`;
CREATE TABLE IF NOT EXISTS `tbl_cashier` (
  `cashier_id` int NOT NULL AUTO_INCREMENT,
  `cashier_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cashier_email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cashier_password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cashier_mpin` int NOT NULL,
  `shop_id` int NOT NULL,
  `branch_id` int NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`cashier_id`),
  KEY `branch_id` (`branch_id`),
  KEY `shop_id` (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_cashier`
--

INSERT INTO `tbl_cashier` (`cashier_id`, `cashier_name`, `cashier_email`, `cashier_password`, `cashier_mpin`, `shop_id`, `branch_id`, `created_at`, `updated_at`) VALUES
(1, 'Totskie', 'kent.cashier@test.com', '$2y$10$U7EAfR9wcoaPEPqDSv0w.efFoRQ8B/MXTRRRRNtyhlqLGsGCHgSwu', 654321, 1, 1, '2025-07-25 02:35:52', '2025-07-25 02:35:52');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

DROP TABLE IF EXISTS `tbl_category`;
CREATE TABLE IF NOT EXISTS `tbl_category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_label` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`category_id`, `category_label`, `created_at`, `updated_at`) VALUES
(1, 'PWD', '2025-08-05 06:25:26', '2025-08-05 06:25:26'),
(2, 'Senior Citizen', '2025-08-05 06:25:26', '2025-08-05 06:25:26');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_gender`
--

DROP TABLE IF EXISTS `tbl_gender`;
CREATE TABLE IF NOT EXISTS `tbl_gender` (
  `gender_id` int NOT NULL AUTO_INCREMENT,
  `gender_label` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`gender_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_gender`
--

INSERT INTO `tbl_gender` (`gender_id`, `gender_label`) VALUES
(1, 'Female'),
(2, 'Male'),
(3, 'Prefer not to say');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_products_history`
--

DROP TABLE IF EXISTS `tbl_products_history`;
CREATE TABLE IF NOT EXISTS `tbl_products_history` (
  `product_history_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `manage_id` int NOT NULL,
  `shop_id` int NOT NULL,
  `branch_id` int NOT NULL,
  `user_id` int NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`product_history_id`),
  KEY `product_id` (`product_id`),
  KEY `shop_id` (`shop_id`),
  KEY `branch_id` (`branch_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_products_history`
--

INSERT INTO `tbl_products_history` (`product_history_id`, `product_id`, `description`, `manage_id`, `shop_id`, `branch_id`, `user_id`, `created_at`, `updated_at`) VALUES
(42, 1, 'Size: From [-XL] To [- ].', 2, 1, 1, 1, '2025-07-11 01:05:50', '2025-07-11 01:05:50'),
(43, 4, 'Size: From [-XL] To [- ].', 2, 1, 1, 1, '2025-07-11 01:08:21', '2025-07-11 01:08:21'),
(44, 2, 'Price: From [₱15] To [₱20]. Size: From [-XL] To [- ].', 2, 1, 1, 1, '2025-07-11 07:26:22', '2025-07-11 07:26:22'),
(86, 1, 'Availability: From [Not available] To [Available].', 2, 1, 1, 2, '2025-07-18 01:49:28', '2025-07-18 01:49:28'),
(87, 315, 'Product name: From [(Promo)b1t1 coffee] To [(Promo)b1t1 coffeeeeeeee].', 2, 1, 1, 2, '2025-07-19 03:35:12', '2025-07-19 03:35:12'),
(88, 315, 'Product name: From [(Promo)b1t1 coffeeeeeeee] To [(Promo)b1t1 coffee].', 2, 1, 1, 2, '2025-07-19 03:36:01', '2025-07-19 03:36:01'),
(89, 317, 'Product name: From [1.5 coke] To [1.5 cokeeeee].', 2, 1, 1, 2, '2025-07-19 03:40:14', '2025-07-19 03:40:14'),
(90, 317, 'Product name: From [1.5 cokeeeee] To [1.5 coke].', 2, 1, 1, 2, '2025-07-19 03:40:30', '2025-07-19 03:40:30'),
(91, 315, 'Product name: From [(Promo)b1t1 coffee] To [(Promo)b1t1 coffeeeeeee].', 2, 1, 1, 2, '2025-07-19 03:44:43', '2025-07-19 03:44:43'),
(92, 315, 'Product name: From [(Promo)b1t1 coffeeeeeee] To [(Promo)b1t1 coffee].', 2, 1, 1, 2, '2025-07-19 03:44:54', '2025-07-19 03:44:54'),
(93, 315, 'Product name: From [(Promo)b1t1 coffee] To [(Promo)b1t1 coffeeeee].', 2, 1, 1, 2, '2025-07-19 03:47:13', '2025-07-19 03:47:13'),
(94, 315, 'Product name: From [(Promo)b1t1 coffeeeee] To [(Promo)b1t1 coffee].', 2, 1, 1, 2, '2025-07-19 03:47:57', '2025-07-19 03:47:57'),
(95, 315, 'Product name: From [(Promo)b1t1 coffee] To [(Promo)b1t1 coffeeeeee].', 2, 1, 1, 2, '2025-07-19 03:48:35', '2025-07-19 03:48:35'),
(96, 315, 'Product name: From [(Promo)b1t1 coffeeeeee] To [(Promo)b1t1 coffee].', 2, 1, 1, 2, '2025-07-19 03:53:10', '2025-07-19 03:53:10'),
(97, 315, 'Temperature: From [-Iced] To [-Hot].', 2, 1, 1, 2, '2025-07-19 03:53:20', '2025-07-19 03:53:20'),
(98, 315, 'Temperature: From [-Hot] To [-Iced].', 2, 1, 1, 2, '2025-07-19 03:53:29', '2025-07-19 03:53:29'),
(99, 315, 'Size: From [-XL] To [-L].', 2, 1, 1, 2, '2025-07-19 03:53:43', '2025-07-19 03:53:43'),
(100, 315, 'Size: From [-L] To [-XL].', 2, 1, 1, 2, '2025-07-19 03:53:49', '2025-07-19 03:53:49'),
(101, 315, 'Price: From [₱50] To [₱500].', 2, 1, 1, 2, '2025-07-19 03:54:13', '2025-07-19 03:54:13'),
(102, 315, 'Price: From [₱500] To [₱50].', 2, 1, 1, 2, '2025-07-19 03:54:22', '2025-07-19 03:54:22'),
(103, 315, 'Category: From [Coffee] To [Non-coffee].', 2, 1, 1, 2, '2025-07-19 03:54:35', '2025-07-19 03:54:35'),
(104, 315, 'Category: From [Non-coffee] To [Coffee].', 2, 1, 1, 2, '2025-07-19 03:54:46', '2025-07-19 03:54:46'),
(105, 315, 'Product name: From [(Promo)b1t1 coffee] To [(Promo)b1t1 coffeeeee].', 2, 1, 1, 2, '2025-07-19 03:57:20', '2025-07-19 03:57:20'),
(106, 315, 'Product name: From [(Promo)b1t1 coffeeeee] To [(Promo)b1t1 coffee].', 2, 1, 1, 2, '2025-07-19 03:57:34', '2025-07-19 03:57:34'),
(107, 315, 'Price: From [₱50] To [₱50000].', 2, 1, 1, 2, '2025-07-19 03:57:45', '2025-07-19 03:57:45'),
(108, 315, 'Price: From [₱50000] To [₱50].', 2, 1, 1, 2, '2025-07-19 03:57:56', '2025-07-19 03:57:56'),
(109, 315, 'Temperature: From [-Iced] To [-Hot].', 2, 1, 1, 2, '2025-07-19 03:58:26', '2025-07-19 03:58:26'),
(110, 315, 'Temperature: From [-Hot] To [-Iced].', 2, 1, 1, 2, '2025-07-19 04:00:32', '2025-07-19 04:00:32'),
(111, 315, 'Temperature: From [-Iced] To [-Hot].', 2, 1, 1, 2, '2025-07-19 04:00:45', '2025-07-19 04:00:45'),
(112, 315, 'Temperature: From [-Hot] To [-Iced].', 2, 1, 1, 2, '2025-07-19 04:02:52', '2025-07-19 04:02:52'),
(113, 315, 'Product name: From [(Promo)b1t1 coffee] To [(Promo)b1t1 coffeeeee].', 2, 1, 1, 2, '2025-07-19 04:03:05', '2025-07-19 04:03:05'),
(114, 315, 'Product name: From [(Promo)b1t1 coffeeeee] To [(Promo)b1t1 coffeeeee-Iced-XL]. Price: From [₱50] To [₱50000].', 2, 1, 1, 2, '2025-07-19 04:03:12', '2025-07-19 04:03:12'),
(115, 315, 'Price: From [₱500] To [₱50].', 2, 1, 1, 2, '2025-07-19 04:05:41', '2025-07-19 04:05:41'),
(116, 315, 'Price: From [₱50] To [₱50000].', 2, 1, 1, 2, '2025-07-19 04:06:25', '2025-07-19 04:06:25'),
(117, 315, 'Price: From [₱50000] To [₱50].', 2, 1, 1, 2, '2025-07-19 04:06:34', '2025-07-19 04:06:34'),
(118, 315, 'Price: From [₱50] To [₱5000].', 2, 1, 1, 2, '2025-07-19 04:07:47', '2025-07-19 04:07:47'),
(119, 315, 'Price: From [₱5000] To [₱50].', 2, 1, 1, 2, '2025-07-19 04:07:57', '2025-07-19 04:07:57'),
(120, 315, 'Product name: From [(Promo)b1t1 coffee] To [(Promo)b1t1 coffeeeee].', 2, 1, 1, 2, '2025-07-19 04:08:55', '2025-07-19 04:08:55'),
(121, 315, 'Product name: From [(Promo)b1t1 coffeeeee] To [(Promo)b1t1 coffee].', 2, 1, 1, 2, '2025-07-19 04:09:15', '2025-07-19 04:09:15'),
(122, 315, 'Product name: From [(Promo)b1t1 coffee] To [(Promo)b1t1 coffeeeee].', 2, 1, 1, 2, '2025-07-19 04:22:19', '2025-07-19 04:22:19'),
(123, 315, 'Product name: From [(Promo)b1t1 coffeeeee] To [(Promo)b1t1 coffee].', 2, 1, 1, 2, '2025-07-19 04:23:25', '2025-07-19 04:23:25'),
(124, 315, 'Product name: From [(Promo)b1t1 coffee] To [(Promo)b1t1 coffeeeeee].', 2, 1, 1, 2, '2025-07-19 04:25:38', '2025-07-19 04:25:38'),
(125, 315, 'Product name: From [(Promo)b1t1 coffeeeeee] To [(Promo)b1t1 coffee].', 2, 1, 1, 2, '2025-07-19 04:28:38', '2025-07-19 04:28:38'),
(126, 315, 'Product name: From [(Promo)b1t1 coffee] To [(Promo)b1t1 coffeeeeee].', 2, 1, 1, 2, '2025-07-19 04:32:34', '2025-07-19 04:32:34'),
(127, 315, 'Product name: From [(Promo)b1t1 coffeeeeee] To [(Promo)b1t1 coffee].', 2, 1, 1, 2, '2025-07-19 04:33:42', '2025-07-19 04:33:42'),
(128, 315, 'Product name: From [(Promo)b1t1 coffee] To [(Promo)b1t1 coffeeeee].', 2, 1, 1, 2, '2025-07-19 04:34:40', '2025-07-19 04:34:40'),
(129, 315, 'Product name: From [(Promo)b1t1 coffeeeee] To [(Promo)b1t1 coffee].', 2, 1, 1, 2, '2025-07-19 04:38:01', '2025-07-19 04:38:01'),
(130, 315, 'Product name: From [(Promo)b1t1 coffee] To [(Promo)b1t1 coffeeeee].', 2, 1, 1, 2, '2025-07-19 04:38:39', '2025-07-19 04:38:39'),
(131, 315, 'Product name: From [(Promo)b1t1 coffeeeee] To [(Promo)b1t1 coffee].', 2, 1, 1, 2, '2025-07-19 04:46:08', '2025-07-19 04:46:08'),
(132, 315, 'Price: From [₱50] To [₱50000].', 2, 1, 1, 2, '2025-07-19 04:46:20', '2025-07-19 04:46:20'),
(133, 315, 'Price: From [₱50000] To [₱50].', 2, 1, 1, 2, '2025-07-19 04:46:31', '2025-07-19 04:46:31'),
(134, 315, 'Temperature: From [-Iced] To [-Hot].', 2, 1, 1, 2, '2025-07-19 04:46:39', '2025-07-19 04:46:39'),
(135, 315, 'Size: From [-XL] To [-L].', 2, 1, 1, 2, '2025-07-19 04:46:57', '2025-07-19 04:46:57'),
(136, 315, 'Category: From [Coffee] To [Non-coffee].', 2, 1, 1, 2, '2025-07-19 04:47:20', '2025-07-19 04:47:20'),
(137, 315, 'Availability: From [Available] To [Not available].', 2, 1, 1, 2, '2025-07-19 04:47:32', '2025-07-19 04:47:32'),
(138, 315, 'Availability: From [Not available] To [Available].', 2, 1, 1, 2, '2025-07-19 04:47:43', '2025-07-19 04:47:43'),
(139, 315, 'Product name: From [(Promo)b1t1 coffee] To [(Promo)b1t1 coffeeeeee].', 2, 1, 1, 2, '2025-07-20 04:27:18', '2025-07-20 04:27:18'),
(140, 315, 'Product name: From [(Promo)b1t1 coffeeeeee] To [(Promo)b1t1 coffee].', 2, 1, 1, 2, '2025-07-20 04:27:27', '2025-07-20 04:27:27'),
(141, 3, 'Availability: From [Not available] To [Available].', 2, 1, 1, 2, '2025-07-20 04:40:49', '2025-07-20 04:40:49'),
(142, 1, 'Availability: From [Not available] To [Available].', 2, 1, 1, 2, '2025-07-20 04:41:09', '2025-07-20 04:41:09'),
(143, 315, 'Availability: From [Available] To [Not available].', 2, 1, 1, 2, '2025-07-20 04:46:33', '2025-07-20 04:46:33'),
(144, 315, 'Availability: From [Not available] To [Available].', 2, 1, 1, 2, '2025-07-20 04:48:45', '2025-07-20 04:48:45'),
(145, 315, 'Availability: From [Available] To [Not available].', 2, 1, 1, 2, '2025-07-20 04:50:56', '2025-07-20 04:50:56'),
(146, 315, 'Availability: From [Not available] To [Available].', 2, 1, 1, 2, '2025-07-20 04:51:30', '2025-07-20 04:51:30'),
(147, 315, 'Availability: From [Available] To [Not available].', 2, 1, 1, 2, '2025-07-20 05:07:17', '2025-07-20 05:07:17'),
(148, 315, 'Availability: From [Not available] To [Available].', 2, 1, 1, 2, '2025-07-20 05:07:27', '2025-07-20 05:07:27'),
(149, 315, 'Category: From [Non-coffee] To [Coffee].', 2, 1, 1, 2, '2025-07-20 05:07:35', '2025-07-20 05:07:35'),
(150, 315, 'Size: From [-L] To [-R].', 2, 1, 1, 2, '2025-07-20 05:08:02', '2025-07-20 05:08:02'),
(151, 315, 'Temperature: From [-Hot] To [-Iced].', 2, 1, 1, 2, '2025-07-20 05:08:07', '2025-07-20 05:08:07'),
(152, 655, 'New Product Saved', 1, 1, 2, 2, '2025-07-21 07:43:27', '2025-07-21 07:43:27'),
(153, 656, 'New Product Saved', 1, 1, 2, 2, '2025-07-21 07:43:27', '2025-07-21 07:43:27'),
(154, 655, 'Price: From [₱50] To [₱25]. Size: From [-S] To [-R].', 2, 1, 2, 2, '2025-07-21 07:45:04', '2025-07-21 07:45:04'),
(155, 655, 'Unit usage: From [2.5] To [2.8].', 2, 1, 2, 2, '2025-07-21 07:46:00', '2025-07-21 07:46:00'),
(156, 315, 'Availability: From [Available] To [Not available].', 2, 1, 1, 2, '2025-07-22 00:56:38', '2025-07-22 00:56:38'),
(157, 324, 'Temperature: From [- ] To [-Iced].', 2, 1, 1, 2, '2025-07-22 01:08:25', '2025-07-22 01:08:25'),
(158, 324, 'Size: From [-XL] To [-R].', 2, 1, 1, 2, '2025-07-22 01:08:43', '2025-07-22 01:08:43'),
(159, 324, 'Category: From [Liquors] To [-].', 2, 1, 1, 2, '2025-07-22 01:08:55', '2025-07-22 01:08:55'),
(160, 324, 'Category: From [-] To [Liquors].', 2, 1, 1, 2, '2025-07-22 01:09:06', '2025-07-22 01:09:06'),
(161, 324, 'Availability: From [Available] To [Not available].', 2, 1, 1, 2, '2025-07-22 01:09:14', '2025-07-22 01:09:14'),
(162, 324, 'Availability: From [Not available] To [Available].', 2, 1, 1, 2, '2025-07-22 01:15:13', '2025-07-22 01:15:13'),
(163, 315, 'Availability: From [Not available] To [Available].', 2, 1, 1, 2, '2025-07-22 01:15:20', '2025-07-22 01:15:20'),
(164, 324, 'Product name: From [Stallion] To [Stallionnnnn].', 2, 1, 1, 2, '2025-07-22 01:32:56', '2025-07-22 01:32:56'),
(165, 324, 'Product name: From [Stallionnnnn] To [Stallion].', 2, 1, 1, 2, '2025-07-22 01:34:17', '2025-07-22 01:34:17'),
(166, 324, 'Product name: From [Stallion] To [Stallionnnn].', 2, 1, 1, 2, '2025-07-22 01:35:34', '2025-07-22 01:35:34'),
(167, 324, 'Product name: From [Stallionnnn] To [Stallion].', 2, 1, 1, 2, '2025-07-22 01:35:47', '2025-07-22 01:35:47'),
(168, 324, 'Price: From [₱70] To [₱700].', 2, 1, 1, 2, '2025-07-22 01:36:09', '2025-07-22 01:36:09'),
(169, 324, 'Price: From [₱700] To [₱70].', 2, 1, 1, 2, '2025-07-22 01:37:03', '2025-07-22 01:37:03'),
(170, 324, 'Temperature: From [-Iced] To [-Hot].', 2, 1, 1, 2, '2025-07-22 01:37:18', '2025-07-22 01:37:18'),
(171, 324, 'Temperature: From [-Hot] To [-Iced].', 2, 1, 1, 2, '2025-07-22 01:37:28', '2025-07-22 01:37:28'),
(172, 324, 'Temperature: From [-Iced] To [-Hot].', 2, 1, 1, 2, '2025-07-22 01:40:52', '2025-07-22 01:40:52'),
(173, 324, 'Temperature: From [-Hot] To [-Iced].', 2, 1, 1, 2, '2025-07-22 01:41:52', '2025-07-22 01:41:52'),
(174, 324, 'Category: From [Liquors] To [-].', 2, 1, 1, 2, '2025-07-22 01:42:46', '2025-07-22 01:42:46'),
(175, 324, 'Category: From [-] To [Liquors].', 2, 1, 1, 2, '2025-07-22 01:42:54', '2025-07-22 01:42:54'),
(176, 324, 'Temperature: From [-Iced] To [-Hot].', 2, 1, 1, 2, '2025-07-22 01:44:51', '2025-07-22 01:44:51'),
(177, 324, 'Temperature: From [-Hot] To [-Iced].', 2, 1, 1, 2, '2025-07-22 01:45:02', '2025-07-22 01:45:02'),
(178, 324, 'Temperature: From [-Iced] To [-Hot].', 2, 1, 1, 2, '2025-07-22 01:50:09', '2025-07-22 01:50:09'),
(179, 324, 'Temperature: From [-Hot] To [-Iced].', 2, 1, 1, 2, '2025-07-22 01:50:20', '2025-07-22 01:50:20'),
(180, 324, 'Category: From [Liquors] To [-].', 2, 1, 1, 2, '2025-07-22 01:52:31', '2025-07-22 01:52:31'),
(181, 324, 'Category: From [-] To [Liquors].', 2, 1, 1, 2, '2025-07-22 01:52:43', '2025-07-22 01:52:43'),
(182, 324, 'Category: From [Liquors] To [-].', 2, 1, 1, 2, '2025-07-22 01:55:45', '2025-07-22 01:55:45'),
(183, 324, 'Category: From [-] To [Liquors].', 2, 1, 1, 2, '2025-07-22 01:55:57', '2025-07-22 01:55:57'),
(184, 324, 'Product name: From [Stallion] To [Stallionnnn].', 2, 1, 1, 2, '2025-07-22 01:58:46', '2025-07-22 01:58:46'),
(185, 324, 'Price: From [₱70] To [₱700].', 2, 1, 1, 2, '2025-07-22 01:58:55', '2025-07-22 01:58:55'),
(186, 324, 'Category: From [Liquors] To [Sinkers].', 2, 1, 1, 2, '2025-07-22 01:59:01', '2025-07-22 01:59:01'),
(187, 324, 'Category: From [Sinkers] To [Liquors]. Product name: From [Stallionnnn] To [Stallion]. Price: From [₱700] To [₱70].', 2, 1, 1, 2, '2025-07-22 01:59:12', '2025-07-22 01:59:12'),
(188, 324, 'Availability: From [Available] To [Not available].', 2, 1, 1, 2, '2025-07-22 01:59:17', '2025-07-22 01:59:17'),
(189, 324, 'Availability: From [Not available] To [Available].', 2, 1, 1, 2, '2025-07-22 01:59:39', '2025-07-22 01:59:39'),
(190, 324, 'Temperature: From [-Iced] To [-Hot].', 2, 1, 1, 2, '2025-07-22 02:10:10', '2025-07-22 02:10:10'),
(191, 324, 'Temperature: From [-Hot] To [-Iced].', 2, 1, 1, 2, '2025-07-22 02:10:16', '2025-07-22 02:10:16'),
(192, 324, 'Temperature: From [-Iced] To [-Hot].', 2, 1, 1, 2, '2025-07-22 02:16:34', '2025-07-22 02:16:34'),
(193, 324, 'Size: From [-R] To [-S].', 2, 1, 1, 2, '2025-07-22 02:16:44', '2025-07-22 02:16:44'),
(194, 324, 'Price: From [₱70] To [₱70000].', 2, 1, 1, 2, '2025-07-22 02:16:55', '2025-07-22 02:16:55'),
(195, 324, 'Price: From [₱70000] To [₱70].', 2, 1, 1, 2, '2025-07-22 02:17:01', '2025-07-22 02:17:01'),
(196, 324, 'Category: From [Liquors] To [Platters].', 2, 1, 1, 2, '2025-07-22 02:17:08', '2025-07-22 02:17:08'),
(197, 324, 'Availability: From [Available] To [Not available].', 2, 1, 1, 2, '2025-07-22 02:17:14', '2025-07-22 02:17:14'),
(198, 324, 'Availability: From [Not available] To [Available].', 2, 1, 1, 2, '2025-07-22 02:18:03', '2025-07-22 02:18:03'),
(199, 324, 'Category: From [Platters] To [Liquors]. Size: From [-S] To [-R]. Temperature: From [-Hot] To [-Iced].', 2, 1, 1, 2, '2025-07-22 02:18:17', '2025-07-22 02:18:17'),
(200, 324, 'Temperature: From [-Iced] To [-Hot].', 2, 1, 1, 2, '2025-07-22 02:23:53', '2025-07-22 02:23:53'),
(201, 324, 'Size: From [-R] To [-S].', 2, 1, 1, 2, '2025-07-22 02:23:59', '2025-07-22 02:23:59'),
(202, 324, 'Price: From [₱70] To [₱700].', 2, 1, 1, 2, '2025-07-22 02:24:05', '2025-07-22 02:24:05'),
(203, 324, 'Category: From [Liquors] To [Platters].', 2, 1, 1, 2, '2025-07-22 02:24:11', '2025-07-22 02:24:11'),
(204, 324, 'Availability: From [Available] To [Not available].', 2, 1, 1, 2, '2025-07-22 02:24:17', '2025-07-22 02:24:17'),
(205, 324, 'Product name: From [Stallion] To [Stallionnn].', 2, 1, 1, 2, '2025-07-22 02:24:25', '2025-07-22 02:24:25'),
(206, 324, 'Availability: From [Not available] To [Available]. Category: From [Platters] To [Liquors]. Product name: From [Stallionnn] To [Stallion]. Price: From [₱700] To [₱70]. Size: From [-S] To [-R]. Temperature: From [-Hot] To [-Iced].', 2, 1, 1, 2, '2025-07-22 02:24:41', '2025-07-22 02:24:41'),
(207, 1, 'Product name: From [native] To [Nativeeee].', 2, 1, 1, 2, '2025-07-22 02:52:37', '2025-07-22 02:52:37'),
(208, 1, 'Temperature: From [-Hot] To [-Iced].', 2, 1, 1, 2, '2025-07-22 02:52:52', '2025-07-22 02:52:52'),
(209, 1, 'Price: From [₱15] To [₱155].', 2, 1, 1, 2, '2025-07-22 02:52:58', '2025-07-22 02:52:58'),
(210, 1, 'Category: From [Coffee] To [Non-coffee].', 2, 1, 1, 2, '2025-07-22 02:53:06', '2025-07-22 02:53:06'),
(211, 1, 'Availability: From [Available] To [Not available].', 2, 1, 1, 2, '2025-07-22 02:53:13', '2025-07-22 02:53:13'),
(212, 1, 'Availability: From [Not available] To [Available]. Category: From [Non-coffee] To [Coffee]. Product name: From [Nativeeee] To [Native]. Price: From [₱155] To [₱15]. Size: From [- ] To [-R]. Temperature: From [-Iced] To [-Hot].', 2, 1, 1, 2, '2025-07-22 02:53:35', '2025-07-22 02:53:35'),
(213, 1, 'Product name: From [Native] To [Nativeeee].', 2, 1, 1, 2, '2025-07-22 03:05:20', '2025-07-22 03:05:20'),
(214, 1, 'Product name: From [Nativeeee] To [Native].', 2, 1, 1, 2, '2025-07-22 03:11:56', '2025-07-22 03:11:56'),
(215, 1, 'Price: From [₱15] To [₱155].', 2, 1, 1, 2, '2025-07-22 03:12:26', '2025-07-22 03:12:26'),
(216, 1, 'Price: From [₱155] To [₱15].', 2, 1, 1, 2, '2025-07-22 03:12:45', '2025-07-22 03:12:45'),
(217, 1, 'Product name: From [Native] To [Nativeee].', 2, 1, 1, 2, '2025-07-22 03:15:40', '2025-07-22 03:15:40'),
(218, 1, 'Product name: From [Nativeee] To [Native].', 2, 1, 1, 2, '2025-07-22 03:22:28', '2025-07-22 03:22:28'),
(219, 1, 'Price: From [₱15] To [₱155].', 2, 1, 1, 2, '2025-07-22 03:25:12', '2025-07-22 03:25:12'),
(220, 1, 'Price: From [₱155] To [₱15].', 2, 1, 1, 2, '2025-07-22 03:25:25', '2025-07-22 03:25:25'),
(221, 1, 'Product name: From [Native] To [Nativeee].', 2, 1, 1, 2, '2025-07-22 03:26:15', '2025-07-22 03:26:15'),
(222, 1, 'Product name: From [Nativeee] To [Native].', 2, 1, 1, 2, '2025-07-22 03:28:28', '2025-07-22 03:28:28'),
(223, 1, 'Product name: From [Native] To [Nativee].', 2, 1, 1, 2, '2025-07-22 03:35:40', '2025-07-22 03:35:40'),
(224, 1, 'Price: From [₱15] To [₱155].', 2, 1, 1, 2, '2025-07-22 03:35:48', '2025-07-22 03:35:48'),
(225, 1, 'Temperature: From [-Hot] To [-Iced].', 2, 1, 1, 2, '2025-07-22 03:35:54', '2025-07-22 03:35:54'),
(226, 1, 'Size: From [-R] To [-S].', 2, 1, 1, 2, '2025-07-22 03:36:00', '2025-07-22 03:36:00'),
(227, 1, 'Category: From [Coffee] To [Non-coffee].', 2, 1, 1, 2, '2025-07-22 03:36:07', '2025-07-22 03:36:07'),
(228, 1, 'Availability: From [Available] To [Not available].', 2, 1, 1, 2, '2025-07-22 03:36:13', '2025-07-22 03:36:13'),
(229, 1, 'Availability: From [Not available] To [Available]. Category: From [Non-coffee] To [Coffee]. Product name: From [Nativee] To [Native]. Price: From [₱155] To [₱15]. Size: From [-S] To [-R]. Temperature: From [-Iced] To [-Hot].', 2, 1, 1, 2, '2025-07-22 03:36:29', '2025-07-22 03:36:29'),
(230, 1, 'Price: From [₱15] To [₱155].', 2, 1, 1, 2, '2025-07-22 03:53:57', '2025-07-22 03:53:57'),
(231, 1, 'Price: From [₱155] To [₱155.5].', 2, 1, 1, 2, '2025-07-22 03:54:25', '2025-07-22 03:54:25'),
(232, 1, 'Price: From [₱155.5] To [₱15].', 2, 1, 1, 2, '2025-07-22 03:54:48', '2025-07-22 03:54:48'),
(233, 656, 'Availability: From [Not available] To [Available].', 2, 1, 2, 2, '2025-07-24 11:11:41', '2025-07-24 11:11:41'),
(234, 655, 'Availability: From [Not available] To [Available].', 2, 1, 2, 2, '2025-07-24 11:11:47', '2025-07-24 11:11:47'),
(235, 657, 'New Product Saved', 1, 1, 1, 2, '2025-07-24 14:28:58', '2025-07-24 14:28:58'),
(236, 657, 'Availability: From [Not available] To [Available]. Product name: From [test1] To [Test1].', 2, 1, 1, 1, '2025-07-25 23:47:45', '2025-07-25 23:47:45'),
(237, 657, 'Availability: From [Available] To [Not available].', 2, 1, 1, 1, '2025-08-01 01:45:05', '2025-08-01 01:45:05'),
(238, 657, 'Availability: From [Not available] To [Available].', 2, 1, 1, 1, '2025-08-01 01:45:22', '2025-08-01 01:45:22'),
(239, 657, 'Availability: From [Available] To [Not available].', 2, 1, 1, 1, '2025-08-01 10:35:57', '2025-08-01 10:35:57'),
(240, 657, 'Availability: From [Not available] To [Available].', 2, 1, 1, 1, '2025-08-01 10:36:06', '2025-08-01 10:36:06');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_shop`
--

DROP TABLE IF EXISTS `tbl_shop`;
CREATE TABLE IF NOT EXISTS `tbl_shop` (
  `shop_id` int NOT NULL AUTO_INCREMENT,
  `shop_name` varchar(50) NOT NULL,
  `shop_owner` varchar(50) NOT NULL,
  `shop_location` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `shop_email` varchar(50) NOT NULL,
  `shop_contact_number` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `shop_theme` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `shop_logo_link` text,
  `shop_status_id` int NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`shop_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_shop`
--

INSERT INTO `tbl_shop` (`shop_id`, `shop_name`, `shop_owner`, `shop_location`, `shop_email`, `shop_contact_number`, `shop_theme`, `shop_logo_link`, `shop_status_id`, `created_at`, `updated_at`) VALUES
(1, 'DSWD PH', 'Juan Dela Cruz', 'Bacolod City, Negros Occidental, Philippines', 'dswdph@gmail.com', '123456789000', NULL, NULL, 1, '2025-07-25 02:35:52', '2025-07-25 02:35:52');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_shop_branch`
--

DROP TABLE IF EXISTS `tbl_shop_branch`;
CREATE TABLE IF NOT EXISTS `tbl_shop_branch` (
  `branch_id` int NOT NULL AUTO_INCREMENT,
  `shop_id` int NOT NULL,
  `branch_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `branch_location` text NOT NULL,
  `m_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `m_email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `contact` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `staff_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `status_id` int NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`branch_id`),
  KEY `shop_id` (`shop_id`),
  KEY `status_id` (`status_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_shop_branch`
--

INSERT INTO `tbl_shop_branch` (`branch_id`, `shop_id`, `branch_name`, `branch_location`, `m_name`, `m_email`, `contact`, `staff_name`, `status_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'Main', 'Bacolod City, Negros Occidental, Philippines', 'Toto', 'toto@gmail.com', '000987654321', '', 1, '2025-07-25 02:35:52', '2025-07-25 02:35:52');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_signedup_status`
--

DROP TABLE IF EXISTS `tbl_signedup_status`;
CREATE TABLE IF NOT EXISTS `tbl_signedup_status` (
  `signedup_status_id` int NOT NULL AUTO_INCREMENT,
  `signedup` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`signedup_status_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_signedup_status`
--

INSERT INTO `tbl_signedup_status` (`signedup_status_id`, `signedup`) VALUES
(1, 'Pending'),
(2, 'Ready'),
(3, 'Served');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_size`
--

DROP TABLE IF EXISTS `tbl_size`;
CREATE TABLE IF NOT EXISTS `tbl_size` (
  `size_id` int NOT NULL AUTO_INCREMENT,
  `size_label` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`size_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_size`
--

INSERT INTO `tbl_size` (`size_id`, `size_label`) VALUES
(1, '- '),
(2, '-R'),
(3, '-S'),
(4, '-M'),
(5, '-L'),
(6, '-XL');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_status`
--

DROP TABLE IF EXISTS `tbl_status`;
CREATE TABLE IF NOT EXISTS `tbl_status` (
  `status_id` int NOT NULL AUTO_INCREMENT,
  `status_name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_status`
--

INSERT INTO `tbl_status` (`status_id`, `status_name`, `description`) VALUES
(1, 'Active', NULL),
(2, 'Inactive', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_temp`
--

DROP TABLE IF EXISTS `tbl_temp`;
CREATE TABLE IF NOT EXISTS `tbl_temp` (
  `temp_id` int NOT NULL AUTO_INCREMENT,
  `temp_label` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`temp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_temp`
--

INSERT INTO `tbl_temp` (`temp_id`, `temp_label`) VALUES
(1, '-Hot'),
(2, '-Iced'),
(3, '- ');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transaction_void`
--

DROP TABLE IF EXISTS `tbl_transaction_void`;
CREATE TABLE IF NOT EXISTS `tbl_transaction_void` (
  `transaction_void_id` int NOT NULL AUTO_INCREMENT,
  `reference_number` varchar(20) NOT NULL,
  `transaction_id` int NOT NULL,
  `table_number` int NOT NULL,
  `product_id` int NOT NULL,
  `from_quantity` int NOT NULL,
  `to_quantity` int NOT NULL,
  `void_status_id` int NOT NULL,
  `user_id` int NOT NULL,
  `shop_id` int NOT NULL,
  `branch_id` int NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`transaction_void_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_transaction_void`
--

INSERT INTO `tbl_transaction_void` (`transaction_void_id`, `reference_number`, `transaction_id`, `table_number`, `product_id`, `from_quantity`, `to_quantity`, `void_status_id`, `user_id`, `shop_id`, `branch_id`, `created_at`, `updated_at`) VALUES
(2, '465983794691', 2, 1, 1, 2, 1, 2, 1, 1, 1, '2025-08-01 01:25:45', '2025-08-01 01:44:45');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_void_status`
--

DROP TABLE IF EXISTS `tbl_void_status`;
CREATE TABLE IF NOT EXISTS `tbl_void_status` (
  `void_status_id` int NOT NULL AUTO_INCREMENT,
  `void_status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`void_status_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_void_status`
--

INSERT INTO `tbl_void_status` (`void_status_id`, `void_status`) VALUES
(1, 'Pending'),
(2, 'Confirmed');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `device_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_id` int NOT NULL,
  `branch_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `device_name`, `remember_token`, `shop_id`, `branch_id`, `created_at`, `updated_at`) VALUES
(1, 'Toto', 'test@test.com', NULL, '$2y$10$IFsBaG5T.S/3Q.MIb65FMOf8w07em0XWJ3TpuVOCD4d/T612hDXq.', 'Desktop', NULL, 1, 1, '2025-03-11 05:05:49', '2025-03-11 05:05:49');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
