-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 21, 2020 at 11:14 AM
-- Server version: 10.1.40-MariaDB
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dimvote`
--

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_11_12_210937_create_poll_table', 1),
(4, '2019_11_12_210959_create_vote_table', 1),
(5, '2019_11_12_211022_create_option_table', 1),
(6, '2019_11_13_214359_modify_start_date_end_date_types', 2),
(7, '2019_11_16_043030_rename_wallet_address_to_user_id', 3);

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `poll_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`id`, `title`, `poll_id`, `created_at`, `updated_at`) VALUES
(1, 'Messi', 20, '2019-11-14 05:09:12', '2019-11-14 05:09:12'),
(2, 'Ronaldo', 20, '2019-11-14 05:09:12', '2019-11-14 05:09:12'),
(3, 'Rivaldo', 20, '2019-11-14 05:09:12', '2019-11-14 05:09:12'),
(4, 'Ronaldinho', 20, '2019-11-14 05:09:12', '2019-11-14 05:09:12'),
(5, 'Figo', 20, '2019-11-14 05:09:12', '2019-11-14 05:09:12'),
(6, 'Giggs', 21, '2019-11-14 06:08:22', '2019-11-14 06:08:22'),
(7, 'Beckham', 21, '2019-11-14 06:08:22', '2019-11-14 06:08:22'),
(8, 'Nas', 12, '2019-11-15 18:03:55', '2019-11-15 18:03:55'),
(9, '2 Pac', 12, '2019-11-15 18:03:55', '2019-11-15 18:03:55'),
(10, 'Jay Z', 12, '2019-11-15 18:03:55', '2019-11-15 18:03:55'),
(11, 'Biggie', 12, '2019-11-15 18:03:55', '2019-11-15 18:03:55'),
(12, 'Eminem', 12, '2019-11-15 18:03:55', '2019-11-15 18:03:55'),
(13, 'DA', 23, '2019-11-18 17:00:17', '2019-11-18 17:00:17'),
(14, 'ANC', 23, '2019-11-18 17:00:17', '2019-11-18 17:00:17'),
(15, 'EFF', 23, '2019-11-18 17:00:18', '2019-11-18 17:00:18'),
(16, 'Dogs', 24, '2019-11-18 17:03:12', '2019-11-18 17:03:12'),
(17, 'Cats', 24, '2019-11-18 17:03:12', '2019-11-18 17:03:12'),
(18, 'Man u', 25, '2019-11-18 17:05:03', '2019-11-18 17:05:03'),
(19, 'chelsea', 25, '2019-11-18 17:05:03', '2019-11-18 17:05:03'),
(20, 'music', 26, '2020-05-23 12:09:40', '2020-05-23 12:09:40'),
(21, 'soccer', 26, '2020-05-23 12:09:40', '2020-05-23 12:09:40'),
(22, 'swimming', 26, '2020-05-23 12:09:40', '2020-05-23 12:09:40'),
(23, 'Denzel washington', 13, '2020-05-23 12:18:54', '2020-05-23 12:18:54'),
(24, 'George Clooney', 13, '2020-05-23 12:18:54', '2020-05-23 12:18:54'),
(25, 'Robert di niro', 13, '2020-05-23 12:18:54', '2020-05-23 12:18:54'),
(26, 'Will Smith', 27, '2020-05-23 12:18:54', '2020-05-23 12:18:54'),
(27, 'Uefa', 28, '2020-05-23 12:22:07', '2020-05-23 12:22:07'),
(28, 'fifa', 28, '2020-05-23 12:22:07', '2020-05-23 12:22:07');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `polls`
--

CREATE TABLE `polls` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `topic` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `polls`
--

