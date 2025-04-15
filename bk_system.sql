-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 14, 2025 at 10:37 PM
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
-- Database: `bk_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `account_number` varchar(8) NOT NULL,
  `pin` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `role` enum('customer','admin') NOT NULL DEFAULT 'customer',
  `balance` decimal(10,2) NOT NULL DEFAULT 0.00,
  `interest_rate` decimal(5,2) NOT NULL DEFAULT 2.00,
  `is_blocked` tinyint(1) NOT NULL DEFAULT 0,
  `failed_attempts` int(11) NOT NULL DEFAULT 0,
  `last_login` timestamp NULL DEFAULT NULL,
  `last_activity` timestamp NULL DEFAULT NULL,
  `transaction_limit` decimal(10,2) NOT NULL DEFAULT 1000000.00,
  `transfer_limit` decimal(10,2) NOT NULL DEFAULT 1000.00,
  `notification_preferences` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`notification_preferences`)),
  `daily_transaction_count` int(11) NOT NULL DEFAULT 0,
  `daily_transaction_reset` timestamp NULL DEFAULT NULL,
  `last_ip` varchar(255) DEFAULT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `account_number`, `pin`, `name`, `email`, `phone`, `role`, `balance`, `interest_rate`, `is_blocked`, `failed_attempts`, `last_login`, `last_activity`, `transaction_limit`, `transfer_limit`, `notification_preferences`, `daily_transaction_count`, `daily_transaction_reset`, `last_ip`, `session_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(6, '26423309', '$2y$12$vPlcC3d8rqm4icpg9oTgNOhhx.NU0wQqmZvIdjG/HkZKLFMaRG1tS', 'TUYIZERE AIMABLE', 'is@gmail', '0789105167', 'customer', 17745.00, 2.00, 0, 0, '2025-04-13 12:24:25', '2025-04-11 14:29:52', 1000000.00, 1000.00, '\"{\\\"email\\\":true,\\\"sms\\\":true}\"', 0, '2025-04-10 22:00:00', '127.0.0.1', NULL, NULL, '2025-04-11 14:29:52', '2025-04-13 12:24:25'),
