-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 12, 2024 at 04:37 PM
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
-- Database: `13thvapourlounge`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_09_21_141934_create_personal_access_tokens_table', 1),
(5, '2024_09_26_184402_create_product_categories_table', 1),
(6, '2024_09_28_104140_create_products_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'token for1', '220c26617da249d42b0749796f31a5ee218766fbeb0591257dc9d3157e84c8f5', '[\"*\"]', NULL, NULL, '2024-10-10 17:14:14', '2024-10-10 17:14:14'),
(2, 'App\\Models\\User', 1, 'token for1', 'edb74c724cca75263657313be3e0fb55d278bfedba395a390a3de7b1cf7bf308', '[\"*\"]', NULL, NULL, '2024-10-11 20:03:03', '2024-10-11 20:03:03'),
(3, 'App\\Models\\User', 1, 'token for1', '3ecfd4e7c8051f9daf256f7a9ffcdce4855de99f1b8592ea53362873afd409ab', '[\"*\"]', NULL, NULL, '2024-10-11 22:17:15', '2024-10-11 22:17:15');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_label` varchar(255) NOT NULL,
  `product_price` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `label_category` varchar(255) NOT NULL,
  `quantity` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_name`, `product_label`, `product_price`, `image`, `label_category`, `quantity`, `description`, `created_at`, `updated_at`) VALUES
(1, 'RELX Pod Pro', 'RELX Infinity Pod Pro Exotic Passion', '568', 'SZKPFV89PVrUj00lmwSKIihyD1AyW2iMDv7KejFw.jpg', 'new-arrival', '568', 'Pod Capacity: 1.8ml Wicking Material: FEELM Ceramic Coil Pod Timbang: 7g Pod Life Span: 650 puff Nilalaman ng Nicotine: 30mg | 3%', '2024-10-10 17:17:34', '2024-10-10 17:17:34'),
(2, 'RELX Pod Pro', 'RELX Infinity Pod Vape Kit – Pilak', '1761', 'mr6Trj2AK2p3yMpdmDz2KcsvT9RFpokmGEy9kMGl.jpg', 'new-arrival', '1761', 'Mga Dimensyon: 112mm x 23mm x 10mm Pod Material: FEELM Ceramic Maze Coil Pod Capacity: 1.8ml Pod Weight: 6g Pod Life Span: 500-650 puffs Baterya: 380mAH Charge Time: 45 Mins Charger Type: USB Type-C Inclusion RELX Infinity Vape Device * 1 USB Type C Charger * 1 User Manual * 1', '2024-10-10 17:21:42', '2024-10-10 17:21:42'),
(3, 'Infinity Pod', 'RELX Infinity Pod Vape Kit – Sky Blush', '1761', 'UieSCPy6dpOrPGPs6qcsLylatD6WbbR7vDZQeXxL.jpg', 'new-arrival', '1761', '112mm x 23mm x 10mm Pod Material: FEELM Ceramic Maze Coil Pod Capacity: 1.8ml Pod Weight: 6g Pod Life Span: 500-650 puffs Baterya: 380mAH Charge Time: 45 Mins Charger Type: USB Type-C Inclusion RELX Infinity Vape Device * 1 USB Type C Charger * 1 User Manual * 1', '2024-10-10 17:24:17', '2024-10-10 17:24:17'),
(4, 'Elf Bar', 'ELF BAR Disposable Vape BC 5000 Puffs # Blue Razz Ice', '200', 'UwjsrjbIAYgJyBoWTS7yLKtQR0DuuBkLokkQ6j5S.jpg', 'new-arrival', '200', 'Product Details\r\nBattery capacity: 650mah\r\nCapacity: 13ml\r\nLife of each atomizer: 5000 mouths\r\nNic: 5%', '2024-10-10 17:29:14', '2024-10-10 17:29:14'),
(5, 'Elf Bar', 'ELF BAR Disposable Vape BC 5000 Puffs # Lemon Mint', '852', 'L6QrP2ZRuU00sKNXD1491XOP4NZ9qMNbm8pDQX9e.jpg', 'new-arrival', '852', 'Product Details\r\nBattery capacity: 650mah\r\nCapacity: 13ml\r\nLife of each atomizer: 5000 mouths\r\nNic: 5%', '2024-10-10 17:30:45', '2024-10-10 17:30:45'),
(6, 'Elf Bar', 'ELF BAR Disposable Vape BC 5000 Puffs # Cranberry Grape', '852', 'KseQQzl6vvy4IP6K1ilEtEmmTlhKCXWMyBYUttFN.jpg', 'new-arrival', '852', 'Product Details\r\nBattery capacity: 650mah\r\nCapacity: 13ml\r\nLife of each atomizer: 5000 mouths\r\nNic: 5%', '2024-10-10 17:32:07', '2024-10-10 17:32:07'),
(7, 'Tool Kit Mechanical Vape', 'Tool Kit Mech-type', '150', 'yJyR7eCKdAyOPJ7oqz0WODKZyaUAmFmN4wXb8vYe.jpg', 'new-arrival', '150', 'Tool kit 2024\r\nMech Type Tool Kit\r\nMatibay haha', '2024-10-10 17:34:37', '2024-10-10 17:34:37'),
(8, 'Baterries', 'Samsung 25r18650 Mga', '681', 'QDnTLZfgTHsh9VXPdP1cPkexuXwvQZQRL6LxIpAK.jpg', 'best-seller', '681', '25R18650\r\nSAMSUNG', '2024-10-11 20:07:53', '2024-10-11 20:07:53'),
(9, 'Baterries', 'Samsung Inr18650 30q', '965', 'oNqytP4o3abqaI9ErGsxehiyEVwVYayxkvPYE0iU.jpg', 'best-seller', '965', '-SAMSUNG\r\n-INR18650-30Q\r\n-Mga baterya', '2024-10-11 20:09:55', '2024-10-11 20:09:55'),
(10, 'Pod System', 'MIKU Series 5 Pod Syetem 3000 Puffs # Gray', '1477', 'DZoI4tGUkdcshmcrnTHR343THvtwbUhJ7NFNl2T2.jpg', 'new-arrival', '1477', '380mah Type C charge port Oras ng Pag-charge: 45 min 1 ilaw ay naka-on, ang baterya ay 25%; 2 ilaw ay naka-on, ang baterya ay 25-50%; 3 ilaw ay naka-on, ang baterya ay 50-75%; 4 na ilaw ay naka-on, ang baterya ay 75-100%;', '2024-10-11 20:13:36', '2024-10-11 20:13:37'),
(11, 'Freebase', 'Miku Mga E-liquid # Strawberry Jam 3%', '1363', 'BG6epVPrEkT2dHjstvXyqIQ7jmzuodyFEqCQdpyN.jpg', 'best-seller', '1363', 'MIKU\r\n3%', '2024-10-11 20:31:28', '2024-10-11 20:31:28'),
(12, 'Freebase', 'Miku Mga E-liquid # Sariwang Mint 30ml', '1363', 'Od1pNZ9hQcmR2pWTTdGLxpGWakU4XdqIK8Co9qHZ.jpg', 'new-arrival', '1363', '5%\r\nMIKU\r\n30ml', '2024-10-11 20:34:07', '2024-10-11 20:34:07'),
(13, 'Freebase', 'Miku Mga E-liquid # Cola Iced', '1363', 'PGdOTm3JeE9KHmnYfOc4PpEORCpKTibstH3mej8l.jpg', 'new-arrival', '1363', 'MIKU\r\n3%', '2024-10-11 20:35:04', '2024-10-11 20:35:04'),
(14, 'Box Mod Kits', 'RINCOE JELLYBOX 228W Box Mod Kit', '4034', 'sBykK11EbGc3P865NiLvn0tk9c016iZxKlgDW6sI.jpg', 'new-arrival', '4034', '92*54*27mm Zinc Alloy + PCTG Construction 1-228W Output Dual 18650 Baterya (Hindi Kasama) Range ng Paglaban: 0.08-5.0ohm (VW Mode) Kasama sa Package: 1x Jellybox 288W Mod 1x Type-C Charging Cable 1x User Manual 1x Certificate Card 1x Warranty Card', '2024-10-11 20:37:44', '2024-10-11 20:37:44'),
(15, 'Elf Bar', 'JellyAce', '2321', 'ljOH03qceJwdohL2TT1OCM9etsMoPX6eQVPkkBBn.jpg', 'new-arrival', '2321', 'haha', '2024-10-11 20:38:46', '2024-10-11 20:38:46'),
(17, 'Infinity Pod', 'dsada', '23', 'oSxefojbfyCMdI8rO2jKTPMtVsKBew1lahoChdzh.jpg', 'new-arrival', '23', 'dsad', '2024-10-11 22:50:29', '2024-10-11 22:50:29');

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_type` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`id`, `product_type`, `product_name`, `created_at`, `updated_at`) VALUES
(2, 'RELX', 'Infinity Pod', '2024-10-10 17:20:44', '2024-10-10 17:20:44'),
(3, 'DISPO VAPES', 'Elf Bar', '2024-10-10 17:28:20', '2024-10-10 17:28:20'),
(5, 'RELX', 'dasd', '2024-10-10 17:39:57', '2024-10-10 17:39:57'),
(6, 'RELX', 'DSAD', '2024-10-10 17:42:06', '2024-10-10 17:42:06'),
(7, 'Accessories', 'Baterries', '2024-10-11 20:06:03', '2024-10-11 20:06:03'),
(8, 'Devices', 'Pod System', '2024-10-11 20:12:20', '2024-10-11 20:12:20'),
(9, 'E-Liquids', 'Freebase', '2024-10-11 20:30:05', '2024-10-11 20:30:05'),
(10, 'Starter Kits', 'Box Mod Kits', '2024-10-11 20:37:01', '2024-10-11 20:37:01');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `age` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('client','admin','subadmin') NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `age`, `address`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin1', 'adminlname', 23, NULL, 'admin@gmail.com', NULL, '$2y$12$J/DH6P18x9ckHXTWlE5W8./faUwdi4SwSYk90qO00uNoGjtOxtyPG', 'admin', NULL, '2024-10-10 17:13:47', '2024-10-10 17:13:47');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

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
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

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
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
