-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 12, 2022 at 07:09 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eco`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `color_id` int(11) DEFAULT NULL,
  `size_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `customer_id`, `product_id`, `color_id`, `size_id`, `quantity`, `created_at`, `updated_at`) VALUES
(10, 1, 7, 3, 2, 2, '2022-06-10 17:12:02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `added_by` int(11) NOT NULL,
  `category_image` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `added_by`, `category_image`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Electronics', 10, '1.jpg', NULL, '2022-05-15 19:26:20', '2022-05-15 19:26:22'),
(2, 'Fashion', 10, '2.jpg', NULL, '2022-05-15 19:27:36', '2022-05-15 19:27:38'),
(3, 'Home & Lifestyle', 10, '3.jpg', NULL, '2022-05-15 19:28:37', '2022-05-15 19:28:38'),
(4, 'Mobile', 10, '4.jpg', NULL, '2022-05-15 19:29:03', '2022-05-15 19:29:05'),
(6, 'Man', 10, '6.jpg', NULL, '2022-05-15 19:30:00', '2022-05-15 19:30:02'),
(7, 'Woman', 10, '7.jpg', NULL, '2022-05-15 19:30:17', '2022-05-15 19:30:17');

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `color_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `color_name`, `color_code`, `created_at`, `updated_at`) VALUES
(1, 'red', '#FF0000', '2022-05-17 03:53:54', NULL),
(2, 'blue', '#0000FF', '2022-05-17 03:55:21', NULL),
(3, 'green', '#00FF00', '2022-05-17 03:57:14', NULL),
(4, 'yellow', '#FFFF00', '2022-05-17 03:57:38', NULL),
(5, 'purple', '#6a0dad', '2022-05-17 03:58:13', NULL),
(6, 'NA', '#0000000000', '2022-05-17 20:21:04', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_logins`
--

CREATE TABLE `customer_logins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_logins`
--

INSERT INTO `customer_logins` (`id`, `name`, `password`, `email`, `created_at`, `updated_at`) VALUES
(1, 'cowejixi', '$2y$10$P5FLq8LNfG0ei8/YZyvCke6anUISI/62pVlXvZcHEaJvBrax5lh0a', 'cyxu@mailinator.com', '2022-06-03 18:43:32', NULL),
(2, 'hetac', '$2y$10$uSVuFUnk..mNSKpqedy9bOOZLwzqVd2VthclK/VKqx4bZjgUJ5yG6', 'qekar@mailinator.com', '2022-06-03 19:37:56', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventories`
--

CREATE TABLE `inventories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `color_id` int(11) NOT NULL,
  `size_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inventories`
--

INSERT INTO `inventories` (`id`, `product_id`, `color_id`, `size_id`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 7, 1, 1, 20, '2022-05-22 19:19:43', NULL),
(2, 7, 3, 2, 50, '2022-05-22 19:19:55', NULL),
(3, 7, 4, 4, 50, '2022-05-22 19:20:03', NULL),
(4, 7, 1, 2, 35, '2022-05-22 19:20:13', '2022-05-24 19:24:30'),
(5, 1, 1, 1, 20, '2022-05-24 19:18:29', NULL),
(6, 1, 1, 2, 10, '2022-05-24 19:18:37', NULL),
(7, 1, 1, 5, 5, '2022-05-24 19:18:45', NULL),
(8, 1, 2, 5, 5, '2022-05-24 19:19:04', NULL),
(9, 1, 4, 3, 10, '2022-05-24 19:19:14', NULL),
(10, 2, 1, 5, 10, '2022-05-24 19:19:38', NULL),
(11, 2, 5, 3, 20, '2022-05-24 19:19:47', NULL),
(12, 3, 1, 3, 5, '2022-05-24 19:20:14', NULL),
(13, 3, 3, 5, 50, '2022-05-24 19:20:22', NULL),
(14, 4, 1, 2, 10, '2022-05-24 19:23:41', NULL),
(15, 4, 3, 4, 10, '2022-05-24 19:23:48', NULL),
(16, 4, 5, 1, 20, '2022-05-24 19:24:11', NULL),
(17, 8, 1, 1, 10, '2022-05-24 19:24:46', NULL),
(18, 8, 2, 3, 50, '2022-05-24 19:24:52', NULL),
(19, 8, 4, 3, 5, '2022-05-24 19:25:06', NULL),
(20, 6, 3, 4, 10, '2022-05-24 19:25:35', NULL),
(21, 6, 1, 3, 10, '2022-05-24 19:25:44', NULL),
(22, 6, 5, 5, 50, '2022-05-24 19:25:52', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2022_04_01_153643_create_categories_table', 2),
(10, '2022_04_08_220120_create_subcategories_table', 3),
(11, '2022_04_18_002812_create_products_table', 3),
(12, '2022_04_24_011304_create_thumbnails_table', 3),
(15, '2022_05_17_092357_create_colors_table', 4),
(16, '2022_05_17_092436_create_sizes_table', 4),
(18, '2022_05_18_011927_create_inventories_table', 5),
(19, '2022_06_04_001052_create_customer_logins_table', 6),
(20, '2022_06_05_120109_create_carts_table', 7);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `subcategory_id` int(11) DEFAULT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_price` int(11) NOT NULL,
  `discount` int(11) DEFAULT NULL,
  `after_discount` int(11) DEFAULT NULL,
  `short_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `long_description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `preview_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `subcategory_id`, `product_name`, `product_price`, `discount`, `after_discount`, `short_description`, `long_description`, `preview_image`, `sku`, `slug`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 'Camara 60D', 80000, 5, 76000, 'Canon Eos 4000D 18MP 2.7inch Display With 18-55mm Lens Dslr Camera', '<section class=\"description bg-white m-tb-15\" id=\"description\" style=\"margin: 0px 0px 20px; padding: 20px; background: rgb(255, 255, 255); border-radius: 4px; box-shadow: rgba(0, 0, 0, 0.1) 0px 1px 1px; color: rgb(0, 0, 0); font-family: &quot;Trebuchet MS&quot;, sans-serif; font-size: 15px; letter-spacing: normal;\"><div class=\"section-head\" style=\"margin: 0px; padding: 0px 0px 20px;\"><h2 style=\"margin-right: 0px; margin-bottom: 5px; margin-left: 0px; padding: 0px; font-weight: bold; font-size: 20px; line-height: 26px;\">Description</h2></div><div class=\"full-description\" itemprop=\"description\" style=\"margin: 0px; padding: 0px; line-height: 24px;\"><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; color: rgb(1, 19, 45); line-height: 26px;\">Tell distinctive stories with your photography. This beginner’s DSLR with EF-S 18-55mm f/3.5-5.6 III Lens intuitively creates stand-out photos and Full HD movies full of colour and detail – offering partial and full manual photographic control. The 18 Megapixel APS-C sensor allows you to shoot in low light, expressing your creativity with interchangeable lenses. Point and shoot with Scene Intelligent Auto and share your stories using the EOS 4000D’s Wi-Fi with the and Camera Connect app.<br style=\"margin: 0px; padding: 0px;\"></p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; color: rgb(1, 19, 45); line-height: 26px;\">Shoot detailed images into the night with a large 18 Megapixel sensor, with up to 19x more surface area than many smartphones</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; color: rgb(1, 19, 45); line-height: 26px;\"></p><ul style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 10px 0px 10px 16px;\"><li style=\"margin: 0px 0px 5px; padding: 0px;\">Experience the power of interchangeable lenses and capture high-quality shots of people and places with the EF-S 18-55mm f/3.5-5.6 III Lens<br style=\"margin: 0px; padding: 0px;\"></li><li style=\"margin: 0px 0px 5px; padding: 0px;\">Instantly review results on the user-friendly, 6.8 cm (2.7”) LCD screen<br style=\"margin: 0px; padding: 0px;\"></li><li style=\"margin: 0px 0px 5px; padding: 0px;\">Enjoy fast Auto Focus and full resolution shooting at 3.0 fps – just point and shoot for impressive results with Scene Intelligent Auto<br style=\"margin: 0px; padding: 0px;\"></li><li style=\"margin: 0px 0px 5px; padding: 0px;\">Take fun-filled selfies and unique images from unusual angles with the remote control, then easily share to social media and irista cloud back up with Wi-Fi¹ and Canon Camera Connect app<br style=\"margin: 0px; padding: 0px;\"></li><li style=\"margin: 0px 0px 5px; padding: 0px;\">Learn as you shoot with Creative Auto mode, in-camera feature guide and Photo Companion app (Android and iOS)<br style=\"margin: 0px; padding: 0px;\"></li><li style=\"margin: 0px 0px 5px; padding: 0px;\">Expand your shooting options with an extensive range of interchangeable lenses and accessories<br style=\"margin: 0px; padding: 0px;\"><br style=\"margin: 0px; padding: 0px;\"><span style=\"margin: 0px; padding: 0px; font-size: 12px; font-weight: 700;\">03 Years Service Warranty (No parts warranty)</span><br style=\"margin: 0px; padding: 0px;\"></li></ul><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; color: rgb(1, 19, 45); line-height: 26px;\"></p></div></section><section class=\"latest-price bg-white m-tb-15\" id=\"latest-price\" style=\"margin: 0px 0px 20px; padding: 20px; background: rgb(255, 255, 255); border-radius: 4px; box-shadow: rgba(0, 0, 0, 0.1) 0px 1px 1px; color: rgb(0, 0, 0); font-family: &quot;Trebuchet MS&quot;, sans-serif; font-size: 15px; letter-spacing: normal;\"><div class=\"section-head\" style=\"margin: 0px; padding: 0px 0px 20px;\"><h2 style=\"margin-right: 0px; margin-bottom: 5px; margin-left: 0px; padding: 0px; font-weight: bold; font-size: 20px; line-height: 26px;\">What is the price of Canon Eos 4000D Camera With 18-55mm Lens in Bangladesh?</h2></div><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; color: rgb(1, 19, 45); line-height: 26px;\">The latest price of Canon Eos 4000D Camera With 18-55mm Lens in Bangladesh is 36,500৳. You can buy the Canon Eos 4000D Camera With 18-55mm Lens at best price from our website or visit any of our showrooms.</p></section>', 'camara-60d-1-2.jpg', 'Cama-WwG5d798', 'camara-60d-75029', NULL, '2022-05-24 19:00:22', NULL),
(2, 1, 3, 'Hp', 100000, 10, 90000, 'HP Pavilion Aero 13-be0216AU Ryzen 5 5600U 13.3\" UHD Laptop', '<section class=\"description bg-white m-tb-15\" id=\"description\" style=\"margin: 0px 0px 20px; padding: 20px; background: rgb(255, 255, 255); border-radius: 4px; box-shadow: rgba(0, 0, 0, 0.1) 0px 1px 1px; color: rgb(0, 0, 0); font-family: &quot;Trebuchet MS&quot;, sans-serif; font-size: 15px; letter-spacing: normal;\"><div class=\"full-description\" itemprop=\"description\" style=\"margin: 0px; padding: 0px; line-height: 24px;\"><h2 style=\"margin-right: 0px; margin-bottom: 5px; margin-left: 0px; padding: 0px; font-weight: bold; font-size: 20px; line-height: 26px; text-align: justify;\">HP Pavilion Aero 13-be0216AU Ryzen 5 5600U 13.3\" UHD Laptop</h2><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; color: rgb(1, 19, 45); line-height: 26px; text-align: justify;\">The HP Pavilion Aero 13-be0216AU&nbsp;comes with AMD Ryzen 5 5600U Processor (3MB L2, 16MB L3 Cache, 2.3GHz up to 4.2GHz) and 8GB DDR4-3200 MHz RAM. It has a 512GB PCIe NVMe M.2 SSD. It has been integrated with Vega 11 Graphics and has a 13.3\" diagonal, UHD (3840 x 2160), IPS, micro-edge, anti-glare, 400 nits, 100% sRGB Display. This laptop runs on Windows 11 Home operating system. It is powered by a 3-cell, 43 Wh Li-ion polymer battery and comes with a 45 W Smart AC power adapter. It features Audio by B&amp;O; Dual speakers; HP Audio Boost. It has a standard keyboard and HP Wide Vision 720p HD camera with integrated dual array digital microphones. It is equipped with Realtek Wi-Fi 6 (2x2) and Bluetooth 5.2 combo for connectivity options. It has been designed with 1 x HDMI 2.0, 1 x SuperSpeed USB Type-C 10Gbps signaling rate (USB Power Delivery, DisplayPort 1.4, HP Sleep and Charge); 2 x SuperSpeed USB Type-A 5Gbps signaling rate; 1 x headphone/microphone combo. The HP Pavilion Aero 13-be0216AU&nbsp;comes with 3 Years International Limited Warranty (1 Year warranty for Battery, Terms &amp; Conditions Apply As Per HP).<br style=\"margin: 0px; padding: 0px;\"></p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; color: rgb(1, 19, 45); line-height: 26px; text-align: justify;\"></p></div></section><section class=\"latest-price bg-white m-tb-15\" id=\"latest-price\" style=\"margin: 0px 0px 20px; padding: 20px; background: rgb(255, 255, 255); border-radius: 4px; box-shadow: rgba(0, 0, 0, 0.1) 0px 1px 1px; color: rgb(0, 0, 0); font-family: &quot;Trebuchet MS&quot;, sans-serif; font-size: 15px; letter-spacing: normal;\"><div class=\"section-head\" style=\"margin: 0px; padding: 0px 0px 20px;\"><h2 style=\"margin-right: 0px; margin-bottom: 5px; margin-left: 0px; padding: 0px; font-weight: bold; font-size: 20px; line-height: 26px;\">What is the price of HP Pavilion Aero 13-be0216AU Ryzen 5 5600U 13.3\" Laptop in Bangladesh?</h2></div><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; color: rgb(1, 19, 45); line-height: 26px;\">The latest price of HP Pavilion Aero 13-be0216AU Ryzen 5 5600U 13.3\" Laptop in Bangladesh is 84,000৳. You can buy the HP Pavilion Aero 13-be0216AU Ryzen 5 5600U 13.3\" Laptop at best price from our website or visit any of our showrooms.</p></section>', 'hp-1-3.jpg', 'Hp-Q4rSG416', 'hp-87629', NULL, '2022-05-24 19:02:47', NULL),
(3, 1, 4, 'Headphone', 5000, NULL, 5000, 'Edifier K800 headphone Single Plug', '<h4 style=\"margin-right: 0px; margin-bottom: 5px; margin-left: 0px; padding: 0px; font-weight: bold; font-size: 16px; line-height: 20px; color: rgb(0, 0, 0); font-family: &quot;Trebuchet MS&quot;, sans-serif; letter-spacing: normal;\">Seamlessly change from gaming to voice calls<br style=\"margin: 0px; padding: 0px;\">Microphone features a 120° rotation<br style=\"margin: 0px; padding: 0px;\">Leather padded ear cups also prevent sound leakage<br style=\"margin: 0px; padding: 0px;\">Volume and mute controls conveniently located on the headset</h4><div style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Trebuchet MS&quot;, sans-serif; font-size: 15px; letter-spacing: normal;\"><span style=\"margin: 0px; padding: 0px; font-weight: 700;\"><br style=\"margin: 0px; padding: 0px;\"></span></div><h3 style=\"margin-right: 0px; margin-bottom: 5px; margin-left: 0px; padding: 0px; font-weight: bold; font-size: 18px; line-height: 24px; color: rgb(0, 0, 0); font-family: &quot;Trebuchet MS&quot;, sans-serif; letter-spacing: normal;\">High Performance</h3><div style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Trebuchet MS&quot;, sans-serif; font-size: 15px; letter-spacing: normal;\">High performance 40mm Neodymium unit makes this headset the perfect fit for gaming and online conversation needs. Offering a strong bass and high-quality treble, the K800 will help you conquer any game.</div><div style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Trebuchet MS&quot;, sans-serif; font-size: 15px; letter-spacing: normal;\"><span style=\"margin: 0px; padding: 0px; font-weight: 700;\"><br style=\"margin: 0px; padding: 0px;\"></span></div><h3 style=\"margin-right: 0px; margin-bottom: 5px; margin-left: 0px; padding: 0px; font-weight: bold; font-size: 18px; line-height: 24px; color: rgb(0, 0, 0); font-family: &quot;Trebuchet MS&quot;, sans-serif; letter-spacing: normal;\">Louder sound than before</h3><div style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Trebuchet MS&quot;, sans-serif; font-size: 15px; letter-spacing: normal;\">Padded ear cups make your listening experience exceptional. Acting as a sound insulator, the ear cups prevent sound leakage and create a seal around your ear isolating sound.</div><h3 style=\"margin-right: 0px; margin-bottom: 5px; margin-left: 0px; padding: 0px; font-weight: bold; font-size: 18px; line-height: 24px; color: rgb(0, 0, 0); font-family: &quot;Trebuchet MS&quot;, sans-serif; letter-spacing: normal;\"><br style=\"margin: 0px; padding: 0px;\">Talk for hours</h3><div style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Trebuchet MS&quot;, sans-serif; font-size: 15px; letter-spacing: normal;\">Designed with a high-sensitivity microphone, the K800 will let you talk to friends and family online for hours. It will seem like they are in the room with you. Featuring a 120-degree rotation, conveniently place the microphone where it best suits you. Mute it or adjust the volume with the built-in controls located on the wire.</div><div style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Trebuchet MS&quot;, sans-serif; font-size: 15px; letter-spacing: normal;\"><span style=\"margin: 0px; padding: 0px; font-weight: 700;\"><br style=\"margin: 0px; padding: 0px;\"></span></div><h3 style=\"margin-right: 0px; margin-bottom: 5px; margin-left: 0px; padding: 0px; font-weight: bold; font-size: 18px; line-height: 24px; color: rgb(0, 0, 0); font-family: &quot;Trebuchet MS&quot;, sans-serif; letter-spacing: normal;\">Comfort</h3><div style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Trebuchet MS&quot;, sans-serif; font-size: 15px; letter-spacing: normal;\">Wear it for hours on end. Soft leather padded ear-cups and the lightweight frame of the K800 make it the most comfortable headset you have worn.<br style=\"margin: 0px; padding: 0px;\">It has a 1-year warranty.</div>', 'headphone-1-4.jpg', 'Head-kzGD9309', 'headphone-66680', NULL, '2022-05-24 19:04:29', NULL),
(4, 2, 5, 'Green BAG', 8000, 5, 7600, 'Police Tigger Z 25Ltr Laptop Backpack - Black', '<p><div id=\"provenanceCertifications_feature_div\" class=\"celwidget\" data-feature-name=\"provenanceCertifications\" data-csa-c-id=\"zaukz0-yj6urx-1zo8hl-h4ihyr\" data-cel-widget=\"provenanceCertifications_feature_div\" style=\"box-sizing: border-box; color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\"></div><div id=\"globalStoreInfoBullets_feature_div\" class=\"celwidget\" data-feature-name=\"globalStoreInfoBullets\" data-csa-c-id=\"zgho5o-271yml-klnhph-jv9l3o\" data-cel-widget=\"globalStoreInfoBullets_feature_div\" style=\"box-sizing: border-box; color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\"></div><div id=\"andonCord_feature_div\" class=\"celwidget\" data-feature-name=\"andonCord\" data-csa-c-id=\"52rd8i-s9po67-13pgk9-vcmqxd\" data-cel-widget=\"andonCord_feature_div\" style=\"box-sizing: border-box; color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\"></div><div id=\"edpIngress_feature_div\" class=\"celwidget\" data-feature-name=\"edpIngress\" data-csa-c-id=\"on07mw-8qnpf3-w0qdev-gm0hwu\" data-cel-widget=\"edpIngress_feature_div\" style=\"box-sizing: border-box; color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\"></div><div id=\"heroQuickPromo_feature_div\" class=\"celwidget\" data-feature-name=\"heroQuickPromo\" data-csa-c-id=\"6t3kbm-4ff09-f4a4ys-ksmp6v\" data-cel-widget=\"heroQuickPromo_feature_div\" style=\"box-sizing: border-box; color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\"><div id=\"hero-quick-promo\" class=\"a-row a-spacing-medium\" style=\"box-sizing: border-box; width: 493.375px; margin-bottom: 0px !important;\"></div></div></p><div id=\"featurebullets_feature_div\" class=\"celwidget\" data-feature-name=\"featurebullets\" data-csa-c-id=\"rwj3qt-8f3f0p-vdh5av-a2g86j\" data-cel-widget=\"featurebullets_feature_div\" style=\"box-sizing: border-box; color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\"><div id=\"feature-bullets\" class=\"a-section a-spacing-medium a-spacing-top-small\" style=\"box-sizing: border-box; margin-top: 8px !important; margin-bottom: 0px;\"><ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"box-sizing: border-box; margin: 0px 0px 0px 18px; color: rgb(15, 17, 17); padding: 0px;\"><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box; color: rgb(15, 17, 17); overflow-wrap: break-word; display: block;\">Laptop Compatibility: Yes upto 14 inch , Material : Nylon</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box; color: rgb(15, 17, 17); overflow-wrap: break-word; display: block;\">Dimension: 44x31x12 CM ( HxLxW) , Capacity: 25 Ltrs</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box; color: rgb(15, 17, 17); overflow-wrap: break-word; display: block;\">The bag has padded adjustable back straps that provide carrying comfort. The back panel is also finely padded for ease when you are carrying the backpack.</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box; color: rgb(15, 17, 17); overflow-wrap: break-word; display: block;\">Craftsmanship: Each Police bag is aesthetically designed and hand crafted by expert smiths to ensure consistent superior quality and high value for customers.</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box; color: rgb(15, 17, 17); overflow-wrap: break-word; display: block;\">Utility: Great pick for casual as well as formal use. It is thoughtfully designed to be used by youngsters, teens and business professionals. Both men and women can use it for their day to day activities.</span></li></ul></div></div>', 'green-bag-2-5.jpg', 'Gree-Tu7I2769', 'green-bag-55852', NULL, '2022-05-24 19:05:56', NULL),
(5, 3, 6, 'New Sofa', 50000, 50, 25000, 'Amazon Brand - Solimo Tulip Leatherette 3 Seater Sofa (Beige)', '<h1 class=\"a-size-base-plus a-text-bold\" style=\"padding: 0px 0px 4px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; text-rendering: optimizelegibility; color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; letter-spacing: normal; font-weight: 700 !important; font-size: 16px !important; line-height: 24px !important;\">About this item</h1><ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); padding: 0px; font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; letter-spacing: normal;\"><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Three-seater sofa made from high-quality leatherette in beige color</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Product Dimensions: Length (71 inch), width (30 inch), height (32 inch)</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Over 30 tests conducted to ensure quality</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Fabric does not lose color while rubbing</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Passed durability testing with 100 kg on each seat and backrest for 25,000 cycles</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Meets Indian Standards IS 12674/ IS 5416 for performance and stringent European Safety Requirement Standard EN 12520</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Warranty on manufacturing defects: 3 years</span></li></ul>', 'new-sofa-3-6.jpg', 'New -fHL9Q677', 'new-sofa-45047', NULL, '2022-05-24 19:07:46', NULL),
(6, 4, 8, 'iPhone 8', 40000, NULL, 40000, 'Apple iPhon', '<p>loremipusasfd</p>', 'iphone-8-4-8.jpg', 'iPho-QB2lL63', 'iphone-8-76708', NULL, '2022-05-24 19:09:21', NULL),
(7, 6, 9, 'Black tshirt', 1000, 7, 930, 'Spotlight Fashions Polo Collar Neck Sports Cotton T-Shirt for Men and Boys', '<hr aria-hidden=\"true\" class=\"a-divider-normal\" style=\"background-color: rgb(255, 255, 255); border-top: 1px solid rgb(231, 231, 231); line-height: 19px; margin-top: 0px; margin-bottom: 14px; color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; letter-spacing: normal;\"><div id=\"quickPromoBucketContent\" class=\"a-section\" style=\"margin-bottom: 0px; padding: 0px 0px 26px; color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; letter-spacing: normal;\"><h2 style=\"padding: 0px 0px 4px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; text-rendering: optimizelegibility; font-weight: 700; font-size: 24px; line-height: 32px;\">Special offers and product promotions</h2><ul class=\"a-unordered-list a-vertical\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 18px; color: rgb(51, 51, 51); padding: 0px;\"><li class=\"a-spacing-micro\" style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item a-color-base\" style=\"color: rgb(15, 17, 17);\"><span id=\"promoMessagepctch5675209285580746\">No cost EMI available on select cards. Please check \'EMI options\' above for more details.&nbsp;<span class=\"a-declarative\" data-action=\"a-modal\" data-csa-c-type=\"widget\" data-csa-c-func-deps=\"aui-da-a-modal\" data-a-modal=\"{&quot;backButtonText&quot;:&quot;Back&quot;,&quot;width&quot;:&quot;450&quot;,&quot;header&quot;:&quot;Here\'s how&quot;,&quot;url&quot;:&quot;/promotion/details/popup/A26WLDSTRW9V8&quot;,&quot;height&quot;:&quot;600&quot;}\" data-csa-c-id=\"kj7fio-bohqkc-nu3tsl-ic0ubp\"><a role=\"button\" class=\"a-popover-trigger a-declarative\" style=\"color: rgb(0, 113, 133);\">Here\'s how<i class=\"a-icon a-icon-popover\" style=\"background-image: url(&quot;https://m.media-amazon.com/images/S/sash/McBZv0ZvnbehkIx.png&quot;); background-size: 400px 900px; background-repeat: no-repeat; display: inline-block; vertical-align: text-top; margin: 5px 0px 0px 0.385em; width: 7px; height: 5px; background-position: -90px -5px; opacity: 0.6;\"></i></a></span></span></span></li><li class=\"a-spacing-micro\" style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item a-color-base\" style=\"color: rgb(15, 17, 17);\"><span id=\"promoMessagepctch3902941790889829\">Get GST invoice and save up to 28% on business purchases.&nbsp;<a class=\"a-link-normal\" href=\"https://www.amazon.in/gp/b/ref=apay_upi_sopp?node=16179244031\" style=\"color: rgb(0, 113, 133);\">Sign up for free</a>&nbsp;<span class=\"a-declarative\" data-action=\"a-modal\" data-csa-c-type=\"widget\" data-csa-c-func-deps=\"aui-da-a-modal\" data-a-modal=\"{&quot;backButtonText&quot;:&quot;Back&quot;,&quot;width&quot;:&quot;450&quot;,&quot;header&quot;:&quot;Here\'s how&quot;,&quot;url&quot;:&quot;/promotion/details/popup/A2Q5GHW8AQQ690&quot;,&quot;height&quot;:&quot;600&quot;}\" data-csa-c-id=\"2ul1dn-5qvkg6-hboe2q-11a4rz\"><a role=\"button\" class=\"a-popover-trigger a-declarative\" style=\"color: rgb(0, 113, 133);\">Here\'s how<i class=\"a-icon a-icon-popover\" style=\"background-image: url(&quot;https://m.media-amazon.com/images/S/sash/McBZv0ZvnbehkIx.png&quot;); background-size: 400px 900px; background-repeat: no-repeat; display: inline-block; vertical-align: text-top; margin: 5px 0px 0px 0.385em; width: 7px; height: 5px; background-position: -90px -5px; opacity: 0.6;\"></i></a></span></span></span></li></ul></div>', 'black-tshirt-6-9.jpg', 'Blac-Y9Zib299', 'black-tshirt-6492', NULL, '2022-05-24 19:10:43', NULL),
(8, 7, 11, 'shoe', 3000, NULL, 3000, 'Open MObile', '<hr aria-hidden=\"true\" class=\"a-divider-normal bucketDivider\" style=\"background: -webkit-linear-gradient(top, rgb(221, 221, 221), rgb(247, 247, 247) 3px, rgb(255, 255, 255)) rgb(255, 255, 255); border-width: initial; border-style: none; line-height: 19px; margin-top: 0px; margin-bottom: -18px; filter: none; z-index: 0; zoom: 1; color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; letter-spacing: normal; height: 44px !important;\"><h2 style=\"padding: 0px 0px 4px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; text-rendering: optimizelegibility; font-weight: 700; font-size: 24px; line-height: 32px; color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; letter-spacing: normal;\">Product details</h2><div id=\"detailBullets_feature_div\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; letter-spacing: normal;\"><ul class=\"a-unordered-list a-nostyle a-vertical a-spacing-none detail-bullet-list\" style=\"margin-right: 0px; margin-bottom: 1px; margin-left: 18px; padding: 0px;\"><li style=\"list-style: none; overflow-wrap: break-word; margin: 0px 0px 5.5px;\"><span class=\"a-list-item\"><span class=\"a-text-bold\" style=\"font-weight: 700 !important;\">Product Dimensions ‏ : ‎&nbsp;</span>20 x 10 x 2 cm; 199 Grams</span></li><li style=\"list-style: none; overflow-wrap: break-word; margin: 0px 0px 5.5px;\"><span class=\"a-list-item\"><span class=\"a-text-bold\" style=\"font-weight: 700 !important;\">Date First Available ‏ : ‎&nbsp;</span>15 September 2021</span></li><li style=\"list-style: none; overflow-wrap: break-word; margin: 0px 0px 5.5px;\"><span class=\"a-list-item\"><span class=\"a-text-bold\" style=\"font-weight: 700 !important;\">Manufacturer ‏ : ‎&nbsp;</span>Spotlight fashion</span></li><li style=\"list-style: none; overflow-wrap: break-word; margin: 0px 0px 5.5px;\"><span class=\"a-list-item\"><span class=\"a-text-bold\" style=\"font-weight: 700 !important;\">ASIN ‏ : ‎&nbsp;</span>B09GBKHH9B</span></li><li style=\"list-style: none; overflow-wrap: break-word; margin: 0px 0px 5.5px;\"><span class=\"a-list-item\"><span class=\"a-text-bold\" style=\"font-weight: 700 !important;\">Item model number ‏ : ‎&nbsp;</span>Spotlight fashion</span></li><li style=\"list-style: none; overflow-wrap: break-word; margin: 0px 0px 5.5px;\"><span class=\"a-list-item\"><span class=\"a-text-bold\" style=\"font-weight: 700 !important;\">Country of Origin ‏ : ‎&nbsp;</span>India</span></li><li style=\"list-style: none; overflow-wrap: break-word; margin: 0px 0px 5.5px;\"><span class=\"a-list-item\"><span class=\"a-text-bold\" style=\"font-weight: 700 !important;\">Department ‏ : ‎&nbsp;</span>Men</span></li><li style=\"list-style: none; overflow-wrap: break-word; margin: 0px 0px 5.5px;\"><span class=\"a-list-item\"><span class=\"a-text-bold\" style=\"font-weight: 700 !important;\">Manufacturer ‏ : ‎&nbsp;</span>Spotlight fashion, Royal Bhagwan Estate, X-9, IInd Floor, Bairagarh Chichali Kolar Road Bhopal BHOPAL MADHYA PRADESH India 462042</span></li><li style=\"list-style: none; overflow-wrap: break-word; margin: 0px 0px 5.5px;\"><span class=\"a-list-item\"><span class=\"a-text-bold\" style=\"font-weight: 700 !important;\">Packer ‏ : ‎&nbsp;</span>Royal Bhagwan Estate, X-9, IInd Floor, Bairagarh Chichali Kolar Road Bhopal BHOPAL MADHYA PRADESH India 462042</span></li><li style=\"list-style: none; overflow-wrap: break-word; margin: 0px 0px 5.5px;\"><span class=\"a-list-item\"><span class=\"a-text-bold\" style=\"font-weight: 700 !important;\">Importer ‏ : ‎&nbsp;</span>Royal Bhagwan Estate, X-9, IInd Floor, Bairagarh Chichali Kolar Road Bhopal BHOPAL MADHYA PRADESH India 462042</span></li><li style=\"list-style: none; overflow-wrap: break-word; margin: 0px 0px 5.5px;\"><span class=\"a-list-item\"><span class=\"a-text-bold\" style=\"font-weight: 700 !important;\">Item Weight ‏ : ‎&nbsp;</span>199 g</span></li><li style=\"list-style: none; overflow-wrap: break-word; margin: 0px 0px 5.5px;\"><span class=\"a-list-item\"><span class=\"a-text-bold\" style=\"font-weight: 700 !important;\">Item Dimensions LxWxH ‏ : ‎&nbsp;</span>20 x 10 x 2 Centimeters</span></li><li style=\"list-style: none; overflow-wrap: break-word; margin: 0px 0px 5.5px;\"><span class=\"a-list-item\"><span class=\"a-text-bold\" style=\"font-weight: 700 !important;\">Net Quantity ‏ : ‎&nbsp;</span>1.00 count</span></li></ul></div><ul class=\"a-unordered-list a-nostyle a-vertical a-spacing-none detail-bullet-list\" style=\"margin-right: 0px; margin-bottom: 1px; margin-left: 18px; color: rgb(15, 17, 17); padding: 0px; font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; letter-spacing: normal;\"><li style=\"list-style: none; overflow-wrap: break-word; margin: 0px 0px 5.5px;\"><span class=\"a-list-item\"><span class=\"a-text-bold\" style=\"font-weight: 700 !important;\">Best Sellers Rank:&nbsp;</span>#56,766 in Clothing &amp; Accessories (<a href=\"https://www.amazon.in/gp/bestsellers/apparel/ref=pd_zg_ts_apparel\" style=\"color: rgb(0, 113, 133);\">See Top 100 in Clothing &amp; Accessories</a>)</span></li></ul>', 'shoe-7-11.jpg', 'shoe-tHvim87', 'shoe-52772', NULL, '2022-05-24 19:17:53', NULL),
(9, 4, 7, 'iPhone 13', 150000, NULL, 150000, 'HP Pavilion 15-eg1043TX Core i5 11th Gen MX450 2GB Graphics 15.6\" FHD Laptop', '<p>HP Pavilion 15-eg1043TX Core i5 11th Gen MX450 2GB Graphics 15.6\" FHD Laptop<br></p>', 'iphone-13-4-7.jpg', 'iPho-3DYml187', 'iphone-13-31325', NULL, '2022-05-25 20:27:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sizes`
--

CREATE TABLE `sizes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `size_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sizes`
--

INSERT INTO `sizes` (`id`, `size_name`, `created_at`, `updated_at`) VALUES
(1, 'S', '2022-05-17 04:06:42', NULL),
(2, 'M', '2022-05-17 04:06:48', NULL),
(3, 'L', '2022-05-17 04:06:54', NULL),
(4, 'Xl', '2022-05-17 04:07:04', NULL),
(5, 'NA', '2022-05-17 20:21:36', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE `subcategories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `subcategory_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subcategory_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`id`, `category_id`, `subcategory_name`, `subcategory_image`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 11, 'Treadmill', '1.jpg', '2022-05-14 18:38:32', '2022-05-14 18:38:29', '2022-05-14 18:38:32'),
(2, 1, 'Camara', '2.jpg', NULL, '2022-05-15 19:33:30', '2022-05-15 19:33:32'),
(3, 1, 'Laptop', '3.jpg', NULL, '2022-05-15 19:36:12', '2022-05-15 19:36:14'),
(4, 1, 'Headphone', '4.jpg', NULL, '2022-05-15 19:36:46', '2022-05-15 19:36:47'),
(5, 2, 'Bag', '5.jpg', NULL, '2022-05-15 19:40:28', '2022-05-15 19:40:31'),
(6, 3, 'sofa', '6.jpg', NULL, '2022-05-15 19:40:49', '2022-05-15 19:40:50'),
(7, 4, 'iPhone 13', '7.jpg', NULL, '2022-05-15 19:41:22', '2022-05-15 19:41:24'),
(8, 4, 'iPhone 8', '8.jpg', NULL, '2022-05-15 19:41:43', '2022-05-15 19:41:44'),
(9, 6, 'T-shirt', '9.jpg', NULL, '2022-05-15 19:42:06', '2022-05-15 19:42:08'),
(10, 6, 'Watch Black', '10.jpg', NULL, '2022-05-15 19:42:47', '2022-05-15 19:42:48'),
(11, 7, 'shoe', '11.jpg', NULL, '2022-05-15 19:43:52', '2022-05-15 19:43:52');

-- --------------------------------------------------------

--
-- Table structure for table `thumbnails`
--

CREATE TABLE `thumbnails` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnails` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `thumbnails`
--

INSERT INTO `thumbnails` (`id`, `product_id`, `thumbnails`, `created_at`, `updated_at`) VALUES
(1, '1', '1-1.jpg', '2022-05-24 19:00:24', NULL),
(2, '1', '1-2.jpg', '2022-05-24 19:00:25', NULL),
(3, '1', '1-3.jpg', '2022-05-24 19:00:28', NULL),
(4, '1', '1-4.jpg', '2022-05-24 19:00:30', NULL),
(5, '1', '1-5.jpg', '2022-05-24 19:00:31', NULL),
(6, '2', '2-1.jpg', '2022-05-24 19:02:49', NULL),
(7, '2', '2-2.jpg', '2022-05-24 19:02:51', NULL),
(8, '2', '2-3.jpg', '2022-05-24 19:02:56', NULL),
(9, '2', '2-4.jpg', '2022-05-24 19:03:01', NULL),
(10, '3', '3-1.jpg', '2022-05-24 19:04:31', NULL),
(11, '3', '3-2.jpg', '2022-05-24 19:04:32', NULL),
(12, '3', '3-3.jpg', '2022-05-24 19:04:34', NULL),
(13, '3', '3-4.jpg', '2022-05-24 19:04:36', NULL),
(14, '4', '4-1.jpg', '2022-05-24 19:05:58', NULL),
(15, '4', '4-2.jpg', '2022-05-24 19:06:01', NULL),
(16, '4', '4-3.jpg', '2022-05-24 19:06:02', NULL),
(17, '4', '4-4.jpg', '2022-05-24 19:06:04', NULL),
(18, '5', '5-1.jpg', '2022-05-24 19:07:48', NULL),
(19, '5', '5-2.jpg', '2022-05-24 19:07:49', NULL),
(20, '5', '5-3.jpg', '2022-05-24 19:07:51', NULL),
(21, '5', '5-4.jpg', '2022-05-24 19:07:53', NULL),
(22, '6', '6-1.jpg', '2022-05-24 19:09:23', NULL),
(23, '6', '6-2.jpg', '2022-05-24 19:09:26', NULL),
(24, '6', '6-3.jpg', '2022-05-24 19:09:28', NULL),
(25, '6', '6-4.jpg', '2022-05-24 19:09:29', NULL),
(26, '7', '7-1.jpg', '2022-05-24 19:10:45', NULL),
(27, '7', '7-2.jpg', '2022-05-24 19:10:48', NULL),
(28, '7', '7-3.jpg', '2022-05-24 19:10:51', NULL),
(29, '7', '7-4.jpg', '2022-05-24 19:10:53', NULL),
(30, '7', '7-5.jpg', '2022-05-24 19:10:54', NULL),
(31, '8', '8-1.jpg', '2022-05-24 19:17:54', NULL),
(32, '8', '8-2.jpg', '2022-05-24 19:17:56', NULL),
(33, '8', '8-3.jpg', '2022-05-24 19:17:57', NULL),
(34, '8', '8-4.jpg', '2022-05-24 19:17:58', NULL),
(35, '8', '8-5.jpg', '2022-05-24 19:18:00', NULL),
(36, '8', '8-6.jpg', '2022-05-24 19:18:01', NULL),
(37, '8', '8-7.jpg', '2022-05-24 19:18:06', NULL),
(38, '8', '8-8.jpg', '2022-05-24 19:18:08', NULL),
(39, '9', '9-1.jpg', '2022-05-25 20:27:54', NULL),
(40, '9', '9-2.jpg', '2022-05-25 20:27:56', NULL),
(41, '9', '9-3.jpg', '2022-05-25 20:27:59', NULL),
(42, '9', '9-4.jpg', '2022-05-25 20:28:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'Ginger Hubbard', 'dewal@mailinator.com', NULL, '$2y$10$22T7JuSYpYnnB5UVAjuiOOLFIucz0JD4EB/adRlIPfKuRN5gfJ6hO', 'EU38Q8wdeRBZ31w1txnQGpB4qt5VpfC8k2BzmEy39Dehttb5kGtjRHEgl03P', '2022-03-27 12:52:34', '2022-03-27 12:52:34'),
(5, 'Chase Frost', 'nowe@mailinator.com', NULL, '$2y$10$6uQI5PJ7OquhA5lHSpsg0e54USk5E8mJPZNyxMlcdluuLWaHp7N7e', NULL, '2022-03-27 14:24:16', '2022-03-27 14:24:16'),
(6, 'Zephania Hahn', 'magagovy@mailinator.com', NULL, '$2y$10$Qm1SQoNoWhi0pwbMIbaesuakt/JiAsw06VlGzdku5KzLHKFAjuW6i', NULL, '2022-03-27 14:24:23', '2022-03-27 14:24:23'),
(7, 'Brittany Vance', 'voso@mailinator.com', NULL, '$2y$10$jmYusNONofbxmsURoEQY9uYYUFI.BrMg/wxjAei/mGJyeuWgX.822', NULL, '2022-03-27 14:24:30', '2022-03-27 14:24:30'),
(8, 'Evangeline Dorsey', 'jabesejejo@mailinator.com', NULL, '$2y$10$jBOvWwPR/Z1p3gwlvG2oEuwkrFZh4al99uHL61cWvEbVw4Kq3/gSy', NULL, '2022-03-27 14:24:41', '2022-03-27 14:24:41'),
(9, 'Lisandra Simon', 'walo@mailinator.com', NULL, '$2y$10$.5FG4RzmBLLBh0.FMsC6JeEdavfkHPPEdWJPtWRh8jv0IoWPQw1uC', NULL, '2022-03-27 14:25:01', '2022-03-27 14:25:01'),
(10, 'India Webster', 'lybi@mailinator.com', NULL, '$2y$10$4BB/eEr3MRWbsT.HE9TQJ.PzdsAfhG7nGz8VoPfIzRHoI5cs/mbC6', NULL, '2022-05-15 19:11:41', '2022-05-15 19:11:41');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_logins`
--
ALTER TABLE `customer_logins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `inventories`
--
ALTER TABLE `inventories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `thumbnails`
--
ALTER TABLE `thumbnails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `customer_logins`
--
ALTER TABLE `customer_logins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventories`
--
ALTER TABLE `inventories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `sizes`
--
ALTER TABLE `sizes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `thumbnails`
--
ALTER TABLE `thumbnails`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