(7, '56059667', '$2y$12$dUnYRipmmyEvLskf0aXz8.UeL8OID8OQzRg5UfOehf4FFWZfC/ddi', 'TUYIZERE AIMABLE', 'aimable@gmail.com', '0789105167', 'customer', 972955.00, 2.00, 0, 0, '2025-04-13 12:14:00', '2025-04-11 14:34:37', 1000000.00, 1000.00, '\"{\\\"email\\\":true,\\\"sms\\\":true}\"', 0, '2025-04-10 22:00:00', '127.0.0.1', NULL, NULL, '2025-04-11 14:34:37', '2025-04-13 12:14:00'),
(8, '86188350', '$2y$12$72afihDDblwu7FFtbbMoqucfr8DtxpF0s66LtKWvtKlI.P.k9NWwu', 'Aimable 1', 'eliasb2000k@gmail.com', '0789105167', 'customer', 49000.00, 2.00, 0, 0, '2025-04-11 17:44:12', '2025-04-11 17:37:28', 1000000.00, 1000.00, '\"{\\\"email\\\":true,\\\"sms\\\":true}\"', 0, '2025-04-10 22:00:00', '127.0.0.1', NULL, NULL, '2025-04-11 17:37:28', '2025-04-11 17:44:12'),
(9, '51558212', '$2y$12$MCJiYA66e9YIIGRy2bcm6OHIsJsyYKMJdXC6CC.nIQn0vhOQtbkce', 'NIYOMUKIZA aimable', 'alice.cooper@iprcmusanze.ac.rw', '0789105107', 'customer', 0.00, 2.00, 0, 0, NULL, '2025-04-11 17:46:48', 1000000.00, 1000.00, '\"{\\\"email\\\":true,\\\"sms\\\":true}\"', 0, '2025-04-10 22:00:00', NULL, NULL, NULL, '2025-04-11 17:46:48', '2025-04-11 17:46:48'),
(10, '69796361', '$2y$12$3ebMlIyK1ogI8yu3bOHOLe2t3GtDhLAQbmfG/ZmcPvxYA48mp1x.O', 'KEZA', 'keza@gmail.com', '0789105162', 'admin', 0.00, 2.00, 0, 0, NULL, NULL, 1000000.00, 1000.00, NULL, 0, NULL, NULL, NULL, NULL, '2025-04-11 17:55:17', '2025-04-11 17:55:17'),
(11, '58243917', '$2y$12$gCpKMNAdJJNGfMbmo7DBReDlYc3TNhX1F2IF/NIK9p2aky0682f2O', 'IGIRUWABO Dorcela', 'ismm@gmail', '0798700790', 'admin', 0.00, 2.00, 0, 0, NULL, NULL, 1000000.00, 1000.00, NULL, 0, NULL, NULL, NULL, NULL, '2025-04-11 18:30:44', '2025-04-11 18:30:44'),
(12, '81325065', '$2y$12$MytIOYeBGm9hN2E2UBT4J.7fW0eAduVG8AaWSUR.jSNLZ9H/pZD1u', 'addde', 'Celestinmugisha655@gmail.com', '0781482314', 'admin', 0.00, 2.00, 0, 0, NULL, NULL, 1000000.00, 1000.00, NULL, 0, NULL, NULL, NULL, NULL, '2025-04-11 18:48:53', '2025-04-11 18:48:53'),
(13, '61776348', '$2y$12$Kr/s8Xhlia6Q.NyaVRs3xuO/XwRiAvcX6h15tkmVxnv2IOlCdFk0W', 'sam', 'su@gmail.com', '0789105167', 'admin', 0.00, 2.00, 0, 0, '2025-04-13 10:39:04', '2025-04-13 09:50:02', 1000000.00, 1000.00, '\"{\\\"email\\\":true,\\\"sms\\\":true}\"', 0, '2025-04-12 22:00:00', '127.0.0.1', NULL, NULL, '2025-04-13 09:50:02', '2025-04-13 10:39:04'),
(14, '17199588', '$2y$12$HI4rdY38A2ybMeQjkjvox.U/K8E/ZnEv.cmF0o7cR7.YNwlOUzake', 'TUYIZERE AIMABLEj', 'iss@gmail', '0789105167', 'admin', 0.00, 2.00, 0, 0, '2025-04-13 10:43:49', '2025-04-13 10:40:31', 1000000.00, 1000.00, '\"{\\\"email\\\":true,\\\"sms\\\":true}\"', 0, '2025-04-12 22:00:00', '127.0.0.1', NULL, NULL, '2025-04-13 10:40:31', '2025-04-13 10:43:49'),
(15, '00000000', '$2y$12$eViqmyDKSKNVVnJ8BbIiueqgShlhJm2mU5B9xtKEIOb/II4n4Ryai', 'Admin User', 'admin@example.com', '1234567890', 'admin', 0.00, 2.00, 0, 0, '2025-04-13 12:34:21', '2025-04-13 10:42:15', 1000000.00, 1000.00, '\"{\\\"email\\\":true,\\\"sms\\\":true}\"', 0, '2025-04-12 22:00:00', '127.0.0.1', NULL, NULL, '2025-04-13 10:42:15', '2025-04-13 12:34:21');

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `account_id` bigint(20) UNSIGNED NOT NULL,
  `action` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_logs`
--

INSERT INTO `activity_logs` (`id`, `account_id`, `action`, `description`, `ip_address`, `user_agent`, `created_at`, `updated_at`) VALUES
(1, 6, 'account_creation', 'New account created with number: 26423309', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0', '2025-04-11 14:29:52', '2025-04-11 14:29:52'),
(2, 7, 'account_creation', 'New account created with number: 56059667', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0', '2025-04-11 14:34:37', '2025-04-11 14:34:37'),
(3, 8, 'account_creation', 'New account created with number: 86188350', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-11 17:37:28', '2025-04-11 17:37:28'),
(4, 9, 'account_creation', 'New account created with number: 51558212', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-04-11 17:46:48', '2025-04-11 17:46:48'),
(5, 13, 'account_creation', 'New account created with number: 61776348', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0', '2025-04-13 09:50:02', '2025-04-13 09:50:02'),
(6, 14, 'account_creation', 'New account created with number: 17199588', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0', '2025-04-13 10:40:31', '2025-04-13 10:40:31');

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
(7, '0001_01_01_000000_create_users_table', 1),
(8, '0001_01_01_000001_create_cache_table', 1),
(9, '0001_01_01_000002_create_jobs_table', 1),
(10, '2024_03_19_000001_create_accounts_table', 1),
(11, '2024_03_19_000002_create_transactions_table', 1),
(12, '2025_04_11_131506_create_notifications_table', 2),
(13, '2024_04_11_161500_add_missing_columns_to_accounts_table', 3),
(14, '2024_04_11_161700_modify_transactions_table', 4),
(15, '2024_04_11_162200_update_transactions_table', 5),
(16, '2024_04_11_162300_fix_transactions_table', 5),
(17, '2025_04_11_162824_create_activity_logs_table', 6),
(18, '2024_04_11_162400_update_transactions_table_again', 7);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `account_id` bigint(20) UNSIGNED NOT NULL,
  `message` varchar(255) NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
('bKtpWf1jGlykToVxww9ch61IGM5BPfxim3Rex6qR', 15, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiWWJCV0RzVW50Nmo5TXB5bjRvNUtwMzVVenYzbkRBajZZM05Jak9HYiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbiI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE1O30=', 1744554861),
('tvbwAtsBFHkuxmnYSYjaLGPK9nOS7bsbWeZJa6kU', 15, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiM1lPeTNNWjBibTJFZ2RvR2FtNG5EaGNMSUV5RWZMRkJqTjhBQVJQRSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbiI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE1O30=', 1744554752);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` varchar(10) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `balance_after` decimal(10,2) NOT NULL,
  `type` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `account_id` bigint(20) UNSIGNED NOT NULL,
  `recipient_account_number` varchar(8) DEFAULT NULL,
  `recipient_account` varchar(8) DEFAULT NULL,
  `sender_account` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `transaction_id`, `amount`, `balance_after`, `type`, `status`, `description`, `created_at`, `updated_at`, `account_id`, `recipient_account_number`, `recipient_account`, `sender_account`) VALUES
