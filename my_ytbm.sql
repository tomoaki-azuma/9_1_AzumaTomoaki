-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- ホスト: mysql
-- 生成日時: 2020 年 7 月 10 日 04:24
-- サーバのバージョン： 5.7.30
-- PHP のバージョン: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `my_ytbm`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `bookmarks`
--

CREATE TABLE `bookmarks` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `share_token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `bookmarks`
--

INSERT INTO `bookmarks` (`id`, `user_id`, `title`, `comment`, `share_token`, `created_at`, `updated_at`) VALUES
(13, 3, '落語チャンネル', 'いろんな落語があるよ', '5ef9f929cc34f', '2020-06-29 14:22:33', '2020-06-29 14:22:33'),
(16, 3, 'デプロイラジオ', 'Gs academy 山崎先生とすがやんによるプログラミングのお話！？', '5efdcb1dc8448', '2020-07-02 11:55:09', '2020-07-02 11:55:09'),
(17, 3, 'アコギチャンネル by つば九郎', 'アコースティックギターのじょうずなひとたち。ちょっとまにあっくかな。', '5f07e4892da37', '2020-07-10 03:46:17', '2020-07-10 03:53:06');

-- --------------------------------------------------------

--
-- テーブルの構造 `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2020_06_24_025024_create_bookmarks', 2),
(6, '2020_06_30_070447_create_program_table', 3),
(10, '2020_06_30_072420_add_bookmarkid_to_program', 4),
(11, '2020_07_06_034351_alter_user_table', 5),
(12, '2020_07_08_085928_create_urls_table', 6),
(13, '2020_07_08_092545_drop_column_program', 7);

-- --------------------------------------------------------

--
-- テーブルの構造 `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('azumau@gmail.com', '$2y$10$HaXU9jXmj.e24xUQEw1qvO.7eDCd9QD4f.v.im5iyfBooCpARWeAq', '2020-07-02 12:36:14');

-- --------------------------------------------------------

--
-- テーブルの構造 `program`
--

CREATE TABLE `program` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `bookmark_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `program`
--

INSERT INTO `program` (`id`, `user_id`, `title`, `comment`, `created_at`, `updated_at`, `bookmark_id`) VALUES
(37, 3, 'proyakyu', 'comemememem', '2020-07-08 14:30:56', '2020-07-08 14:30:56', '14'),
(43, 3, 'どうしたらエンジニアになれるの？#deploy001', NULL, '2020-07-10 03:19:21', '2020-07-10 03:19:21', '16'),
(44, 3, '日本のIT業界の将来性について　#deploy002', NULL, '2020-07-10 03:19:48', '2020-07-10 03:19:48', '16'),
(45, 3, 'プログラミング言語とは？　#deploy003', NULL, '2020-07-10 03:20:13', '2020-07-10 03:20:13', '16'),
(46, 3, 'サーバーサイドのプログラミング言語とは？　#deploy004', NULL, '2020-07-10 03:20:36', '2020-07-10 03:20:36', '16'),
(47, 3, '「APIってなに？」～スピード感持って開発をする方法～　#deploy005', NULL, '2020-07-10 03:21:04', '2020-07-10 03:21:04', '16'),
(48, 3, '【立川志らく】YouTubeで落語 「紺屋高尾」四席目 （2020.06）', NULL, '2020-07-10 03:43:33', '2020-07-10 03:43:33', '13'),
(49, 3, '立川談志／芝浜', NULL, '2020-07-10 03:44:04', '2020-07-10 03:44:04', '13'),
(50, 3, '【立川志らく】YouTubeで落語 「紺屋高尾」四席目 （2020.06）', NULL, '2020-07-10 03:44:51', '2020-07-10 03:44:51', '13'),
(51, 3, 'Fried Pride BAD', NULL, '2020-07-10 03:46:59', '2020-07-10 03:46:59', '17'),
(52, 3, 'Rodrigo y Gabriela - \'Tamacun\'', NULL, '2020-07-10 03:47:56', '2020-07-10 03:47:56', '17'),
(53, 3, 'Rodrigo y Gabriela - Diablo Rojo - Live HD', NULL, '2020-07-10 03:48:44', '2020-07-10 03:48:44', '17'),
(54, 3, 'BAHO\'S BOOGIE - BAHO ( Char　石田長生 )', NULL, '2020-07-10 03:49:43', '2020-07-10 03:49:43', '17'),
(55, 3, '羊毛とおはな「ララルラ ラルララ」LIVE IN vale tudo !! \'07 12/14', NULL, '2020-07-10 03:53:42', '2020-07-10 03:53:42', '17'),
(56, 3, 'Eric Clapton-01-Signe-1992-UNPLUGGED', NULL, '2020-07-10 03:54:50', '2020-07-10 03:54:50', '17');

-- --------------------------------------------------------

--
-- テーブルの構造 `urls`
--