INSERT INTO `polls` (`id`, `topic`, `description`, `start_date`, `end_date`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'jhjxNmG8Yp', 'ryXsTBNOcC0xar1lDlllxOl8flZN0r6VNXHNyYKZQ0qT4NOVjA', '2019-05-06 04:48:36', '2019-06-06 04:04:36', 2, NULL, NULL),
(2, 'mlTInfeNxA', 'aQu9Ejdhg03BwNDzpklzrvCCEHcOZx5R1w7XiMrhAFyoeLWHod', '2019-07-06 04:22:21', '2019-08-08 07:00:00', 1, NULL, NULL),
(3, 'zu4OQVVqpJ', 'rGq6ozA2rbqtGDxajxAZU2tFV2ZcCXCMxmenZFBjMFkQ9EVKwN', '2019-02-06 05:10:25', '2019-11-04 05:27:25', 3, NULL, NULL),
(4, 'l3wv6lDnLI', 'W1XE1fhnRBKqzEyky8FLRsUZDoueAjQMU7thaXAXWyYo0nFQKT', '2019-03-06 05:32:26', '2019-04-06 04:27:26', 1, NULL, NULL),
(5, 'irITMW9zMI', 'q5fDivEIk8WcxaucXT2vmUyDk4wGidR4hRacEJweNNMA8WWRG8', '2019-01-06 05:21:27', '2019-02-06 05:16:27', 3, NULL, NULL),
(6, '1eCB6cKe9y', 'H0XYyVwMvD3pQHQl2TNYnuACUiWgp3QwURclvnqKoj1gBO5ONc', '2019-10-06 04:20:29', '2019-11-06 05:33:29', 1, NULL, NULL),
(7, 'CYt3qfay06', 'FmtHSFKbUOZVHcAmXf7AMd6U70BcxgX4pHbOTPKo0QSaIaQjft', '2018-10-06 04:54:30', '2018-11-06 05:18:30', 1, NULL, NULL),
(8, 'Lam3YPgBrS', 'dhYyNLI4yyDuV3uOhrxIcjHfBkhEpR8bQ36oKdSIrAzu0A2Ea6', '2019-12-06 05:48:31', '2019-12-15 08:00:00', 3, NULL, NULL),
(9, 's6qrfxEDxQ', '3rii7lQ1Tcck32TShSrs4Nj6FI7WpbAOtz4JpuqTpiLdKuNvLh', '2019-12-16 05:18:32', '2019-12-26 05:37:32', 1, NULL, NULL),
(10, 'f7QURjqYC6', 'OsTo8NX2c5KxKTjWNvx4H5tAp8w2t6qw630CUHaFzrd0dy4Qx2', '2019-12-26 05:06:33', '2020-01-06 05:25:33', 2, NULL, NULL),
(11, '43BwRuJL5t', 'bbQ6NuBfZ7IX9kQ45S9YHJyUurPzACrmSb5zhFHTFb5noeqs1D', '2020-01-05 08:00:00', '2020-01-16 05:48:35', 1, NULL, NULL),
(12, 'oloI1msCUZ', 'hQZ73f5CYDtMMiQONQif4lu1QmJidOpGZGMJyYA5vW4OjaVJIa', '2019-11-06 05:25:36', '2019-11-21 05:43:36', 1, NULL, NULL),
(13, 'the last topic added on the poll', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley ', '2020-07-21 05:48:35', '2020-07-28 00:00:00', 1, '2020-07-20 22:00:00', NULL),
(20, 'Who is Better', 'sjdfbsdjfbjdshbfjdsbfhdsbfsd', '2020-01-23 00:00:00', '2020-01-30 00:00:00', 1, '2019-11-14 05:09:11', '2019-11-14 05:09:11'),
(21, 'Who is Better', 'kghfkhgkdhgjdfhku', '2020-01-30 00:00:00', '2020-02-06', 1, '2019-11-14 06:08:22', '2019-11-14 06:08:22'),
(22, 'Best Rappers', 'ndfkgjndjgkndfjkgndkjfngkdjngkjdnjkdfngjkdfngkd', '2020-02-06', '2020-02-13', 1, '2019-11-15 18:03:55', '2019-11-15 18:03:55'),
(23, 'poll for the nation', 'sjdldjlfkjdsfkjdslfkjdslkfjsld', '2020-02-13', '2020-02-20', 1, '2019-11-18 17:00:17', '2019-11-18 17:00:17'),
(24, 'lets test', 'sdfnsdfknsdkfjnsdk', '2020-02-20', '2020-02-27', 1, '2019-11-18 17:03:12', '2019-11-18 17:03:12'),
(25, 'first topic', 'djfkjdsnfjkdsnfjknsdjfknsdkjfnkdsjnfk', '2020-05-20 19:05:03', '2020-05-27 19:05:03', 1, '2020-05-20 17:05:03', '2020-05-20 17:05:03'),
(26, 'topic of the day', 'fgfdgdfgdfgdfgdfgdgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgfdgdfgdfgdfgdf', '2020-05-27 19:05:03', '2020-06-03', 1, '2020-05-23 12:09:39', '2020-05-23 12:09:39'),
(27, 'Who is Better', 'sdfsdjfndsjfnsdkjfndskjjfnkdjnfksdjnfkjsnfkjsdnfkjsdnfkjdsnfkjdsnfkjdsnfkjdsnfjkdsnkdskfjnsdkfjsd', '2020-06-03', '2020-06-10', 1, '2020-05-23 12:18:54', '2020-05-23 12:18:54'),
(28, 'just a test', 'fghhgfhgfhfghgfhfghfghfhfghfghfghfghfghfghfghfghgfhgfhfghfghfghfghfghfghfghgfhfghfhfh', '2020-06-10', '2020-06-17', 1, '2020-05-23 12:22:07', '2020-05-23 12:22:07');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `wallet_address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `wallet_address`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Nkjfghfdg8593458437534895khhjhkhkjhk7385', 'mokonyamabmg@gmail.com', '$2y$10$tGksMeqs8qWXapEAgccU.O/6niYWr1qFm90wfC//1oIO.W0jTEQzC', NULL, '2019-11-13 10:04:05', '2019-11-13 10:04:05'),
(2, 'Nkjfghfdg8593458437534895khhjhkhkjhk7387', 'mokonyamabmg2@gmail.com', '$2y$10$WlyWrSGU5Ya/4I2Xh7ybLu6Vb3gZsfn25Qn1hKY1Ui8LqpxE.nEi.', NULL, '2019-11-13 10:06:45', '2019-11-13 10:06:45'),
(3, 'NBjfghfdg8593458437534895khhjhkhkjhk7385', 'mokonyamabmg3@gmail.com', '$2y$10$CHO0mzWz/ERiCGdmQYhQU.8OfcTcjLsA75/Ie/r0XfxjFhW36Y0Km', NULL, '2019-11-14 07:19:21', '2019-11-14 07:19:21');

-- --------------------------------------------------------

--
-- Table structure for table `votes`
--

CREATE TABLE `votes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `poll_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `votes`
--

INSERT INTO `votes` (`id`, `user_id`, `poll_id`, `option_id`, `created_at`, `updated_at`) VALUES
(1, '2', 12, 9, '2019-11-17 05:48:10', '2019-11-17 05:48:10'),
(2, '2', 12, 9, NULL, NULL),
(3, '2', 12, 11, NULL, NULL),
(4, '2', 12, 12, NULL, NULL),
(5, '2', 12, 12, NULL, NULL),
(6, '2', 12, 11, NULL, NULL),
(7, '2', 12, 11, NULL, NULL),
(8, '2', 12, 10, NULL, NULL),
(9, '2', 12, 10, NULL, NULL),
(10, '2', 12, 10, NULL, NULL),
(11, '2', 12, 10, NULL, NULL),
(12, '2', 12, 9, NULL, NULL),
(13, '2', 12, 9, NULL, NULL),
(14, '2', 12, 8, NULL, NULL),
(15, '2', 12, 8, NULL, NULL),
(16, '2', 12, 9, NULL, NULL),
(17, '2', 12, 9, NULL, NULL),
(18, '2', 12, 8, '2019-11-18 14:50:31', '2019-11-18 14:50:31'),
(19, '2', 12, 12, '2019-11-18 14:50:47', '2019-11-18 14:50:47'),
(20, '2', 12, 11, '2019-11-18 15:15:22', '2019-11-18 15:15:22'),
(21, '3', 12, 11, '2019-11-18 15:20:28', '2019-11-18 15:20:28'),
(22, '1', 12, 12, '2019-11-18 15:23:19', '2019-11-18 15:23:19'),
(23, '1', 25, 19, '2020-05-23 06:36:20', '2020-05-23 06:36:20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `polls`
--
ALTER TABLE `polls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `votes`
--
ALTER TABLE `votes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `polls`
--
ALTER TABLE `polls`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `votes`
--
ALTER TABLE `votes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
