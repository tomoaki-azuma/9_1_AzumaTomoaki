-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- ホスト: mysql
-- 生成日時: 2020 年 7 月 02 日 12:40
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
(12, 3, 'ralavel', 'laravel', '5ef9f854d629a', '2020-06-29 14:19:00', '2020-06-29 14:19:00'),
(13, 3, '落語チャンネル', 'いろんな落語があるよ', '5ef9f929cc34f', '2020-06-29 14:22:33', '2020-06-29 14:22:33'),
(14, 3, '野球好プレー集desu', 'いろんな野球の好プレー集を揃えたよ。!', '5efaaeb05df87', '2020-06-30 03:17:04', '2020-07-01 04:33:40'),
(15, 3, '昭和の歌 you tube', '昭和の歌を集めてみたよ。', '5efadbbbbfc44', '2020-06-30 06:29:15', '2020-06-30 06:29:15'),
(16, 3, 'デプロイラジオ', 'Gs academy 山崎先生とすがやんによるプログラミングのお話！？', '5efdcb1dc8448', '2020-07-02 11:55:09', '2020-07-02 11:55:09');

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
(7, '2020_06_30_072420_add_bookmarkid_to_program', 4);

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
  `bookmark_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `youtube_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `program`
--

INSERT INTO `program` (`id`, `user_id`, `bookmark_id`, `title`, `comment`, `youtube_url`, `created_at`, `updated_at`) VALUES
(13, 1, '13', '【立川志らく】YouTubeで落語「子別れ」(2020.5)', NULL, 'https://www.youtube.com/watch?v=Tm-iL1_FK64', '2020-07-02 02:09:31', '2020-07-02 02:09:31'),
(14, 1, '13', '古今亭志ん朝　酢豆腐　落語', NULL, 'https://www.youtube.com/watch?v=1Mu2jM7RmsQ', '2020-07-02 02:09:53', '2020-07-02 02:09:53'),
(15, 1, '13', '文楽 心眼', NULL, 'https://www.youtube.com/watch?v=moycA_gbhbE', '2020-07-02 02:10:15', '2020-07-02 02:10:15'),
(16, 1, '13', '米朝 本能寺', NULL, 'https://www.youtube.com/watch?v=bxuZvSHOBDM', '2020-07-02 02:11:22', '2020-07-02 02:11:22'),
(17, 1, '13', '【キモおもしろい】 アンガールズ田中の落語 「猫の皿」', 'アンガールズ田中さんによる落語。全然キモくなくて面白いです。', 'https://youtu.be/dIuKhrjNwGQ', '2020-07-02 04:47:14', '2020-07-02 04:47:14'),
(18, 1, '13', '31 25 超入門！落語　ＴＨＥ　ＭＯＶＩＥ「猫の皿」「三方一両損」 161130 PANDORATV', NULL, 'https://www.youtube.com/watch?v=WSUomi7eb9Q', '2020-07-02 11:03:25', '2020-07-02 11:03:25'),
(19, 1, '13', '立川談志（七代目） - 粗忽長屋', NULL, 'https://www.youtube.com/watch?v=OtM0jxCVp_s', '2020-07-02 11:25:44', '2020-07-02 11:25:44'),
(20, 1, '16', 'どうしたらエンジニアになれるの？#deploy001', NULL, 'https://www.youtube.com/watch?v=kh7-FsnC1Hg', '2020-07-02 11:56:12', '2020-07-02 11:59:35'),
(21, 1, '16', '日本のIT業界の将来性について　#deploy002', NULL, 'https://www.youtube.com/watch?v=mlZBqeHVeTY', '2020-07-02 11:56:38', '2020-07-02 11:56:38'),
(22, 1, '16', 'プログラミング言語とは？　#deploy003', NULL, 'https://www.youtube.com/watch?v=DUriVUPO2VI', '2020-07-02 11:56:58', '2020-07-02 11:59:43'),
(23, 1, '16', 'サーバーサイドのプログラミング言語とは？　#deploy004', NULL, 'https://www.youtube.com/watch?v=ru9dFmxLyx0', '2020-07-02 11:57:17', '2020-07-02 11:57:17');

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
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'tomoro', 'azumau@gmail.com', NULL, '$2y$10$W5kOv8F3xfgWAxJLkBuGZeJ61b5LWyi6WQOsqeEIYj7mqzwuey9k.', 'INlFhEV0ai49yBT9tD4ZLvJ1w914c1EOXndZuC67v0npXPhUcTMwZiWR0JEp', '2020-06-23 00:59:22', '2020-06-23 00:59:22'),
(2, 'chiharu', 'chiharu@mail.com', NULL, '$2y$10$JgqOZo4t.83J75nOP1s2/e6nyeJdI389V06v2z5.dvhFH/R9cU0fC', NULL, '2020-06-24 06:09:48', '2020-06-24 06:09:48'),
(3, 'test_user', 'test@mail.com', NULL, '$2y$10$0lwtRu6VUu5JLBVEuyKZZ.zAcVPreIG5jd.NeSt.Zp508w5/l0x3K', NULL, '2020-07-02 12:38:44', '2020-07-02 12:38:44');

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- テーブルのAUTO_INCREMENT `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- テーブルのAUTO_INCREMENT `program`
--
ALTER TABLE `program`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- テーブルのAUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