(2, NULL, 0.00, 0.00, 'account_creation', 'completed', 'Initial account creation', '2025-04-11 14:29:52', '2025-04-11 14:29:52', 6, NULL, NULL, NULL),
(3, NULL, 0.00, 0.00, 'account_creation', 'completed', 'Initial account creation', '2025-04-11 14:34:37', '2025-04-11 14:34:37', 7, NULL, NULL, NULL),
(4, NULL, -1000.00, 999000.00, 'transfer', 'completed', '1', '2025-04-11 15:55:05', '2025-04-11 15:55:05', 7, NULL, NULL, NULL),
(5, NULL, 1000.00, 1000.00, 'transfer', 'completed', '1', '2025-04-11 15:55:05', '2025-04-11 15:55:05', 6, NULL, NULL, NULL),
(6, NULL, -8000.00, 991000.00, 'transfer', 'completed', '1', '2025-04-11 15:59:24', '2025-04-11 15:59:24', 7, NULL, NULL, NULL),
(7, NULL, 8000.00, 9000.00, 'transfer', 'completed', '1', '2025-04-11 15:59:24', '2025-04-11 15:59:24', 6, NULL, NULL, NULL),
(8, NULL, -2000.00, 989000.00, 'transfer', 'completed', '1', '2025-04-11 16:04:25', '2025-04-11 16:04:25', 7, NULL, NULL, NULL),
(9, NULL, 2000.00, 11000.00, 'transfer', 'completed', '1', '2025-04-11 16:04:25', '2025-04-11 16:04:25', 6, NULL, NULL, NULL),
(10, NULL, -500.00, 988500.00, 'transfer', 'completed', '1', '2025-04-11 16:13:28', '2025-04-11 16:13:28', 7, NULL, NULL, NULL),
(11, NULL, 500.00, 11500.00, 'transfer', 'completed', '1', '2025-04-11 16:13:28', '2025-04-11 16:13:28', 6, NULL, NULL, NULL),
(12, NULL, -500.00, 988000.00, 'transfer', 'completed', '1', '2025-04-11 16:17:06', '2025-04-11 16:17:06', 7, NULL, NULL, NULL),
(13, NULL, 500.00, 12000.00, 'transfer', 'completed', '1', '2025-04-11 16:17:06', '2025-04-11 16:17:06', 6, NULL, NULL, NULL),
(14, NULL, -300.00, 987700.00, 'transfer', 'completed', '1', '2025-04-11 16:19:08', '2025-04-11 16:19:08', 7, NULL, '26423309', NULL),
(15, NULL, 300.00, 12300.00, 'transfer', 'completed', '1', '2025-04-11 16:19:08', '2025-04-11 16:19:08', 6, NULL, NULL, '56059667'),
(16, NULL, -300.00, 987400.00, 'withdrawal', 'completed', '1', '2025-04-11 16:38:02', '2025-04-11 16:38:02', 7, NULL, NULL, NULL),
(17, NULL, -1000.00, 986400.00, 'transfer', 'completed', '2', '2025-04-11 16:57:36', '2025-04-11 16:57:36', 7, NULL, '26423309', NULL),
(18, NULL, 1000.00, 13300.00, 'transfer', 'completed', '2', '2025-04-11 16:57:36', '2025-04-11 16:57:36', 6, NULL, NULL, '56059667'),
(19, NULL, -3445.00, 982955.00, 'transfer', 'completed', '004', '2025-04-11 17:35:02', '2025-04-11 17:35:02', 7, NULL, '26423309', NULL),
(20, NULL, 3445.00, 16745.00, 'transfer', 'completed', '004', '2025-04-11 17:35:02', '2025-04-11 17:35:02', 6, NULL, NULL, '56059667'),
(21, NULL, -10000.00, 972955.00, 'withdrawal', 'completed', '1', '2025-04-11 17:36:02', '2025-04-11 17:36:02', 7, NULL, NULL, NULL),
(22, NULL, 0.00, 0.00, 'account_creation', 'completed', 'Initial account creation', '2025-04-11 17:37:28', '2025-04-11 17:37:28', 8, NULL, NULL, NULL),
(23, NULL, -1000.00, 49000.00, 'transfer', 'completed', '1', '2025-04-11 17:41:00', '2025-04-11 17:41:00', 8, NULL, '26423309', NULL),
(24, NULL, 1000.00, 17745.00, 'transfer', 'completed', '1', '2025-04-11 17:41:00', '2025-04-11 17:41:00', 6, NULL, NULL, '86188350'),
(25, NULL, 0.00, 0.00, 'account_creation', 'completed', 'Initial account creation', '2025-04-11 17:46:48', '2025-04-11 17:46:48', 9, NULL, NULL, NULL),
(26, NULL, 0.00, 0.00, 'account_creation', 'completed', 'Account created', '2025-04-11 17:55:17', '2025-04-11 17:55:17', 10, NULL, NULL, NULL),
(27, NULL, 0.00, 0.00, 'account_creation', 'completed', 'Account created', '2025-04-11 18:30:44', '2025-04-11 18:30:44', 11, NULL, NULL, NULL),
(28, NULL, 0.00, 0.00, 'account_creation', 'completed', 'Account created', '2025-04-11 18:48:53', '2025-04-11 18:48:53', 12, NULL, NULL, NULL),
(29, NULL, 0.00, 0.00, 'account_creation', 'completed', 'Initial account creation', '2025-04-13 09:50:02', '2025-04-13 09:50:02', 13, NULL, NULL, NULL),
(30, NULL, 0.00, 0.00, 'account_creation', 'completed', 'Initial account creation', '2025-04-13 10:40:31', '2025-04-13 10:40:31', 14, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accounts_account_number_unique` (`account_number`),
  ADD UNIQUE KEY `accounts_email_unique` (`email`);

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_logs_account_id_foreign` (`account_id`);

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
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_account_id_foreign` (`account_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_account_id_foreign` (`account_id`);

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
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD CONSTRAINT `activity_logs_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
