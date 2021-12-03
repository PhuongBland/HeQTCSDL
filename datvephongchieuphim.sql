-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 19, 2021 at 07:33 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `datvephongchieuphim`
--

-- --------------------------------------------------------

--
-- Table structure for table `cinemas`
--

CREATE TABLE `cinemas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cinema_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `chair_number` int(11) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cinemas`
--

INSERT INTO `cinemas` (`id`, `cinema_name`, `created_at`, `updated_at`, `chair_number`, `deleted_at`) VALUES
(4, 'A1', NULL, NULL, 45, NULL),
(5, 'A2', NULL, NULL, 55, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_birth` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `address`, `phone_number`, `date_of_birth`, `created_at`, `updated_at`, `deleted_at`, `email`, `password`) VALUES
(6, 'Nguyễn Khánh Linh', 'Nguyễn Du, Đà Lạt', '0776598805', '2000-08-10', NULL, NULL, NULL, 'khanhlinh1475@gmail.com', '$2y$10$o7OrJMP.JDCpNX6gWsUlt.0m4FqmtnwLDs.aFj/IJ6CaIbs4qESvO');

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
(3, '2021_09_20_120616_create_movie_formats_table', 1),
(4, '2021_09_20_125200_create_movies_table', 1),
(5, '2021_09_20_131953_create_type_of_movies_table', 1),
(6, '2021_09_20_135319_add_colum_content_movie_table', 1),
(7, '2021_09_20_144221_add_colum_feature_image_name_movie_table', 1),
(8, '2021_09_20_150219_create_movie_images_table', 1),
(9, '2021_09_21_063417_create_customers_table', 1),
(10, '2021_09_21_063836_add_colum_delete_at_customer_table', 1),
(11, '2021_09_21_071253_add_colum_email_password_customer_table', 1),
(12, '2021_09_21_080949_create_ticket_types_table', 1),
(13, '2021_09_21_082122_add_colum_delete_at_tickettypes_table', 1),
(14, '2021_09_21_092728_create_tickets_table', 1),
(15, '2021_09_21_094710_create_cinemas_table', 1),
(16, '2021_09_21_094938_ad_colum_user_id_ticket_table', 1),
(17, '2021_09_21_095355_create_movie_titles_table', 1),
(18, '2021_09_21_095942_add_colum_chair_numer_cinema_table', 1),
(19, '2021_09_21_103746_add_colum_delete_at_cinema_table', 1),
(20, '2021_09_21_111042_create_movie_title_tickets_table', 1),
(21, '2021_09_21_111907_add_colum_delete_at_movie_title_table', 1),
(22, '2021_09_21_123318_add_colum_chair_ticket_table', 1),
(23, '2021_09_22_042012_add_status_colum_ticket_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `typeofmovie_id` int(11) NOT NULL,
  `movieformat_id` int(11) NOT NULL,
  `movie_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `producer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `publishing_year` year(4) NOT NULL,
  `feature_image_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feature_image_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`id`, `typeofmovie_id`, `movieformat_id`, `movie_name`, `producer`, `publishing_year`, `feature_image_path`, `deleted_at`, `created_at`, `updated_at`, `content`, `feature_image_name`, `user_id`) VALUES
