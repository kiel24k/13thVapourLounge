-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 21, 2025 at 04:21 AM
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
-- Table structure for table `address__books`
--

CREATE TABLE `address__books` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `mobile_no` varchar(255) NOT NULL,
  `floor_unit_no` varchar(255) NOT NULL,
  `island` varchar(255) NOT NULL,
  `regions` varchar(255) NOT NULL,
  `province` varchar(255) NOT NULL,
  `municipality` varchar(255) NOT NULL,
  `barangay` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `content_management`
--

CREATE TABLE `content_management` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `caption` text DEFAULT NULL,
  `details` text DEFAULT NULL,
  `status` enum('published','unpublished') NOT NULL,
  `type` enum('title_tag','hero','about_us','service','contacts') NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `content_management`
--

INSERT INTO `content_management` (`id`, `caption`, `details`, `status`, `type`, `image`, `created_at`, `updated_at`) VALUES
(1, '13th Vapour Lounge', NULL, 'published', 'title_tag', '4qKq3hL4Tox4qfheI77V4e6n8JfBFwOzpq6jH6zA.png', '2025-05-02 19:46:42', '2025-05-05 00:25:34'),
(3, 'Mission', 'Our Mission\nTo provide adult smokers and vapers with high-quality, safe, and reliable vaping products as a trusted alternative to traditional tobacco—while delivering exceptional customer service, education, and support in a welcoming environment.', 'published', 'about_us', 'AVfLAgNETMAfc9ARmOPPK6FbJ0bzUwOR0UqAfN8S.jpg', '2025-05-03 00:06:03', '2025-05-12 14:43:59'),
(4, 'dsad', 'CLICK HERO TO SEE THE LOCATION', 'published', 'hero', 'x2tz60tvrbe9KrgEZtAjQRoiiQkCFfUmLyLNqaMj.jpg', '2025-05-03 00:08:30', '2025-05-07 00:38:05'),
(19, 'Vision', 'Our Vision\nTo become a leading voice in the vaping industry, promoting harm reduction through innovation, integrity, and responsible retailing—empowering our customers to make informed lifestyle choices and shaping a smoke-free future.', 'published', 'about_us', NULL, '2025-05-03 10:32:19', '2025-05-12 14:44:18'),
(22, 'SHOP ONLINE', 'With our user-friendly navigation our customers can shop without having any worries.', 'published', 'service', 'sJpqw5mPupcFJwv9tPGdHw5KemZuxyLBURQOZBVW.png', '2025-05-03 11:11:45', '2025-05-07 01:32:27'),
(26, 'SHOP ONLINE', 'With our user-friendly navigation our customers can shop without having any worries.', 'published', 'service', 'cTUvOum1vh8qnd0x3vgOsqb9rVYxuP4QsBKch2Qe.png', '2025-05-07 01:33:28', '2025-05-07 01:33:28'),
(27, 'SHOP ONLINE', 'With our user-friendly navigation our customers can shop without having any worries.', 'published', 'service', 'E3mysAGDkyHR34AQ0wSaDvTy89A3hliMmQj0BbB9.png', '2025-05-07 01:33:57', '2025-05-07 01:33:57'),
(28, '13th Vapour Lounge', 'Welcome to 13th Vapour Lounge, your trusted destination for premium vaping products, expert advice, and unbeatable service.\n\nWe started with a simple goal: to offer a safer alternative for adult smokers while building a community based on quality, transparency, and trust. Today, we proudly serve beginners and experienced vapers alike with a curated selection of e-liquids, vape kits, disposables, coils, and accessories from top-tier brands you know and love.\n\nAt 13th Vapour Lounge, we believe vaping should be both enjoyable and reliable. Our team is passionate, knowledgeable, and always ready to help you find the right products to suit your needs and preferences. Whether you\'re making the switch or looking to upgrade, we’re here to guide you every step of the way.\n\nWe’re committed to responsible retailing. That means age verification, high-quality products, and supporting our customers in making informed choices.\n\nThank you for choosing 13th Vapour Lounge—we’re more than just a shop, we’re your vaping partner.', 'published', 'about_us', NULL, '2025-05-12 14:38:15', '2025-05-12 14:38:15');

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
(30, '0001_01_01_000000_create_users_table', 1),
(31, '0001_01_01_000001_create_cache_table', 1),
(32, '0001_01_01_000002_create_jobs_table', 1),
(33, '2024_09_21_141934_create_personal_access_tokens_table', 1),
(34, '2024_09_26_184402_create_product_categories_table', 1),
(35, '2024_09_28_104140_create_products_table', 1),
(36, '2024_10_18_003710_create_user_orders_table', 1),
(37, '2024_10_21_025045_add_mobile_to_users_table', 1),
(38, '2024_10_21_053629_create_address__books_table', 1),
(39, '2024_11_25_135036_pos_customer', 2),
(40, '2025_04_22_182907_create_pos_reserve_products_table', 2),
(43, '2025_05_02_155605_create_content_management_table', 3);

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
(1, 'App\\Models\\User', 2, 'token for2', 'f1dc660c3d7c7201b4d517e35f506613dcd366a2d51ad1818e3a3fc06f9bfe50', '[\"*\"]', NULL, NULL, '2025-04-21 22:13:08', '2025-04-21 22:13:08'),
(2, 'App\\Models\\User', 3, 'token for3', '2245ece19684d3fb3c824708a43e986cfbad1bc31fb10cb5be82ead422fa84ed', '[\"*\"]', NULL, NULL, '2025-04-21 22:13:52', '2025-04-21 22:13:52'),
(3, 'App\\Models\\User', 2, 'token for2', '49659fe72d72103f63ade541177b8e997e3cc31ecbde94051724e94261ced96b', '[\"*\"]', NULL, NULL, '2025-04-21 22:14:05', '2025-04-21 22:14:05'),
(4, 'App\\Models\\User', 3, 'token for3', 'b3b7c6357fcf0dee18d3f917893752604ba80efb816dba3ec10b4a10339fef00', '[\"*\"]', NULL, NULL, '2025-04-21 22:14:30', '2025-04-21 22:14:30'),
(5, 'App\\Models\\User', 2, 'token for2', 'b26a7e877e779bcf5c55c3f488743a56f6462e2fa79b9d7debd22b97d376af08', '[\"*\"]', NULL, NULL, '2025-04-22 05:00:12', '2025-04-22 05:00:12'),
(6, 'App\\Models\\User', 3, 'token for3', 'd47b05272137d6ac237dbc57680790993a718b88e2caaf9b55a116a83bdffa34', '[\"*\"]', NULL, NULL, '2025-04-22 06:01:03', '2025-04-22 06:01:03'),
(7, 'App\\Models\\User', 2, 'token for2', '1aa8fd359417a9b275a54ef33eb5d01d7d40a0e3643a03418ab8f38ffa492898', '[\"*\"]', NULL, NULL, '2025-04-22 06:05:10', '2025-04-22 06:05:10'),
(8, 'App\\Models\\User', 3, 'token for3', 'df4133369ef62b3d14a85d4f202c367031fef061934bd2de8908c1e2eaf9552b', '[\"*\"]', NULL, NULL, '2025-04-22 06:36:50', '2025-04-22 06:36:50'),
(9, 'App\\Models\\User', 2, 'token for2', '53ae776b8acc9185f205d77fe2aba863586b49d7d8c1dc242be8976163f37022', '[\"*\"]', NULL, NULL, '2025-04-22 06:42:10', '2025-04-22 06:42:10'),
(10, 'App\\Models\\User', 4, 'token for4', '5b71a5723402a27331c0909aaf90af8e62ebb88e9e73d72710f37d1ad627e7e0', '[\"*\"]', NULL, NULL, '2025-04-22 09:39:20', '2025-04-22 09:39:20'),
(11, 'App\\Models\\User', 4, 'token for4', '4bcb9a43acdbd636f83d5993a71b9dc25b17b317dc05b937b285eed038ffa227', '[\"*\"]', NULL, NULL, '2025-04-22 09:43:23', '2025-04-22 09:43:23'),
(12, 'App\\Models\\User', 2, 'token for2', '70e66dad2cf7b2b02a233640d7fa74907d1e271da3e9682b9b1406bc825d295c', '[\"*\"]', NULL, NULL, '2025-04-22 09:54:49', '2025-04-22 09:54:49'),
(13, 'App\\Models\\User', 2, 'token for2', '0c8f9bc416ee79627e978278b8990b382687f925ae78b2401c9c65da157dcdfd', '[\"*\"]', NULL, NULL, '2025-04-22 16:20:14', '2025-04-22 16:20:14'),
(14, 'App\\Models\\User', 2, 'token for2', 'ceb3dce15e91314312691a5641d93ffee6e3a0a6e395f774d8216e73cafe1c14', '[\"*\"]', NULL, NULL, '2025-04-22 21:13:05', '2025-04-22 21:13:05'),
(15, 'App\\Models\\User', 4, 'token for4', '353e4ab9a9aac097324ef3f7940e0c18fa8521bdf96a007052f8404140c5a238', '[\"*\"]', NULL, NULL, '2025-04-22 21:24:21', '2025-04-22 21:24:21'),
(16, 'App\\Models\\User', 2, 'token for2', '728945bb372d7416dc280a1a96e34942dc61528e6b284448f876d1a0ed74d3a0', '[\"*\"]', NULL, NULL, '2025-04-22 23:05:57', '2025-04-22 23:05:57'),
(17, 'App\\Models\\User', 4, 'token for4', '37d314e4e92fae9abca9d39ae216cee5c41705221af5bc6b515d22a960a17bde', '[\"*\"]', NULL, NULL, '2025-04-22 23:07:22', '2025-04-22 23:07:22'),
(18, 'App\\Models\\User', 2, 'token for2', '8ff9dc4cd704c92c6f1468d01b2eaa32566ea8551eba6308c90758275fc953b0', '[\"*\"]', NULL, NULL, '2025-04-22 23:21:27', '2025-04-22 23:21:27'),
(19, 'App\\Models\\User', 4, 'token for4', '6372b7c3ebdc880c446a189e1d0397488485899fadde82a40baa7cf600c08c30', '[\"*\"]', NULL, NULL, '2025-04-22 23:22:03', '2025-04-22 23:22:03'),
(20, 'App\\Models\\User', 2, 'token for2', 'cde07350152720b0bb9b6c24264961baf2aa9b69d39bd3bc43d59bcb6c84c0fd', '[\"*\"]', NULL, NULL, '2025-04-22 23:59:40', '2025-04-22 23:59:40'),
(21, 'App\\Models\\User', 5, 'token for5', 'f08f74994187262404b6974c1769aa81285b428dd450d40988d87eb491737403', '[\"*\"]', NULL, NULL, '2025-04-29 13:57:54', '2025-04-29 13:57:54'),
(22, 'App\\Models\\User', 5, 'token for5', '6ee641a7bcd7a5897313d07401b3de6a400d646652bcd48dd47000d45cbc827e', '[\"*\"]', NULL, NULL, '2025-04-29 20:45:53', '2025-04-29 20:45:53'),
(23, 'App\\Models\\User', 5, 'token for5', '33d1260849342633aae3b972a7374bbbe6a559306f66814fb364aa0b12ce64f1', '[\"*\"]', NULL, NULL, '2025-04-30 04:36:15', '2025-04-30 04:36:15'),
(24, 'App\\Models\\User', 5, 'token for5', '68c53b0130622039fcfe70fedbffbd8e1d0c8a6fbf856bb3e1fa84c62d5e9ecd', '[\"*\"]', NULL, NULL, '2025-05-01 00:52:24', '2025-05-01 00:52:24'),
(25, 'App\\Models\\User', 5, 'token for5', 'e8a44638e79ec4a6b38eb80f39b41314427db02d97c2597b0d666bb628b6dd38', '[\"*\"]', NULL, NULL, '2025-05-01 06:31:07', '2025-05-01 06:31:07'),
(26, 'App\\Models\\User', 6, 'token for6', '84f790f7c653dd2072af5620509464572e3eb356e59b4daa1d370a33b1dc5d24', '[\"*\"]', NULL, NULL, '2025-05-01 06:42:35', '2025-05-01 06:42:35'),
(27, 'App\\Models\\User', 7, 'token for7', '0734749b0c233f39843ffc857d32469d5f2391cdb4ba49fa370614ba7660aa72', '[\"*\"]', NULL, NULL, '2025-05-01 06:56:23', '2025-05-01 06:56:23'),
(28, 'App\\Models\\User', 5, 'token for5', '31dbc295b0718d7f7cf13cc87427fd6987899521917daf77df0c5b8389be33e3', '[\"*\"]', NULL, NULL, '2025-05-02 00:50:39', '2025-05-02 00:50:39'),
(29, 'App\\Models\\User', 5, 'token for5', '67a3db34a16b528be210a94a9f36ab264948734d1c2f464180832639341dcfa9', '[\"*\"]', NULL, NULL, '2025-05-02 01:06:13', '2025-05-02 01:06:13'),
(30, 'App\\Models\\User', 7, 'token for7', '995758aaf3ff4469748a9571328848f7272c8a01f90aa818e7814af9cda59e95', '[\"*\"]', NULL, NULL, '2025-05-02 04:16:59', '2025-05-02 04:16:59'),
(31, 'App\\Models\\User', 5, 'token for5', '406ec5241f72ea3a225489d6b7091af3f91fa58ecaa514a9525a21f91c37c93d', '[\"*\"]', NULL, NULL, '2025-05-02 06:31:13', '2025-05-02 06:31:13'),
(32, 'App\\Models\\User', 5, 'token for5', '069e7802d4d6056aa008996e76f067bddfb2970643fef2ed1a6cfe957384f373', '[\"*\"]', NULL, NULL, '2025-05-02 08:49:43', '2025-05-02 08:49:43'),
(33, 'App\\Models\\User', 5, 'token for5', 'b53675164fcd3514c3030b53d22dc9c81a2caf82f835afdc4e95a566facb4b66', '[\"*\"]', NULL, NULL, '2025-05-02 16:42:33', '2025-05-02 16:42:33'),
(34, 'App\\Models\\User', 7, 'token for7', 'b82d9bc42caa1197f59ac8ad78e96ecb8a755000690fc8f321cb45cb97a74171', '[\"*\"]', NULL, NULL, '2025-05-02 21:16:40', '2025-05-02 21:16:40'),
(35, 'App\\Models\\User', 5, 'token for5', 'd7c6ccef44a34181aa2379f1803e7b72e13052b1f10ad159c251748430d6ed05', '[\"*\"]', NULL, NULL, '2025-05-02 21:25:37', '2025-05-02 21:25:37'),
(36, 'App\\Models\\User', 7, 'token for7', '8c4aef5b04c48f80ef991eccd2230c543ba13598e8f7de910d13b0dd97e8c58a', '[\"*\"]', NULL, NULL, '2025-05-02 21:26:06', '2025-05-02 21:26:06'),
(37, 'App\\Models\\User', 7, 'token for7', 'f7fe8526bdb2fb3f8e4f8d4ac51f3085e7667ed3dc0ecb350d4eaf85487c05aa', '[\"*\"]', NULL, NULL, '2025-05-02 21:26:54', '2025-05-02 21:26:54'),
(38, 'App\\Models\\User', 5, 'token for5', 'e73537b4a964078280265a33440ff1f4bc52df25f819687a33974f01998251a8', '[\"*\"]', NULL, NULL, '2025-05-02 21:29:09', '2025-05-02 21:29:09'),
(39, 'App\\Models\\User', 5, 'token for5', 'f770c178df77918f7a2b6294566ddd89ad8c11827760d4ff62dd7b29e82330a8', '[\"*\"]', NULL, NULL, '2025-05-03 08:18:28', '2025-05-03 08:18:28'),
(40, 'App\\Models\\User', 5, 'token for5', '68368db1416d7df33f91e97d5efba52b0c1de62ec4509eba26e3a15bc4fd26d3', '[\"*\"]', NULL, NULL, '2025-05-04 18:39:15', '2025-05-04 18:39:15'),
(41, 'App\\Models\\User', 5, 'token for5', 'ce88f35b5d8c01ad75ab139e469f80231dc52c0b9d38b5d608a42c7d2e3a6c90', '[\"*\"]', NULL, NULL, '2025-05-04 21:11:55', '2025-05-04 21:11:55'),
(42, 'App\\Models\\User', 5, 'token for5', '5e6b60139b7909e09e2a5d42afe9cf4f05b0720b7b63f03412ef231c02e3dd5f', '[\"*\"]', NULL, NULL, '2025-05-04 21:12:20', '2025-05-04 21:12:20'),
(43, 'App\\Models\\User', 5, 'token for5', 'c7e1d7da1d602279d8538b084ac51fee4315d9297398d04cfd67c0465498e58c', '[\"*\"]', NULL, NULL, '2025-05-04 21:35:33', '2025-05-04 21:35:33'),
(44, 'App\\Models\\User', 5, 'token for5', '7d6b0685f06e78e6b78911ba759570420bbbf9380eae7f941785666e9e80bacc', '[\"*\"]', NULL, NULL, '2025-05-04 21:37:32', '2025-05-04 21:37:32'),
(45, 'App\\Models\\User', 5, 'token for5', '3970d023e3af7d7c8b9e3a970e4b46e0e04aa13d3b57cc7c4d3652a6af529eef', '[\"*\"]', NULL, NULL, '2025-05-04 21:39:06', '2025-05-04 21:39:06'),
(46, 'App\\Models\\User', 5, 'token for5', '46291689e9b278e7da418d4b296fed8f1800725aec0e46b8213fea93624548d8', '[\"*\"]', NULL, NULL, '2025-05-04 21:45:12', '2025-05-04 21:45:12'),
(47, 'App\\Models\\User', 5, 'token for5', '10b82386bf216225ab73334d9a75befcd66a306556d4a621c14ee0c4a43de8fb', '[\"*\"]', NULL, NULL, '2025-05-04 21:46:27', '2025-05-04 21:46:27'),
(48, 'App\\Models\\User', 5, 'token for5', 'c68a983da9570086cdf54be2e69ba2efbd7ab8189f4974e8c41bca7596f4de24', '[\"*\"]', NULL, NULL, '2025-05-04 21:49:23', '2025-05-04 21:49:23'),
(49, 'App\\Models\\User', 5, 'token for5', '9d09bb8ffde2ef7a2b3e0c5058594cb16dc6cc6d86c71e6bb33612edd196dda3', '[\"*\"]', NULL, NULL, '2025-05-04 21:49:54', '2025-05-04 21:49:54'),
(50, 'App\\Models\\User', 5, 'token for5', '63ef2dc617d271a6a2209424c7f966b6bece1fe8f69f5706aa1bee9aca04592d', '[\"*\"]', NULL, NULL, '2025-05-04 21:53:51', '2025-05-04 21:53:51'),
(51, 'App\\Models\\User', 5, 'token for5', '17b53fdd92842e966e0642daceff19c80b3be77f523d8662761aedab37e425c3', '[\"*\"]', NULL, NULL, '2025-05-05 00:23:31', '2025-05-05 00:23:31'),
(52, 'App\\Models\\User', 5, 'token for5', 'a6c531094adf2925deb9a379253b22c8f9c1de64842048e60c023071b1b02b83', '[\"*\"]', NULL, NULL, '2025-05-05 00:24:29', '2025-05-05 00:24:29'),
(53, 'App\\Models\\User', 5, 'token for5', '14e9f7377a6ce7cb1b44f5adec009670b002b9bb62554137ddd9eeaf91f872ef', '[\"*\"]', NULL, NULL, '2025-05-07 00:34:07', '2025-05-07 00:34:07'),
(54, 'App\\Models\\User', 5, 'token for5', '3372f6fa1085aeeadd4a508bf71da3856958d0fea5780279cdce43d5ff5ee9b1', '[\"*\"]', NULL, NULL, '2025-05-07 01:18:25', '2025-05-07 01:18:25'),
(55, 'App\\Models\\User', 7, 'token for7', '661c919922f00f67ae87826618c329cc832bdfa8092a797891c7a1ede5d59a22', '[\"*\"]', NULL, NULL, '2025-05-07 01:20:42', '2025-05-07 01:20:42'),
(56, 'App\\Models\\User', 7, 'token for7', 'f116194e01c5cf1191ddf39318eff337fb771cce3b93abc0024290e1669e8136', '[\"*\"]', NULL, NULL, '2025-05-07 01:22:06', '2025-05-07 01:22:06'),
(57, 'App\\Models\\User', 5, 'token for5', 'c106a53290972756c929497588e0fadd3af2feaa23cba5ca84ff24919d6a3846', '[\"*\"]', NULL, NULL, '2025-05-10 00:10:21', '2025-05-10 00:10:21'),
(58, 'App\\Models\\User', 7, 'token for7', 'ae1e687716a0a900839ad95410093cf9fa13f2d1414bff70db8d529abadc6bab', '[\"*\"]', NULL, NULL, '2025-05-10 00:43:20', '2025-05-10 00:43:20'),
(59, 'App\\Models\\User', 5, 'token for5', 'a0a244fd843af2b93c58f4f9a802a4bd6e681121ebdd78066cf02615ae7a8e30', '[\"*\"]', NULL, NULL, '2025-05-10 04:17:50', '2025-05-10 04:17:50'),
(60, 'App\\Models\\User', 5, 'token for5', 'db1494427f2d1d17201a8c361293c34841f658fd8ca7189155f3e324bb1322d1', '[\"*\"]', NULL, NULL, '2025-05-10 05:12:30', '2025-05-10 05:12:30'),
(61, 'App\\Models\\User', 5, 'token for5', '3ffcb4121f94f3bedbbe1f48acc3863009559c12c89788eff6a26a4e37213d33', '[\"*\"]', NULL, NULL, '2025-05-11 03:18:32', '2025-05-11 03:18:32'),
(62, 'App\\Models\\User', 7, 'token for7', '3ab9a07e028c0fc16ebdf05e60ab2519f2bffa7f48c960ba34f54f55612d5507', '[\"*\"]', NULL, NULL, '2025-05-11 04:27:58', '2025-05-11 04:27:58'),
(63, 'App\\Models\\User', 5, 'token for5', '483e0e2f9fb0dcb563629e176553af3d2cc432d26cdb6c8cc3722a3f6cd6b9cb', '[\"*\"]', NULL, NULL, '2025-05-12 00:28:45', '2025-05-12 00:28:45'),
(64, 'App\\Models\\User', 5, 'token for5', 'b2cfee4a7f0ee80879fb60a93fbf5fc3811675fe35f7593fe53c53c034e3a458', '[\"*\"]', NULL, NULL, '2025-05-12 14:24:39', '2025-05-12 14:24:39'),
(65, 'App\\Models\\User', 5, 'token for5', '289757cf1b56d8c775969942801ff8506d24ca8a3fba4b66029e6bcffcd784b0', '[\"*\"]', NULL, NULL, '2025-05-13 14:12:25', '2025-05-13 14:12:25'),
(66, 'App\\Models\\User', 7, 'token for7', '8431f145cb6e29ac41163e428a0e263d6a6cfd5823e4910c5e24de2251998af1', '[\"*\"]', NULL, NULL, '2025-05-13 14:18:34', '2025-05-13 14:18:34'),
(67, 'App\\Models\\User', 5, 'token for5', '5a9b2576b8ab430be80791f04366a27ae95b865023a09bf57be0a944f84748a3', '[\"*\"]', NULL, NULL, '2025-05-18 00:01:21', '2025-05-18 00:01:21'),
(68, 'App\\Models\\User', 7, 'token for7', '9a3462e4a21cc8a2448d3858814c784e28c1ff487b8637bba5ba52f20ab53500', '[\"*\"]', NULL, NULL, '2025-05-18 01:16:36', '2025-05-18 01:16:36'),
(69, 'App\\Models\\User', 6, 'token for6', 'd64ebf6ecf7ec7f837dc134cae4c064d005750d82d2ebf13c888fc3d8d1c2f30', '[\"*\"]', NULL, NULL, '2025-05-18 01:29:08', '2025-05-18 01:29:08'),
(70, 'App\\Models\\User', 7, 'token for7', '1bde3ffce0f768fac92eb83c5b7742670b208dfcb1f97bb3111d4c48eb1d0b39', '[\"*\"]', NULL, NULL, '2025-05-18 01:30:39', '2025-05-18 01:30:39'),
(71, 'App\\Models\\User', 6, 'token for6', 'cb78c629011faaecb5acf044eb445290a491acaf2202222fdd1a9be53cf55458', '[\"*\"]', NULL, NULL, '2025-05-18 01:31:01', '2025-05-18 01:31:01'),
(72, 'App\\Models\\User', 5, 'token for5', '79aef3e926c79be77cb8e379dc136eb8d618f6323132b6731399ee15318b23d1', '[\"*\"]', NULL, NULL, '2025-05-19 06:44:41', '2025-05-19 06:44:41'),
(73, 'App\\Models\\User', 8, 'token for8', '28d4e5872a4658f5ecbd4c82dc56e66526355a4abbe4bf4a8f65bad043c8f5fd', '[\"*\"]', NULL, NULL, '2025-05-19 08:38:26', '2025-05-19 08:38:26'),
(74, 'App\\Models\\User', 8, 'token for8', 'd965a54b04b659788b01e682c1eebc37702e9bbbab827ae48558de5f1161e6c4', '[\"*\"]', NULL, NULL, '2025-05-19 08:59:41', '2025-05-19 08:59:41'),
(75, 'App\\Models\\User', 8, 'token for8', '2bbab448cf29db2c823e1b9255643e4f98b57724469fa89ea121006efc7c03f3', '[\"*\"]', NULL, NULL, '2025-05-19 09:08:53', '2025-05-19 09:08:53'),
(76, 'App\\Models\\User', 8, 'token for8', 'd6915b1997def3e586775871e0f6fd73cb73fcccd389eb39b02000aa8eb140eb', '[\"*\"]', NULL, NULL, '2025-05-19 09:13:29', '2025-05-19 09:13:29'),
(77, 'App\\Models\\User', 5, 'token for5', 'e8efaf039010755362bd52f847c58edcfc994c93cbab3570c1b56e1ebdb94191', '[\"*\"]', NULL, NULL, '2025-05-19 09:47:31', '2025-05-19 09:47:31'),
(78, 'App\\Models\\User', 9, 'token for9', '53f7345f0ad5b64aaf5b69e7679fa788ac0fc4116a7c763592d03c6cdd7e6b25', '[\"*\"]', NULL, NULL, '2025-05-19 10:26:36', '2025-05-19 10:26:36'),
(79, 'App\\Models\\User', 9, 'token for9', '5962deaae4ca51c612f01a0d7b0370f2198e3521c8103dd4580a9e750b522040', '[\"*\"]', NULL, NULL, '2025-05-19 10:27:08', '2025-05-19 10:27:08'),
(80, 'App\\Models\\User', 5, 'token for5', 'a94b17b6543af9c2f40392383deeadf564e4901d2b4f23ce8c18f9be94415c5b', '[\"*\"]', NULL, NULL, '2025-05-19 10:27:30', '2025-05-19 10:27:30'),
(81, 'App\\Models\\User', 10, 'token for10', 'a10e8c40ab88bf2769dc86b84d37249a895e9cf00fc21049bb44202158ab70cb', '[\"*\"]', NULL, NULL, '2025-05-19 10:31:50', '2025-05-19 10:31:50'),
(82, 'App\\Models\\User', 5, 'token for5', '5b6b0a7abcbbd5bc577f7e5246597c190795fabb6966171b70d17da53db90e74', '[\"*\"]', NULL, NULL, '2025-05-20 01:40:43', '2025-05-20 01:40:43'),
(83, 'App\\Models\\User', 9, 'token for9', '301833340cbd1c3723c56bde0da1b52e10e13cc37162c6b38effdc7fd70479c6', '[\"*\"]', NULL, NULL, '2025-05-20 02:51:05', '2025-05-20 02:51:05'),
(84, 'App\\Models\\User', 5, 'token for5', 'ba9c02a44235fab0aa88c32b4e94b4494bd29b83b2ebd5314c461befd58e0d5d', '[\"*\"]', NULL, NULL, '2025-05-20 02:51:23', '2025-05-20 02:51:23'),
(85, 'App\\Models\\User', 9, 'token for9', '5452f541026ae36a6176f4f17654d83223220e9798170ec2ffe814065588730b', '[\"*\"]', NULL, NULL, '2025-05-20 02:51:56', '2025-05-20 02:51:56'),
(86, 'App\\Models\\User', 9, 'token for9', 'd858470164c3557583e87e8fd4a21f176ea50331a2692619e546b2a46a68ecf5', '[\"*\"]', NULL, NULL, '2025-05-20 02:52:48', '2025-05-20 02:52:48'),
(87, 'App\\Models\\User', 9, 'token for9', 'b86bf6d58e9b4c3fcc3f59964601acce3e3cf1f73ea4c311c5ed2dcbf8064ad7', '[\"*\"]', NULL, NULL, '2025-05-20 02:56:42', '2025-05-20 02:56:42'),
(88, 'App\\Models\\User', 5, 'token for5', '15d4ccf905d8dee299c1f88c2bb904edd38e0116ff87d16a57df4bfa0cff7c0b', '[\"*\"]', NULL, NULL, '2025-05-20 10:11:47', '2025-05-20 10:11:47'),
(89, 'App\\Models\\User', 10, 'token for10', '09fb428e133b2e0fb7cf169aa53ce3b13e28782db16afb5ee5d2119da6d98ed2', '[\"*\"]', NULL, NULL, '2025-05-20 10:14:17', '2025-05-20 10:14:17'),
(90, 'App\\Models\\User', 14, 'token for14', '0ba53c7066377d788df83b7b38e9db617d2ded2b5944c557ea0d9cae6220df3d', '[\"*\"]', NULL, NULL, '2025-05-20 10:21:17', '2025-05-20 10:21:17'),
(91, 'App\\Models\\User', 10, 'token for10', '8c6681a8fa293bb14332387de1565ec791afd468802c42194b41a54078a9900f', '[\"*\"]', NULL, NULL, '2025-05-20 10:23:56', '2025-05-20 10:23:56'),
(92, 'App\\Models\\User', 10, 'token for10', '97d2566b6016cae9c7c0ea2f032ece3a4e459d49836e3911b2682e573c150856', '[\"*\"]', NULL, NULL, '2025-05-20 17:59:51', '2025-05-20 17:59:51'),
(93, 'App\\Models\\User', 5, 'token for5', '4ad9b99c1e0a3ef6ddad1b6064032976a20468cc1b6338a0bf8ee93ce65e6e93', '[\"*\"]', NULL, NULL, '2025-05-20 18:00:50', '2025-05-20 18:00:50');