CREATE TABLE `urls` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `program_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `urls`
--

INSERT INTO `urls` (`id`, `url`, `file_type`, `program_id`, `created_at`, `updated_at`) VALUES
(1, 'youtube', 'y', 36, '2020-07-08 12:19:46', '2020-07-08 12:19:46'),
(2, 'proyakyu.image', 'i', 37, '2020-07-08 14:30:56', '2020-07-08 14:30:56'),
(9, 'oyutube.cojm', 'y', 40, '2020-07-09 06:56:42', '2020-07-09 06:56:42'),
(10, 'eeee', 'p', 41, '2020-07-09 06:56:57', '2020-07-09 06:56:57'),
(21, 'http://www.youtube.com/hogehoge', 'y', 38, '2020-07-10 02:39:14', '2020-07-10 02:39:14'),
(25, 'https://www.youtube.com/watch?v=kh7-FsnC1Hg', 'y', 43, '2020-07-10 03:19:21', '2020-07-10 03:19:21'),
(26, 'https://www.youtube.com/watch?v=mlZBqeHVeTY', 'y', 44, '2020-07-10 03:19:48', '2020-07-10 03:19:48'),
(27, 'https://www.youtube.com/watch?v=DUriVUPO2VI&t=89s', 'y', 45, '2020-07-10 03:20:13', '2020-07-10 03:20:13'),
(28, 'https://www.youtube.com/watch?v=ru9dFmxLyx0&t=42s', 'y', 46, '2020-07-10 03:20:36', '2020-07-10 03:20:36'),
(29, 'https://www.youtube.com/watch?v=lLXOOAYDuho', 'y', 47, '2020-07-10 03:21:04', '2020-07-10 03:21:04'),
(30, 'https://www.youtube.com/watch?v=1n9TbFFDo3w', 'y', 48, '2020-07-10 03:43:33', '2020-07-10 03:43:33'),
(31, 'https://www.youtube.com/watch?v=e-cs9usnlhw', 'y', 49, '2020-07-10 03:44:04', '2020-07-10 03:44:04'),
(32, 'https://www.youtube.com/watch?v=1n9TbFFDo3w', 'y', 50, '2020-07-10 03:44:51', '2020-07-10 03:44:51'),
(33, 'https://www.youtube.com/watch?v=iol8Beq-C5Q', 'y', 51, '2020-07-10 03:46:59', '2020-07-10 03:46:59'),
(34, 'https://www.youtube.com/watch?v=l-qgum7hFXk', 'y', 52, '2020-07-10 03:47:56', '2020-07-10 03:47:56'),
(35, 'https://www.youtube.com/watch?v=PT9hvyDvKHA', 'y', 53, '2020-07-10 03:48:44', '2020-07-10 03:48:44'),
(36, 'https://www.youtube.com/watch?v=K9AgoGPhnhw', 'y', 54, '2020-07-10 03:49:43', '2020-07-10 03:49:43'),
(37, 'https://www.youtube.com/watch?v=LNJ4tL86WJs', 'y', 55, '2020-07-10 03:53:42', '2020-07-10 03:53:42'),
(38, 'https://www.youtube.com/watch?v=1IA-tP8WmS4', 'y', 56, '2020-07-10 03:54:50', '2020-07-10 03:54:50');

-- --------------------------------------------------------

--
-- テーブルの構造 `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `comment`, `img_url`) VALUES
(1, 'tomoro', 'azumau@gmail.com', NULL, '$2y$10$W5kOv8F3xfgWAxJLkBuGZeJ61b5LWyi6WQOsqeEIYj7mqzwuey9k.', 'iEi1ADS8GiyIXDXPJnb2LgRxnHSpD2swK4ox5D2gVejEJCC8p0QXKE4tRxEy', '2020-06-23 00:59:22', '2020-07-06 13:23:06', NULL, 'avatars/jRB6meS9sZvGyuBTt7EMdasAlqnoFREWLEV39K24.png'),
(2, 'chiharu', 'chiharu@mail.com', NULL, '$2y$10$JgqOZo4t.83J75nOP1s2/e6nyeJdI389V06v2z5.dvhFH/R9cU0fC', NULL, '2020-06-24 06:09:48', '2020-07-07 02:06:24', NULL, 'avatars/mrqZF0JEQp2jTTtZsuDHlqhEMhROeBmUt2mw4dhb.jpeg'),
(3, '2896', 'test@mail.com', NULL, '$2y$10$0lwtRu6VUu5JLBVEuyKZZ.zAcVPreIG5jd.NeSt.Zp508w5/l0x3K', NULL, '2020-07-02 12:38:44', '2020-07-09 07:02:53', 'やきゅうがすきです。', 'avatars/CP7LdvAgEYFRdVrijbgSOscsr0gtgJGI4TenOrDl.jpeg');

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `bookmarks`
--
ALTER TABLE `bookmarks`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- テーブルのインデックス `program`
--
ALTER TABLE `program`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `urls`
--
ALTER TABLE `urls`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- ダンプしたテーブルのAUTO_INCREMENT
--

--
-- テーブルのAUTO_INCREMENT `bookmarks`
--
ALTER TABLE `bookmarks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- テーブルのAUTO_INCREMENT `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- テーブルのAUTO_INCREMENT `program`
--
ALTER TABLE `program`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- テーブルのAUTO_INCREMENT `urls`
--
ALTER TABLE `urls`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- テーブルのAUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