(37, 8, 4, 'DORAEMON : TÂN CHÚ KHỦNG LONG CỦA NOBITA', 'Nhật Bản', 2019, '/storage/movies/1/iZEhzLq3JikrJNl4JEEM.jpg', NULL, NULL, '2021-11-17 02:30:42', '<p>doraemon</p>', 'doraemon.jpg', 1),
(38, 6, 4, 'NGẠ QUỶ: TIẾNG THÉT ĐỒNG GIÓ HÚ', 'Âu Mỹ', 2018, '/storage/movies/1/76NCn1GeQwhjakadAtED.jpg', NULL, NULL, NULL, '<p>nga quy</p>', 'nga-quy-tieng-thet-dong-gio-hu.jpg', 1),
(39, 7, 4, 'BLACK WIDOW', 'Âu Mỹ', 2018, '/storage/movies/1/nLASPtcrvqbOyZZERp0D.jpg', NULL, NULL, NULL, '<p>black window</p>', 'black-widow.jpg', 1),
(40, 7, 4, 'BIỆT ĐỘI CẢM TỬ', 'Âu Mỹ', 2019, '/storage/movies/1/j9UJBXf6qzjvwDNrUrAc.jpg', NULL, NULL, NULL, '<p>biet doi cam tu</p>', 'biet-doi-cam-tu-201608749.jpg', 1),
(41, 6, 4, 'THỨ 6 NGÀY 13 PHẦN 5', 'Âu Mỹ', 2020, '/storage/movies/1/UozRkqkoAVjWkgNuzFTE.jpg', NULL, NULL, NULL, '<p>thu 6 ngay 13</p>', 'fridaythe13th.jpg', 1),
(42, 7, 4, 'VENOM 2 : ĐỐI MẶT TỬ THÙ', 'Âu Mỹ', 2020, '/storage/movies/1/urlBIal9c5gc4Lhbzlfl.jpg', NULL, NULL, NULL, '<p>venom</p>', 'venom.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `movie_formats`
--

CREATE TABLE `movie_formats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `format_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `movie_formats`
--

INSERT INTO `movie_formats` (`id`, `format_name`, `deleted_at`, `created_at`, `updated_at`) VALUES
(4, '2D', NULL, NULL, NULL),
(5, '3D', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `movie_images`
--

CREATE TABLE `movie_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `movie_id` int(11) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `movie_titles`
--

CREATE TABLE `movie_titles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cinema_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `movie_screening` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `movie_titles`
--

INSERT INTO `movie_titles` (`id`, `cinema_id`, `movie_id`, `movie_screening`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 4, 37, '2021-11-25 21:00:00', '2021-11-17 00:57:21', '2021-11-17 00:57:21', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `movie_title_tickets`
--

CREATE TABLE `movie_title_tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `movie_title_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `movie_title_tickets`
--

INSERT INTO `movie_title_tickets` (`id`, `ticket_id`, `movie_title_id`, `created_at`, `updated_at`) VALUES
(1, 2, 2, '2021-11-17 00:57:49', '2021-11-17 00:57:49'),
(2, 3, 2, '2021-11-17 00:57:49', '2021-11-17 00:57:49'),
(3, 4, 2, '2021-11-17 00:57:49', '2021-11-17 00:57:49'),
(4, 5, 2, '2021-11-17 00:57:49', '2021-11-17 00:57:49'),
(5, 6, 2, '2021-11-17 00:57:49', '2021-11-17 00:57:49'),
(6, 7, 2, '2021-11-17 00:57:49', '2021-11-17 00:57:49');

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
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ticket_type_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `ticket_sale_date` datetime NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `chair` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`id`, `ticket_type_id`, `customer_id`, `ticket_sale_date`, `deleted_at`, `created_at`, `updated_at`, `user_id`, `chair`, `status`) VALUES
(2, 2, 6, '2021-11-17 07:57:49', NULL, '2021-11-17 00:57:49', '2021-11-17 00:58:03', 1, 1, 1),
(3, 2, 6, '2021-11-17 07:57:49', NULL, '2021-11-17 00:57:49', '2021-11-17 00:58:03', 1, 2, 1),
(4, 2, 6, '2021-11-17 07:57:49', NULL, '2021-11-17 00:57:49', '2021-11-17 00:58:03', 1, 3, 1),
(5, 2, 6, '2021-11-17 07:57:49', NULL, '2021-11-17 00:57:49', '2021-11-17 00:58:03', 1, 4, 1),
(6, 2, 6, '2021-11-17 07:57:49', NULL, '2021-11-17 00:57:49', '2021-11-17 00:58:03', 1, 5, 1),
(7, 2, 6, '2021-11-17 07:57:49', NULL, '2021-11-17 00:57:49', '2021-11-17 00:58:03', 1, 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ticket_types`
--

CREATE TABLE `ticket_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ticket_type_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ticket_types`
--

INSERT INTO `ticket_types` (`id`, `ticket_type_name`, `price`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 'thường', 45000, '2021-11-17 00:56:55', '2021-11-17 00:56:55', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `type_of_movies`
--

CREATE TABLE `type_of_movies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `type_of_movies`
--

INSERT INTO `type_of_movies` (`id`, `type_name`, `deleted_at`, `created_at`, `updated_at`) VALUES
(6, 'Kinh dị', NULL, NULL, NULL),
(7, 'Hành động', NULL, NULL, NULL),
(8, 'Hoạt hình', NULL, NULL, NULL);

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
(1, 'Nguyễn Khánh Linh', 'khanhlinh1475@gmail.com', NULL, '$2y$10$0k1IIkJ4y7zpCPSS3et/6OLKyksb1AsMjg2Nt/JjSpWMrBmqL4Nmq', 'BsB5EaEnJcxwdMuRqy0XSGgNGsR9pPPqjVNX79Iqr0iUQuroCTbrVycEmd8D', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cinemas`
--
ALTER TABLE `cinemas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `movies` ADD FULLTEXT KEY `movie_name` (`movie_name`);
ALTER TABLE `movies` ADD FULLTEXT KEY `producer` (`producer`);
ALTER TABLE `movies` ADD FULLTEXT KEY `producer_2` (`producer`);

--
-- Indexes for table `movie_formats`
--
ALTER TABLE `movie_formats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `movie_images`
--
ALTER TABLE `movie_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `movie_titles`
--
ALTER TABLE `movie_titles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `movie_title_tickets`
--
ALTER TABLE `movie_title_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_types`
--
ALTER TABLE `ticket_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `type_of_movies`
--
ALTER TABLE `type_of_movies`
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
-- AUTO_INCREMENT for table `cinemas`
--
ALTER TABLE `cinemas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `movie_formats`
--
ALTER TABLE `movie_formats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `movie_images`
--
ALTER TABLE `movie_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `movie_titles`
--
ALTER TABLE `movie_titles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `movie_title_tickets`
--
ALTER TABLE `movie_title_tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `ticket_types`
--
ALTER TABLE `ticket_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `type_of_movies`
--
ALTER TABLE `type_of_movies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