-- --------------------------------------------------------

--
-- Table structure for table `pos_reserve_products`
--

CREATE TABLE `pos_reserve_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `note` text DEFAULT NULL,
  `product` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `overall_quantity` int(11) NOT NULL,
  `overall_total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `date_released` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_name`, `product_label`, `product_price`, `image`, `label_category`, `quantity`, `description`, `date_released`, `created_at`, `updated_at`) VALUES
(3, 'Nicotine Salts', 'ICE PEACH MANGO - VGOD SALTS - 30ML', '350', 'jLjkILac9O1bkKW3Az83PERLgHTnzxX9oN54ttPp.png', 'none', '350', 'Explore the Iced Peach Mango by VGOD Salts, a 30mL nicotine salt e-liquid blending sun-ripened peaches and juicy mango with a cool menthol finish for a tropical and frosty vape.', '2025-04-22', '2025-04-22 05:36:43', '2025-04-22 05:36:43'),
(4, 'Nicotine Salts', 'ICED BLUE RAZZ - VGOD SALTS - 30ML', '350', '2uLUyambXQIvZka5dZ6ISk1gq9EWFXTDkeHptzIE.png', 'none', '350', 'Explore the Iced Blue Razz by VGOD Salts, a 30mL nicotine salt blend that fuses bold blue raspberry flavor with a crisp menthol kick for an invigorating, fruit-frosted vape.', '2025-04-22', '2025-04-22 05:38:24', '2025-04-22 05:38:24'),
(5, 'Nicotine Salts', 'PURE FLAVORLESS - BLVK PURE SALTS - 30ML', '350', 'E6CRrKUsCmcRp6gxnVEsjxdXVKWbvaSfVYMejIa7.png', 'none', '350', 'Discover Pure by BLVK Salts, a flavorless nicotine salt blend formulated sans menthol, sweeteners, or flavor enhancers to give the taste buds a break.', '2025-04-22', '2025-04-22 05:41:28', '2025-04-22 05:41:28'),
(6, 'Rechargeable Disposables', 'PICA BAR TUNING - 30K DISPOSABLE KITS', '650', 'l10QL0Cq6ecWJxX9HglMFqZLtNqOWUKD4XOcjVXS.png', 'best-seller', '650', 'Discover the Pica Bar Tuning 30K Disposable Kit, featuring a magnetic 1400mAh battery, 19mL disposable pod with 250mAh battery, and sour or ice adjustment.', '2025-04-22', '2025-04-22 05:53:03', '2025-04-22 05:53:03'),
(7, 'Rechargeable Disposables', 'KANGVAPE SPEEDY BEAST X 60K DISPOSABLE', '650', 'u4qXnVnWxtZHK2e1OHbblHwxFSVrh0PZ9h7OZHLX.png', 'best-seller', '650', 'Check out the Kangvape Speedy Beast X 60K Disposable, featuring 20mL prefilled capacity, dual mesh coils, and up to 60,000 puffs of delicious flavor.', '2025-04-22', '2025-04-22 05:55:22', '2025-04-22 05:55:22'),
(8, '20000 Puffs Disposables', 'OXBAR ASTRO MAZE 50K DISPOSABLES', '650', '78JNudtDw1xvYUrsjDuiagF4KOPFsT8rFn2ymP6z.png', 'new-arrival', '650', 'Check out the OXBAR Astro Maze 50K Disposable, featuring a large prefilled capacity, 900mAh battery, airflow control, and the long-lasting triple UNIONE mesh coils.', '2025-04-22', '2025-04-22 06:13:18', '2025-04-22 06:13:18'),
(9, '20000 Puffs Disposables', 'BERI CRUSH 50K DISPOSABLES', '650', 'BGumW6t2QmFJN65PUpRo2OFyqiiYOAbASdNYJKSJ.png', 'new-arrival', '650', 'Discover the Beri Crush 50K Disposable, featuring a 20mL prefilled capacity, 50K puff delivery, and offers the first Crush Mode, ramping power to 40W.', '2025-04-22', '2025-04-22 06:15:22', '2025-04-22 06:15:23'),
(10, 'Nicotine Free Disposables', 'LOST MARY MT15000 TURBO 0% NICOTINE DISPOSABLES', '650', 'uWXycr7e3eGk9Hu2QLo1xDtU2djckU09DLeidbLk.png', 'none', '650', 'Discover the Lost Mary MT15000 Turbo 0% Zero Nicotine Disposable, featuring 15,000 puffs, dual-mesh coils, and advanced indicators for a top-tier vaping experience.', '2025-04-22', '2025-04-22 06:18:06', '2025-04-22 06:18:06'),
(11, 'Nicotine Free Disposables', 'SPACEMAN SP40K 0% NICOTINE DISPOSABLES', '650', 'Ls9wfHZ6S8hgWeQtMHvdNx8WvUov0jbGeON77OM7.png', 'none', '650', 'Check out the Spaceman SP40K 0% Zero Nicotine Disposable, offering 20mL prefilled e-liquid, 40,000 puffs, dual mesh coils, digital screen, and USB-C charging.', '2025-04-22', '2025-04-22 06:19:58', '2025-04-22 06:19:58'),
(12, 'Box Mod Kits', 'ASPIRE BOXXER 80W STARTER KITS', '850', 'vWNCLDo57DGGysOLUhF8w9HlWij7zBOMlxQM93Tw.png', 'none', '850', 'Discover the Aspire Boxxer 80W Starter Kit, featuring a 5-80W output range, natively paired Aspire AF Tank, and powered by a single 18650 battery (sold separately).', '2025-04-22', '2025-04-22 06:25:39', '2025-04-22 06:25:39'),
(13, 'Pod Systems', 'OUMIER WASP NANO X POD SYSTEM', '550', 'UQrzc894JFlKH6Yhsgpu6K0lQQpOakCgGExtejTb.png', 'none', '550', 'Check out the Oumier Wasp Nano X Pod System, featuring a 1000mAh battery, aluminum-alloy chassis construction, and holds 2mL within the PCTG refillable pods.', '2025-04-22', '2025-04-22 06:28:07', '2025-04-22 06:28:07'),
(14, 'Fruit Flavors', 'FRUTTA ROOL - GREEN REDS', '350', 'Ph98JDi7QECiK3BUS80WJxxzRB6oewliHXVB6OAS.jpg', 'none', '350', 'Explore the Green Apple by Frutta Rool, a 15mL nicotine fruity e-liquid.', '2025-04-23', '2025-04-22 23:25:48', '2025-04-22 23:25:48');

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_type` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`id`, `product_type`, `product_name`, `description`, `created_at`, `updated_at`) VALUES
(4, 'E-Liquids', 'Nicotine Salts', 'Get a flavorful hit whenever you buy vape juices!', '2025-04-22 05:30:25', '2025-04-22 05:30:25'),
(5, 'Disposables', 'Rechargeable Disposables', 'Shop the best collection of Rechargeable Disposables, offering a longer-lasting feature to your convenient on-the-go vape.', '2025-04-22 05:47:43', '2025-04-22 05:47:43'),
(6, 'E-Liquids', 'Fruit Flavors', 'Get a flavorful hit whenever you buy vape juices!', '2025-04-22 06:00:43', '2025-04-22 06:00:43'),
(7, 'Disposables', '20000 Puffs Disposables', 'Shop the best collection of Rechargeable Disposables, offering a longer-lasting feature to your convenient on-the-go vape.', '2025-04-22 06:08:56', '2025-04-22 06:08:56'),
(8, 'Disposables', 'Nicotine Free Disposables', 'Shop the best collection of Rechargeable Disposables, offering a longer-lasting feature to your convenient on-the-go vape.', '2025-04-22 06:09:27', '2025-04-22 06:09:27'),
(9, 'Vape Kits', 'Box Mod Kits', 'Skip the hassle of building your own vape and shop vape kits.', '2025-04-22 06:22:30', '2025-04-22 06:22:30'),
(10, 'Vape Kits', 'Pod Systems', 'Skip the hassle of building your own vape and shop vape kits.', '2025-04-22 06:23:15', '2025-04-22 06:23:15'),
(11, 'Devices', 'Vape Pens', 'Next step up from disposable cigarettes and closed pod systems. Vape pens are small, slender devices that look like pens, which is where they get the name.', '2025-05-10 04:07:29', '2025-05-10 04:07:29'),
(12, 'Accesories', 'Batteries', 'We carry all the standard accessories that you need, such as replacement parts, batteries, coils, chargers, adapters, cords, mouthpieces, filters, tanks, stash gear, and much more. If you need a part or are just browsing, check out the products in our collection.', '2025-05-10 04:09:48', '2025-05-10 04:09:48'),
(15, 'Accesories', 'Chargers', 'We carry all the standard accessories that you need, such as replacement parts, batteries, coils, chargers, adapters, cords, mouthpieces, filters, tanks, stash gear, and much more. If you need a part or are just browsing, check out the products in our collection.', '2025-05-10 04:14:54', '2025-05-10 04:33:06'),
(16, 'Accesories', 'Replacement Coils', 'We carry all the standard accessories that you need, such as replacement parts, batteries, coils, chargers, adapters, cords, mouthpieces, filters, tanks, stash gear, and much more. If you need a part or are just browsing, check out the products in our collection.', '2025-05-10 05:00:16', '2025-05-10 05:00:16'),
(17, 'Accesories', 'Replacement Parts', 'We carry all the standard accessories that you need, such as replacement parts, batteries, coils, chargers, adapters, cords, mouthpieces, filters, tanks, stash gear, and much more. If you need a part or are just browsing, check out the products in our collection.', '2025-05-10 05:00:32', '2025-05-10 05:00:32'),
(18, 'Accesories', 'Replacement Pods Cartridges', 'We carry all the standard accessories that you need, such as replacement parts, batteries, coils, chargers, adapters, cords, mouthpieces, filters, tanks, stash gear, and much more. If you need a part or are just browsing, check out the products in our collection.', '2025-05-10 05:01:20', '2025-05-10 05:01:20'),
(19, 'Accesories', 'Glass Accesories', 'We carry all the standard accessories that you need, such as replacement parts, batteries, coils, chargers, adapters, cords, mouthpieces, filters, tanks, stash gear, and much more. If you need a part or are just browsing, check out the products in our collection.', '2025-05-10 05:01:55', '2025-05-10 05:01:55'),
(20, 'Accesories', 'Rebuildable Materials', 'We carry all the standard accessories that you need, such as replacement parts, batteries, coils, chargers, adapters, cords, mouthpieces, filters, tanks, stash gear, and much more. If you need a part or are just browsing, check out the products in our collection.', '2025-05-10 05:02:29', '2025-05-10 05:02:29');

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

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('HglPAJStkZ4VCtuIRVCsYB0fhItn0dZGlJNREdDh', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36 Edg/136.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicVlVbmxjd2lIU2dCY2xldFlPMFBadGZ3UXB3bEQ0bWFpVXN5T1JjOCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi1kYXNoYm9hcmQiO319', 1747793894),
('r5S3hOQvSNDZGEDOa819EHwBk04wjOgmxPBSBMTt', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36 Edg/136.0.0.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoieVk2VXZlMTQyc2JNdHhWcVFPS3UzbjBLOGZRR3hScXlENE1oSGZoSyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747792792);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('client','admin','staff') NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `mobile_no` varchar(255) DEFAULT NULL,
  `gender` enum('male','female','other') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `middle_name`, `address`, `email`, `email_verified_at`, `password`, `role`, `image`, `remember_token`, `created_at`, `updated_at`, `mobile_no`, `gender`) VALUES
(5, 'Rhonas', 'Sales', 'Laguerta', NULL, 'admin@gmail.com', NULL, '$2y$12$6wJggqN1TmkJdayhQj6urecz1hrqg5alK/eOcdiuu4pml/IbuwPPa', 'admin', 'hE1LnUbLm1Y7MHY7AyCnXbcuODokhDXdZ9bwYx4L.png', NULL, '2025-04-29 13:57:28', '2025-05-05 00:33:01', NULL, NULL),
(10, 'Rhonalyn', 'Sales', NULL, NULL, 'client@gmail.com', NULL, '$2y$12$AliHbbtoRCxi6gqFPPE4g.2IpJNKDKrUZ86lng/dAheh/mfhP61Fy', 'client', NULL, NULL, '2025-05-19 10:31:40', '2025-05-20 10:17:46', NULL, NULL),
(11, 'Rhunalen', 'Sales', 'Sales', NULL, 'ganda@gmail.com', NULL, '$2y$12$Pu3UMaFBw72EoHg6kiO9Qe2E90lIy/pDn56SVNae9lWb8zeHoqyvm', 'staff', NULL, NULL, '2025-05-20 02:10:10', '2025-05-20 02:10:10', NULL, NULL),
(14, 'Zhask', 'Mimay', 'Mimay', NULL, 'staff999@gmail.com', NULL, '$2y$12$t10lAa2j0Y2FocOaVpyavOWesY/bwwCfpw3Pyyp.ZjexuOGSLNW7.', 'staff', NULL, NULL, '2025-05-20 10:20:57', '2025-05-20 10:20:57', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_orders`
--

CREATE TABLE `user_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `order_first_name` varchar(255) DEFAULT NULL,
  `order_last_name` varchar(255) DEFAULT NULL,
  `order_mobile_no` varchar(255) DEFAULT NULL,
  `floor_unit_no` varchar(255) DEFAULT NULL,
  `island` varchar(255) DEFAULT NULL,
  `regions` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `municipality` varchar(255) DEFAULT NULL,
  `barangay` varchar(255) DEFAULT NULL,
  `order_id` int(11) NOT NULL,
  `order_total` int(11) NOT NULL,
  `order_quantity` int(11) NOT NULL,
  `status` enum('cancelled','pending','out-of-delivery','received','completed') NOT NULL,
  `date_order` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_orders`
--

INSERT INTO `user_orders` (`id`, `user_id`, `order_first_name`, `order_last_name`, `order_mobile_no`, `floor_unit_no`, `island`, `regions`, `province`, `municipality`, `barangay`, `order_id`, `order_total`, `order_quantity`, `status`, `date_order`, `created_at`, `updated_at`) VALUES
(5, 7, 'hehe', 'be', 'edeed', '2e', 'Visayas', 'Western Visayas', 'Antique', 'Bugasong', 'Arangote', 8, 1300, 2, 'pending', '2025-06-01-Thu', '2025-05-01 06:57:20', '2025-05-20 12:18:28'),
(7, 7, 'Kiel', 'Bermudez', '09193471522', 'blk 14 lot 10', 'Luzon', 'Cagayan Valley', 'Nueva Vizcaya', 'Bayombong', 'Buenavista', 8, 1300, 2, 'cancelled', '2024-07-11-Sun', '2025-05-11 04:28:46', '2025-05-11 04:28:46'),
(8, 7, 'Kiel', 'Bermudez', '09193471522', 'blk 14 lot 10', 'Luzon', 'Cagayan Valley', 'Nueva Vizcaya', 'Bayombong', 'Buenavista', 7, 650, 1, 'received', '2025-05-20-Sun', '2025-07-11 04:28:46', '2025-05-20 12:29:22'),
(9, 7, 'Kiel', 'Bermudez', '09193471522', 'blk 14 lot 10', 'Luzon', 'Cagayan Valley', 'Nueva Vizcaya', 'Bayombong', 'Buenavista', 6, 650, 1, 'completed', '2025-12-15-Sun', '2025-05-11 04:28:46', '2025-05-11 04:28:46'),
(10, 7, 'Rhonalyn', 'Sales', '09946141965', 'blk1 lot2', 'Luzon', 'CALABARZON', 'Cavite', 'Tanza', 'Paradahan I', 5, 350, 1, 'pending', '2025-05-13-Tue', '2025-05-13 14:24:16', '2025-05-13 14:24:16'),
(11, 7, 'Rhonalyn', 'Sales', '09946141965', 'blk1 lot2', 'Luzon', 'CALABARZON', 'Cavite', 'Tanza', 'Paradahan I', 9, 650, 1, 'pending', '2025-05-13-Tue', '2025-05-13 14:24:16', '2025-05-13 14:24:16'),
(12, 7, 'dasd', 'asdas', 'dsad', 'asdsa', 'Luzon', 'Ilocos Region', 'Ilocos Norte', 'Burgos', 'Buduan', 14, 350, 1, 'pending', '2025-05-18-Sun', '2025-05-18 01:16:53', '2025-05-18 01:16:53'),
(13, 7, 'das', 'dsad', 'sadsadsa', 'dasd', 'Luzon', 'Cagayan Valley', 'Batanes', 'Basco', 'Ihubok II', 8, 650, 1, 'pending', '2025-05-18-Sun', '2025-05-18 01:18:30', '2025-05-18 01:18:30'),
(14, 7, 'das', 'dsad', 'sadsadsa', 'dasd', 'Luzon', 'Cagayan Valley', 'Batanes', 'Basco', 'Ihubok II', 9, 650, 1, 'cancelled', '2025-05-18-Sun', '2025-05-18 01:18:30', '2025-05-20 12:03:54'),
(15, 7, 'OKAY KAU', 'DAS', 'DSAD', 'ASDAS', 'Luzon', 'Ilocos Region', 'Ilocos Norte', 'Bangui', 'Dadaor', 8, 650, 1, 'pending', '2025-05-18-Sun', '2025-05-18 01:19:17', '2025-05-18 01:19:17'),
(16, 7, 'OKAY KAU', 'DAS', 'DSAD', 'ASDAS', 'Luzon', 'Ilocos Region', 'Ilocos Norte', 'Bangui', 'Dadaor', 9, 650, 1, 'pending', '2025-05-18-Sun', '2025-05-18 01:19:17', '2025-05-18 01:19:17'),
(17, 6, 'dsad', 'dasd', 'sadas', 'dasdsa', 'Luzon', 'Ilocos Region', 'Ilocos Norte', 'Adams', 'Adams (Pob.)', 9, 650, 1, 'pending', '2025-05-18-Sun', '2025-05-18 01:31:22', '2025-05-18 01:31:22'),
(18, 6, 'dsad', 'dasd', 'sadas', 'dasdsa', 'Luzon', 'Ilocos Region', 'Ilocos Norte', 'Adams', 'Adams (Pob.)', 8, 650, 1, 'pending', '2025-05-18-Sun', '2025-05-18 01:31:22', '2025-05-18 01:31:22'),
(19, 10, 'dadsd', 'dadsd', '12212', 'dsads', 'Luzon', 'CALABARZON', 'Laguna', 'Cavinti', 'Bukal', 14, 350, 1, 'completed', '2025-05-20-Tue', '2025-05-20 11:21:24', '2025-05-20 12:30:03'),
(20, 10, 'ed', 'dd', '9193471522', 'sda', 'Luzon', 'Central Luzon', 'Bataan', 'Hermosa', 'Bamban', 9, 650, 1, 'completed', '2025-05-20-Tue', '2025-05-20 12:32:20', '2025-05-20 12:43:46'),
(21, 10, 'Kiel', 'sds', '2', 'adsadasd', 'Luzon', 'Ilocos Region', 'Ilocos Norte', 'Adams', 'Adams (Pob.)', 8, 650, 1, 'received', '2025-05-20-Tue', '2025-05-20 12:51:37', '2025-05-20 12:59:33'),
(22, 10, 'bjb', 'jbjb', '282', 'bjbj', 'Luzon', 'Ilocos Region', 'Ilocos Norte', 'Adams', 'Adams (Pob.)', 14, 350, 1, 'cancelled', '2025-05-20-Tue', '2025-05-20 13:12:36', '2025-05-20 13:12:36'),
(23, 5, 'axbuabx', 'x hav', '9946242967', 'blk6 lot77', 'Visayas', 'Central Visayas', 'Cebu', 'Aloguinsan', 'Bonbon', 9, 1950, 3, 'completed', '2025-05-21-Wed', '2025-05-20 18:03:18', '2025-05-20 18:05:29');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address__books`
--
ALTER TABLE `address__books`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `content_management`
--
ALTER TABLE `content_management`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `pos_reserve_products`
--
ALTER TABLE `pos_reserve_products`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `user_orders`
--
ALTER TABLE `user_orders`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address__books`
--
ALTER TABLE `address__books`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `content_management`
--
ALTER TABLE `content_management`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `pos_reserve_products`
--
ALTER TABLE `pos_reserve_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `user_orders`
--
ALTER TABLE `user_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
