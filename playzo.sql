-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Сен 17 2019 г., 15:11
-- Версия сервера: 5.7.27-0ubuntu0.18.04.1
-- Версия PHP: 7.2.20-2+ubuntu18.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `playzo`
--

-- --------------------------------------------------------

--
-- Структура таблицы `block_ips`
--

CREATE TABLE `block_ips` (
  `id` int(10) UNSIGNED NOT NULL,
  `ip` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `from` datetime NOT NULL,
  `to` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(2, NULL, 1, 'playzo', 'slug', '2019-08-21 10:17:38', '2019-08-21 10:17:38');

-- --------------------------------------------------------

--
-- Структура таблицы `chat_disputs`
--

CREATE TABLE `chat_disputs` (
  `id` int(10) UNSIGNED NOT NULL,
  `dialog_id` int(10) UNSIGNED DEFAULT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci,
  `admin_id` int(10) UNSIGNED DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `closed_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `chat_settings`
--

CREATE TABLE `chat_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keyword` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `value` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `chat_settings`
--

INSERT INTO `chat_settings` (`id`, `title`, `keyword`, `is_active`, `value`, `created_at`, `updated_at`) VALUES
(1, 'Сообщений в день для пользователя (Все чаты)', 'msg_per_day', 1, 1000, '2018-03-12 14:16:06', '2018-03-12 15:52:30');

-- --------------------------------------------------------

--
-- Структура таблицы `currencies`
--

CREATE TABLE `currencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unity` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `multiplier` double(10,5) NOT NULL DEFAULT '0.00000',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `unity`, `multiplier`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Adena', 'кк', 0.00000, '2017-09-21 02:46:18', '2019-08-15 11:50:31', NULL),
(2, 'Kinah', 'кк', 0.00000, '2017-09-21 03:34:22', '2019-08-15 11:55:11', NULL),
(3, 'Gold', 'к', 0.00000, '2017-09-21 03:34:38', '2019-08-15 11:54:11', NULL),
(4, 'Silver', NULL, 0.00000, '2017-09-21 03:34:44', '2019-08-15 12:00:25', NULL),
(5, 'Alz', NULL, 0.00000, '2017-09-21 03:35:06', '2017-09-21 03:35:06', NULL),
(6, 'Coins', NULL, 0.00000, '2017-09-21 03:35:15', '2019-08-15 11:57:30', NULL),
(7, 'Credit', NULL, 0.00000, '2017-09-21 03:35:23', '2019-08-15 11:55:48', NULL),
(8, 'Wirth', NULL, 0.00000, '2017-09-21 03:35:44', '2019-08-15 11:52:42', NULL),
(9, 'ISK', NULL, 0.00000, '2017-09-21 03:35:58', '2017-09-21 03:35:58', NULL),
(10, 'Diamonds', NULL, 0.00000, '2017-09-21 03:36:08', '2019-08-15 11:51:34', NULL),
(11, 'Spheres of exaltation', NULL, 0.00000, '2017-09-21 03:36:51', '2019-08-15 12:00:55', NULL),
(12, 'Zeny', NULL, 0.00000, '2017-09-21 03:37:09', '2019-08-15 11:53:34', NULL),
(13, 'Rupee', NULL, 0.00000, '2017-09-21 03:37:17', '2019-08-15 12:00:13', NULL),
(14, 'Currency', NULL, 0.00000, '2017-09-21 03:37:26', '2019-08-15 11:52:15', NULL),
(15, 'Liang', NULL, 0.00000, '2017-09-21 03:37:39', '2019-08-15 11:58:06', NULL),
(16, 'Platinum', NULL, 0.00000, '2017-09-21 03:37:52', '2019-08-15 11:58:39', NULL),
(17, 'Balance replenishment', NULL, 0.00000, '2017-09-21 03:38:12', '2019-08-15 11:59:13', NULL),
(18, 'Ruble', '1000', 0.00000, '2017-09-21 03:38:21', '2019-08-15 11:59:49', NULL),
(19, 'Flux', NULL, 0.00000, '2017-09-21 03:38:32', '2017-09-21 03:38:32', NULL),
(20, 'Yuan', 'кк', 0.00000, '2017-09-21 03:38:39', '2019-08-15 11:49:15', NULL),
(21, 'EUN', NULL, 0.00000, '2017-09-21 03:39:33', '2017-09-21 03:39:33', NULL),
(22, 'GB', NULL, 0.00000, '2017-09-21 03:39:38', '2017-09-21 03:39:38', NULL),
(23, 'Адена классик', '1к', 0.00000, '2018-06-09 18:12:37', '2018-06-09 18:21:39', '2018-06-09 18:21:39'),
(24, 'Адена.', '1к', 0.00000, '2018-06-09 18:21:57', '2018-06-09 20:33:11', '2018-06-09 20:33:11'),
(27, 'Gold', 'КК', 1.00000, '2018-06-11 12:33:21', '2019-08-15 11:54:23', NULL),
(28, 'Gold', 'ккк', 1.00000, '2018-06-11 12:40:57', '2019-08-15 11:54:33', NULL),
(29, 'Gold', 'зол.', 1.00000, '2018-06-11 12:41:05', '2019-08-15 11:54:42', NULL),
(30, 'Adena', 'к', 1.00000, '2018-06-11 12:52:16', '2019-08-15 11:50:52', NULL),
(31, 'Crystals', NULL, 1.00000, '2018-07-10 10:06:40', '2019-08-15 11:57:01', NULL),
(32, 'Gold', '1 ед.', 0.00000, '2018-07-21 21:12:51', '2018-07-21 21:13:14', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '', 1),
(2, 1, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, '', 2),
(3, 1, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, '', 3),
(4, 1, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '', 4),
(5, 1, 'excerpt', 'text_area', 'excerpt', 1, 0, 1, 1, 1, 1, '', 5),
(6, 1, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, '', 6),
(7, 1, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '\n{\n    \"resize\": {\n        \"width\": \"1000\",\n        \"height\": \"null\"\n    },\n    \"quality\": \"70%\",\n    \"upsize\": true,\n    \"thumbnails\": [\n        {\n            \"name\": \"medium\",\n            \"scale\": \"50%\"\n        },\n        {\n            \"name\": \"small\",\n            \"scale\": \"25%\"\n        },\n        {\n            \"name\": \"cropped\",\n            \"crop\": {\n                \"width\": \"300\",\n                \"height\": \"250\"\n            }\n        }\n    ]\n}', 7),
(8, 1, 'slug', 'text', 'slug', 1, 0, 1, 1, 1, 1, '\n{\n    \"slugify\": {\n        \"origin\": \"title\",\n        \"forceUpdate\": true\n    }\n}', 8),
(9, 1, 'meta_description', 'text_area', 'meta_description', 1, 0, 1, 1, 1, 1, '', 9),
(10, 1, 'meta_keywords', 'text_area', 'meta_keywords', 1, 0, 1, 1, 1, 1, '', 10),
(11, 1, 'status', 'select_dropdown', 'status', 1, 1, 1, 1, 1, 1, '\n{\n    \"default\": \"DRAFT\",\n    \"options\": {\n        \"PUBLISHED\": \"published\",\n        \"DRAFT\": \"draft\",\n        \"PENDING\": \"pending\"\n    }\n}', 11),
(12, 1, 'created_at', 'timestamp', 'created_at', 0, 1, 1, 0, 0, 0, '', 12),
(13, 1, 'updated_at', 'timestamp', 'updated_at', 0, 0, 0, 0, 0, 0, '', 13),
(14, 2, 'id', 'number', 'id', 1, 0, 0, 0, 0, 0, '', 1),
(15, 2, 'author_id', 'text', 'author_id', 1, 0, 0, 0, 0, 0, '', 2),
(16, 2, 'title', 'text', 'title', 1, 1, 1, 1, 1, 1, '', 3),
(17, 2, 'excerpt', 'text_area', 'excerpt', 1, 0, 1, 1, 1, 1, '', 4),
(18, 2, 'body', 'rich_text_box', 'body', 1, 0, 1, 1, 1, 1, '', 5),
(19, 2, 'slug', 'text', 'slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"}}', 6),
(20, 2, 'meta_description', 'text', 'meta_description', 1, 0, 1, 1, 1, 1, '', 7),
(21, 2, 'meta_keywords', 'text', 'meta_keywords', 1, 0, 1, 1, 1, 1, '', 8),
(22, 2, 'status', 'select_dropdown', 'status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(23, 2, 'created_at', 'timestamp', 'created_at', 1, 1, 1, 0, 0, 0, '', 10),
(24, 2, 'updated_at', 'timestamp', 'updated_at', 1, 0, 0, 0, 0, 0, '', 11),
(25, 2, 'image', 'image', 'image', 0, 1, 1, 1, 1, 1, '', 12),
(26, 3, 'id', 'number', 'id', 1, 0, 0, 0, 0, 0, NULL, 1),
(27, 3, 'name', 'text', 'name', 1, 1, 1, 1, 1, 1, NULL, 2),
(28, 3, 'email', 'text', 'email', 1, 1, 1, 1, 1, 1, NULL, 3),
(29, 3, 'password', 'password', 'password', 1, 0, 0, 1, 1, 0, NULL, 4),
(30, 3, 'remember_token', 'text', 'remember_token', 0, 0, 0, 0, 0, 0, NULL, 5),
(31, 3, 'created_at', 'timestamp', 'created_at', 0, 1, 1, 0, 0, 0, NULL, 15),
(32, 3, 'updated_at', 'timestamp', 'updated_at', 0, 0, 0, 0, 0, 0, NULL, 16),
(33, 3, 'avatar', 'image', 'avatar', 0, 1, 1, 1, 1, 1, NULL, 6),
(34, 5, 'id', 'number', 'id', 1, 0, 0, 0, 0, 0, '', 1),
(35, 5, 'name', 'text', 'name', 1, 1, 1, 1, 1, 1, '', 2),
(36, 5, 'created_at', 'timestamp', 'created_at', 0, 0, 0, 0, 0, 0, '', 3),
(37, 5, 'updated_at', 'timestamp', 'updated_at', 0, 0, 0, 0, 0, 0, '', 4),
(38, 4, 'id', 'number', 'id', 1, 0, 0, 0, 0, 0, '', 1),
(39, 4, 'parent_id', 'select_dropdown', 'parent_id', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(40, 4, 'order', 'text', 'order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(41, 4, 'name', 'text', 'name', 1, 1, 1, 1, 1, 1, '', 4),
(42, 4, 'slug', 'text', 'slug', 1, 1, 1, 1, 1, 1, '', 5),
(43, 4, 'created_at', 'timestamp', 'created_at', 0, 0, 1, 0, 0, 0, '', 6),
(44, 4, 'updated_at', 'timestamp', 'updated_at', 0, 0, 0, 0, 0, 0, '', 7),
(45, 6, 'id', 'number', 'id', 1, 0, 0, 0, 0, 0, '', 1),
(46, 6, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '', 2),
(47, 6, 'created_at', 'timestamp', 'created_at', 0, 0, 0, 0, 0, 0, '', 3),
(48, 6, 'updated_at', 'timestamp', 'updated_at', 0, 0, 0, 0, 0, 0, '', 4),
(49, 6, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, '', 5),
(50, 1, 'seo_title', 'text', 'seo_title', 0, 1, 1, 1, 1, 1, '', 14),
(51, 1, 'featured', 'checkbox', 'featured', 1, 1, 1, 1, 1, 1, '', 15),
(52, 3, 'role_id', 'text', 'role_id', 0, 1, 1, 1, 1, 1, NULL, 7),
(53, 3, 'ip', 'text', 'Ip', 0, 1, 1, 1, 1, 1, '{}', 14),
(54, 3, 'phone', 'text', 'Phone', 0, 1, 1, 1, 1, 1, NULL, 10),
(55, 3, 'rating', 'checkbox', 'Rating', 1, 1, 1, 1, 1, 1, NULL, 13),
(56, 3, 'balance', 'checkbox', 'Balance', 0, 0, 0, 0, 0, 0, NULL, 12),
(57, 3, 'provider', 'checkbox', 'Provider', 0, 1, 1, 1, 1, 1, NULL, 11),
(58, 3, 'provider_id', 'checkbox', 'Provider Id', 0, 1, 1, 1, 1, 1, NULL, 8),
(59, 3, 'status', 'checkbox', 'Status', 0, 1, 1, 1, 1, 1, NULL, 9),
(60, 3, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 1, 1, 1, NULL, 17),
(61, 3, 'firstname', 'checkbox', 'Firstname', 0, 1, 1, 1, 1, 1, NULL, 23),
(62, 3, 'lastname', 'checkbox', 'Lastname', 0, 1, 1, 1, 1, 1, NULL, 22),
(63, 3, 'username', 'checkbox', 'Username', 0, 1, 1, 1, 1, 1, NULL, 21),
(64, 3, 'create_lot', 'checkbox', 'Create Lot', 0, 1, 1, 1, 1, 1, NULL, 20),
(65, 3, 'buy_lot', 'checkbox', 'Buy Lot', 0, 1, 1, 1, 1, 1, NULL, 19),
(66, 3, 'get_money', 'checkbox', 'Get Money', 0, 1, 1, 1, 1, 1, NULL, 18),
(67, 3, 'online', 'checkbox', 'Online', 0, 1, 1, 1, 1, 1, NULL, 27),
(68, 3, 'confirmed', 'checkbox', 'Confirmed', 1, 1, 1, 1, 1, 1, NULL, 24),
(69, 3, 'confirmed_rules', 'checkbox', 'Confirmed Rules', 1, 1, 1, 1, 1, 1, NULL, 25),
(70, 3, 'confirmation_code', 'checkbox', 'Confirmation Code', 0, 1, 1, 1, 1, 1, NULL, 26),
(71, 3, 'is_block', 'checkbox', 'Is Block', 0, 1, 1, 1, 1, 1, NULL, 28),
(72, 3, 'is_block_payment', 'checkbox', 'Is Block Payment', 0, 1, 1, 1, 1, 1, NULL, 29);

-- --------------------------------------------------------

--
-- Структура таблицы `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `controller`, `description`, `generate_permissions`, `server_side`, `created_at`, `updated_at`) VALUES
(1, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', '', '', 1, 0, '2017-09-14 06:07:06', '2017-09-14 06:07:06'),
(2, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', '', '', 1, 0, '2017-09-14 06:07:06', '2017-09-14 06:07:06'),
(3, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', NULL, NULL, 1, 0, '2017-09-14 06:07:06', '2017-09-15 08:54:40'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', '', '', 1, 0, '2017-09-14 06:07:06', '2017-09-14 06:07:06'),
(5, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', '', '', 1, 0, '2017-09-14 06:07:06', '2017-09-14 06:07:06'),
(6, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', '', '', 1, 0, '2017-09-14 06:07:06', '2017-09-14 06:07:06');

-- --------------------------------------------------------

--
-- Структура таблицы `dialogs`
--

CREATE TABLE `dialogs` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `dialogs`
--

INSERT INTO `dialogs` (`id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '2019-08-29 09:57:11', '2019-08-29 09:57:11', NULL),
(2, '2019-09-04 12:56:05', '2019-09-04 12:56:05', NULL),
(3, '2019-09-04 13:36:01', '2019-09-04 13:36:03', NULL),
(4, '2019-09-04 13:56:55', '2019-09-04 13:56:55', NULL),
(5, '2019-09-04 13:57:22', '2019-09-04 13:57:22', NULL),
(6, '2019-09-04 13:58:14', '2019-09-04 13:58:14', NULL),
(7, '2019-09-04 13:58:41', '2019-09-04 13:58:41', NULL),
(8, '2019-09-04 13:58:49', '2019-09-04 13:58:49', NULL),
(9, '2019-09-04 13:59:02', '2019-09-04 13:59:02', NULL),
(10, '2019-09-04 13:59:08', '2019-09-04 13:59:08', NULL),
(11, '2019-09-04 14:13:35', '2019-09-04 14:13:35', NULL),
(12, '2019-09-04 14:13:44', '2019-09-04 14:13:44', NULL),
(13, '2019-09-04 14:13:54', '2019-09-04 14:13:54', NULL),
(14, '2019-09-04 14:26:47', '2019-09-04 14:26:47', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `dialog_messages`
--

CREATE TABLE `dialog_messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `seen` int(11) DEFAULT NULL,
  `sender_id` int(10) UNSIGNED DEFAULT NULL,
  `dialog_id` int(10) UNSIGNED NOT NULL,
  `lot_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `dialog_messages`
--

INSERT INTO `dialog_messages` (`id`, `text`, `seen`, `sender_id`, `dialog_id`, `lot_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'hi', 1, 1, 1, 2, '2019-08-29 09:57:11', '2019-09-13 13:11:39', NULL),
(2, 'Привет', 1, 1, 1, 2, '2019-08-29 09:57:27', '2019-09-13 13:11:39', NULL),
(3, 'тобі пізда', 1, 1, 1, NULL, '2019-09-04 12:50:40', '2019-09-13 13:11:39', NULL),
(4, 'йоу', 1, 12, 2, 5, '2019-09-04 12:56:05', '2019-09-13 15:37:58', NULL),
(5, 'тобі пізда', 1, 12, 2, 5, '2019-09-04 12:56:22', '2019-09-13 15:37:58', NULL),
(6, 'о курва', 1, 11, 2, NULL, '2019-09-04 12:56:49', '2019-09-06 16:24:11', NULL),
(7, '123', 1, 11, 2, NULL, '2019-09-04 13:05:39', '2019-09-06 16:24:11', NULL),
(9, 'фівафівафівафіва', 1, 1, 1, NULL, '2019-09-04 13:23:40', '2019-09-13 13:11:39', NULL),
(10, 'івафівафівафіва', 1, 1, 1, NULL, '2019-09-04 13:23:45', '2019-09-13 13:11:39', NULL),
(11, 'івафівафівафівафівафіва', 1, 2, 1, NULL, '2019-09-04 13:23:51', '2019-09-17 12:09:29', NULL),
(12, 'івафівафівафвіафіва', 1, 1, 1, NULL, '2019-09-04 13:23:56', '2019-09-13 13:11:39', NULL),
(13, 'фівафівафівафівафівафіва', 1, 1, 1, NULL, '2019-09-04 13:24:17', '2019-09-13 13:11:39', NULL),
(14, 'фівафівафіва', 1, 1, 1, NULL, '2019-09-04 13:24:25', '2019-09-13 13:11:39', NULL),
(15, '122341324', 1, 1, 1, NULL, '2019-09-04 13:24:27', '2019-09-13 13:11:39', NULL),
(16, 'фівафівафівафівафівафівафіва', 1, 11, 2, NULL, '2019-09-04 13:24:37', '2019-09-06 16:24:11', NULL),
(17, 'фівафівафівафівафіва', 1, 11, 2, NULL, '2019-09-04 13:24:39', '2019-09-06 16:24:11', NULL),
(18, 'фівафівафівафівафівафів', 1, 11, 2, NULL, '2019-09-04 13:24:43', '2019-09-06 16:24:11', NULL),
(19, 'іфвафівафівафівафіва', 1, 11, 2, NULL, '2019-09-04 13:24:47', '2019-09-06 16:24:11', NULL),
(20, 'фівафівафівафівафівафівафіва', 1, 11, 2, NULL, '2019-09-04 13:24:58', '2019-09-06 16:24:11', NULL),
(21, 'фівафівафіваіфвафіваіва', 1, 11, 2, NULL, '2019-09-04 13:25:20', '2019-09-06 16:24:11', NULL),
(22, 'івафівафівафівафіва', 1, 11, 2, NULL, '2019-09-04 13:25:22', '2019-09-06 16:24:11', NULL),
(23, 'фівафівацу21у', 1, 11, 2, NULL, '2019-09-04 13:25:24', '2019-09-06 16:24:11', NULL),
(24, '123123123', 1, 11, 2, NULL, '2019-09-04 13:25:27', '2019-09-06 16:24:11', NULL),
(25, 'ertregdsfgfdsgsdg', 1, 11, 2, NULL, '2019-09-04 13:43:53', '2019-09-06 16:24:11', NULL),
(26, '123', 0, 11, 4, 34, '2019-09-04 13:56:55', '2019-09-04 13:56:55', NULL),
(27, '123', 0, 11, 4, 34, '2019-09-04 13:57:04', '2019-09-04 13:57:04', NULL),
(28, '123', 0, 11, 5, 35, '2019-09-04 13:57:23', '2019-09-04 13:57:23', NULL),
(29, '123', 0, 11, 5, 35, '2019-09-04 13:57:55', '2019-09-04 13:57:55', NULL),
(30, '123', 0, 11, 6, 37, '2019-09-04 13:58:14', '2019-09-04 13:58:14', NULL),
(31, '123', 0, 11, 7, 40, '2019-09-04 13:58:41', '2019-09-04 13:58:41', NULL),
(32, '123', 0, 11, 8, 36, '2019-09-04 13:58:50', '2019-09-04 13:58:50', NULL),
(33, '123', 0, 11, 9, 38, '2019-09-04 13:59:02', '2019-09-04 13:59:02', NULL),
(34, '123123', 0, 11, 10, 39, '2019-09-04 13:59:08', '2019-09-04 13:59:08', NULL),
(35, '123', 1, 11, 1, 41, '2019-09-04 14:01:16', '2019-09-17 12:09:29', NULL),
(36, '324123412341234', 1, 11, 1, 41, '2019-09-04 14:03:23', '2019-09-17 12:09:29', NULL),
(37, '123', 1, 11, 11, 44, '2019-09-04 14:13:35', '2019-09-05 10:24:13', NULL),
(38, '123', 0, 11, 12, 43, '2019-09-04 14:13:45', '2019-09-04 14:13:45', NULL),
(39, '123', 0, 11, 13, 42, '2019-09-04 14:13:54', '2019-09-04 14:13:54', NULL),
(40, 'Покупатель <a target=\"_blank\" href=\"http://playzo.veskod.com/user-profile/1\">Admin</a> оплатил заказ <a href=\"http://playzo.veskod.com/purchases/2\">#2</a> Игра: <span class=\"half-bold\">LineAge 2</span>; Валюта: <span class=\"half-bold\">Adena</span>; Сервер: <span class=\"half-bold\">Hatos</span>; В количестве: <span class=\"half-bold\">10</span><span class=\"half-bold\">кк</span>; Имя персонажа: <span class=\"half-bold\">wickbull</span> <span class=\"half-bold\"></span><br><a target=\"_blank\" href=\"http://playzo.veskod.com/user-profile/12\">Admin</a>, после выполнения заказа продавцом, не забудьте нажать на кнопку «Подтвердить выполнение заказа» или закрыть заказ в <a target=\"_blank\" href=\"http://playzo.veskod.com/purchases\">\"Мои покупки\"</a>. ', 0, 1, 14, 13, '2019-09-04 14:26:47', '2019-09-04 14:26:47', NULL),
(41, 'Покупатель <a target=\"_blank\" href=\"http://playzo.veskod.com/user-profile/1\">Admin</a> оплатил заказ <a href=\"http://playzo.veskod.com/purchases/3\">#3</a> Игра: <span class=\"half-bold\">LineAge 2</span>; Валюта: <span class=\"half-bold\">Adena</span>; Сервер: <span class=\"half-bold\">BlackBird</span>; В количестве: <span class=\"half-bold\">10.25</span><span class=\"half-bold\">кк</span>; Имя персонажа: <span class=\"half-bold\">wickbull</span> <span class=\"half-bold\"></span><br><a target=\"_blank\" href=\"http://playzo.veskod.com/user-profile/11\">Admin</a>, после выполнения заказа продавцом, не забудьте нажать на кнопку «Подтвердить выполнение заказа» или закрыть заказ в <a target=\"_blank\" href=\"http://playzo.veskod.com/purchases\">\"Мои покупки\"</a>. ', 1, 1, 1, 5, '2019-09-04 14:27:06', '2019-09-13 13:11:39', NULL),
(42, 'Покупатель <a target=\"_blank\" href=\"http://playzo.veskod.com/user-profile/1\">Admin</a> оплатил заказ <a href=\"http://playzo.veskod.com/purchases/4\">#4</a> Игра: <span class=\"half-bold\">LineAge 2</span>; Валюта: <span class=\"half-bold\">Adena</span>; Сервер: <span class=\"half-bold\">BlackBird</span>; В количестве: <span class=\"half-bold\">10.25</span><span class=\"half-bold\">кк</span>; Имя персонажа: <span class=\"half-bold\">wickbull</span> <span class=\"half-bold\"></span><br><a target=\"_blank\" href=\"http://playzo.veskod.com/user-profile/11\">Admin</a>, после выполнения заказа продавцом, не забудьте нажать на кнопку «Подтвердить выполнение заказа» или закрыть заказ в <a target=\"_blank\" href=\"http://playzo.veskod.com/purchases\">\"Мои покупки\"</a>. ', 1, 1, 1, 5, '2019-09-04 14:27:15', '2019-09-13 13:11:39', NULL),
(43, 'Покупатель <a target=\"_blank\" href=\"http://playzo.veskod.com/user-profile/11\">wickbull</a> оплатил заказ <a href=\"http://playzo.veskod.com/purchases/5\">#5</a> Игра: <span class=\"half-bold\">LineAge 2</span>; Валюта: <span class=\"half-bold\">Adena</span>; Сервер: <span class=\"half-bold\">Hatos</span>; В количестве: <span class=\"half-bold\">10</span><span class=\"half-bold\">кк</span>; Имя персонажа: <span class=\"half-bold\">asdasd</span> <span class=\"half-bold\"></span><br><a target=\"_blank\" href=\"http://playzo.veskod.com/user-profile/12\">wickbull</a>, после выполнения заказа продавцом, не забудьте нажать на кнопку «Подтвердить выполнение заказа» или закрыть заказ в <a target=\"_blank\" href=\"http://playzo.veskod.com/purchases\">\"Мои покупки\"</a>. ', 1, 1, 2, 13, '2019-09-04 14:28:06', '2019-09-13 15:37:58', NULL),
(44, 'Покупатель <a target=\"_blank\" href=\"http://playzo.veskod.com/user-profile/11\">wickbull</a> оплатил заказ <a href=\"http://playzo.veskod.com/purchases/6\">#6</a> Игра: <span class=\"half-bold\">LineAge 2</span>; Валюта: <span class=\"half-bold\">Adena</span>; Сервер: <span class=\"half-bold\">Hatos</span>; В количестве: <span class=\"half-bold\">10</span><span class=\"half-bold\">кк</span>; Имя персонажа: <span class=\"half-bold\">asdasd</span> <span class=\"half-bold\"></span><br><a target=\"_blank\" href=\"http://playzo.veskod.com/user-profile/12\">wickbull</a>, после выполнения заказа продавцом, не забудьте нажать на кнопку «Подтвердить выполнение заказа» или закрыть заказ в <a target=\"_blank\" href=\"http://playzo.veskod.com/purchases\">\"Мои покупки\"</a>. ', 1, 1, 2, 13, '2019-09-04 14:28:11', '2019-09-13 15:37:58', NULL),
(45, 'Покупатель <a target=\"_blank\" href=\"http://playzo.veskod.com/user-profile/11\">wickbull</a> оплатил заказ <a href=\"http://playzo.veskod.com/purchases/7\">#7</a> Игра: <span class=\"half-bold\">LineAge 2</span>; Валюта: <span class=\"half-bold\">Adena</span>; Сервер: <span class=\"half-bold\">Hatos</span>; В количестве: <span class=\"half-bold\">10</span><span class=\"half-bold\">кк</span>; Имя персонажа: <span class=\"half-bold\">asdasd</span> <span class=\"half-bold\"></span><br><a target=\"_blank\" href=\"http://playzo.veskod.com/user-profile/12\">wickbull</a>, после выполнения заказа продавцом, не забудьте нажать на кнопку «Подтвердить выполнение заказа» или закрыть заказ в <a target=\"_blank\" href=\"http://playzo.veskod.com/purchases\">\"Мои покупки\"</a>. ', 1, 1, 2, 13, '2019-09-04 14:28:14', '2019-09-13 15:37:58', NULL),
(46, 'Покупатель <a target=\"_blank\" href=\"http://playzo.veskod.com/user-profile/16\">dub3</a> оплатил заказ <a href=\"http://playzo.veskod.com/purchases/8\">#8</a> Игра: <span class=\"half-bold\">LineAge 2</span>; Валюта: <span class=\"half-bold\">Adena</span>; Сервер: <span class=\"half-bold\">BlackBird</span>; В количестве: <span class=\"half-bold\">833.333</span><span class=\"half-bold\">кк</span>; Имя персонажа: <span class=\"half-bold\">lol</span> <span class=\"half-bold\"></span><br><a target=\"_blank\" href=\"http://playzo.veskod.com/user-profile/11\">dub3</a>, после выполнения заказа продавцом, не забудьте нажать на кнопку «Подтвердить выполнение заказа» или закрыть заказ в <a target=\"_blank\" href=\"http://playzo.veskod.com/purchases\">\"Мои покупки\"</a>. ', 1, 1, 11, 5, '2019-09-04 16:25:39', '2019-09-06 10:03:47', NULL),
(47, 'ahyenno', 1, 16, 11, NULL, '2019-09-04 16:25:56', '2019-09-06 10:03:47', NULL),
(48, 'Покупатель <a href=\"http://playzo.veskod.com/user-profile/16\">dub3</a> подтвердил успешное выполнение заказа <a href=\"http://playzo.veskod.com/purchases/8\">#8</a> В количестве: 833.333 кк и отправил деньги продавцу <a href=\"http://playzo.veskod.com/user-profile/11\">wickbull</a>.</br> Нажмите <a href=\"http://playzo.veskod.com/user-profile/11#tab-profile_feedbacks\">тут</a> что бы оставить отзыв или оценить продавца.', 1, 1, 11, 5, '2019-09-04 16:26:11', '2019-09-06 10:03:47', NULL),
(49, 'Покупатель <a target=\"_blank\" href=\"http://playzo.veskod.com/user-profile/16\">dub3</a> оплатил заказ <a href=\"http://playzo.veskod.com/purchases/9\">#9</a> Игра: <span class=\"half-bold\">LineAge 2</span>; Валюта: <span class=\"half-bold\">Adena</span>; Сервер: <span class=\"half-bold\">Estus</span>; В количестве: <span class=\"half-bold\">250</span><span class=\"half-bold\">кк</span>; Имя персонажа: <span class=\"half-bold\">lolяЧ</span> <span class=\"half-bold\"></span><br><a target=\"_blank\" href=\"http://playzo.veskod.com/user-profile/11\">dub3</a>, после выполнения заказа продавцом, не забудьте нажать на кнопку «Подтвердить выполнение заказа» или закрыть заказ в <a target=\"_blank\" href=\"http://playzo.veskod.com/purchases\">\"Мои покупки\"</a>. ', 1, 1, 11, 6, '2019-09-04 16:27:13', '2019-09-06 10:03:47', NULL),
(50, 'Покупатель <a href=\"http://playzo.veskod.com/user-profile/16\">dub3</a> подтвердил успешное выполнение заказа <a href=\"http://playzo.veskod.com/purchases/9\">#9</a> В количестве: 250 кк и отправил деньги продавцу <a href=\"http://playzo.veskod.com/user-profile/11\">wickbull</a>.</br> Нажмите <a href=\"http://playzo.veskod.com/user-profile/11#tab-profile_feedbacks\">тут</a> что бы оставить отзыв или оценить продавца.', 1, 1, 11, 6, '2019-09-04 16:27:22', '2019-09-06 10:03:47', NULL),
(51, 'Покупатель <a target=\"_blank\" href=\"http://playzo.veskod.com/user-profile/16\">dub3</a> оплатил заказ <a href=\"http://playzo.veskod.com/purchases/10\">#10</a> Игра: <span class=\"half-bold\">LineAge 2</span>; Сервер: <span class=\"half-bold\">Airin</span>; В количестве: <span class=\"half-bold\">12 шт</span>; Имя персонажа: <span class=\"half-bold\">wickbull</span>; Items: <span class=\"half-bold\">KOLCO</span><br><a target=\"_blank\" href=\"http://playzo.veskod.com/user-profile/11\">dub3</a>, после выполнения заказа продавцом, не забудьте нажать на кнопку «Подтвердить выполнение заказа» или закрыть заказ в <a target=\"_blank\" href=\"http://playzo.veskod.com/purchases\">\"Мои покупки\"</a>. ', 1, 1, 11, 4, '2019-09-04 17:14:28', '2019-09-06 10:03:47', NULL),
(52, 'Покупатель <a target=\"_blank\" href=\"http://127.0.0.1:8001/user-profile/16\">dub3</a> оплатил заказ <a href=\"http://127.0.0.1:8001/purchases/11\">#11</a> Игра: <span class=\"half-bold\">LineAge 2</span>; Валюта: <span class=\"half-bold\">Adena</span>; Сервер: <span class=\"half-bold\">BlackBird</span>; В количестве: <span class=\"half-bold\">26.75</span><span class=\"half-bold\">кк</span>; Имя персонажа: <span class=\"half-bold\">23</span> <span class=\"half-bold\"></span><br><a target=\"_blank\" href=\"http://127.0.0.1:8001/user-profile/11\">dub3</a>, после выполнения заказа продавцом, не забудьте нажать на кнопку «Подтвердить выполнение заказа» или закрыть заказ в <a target=\"_blank\" href=\"http://127.0.0.1:8001/purchases\">\"Мои покупки\"</a>. ', 1, 1, 11, 5, '2019-09-04 17:42:05', '2019-09-06 10:03:47', NULL),
(53, 'Покупатель <a target=\"_blank\" href=\"http://127.0.0.1:8001/user-profile/11\">wickbull</a> оплатил заказ <a href=\"http://127.0.0.1:8001/purchases/12\">#12</a> Игра: <span class=\"half-bold\">LineAge 2</span>; Валюта: <span class=\"half-bold\">Adena</span>; Сервер: <span class=\"half-bold\">Airin</span>; В количестве: <span class=\"half-bold\">10.283</span><span class=\"half-bold\">кк</span>; Имя персонажа: <span class=\"half-bold\">pzdc</span> <span class=\"half-bold\"></span><br><a target=\"_blank\" href=\"http://127.0.0.1:8001/user-profile/12\">wickbull</a>, после выполнения заказа продавцом, не забудьте нажать на кнопку «Подтвердить выполнение заказа» или закрыть заказ в <a target=\"_blank\" href=\"http://127.0.0.1:8001/purchases\">\"Мои покупки\"</a>. ', 1, 1, 2, 9, '2019-09-05 10:10:08', '2019-09-13 15:37:58', NULL),
(54, 'Покупатель <a href=\"http://127.0.0.1:8000/user-profile/11\">wickbull</a> подтвердил успешное выполнение заказа <a href=\"http://127.0.0.1:8000/purchases/15\">#15</a> В количестве: 10шт.  и отправил деньги продавцу <a href=\"http://127.0.0.1:8000/user-profile/12\">vikiokina</a>.</br> Нажмите <a href=\"http://127.0.0.1:8000/user-profile/12#tab-profile_feedbacks\">тут</a> что бы оставить отзыв или оценить продавца.', 1, 1, 2, 30, '2019-09-06 09:23:27', '2019-09-13 15:37:58', NULL),
(55, 'Покупатель <a target=\"_blank\" href=\"http://127.0.0.1:8000/user-profile/12\">vikiokina</a> оплатил заказ <a href=\"http://127.0.0.1:8000/purchases/16\">#16</a> Игра: <span class=\"half-bold\">LineAge 2</span>; Валюта: <span class=\"half-bold\">Adena</span>; Сервер: <span class=\"half-bold\">Estus</span>; В количестве: <span class=\"half-bold\">500</span><span class=\"half-bold\">кк</span>; Имя персонажа: <span class=\"half-bold\">wickbull</span> <span class=\"half-bold\"></span><br><a target=\"_blank\" href=\"http://127.0.0.1:8000/user-profile/11\">vikiokina</a>, после выполнения заказа продавцом, не забудьте нажать на кнопку «Подтвердить выполнение заказа» или закрыть заказ в <a target=\"_blank\" href=\"http://127.0.0.1:8000/purchases\">\"Мои покупки\"</a>. ', 1, 1, 2, 6, '2019-09-06 12:39:33', '2019-09-13 15:37:58', NULL),
(56, 'Покупатель <a target=\"_blank\" href=\"http://127.0.0.1:8000/user-profile/12\">vikiokina</a> оплатил заказ <a href=\"http://127.0.0.1:8000/purchases/17\">#17</a> Игра: <span class=\"half-bold\">LineAge 2</span>; Сервер: <span class=\"half-bold\">Airin</span>; В количестве: <span class=\"half-bold\">12 шт</span>; Имя персонажа: <span class=\"half-bold\">wickbull</span>; Items: <span class=\"half-bold\">KOLCO</span><br><a target=\"_blank\" href=\"http://127.0.0.1:8000/user-profile/11\">vikiokina</a>, после выполнения заказа продавцом, не забудьте нажать на кнопку «Подтвердить выполнение заказа» или закрыть заказ в <a target=\"_blank\" href=\"http://127.0.0.1:8000/purchases\">\"Мои покупки\"</a>. ', 1, 1, 2, 4, '2019-09-06 12:40:47', '2019-09-13 15:37:58', NULL),
(57, 'Покупатель <a target=\"_blank\" href=\"http://127.0.0.1:8000/user-profile/12\">vikiokina</a> оплатил заказ <a href=\"http://127.0.0.1:8000/purchases/18\">#18</a> Игра: <span class=\"half-bold\">LineAge 2</span>; Сервер: <span class=\"half-bold\">Airin</span>; В количестве: <span class=\"half-bold\">1 шт</span>; Имя персонажа: <span class=\"half-bold\">wickbull</span>; Items: <span class=\"half-bold\">KOLCO</span><br><a target=\"_blank\" href=\"http://127.0.0.1:8000/user-profile/11\">vikiokina</a>, после выполнения заказа продавцом, не забудьте нажать на кнопку «Подтвердить выполнение заказа» или закрыть заказ в <a target=\"_blank\" href=\"http://127.0.0.1:8000/purchases\">\"Мои покупки\"</a>. ', 1, 1, 2, 4, '2019-09-06 13:19:41', '2019-09-13 15:37:58', NULL),
(58, 'Покупатель <a target=\"_blank\" href=\"http://127.0.0.1:8000/user-profile/12\">vikiokina</a> оплатил заказ <a href=\"http://127.0.0.1:8000/purchases/19\">#19</a> Игра: <span class=\"half-bold\">LineAge 2</span>; Сервер: <span class=\"half-bold\">Airin</span>; В количестве: <span class=\"half-bold\">1 шт</span>; Имя персонажа: <span class=\"half-bold\">wickbull</span>; Items: <span class=\"half-bold\">KOLCO</span><br><a target=\"_blank\" href=\"http://127.0.0.1:8000/user-profile/11\">vikiokina</a>, после выполнения заказа продавцом, не забудьте нажать на кнопку «Подтвердить выполнение заказа» или закрыть заказ в <a target=\"_blank\" href=\"http://127.0.0.1:8000/purchases\">\"Мои покупки\"</a>. ', 1, 1, 2, 4, '2019-09-06 13:37:43', '2019-09-13 15:37:58', NULL),
(59, 'Покупатель <a target=\"_blank\" href=\"http://127.0.0.1:8000/user-profile/12\">vikiokina</a> оплатил заказ <a href=\"http://127.0.0.1:8000/purchases/20\">#20</a> Игра: <span class=\"half-bold\">LineAge 2</span>; Сервер: <span class=\"half-bold\">Airin</span>; В количестве: <span class=\"half-bold\">10 шт</span>; Имя персонажа: <span class=\"half-bold\">wickbull</span>; Items: <span class=\"half-bold\">KOLCO</span><br><a target=\"_blank\" href=\"http://127.0.0.1:8000/user-profile/11\">vikiokina</a>, после выполнения заказа продавцом, не забудьте нажать на кнопку «Подтвердить выполнение заказа» или закрыть заказ в <a target=\"_blank\" href=\"http://127.0.0.1:8000/purchases\">\"Мои покупки\"</a>. ', 1, 1, 2, 4, '2019-09-06 14:41:29', '2019-09-13 15:37:58', NULL),
(60, '123', 1, 1, 1, 3, '2019-09-12 10:33:23', '2019-09-13 13:11:39', NULL),
(61, 'Покупатель <a target=\"_blank\" href=\"http://127.0.0.1:8000/user-profile/1\">Admin</a> оплатил заказ <a href=\"http://127.0.0.1:8000/purchases/21\">#21</a> Игра: <span class=\"half-bold\">LineAge 2</span>; Валюта: <span class=\"half-bold\">Adena</span>; Сервер: <span class=\"half-bold\">Elcardia</span>; В количестве: <span class=\"half-bold\">0.982</span><span class=\"half-bold\">кк</span>; Имя персонажа: <span class=\"half-bold\">wwww</span> <span class=\"half-bold\"></span><br><a target=\"_blank\" href=\"http://127.0.0.1:8000/user-profile/11\">Admin</a>, после выполнения заказа продавцом, не забудьте нажать на кнопку «Подтвердить выполнение заказа» или закрыть заказ в <a target=\"_blank\" href=\"http://127.0.0.1:8000/purchases\">\"Мои покупки\"</a>. ', 1, 1, 1, 3, '2019-09-12 10:34:51', '2019-09-13 13:11:39', NULL),
(62, 'Покупатель <a target=\"_blank\" href=\"http://127.0.0.1:8000/user-profile/1\">Admin</a> оплатил заказ <a href=\"http://127.0.0.1:8000/purchases/22\">#22</a> Игра: <span class=\"half-bold\">LineAge 2</span>; Валюта: <span class=\"half-bold\">Adena</span>; Сервер: <span class=\"half-bold\">Estus</span>; В количестве: <span class=\"half-bold\">30.5</span><span class=\"half-bold\">кк</span>; Имя персонажа: <span class=\"half-bold\">weqe</span> <span class=\"half-bold\"></span><br><a target=\"_blank\" href=\"http://127.0.0.1:8000/user-profile/11\">Admin</a>, после выполнения заказа продавцом, не забудьте нажать на кнопку «Подтвердить выполнение заказа» или закрыть заказ в <a target=\"_blank\" href=\"http://127.0.0.1:8000/purchases\">\"Мои покупки\"</a>. ', 1, 1, 1, 6, '2019-09-12 10:59:03', '2019-09-13 13:11:39', NULL),
(63, 'Покупатель <a target=\"_blank\" href=\"http://127.0.0.1:8000/user-profile/1\">Admin</a> оплатил заказ <a href=\"http://127.0.0.1:8000/purchases/23\">#23</a> Игра: <span class=\"half-bold\">LineAge 2</span>; Валюта: <span class=\"half-bold\">Adena</span>; Сервер: <span class=\"half-bold\">Estus</span>; В количестве: <span class=\"half-bold\">30.5</span><span class=\"half-bold\">кк</span>; Имя персонажа: <span class=\"half-bold\">weqe</span> <span class=\"half-bold\"></span><br><a target=\"_blank\" href=\"http://127.0.0.1:8000/user-profile/11\">Admin</a>, после выполнения заказа продавцом, не забудьте нажать на кнопку «Подтвердить выполнение заказа» или закрыть заказ в <a target=\"_blank\" href=\"http://127.0.0.1:8000/purchases\">\"Мои покупки\"</a>. ', 1, 1, 1, 6, '2019-09-12 11:00:22', '2019-09-13 13:11:39', NULL),
(64, 'Покупатель <a target=\"_blank\" href=\"http://127.0.0.1:8000/user-profile/1\">Admin</a> оплатил заказ <a href=\"http://127.0.0.1:8000/purchases/24\">#24</a> Игра: <span class=\"half-bold\">LineAge 2</span>; Валюта: <span class=\"half-bold\">Adena</span>; Сервер: <span class=\"half-bold\">Estus</span>; В количестве: <span class=\"half-bold\">30.5</span><span class=\"half-bold\">кк</span>; Имя персонажа: <span class=\"half-bold\">weqe</span> <span class=\"half-bold\"></span><br><a target=\"_blank\" href=\"http://127.0.0.1:8000/user-profile/11\">Admin</a>, после выполнения заказа продавцом, не забудьте нажать на кнопку «Подтвердить выполнение заказа» или закрыть заказ в <a target=\"_blank\" href=\"http://127.0.0.1:8000/purchases\">\"Мои покупки\"</a>. ', 1, 1, 1, 6, '2019-09-12 11:00:39', '2019-09-13 13:11:39', NULL),
(65, 'Покупатель <a target=\"_blank\" href=\"http://127.0.0.1:8000/user-profile/1\">Admin</a> оплатил заказ <a href=\"http://127.0.0.1:8000/purchases/25\">#25</a> Игра: <span class=\"half-bold\">LineAge 2</span>; Валюта: <span class=\"half-bold\">Adena</span>; Сервер: <span class=\"half-bold\">Estus</span>; В количестве: <span class=\"half-bold\">27.75</span><span class=\"half-bold\">кк</span>; Имя персонажа: <span class=\"half-bold\">sdas</span> <span class=\"half-bold\"></span><br><a target=\"_blank\" href=\"http://127.0.0.1:8000/user-profile/11\">Admin</a>, после выполнения заказа продавцом, не забудьте нажать на кнопку «Подтвердить выполнение заказа» или закрыть заказ в <a target=\"_blank\" href=\"http://127.0.0.1:8000/purchases\">\"Мои покупки\"</a>. ', 1, 1, 1, 6, '2019-09-12 11:02:43', '2019-09-13 13:11:39', NULL),
(66, 'Покупатель <a href=\"http://127.0.0.1:8000/user-profile/1\">Admin</a> подтвердил успешное выполнение заказа <a href=\"http://127.0.0.1:8000/purchases/2\">#2</a> В количестве:10 кки отправил деньги продавцу <a href=\"http://127.0.0.1:8000/user-profile/12\">vikiokina</a>.</br> Нажмите <a href=\"http://127.0.0.1:8000/user-profile/12#tab-profile_feedbacks\">здесь</a> что бы оставить отзыв или оценить продавца.', 0, 1, 14, 13, '2019-09-16 13:33:51', '2019-09-16 13:33:51', NULL),
(67, 'Buyer <a href=\"http://127.0.0.1:8001/user-profile/1\">Admin</a> confirmed the successful completion of the order <a href=\"http://127.0.0.1:8001/purchases/25\">#25</a> In quantity:27.75 ккand sent the money to the seller <a href=\"http://127.0.0.1:8001/user-profile/11\">wickbull</a>.</br> Click <a href=\"http://127.0.0.1:8001/user-profile/11#tab-profile_feedbacks\">here</a> to leave a review or rate the seller.', 0, 1, 1, 6, '2019-09-17 11:10:51', '2019-09-17 11:10:51', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `dialog_participants`
--

CREATE TABLE `dialog_participants` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `dialog_id` int(10) UNSIGNED NOT NULL,
  `last_read` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `dialog_participants`
--

INSERT INTO `dialog_participants` (`id`, `user_id`, `dialog_id`, `last_read`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, '2019-09-17 14:09:29', '2019-08-29 09:57:11', '2019-09-17 12:09:29', NULL),
(2, 11, 1, '2019-09-13 15:11:39', '2019-08-29 09:57:11', '2019-09-17 11:10:51', NULL),
(3, 12, 2, '2019-09-06 18:24:11', '2019-09-04 12:56:05', '2019-09-06 16:24:11', NULL),
(4, 11, 2, '2019-09-13 17:37:58', '2019-09-04 12:56:05', '2019-09-13 15:37:58', NULL),
(7, 11, 4, NULL, '2019-09-04 13:56:55', '2019-09-04 13:57:04', NULL),
(8, 2, 4, NULL, '2019-09-04 13:56:55', '2019-09-04 13:57:04', NULL),
(9, 11, 5, '2019-09-04 15:58:09', '2019-09-04 13:57:23', '2019-09-04 13:58:09', NULL),
(10, 3, 5, NULL, '2019-09-04 13:57:24', '2019-09-04 13:57:55', NULL),
(11, 11, 6, '2019-09-04 15:58:35', '2019-09-04 13:58:15', '2019-09-04 13:58:35', NULL),
(12, 5, 6, NULL, '2019-09-04 13:58:15', '2019-09-04 13:58:15', NULL),
(13, 11, 7, NULL, '2019-09-04 13:58:41', '2019-09-04 13:58:41', NULL),
(14, 10, 7, NULL, '2019-09-04 13:58:41', '2019-09-04 13:58:41', NULL),
(15, 11, 8, '2019-09-05 12:26:06', '2019-09-04 13:58:50', '2019-09-05 10:26:06', NULL),
(16, 4, 8, NULL, '2019-09-04 13:58:50', '2019-09-04 13:58:50', NULL),
(17, 11, 9, '2019-09-05 12:25:58', '2019-09-04 13:59:02', '2019-09-05 10:25:58', NULL),
(18, 6, 9, NULL, '2019-09-04 13:59:02', '2019-09-04 13:59:02', NULL),
(19, 11, 10, '2019-09-05 12:25:38', '2019-09-04 13:59:08', '2019-09-05 10:25:38', NULL),
(20, 7, 10, NULL, '2019-09-04 13:59:08', '2019-09-04 13:59:08', NULL),
(21, 11, 11, '2019-09-06 12:03:47', '2019-09-04 14:13:35', '2019-09-06 10:03:47', NULL),
(22, 16, 11, '2019-09-05 12:24:13', '2019-09-04 14:13:35', '2019-09-05 10:24:13', NULL),
(23, 11, 12, '2019-09-05 15:48:19', '2019-09-04 14:13:45', '2019-09-05 13:48:19', NULL),
(24, 15, 12, NULL, '2019-09-04 14:13:45', '2019-09-04 14:13:45', NULL),
(25, 11, 13, '2019-09-05 12:25:00', '2019-09-04 14:13:54', '2019-09-05 10:25:00', NULL),
(26, 14, 13, NULL, '2019-09-04 14:13:55', '2019-09-04 14:13:55', NULL),
(27, 1, 14, '2019-09-17 14:08:45', '2019-09-04 14:26:47', '2019-09-17 12:08:45', NULL),
(28, 12, 14, NULL, '2019-09-04 14:26:47', '2019-09-16 13:33:51', NULL),
(29, 1, 14, '2019-09-17 14:08:45', '2019-09-04 14:26:47', '2019-09-17 12:08:45', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `games`
--

CREATE TABLE `games` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `region` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `games`
--

INSERT INTO `games` (`id`, `name`, `region`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'LineAge 2', 'RU', '<p><span style=\"color: #00ccff;\"><strong>Lineage II</strong></span>&nbsp;- многопользовательская ролевая онлайн-игра&nbsp;. Игра является&nbsp;приквелом, события в котором происходят за 150 лет до начала оригинальной&nbsp;Lineage. Была запущена&nbsp;в&nbsp;Южной Корее 1 октября 2003 года.&nbsp;</p>\r\n<p>В Lineage II игровая валюта имеет названия \"Адена\", заработать адену можно следующими способами:&nbsp;&nbsp;</p>\r\n<p><strong>Фарм</strong>, попытка заработать игровю валюту/предметы с помощью убийства монстров, крафта, торговли. Недостатком фарма есть время затраченое на данный способ добычи адены. Время которое можно потратить на свою учебу/друзей/работу/семью поэтому многие вместо долгого и скучного фарма выбирают такой вариант добычи&nbsp;игровых ценностей как: покупка&nbsp; адены, прокачка персонажа, покупка игровых предметов. Пожалуй это самый&nbsp;быстрый и самый простой способ начать получать удовольствие от игры, не ограничивая себя&nbsp;скучным фармом.&nbsp;&nbsp;</p>\r\n<p>Если Вы хотите с удовольствием играть в Lineage II , то купить игровые ценности&nbsp;&nbsp;дешево, без риска и посредников Вам поможет наша биржа. На нашей бирже Вы всегда можете купить или продать&nbsp;игровые предметы и валюту&nbsp;&nbsp;Lineage II по выгодным ценам. Купить адену&nbsp; &ndash; Ваш шанс быстро включиться в игру&nbsp; а это значит быстро перейти к самому интересному&nbsp; что может предоставить Lineage II &ndash; захватывать замки, побеждать драконов, учавстовать в массовых&nbsp; ПвП битвах, учавстовать в приключениях вместе с друзьями в группах и кланах, брать участие в Олимпиаде где можно получить статус Героя и доказать что Вы один из лучших игроков на просторах игры . В Lineage II возможно все, если у вас есть много времени или возможность купить адену/предметы.&nbsp;</p>\r\n<p><span style=\"color: #00ccff;\"><strong>Как приобрести адену</strong></span></p>\r\n<p>1) Выбрать сервер.</p>\r\n<p>2) Выбрать продавца с приемлемой ценой, связаться с ним.</p>\r\n<p>3) Получить игровую валюту от продавца под контролем Гаранта.</p>\r\n<p>4) Завершить перевод средств продавцу.</p>\r\n<p><span style=\"color: #00ccff;\"><strong>Продажа адены на&nbsp;бирже ведется круглосуточно, более того, вы всегда можете видеть:</strong></span></p>\r\n<p>- статус продавцов,</p>\r\n<p>- отзывы о них,</p>\r\n<p>- время их нахождения на сайте,</p>\r\n<p>- количество игровой валюты в наличии у каждого и цену.</p>\r\n<p><span style=\"color: #00ccff;\"><strong>Почему выгодно покупать адену на бирже PlayZo:</strong></span></p>\r\n<p>- Здесь игроки покупают у других игроков, без посредников</p>\r\n<p>- Все продавцы имеют рейтинг и отзывы.</p>\r\n<p>- Комиссия PlayZo, самая низкая на рынке.</p>\r\n<p>- Оплата и получение игровой валюты проходит мгновенно</p>\r\n<p>&nbsp;</p>\r\n<p>PlayZo не располагает игрой Lineage или ее составными частями.&nbsp; Официальный сайт игры: ru.4game.com</p>', '2017-09-20 06:07:13', '2018-07-16 08:48:15', NULL),
(2, 'Dota2', NULL, NULL, '2017-09-20 06:07:48', '2018-05-24 12:38:05', '2018-05-24 12:38:05'),
(3, 'Fifa', NULL, NULL, '2017-09-20 06:08:00', '2018-05-24 12:38:15', '2018-05-24 12:38:15'),
(4, 'Elder Scrolls (TESO)', NULL, NULL, '2017-09-20 06:08:21', '2018-05-24 12:40:10', '2018-05-24 12:40:10'),
(5, 'Aion', NULL, NULL, '2017-09-20 06:17:06', '2018-05-24 12:40:15', '2018-05-24 12:40:15'),
(6, 'dsafadf', NULL, NULL, '2017-09-20 06:21:33', '2017-09-20 07:35:22', '2017-09-20 07:35:22'),
(7, 'asdadasd', NULL, NULL, '2017-09-20 06:41:23', '2017-09-20 06:42:31', '2017-09-20 06:42:31'),
(8, 'asdas', NULL, NULL, '2017-09-20 07:28:11', '2017-09-20 07:35:26', '2017-09-20 07:35:26'),
(9, 'ArcheAge', NULL, NULL, '2017-09-20 08:11:37', '2018-05-24 12:39:39', '2018-05-24 12:39:39'),
(10, 'Black Desert', NULL, NULL, '2017-09-20 08:12:09', '2018-05-24 12:39:29', '2018-05-24 12:39:29'),
(11, 'Hearthstone', NULL, NULL, '2017-09-20 09:05:06', '2018-05-24 12:38:59', '2018-05-24 12:38:59'),
(12, 'GTA 5', NULL, NULL, '2017-09-21 02:01:26', '2018-05-24 12:39:24', '2018-05-24 12:39:24'),
(13, 'Lineage 2 Classic', 'RU', '<p><span style=\"color: #00ccff;\"><strong>Lineage II</strong></span>&nbsp;- многопользовательская ролевая онлайн-игра&nbsp;. Игра является&nbsp;приквелом, события в котором происходят за 150 лет до начала оригинальной&nbsp;Lineage. Была запущена&nbsp;в&nbsp;Южной Корее 1 октября 2003 года.&nbsp;</p>\r\n<p>В Lineage II игровая валюта имеет названия \"Адена\", заработать адену можно следующими способами:&nbsp;&nbsp;</p>\r\n<p><strong>Фарм</strong>, попытка заработать игровю валюту/предметы с помощью убийства монстров, крафта, торговли. Недостатком фарма есть время затраченое на данный способ добычи адены. Время которое можно потратить на свою учебу/друзей/работу/семью поэтому многие вместо долгого и скучного фарма выбирают такой вариант добычи&nbsp;игровых ценностей как: покупка&nbsp; адены, прокачка персонажа, покупка игровых предметов. Пожалуй это самый&nbsp;быстрый и самый простой способ начать получать удовольствие от игры, не ограничивая себя&nbsp;скучным фармом.&nbsp;&nbsp;</p>\r\n<p>Если Вы хотите с удовольствием играть в Lineage II , то купить игровые ценности&nbsp;&nbsp;дешево, без риска и посредников Вам поможет наша биржа. На нашей бирже Вы всегда можете купить или продать&nbsp;игровые предметы и валюту&nbsp;&nbsp;Lineage II по выгодным ценам. Купить адену&nbsp; &ndash; Ваш шанс быстро включиться в игру&nbsp; а это значит быстро перейти к самому интересному&nbsp; что может предоставить Lineage II &ndash; захватывать замки, побеждать драконов, учавстовать в массовых&nbsp; ПвП битвах, учавстовать в приключениях вместе с друзьями в группах и кланах, брать участие в Олимпиаде где можно получить статус Героя и доказать что Вы один из лучших игроков на просторах игры . В Lineage II возможно все, если у вас есть много времени или возможность купить адену/предметы.&nbsp;</p>\r\n<p><span style=\"color: #00ccff;\"><strong>Как приобрести адену</strong></span></p>\r\n<p>1) Выбрать сервер.</p>\r\n<p>2) Выбрать продавца с приемлемой ценой, связаться с ним.</p>\r\n<p>3) Получить игровую валюту от продавца под контролем Гаранта.</p>\r\n<p>4) Завершить перевод средств продавцу.</p>\r\n<p><span style=\"color: #00ccff;\"><strong>Продажа адены на&nbsp;бирже ведется круглосуточно, более того, вы всегда можете видеть:</strong></span></p>\r\n<p>- статус продавцов,</p>\r\n<p>- отзывы о них,</p>\r\n<p>- время их нахождения на сайте,</p>\r\n<p>- количество игровой валюты в наличии у каждого и цену.</p>\r\n<p><span style=\"color: #00ccff;\"><strong>Почему выгодно покупать адену на бирже PlayZo:</strong></span></p>\r\n<p>- Здесь игроки покупают у других игроков, без посредников</p>\r\n<p>- Все продавцы имеют рейтинг и отзывы.</p>\r\n<p>- Комиссия PlayZo, самая низкая на рынке.</p>\r\n<p>- Оплата и получение игровой валюты проходит мгновенно</p>\r\n<p>&nbsp;</p>\r\n<p>PlayZo не располагает игрой Lineage или ее составными частями.&nbsp; Официальный сайт игры: ru.4game.com</p>', '2017-10-03 07:29:47', '2018-07-16 08:49:07', NULL),
(14, 'Тестовый сервер второй', 'RU', NULL, '2018-03-07 23:10:10', '2018-05-24 12:39:14', '2018-05-24 12:39:14'),
(15, 'Новая игра', 'Ru, Eu', NULL, '2018-03-12 14:17:23', '2018-05-24 12:39:07', '2018-05-24 12:39:07'),
(16, 'Game 2', NULL, NULL, '2018-03-12 14:19:08', '2018-05-24 12:37:51', '2018-05-24 12:37:51'),
(17, 'Game212', NULL, NULL, '2018-03-12 14:20:09', '2018-05-24 12:37:58', '2018-05-24 12:37:58'),
(18, 'Какая то игра', NULL, NULL, '2018-03-12 14:25:51', '2018-05-24 12:39:20', '2018-05-24 12:39:20'),
(19, 'Perfect World', 'RU', NULL, '2018-03-24 20:27:47', '2018-05-24 12:39:43', '2018-05-24 12:39:43'),
(20, 'Игротест', 'RU', NULL, '2018-03-28 10:38:40', '2018-05-24 12:38:22', '2018-05-24 12:38:22'),
(21, 'GTA 5', 'Ru, EU', 'GTA 5 - online', '2018-05-24 12:53:02', '2018-05-24 12:57:54', '2018-05-24 12:57:54'),
(22, 'GTA 5', 'Ru, EU', 'GTA 5 - online', '2018-05-24 12:53:36', '2018-05-24 12:53:54', '2018-05-24 12:53:54'),
(23, 'Aion', 'RU', '<p><span style=\"color: #00ccff;\"><strong>Aion -&nbsp;</strong></span><span style=\"color: #222222; font-family: sans-serif;\">&nbsp;</span><span style=\"color: #222222; font-family: sans-serif;\">компьютерная и</span>гра<span style=\"color: #222222; font-family: sans-serif;\">&nbsp;в жанре&nbsp;</span><span style=\"color: #222222; font-family: sans-serif;\">MMORPG</span>,&nbsp;<span style=\"color: #222222; font-family: sans-serif;\">разработанная&nbsp;NCSoft</span><span style=\"color: #222222; font-family: sans-serif;\">, сочетающая в себе&nbsp;PvP</span><span style=\"color: #222222; font-family: sans-serif;\">&nbsp;и PvE</span><span style=\"color: #222222; font-family: sans-serif;\">&nbsp;в мире фэнтези.</span></p>\r\n<p>В Aion&nbsp;игровая валюта имеет названия \"Кинары\", заработать&nbsp;кинары можно как и в других&nbsp;&nbsp;играх&nbsp;<span style=\"color: #222222; font-family: sans-serif;\">в жанре&nbsp;MMORPG</span>&nbsp;с помощью фарма, но мы предлагаем сделать игру более приятной с помощью покупки игровых предметов и валюты на нашей бирже что поможет Вам получить от игры максимум удовольствия без затраты Вашего времени на скучный рутинный фарм. Пускай время которое Вы могли бы потратить на фарм кинаров будет использовано для получение максимального удовольствия от прохождение контента игры вместе с друзьями.</p>\r\n<p><span style=\"color: #00ccff;\"><strong>Как приобрести Кинары</strong></span></p>\r\n<p>1) Выбрать сервер.</p>\r\n<p>2) Выбрать продавца с приемлемой ценой, связаться с ним.</p>\r\n<p>3) Получить игровую валюту от продавца под контролем Гаранта.</p>\r\n<p>4) Завершить перевод средств продавцу.</p>\r\n<p><span style=\"color: #00ccff;\"><strong>Продажа&nbsp;кинаров на&nbsp;бирже&nbsp;ведется круглосуточно, более того, вы всегда можете видеть:</strong></span></p>\r\n<p>- статус продавцов,</p>\r\n<p>- отзывы о них,</p>\r\n<p>- время их нахождения на сайте,</p>\r\n<p>- количество игровой валюты в наличии у каждого и цену.</p>\r\n<p><span style=\"color: #00ccff;\"><strong>Почему выгодно покупать&nbsp;кинары&nbsp;на бирже PlayZo:</strong></span></p>\r\n<p>- Здесь игроки покупают у других игроков, без посредников</p>\r\n<p>- Все продавцы имеют рейтинг и отзывы.</p>\r\n<p>- Комиссия PlayZo, самая низкая на рынке.</p>\r\n<p>- Оплата и получение игровой валюты проходит мгновенно</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>PlayZo не располагает игрой Aion&nbsp;или ее составными частями.&nbsp; Официальный сайт игры: ru.4game.com</p>', '2018-05-24 19:55:40', '2018-07-16 11:43:44', NULL),
(24, 'Perfect World', 'RU', '<p><strong><span style=\"color: #00ccff;\">Perfect World</span></strong><span style=\"color: #222222; font-family: sans-serif;\"><span style=\"color: #00ccff;\">&nbsp;</span></span><span style=\"color: #222222; font-family: sans-serif;\">&nbsp;&mdash; китайская многопользовательская релоевая онлайн-игра, созданная компанией&nbsp;</span><span style=\"color: #222222; font-family: sans-serif;\">Beijing Perfect World.</span></p>\r\n<p>В Perfect World игровой валютой являются \"Юани\"&nbsp;</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 15px; line-height: 20px; color: #777777; font-family: Roboto, sans-serif; outline: none !important;\">&nbsp;</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 15px; line-height: 20px; color: #777777; font-family: Roboto, sans-serif; outline: none !important;\"><span style=\"box-sizing: border-box; outline: none !important; color: #00ccff;\"><strong style=\"box-sizing: border-box; outline: none !important;\">Как приобрести&nbsp;игровые ценности</strong></span></p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 15px; line-height: 20px; color: #777777; font-family: Roboto, sans-serif; outline: none !important;\">1) Выбрать сервер.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 15px; line-height: 20px; color: #777777; font-family: Roboto, sans-serif; outline: none !important;\">2) Выбрать продавца с приемлемой ценой, связаться с ним.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 15px; line-height: 20px; color: #777777; font-family: Roboto, sans-serif; outline: none !important;\">3) Получить игровую валюту от продавца под контролем Гаранта.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 15px; line-height: 20px; color: #777777; font-family: Roboto, sans-serif; outline: none !important;\">4) Завершить перевод средств продавцу.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 15px; line-height: 20px; color: #777777; font-family: Roboto, sans-serif; outline: none !important;\"><span style=\"box-sizing: border-box; outline: none !important; color: #00ccff;\"><strong style=\"box-sizing: border-box; outline: none !important;\">Продажа на&nbsp;бирже&nbsp;ведется круглосуточно, более того, вы всегда можете видеть:</strong></span></p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 15px; line-height: 20px; color: #777777; font-family: Roboto, sans-serif; outline: none !important;\">- статус продавцов,</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 15px; line-height: 20px; color: #777777; font-family: Roboto, sans-serif; outline: none !important;\">- отзывы о них,</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 15px; line-height: 20px; color: #777777; font-family: Roboto, sans-serif; outline: none !important;\">- время их нахождения на сайте,</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 15px; line-height: 20px; color: #777777; font-family: Roboto, sans-serif; outline: none !important;\">- количество игровой валюты в наличии у каждого и цену.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 15px; line-height: 20px; color: #777777; font-family: Roboto, sans-serif; outline: none !important;\"><span style=\"box-sizing: border-box; outline: none !important; color: #00ccff;\"><strong style=\"box-sizing: border-box; outline: none !important;\">Почему выгодно покупать на бирже PlayZo:</strong></span></p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 15px; line-height: 20px; color: #777777; font-family: Roboto, sans-serif; outline: none !important;\">- Здесь игроки покупают у других игроков, без посредников</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 15px; line-height: 20px; color: #777777; font-family: Roboto, sans-serif; outline: none !important;\">- Все продавцы имеют рейтинг и отзывы.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 15px; line-height: 20px; color: #777777; font-family: Roboto, sans-serif; outline: none !important;\">- Комиссия PlayZo, самая низкая на рынке.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 15px; line-height: 20px; color: #777777; font-family: Roboto, sans-serif; outline: none !important;\">- Оплата и получение игровой валюты проходит мгновенно</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 15px; line-height: 20px; color: #777777; font-family: Roboto, sans-serif; outline: none !important;\">&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 15px; line-height: 20px; color: #777777; font-family: Roboto, sans-serif; outline: none !important;\">PlayZo не располагает игрой Perfect World&nbsp;или ее составными частями.&nbsp; Официальный сайт игры: pw.mail.ru</p>', '2018-06-11 15:56:32', '2018-07-16 13:36:21', NULL),
(25, 'Aion', 'EU,NA', '<p><span style=\"color: #00ccff;\"><strong>Aion -&nbsp;</strong></span><span style=\"color: #222222; font-family: sans-serif;\">&nbsp;компьютерная и</span>гра<span style=\"color: #222222; font-family: sans-serif;\">&nbsp;в жанре&nbsp;</span><span style=\"color: #222222; font-family: sans-serif;\">MMORPG</span>,&nbsp;<span style=\"color: #222222; font-family: sans-serif;\">разработанная&nbsp;NCSoft</span><span style=\"color: #222222; font-family: sans-serif;\">, сочетающая в себе&nbsp;PvP</span><span style=\"color: #222222; font-family: sans-serif;\">&nbsp;и PvE</span><span style=\"color: #222222; font-family: sans-serif;\">&nbsp;в мире фэнтези.</span></p>\r\n<p>В Aion&nbsp;игровая валюта имеет названия \"Кинары\", заработать&nbsp;кинары можно как и в других&nbsp;&nbsp;играх&nbsp;<span style=\"color: #222222; font-family: sans-serif;\">в жанре&nbsp;MMORPG</span>&nbsp;с помощью фарма, но мы предлагаем сделать игру более приятной с помощью покупки игровых предметов и валюты на нашей бирже что поможет Вам получить от игры максимум удовольствия без затраты Вашего времени на скучный рутинный фарм. Пускай время которое Вы могли бы потратить на фарм кинаров будет использовано для получение максимального удовольствия от прохождение контента игры вместе с друзьями.</p>\r\n<p><span style=\"color: #00ccff;\"><strong>Как приобрести Кинары</strong></span></p>\r\n<p>1) Выбрать сервер.</p>\r\n<p>2) Выбрать продавца с приемлемой ценой, связаться с ним.</p>\r\n<p>3) Получить игровую валюту от продавца под контролем Гаранта.</p>\r\n<p>4) Завершить перевод средств продавцу.</p>\r\n<p><span style=\"color: #00ccff;\"><strong>Продажа&nbsp;кинаров на&nbsp;бирже&nbsp;ведется круглосуточно, более того, вы всегда можете видеть:</strong></span></p>\r\n<p>- статус продавцов,</p>\r\n<p>- отзывы о них,</p>\r\n<p>- время их нахождения на сайте,</p>\r\n<p>- количество игровой валюты в наличии у каждого и цену.</p>\r\n<p><span style=\"color: #00ccff;\"><strong>Почему выгодно покупать&nbsp;кинары&nbsp;на бирже PlayZo:</strong></span></p>\r\n<p>- Здесь игроки покупают у других игроков, без посредников</p>\r\n<p>- Все продавцы имеют рейтинг и отзывы.</p>\r\n<p>- Комиссия PlayZo, самая низкая на рынке.</p>\r\n<p>- Оплата и получение игровой валюты проходит мгновенно</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>PlayZo не располагает игрой Aion&nbsp;или ее составными частями.</p>', '2018-06-11 16:12:46', '2018-07-16 11:42:46', NULL),
(26, 'LineAge 2', 'EU/NA', '<p><span style=\"color: #00ccff;\"><strong>Lineage II</strong></span>&nbsp;- многопользовательская ролевая онлайн-игра&nbsp;. Игра является&nbsp;приквелом, события в котором происходят за 150 лет до начала оригинальной&nbsp;Lineage. Была запущена&nbsp;в&nbsp;Южной Корее 1 октября 2003 года.&nbsp;</p>\r\n<p>В Lineage II игровая валюта имеет названия \"Адена\", заработать адену можно следующими способами:&nbsp;&nbsp;</p>\r\n<p><strong>Фарм</strong>, попытка заработать игровю валюту/предметы с помощью убийства монстров, крафта, торговли. Недостатком фарма есть время затраченое на данный способ добычи адены. Время которое можно потратить на свою учебу/друзей/работу/семью поэтому многие вместо долгого и скучного фарма выбирают такой вариант добычи&nbsp;игровых ценностей как: покупка&nbsp; адены, прокачка персонажа, покупка игровых предметов. Пожалуй это самый&nbsp;быстрый и самый простой способ начать получать удовольствие от игры, не ограничивая себя&nbsp;скучным фармом.&nbsp;&nbsp;</p>\r\n<p>Если Вы хотите с удовольствием играть в Lineage II , то купить игровые ценности&nbsp;&nbsp;дешево, без риска и посредников Вам поможет наша биржа. На нашей бирже Вы всегда можете купить или продать&nbsp;игровые предметы и валюту&nbsp;&nbsp;Lineage II по выгодным ценам. Купить адену&nbsp; &ndash; Ваш шанс быстро включиться в игру&nbsp; а это значит быстро перейти к самому интересному&nbsp; что может предоставить Lineage II &ndash; захватывать замки, побеждать драконов, учавстовать в массовых&nbsp; ПвП битвах, учавстовать в приключениях вместе с друзьями в группах и кланах, брать участие в Олимпиаде где можно получить статус Героя и доказать что Вы один из лучших игроков на просторах игры . В Lineage II возможно все, если у вас есть много времени или возможность купить адену/предметы.&nbsp;</p>\r\n<p><span style=\"color: #00ccff;\"><strong>Как приобрести адену</strong></span></p>\r\n<p>1) Выбрать сервер.</p>\r\n<p>2) Выбрать продавца с приемлемой ценой, связаться с ним.</p>\r\n<p>3) Получить игровую валюту от продавца под контролем Гаранта.</p>\r\n<p>4) Завершить перевод средств продавцу.</p>\r\n<p><span style=\"color: #00ccff;\"><strong>Продажа адены на&nbsp;бирже ведется круглосуточно, более того, вы всегда можете видеть:</strong></span></p>\r\n<p>- статус продавцов,</p>\r\n<p>- отзывы о них,</p>\r\n<p>- время их нахождения на сайте,</p>\r\n<p>- количество игровой валюты в наличии у каждого и цену.</p>\r\n<p><span style=\"color: #00ccff;\"><strong>Почему выгодно покупать адену на бирже PlayZo:</strong></span></p>\r\n<p>- Здесь игроки покупают у других игроков, без посредников</p>\r\n<p>- Все продавцы имеют рейтинг и отзывы.</p>\r\n<p>- Комиссия PlayZo, самая низкая на рынке.</p>\r\n<p>- Оплата и получение игровой валюты проходит мгновенно</p>\r\n<p>&nbsp;</p>\r\n<p>PlayZo не располагает игрой Lineage или ее составными частями.&nbsp;</p>', '2018-06-25 18:03:24', '2018-07-16 08:48:39', NULL),
(27, 'Аллоды Online', 'RU', '<p><strong style=\"color: #222222; font-family: sans-serif;\"><span style=\"color: #00ccff;\">&laquo;Аллоды Онлайн&raquo;</span>&nbsp;</strong><span style=\"color: #222222; font-family: sans-serif;\">&nbsp;&mdash; фэнтезийная многопользовательская ролевая онлайн-игра, продолжающая игровую серию \"Аллоды\" , но уже в масштабе MMORPG-вселенной.&nbsp;</span><span style=\"color: #222222; font-family: sans-serif;\">Игру разрабатывает студия&nbsp;Allods Team.</span></p>\r\n<p><span style=\"color: #222222; font-family: sans-serif;\">Игровой валютой в Аллоды Онлайн есть \"Золото\"</span></p>\r\n<p>&nbsp;</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 15px; line-height: 20px; color: #777777; font-family: Roboto, sans-serif; outline: none !important;\"><span style=\"box-sizing: border-box; outline: none !important; color: #00ccff;\"><strong style=\"box-sizing: border-box; outline: none !important;\">Как приобрести&nbsp;игровые ценности</strong></span></p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 15px; line-height: 20px; color: #777777; font-family: Roboto, sans-serif; outline: none !important;\">1) Выбрать сервер.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 15px; line-height: 20px; color: #777777; font-family: Roboto, sans-serif; outline: none !important;\">2) Выбрать продавца с приемлемой ценой, связаться с ним.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 15px; line-height: 20px; color: #777777; font-family: Roboto, sans-serif; outline: none !important;\">3) Получить игровую валюту от продавца под контролем Гаранта.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 15px; line-height: 20px; color: #777777; font-family: Roboto, sans-serif; outline: none !important;\">4) Завершить перевод средств продавцу.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 15px; line-height: 20px; color: #777777; font-family: Roboto, sans-serif; outline: none !important;\"><span style=\"box-sizing: border-box; outline: none !important; color: #00ccff;\"><strong style=\"box-sizing: border-box; outline: none !important;\">Продажа на&nbsp;бирже&nbsp;ведется круглосуточно, более того, вы всегда можете видеть:</strong></span></p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 15px; line-height: 20px; color: #777777; font-family: Roboto, sans-serif; outline: none !important;\">- статус продавцов,</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 15px; line-height: 20px; color: #777777; font-family: Roboto, sans-serif; outline: none !important;\">- отзывы о них,</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 15px; line-height: 20px; color: #777777; font-family: Roboto, sans-serif; outline: none !important;\">- время их нахождения на сайте,</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 15px; line-height: 20px; color: #777777; font-family: Roboto, sans-serif; outline: none !important;\">- количество игровой валюты в наличии у каждого и цену.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 15px; line-height: 20px; color: #777777; font-family: Roboto, sans-serif; outline: none !important;\"><span style=\"box-sizing: border-box; outline: none !important; color: #00ccff;\"><strong style=\"box-sizing: border-box; outline: none !important;\">Почему выгодно покупать на бирже PlayZo:</strong></span></p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 15px; line-height: 20px; color: #777777; font-family: Roboto, sans-serif; outline: none !important;\">- Здесь игроки покупают у других игроков, без посредников</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 15px; line-height: 20px; color: #777777; font-family: Roboto, sans-serif; outline: none !important;\">- Все продавцы имеют рейтинг и отзывы.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 15px; line-height: 20px; color: #777777; font-family: Roboto, sans-serif; outline: none !important;\">- Комиссия PlayZo, самая низкая на рынке.</p>\r\n<p>&nbsp;</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 15px; line-height: 20px; color: #777777; font-family: Roboto, sans-serif; outline: none !important;\">- Оплата и получение игровой валюты проходит мгновенно</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 15px; line-height: 20px; color: #777777; font-family: Roboto, sans-serif; outline: none !important;\">&nbsp;</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 15px; line-height: 20px; color: #777777; font-family: Roboto, sans-serif; outline: none !important;\">PlayZo не располагает игрой&nbsp;Аллоды онлайн&nbsp;или ее составными частями.&nbsp; Официальный сайт игры: allods.mail.ru</p>', '2018-07-09 16:35:23', '2018-07-16 13:36:47', NULL),
(28, 'ArcheAge', 'RU, EU', NULL, '2018-07-21 21:14:12', '2018-07-21 21:18:01', NULL),
(29, 'WoW', 'RU', '<p>lol kek chebyrek</p>', '2019-08-21 10:19:00', '2019-09-13 12:14:26', '2019-09-13 12:14:26'),
(30, 'WOW', 'RU', '<p>loasdasdalsdalksdjnlsandclaksn asdcnlaskdcnalskdna lsdkcnals dnalsdcn</p>', '2019-09-13 12:12:36', '2019-09-13 12:12:36', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `game_currency`
--

CREATE TABLE `game_currency` (
  `id` int(10) UNSIGNED NOT NULL,
  `currency_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `game_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `game_currency`
--

INSERT INTO `game_currency` (`id`, `currency_id`, `game_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, '18', '2', '2017-09-26 06:57:03', '2017-09-26 06:57:03', NULL),
(5, '20', '15', '2018-03-12 14:17:44', '2018-03-12 14:17:44', NULL),
(8, '10', '18', '2018-03-12 15:51:13', '2018-03-12 15:51:13', NULL),
(11, '20', '19', '2018-03-24 20:44:33', '2018-03-24 20:44:33', NULL),
(12, '1', '20', '2018-03-28 10:38:40', '2018-03-28 10:38:40', NULL),
(16, '1', '22', '2018-05-24 12:53:44', '2018-05-24 12:53:44', NULL),
(32, '20', '24', '2018-06-11 15:56:32', '2018-06-11 15:56:32', NULL),
(33, '2', '23', '2018-06-11 16:05:18', '2018-06-11 16:05:18', NULL),
(34, '2', '25', '2018-06-11 16:12:46', '2018-06-11 16:12:46', NULL),
(35, '1', '13', '2018-06-19 15:58:12', '2018-06-19 15:58:12', NULL),
(39, '1', '1', '2018-06-21 15:34:05', '2018-06-21 15:34:05', NULL),
(42, '1', '26', '2018-06-25 18:20:05', '2018-06-25 18:20:05', NULL),
(49, '29', '27', '2018-07-09 19:57:57', '2018-07-09 19:57:57', NULL),
(50, '31', '27', NULL, NULL, NULL),
(51, '32', '28', NULL, NULL, NULL),
(52, '3', '29', NULL, NULL, NULL),
(53, '7', '29', NULL, NULL, NULL),
(54, '10', '29', NULL, NULL, NULL),
(55, '1', '30', NULL, NULL, NULL),
(56, '2', '30', NULL, NULL, NULL),
(57, '3', '30', NULL, NULL, NULL),
(58, '4', '30', NULL, NULL, NULL),
(59, '5', '30', NULL, NULL, NULL),
(60, '6', '30', NULL, NULL, NULL),
(61, '7', '30', NULL, NULL, NULL),
(62, '8', '30', NULL, NULL, NULL),
(63, '9', '30', NULL, NULL, NULL),
(64, '10', '30', NULL, NULL, NULL),
(65, '11', '30', NULL, NULL, NULL),
(66, '12', '30', NULL, NULL, NULL),
(67, '13', '30', NULL, NULL, NULL),
(68, '14', '30', NULL, NULL, NULL),
(69, '15', '30', NULL, NULL, NULL),
(70, '16', '30', NULL, NULL, NULL),
(71, '17', '30', NULL, NULL, NULL),
(72, '18', '30', NULL, NULL, NULL),
(73, '19', '30', NULL, NULL, NULL),
(74, '20', '30', NULL, NULL, NULL),
(75, '21', '30', NULL, NULL, NULL),
(76, '22', '30', NULL, NULL, NULL),
(77, '27', '30', NULL, NULL, NULL),
(78, '28', '30', NULL, NULL, NULL),
(79, '29', '30', NULL, NULL, NULL),
(80, '30', '30', NULL, NULL, NULL),
(81, '31', '30', NULL, NULL, NULL),
(82, '32', '30', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `game_custom_params`
--

CREATE TABLE `game_custom_params` (
  `id` int(10) UNSIGNED NOT NULL,
  `game_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_input` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `param` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `game_custom_params`
--

INSERT INTO `game_custom_params` (`id`, `game_id`, `name`, `custom_input`, `param`, `created_at`, `updated_at`) VALUES
(7, 23, 'Переслать на почту', 'checkbox', NULL, '2019-08-22 15:15:29', '2019-08-22 16:33:35'),
(8, 23, 'Передать в руки', 'checkbox', NULL, '2019-08-22 15:15:29', '2019-08-22 16:33:33'),
(9, 23, 'Отправить на аукцион', 'checkbox', NULL, '2019-08-22 15:15:29', '2019-08-22 16:33:37'),
(10, 1, 'Отправить на аукцион', 'checkbox', NULL, '2019-08-23 09:58:18', '2019-08-23 11:00:27'),
(11, 1, 'Отправить на почту', 'checkbox', NULL, '2019-08-23 09:58:18', '2019-08-23 11:01:00'),
(12, 1, 'Передать в руки', 'checkbox', NULL, '2019-08-23 11:01:08', '2019-08-23 11:01:16'),
(13, 1, 'Купить минимум предметов', 'min', '10', '2019-08-23 12:11:41', '2019-08-27 10:39:09'),
(17, 1, 'Купить максимум предметов', 'max', '50', '2019-08-27 10:54:20', '2019-08-27 10:54:20'),
(18, 30, 'Купить минимум предметов', 'min', '10', '2019-09-13 13:02:27', '2019-09-13 13:02:27'),
(19, 30, 'Купить максимум предметов', 'max', '123', '2019-09-13 13:02:28', '2019-09-13 13:02:28'),
(20, 30, 'тест', 'text', '50', '2019-09-13 13:09:11', '2019-09-13 13:09:11'),
(21, 30, '321', 'checkbox', NULL, '2019-09-13 13:09:11', '2019-09-13 13:09:11');

-- --------------------------------------------------------

--
-- Структура таблицы `game_tag`
--

CREATE TABLE `game_tag` (
  `id` int(10) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL,
  `game_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `game_tag`
--

INSERT INTO `game_tag` (`id`, `tag_id`, `game_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(9, 1, 4, '2017-09-20 06:08:21', '2017-09-20 06:08:21', NULL),
(10, 2, 4, '2017-09-20 06:08:21', '2017-09-20 06:08:21', NULL),
(11, 3, 4, '2017-09-20 06:08:21', '2017-09-20 06:08:21', NULL),
(12, 4, 4, '2017-09-20 06:08:21', '2017-09-20 06:08:21', NULL),
(15, 3, 6, '2017-09-20 06:21:33', '2017-09-20 06:21:33', NULL),
(23, 2, 7, '2017-09-20 06:41:23', '2017-09-20 06:41:23', NULL),
(29, 3, 8, '2017-09-20 07:34:55', '2017-09-20 07:34:55', NULL),
(37, 3, 3, '2017-09-20 07:35:12', '2017-09-20 07:35:12', NULL),
(38, 2, 9, '2017-09-20 08:11:37', '2017-09-20 08:11:37', NULL),
(39, 4, 9, '2017-09-20 08:11:37', '2017-09-20 08:11:37', NULL),
(40, 3, 10, '2017-09-20 08:12:09', '2017-09-20 08:12:09', NULL),
(41, 4, 10, '2017-09-20 08:12:09', '2017-09-20 08:12:09', NULL),
(86, 2, 11, '2017-09-20 09:05:06', '2017-09-20 09:05:06', NULL),
(87, 3, 11, '2017-09-20 09:05:06', '2017-09-20 09:05:06', NULL),
(102, 2, 5, '2017-09-21 02:00:40', '2017-09-21 02:00:40', NULL),
(103, 4, 5, '2017-09-21 02:00:40', '2017-09-21 02:00:40', NULL),
(152, 1, 2, '2017-09-26 06:57:03', '2017-09-26 06:57:03', NULL),
(153, 2, 2, '2017-09-26 06:57:03', '2017-09-26 06:57:03', NULL),
(154, 3, 2, '2017-09-26 06:57:03', '2017-09-26 06:57:03', NULL),
(170, 1, 14, '2018-03-07 23:10:10', '2018-03-07 23:10:10', NULL),
(171, 2, 14, '2018-03-07 23:10:10', '2018-03-07 23:10:10', NULL),
(172, 3, 14, '2018-03-07 23:10:10', '2018-03-07 23:10:10', NULL),
(175, 1, 15, '2018-03-12 14:17:44', '2018-03-12 14:17:44', NULL),
(176, 2, 15, '2018-03-12 14:17:44', '2018-03-12 14:17:44', NULL),
(180, 1, 18, '2018-03-12 15:51:13', '2018-03-12 15:51:13', NULL),
(181, 2, 18, '2018-03-12 15:51:13', '2018-03-12 15:51:13', NULL),
(182, 3, 18, '2018-03-12 15:51:13', '2018-03-12 15:51:13', NULL),
(183, 1, 19, '2018-03-24 20:44:33', '2018-03-24 20:44:33', NULL),
(184, 1, 20, '2018-03-28 10:38:40', '2018-03-28 10:38:40', NULL),
(185, 2, 20, '2018-03-28 10:38:40', '2018-03-28 10:38:40', NULL),
(186, 3, 20, '2018-03-28 10:38:40', '2018-03-28 10:38:40', NULL),
(205, 1, 22, '2018-05-24 12:53:44', '2018-05-24 12:53:44', NULL),
(206, 3, 22, '2018-05-24 12:53:44', '2018-05-24 12:53:44', NULL),
(207, 1, 21, '2018-05-24 12:53:58', '2018-05-24 12:53:58', NULL),
(208, 3, 21, '2018-05-24 12:53:58', '2018-05-24 12:53:58', NULL),
(251, 1, 24, '2018-06-11 15:56:32', '2018-06-11 15:56:32', NULL),
(252, 2, 24, '2018-06-11 15:56:32', '2018-06-11 15:56:32', NULL),
(253, 3, 24, '2018-06-11 15:56:32', '2018-06-11 15:56:32', NULL),
(254, 1, 23, '2018-06-11 16:05:18', '2018-06-11 16:05:18', NULL),
(255, 2, 23, '2018-06-11 16:05:18', '2018-06-11 16:05:18', NULL),
(256, 3, 23, '2018-06-11 16:05:18', '2018-06-11 16:05:18', NULL),
(257, 1, 25, '2018-06-11 16:12:46', '2018-06-11 16:12:46', NULL),
(258, 2, 25, '2018-06-11 16:12:46', '2018-06-11 16:12:46', NULL),
(259, 3, 25, '2018-06-11 16:12:46', '2018-06-11 16:12:46', NULL),
(260, 2, 13, '2018-06-19 15:58:12', '2018-06-19 15:58:12', NULL),
(261, 3, 13, '2018-06-19 15:58:12', '2018-06-19 15:58:12', NULL),
(271, 1, 1, '2018-06-21 15:34:05', '2018-06-21 15:34:05', NULL),
(272, 2, 1, '2018-06-21 15:34:05', '2018-06-21 15:34:05', NULL),
(273, 3, 1, '2018-06-21 15:34:05', '2018-06-21 15:34:05', NULL),
(280, 1, 26, '2018-06-25 18:20:05', '2018-06-25 18:20:05', NULL),
(281, 2, 26, '2018-06-25 18:20:05', '2018-06-25 18:20:05', NULL),
(282, 3, 26, '2018-06-25 18:20:05', '2018-06-25 18:20:05', NULL),
(299, 1, 27, '2018-07-09 19:57:57', '2018-07-09 19:57:57', NULL),
(300, 2, 27, '2018-07-09 19:57:57', '2018-07-09 19:57:57', NULL),
(301, 3, 27, '2018-07-09 19:57:57', '2018-07-09 19:57:57', NULL),
(307, 1, 28, NULL, NULL, NULL),
(308, 2, 28, NULL, NULL, NULL),
(309, 3, 28, NULL, NULL, NULL),
(310, 1, 29, NULL, NULL, NULL),
(311, 2, 29, NULL, NULL, NULL),
(312, 3, 29, NULL, NULL, NULL),
(313, 7, 29, NULL, NULL, NULL),
(314, 8, 29, NULL, NULL, NULL),
(315, 1, 30, NULL, NULL, NULL),
(316, 2, 30, NULL, NULL, NULL),
(317, 3, 30, NULL, NULL, NULL),
(318, 7, 30, NULL, NULL, NULL),
(319, 8, 30, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `invoices`
--

CREATE TABLE `invoices` (
  `id` int(10) UNSIGNED NOT NULL,
  `invoice_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(20,3) NOT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `trade_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `payment_detail` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'in',
  `payout_purse` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `payment_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `invoices`
--

INSERT INTO `invoices` (`id`, `invoice_id`, `price`, `currency_id`, `trade_id`, `user_id`, `status`, `payment_detail`, `type`, `payout_purse`, `payment_date`, `payment_type`, `created_at`, `updated_at`) VALUES
(1, '1141738', 129.032, 5, 1, 1, 0, NULL, 'in', NULL, NULL, 'phone', '2019-08-23 12:17:38', '2019-08-23 12:17:38'),
(2, '2162646', 100.000, 1, 2, 1, 1, NULL, 'in', NULL, '2019-09-04 16:26:46', 'balance', '2019-09-04 14:26:46', '2019-09-04 14:26:46'),
(3, '3162706', 123.000, 1, 3, 1, 1, NULL, 'in', NULL, '2019-09-04 16:27:06', 'balance', '2019-09-04 14:27:06', '2019-09-04 14:27:06'),
(4, '4162714', 123.000, 1, 4, 1, 1, NULL, 'in', NULL, '2019-09-04 16:27:14', 'balance', '2019-09-04 14:27:14', '2019-09-04 14:27:14'),
(5, '5162806', 100.000, 1, 5, 11, 1, NULL, 'in', NULL, '2019-09-04 16:28:06', 'balance', '2019-09-04 14:28:06', '2019-09-04 14:28:06'),
(6, '6162811', 100.000, 1, 6, 11, 1, NULL, 'in', NULL, '2019-09-04 16:28:11', 'balance', '2019-09-04 14:28:11', '2019-09-04 14:28:11'),
(7, '7162814', 100.000, 1, 7, 11, 1, NULL, 'in', NULL, '2019-09-04 16:28:14', 'balance', '2019-09-04 14:28:14', '2019-09-04 14:28:14'),
(8, '8182539', 10000.000, 1, 8, 16, 1, NULL, 'in', NULL, '2019-09-04 18:25:39', 'balance', '2019-09-04 16:25:39', '2019-09-04 16:25:39'),
(9, '9182713', 1000.000, 1, 9, 16, 1, NULL, 'in', NULL, '2019-09-04 18:27:13', 'balance', '2019-09-04 16:27:13', '2019-09-04 16:27:13'),
(10, '10191428', 120.000, 1, 10, 16, 1, NULL, 'in', NULL, '2019-09-04 19:14:28', 'balance', '2019-09-04 17:14:28', '2019-09-04 17:14:28'),
(11, '11194202', 321.000, 1, 11, 16, 1, NULL, 'in', NULL, '2019-09-04 19:42:02', 'balance', '2019-09-04 17:42:02', '2019-09-04 17:42:02'),
(12, '12121003', 1234.000, 1, 12, 11, 1, NULL, 'in', NULL, '2019-09-05 12:10:04', 'balance', '2019-09-05 10:10:04', '2019-09-05 10:10:04'),
(13, '13112127', 123.000, 1, 13, 11, 1, NULL, 'in', NULL, '2019-09-06 11:21:28', 'balance', '2019-09-06 09:21:28', '2019-09-06 09:21:28'),
(14, '14112204', 123.000, 1, 14, 11, 1, NULL, 'in', NULL, '2019-09-06 11:22:04', 'balance', '2019-09-06 09:22:04', '2019-09-06 09:22:04'),
(15, '15112232', 1230.000, 1, 15, 11, 1, NULL, 'in', NULL, '2019-09-06 11:22:32', 'balance', '2019-09-06 09:22:32', '2019-09-06 09:22:32'),
(16, '16143920', 2000.000, 1, 16, 12, 1, NULL, 'in', NULL, '2019-09-06 14:39:20', 'balance', '2019-09-06 12:39:20', '2019-09-06 12:39:20'),
(17, '17144033', 120.000, 1, 17, 12, 1, NULL, 'in', NULL, '2019-09-06 14:40:34', 'balance', '2019-09-06 12:40:34', '2019-09-06 12:40:34'),
(18, '18151926', 10.000, 1, 18, 12, 1, NULL, 'in', NULL, '2019-09-06 15:19:27', 'balance', '2019-09-06 13:19:27', '2019-09-06 13:19:27'),
(19, '19153731', 10.000, 1, 19, 12, 1, NULL, 'in', NULL, '2019-09-06 15:37:31', 'balance', '2019-09-06 13:37:31', '2019-09-06 13:37:31'),
(20, '20164115', 100.000, 1, 20, 12, 1, NULL, 'in', NULL, '2019-09-06 16:41:16', 'balance', '2019-09-06 14:41:15', '2019-09-06 14:41:16'),
(21, '21123438', 112.000, 1, 21, 1, 1, NULL, 'in', NULL, '2019-09-12 12:34:38', 'balance', '2019-09-12 10:34:38', '2019-09-12 10:34:38'),
(22, '22125849', 122.000, 1, 22, 1, 1, NULL, 'in', NULL, '2019-09-12 12:58:50', 'balance', '2019-09-12 10:58:49', '2019-09-12 10:58:50'),
(23, '23130009', 122.000, 1, 23, 1, 1, NULL, 'in', NULL, '2019-09-12 13:00:10', 'balance', '2019-09-12 11:00:09', '2019-09-12 11:00:10'),
(24, '24130027', 122.000, 1, 24, 1, 1, NULL, 'in', NULL, '2019-09-12 13:00:27', 'balance', '2019-09-12 11:00:27', '2019-09-12 11:00:27'),
(25, '25130228', 111.000, 1, 25, 1, 1, NULL, 'in', NULL, '2019-09-12 13:02:28', 'balance', '2019-09-12 11:02:28', '2019-09-12 11:02:28');

-- --------------------------------------------------------

--
-- Структура таблицы `langs`
--

CREATE TABLE `langs` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `default` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `langs`
--

INSERT INTO `langs` (`id`, `name`, `code`, `default`, `created_at`, `updated_at`) VALUES
(1, 'English', 'Gb', 1, '2019-08-13 14:29:57', '2019-09-11 10:14:46'),
(2, 'Русский', 'Ru', 0, '2019-08-13 16:12:06', '2019-08-19 13:28:20');

-- --------------------------------------------------------

--
-- Структура таблицы `lang_index_names`
--

CREATE TABLE `lang_index_names` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `lang_index_names`
--

INSERT INTO `lang_index_names` (`id`, `name`, `created_at`, `updated_at`) VALUES
(5, 'index', '2019-08-15 17:33:19', '2019-08-16 16:19:25'),
(6, 'head_menu', '2019-08-15 17:51:30', '2019-08-15 17:51:30'),
(7, 'currency', '2019-08-16 08:49:42', '2019-08-16 08:49:42'),
(8, 'tags', '2019-08-16 08:49:49', '2019-08-16 08:49:49'),
(9, 'sales', '2019-08-16 08:50:21', '2019-08-16 08:50:21'),
(10, 'profile', '2019-08-16 09:10:12', '2019-08-16 09:10:12'),
(11, 'my_lots', '2019-08-16 09:17:20', '2019-08-16 09:17:20'),
(12, 'balance', '2019-08-16 09:24:51', '2019-08-16 09:24:51'),
(13, 'cabinet_profile', '2019-08-16 09:46:07', '2019-08-16 09:46:07'),
(14, 'feedback', '2019-08-16 09:46:13', '2019-08-16 09:46:13'),
(15, 'personal_data', '2019-08-16 09:49:59', '2019-08-16 09:49:59'),
(16, 'modal', '2019-08-16 10:13:01', '2019-08-16 10:13:01'),
(17, 'form_message', '2019-08-16 10:31:32', '2019-08-16 10:31:32'),
(21, 'vue_game', '2019-08-20 09:03:31', '2019-08-20 09:03:31'),
(22, 'footer', '2019-09-11 12:03:06', '2019-09-11 12:03:06'),
(23, 'chat', '2019-09-12 10:37:49', '2019-09-12 10:37:49'),
(24, 'game', '2019-09-13 13:25:18', '2019-09-13 13:25:18'),
(25, 'purchases', '2019-09-13 15:03:39', '2019-09-13 15:03:39'),
(26, 'vue_chat', '2019-09-17 11:46:37', '2019-09-17 11:46:37');

-- --------------------------------------------------------

--
-- Структура таблицы `lang_index_structures`
--

CREATE TABLE `lang_index_structures` (
  `id` int(10) UNSIGNED NOT NULL,
  `index_name_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `lang_index_structures`
--

INSERT INTO `lang_index_structures` (`id`, `index_name_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'safe_deal', '2019-08-15 16:27:25', '2019-08-15 16:27:25'),
(2, 1, 'work_24_7', '2019-08-15 16:29:44', '2019-08-15 16:29:44'),
(3, 5, 'last_sales', '2019-08-15 17:37:28', '2019-08-15 17:37:28'),
(4, 5, 'safe_deal', '2019-08-15 17:37:34', '2019-08-15 17:37:34'),
(5, 5, 'work_24_7', '2019-08-15 17:37:44', '2019-08-15 17:37:44'),
(6, 5, 'fast_service', '2019-08-15 17:37:50', '2019-08-15 17:37:50'),
(7, 5, 'money_back_guarantee', '2019-08-15 17:38:11', '2019-08-15 17:38:11'),
(8, 5, 'find_game', '2019-08-15 17:38:47', '2019-08-15 17:38:47'),
(9, 5, 'find', '2019-08-15 17:38:53', '2019-08-15 17:38:53'),
(10, 5, 'intro_1', '2019-08-15 17:39:15', '2019-08-15 17:39:15'),
(11, 5, 'intro_2', '2019-08-15 17:39:21', '2019-08-15 17:39:21'),
(12, 6, 'my_sales', '2019-08-15 17:51:41', '2019-08-15 17:51:41'),
(13, 6, 'my_purchases', '2019-08-15 17:51:52', '2019-08-15 17:51:52'),
(14, 6, 'messages', '2019-08-15 17:52:00', '2019-08-15 17:52:00'),
(15, 6, 'my_lots', '2019-08-15 17:52:06', '2019-08-15 17:52:06'),
(16, 6, 'balance', '2019-08-15 17:52:14', '2019-08-15 17:52:14'),
(17, 6, 'rules_for_sellers', '2019-08-15 17:52:30', '2019-08-15 17:52:30'),
(18, 6, 'questions_and_answers', '2019-08-15 17:52:41', '2019-08-15 17:52:41'),
(19, 6, 'dispute_resolution', '2019-08-15 17:52:49', '2019-08-15 17:52:49'),
(20, 6, 'profile', '2019-08-15 17:53:06', '2019-08-15 17:53:06'),
(21, 6, 'exit', '2019-08-15 17:53:11', '2019-08-15 17:53:11'),
(22, 9, 'back_money_to_saler', '2019-08-16 08:53:52', '2019-08-16 08:53:52'),
(23, 9, 'number', '2019-08-16 08:54:39', '2019-08-16 08:54:39'),
(24, 9, 'customer', '2019-08-16 08:54:48', '2019-08-16 08:54:48'),
(25, 9, 'game', '2019-08-16 08:54:55', '2019-08-16 08:54:55'),
(26, 9, 'status', '2019-08-16 08:55:00', '2019-08-16 08:55:00'),
(27, 9, 'show', '2019-08-16 08:55:07', '2019-08-16 08:55:07'),
(28, 9, 'closed', '2019-08-16 08:55:23', '2019-08-16 08:55:23'),
(29, 9, 'opened', '2019-08-16 08:55:29', '2019-08-16 08:55:29'),
(30, 9, 'return', '2019-08-16 08:55:34', '2019-08-16 08:55:34'),
(31, 9, 'choose', '2019-08-16 09:01:18', '2019-08-16 09:01:18'),
(32, 9, 'order', '2019-08-16 09:01:24', '2019-08-16 09:01:24'),
(33, 9, 'description', '2019-08-16 09:01:32', '2019-08-16 09:01:32'),
(34, 9, 'summ', '2019-08-16 09:01:38', '2019-08-16 09:01:38'),
(35, 9, 'actions', '2019-08-16 09:01:45', '2019-08-16 09:01:45'),
(36, 9, 'seller', '2019-08-16 09:05:06', '2019-08-16 09:05:06'),
(37, 10, 'my_lots', '2019-08-16 09:15:06', '2019-08-16 09:15:06'),
(38, 10, 'balance', '2019-08-16 09:15:11', '2019-08-16 09:15:11'),
(39, 10, 'profile', '2019-08-16 09:15:18', '2019-08-16 09:15:18'),
(40, 10, 'personal_data', '2019-08-16 09:15:27', '2019-08-16 09:15:27'),
(41, 11, 'game', '2019-08-16 09:17:46', '2019-08-16 09:17:46'),
(42, 11, 'server', '2019-08-16 09:17:53', '2019-08-16 09:17:53'),
(43, 11, 'section', '2019-08-16 09:17:59', '2019-08-16 09:17:59'),
(44, 11, 'status', '2019-08-16 09:18:04', '2019-08-16 09:18:04'),
(45, 11, 'lot', '2019-08-16 09:18:10', '2019-08-16 09:18:10'),
(46, 11, 'gsp', '2019-08-16 09:18:16', '2019-08-16 09:18:16'),
(47, 11, 'price', '2019-08-16 09:18:30', '2019-08-16 09:18:30'),
(48, 11, 'amount', '2019-08-16 09:18:37', '2019-08-16 09:18:37'),
(49, 11, 'choose', '2019-08-16 09:22:13', '2019-08-16 09:22:13'),
(50, 11, 'currency', '2019-08-16 09:22:21', '2019-08-16 09:22:21'),
(51, 11, 'active', '2019-08-16 09:22:34', '2019-08-16 09:22:34'),
(52, 11, 'not_active', '2019-08-16 09:22:42', '2019-08-16 09:22:42'),
(53, 12, 'wallets', '2019-08-16 09:28:37', '2019-08-16 09:28:37'),
(54, 12, 'delete', '2019-08-16 09:29:00', '2019-08-16 09:29:00'),
(55, 12, 'add', '2019-08-16 09:29:04', '2019-08-16 09:29:04'),
(56, 12, 'balance', '2019-08-16 09:29:10', '2019-08-16 09:29:10'),
(57, 12, 'bring_out', '2019-08-16 09:29:23', '2019-08-16 09:29:23'),
(58, 12, 'date', '2019-08-16 09:30:33', '2019-08-16 09:30:33'),
(59, 12, 'description', '2019-08-16 09:30:41', '2019-08-16 09:30:41'),
(60, 12, 'currency', '2019-08-16 09:30:52', '2019-08-16 09:30:52'),
(61, 12, 'summ', '2019-08-16 09:31:13', '2019-08-16 09:31:13'),
(62, 12, 'status', '2019-08-16 09:31:19', '2019-08-16 09:31:19'),
(63, 12, 'save', '2019-08-16 09:36:18', '2019-08-16 09:36:18'),
(64, 12, 'operations', '2019-08-16 09:44:33', '2019-08-16 09:44:33'),
(65, 14, 'no_reviews', '2019-08-16 09:46:25', '2019-08-16 09:46:25'),
(66, 13, 'online', '2019-08-16 09:47:10', '2019-08-16 09:47:10'),
(67, 13, 'offline', '2019-08-16 09:47:17', '2019-08-16 09:47:17'),
(68, 13, 'registered', '2019-08-16 09:47:29', '2019-08-16 09:47:29'),
(69, 13, 'rating', '2019-08-16 09:47:34', '2019-08-16 09:47:34'),
(70, 13, 'reviews', '2019-08-16 09:47:44', '2019-08-16 09:47:44'),
(71, 15, 'change_avatar', '2019-08-16 09:50:14', '2019-08-16 09:50:14'),
(72, 15, 'msisdn', '2019-08-16 09:50:21', '2019-08-16 09:50:21'),
(73, 15, 'mail', '2019-08-16 09:50:30', '2019-08-16 09:50:30'),
(74, 15, 'password', '2019-08-16 09:50:53', '2019-08-16 09:50:53'),
(75, 15, 'save', '2019-08-16 09:51:00', '2019-08-16 09:51:00'),
(76, 15, 'edit', '2019-08-16 09:51:10', '2019-08-16 09:51:10'),
(77, 15, 'remind_password', '2019-08-16 09:51:19', '2019-08-16 09:51:19'),
(79, 16, 'add_msisdn', '2019-08-16 10:13:16', '2019-08-16 10:13:16'),
(80, 16, 'password', '2019-08-16 10:13:22', '2019-08-16 10:13:22'),
(81, 16, 'msisdn', '2019-08-16 10:13:28', '2019-08-16 10:13:28'),
(82, 16, 'msisdn_placeholder', '2019-08-16 10:13:40', '2019-08-16 10:13:40'),
(83, 16, 'send_sms', '2019-08-16 10:13:47', '2019-08-16 10:13:47'),
(84, 16, 'sms_code', '2019-08-16 10:13:53', '2019-08-16 10:13:53'),
(85, 16, 'save', '2019-08-16 10:13:59', '2019-08-16 10:13:59'),
(86, 16, 'change_mail', '2019-08-16 10:23:20', '2019-08-16 10:23:20'),
(87, 16, 'mail', '2019-08-16 10:25:01', '2019-08-16 10:25:01'),
(88, 16, 'change_password', '2019-08-16 10:27:34', '2019-08-16 10:27:34'),
(89, 16, 'old_password', '2019-08-16 10:27:41', '2019-08-16 10:27:41'),
(90, 16, 'new_password', '2019-08-16 10:27:48', '2019-08-16 10:27:48'),
(91, 16, 'confirm_password', '2019-08-16 10:28:01', '2019-08-16 10:28:01'),
(101, 17, 'you_dh__access_to_send_review', '2019-08-16 10:44:52', '2019-08-16 10:44:52'),
(102, 17, 'avatar_updated', '2019-08-16 10:45:53', '2019-08-16 10:45:53'),
(103, 17, 'check_your_data', '2019-08-16 10:46:36', '2019-08-16 10:46:36'),
(104, 17, 'msisdn_is_added', '2019-08-16 10:47:31', '2019-08-16 10:47:31'),
(106, 17, 'add_and_confirm_msisdn', '2019-08-16 10:49:45', '2019-08-16 10:49:45'),
(107, 17, 'link', '2019-08-16 10:51:12', '2019-08-16 10:51:12'),
(108, 17, 'wrong_sms', '2019-08-16 10:51:54', '2019-08-16 10:51:54'),
(109, 17, 'add_mail_in_settings', '2019-08-16 10:52:41', '2019-08-16 10:52:41'),
(110, 17, 'confirm_mail_in_settings', '2019-08-16 10:53:51', '2019-08-16 10:53:51'),
(111, 17, 'sms_sended_1', '2019-08-16 10:54:41', '2019-08-16 10:54:41'),
(112, 17, 'sms_sended_2', '2019-08-16 10:56:52', '2019-08-16 10:56:52'),
(113, 17, 'minutes', '2019-08-16 10:58:20', '2019-08-16 10:58:20'),
(114, 17, 'seconds', '2019-08-16 10:59:27', '2019-08-16 10:59:27'),
(115, 17, 'days', '2019-08-16 10:59:51', '2019-08-16 10:59:51'),
(116, 17, 'hours', '2019-08-16 11:00:28', '2019-08-16 11:00:28'),
(117, 17, 'check_your_input_data', '2019-08-16 11:05:10', '2019-08-16 11:05:10'),
(118, 17, 'confirming_mail', '2019-08-16 11:06:01', '2019-08-16 11:06:01'),
(119, 17, 'mail_updated_and_we_send_letter_1', '2019-08-16 11:07:21', '2019-08-16 11:07:21'),
(120, 17, 'mail_updated_and_we_send_letter_2', '2019-08-16 11:08:11', '2019-08-16 11:08:11'),
(121, 17, 'mail_was_confirmed', '2019-08-16 11:09:09', '2019-08-16 11:09:09'),
(122, 17, 'send_to_mail_confirm_letter_1', '2019-08-16 11:10:15', '2019-08-16 11:10:15'),
(123, 17, 'send_to_mail_confirm_letter_2', '2019-08-16 11:11:13', '2019-08-16 11:11:13'),
(124, 17, 'password_updated', '2019-08-16 11:13:35', '2019-08-16 11:13:35'),
(125, 17, 'check_your_old_password', '2019-08-16 11:14:18', '2019-08-16 11:14:18'),
(126, 17, 'rules_accepted', '2019-08-16 11:16:23', '2019-08-16 11:16:23'),
(127, 17, 'password_sended_to_mail', '2019-08-16 11:29:56', '2019-08-16 11:29:56'),
(128, 17, 'nonono', '2019-08-16 11:30:38', '2019-08-16 11:30:38'),
(129, 8, 'Accounts', '2019-08-16 11:37:04', '2019-08-16 11:37:04'),
(130, 8, 'Crystals', '2019-08-16 11:37:10', '2019-08-16 11:37:10'),
(131, 8, 'Items', '2019-08-16 11:37:18', '2019-08-16 11:37:18'),
(132, 8, 'Services', '2019-08-16 11:37:26', '2019-08-16 11:37:26'),
(133, 8, 'Silver', '2019-08-16 11:37:36', '2019-08-16 11:37:36'),
(134, 7, 'Adena', '2019-08-16 11:39:23', '2019-08-16 11:39:23'),
(135, 7, 'Alz', '2019-08-16 11:39:28', '2019-08-16 11:39:28'),
(136, 7, 'Balance Replenishment', '2019-08-16 11:39:55', '2019-08-16 11:39:55'),
(137, 7, 'Coins', '2019-08-16 11:40:09', '2019-08-16 11:40:09'),
(138, 7, 'Credit', '2019-08-16 11:40:17', '2019-08-16 11:40:17'),
(139, 7, 'Crystals', '2019-08-16 11:40:23', '2019-08-16 11:40:23'),
(140, 7, 'Currency', '2019-08-16 11:40:33', '2019-08-16 11:40:33'),
(141, 7, 'Diamonds', '2019-08-16 11:40:47', '2019-08-16 11:40:47'),
(142, 7, 'EUN', '2019-08-16 11:40:53', '2019-08-16 11:40:53'),
(143, 7, 'Flux', '2019-08-16 11:41:00', '2019-08-16 11:41:00'),
(144, 7, 'GB', '2019-08-16 11:41:06', '2019-08-16 11:41:06'),
(145, 7, 'Gold', '2019-08-16 11:41:12', '2019-08-16 11:41:12'),
(146, 7, 'ISK', '2019-08-16 11:41:18', '2019-08-16 11:41:18'),
(147, 7, 'Kinah', '2019-08-16 11:41:30', '2019-08-16 11:41:30'),
(148, 7, 'Liang', '2019-08-16 11:41:37', '2019-08-16 11:41:37'),
(149, 7, 'Platinum', '2019-08-16 11:41:46', '2019-08-16 11:41:46'),
(150, 7, 'Ruble', '2019-08-16 11:41:53', '2019-08-16 11:41:53'),
(151, 7, 'Rupee', '2019-08-16 11:42:02', '2019-08-16 11:42:02'),
(152, 7, 'Spheres Of Exaltation', '2019-08-16 11:42:16', '2019-08-16 11:42:16'),
(153, 7, 'Wirth', '2019-08-16 11:42:24', '2019-08-16 11:42:24'),
(154, 7, 'Yuan', '2019-08-16 11:42:31', '2019-08-16 11:42:31'),
(155, 7, 'Zany', '2019-08-16 11:42:37', '2019-08-16 11:42:37'),
(158, 15, 'confirm', '2019-08-19 10:47:30', '2019-08-19 10:47:30'),
(160, 16, 'confirm_mail', '2019-08-19 13:12:57', '2019-08-19 13:12:57'),
(161, 16, 'choose_output_method', '2019-08-19 13:15:37', '2019-08-19 13:15:37'),
(162, 5, 'saled', '2019-08-19 13:21:13', '2019-08-19 13:21:13'),
(163, 5, 'currency', '2019-08-19 13:22:33', '2019-08-19 13:22:33'),
(164, 5, 'we_money_back', '2019-08-19 13:23:36', '2019-08-19 13:23:36'),
(165, 5, 'we_fast_service', '2019-08-19 13:25:23', '2019-08-19 13:25:23'),
(166, 5, 'we_safe_deal', '2019-08-19 13:25:52', '2019-08-19 13:25:52'),
(167, 5, 'we_work_24_7', '2019-08-19 13:26:05', '2019-08-19 13:26:05'),
(168, 5, 'featured_games', '2019-08-19 13:28:06', '2019-08-19 13:28:06'),
(169, 21, 'Adena', '2019-08-20 09:04:01', '2019-08-20 09:04:01'),
(170, 21, 'Accounts', '2019-08-20 09:04:13', '2019-08-20 09:04:13'),
(171, 21, 'Items', '2019-08-20 09:04:20', '2019-08-20 09:04:20'),
(172, 21, 'Services', '2019-08-20 09:04:27', '2019-08-20 09:04:27'),
(173, 21, 'nickname', '2019-08-20 09:04:47', '2019-08-20 09:04:47'),
(174, 21, 'sale_game_money', '2019-09-04 10:46:15', '2019-09-04 10:46:15'),
(175, 21, 'server', '2019-09-04 10:47:08', '2019-09-04 10:47:08'),
(176, 21, 'choose', '2019-09-04 10:47:53', '2019-09-04 10:47:53'),
(177, 21, 'sort', '2019-09-04 10:49:45', '2019-09-04 10:49:45'),
(178, 21, 'price_up', '2019-09-04 12:22:14', '2019-09-04 12:22:14'),
(179, 21, 'price_down', '2019-09-04 12:22:37', '2019-09-04 12:22:37'),
(180, 21, 'alph_a_z', '2019-09-04 12:22:51', '2019-09-04 12:22:51'),
(181, 21, 'alph_z_a', '2019-09-04 12:23:13', '2019-09-04 12:23:13'),
(182, 21, 'earlier', '2019-09-04 12:24:23', '2019-09-04 12:24:23'),
(183, 21, 'later', '2019-09-04 12:25:57', '2019-09-04 12:25:57'),
(184, 21, 'earlier_p_up', '2019-09-04 12:27:40', '2019-09-04 12:27:40'),
(185, 21, 'earlier_p_down', '2019-09-04 12:28:04', '2019-09-04 12:28:04'),
(186, 21, 'earlier_a_z', '2019-09-04 12:28:21', '2019-09-04 12:28:21'),
(187, 21, 'earlier_z_a', '2019-09-04 12:28:42', '2019-09-04 12:28:42'),
(188, 21, 'later_p_up', '2019-09-04 13:04:28', '2019-09-04 13:04:28'),
(189, 21, 'later_p_down', '2019-09-04 13:04:39', '2019-09-04 13:04:39'),
(190, 21, 'later_a_z', '2019-09-04 13:04:49', '2019-09-04 13:04:49'),
(191, 21, 'later_z_a', '2019-09-04 13:04:59', '2019-09-04 13:04:59'),
(192, 21, 'salers', '2019-09-04 13:21:34', '2019-09-04 13:21:34'),
(193, 21, 'saler', '2019-09-04 13:26:38', '2019-09-04 13:26:38'),
(194, 21, 'availability', '2019-09-04 13:27:20', '2019-09-04 13:27:20'),
(195, 21, 'rating', '2019-09-04 13:27:41', '2019-09-04 13:27:41'),
(196, 21, 'price_by_1', '2019-09-04 13:27:59', '2019-09-04 13:27:59'),
(197, 21, 'checkout', '2019-09-04 14:34:12', '2019-09-04 14:34:12'),
(198, 21, 'payment_method', '2019-09-04 14:34:57', '2019-09-04 14:34:57'),
(199, 21, 'hero_name', '2019-09-04 14:35:53', '2019-09-04 14:35:53'),
(200, 21, 'will_pay', '2019-09-04 14:36:48', '2019-09-04 14:36:48'),
(201, 21, 'will_receive', '2019-09-04 14:37:48', '2019-09-04 14:37:48'),
(202, 21, 'buy', '2019-09-04 14:38:29', '2019-09-04 14:38:29'),
(203, 21, 'chat_with_seller', '2019-09-04 14:47:56', '2019-09-04 14:47:56'),
(204, 21, 'seller_reviews', '2019-09-04 14:49:06', '2019-09-04 14:49:06'),
(205, 21, 'show_more', '2019-09-04 14:52:41', '2019-09-04 14:52:41'),
(206, 21, 'before_placing_an_order', '2019-09-04 14:53:44', '2019-09-04 14:53:44'),
(207, 21, 'send', '2019-09-04 14:55:00', '2019-09-04 14:55:00'),
(208, 21, 'validate_purchase', '2019-09-04 14:56:14', '2019-09-04 14:56:14'),
(209, 21, 'return_money', '2019-09-04 14:56:52', '2019-09-04 14:56:52'),
(210, 21, 'positive', '2019-09-04 14:58:13', '2019-09-04 14:58:13'),
(211, 21, 'negative', '2019-09-04 14:58:22', '2019-09-04 14:58:22'),
(212, 21, 'add_offer', '2019-09-06 16:16:27', '2019-09-06 16:16:27'),
(213, 22, 'how_it_works', '2019-09-11 12:04:03', '2019-09-11 12:04:03'),
(214, 22, 'dispute_resolution', '2019-09-11 12:04:53', '2019-09-11 12:04:53'),
(215, 22, 'terms_of_use', '2019-09-11 12:09:50', '2019-09-11 12:09:50'),
(216, 22, 'contact_with_us', '2019-09-11 12:15:03', '2019-09-11 12:15:03'),
(217, 21, 'sale', '2019-09-11 12:23:48', '2019-09-11 12:23:48'),
(218, 21, 'description', '2019-09-11 12:26:42', '2019-09-11 12:26:42'),
(219, 21, 'price', '2019-09-11 12:27:32', '2019-09-11 12:27:32'),
(220, 21, 'Профессия', '2019-09-11 12:30:33', '2019-09-11 12:30:33'),
(221, 21, 'Уровень', '2019-09-11 12:30:45', '2019-09-11 12:30:45'),
(222, 21, 'game', '2019-09-11 12:38:25', '2019-09-11 12:38:25'),
(224, 21, 'amount', '2019-09-11 12:42:45', '2019-09-11 12:42:45'),
(225, 21, 'enter_message', '2019-09-11 12:47:13', '2019-09-11 12:47:13'),
(226, 21, 'Отправить на аукцион', '2019-09-11 12:52:03', '2019-09-11 12:52:03'),
(227, 21, 'Отправить на почту', '2019-09-11 12:52:14', '2019-09-11 12:52:14'),
(228, 21, 'Передать в руки', '2019-09-11 12:52:28', '2019-09-11 12:52:28'),
(229, 21, 'category', '2019-09-11 12:58:19', '2019-09-11 12:58:19'),
(230, 21, 'Драйвер', '2019-09-11 13:12:29', '2019-09-11 13:12:29'),
(231, 21, 'Прокачка', '2019-09-11 13:13:34', '2019-09-11 13:13:34'),
(232, 21, 'Другое', '2019-09-11 13:14:29', '2019-09-11 13:14:29'),
(283, 21, 'reviews', '2019-09-12 09:38:12', '2019-09-12 09:38:12'),
(284, 21, 'alert_choose_whom', '2019-09-12 09:43:39', '2019-09-12 09:43:39'),
(285, 21, 'alert_limit_message', '2019-09-12 09:46:25', '2019-09-12 09:46:25'),
(286, 21, 'alert_symbols', '2019-09-12 09:47:13', '2019-09-12 09:47:13'),
(287, 21, 'alert_login_or_reg', '2019-09-12 09:48:18', '2019-09-12 09:48:18'),
(288, 21, 'alert_min_sum', '2019-09-12 09:50:12', '2019-09-12 09:50:12'),
(289, 21, 'alert_seller_low_count_product', '2019-09-12 09:52:19', '2019-09-12 09:52:19'),
(290, 21, 'alert_need_lot', '2019-09-12 09:53:17', '2019-09-12 09:53:17'),
(291, 21, 'alert_need_pay', '2019-09-12 09:53:58', '2019-09-12 09:53:58'),
(292, 23, 'error_buyed_products', '2019-09-12 10:39:01', '2019-09-12 10:39:01'),
(293, 23, 'min_wme_wmz', '2019-09-12 10:40:04', '2019-09-12 10:41:45'),
(294, 23, 'min_buy_sum', '2019-09-12 10:41:15', '2019-09-12 10:41:15'),
(295, 23, 'your_balance_blocked', '2019-09-12 10:42:21', '2019-09-12 10:42:21'),
(296, 23, 'your_cant_buy_himself', '2019-09-12 10:43:08', '2019-09-12 10:43:08'),
(297, 23, 'confirm_email', '2019-09-12 10:43:48', '2019-09-12 10:43:48'),
(298, 23, 'min_sum', '2019-09-12 10:44:41', '2019-09-12 10:44:41'),
(299, 23, 'rub', '2019-09-12 10:45:36', '2019-09-12 10:45:36'),
(300, 23, 'low_money_status', '2019-09-12 10:47:34', '2019-09-12 10:47:34'),
(301, 23, 'confirm_sell', '2019-09-12 10:49:01', '2019-09-12 10:49:01'),
(302, 23, 'count', '2019-09-12 10:49:48', '2019-09-12 10:49:48'),
(303, 23, 'seller', '2019-09-12 10:50:22', '2019-09-12 10:50:22'),
(304, 23, 'in_count', '2019-09-12 10:52:54', '2019-09-12 10:52:54'),
(305, 23, 'and_send_money', '2019-09-12 10:53:52', '2019-09-12 10:53:52'),
(306, 23, 'click', '2019-09-12 10:54:50', '2019-09-12 10:54:50'),
(307, 23, 'here', '2019-09-12 10:55:24', '2019-09-12 10:55:24'),
(308, 23, 'send_review', '2019-09-12 10:56:39', '2019-09-12 10:56:39'),
(309, 21, 'Купить минимум предметов', '2019-09-13 12:06:12', '2019-09-13 12:06:12'),
(310, 21, 'Купить максимум предметов', '2019-09-13 12:06:47', '2019-09-13 12:06:47'),
(311, 24, 'add_email_in_settings', '2019-09-13 13:25:59', '2019-09-13 13:25:59'),
(312, 24, 'confirm_email_in_settings', '2019-09-13 13:27:04', '2019-09-13 13:27:04'),
(313, 24, 'add_msisdn', '2019-09-13 13:28:09', '2019-09-13 13:28:09'),
(314, 24, 'link', '2019-09-13 13:28:51', '2019-09-13 13:28:51'),
(315, 24, 'access_rules', '2019-09-13 13:29:28', '2019-09-13 13:29:28'),
(316, 24, 'min_sum', '2019-09-13 13:35:22', '2019-09-13 13:35:22'),
(317, 24, 'by_game_currency', '2019-09-13 13:37:01', '2019-09-13 13:37:01'),
(318, 24, 'server', '2019-09-13 13:39:50', '2019-09-13 13:39:50'),
(319, 24, 'price_by', '2019-09-13 13:40:28', '2019-09-13 13:40:28'),
(320, 24, 'availability', '2019-09-13 13:41:04', '2019-09-13 13:41:04'),
(321, 24, 'select', '2019-09-13 13:42:23', '2019-09-13 13:42:23'),
(322, 24, 'save', '2019-09-13 13:43:50', '2019-09-13 13:43:50'),
(323, 21, 'hide_filter', '2019-09-13 13:53:09', '2019-09-13 13:53:09'),
(324, 21, 'show_filter', '2019-09-13 13:54:07', '2019-09-13 13:54:07'),
(325, 21, 'active', '2019-09-13 14:10:51', '2019-09-13 14:10:51'),
(326, 21, 'save', '2019-09-13 14:12:05', '2019-09-13 14:12:05'),
(329, 9, 'filter', '2019-09-13 14:25:44', '2019-09-13 14:25:44'),
(330, 9, 'waiting_for_payment', '2019-09-13 14:30:04', '2019-09-13 14:30:04'),
(331, 9, 'lot_deleted', '2019-09-13 14:31:44', '2019-09-13 14:31:44'),
(332, 9, 'Внутренный баланс', '2019-09-13 14:53:06', '2019-09-13 14:53:06'),
(333, 25, 'close_order', '2019-09-13 15:04:13', '2019-09-13 15:04:13'),
(334, 25, 'yes', '2019-09-13 15:05:06', '2019-09-13 15:05:06'),
(335, 25, 'no', '2019-09-13 15:05:14', '2019-09-13 15:05:14'),
(336, 25, 'confirm_order', '2019-09-13 15:07:21', '2019-09-13 15:07:21'),
(337, 25, 'back', '2019-09-13 15:08:01', '2019-09-13 15:08:01'),
(338, 25, 'close', '2019-09-13 15:08:11', '2019-09-13 15:08:11'),
(340, 25, 'lot_deleted', '2019-09-13 15:09:20', '2019-09-13 15:09:20'),
(341, 25, 'count', '2019-09-13 15:10:10', '2019-09-13 15:10:10'),
(342, 11, 'edit_offers', '2019-09-13 15:22:43', '2019-09-13 15:22:43'),
(343, 11, 'edit', '2019-09-13 15:23:24', '2019-09-13 15:23:24'),
(344, 11, 'count', '2019-09-13 15:29:24', '2019-09-13 15:29:24'),
(345, 6, 'search', '2019-09-16 23:25:32', '2019-09-16 23:25:32'),
(346, 6, 'login', '2019-09-16 23:27:12', '2019-09-16 23:27:12'),
(347, 6, 'register', '2019-09-16 23:27:46', '2019-09-16 23:27:46'),
(348, 5, 'price', '2019-09-17 00:16:38', '2019-09-17 00:16:38'),
(349, 5, 'sales', '2019-09-17 00:17:36', '2019-09-17 00:17:36'),
(350, 16, 'login', '2019-09-17 00:22:33', '2019-09-17 00:22:33'),
(351, 16, 'email', '2019-09-17 00:23:23', '2019-09-17 00:23:23'),
(352, 16, 'entry', '2019-09-17 00:25:02', '2019-09-17 00:25:02'),
(353, 16, 'or_log_in_through', '2019-09-17 00:25:53', '2019-09-17 00:25:53'),
(354, 16, 'register', '2019-09-17 00:27:53', '2019-09-17 00:27:53'),
(355, 16, 'name', '2019-09-17 00:28:29', '2019-09-17 00:28:29'),
(356, 16, 'picture_code', '2019-09-17 00:29:19', '2019-09-17 00:29:19'),
(357, 16, 'refresh', '2019-09-17 00:29:57', '2019-09-17 00:29:57'),
(358, 16, 'rules_confirm', '2019-09-17 00:31:01', '2019-09-17 00:31:01'),
(359, 16, 'rules_confirm_link', '2019-09-17 00:31:40', '2019-09-17 00:31:40'),
(360, 16, 'sign_up', '2019-09-17 00:32:29', '2019-09-17 00:32:29'),
(361, 16, 'sign_up_by', '2019-09-17 00:32:47', '2019-09-17 00:32:47'),
(362, 16, 'output_method', '2019-09-17 00:34:35', '2019-09-17 00:34:35'),
(363, 16, 'choose', '2019-09-17 00:35:11', '2019-09-17 00:35:11'),
(364, 16, 'wallet', '2019-09-17 00:35:44', '2019-09-17 00:35:44'),
(365, 16, 'sum', '2019-09-17 00:37:25', '2019-09-17 00:37:25'),
(366, 16, 'to_receive', '2019-09-17 00:38:17', '2019-09-17 00:38:17'),
(367, 16, 'withdraw', '2019-09-17 00:39:32', '2019-09-17 00:39:32'),
(368, 16, 'cancel', '2019-09-17 00:40:10', '2019-09-17 00:40:10'),
(369, 6, 'obgr', '2019-09-17 00:41:47', '2019-09-17 00:41:47'),
(370, 12, 'Внутренный баланс', '2019-09-17 01:09:19', '2019-09-17 01:09:19'),
(371, 12, 'active_deal', '2019-09-17 01:10:51', '2019-09-17 01:10:51'),
(372, 12, 'processed', '2019-09-17 01:11:38', '2019-09-17 01:11:38'),
(373, 12, 'closed_deal', '2019-09-17 01:11:50', '2019-09-17 01:11:50'),
(374, 12, 'in_processing', '2019-09-17 01:12:06', '2019-09-17 01:12:06'),
(375, 12, 'order', '2019-09-17 01:17:40', '2019-09-17 01:17:40'),
(376, 12, 'output', '2019-09-17 01:18:17', '2019-09-17 01:18:17'),
(377, 16, 'info_operation', '2019-09-17 10:16:08', '2019-09-17 10:16:08'),
(378, 16, 'operation_number', '2019-09-17 10:16:41', '2019-09-17 10:16:41'),
(379, 16, 'operation_data', '2019-09-17 10:17:18', '2019-09-17 10:17:18'),
(380, 16, 'description', '2019-09-17 10:17:47', '2019-09-17 10:17:47'),
(381, 16, 'output', '2019-09-17 10:18:19', '2019-09-17 10:18:19'),
(382, 16, 'withdrawal_request', '2019-09-17 10:19:06', '2019-09-17 10:19:06'),
(383, 16, 'order', '2019-09-17 10:19:36', '2019-09-17 10:19:36'),
(384, 16, 'active', '2019-09-17 10:20:24', '2019-09-17 10:20:24'),
(385, 16, 'return', '2019-09-17 10:21:15', '2019-09-17 10:21:15'),
(386, 16, 'paid', '2019-09-17 10:22:06', '2019-09-17 10:22:06'),
(387, 16, 'not_paid', '2019-09-17 10:23:00', '2019-09-17 10:23:00'),
(388, 16, 'in_processing', '2019-09-17 10:24:49', '2019-09-17 10:24:49'),
(389, 16, 'processed', '2019-09-17 10:25:46', '2019-09-17 10:25:46'),
(390, 16, 'closed', '2019-09-17 10:26:02', '2019-09-17 10:26:02'),
(391, 16, 'order_number', '2019-09-17 10:27:00', '2019-09-17 10:27:00'),
(392, 16, 'payment_system', '2019-09-17 10:28:05', '2019-09-17 10:28:05'),
(393, 16, 'transaction_status', '2019-09-17 10:28:54', '2019-09-17 10:28:54'),
(394, 16, 'external_transaction', '2019-09-17 10:29:40', '2019-09-17 10:29:40'),
(395, 16, 'cash_withdrawal', '2019-09-17 10:51:19', '2019-09-17 10:51:19'),
(397, 16, 'server', '2019-09-17 11:01:13', '2019-09-17 11:01:13'),
(398, 16, 'price_for', '2019-09-17 11:02:18', '2019-09-17 11:02:18'),
(399, 16, 'availability', '2019-09-17 11:02:59', '2019-09-17 11:02:59'),
(400, 13, 'lots', '2019-09-17 11:14:30', '2019-09-17 11:14:30'),
(401, 13, 'view', '2019-09-17 11:16:25', '2019-09-17 11:16:25'),
(402, 13, 'positive', '2019-09-17 11:17:18', '2019-09-17 11:17:18'),
(403, 13, 'negative', '2019-09-17 11:17:42', '2019-09-17 11:17:42'),
(404, 13, 'send', '2019-09-17 11:18:19', '2019-09-17 11:18:19'),
(405, 16, 'seller', '2019-09-17 11:23:28', '2019-09-17 11:23:28'),
(406, 16, 'buyer', '2019-09-17 11:24:02', '2019-09-17 11:24:02'),
(407, 16, 'game', '2019-09-17 11:25:20', '2019-09-17 11:25:20'),
(408, 16, 'amount', '2019-09-17 11:26:49', '2019-09-17 11:26:49'),
(409, 16, 'type', '2019-09-17 11:29:29', '2019-09-17 11:29:29'),
(410, 16, 'currency', '2019-09-17 11:30:15', '2019-09-17 11:30:15'),
(411, 16, 'count', '2019-09-17 11:30:54', '2019-09-17 11:30:54'),
(412, 16, 'characters_name', '2019-09-17 11:31:47', '2019-09-17 11:31:47'),
(413, 16, 'open', '2019-09-17 11:32:57', '2019-09-17 11:32:57'),
(414, 16, 'waiting_for_payment', '2019-09-17 11:33:36', '2019-09-17 11:33:36'),
(415, 16, 'additional_options', '2019-09-17 11:35:06', '2019-09-17 11:35:06'),
(416, 26, 'last', '2019-09-17 11:47:05', '2019-09-17 11:47:05'),
(417, 26, 'on_web', '2019-09-17 11:51:05', '2019-09-17 11:51:05'),
(418, 26, 'chat', '2019-09-17 11:59:46', '2019-09-17 11:59:46'),
(419, 26, 'show_more', '2019-09-17 12:00:15', '2019-09-17 12:00:15'),
(420, 26, 'enter_message', '2019-09-17 12:00:48', '2019-09-17 12:00:48'),
(421, 26, 'send', '2019-09-17 12:01:16', '2019-09-17 12:01:16'),
(422, 26, 'confirm_the_order', '2019-09-17 12:01:55', '2019-09-17 12:01:55'),
(423, 26, 'return_money', '2019-09-17 12:02:36', '2019-09-17 12:02:36'),
(424, 26, 'you', '2019-09-17 12:06:42', '2019-09-17 12:06:42'),
(428, 25, 'Внутренный баланс', '2019-09-17 12:17:59', '2019-09-17 12:17:59'),
(429, 25, 'currency', '2019-09-17 12:19:16', '2019-09-17 12:19:16');

-- --------------------------------------------------------

--
-- Структура таблицы `lang_index_translations`
--

CREATE TABLE `lang_index_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `lang_id` int(10) UNSIGNED NOT NULL,
  `structure_id` int(10) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `lang_index_translations`
--

INSERT INTO `lang_index_translations` (`id`, `lang_id`, `structure_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 2, 10, 'Добро пожаловать <br> на онлайн сервис <br> playmarket', '2019-08-15 17:41:47', '2019-09-13 15:33:23'),
(2, 2, 11, 'Самые лучшие цены <br> Минимальная комиссия <br> Гарантии и безопасность', '2019-08-15 17:42:39', '2019-09-13 15:33:50'),
(3, 2, 4, 'Безопасная сделка', '2019-08-15 17:44:27', '2019-08-15 17:44:27'),
(4, 2, 3, 'Последние Объявления', '2019-08-15 17:44:53', '2019-08-21 10:14:45'),
(5, 2, 5, 'Работаем 27/7', '2019-08-15 17:45:29', '2019-08-15 17:45:29'),
(6, 2, 6, 'Быстрый сервис', '2019-08-15 17:46:28', '2019-08-15 17:46:28'),
(7, 2, 7, 'Гарантия возврата средств', '2019-08-15 17:47:45', '2019-08-15 17:47:45'),
(8, 2, 8, 'Поиск игры', '2019-08-15 17:48:46', '2019-08-15 17:48:46'),
(9, 2, 9, 'Найти', '2019-08-15 17:49:06', '2019-08-19 13:39:13'),
(10, 2, 12, 'Мои продажи', '2019-08-16 08:45:26', '2019-08-16 08:45:26'),
(11, 2, 13, 'Мои покупки', '2019-08-16 08:45:44', '2019-08-16 08:45:44'),
(12, 2, 14, 'Сообщения', '2019-08-16 08:46:03', '2019-08-16 08:46:03'),
(13, 2, 15, 'Мои лоты', '2019-08-16 08:46:28', '2019-08-16 08:46:28'),
(14, 2, 16, 'Баланс', '2019-08-16 08:46:48', '2019-08-16 08:46:48'),
(15, 2, 17, 'Правила для продавцов', '2019-08-16 08:47:09', '2019-08-16 08:47:09'),
(16, 2, 18, 'Вопросы и ответы', '2019-08-16 08:47:27', '2019-08-16 08:47:27'),
(17, 2, 19, 'Разрешение споров', '2019-08-16 08:47:50', '2019-08-16 08:47:50'),
(18, 2, 20, 'Профиль', '2019-08-16 08:48:12', '2019-08-16 08:48:12'),
(19, 2, 21, 'Выход', '2019-08-16 08:48:28', '2019-08-16 08:48:28'),
(20, 2, 22, 'Вернуть деньги покупателю?', '2019-08-16 08:58:04', '2019-08-16 08:58:04'),
(21, 2, 23, 'Номер', '2019-08-16 08:58:18', '2019-08-16 08:58:18'),
(22, 2, 24, 'Покупатель', '2019-08-16 08:58:43', '2019-08-16 08:58:43'),
(23, 2, 25, 'Игра', '2019-08-16 08:58:59', '2019-08-16 08:58:59'),
(24, 2, 26, 'Статус', '2019-08-16 08:59:13', '2019-08-16 08:59:13'),
(25, 2, 27, 'Показать', '2019-08-16 08:59:39', '2019-08-16 08:59:39'),
(26, 2, 28, 'Закрыт', '2019-08-16 09:00:07', '2019-08-16 09:00:07'),
(27, 2, 29, 'Открытый', '2019-08-16 09:00:20', '2019-08-16 09:00:20'),
(28, 2, 30, 'Возврат', '2019-08-16 09:00:35', '2019-08-16 09:00:35'),
(29, 2, 31, 'Выбрать', '2019-08-16 09:02:06', '2019-08-16 09:02:06'),
(30, 2, 32, 'Заказ', '2019-08-16 09:02:21', '2019-08-16 09:02:21'),
(31, 2, 33, 'Описание', '2019-08-16 09:02:34', '2019-08-16 09:02:34'),
(32, 2, 34, 'Сумма', '2019-08-16 09:02:49', '2019-08-16 09:02:49'),
(33, 2, 35, 'Действия', '2019-08-16 09:03:03', '2019-08-16 09:03:03'),
(34, 2, 36, 'Продавец', '2019-08-16 09:05:20', '2019-08-16 09:05:20'),
(35, 2, 37, 'Мои лоты', '2019-08-16 09:16:00', '2019-08-16 09:16:00'),
(36, 2, 38, 'Баланс', '2019-08-16 09:16:10', '2019-08-16 09:16:10'),
(37, 2, 39, 'Профиль', '2019-08-16 09:16:25', '2019-08-16 09:16:25'),
(38, 2, 40, 'Личные данные', '2019-08-16 09:16:39', '2019-08-16 09:16:39'),
(39, 2, 41, 'Игра', '2019-08-16 09:19:09', '2019-08-16 09:19:09'),
(40, 2, 42, 'Сервер', '2019-08-16 09:19:21', '2019-08-16 09:19:21'),
(41, 2, 43, 'Раздел', '2019-08-16 09:19:38', '2019-08-16 09:19:38'),
(42, 2, 44, 'Статус', '2019-08-16 09:20:10', '2019-08-16 09:20:10'),
(43, 2, 45, 'Лот', '2019-08-16 09:20:26', '2019-08-16 09:20:26'),
(44, 2, 46, 'Игра/Сервер/Товар', '2019-08-16 09:20:43', '2019-08-16 09:20:43'),
(45, 2, 47, 'Цена', '2019-08-16 09:21:11', '2019-08-16 09:21:11'),
(46, 2, 48, 'Количество', '2019-08-16 09:21:26', '2019-08-16 09:21:26'),
(47, 2, 50, 'Валюта', '2019-08-16 09:22:59', '2019-08-16 09:22:59'),
(48, 2, 49, 'Выбрать', '2019-08-16 09:23:12', '2019-08-16 09:23:12'),
(49, 2, 51, 'Активный', '2019-08-16 09:23:31', '2019-08-16 09:23:31'),
(50, 2, 52, 'Не активный', '2019-08-16 09:23:50', '2019-08-16 09:23:50'),
(51, 2, 53, 'Кошельки', '2019-08-16 09:35:02', '2019-08-16 09:35:02'),
(52, 2, 54, 'удалить', '2019-08-16 09:35:43', '2019-08-16 09:35:43'),
(53, 2, 55, 'добавить', '2019-08-16 09:35:53', '2019-08-16 09:35:53'),
(54, 2, 56, 'Баланс', '2019-08-16 09:36:09', '2019-08-16 09:36:09'),
(55, 2, 63, 'Сохранить', '2019-08-16 09:36:37', '2019-08-16 09:36:37'),
(56, 2, 57, 'Вывести', '2019-08-16 09:42:40', '2019-08-16 09:42:40'),
(57, 2, 58, 'Дата', '2019-08-16 09:42:52', '2019-08-16 09:42:52'),
(58, 2, 59, 'Описание', '2019-08-16 09:43:06', '2019-08-16 09:43:06'),
(59, 2, 60, 'Валюта', '2019-08-16 09:43:17', '2019-08-16 09:43:17'),
(60, 2, 61, 'Сумма', '2019-08-16 09:43:28', '2019-08-16 09:43:28'),
(61, 2, 62, 'Статус', '2019-08-16 09:43:42', '2019-08-16 09:43:42'),
(62, 2, 64, 'Операции', '2019-08-16 09:44:51', '2019-08-16 09:44:51'),
(63, 2, 65, 'Отзывов нет', '2019-08-16 09:46:45', '2019-08-16 09:46:45'),
(64, 2, 66, 'онлайн', '2019-08-16 09:48:06', '2019-08-16 09:48:06'),
(65, 2, 67, 'офлайн', '2019-08-16 09:48:15', '2019-08-16 09:48:15'),
(66, 2, 68, 'Зарегистрирован', '2019-08-16 09:48:34', '2019-08-16 09:48:34'),
(67, 2, 69, 'Рейтинг', '2019-08-16 09:48:45', '2019-08-16 09:48:45'),
(68, 2, 70, 'Отзывы', '2019-08-16 09:48:55', '2019-08-16 09:48:55'),
(69, 2, 71, 'Изменить аватар', '2019-08-16 09:51:42', '2019-08-16 09:51:42'),
(70, 2, 72, 'Телефон', '2019-08-16 09:51:52', '2019-08-16 09:51:52'),
(71, 2, 73, 'Почта', '2019-08-16 09:52:01', '2019-08-16 09:52:01'),
(72, 2, 74, 'Пароль', '2019-08-16 09:52:10', '2019-08-16 09:52:10'),
(73, 2, 75, 'Сохранить', '2019-08-16 09:52:20', '2019-08-16 09:52:20'),
(74, 2, 76, 'Изменить', '2019-08-16 09:52:38', '2019-08-16 09:52:38'),
(75, 2, 77, 'Напомнить пароль', '2019-08-16 09:52:52', '2019-08-16 09:52:52'),
(76, 2, 79, 'Добавьте номер телефона', '2019-08-16 10:14:22', '2019-08-16 10:14:22'),
(77, 2, 80, 'Пароль', '2019-08-16 10:14:31', '2019-08-16 10:14:31'),
(78, 2, 81, 'Телефон', '2019-08-16 10:14:42', '2019-08-16 10:14:42'),
(79, 2, 82, 'С кодом страны (+7 или +380)', '2019-08-16 10:15:05', '2019-08-16 10:15:05'),
(80, 2, 83, 'Отправить смс', '2019-08-16 10:15:22', '2019-08-16 10:15:22'),
(81, 2, 84, 'Код из смс', '2019-08-16 10:15:34', '2019-08-16 10:15:34'),
(82, 2, 85, 'Сохранить', '2019-08-16 10:15:43', '2019-08-16 10:15:43'),
(83, 2, 86, 'Изменить почту', '2019-08-16 10:25:32', '2019-08-16 10:25:32'),
(84, 2, 87, 'Почта', '2019-08-16 10:25:43', '2019-08-16 10:25:43'),
(85, 2, 88, 'Изменить пароль', '2019-08-16 10:28:32', '2019-08-16 10:28:32'),
(86, 2, 89, 'Старый пароль', '2019-08-16 10:28:45', '2019-08-16 10:28:45'),
(87, 2, 90, 'Новый пароль', '2019-08-16 10:29:00', '2019-08-16 10:29:00'),
(88, 2, 91, 'Подтвердите пароль', '2019-08-16 10:29:15', '2019-08-16 10:29:15'),
(90, 2, 101, 'У вас нет возможности оставить отзыв.', '2019-08-16 10:45:13', '2019-08-16 10:45:13'),
(91, 2, 102, 'Аватар обновлен', '2019-08-16 10:46:05', '2019-08-16 10:46:05'),
(92, 2, 103, 'Проверьте вашие данные', '2019-08-16 10:46:47', '2019-08-16 10:46:47'),
(93, 2, 104, 'Телефон добавлен', '2019-08-16 10:47:42', '2019-08-16 10:47:42'),
(94, 2, 106, '. Пожалуйста, добавьте и подтвердите ваш номер телефона, для того чтобы выставлять лоты', '2019-08-16 10:50:00', '2019-08-16 10:50:00'),
(95, 2, 107, 'сcылка', '2019-08-16 10:51:28', '2019-08-16 10:51:28'),
(96, 2, 108, 'Неверный код из смс', '2019-08-16 10:52:07', '2019-08-16 10:52:07'),
(97, 2, 109, 'Добавте емейл в настройках аккаунта.', '2019-08-16 10:52:54', '2019-08-16 10:52:54'),
(98, 2, 110, 'Подтвердите емейл в настройках аккаунта.', '2019-08-16 10:54:06', '2019-08-16 10:54:06'),
(99, 2, 111, 'Вам уже было отправлено смс на номер, +', '2019-08-16 10:55:20', '2019-08-16 10:55:20'),
(100, 2, 112, '. Следующую смс можно отправить спустя ', '2019-08-16 10:57:13', '2019-08-16 10:57:13'),
(101, 2, 113, 'мин.', '2019-08-16 10:58:35', '2019-08-16 10:58:35'),
(102, 2, 114, 'сек.', '2019-08-16 10:59:39', '2019-08-16 10:59:39'),
(103, 2, 115, 'дней', '2019-08-16 11:01:33', '2019-08-16 11:01:33'),
(104, 2, 116, 'часов', '2019-08-16 11:01:46', '2019-08-16 11:01:46'),
(105, 2, 117, 'Проверте введенные данные', '2019-08-16 11:05:25', '2019-08-16 11:05:25'),
(106, 2, 118, 'Подтверждение почты', '2019-08-16 11:06:21', '2019-08-16 11:06:21'),
(107, 2, 119, 'Email обновленно, мы отправили вам письмо на', '2019-08-16 11:07:40', '2019-08-16 11:07:40'),
(108, 2, 120, 'для подтверждение.', '2019-08-16 11:08:27', '2019-08-16 11:08:27'),
(109, 2, 121, 'У вас уже потверджен email.', '2019-08-16 11:09:24', '2019-08-16 11:09:24'),
(110, 2, 122, 'На вашу почту:', '2019-08-16 11:10:34', '2019-08-16 11:10:34'),
(111, 2, 123, 'было отправлено письмо для потвержджения email.', '2019-08-16 11:11:34', '2019-08-16 11:11:34'),
(112, 2, 124, 'Пароль обновлен', '2019-08-16 11:13:49', '2019-08-16 11:13:49'),
(113, 2, 125, 'Проверте ваш старый пароль', '2019-08-16 11:14:34', '2019-08-16 11:14:34'),
(114, 2, 126, 'Правила успешно прийняты', '2019-08-16 11:16:34', '2019-08-16 11:16:34'),
(115, 2, 127, 'Пароль отправлен на пошту', '2019-08-16 11:30:16', '2019-08-16 11:30:16'),
(116, 2, 128, 'нененене', '2019-08-16 11:30:49', '2019-08-16 11:30:49'),
(117, 2, 129, 'Аккаунты', '2019-08-16 11:43:06', '2019-08-16 11:43:06'),
(118, 2, 130, 'Кристаллы', '2019-08-16 11:43:15', '2019-08-16 11:43:15'),
(119, 2, 131, 'Предметы', '2019-08-16 11:43:42', '2019-08-16 11:43:42'),
(120, 2, 132, 'Сервисы', '2019-08-16 11:43:57', '2019-08-16 11:43:57'),
(121, 2, 133, 'Серебро', '2019-08-16 11:44:07', '2019-08-16 11:44:07'),
(122, 2, 147, 'Кинахи', '2019-08-16 11:45:18', '2019-08-16 11:45:18'),
(123, 2, 134, 'Адена', '2019-08-16 11:45:33', '2019-08-16 11:45:33'),
(124, 2, 145, 'Золото', '2019-08-16 11:45:55', '2019-08-16 11:45:55'),
(125, 2, 154, 'Юани', '2019-08-16 11:46:27', '2019-08-16 11:46:27'),
(126, 2, 139, 'Кристаллы', '2019-08-16 11:46:43', '2019-08-16 11:46:43'),
(127, 2, 137, 'Монеты', '2019-08-16 11:47:41', '2019-08-16 11:47:41'),
(128, 2, 138, 'Кредиты', '2019-08-16 11:47:52', '2019-08-16 11:47:52'),
(129, 2, 141, 'Диаманты', '2019-08-16 11:48:05', '2019-08-16 11:48:05'),
(130, 2, 140, 'Валюта', '2019-08-16 11:48:17', '2019-08-16 11:48:17'),
(131, 2, 148, 'Лиани', '2019-08-16 11:48:37', '2019-08-16 11:48:37'),
(132, 2, 150, 'Рубль', '2019-08-16 11:48:53', '2019-08-16 11:48:53'),
(133, 2, 149, 'Платина', '2019-08-16 11:49:06', '2019-08-16 11:49:06'),
(134, 2, 151, 'Рупи', '2019-08-16 11:49:19', '2019-08-16 11:49:19'),
(135, 2, 153, 'Вирт', '2019-08-16 11:49:48', '2019-08-16 11:49:48'),
(136, 2, 152, 'Сферы возвышения', '2019-08-16 11:50:14', '2019-08-16 11:50:14'),
(137, 2, 136, 'Пополнение баланса', '2019-08-16 11:50:45', '2019-08-16 11:50:45'),
(138, 2, 135, 'Alz', '2019-08-16 11:52:17', '2019-08-16 11:52:17'),
(139, 2, 146, 'ISK', '2019-08-16 11:52:31', '2019-08-16 11:52:31'),
(140, 2, 155, 'Зени', '2019-08-16 11:53:00', '2019-08-16 11:53:00'),
(141, 2, 142, 'EUN', '2019-08-16 11:53:31', '2019-08-16 11:53:31'),
(142, 2, 143, 'Flux', '2019-08-16 11:53:43', '2019-08-16 11:53:43'),
(143, 2, 144, 'GB', '2019-08-16 11:53:53', '2019-08-16 11:53:53'),
(144, 2, 156, 'Безопасная сделка', '2019-08-16 13:53:10', '2019-08-16 14:28:24'),
(152, 1, 3, 'Last sales', '2019-08-19 10:40:48', '2019-08-19 10:40:48'),
(153, 1, 12, 'My sales', '2019-08-19 10:41:17', '2019-08-19 10:41:17'),
(154, 1, 13, 'My purchases', '2019-08-19 10:41:32', '2019-08-19 10:41:32'),
(155, 1, 14, 'Messages', '2019-08-19 10:41:43', '2019-08-19 10:41:43'),
(156, 1, 15, 'My lots', '2019-08-19 10:41:54', '2019-08-19 10:41:54'),
(157, 1, 16, 'Balance', '2019-08-19 10:42:04', '2019-08-19 10:42:04'),
(158, 1, 20, 'Profile', '2019-08-19 10:42:18', '2019-08-19 10:42:18'),
(159, 2, 158, 'Подтвердить', '2019-08-19 10:47:58', '2019-08-19 10:47:58'),
(160, 2, 159, 'Подтвердить почту', '2019-08-19 13:12:14', '2019-08-19 13:12:14'),
(161, 2, 160, 'Подтвердить почту', '2019-08-19 13:13:13', '2019-08-19 13:13:13'),
(162, 2, 161, 'Выберите способ вывода', '2019-08-19 13:16:03', '2019-08-19 13:16:03'),
(163, 2, 162, 'Продано', '2019-08-19 13:21:32', '2019-08-19 13:21:32'),
(164, 2, 163, 'руб', '2019-08-19 13:22:44', '2019-08-19 13:22:44'),
(165, 2, 164, 'Мы возвращаем средства, если ваш заказ не был выполнен', '2019-08-19 13:24:11', '2019-08-19 13:24:11'),
(166, 2, 166, 'Наш сервис обеспечивает безопасность участников сделки', '2019-08-19 13:26:35', '2019-08-19 13:26:35'),
(167, 2, 167, 'Мы работаем без выходных и праздников 24 часа в сутки', '2019-08-19 13:26:58', '2019-08-19 13:26:58'),
(168, 2, 165, 'Мы обеспечиваем быстроту выполнения ваших заказов', '2019-08-19 13:27:20', '2019-08-19 13:27:20'),
(169, 2, 168, 'Избранные игры', '2019-08-19 13:28:16', '2019-08-19 13:28:16'),
(170, 1, 4, 'Safe deal', '2019-08-19 13:36:32', '2019-08-19 13:36:32'),
(171, 1, 5, 'We work 27/7', '2019-08-19 13:36:55', '2019-08-19 13:36:55'),
(172, 1, 6, 'Quick service', '2019-08-19 13:37:36', '2019-08-19 13:37:36'),
(173, 1, 7, 'Money back guarantee', '2019-08-19 13:38:05', '2019-08-19 13:38:05'),
(174, 1, 8, 'Game search', '2019-08-19 13:38:25', '2019-08-19 13:38:25'),
(175, 1, 9, 'To find', '2019-08-19 13:38:54', '2019-08-19 13:38:54'),
(176, 1, 10, 'Welcome <br> to the online service <br> playmarket', '2019-08-19 13:39:40', '2019-09-16 13:10:02'),
(177, 1, 11, 'Best Prices <br> Lowest Commission <br> Warranties and Security', '2019-08-19 13:40:26', '2019-09-16 13:10:37'),
(178, 1, 162, 'Sales', '2019-08-19 13:40:51', '2019-08-19 13:40:51'),
(179, 1, 163, 'rub', '2019-08-19 13:41:07', '2019-08-19 13:41:07'),
(180, 1, 164, 'We refund if your order has not been completed', '2019-08-19 13:41:27', '2019-08-19 13:41:27'),
(181, 1, 165, 'We ensure the speed of your orders.', '2019-08-19 13:41:49', '2019-08-19 13:41:49'),
(182, 1, 166, 'Our service ensures the safety of participants in the transaction.', '2019-08-19 13:42:07', '2019-08-19 13:42:07'),
(183, 1, 167, 'We work without days off and holidays 24 hours a day', '2019-08-19 13:42:25', '2019-08-19 13:42:25'),
(184, 1, 168, 'Featured Games', '2019-08-19 13:42:45', '2019-08-19 13:42:45'),
(185, 1, 134, 'Adena', '2019-08-19 13:44:43', '2019-08-19 13:44:43'),
(186, 1, 135, 'Alz', '2019-08-19 13:44:55', '2019-08-19 13:44:55'),
(187, 1, 136, 'Balance replenishment', '2019-08-19 13:45:13', '2019-08-19 13:45:13'),
(188, 1, 137, 'Coins', '2019-08-19 13:45:25', '2019-08-19 13:45:25'),
(189, 1, 138, 'Credits', '2019-08-19 13:45:40', '2019-08-19 13:45:40'),
(190, 1, 139, 'Crystals', '2019-08-19 13:45:51', '2019-08-19 13:45:51'),
(191, 1, 140, 'Currency', '2019-08-19 13:46:03', '2019-08-19 13:46:03'),
(192, 1, 141, 'Diamonds', '2019-08-19 13:46:15', '2019-08-19 13:46:15'),
(193, 1, 142, 'EUN', '2019-08-19 13:52:25', '2019-08-19 13:52:25'),
(194, 1, 143, 'Flux', '2019-08-19 13:52:49', '2019-08-19 13:52:49'),
(195, 1, 144, 'GB', '2019-08-19 13:53:02', '2019-08-19 13:53:02'),
(196, 1, 145, 'Gold', '2019-08-19 13:53:13', '2019-08-19 13:53:13'),
(197, 1, 146, 'ISK', '2019-08-19 13:53:26', '2019-08-19 13:53:26'),
(198, 1, 147, 'Kinah', '2019-08-19 13:53:38', '2019-08-19 13:53:38'),
(199, 1, 148, 'Liang', '2019-08-19 13:53:50', '2019-08-19 13:53:50'),
(200, 1, 149, 'Platinum', '2019-08-19 13:54:02', '2019-08-19 13:54:02'),
(201, 1, 150, 'Ruble', '2019-08-19 13:54:14', '2019-08-19 13:54:14'),
(202, 1, 151, 'Rupee', '2019-08-19 13:54:26', '2019-08-19 13:54:26'),
(203, 1, 152, 'Spheres of exaltation', '2019-08-19 13:54:44', '2019-08-19 13:54:44'),
(204, 1, 153, 'Wirth', '2019-08-19 13:54:57', '2019-08-19 13:54:57'),
(205, 1, 154, 'Yuan', '2019-08-19 13:55:09', '2019-08-19 13:55:09'),
(206, 1, 155, 'Zany', '2019-08-19 13:55:20', '2019-08-19 13:55:20'),
(207, 1, 129, 'Accounts', '2019-08-19 13:55:57', '2019-08-19 13:55:57'),
(208, 1, 130, 'Crystals', '2019-08-19 13:56:07', '2019-08-19 13:56:07'),
(209, 1, 131, 'Items', '2019-08-19 13:56:18', '2019-08-19 13:56:18'),
(210, 1, 132, 'Services', '2019-08-19 13:56:27', '2019-08-19 13:56:27'),
(211, 1, 133, 'Silver', '2019-08-19 13:56:36', '2019-08-19 13:56:36'),
(212, 1, 17, 'Rules for sellers', '2019-08-19 13:57:29', '2019-08-19 13:57:29'),
(213, 1, 18, 'Questions and answers', '2019-08-19 13:57:48', '2019-08-19 13:57:48'),
(214, 1, 19, 'Dispute resolution', '2019-08-19 13:58:06', '2019-08-19 13:58:06'),
(215, 1, 21, 'Exit', '2019-08-19 13:58:21', '2019-08-19 13:58:21'),
(216, 1, 36, 'Seller', '2019-08-19 14:01:28', '2019-08-19 14:01:28'),
(217, 1, 35, 'Actions', '2019-08-19 14:01:41', '2019-08-19 14:01:41'),
(218, 1, 34, 'Amount', '2019-08-19 14:01:55', '2019-08-19 14:01:55'),
(219, 1, 33, 'Description', '2019-08-19 14:02:09', '2019-08-19 14:02:09'),
(220, 1, 32, 'Order', '2019-08-19 14:02:26', '2019-08-19 14:02:26'),
(221, 1, 31, 'Choose', '2019-08-19 14:02:39', '2019-08-19 14:02:39'),
(222, 1, 30, 'Return', '2019-08-19 14:03:00', '2019-08-19 14:03:00'),
(223, 1, 29, 'Open', '2019-08-19 14:03:13', '2019-08-19 14:03:13'),
(224, 1, 28, 'Closed', '2019-08-19 14:03:26', '2019-08-19 14:03:26'),
(225, 1, 27, 'Show', '2019-08-19 14:03:39', '2019-08-19 14:03:39'),
(226, 1, 26, 'Status', '2019-08-19 14:03:54', '2019-08-19 14:03:54'),
(227, 1, 25, 'Game', '2019-08-19 14:04:12', '2019-08-19 14:04:12'),
(228, 1, 24, 'Customer', '2019-08-19 14:04:24', '2019-08-19 14:04:24'),
(229, 1, 23, 'Number', '2019-08-19 14:04:43', '2019-08-19 14:04:43'),
(230, 1, 22, 'Return the money to the buyer?', '2019-08-19 14:04:57', '2019-08-19 14:04:57'),
(231, 2, 169, 'Адена', '2019-08-20 09:05:15', '2019-08-20 09:05:15'),
(232, 2, 170, 'Аккаунты', '2019-08-20 09:05:29', '2019-08-20 09:05:29'),
(233, 2, 171, 'Предметы', '2019-08-20 09:05:47', '2019-08-20 09:05:47'),
(234, 2, 172, 'Услуги', '2019-08-20 09:06:00', '2019-08-20 09:06:00'),
(235, 2, 173, 'Имя персонажа', '2019-08-20 09:06:15', '2019-08-20 09:06:15'),
(236, 1, 37, 'My lots', '2019-08-28 13:27:21', '2019-08-28 13:27:21'),
(237, 1, 38, 'Balance', '2019-08-28 13:27:33', '2019-08-28 13:27:33'),
(238, 1, 39, 'Profile', '2019-08-28 13:27:44', '2019-08-28 13:27:44'),
(239, 1, 40, 'Personal_data', '2019-08-28 13:27:57', '2019-08-28 13:27:57'),
(240, 1, 41, 'Game', '2019-08-28 13:28:14', '2019-08-28 13:28:14'),
(241, 1, 42, 'Server', '2019-08-28 13:28:27', '2019-08-28 13:28:27'),
(242, 1, 43, 'Section', '2019-08-28 13:29:13', '2019-08-28 13:29:13'),
(243, 1, 44, 'Status', '2019-08-28 13:29:38', '2019-08-28 13:29:38'),
(244, 1, 45, 'Lot', '2019-08-28 13:29:52', '2019-08-28 13:29:52'),
(245, 1, 46, 'Game/Server/Product', '2019-08-28 13:30:21', '2019-08-28 13:30:21'),
(246, 1, 47, 'Price', '2019-08-28 13:30:34', '2019-08-28 13:30:34'),
(247, 1, 48, 'Amount', '2019-08-28 13:30:51', '2019-08-28 13:30:51'),
(248, 1, 49, 'Choose', '2019-08-28 13:31:06', '2019-08-28 13:31:06'),
(249, 1, 50, 'Currency', '2019-08-28 13:31:20', '2019-08-28 13:31:20'),
(250, 1, 51, 'Active', '2019-08-28 13:31:33', '2019-08-28 13:31:33'),
(251, 1, 52, 'Not active', '2019-08-28 13:31:47', '2019-08-28 13:31:47'),
(252, 1, 53, 'Wallets', '2019-08-28 13:32:09', '2019-08-28 13:32:09'),
(253, 1, 54, 'Delete', '2019-08-28 13:32:23', '2019-08-28 13:32:23'),
(254, 1, 55, 'Add', '2019-08-28 13:32:46', '2019-08-28 13:32:46'),
(255, 1, 56, 'Balance', '2019-08-28 13:33:03', '2019-08-28 13:33:03'),
(256, 1, 57, 'Bring out', '2019-08-28 13:33:20', '2019-08-28 13:33:20'),
(257, 1, 58, 'Date', '2019-08-28 13:33:36', '2019-08-28 13:33:36'),
(258, 1, 59, 'Description', '2019-08-28 13:33:52', '2019-08-28 13:33:52'),
(259, 1, 60, 'Currency', '2019-08-28 13:34:17', '2019-08-28 13:34:17'),
(260, 1, 61, 'Amount', '2019-08-28 13:34:52', '2019-08-28 13:34:52'),
(261, 1, 62, 'Status', '2019-08-28 13:35:07', '2019-08-28 13:35:07'),
(262, 1, 63, 'Save', '2019-08-28 13:35:21', '2019-08-28 13:35:21'),
(263, 1, 64, 'Operations', '2019-08-28 13:36:13', '2019-08-28 13:36:13'),
(264, 1, 66, 'online', '2019-08-28 13:36:34', '2019-08-28 13:36:34'),
(265, 1, 67, 'offline', '2019-08-28 13:36:47', '2019-08-28 13:36:47'),
(266, 1, 68, 'Registered', '2019-08-28 13:37:33', '2019-08-28 13:37:33'),
(267, 1, 69, 'Rating', '2019-08-28 13:37:45', '2019-08-28 13:37:45'),
(268, 1, 70, 'Reviews', '2019-08-28 13:38:01', '2019-08-28 13:38:01'),
(269, 1, 65, 'No reviews', '2019-08-28 13:38:19', '2019-08-28 13:38:19'),
(270, 1, 71, 'Change avatar', '2019-08-28 13:38:56', '2019-08-28 13:38:56'),
(271, 1, 72, 'Msisdn', '2019-08-28 13:39:12', '2019-08-28 13:39:12'),
(272, 1, 73, 'Email', '2019-08-28 13:39:26', '2019-08-28 13:39:26'),
(273, 1, 74, 'Password', '2019-08-28 13:39:42', '2019-08-28 13:39:42'),
(274, 1, 75, 'Save', '2019-08-28 13:39:57', '2019-08-28 13:39:57'),
(275, 1, 76, 'Edit', '2019-08-28 13:40:14', '2019-08-28 13:40:14'),
(276, 1, 77, 'Remind password', '2019-08-28 13:40:33', '2019-08-28 13:40:33'),
(277, 1, 158, 'Confirm', '2019-08-28 13:41:14', '2019-08-28 13:41:14'),
(278, 1, 79, 'Add msisdn', '2019-08-28 13:41:39', '2019-08-28 13:41:39'),
(279, 1, 80, 'Password', '2019-08-28 13:42:02', '2019-08-28 13:42:02'),
(280, 1, 81, 'Msisdn', '2019-08-28 13:42:22', '2019-08-28 13:42:22'),
(281, 1, 82, 'With country code (+7 or +380)', '2019-08-28 13:43:08', '2019-08-28 13:43:08'),
(282, 1, 83, 'Send sms', '2019-08-28 13:43:35', '2019-08-28 13:43:35'),
(283, 1, 84, 'Sms code', '2019-08-28 13:44:00', '2019-08-28 13:44:00'),
(284, 1, 85, 'Save', '2019-08-28 13:44:24', '2019-08-28 13:44:24'),
(285, 1, 86, 'Change Email', '2019-08-28 13:44:47', '2019-08-28 13:45:15'),
(286, 1, 87, 'Email', '2019-08-28 13:45:56', '2019-08-28 13:45:56'),
(287, 1, 88, 'Change password', '2019-08-28 13:46:50', '2019-08-28 13:46:50'),
(288, 1, 89, 'Old password', '2019-08-28 13:47:10', '2019-08-28 13:47:10'),
(289, 1, 90, 'New password', '2019-08-28 13:47:34', '2019-08-28 13:47:34'),
(290, 1, 91, 'Confirm password', '2019-08-28 13:47:58', '2019-08-28 13:47:58'),
(291, 1, 160, 'Confirm Email', '2019-08-28 13:48:23', '2019-08-28 13:48:23'),
(292, 1, 161, 'Choose an output method', '2019-08-28 13:49:04', '2019-08-28 13:49:04'),
(293, 1, 101, 'You don\'t have access to send review.', '2019-08-28 13:49:37', '2019-08-28 13:49:57'),
(294, 1, 102, 'Avatar updated', '2019-08-28 13:50:32', '2019-08-28 13:50:32'),
(295, 1, 103, 'Check your details', '2019-08-28 13:51:13', '2019-08-28 13:51:13'),
(296, 1, 104, 'Msisdn is added', '2019-08-28 13:51:37', '2019-08-28 13:51:37'),
(297, 1, 106, '. Please, add and confirm you msisdn, in order to put lots', '2019-08-28 13:52:47', '2019-08-28 13:52:47'),
(298, 1, 107, 'link', '2019-08-28 13:53:04', '2019-08-28 13:53:04'),
(299, 1, 108, 'Wrong sms code', '2019-08-28 13:53:26', '2019-08-28 13:53:26'),
(300, 1, 109, 'Add Email in account settings.', '2019-08-28 13:53:53', '2019-08-28 13:53:59'),
(301, 1, 110, 'Confirm Email in account settings.', '2019-08-28 13:54:31', '2019-08-28 13:54:31'),
(302, 1, 111, 'You have already been sent SMS to the number, +', '2019-08-28 14:02:04', '2019-08-28 14:02:04'),
(303, 1, 112, '. The next SMS can be sent later', '2019-08-28 14:02:54', '2019-08-28 14:02:54'),
(304, 1, 113, 'min.', '2019-08-28 14:03:10', '2019-08-28 14:03:10'),
(305, 1, 114, 'sec.', '2019-08-28 14:03:39', '2019-08-28 14:03:39'),
(306, 1, 115, 'days', '2019-08-28 14:04:20', '2019-08-28 14:04:20'),
(307, 1, 116, 'hours', '2019-08-28 14:04:41', '2019-08-28 14:04:41'),
(308, 1, 117, 'Check your input data', '2019-08-28 14:05:09', '2019-08-28 14:05:09'),
(309, 1, 118, 'Mail confirmation', '2019-08-28 14:05:38', '2019-08-28 14:05:38'),
(310, 1, 119, 'Email updated, we have sent you an email at', '2019-08-28 14:06:16', '2019-08-28 14:06:16'),
(311, 1, 120, 'for confirmation.', '2019-08-28 14:07:05', '2019-08-28 14:07:05'),
(312, 1, 121, 'You have already verified email.', '2019-08-28 14:08:04', '2019-08-28 14:08:04'),
(313, 1, 122, 'To your mail:', '2019-08-28 14:09:29', '2019-08-28 14:09:29'),
(314, 1, 123, 'an email has been sent to confirm email.', '2019-08-28 14:10:06', '2019-08-28 14:10:06'),
(315, 1, 124, 'Password updated', '2019-08-28 14:10:28', '2019-08-28 14:10:28'),
(316, 1, 125, 'Verify your old password', '2019-08-28 14:10:50', '2019-08-28 14:10:50'),
(317, 1, 126, 'Rules accepted successfully', '2019-08-28 14:11:28', '2019-08-28 14:11:28'),
(318, 1, 127, 'Password sent by mail', '2019-08-28 14:12:46', '2019-08-28 14:12:46'),
(319, 1, 128, 'nononono', '2019-08-28 14:13:50', '2019-08-28 14:13:50'),
(320, 1, 169, 'Adena', '2019-08-28 14:14:12', '2019-08-28 14:14:12'),
(321, 1, 170, 'Accounts', '2019-08-28 14:14:33', '2019-08-28 14:14:33'),
(322, 1, 171, 'Items', '2019-08-28 14:14:50', '2019-08-28 14:14:50'),
(323, 1, 172, 'Services', '2019-08-28 14:15:08', '2019-08-28 14:15:08'),
(324, 1, 173, 'Nickname', '2019-08-28 14:15:39', '2019-08-28 14:15:39'),
(325, 2, 174, 'Продать игровую валюту', '2019-09-04 10:46:33', '2019-09-04 10:46:33'),
(326, 2, 175, 'Сервер', '2019-09-04 10:47:21', '2019-09-04 10:47:21'),
(327, 2, 176, 'Выбрать', '2019-09-04 10:48:05', '2019-09-04 10:48:05'),
(328, 2, 177, 'Сортировка', '2019-09-04 10:49:56', '2019-09-04 10:49:56'),
(329, 2, 178, 'Цена по возростанию', '2019-09-04 13:05:54', '2019-09-04 13:07:22'),
(330, 2, 179, 'Цена по убыванию', '2019-09-04 13:06:13', '2019-09-04 13:07:42'),
(331, 2, 184, 'По дате: ранее + Цена по возростанию', '2019-09-04 13:06:47', '2019-09-04 13:06:47'),
(332, 2, 185, 'По дате: ранее + Цена по убыванию', '2019-09-04 13:07:03', '2019-09-04 13:07:03'),
(333, 2, 180, 'Алфавит от А(А) до Я(Z)', '2019-09-04 13:07:58', '2019-09-04 13:07:58'),
(334, 2, 181, 'Алфавит от Я(Z) до А(А)', '2019-09-04 13:08:12', '2019-09-04 13:08:12'),
(335, 2, 182, 'По дате: ранее', '2019-09-04 13:08:28', '2019-09-04 13:08:28'),
(336, 2, 183, 'По дате: позднее', '2019-09-04 13:08:42', '2019-09-04 13:08:42'),
(337, 2, 186, 'По дате: ранее + Алфавит от А(А) до Я(Z)', '2019-09-04 13:08:57', '2019-09-04 13:08:57'),
(338, 2, 187, 'По дате: ранее + Алфавит от Я(Z) до А(А)', '2019-09-04 13:09:15', '2019-09-04 13:09:15'),
(339, 2, 188, 'По дате: позднее + Цена по возростанию', '2019-09-04 13:10:03', '2019-09-04 13:10:03'),
(340, 2, 189, 'По дате: позднее + Цена по убыванию', '2019-09-04 13:18:31', '2019-09-04 13:18:31'),
(341, 2, 190, 'По дате: позднее + Алфавит от А(А) до Я(Z)', '2019-09-04 13:18:59', '2019-09-04 13:18:59'),
(342, 2, 191, 'По дате: позднее + Алфавит от Я(Z) до А(А)', '2019-09-04 13:19:47', '2019-09-04 13:19:47'),
(343, 2, 192, 'Продавцы', '2019-09-04 13:22:15', '2019-09-04 13:22:15'),
(344, 2, 193, 'Продавец', '2019-09-04 13:28:23', '2019-09-04 13:28:23'),
(345, 2, 195, 'Рейтинг', '2019-09-04 13:28:44', '2019-09-04 13:28:44'),
(346, 2, 194, 'Наличие', '2019-09-04 13:29:33', '2019-09-04 13:29:33'),
(347, 2, 196, 'Цена за 1', '2019-09-04 14:33:36', '2019-09-04 14:33:36'),
(348, 2, 197, 'Оформление заказа', '2019-09-04 14:34:32', '2019-09-04 14:34:32'),
(349, 2, 198, 'Способ оплаты', '2019-09-04 14:35:12', '2019-09-04 14:35:12'),
(350, 2, 199, 'Имя персонажа', '2019-09-04 14:36:12', '2019-09-04 14:36:12'),
(351, 2, 200, 'Заплачу', '2019-09-04 14:37:05', '2019-09-04 14:37:05'),
(352, 2, 201, 'Получу', '2019-09-04 14:38:04', '2019-09-04 14:38:04'),
(353, 2, 202, 'Купить', '2019-09-04 14:47:06', '2019-09-04 14:47:06'),
(354, 2, 203, 'Чат с продавцом', '2019-09-04 14:48:16', '2019-09-04 14:48:16'),
(355, 2, 204, 'Отзывы о продавце', '2019-09-04 14:49:24', '2019-09-04 14:49:24'),
(356, 2, 205, 'Показать ещё', '2019-09-04 14:53:01', '2019-09-04 14:53:01'),
(357, 2, 206, 'Перед оформлением заказа обязательно свяжитесь с продавцом через чат, расположенный ниже (для уточнения сроков выполнения заказа). Ваша сделка защищена. Продавец не сможет получить оплату до тех пор, пока вы не подтвердите выполнение им всех обязательств', '2019-09-04 14:54:43', '2019-09-04 14:54:43'),
(358, 2, 207, 'Отправить', '2019-09-04 14:55:27', '2019-09-04 14:55:27'),
(359, 2, 208, 'Подтвердить заказ', '2019-09-04 14:56:30', '2019-09-04 14:56:30'),
(360, 2, 209, 'Вернуть деньги', '2019-09-04 14:57:16', '2019-09-04 14:57:16'),
(361, 2, 210, 'Позитивный', '2019-09-04 14:58:39', '2019-09-04 14:58:39'),
(362, 2, 211, 'Негативный', '2019-09-04 14:58:57', '2019-09-04 14:58:57'),
(364, 2, 212, 'Добавление предложения', '2019-09-06 16:16:51', '2019-09-06 16:16:51'),
(365, 1, 213, 'How it works', '2019-09-11 12:04:17', '2019-09-11 12:06:19'),
(366, 1, 214, 'Dispute resolution', '2019-09-11 12:05:09', '2019-09-11 12:06:41'),
(367, 2, 214, 'Разрешение споров', '2019-09-11 12:05:45', '2019-09-11 12:05:45'),
(368, 2, 213, 'Как это работает', '2019-09-11 12:05:59', '2019-09-11 12:05:59'),
(369, 1, 215, 'Terms of use', '2019-09-11 12:10:09', '2019-09-11 12:11:28'),
(370, 2, 215, 'Условия использования', '2019-09-11 12:13:16', '2019-09-11 12:13:16'),
(371, 2, 216, 'Связь с нами', '2019-09-11 12:15:17', '2019-09-11 12:15:17'),
(372, 1, 216, 'Contact with us', '2019-09-11 12:16:08', '2019-09-11 12:16:08'),
(373, 2, 217, 'Продать', '2019-09-11 12:24:30', '2019-09-11 12:24:30'),
(374, 2, 218, 'Описание', '2019-09-11 12:27:01', '2019-09-11 12:27:01'),
(375, 2, 219, 'Цена', '2019-09-11 12:27:49', '2019-09-11 12:27:49'),
(376, 2, 220, 'Профессия', '2019-09-11 12:31:22', '2019-09-11 12:31:22'),
(377, 2, 221, 'Уровень', '2019-09-11 12:31:41', '2019-09-11 12:31:41'),
(378, 1, 220, 'Profession', '2019-09-11 12:33:29', '2019-09-11 12:33:29'),
(379, 1, 221, 'Level', '2019-09-11 12:33:49', '2019-09-11 12:33:49'),
(380, 2, 222, 'Игра', '2019-09-11 12:38:45', '2019-09-11 12:38:45'),
(381, 2, 224, 'Количество', '2019-09-11 12:43:02', '2019-09-11 12:43:02'),
(382, 2, 225, 'Введите сообщение', '2019-09-11 12:47:29', '2019-09-11 12:47:29'),
(383, 2, 226, 'Отправить на аукцион', '2019-09-11 12:52:50', '2019-09-11 12:52:50'),
(384, 2, 227, 'Отправить на почту', '2019-09-11 12:53:11', '2019-09-11 12:53:11'),
(385, 2, 228, 'Передать в руки', '2019-09-11 12:53:35', '2019-09-11 12:53:35'),
(386, 1, 226, 'Submit for auction', '2019-09-11 12:55:22', '2019-09-11 12:55:22'),
(387, 1, 227, 'Send by post', '2019-09-11 12:55:59', '2019-09-11 12:55:59'),
(388, 1, 228, 'Hand over', '2019-09-11 12:56:38', '2019-09-11 12:56:38'),
(389, 2, 229, 'Категория', '2019-09-11 12:58:38', '2019-09-11 12:58:38'),
(390, 2, 230, 'Драйвер', '2019-09-11 13:13:17', '2019-09-11 13:13:17'),
(391, 2, 231, 'Прокачка', '2019-09-11 13:13:56', '2019-09-11 13:13:56'),
(392, 2, 232, 'Другое', '2019-09-11 13:15:03', '2019-09-11 13:15:03'),
(393, 1, 230, 'Driver', '2019-09-11 13:19:43', '2019-09-11 13:19:43'),
(394, 1, 231, 'Leveling', '2019-09-11 13:20:07', '2019-09-11 13:20:07'),
(395, 1, 232, 'Other', '2019-09-11 13:20:35', '2019-09-11 13:20:35'),
(396, 1, 233, 'Bank card', '2019-09-11 13:25:17', '2019-09-11 13:25:17'),
(397, 1, 234, 'Yandex.Money', '2019-09-11 13:25:50', '2019-09-11 13:25:50'),
(398, 1, 235, 'Internal balance', '2019-09-11 13:26:10', '2019-09-11 13:26:10'),
(399, 1, 236, 'MTS, BeeLine, MegaPhone', '2019-09-11 13:26:39', '2019-09-11 13:26:39'),
(400, 2, 282, 'на сайте', '2019-09-12 09:21:47', '2019-09-12 09:21:47'),
(401, 2, 283, 'Отзывов', '2019-09-12 09:38:42', '2019-09-12 09:38:42'),
(402, 2, 284, 'Выберите, кому вы хотите отправить сообщение', '2019-09-12 09:44:22', '2019-09-12 09:44:22'),
(403, 2, 285, 'Лимит одного собщенния 400 знаков, у вас в сообщении', '2019-09-12 09:46:55', '2019-09-12 09:46:55'),
(404, 2, 286, 'знаков.', '2019-09-12 09:47:44', '2019-09-12 09:47:44'),
(405, 2, 287, 'Войдите или зарегистрируйтесь', '2019-09-12 09:48:45', '2019-09-12 09:48:45'),
(406, 2, 288, 'Минимальная сума заказа', '2019-09-12 09:50:42', '2019-09-12 09:50:42'),
(407, 2, 289, 'У продавца не хватает товара', '2019-09-12 09:52:42', '2019-09-12 09:52:42'),
(408, 2, 290, 'Необходимо выбрать лот', '2019-09-12 09:53:39', '2019-09-12 09:53:39'),
(409, 2, 291, 'Необходимо выбрать способ оплаты', '2019-09-12 09:57:23', '2019-09-12 09:57:23'),
(410, 2, 292, 'Ошибка, продавец уже продал товар', '2019-09-12 10:39:18', '2019-09-12 10:39:18'),
(411, 2, 293, 'Минимальная сума заказа для валюты WME или WMZ равна', '2019-09-12 10:40:19', '2019-09-12 10:40:19'),
(412, 2, 294, 'Минимальная сума заказа для рубля составляет', '2019-09-12 10:41:30', '2019-09-12 10:41:30'),
(413, 2, 295, 'Вы не можете покупать за внутренний баланс. Обратитесь к администратору для знятия блокировки.', '2019-09-12 10:42:39', '2019-09-12 10:42:39'),
(414, 2, 296, 'Вы не можете купить лот у самого себя', '2019-09-12 10:43:22', '2019-09-12 10:43:22'),
(415, 2, 297, 'Для покупки подтвердите пожалуйста email.', '2019-09-12 10:43:59', '2019-09-12 10:43:59'),
(416, 2, 298, 'Минимальная сума для данного лота составляет', '2019-09-12 10:45:04', '2019-09-12 10:45:04'),
(417, 2, 299, 'рублей.', '2019-09-12 10:45:57', '2019-09-12 10:45:57'),
(418, 2, 300, 'У вас недостаточно денег на счёту. Ваш баланс', '2019-09-12 10:48:02', '2019-09-12 10:48:02'),
(419, 2, 301, 'подтвердил успешное выполнение заказа', '2019-09-12 10:49:19', '2019-09-12 10:49:19'),
(420, 2, 302, 'шт.', '2019-09-12 10:50:01', '2019-09-12 10:50:01'),
(421, 2, 303, 'Покупатель', '2019-09-12 10:50:40', '2019-09-12 10:50:40'),
(422, 2, 304, 'В количестве:', '2019-09-12 10:53:09', '2019-09-12 10:53:09'),
(423, 2, 305, 'и отправил деньги продавцу', '2019-09-12 10:54:29', '2019-09-12 10:54:29'),
(424, 2, 306, 'Нажмите', '2019-09-12 10:55:03', '2019-09-12 10:55:03'),
(425, 2, 307, 'здесь', '2019-09-12 10:56:09', '2019-09-16 13:03:22'),
(426, 2, 308, 'что бы оставить отзыв или оценить продавца.', '2019-09-12 10:56:51', '2019-09-12 10:56:51'),
(427, 2, 309, 'Купить минимум предметов', '2019-09-13 12:07:18', '2019-09-13 12:07:18'),
(428, 2, 310, 'Купить максимум предметов', '2019-09-13 12:07:50', '2019-09-13 12:07:50'),
(429, 2, 311, 'Добавте емейл в настройках аккаунта.', '2019-09-13 13:26:27', '2019-09-13 13:26:27'),
(430, 2, 312, 'Подтвердите емейл в настройках аккаунта.', '2019-09-13 13:27:18', '2019-09-13 13:27:18'),
(431, 2, 313, 'Пожалуйста, добавьте и подтвердите ваш номер телефона, для того чтобы выставить лот', '2019-09-13 13:28:32', '2019-09-13 13:28:32'),
(432, 2, 314, 'сcылка', '2019-09-13 13:29:06', '2019-09-13 13:29:06'),
(433, 2, 315, 'Примите условия для продавцов чтобы иметь возможность торговать на сайте', '2019-09-13 13:29:45', '2019-09-13 13:29:45'),
(434, 2, 316, 'Минимальная сумма заказа', '2019-09-13 13:35:41', '2019-09-13 13:35:41'),
(435, 2, 317, 'За игровую валюту вы получите на свой кошелек ровно столько, сколько запросите.                                         Комиссия взимается только с покупателей и зависит от способа оплаты и списка                                         принимаемых вами валют.<br/>Нажмите                                         <button type=\"button\" class=\"btn-info disabled-click\"><i                                                     class=\"ico ico-info\"></i></button>                                         , чтобы узнать цены, которые видят покупатели.', '2019-09-13 13:37:19', '2019-09-13 13:38:47'),
(436, 2, 318, 'Сервер', '2019-09-13 13:40:06', '2019-09-13 13:40:06'),
(437, 2, 319, 'Цена за', '2019-09-13 13:40:44', '2019-09-13 13:40:44'),
(438, 2, 320, 'Наличие', '2019-09-13 13:41:26', '2019-09-13 13:41:26'),
(439, 2, 321, 'Выбрать', '2019-09-13 13:42:43', '2019-09-13 13:42:43'),
(440, 2, 322, 'Сохранить', '2019-09-13 13:44:10', '2019-09-13 13:44:10'),
(441, 2, 323, 'Скрыть фильтр', '2019-09-13 13:53:45', '2019-09-13 13:53:45'),
(442, 2, 324, 'Показать фильтр', '2019-09-13 13:54:38', '2019-09-13 13:54:38'),
(443, 2, 326, 'сохранить', '2019-09-13 14:12:32', '2019-09-13 14:12:32'),
(444, 2, 327, 'Виды Услуг', '2019-09-13 14:17:45', '2019-09-13 14:17:45'),
(445, 2, 325, 'Активный', '2019-09-13 14:20:48', '2019-09-13 14:20:48'),
(446, 2, 329, 'Фильтр', '2019-09-13 14:26:07', '2019-09-13 14:26:07'),
(447, 2, 330, 'Ожидание оплаты', '2019-09-13 14:30:47', '2019-09-13 14:30:47'),
(448, 2, 331, 'Лот был удален', '2019-09-13 14:32:11', '2019-09-13 14:32:11'),
(449, 2, 332, 'Внутренный баланс', '2019-09-13 14:53:32', '2019-09-13 14:53:32'),
(450, 2, 333, 'Закрить заказ?', '2019-09-13 15:04:37', '2019-09-13 15:04:37'),
(451, 2, 334, 'Да', '2019-09-13 15:05:28', '2019-09-13 15:05:28'),
(452, 2, 335, 'Нет', '2019-09-13 15:05:43', '2019-09-13 15:05:43'),
(453, 2, 336, 'Подтвердить заказ', '2019-09-13 15:07:40', '2019-09-13 15:07:40'),
(454, 2, 337, 'Возврат', '2019-09-13 15:08:28', '2019-09-13 15:08:28'),
(455, 2, 338, 'Закрыт', '2019-09-13 15:08:47', '2019-09-13 15:08:47'),
(456, 2, 340, 'Лот был удален', '2019-09-13 15:09:38', '2019-09-13 15:09:38'),
(457, 2, 341, 'шт', '2019-09-13 15:10:26', '2019-09-13 15:10:26'),
(458, 2, 342, 'Редактирование предложения', '2019-09-13 15:23:09', '2019-09-13 15:23:09'),
(459, 2, 343, 'Изменить', '2019-09-13 15:23:42', '2019-09-13 15:23:42'),
(460, 2, 344, 'шт', '2019-09-13 15:30:11', '2019-09-13 15:30:11'),
(461, 1, 329, 'Filter', '2019-09-16 11:52:45', '2019-09-16 11:52:45'),
(462, 1, 330, 'Waiting for payment', '2019-09-16 11:53:08', '2019-09-16 11:53:08'),
(463, 1, 331, 'Lot deleted', '2019-09-16 12:18:38', '2019-09-16 12:18:38'),
(464, 1, 332, 'Internal balance', '2019-09-16 12:19:52', '2019-09-16 12:19:52'),
(465, 1, 342, 'Edit offers', '2019-09-16 12:20:19', '2019-09-16 12:20:19'),
(466, 1, 343, 'Edit', '2019-09-16 12:20:40', '2019-09-16 12:20:40'),
(467, 1, 344, 'thgs', '2019-09-16 12:22:17', '2019-09-17 01:01:37'),
(468, 1, 174, 'Sell game currency', '2019-09-16 12:23:06', '2019-09-16 12:23:06'),
(469, 1, 175, 'Server', '2019-09-16 12:23:25', '2019-09-16 12:23:25'),
(470, 1, 176, 'Choose', '2019-09-16 12:23:56', '2019-09-16 12:23:56'),
(471, 1, 177, 'Sorting', '2019-09-16 12:24:23', '2019-09-16 12:24:23'),
(472, 1, 178, 'Price ascending', '2019-09-16 12:24:53', '2019-09-16 12:24:53'),
(473, 1, 179, 'Price Descending', '2019-09-16 12:25:37', '2019-09-16 12:25:37'),
(474, 1, 180, 'From A to Z', '2019-09-16 12:26:15', '2019-09-16 12:26:15'),
(475, 1, 181, 'From Z to A', '2019-09-16 12:26:50', '2019-09-16 12:26:50'),
(476, 1, 182, 'Earlier', '2019-09-16 12:27:11', '2019-09-16 12:27:11'),
(477, 1, 183, 'Later', '2019-09-16 12:27:39', '2019-09-16 12:27:39'),
(478, 1, 184, 'Earlier & Price ascending', '2019-09-16 12:28:18', '2019-09-16 12:28:18'),
(479, 1, 188, 'Later & Price ascending', '2019-09-16 12:28:55', '2019-09-16 12:28:55'),
(480, 1, 185, 'Earlier & Price Descending', '2019-09-16 12:29:35', '2019-09-16 12:29:35'),
(481, 1, 189, 'Later & Price Descending', '2019-09-16 12:30:09', '2019-09-16 12:30:09'),
(482, 1, 186, 'Earlier & From A to Z', '2019-09-16 12:30:38', '2019-09-16 12:30:38'),
(483, 1, 187, 'Earlier & From Z to A', '2019-09-16 12:31:27', '2019-09-16 12:31:27'),
(484, 1, 190, 'Later & From A to Z', '2019-09-16 12:31:55', '2019-09-16 12:31:55'),
(485, 1, 191, 'Later & From Z to A', '2019-09-16 12:32:25', '2019-09-16 12:32:25'),
(486, 1, 192, 'Sellers', '2019-09-16 12:32:55', '2019-09-16 12:32:55'),
(487, 1, 193, 'Seller', '2019-09-16 12:33:31', '2019-09-16 12:33:31'),
(488, 1, 194, 'Availability', '2019-09-16 12:34:04', '2019-09-16 12:34:04'),
(489, 1, 195, 'Rating', '2019-09-16 12:34:31', '2019-09-16 12:34:31'),
(490, 1, 196, 'Price for 1', '2019-09-16 12:35:03', '2019-09-16 12:35:03'),
(491, 1, 197, 'Checkout', '2019-09-16 12:35:52', '2019-09-16 12:35:52'),
(492, 1, 198, 'Payment method', '2019-09-16 12:36:53', '2019-09-16 12:36:53'),
(493, 1, 199, 'Hero name', '2019-09-16 12:37:15', '2019-09-16 12:37:15'),
(494, 1, 200, 'Will pay', '2019-09-16 12:37:38', '2019-09-16 12:37:38'),
(495, 1, 201, 'Will receive', '2019-09-16 12:38:02', '2019-09-16 12:38:02'),
(496, 1, 202, 'Buy', '2019-09-16 12:38:25', '2019-09-16 12:38:25'),
(497, 1, 203, 'Chat with seller', '2019-09-16 12:38:52', '2019-09-16 12:38:52'),
(498, 1, 204, 'Seller reviews', '2019-09-16 12:39:15', '2019-09-16 12:39:15'),
(499, 1, 205, 'Show more', '2019-09-16 12:39:36', '2019-09-16 12:39:36'),
(500, 1, 206, 'Before placing an order, be sure to contact the seller through the chat located below (to clarify the timing of the order). Your transaction is protected. The seller will not be able to receive payment until you confirm that he has fulfilled all obligations.', '2019-09-16 12:40:13', '2019-09-16 12:40:13'),
(501, 1, 207, 'Submit', '2019-09-16 12:40:42', '2019-09-16 12:40:42'),
(502, 1, 208, 'Confirm the order', '2019-09-16 12:41:11', '2019-09-16 12:41:11'),
(503, 1, 209, 'Return money', '2019-09-16 12:41:38', '2019-09-16 12:41:38'),
(504, 1, 210, 'Positive', '2019-09-16 12:41:57', '2019-09-16 12:41:57'),
(505, 1, 211, 'Negative', '2019-09-16 12:42:18', '2019-09-16 12:42:18'),
(506, 1, 212, 'Adding an offer', '2019-09-16 12:42:52', '2019-09-16 12:42:52'),
(507, 1, 222, 'Game', '2019-09-16 12:43:13', '2019-09-16 12:43:13'),
(508, 1, 224, 'Amount', '2019-09-16 12:43:44', '2019-09-16 12:43:44'),
(509, 1, 217, 'To sell', '2019-09-16 12:44:18', '2019-09-16 12:44:18'),
(510, 1, 218, 'Description', '2019-09-16 12:44:47', '2019-09-16 12:44:47'),
(511, 1, 219, 'Price', '2019-09-16 12:45:09', '2019-09-16 12:45:09'),
(512, 1, 225, 'Enter your message', '2019-09-16 12:45:55', '2019-09-16 12:45:55'),
(513, 1, 229, 'Category', '2019-09-16 12:46:23', '2019-09-16 12:46:23'),
(514, 1, 283, 'Reviews', '2019-09-16 12:46:49', '2019-09-16 12:46:49'),
(515, 1, 284, 'Choose to whom you want to send a message', '2019-09-16 12:47:33', '2019-09-16 12:47:33'),
(516, 1, 285, 'The limit of one message is 400 characters, in your message', '2019-09-16 12:48:02', '2019-09-16 12:48:02'),
(517, 1, 286, 'signs.', '2019-09-16 12:48:35', '2019-09-16 12:48:35'),
(518, 1, 287, 'Login or register', '2019-09-16 12:49:12', '2019-09-16 12:49:12'),
(519, 1, 288, 'Minimum Order Amount', '2019-09-16 12:49:40', '2019-09-16 12:49:40'),
(520, 1, 289, 'The seller does not have enough goods', '2019-09-16 12:50:13', '2019-09-16 12:50:13'),
(521, 1, 290, 'You must select a lot', '2019-09-16 12:50:44', '2019-09-16 12:50:44'),
(522, 1, 291, 'You must select a payment method', '2019-09-16 12:51:12', '2019-09-16 12:51:12'),
(523, 1, 309, 'Buy a minimum of items', '2019-09-16 12:51:41', '2019-09-16 12:51:41'),
(524, 1, 310, 'Buy maximum items', '2019-09-16 12:52:11', '2019-09-16 12:52:11'),
(525, 1, 323, 'Hide filter', '2019-09-16 12:52:39', '2019-09-16 12:52:39'),
(526, 1, 324, 'Show filter', '2019-09-16 12:53:11', '2019-09-16 12:53:11'),
(527, 1, 325, 'Active', '2019-09-16 12:53:33', '2019-09-16 12:53:33'),
(528, 1, 326, 'save', '2019-09-16 12:53:52', '2019-09-16 12:53:52'),
(529, 1, 334, 'Yes', '2019-09-16 12:54:19', '2019-09-16 12:54:19'),
(530, 1, 335, 'No', '2019-09-16 12:54:31', '2019-09-16 12:54:31'),
(531, 1, 333, 'Close order?', '2019-09-16 12:54:51', '2019-09-16 12:54:51'),
(532, 1, 336, 'Confirm order', '2019-09-16 12:55:04', '2019-09-16 12:55:04'),
(533, 1, 337, 'Return', '2019-09-16 12:55:28', '2019-09-16 12:55:28'),
(534, 1, 338, 'Closed', '2019-09-16 12:55:49', '2019-09-16 12:55:49'),
(535, 1, 340, 'Lot has been deleted', '2019-09-16 12:56:11', '2019-09-16 12:56:11'),
(536, 1, 292, 'Error, the seller has already sold the goods', '2019-09-16 12:56:33', '2019-09-16 12:56:33'),
(537, 1, 341, 'thgs', '2019-09-16 12:56:46', '2019-09-16 12:56:46'),
(538, 1, 293, 'The minimum order amount for WME or WMZ is', '2019-09-16 12:57:16', '2019-09-16 12:57:16'),
(539, 1, 294, 'The minimum order amount for the ruble is', '2019-09-16 12:57:37', '2019-09-16 12:57:37'),
(540, 1, 295, 'You cannot buy for internal balance. Contact your administrator for knowledge of the lock.', '2019-09-16 12:58:02', '2019-09-16 12:58:02'),
(541, 1, 296, 'You cannot buy a lot from yourself', '2019-09-16 12:58:26', '2019-09-16 12:58:26'),
(542, 1, 297, 'For purchase, please confirm email.', '2019-09-16 12:58:48', '2019-09-16 12:58:48'),
(543, 1, 298, 'The minimum amount for this lot is', '2019-09-16 12:59:10', '2019-09-16 12:59:10'),
(544, 1, 299, 'rubles.', '2019-09-16 12:59:32', '2019-09-16 12:59:32'),
(545, 1, 300, 'You do not have enough money in your account. Your balance', '2019-09-16 12:59:56', '2019-09-16 12:59:56'),
(546, 1, 301, 'confirmed the successful completion of the order', '2019-09-16 13:00:31', '2019-09-16 13:00:31'),
(547, 1, 302, 'thgs', '2019-09-16 13:00:47', '2019-09-17 00:56:52'),
(548, 1, 303, 'Buyer', '2019-09-16 13:01:09', '2019-09-16 13:01:09'),
(549, 1, 304, 'In quantity:', '2019-09-16 13:01:30', '2019-09-16 13:01:30'),
(550, 1, 305, 'and sent the money to the seller', '2019-09-16 13:01:50', '2019-09-16 13:01:50'),
(551, 1, 306, 'Click', '2019-09-16 13:02:11', '2019-09-16 13:02:11'),
(552, 1, 307, 'here', '2019-09-16 13:02:29', '2019-09-16 13:02:29'),
(553, 1, 308, 'to leave a review or rate the seller.', '2019-09-16 13:03:02', '2019-09-16 13:03:02'),
(554, 1, 311, 'Add an email to your account settings.', '2019-09-16 13:03:52', '2019-09-16 13:03:52'),
(555, 1, 312, 'Confirm the email in your account settings.', '2019-09-16 13:04:12', '2019-09-16 13:04:12'),
(556, 1, 313, 'Please add and confirm your phone number in order to set the lot.', '2019-09-16 13:04:33', '2019-09-16 13:04:33'),
(557, 1, 314, 'link', '2019-09-16 13:04:51', '2019-09-16 13:04:51'),
(558, 1, 315, 'Accept the conditions for sellers to be able to trade on the site', '2019-09-16 13:05:10', '2019-09-16 13:05:10'),
(559, 1, 316, 'Minimum Order Amount', '2019-09-16 13:05:34', '2019-09-16 13:05:34'),
(560, 1, 317, 'For game currency, you will receive as much as you request on your wallet. The commission is charged only from buyers and depends on the method of payment and the list of currencies you accept.<br/>Click<button type=\"button\" class=\"btn-info disabled-click\"><i class=\"ico ico-info\"></i></button> , to find out the prices buyers see.', '2019-09-16 13:06:37', '2019-09-16 13:06:37'),
(561, 1, 318, 'Server', '2019-09-16 13:06:52', '2019-09-16 13:06:52'),
(562, 1, 319, 'Price for', '2019-09-16 13:07:12', '2019-09-16 13:07:12'),
(563, 1, 320, 'Aviability', '2019-09-16 13:07:30', '2019-09-16 13:07:30'),
(564, 1, 321, 'Choose', '2019-09-16 13:07:48', '2019-09-16 13:07:48'),
(565, 1, 322, 'Save', '2019-09-16 13:08:01', '2019-09-16 13:08:01'),
(566, 2, 345, 'Поиск игры', '2019-09-16 23:26:02', '2019-09-16 23:26:02'),
(567, 2, 346, 'Войти', '2019-09-16 23:27:27', '2019-09-16 23:27:27'),
(568, 2, 347, 'Зарегистрироваться', '2019-09-16 23:28:01', '2019-09-16 23:28:01'),
(569, 1, 345, 'Game search', '2019-09-16 23:29:12', '2019-09-16 23:29:12'),
(570, 1, 346, 'Login', '2019-09-16 23:29:40', '2019-09-16 23:29:40'),
(571, 1, 347, 'Sign up', '2019-09-16 23:30:38', '2019-09-16 23:30:38'),
(572, 1, 348, 'Price', '2019-09-17 00:16:54', '2019-09-17 00:16:54'),
(573, 2, 348, 'Цена', '2019-09-17 00:17:21', '2019-09-17 00:17:21'),
(574, 2, 349, 'Продано', '2019-09-17 00:18:15', '2019-09-17 00:18:15'),
(575, 1, 349, 'Sales', '2019-09-17 00:19:35', '2019-09-17 00:19:35'),
(576, 2, 350, 'Авторизация', '2019-09-17 00:23:01', '2019-09-17 00:23:01'),
(577, 2, 351, 'Почта', '2019-09-17 00:23:37', '2019-09-17 00:23:37'),
(578, 2, 352, 'Войти', '2019-09-17 00:25:18', '2019-09-17 00:25:18'),
(579, 2, 353, 'Или войдите через', '2019-09-17 00:26:18', '2019-09-17 00:26:18'),
(580, 2, 354, 'Регистрация', '2019-09-17 00:28:09', '2019-09-17 00:28:09'),
(581, 2, 355, 'Имя', '2019-09-17 00:28:46', '2019-09-17 00:28:46'),
(582, 2, 356, 'Код с картинки', '2019-09-17 00:29:37', '2019-09-17 00:29:37'),
(583, 2, 357, 'Обновить', '2019-09-17 00:30:12', '2019-09-17 00:30:12'),
(584, 2, 358, 'Нажимая кнопку «Зарегистрироваться», <br>я принимаю условия', '2019-09-17 00:31:16', '2019-09-17 00:31:16'),
(585, 2, 359, 'пользовательского соглашения', '2019-09-17 00:32:02', '2019-09-17 00:32:02'),
(586, 2, 360, 'Зарегистрироваться', '2019-09-17 00:33:09', '2019-09-17 00:33:09'),
(587, 2, 361, 'Зарегистрироваться через', '2019-09-17 00:33:29', '2019-09-17 00:33:29'),
(588, 2, 362, 'Способ вывода', '2019-09-17 00:34:53', '2019-09-17 00:34:53'),
(589, 2, 363, 'Выбрать', '2019-09-17 00:35:27', '2019-09-17 00:35:27'),
(590, 2, 364, 'Кошелек', '2019-09-17 00:35:59', '2019-09-17 00:35:59'),
(591, 2, 365, 'Сумма', '2019-09-17 00:37:42', '2019-09-17 00:37:42'),
(592, 2, 366, 'К получению', '2019-09-17 00:38:35', '2019-09-17 00:38:35'),
(593, 2, 367, 'Вывести', '2019-09-17 00:39:48', '2019-09-17 00:39:48'),
(594, 2, 368, 'Отменить', '2019-09-17 00:40:30', '2019-09-17 00:40:30'),
(595, 2, 369, 'Онлайн биржа игровых ресурсов', '2019-09-17 00:42:01', '2019-09-17 00:42:01'),
(596, 1, 369, 'Online game resource exchange', '2019-09-17 00:47:11', '2019-09-17 00:47:11'),
(597, 1, 368, 'Cancel', '2019-09-17 00:47:48', '2019-09-17 00:47:48'),
(598, 1, 350, 'Login', '2019-09-17 00:48:08', '2019-09-17 00:48:08'),
(599, 1, 351, 'Email', '2019-09-17 00:48:25', '2019-09-17 00:48:25'),
(600, 1, 352, 'Entry', '2019-09-17 00:48:48', '2019-09-17 00:48:48'),
(601, 1, 353, 'Or login through', '2019-09-17 00:49:16', '2019-09-17 00:49:16'),
(602, 1, 354, 'Register', '2019-09-17 00:49:35', '2019-09-17 00:49:35'),
(603, 1, 355, 'Name', '2019-09-17 00:50:15', '2019-09-17 00:50:15'),
(604, 1, 356, 'Picture code', '2019-09-17 00:50:40', '2019-09-17 00:50:40'),
(605, 1, 357, 'Refresh', '2019-09-17 00:50:58', '2019-09-17 00:50:58'),
(606, 1, 358, 'By clicking on the «Register» button, <br> I accept the conditions', '2019-09-17 00:51:42', '2019-09-17 00:51:42'),
(607, 1, 359, 'user agreement', '2019-09-17 00:52:06', '2019-09-17 00:52:06'),
(608, 1, 360, 'Sign up', '2019-09-17 00:52:27', '2019-09-17 00:52:27'),
(609, 1, 361, 'Register through', '2019-09-17 00:52:54', '2019-09-17 00:52:54'),
(610, 1, 362, 'Output method', '2019-09-17 00:53:40', '2019-09-17 00:53:40'),
(611, 1, 363, 'Choose', '2019-09-17 00:53:52', '2019-09-17 00:53:52'),
(612, 1, 364, 'Wallet', '2019-09-17 00:54:00', '2019-09-17 00:54:00'),
(613, 1, 365, 'Amount', '2019-09-17 00:54:19', '2019-09-17 00:54:19'),
(614, 1, 366, 'To receive', '2019-09-17 00:54:28', '2019-09-17 00:54:28'),
(615, 1, 367, 'Withdraw', '2019-09-17 00:54:38', '2019-09-17 00:54:38'),
(616, 1, 370, 'Internal balance', '2019-09-17 01:09:35', '2019-09-17 01:09:35'),
(617, 1, 373, 'Closed deal', '2019-09-17 01:12:52', '2019-09-17 01:21:18'),
(618, 2, 373, 'Закрытая сделка', '2019-09-17 01:13:22', '2019-09-17 01:13:22'),
(619, 2, 371, 'Активная сделка', '2019-09-17 01:13:46', '2019-09-17 01:13:46'),
(620, 2, 370, 'Внутренный баланс', '2019-09-17 01:14:07', '2019-09-17 01:14:07'),
(621, 2, 372, 'Обработанный', '2019-09-17 01:14:42', '2019-09-17 01:14:42'),
(622, 2, 374, 'В процессе', '2019-09-17 01:15:08', '2019-09-17 01:15:08'),
(623, 1, 371, 'Active deal', '2019-09-17 01:15:35', '2019-09-17 01:15:35'),
(624, 1, 372, 'Processed', '2019-09-17 01:15:51', '2019-09-17 01:15:51'),
(625, 1, 374, 'In processing', '2019-09-17 01:16:12', '2019-09-17 01:16:12'),
(626, 1, 375, 'Order', '2019-09-17 01:17:54', '2019-09-17 01:17:54'),
(627, 1, 376, 'Output', '2019-09-17 01:18:32', '2019-09-17 01:18:32'),
(628, 2, 375, 'Заказ', '2019-09-17 01:18:56', '2019-09-17 01:18:56'),
(629, 2, 376, 'Вывод', '2019-09-17 01:19:14', '2019-09-17 01:19:14'),
(630, 1, 377, 'Transaction Information', '2019-09-17 10:16:23', '2019-09-17 10:41:05'),
(631, 1, 378, 'Operation number', '2019-09-17 10:17:00', '2019-09-17 10:41:32'),
(632, 1, 379, 'Operation data', '2019-09-17 10:17:34', '2019-09-17 10:41:41'),
(633, 1, 380, 'Description', '2019-09-17 10:18:04', '2019-09-17 10:41:54'),
(634, 1, 381, 'Output', '2019-09-17 10:18:37', '2019-09-17 10:42:02'),
(635, 1, 382, 'Withdrawal Request', '2019-09-17 10:19:23', '2019-09-17 10:42:11'),
(636, 1, 383, 'Order', '2019-09-17 10:19:57', '2019-09-17 10:42:18'),
(637, 1, 384, 'Active', '2019-09-17 10:20:52', '2019-09-17 10:42:25');
INSERT INTO `lang_index_translations` (`id`, `lang_id`, `structure_id`, `name`, `created_at`, `updated_at`) VALUES
(638, 1, 385, 'Return', '2019-09-17 10:21:31', '2019-09-17 10:42:32'),
(639, 1, 386, 'Paid', '2019-09-17 10:23:37', '2019-09-17 10:42:33'),
(640, 1, 387, 'Not paid', '2019-09-17 10:24:03', '2019-09-17 10:42:47'),
(641, 1, 388, 'In processing', '2019-09-17 10:25:17', '2019-09-17 10:42:48'),
(642, 1, 390, 'Closed', '2019-09-17 10:26:19', '2019-09-17 10:43:03'),
(643, 1, 389, 'Processed', '2019-09-17 10:26:36', '2019-09-17 10:42:55'),
(644, 1, 391, 'Order number', '2019-09-17 10:27:19', '2019-09-17 10:43:10'),
(645, 1, 392, 'Payment system', '2019-09-17 10:28:21', '2019-09-17 10:43:17'),
(646, 1, 393, 'Transaction status', '2019-09-17 10:29:09', '2019-09-17 10:43:32'),
(647, 1, 394, 'External transaction', '2019-09-17 10:29:56', '2019-09-17 10:43:33'),
(648, 2, 377, 'Информация об операции', '2019-09-17 10:36:06', '2019-09-17 10:36:06'),
(649, 2, 378, 'Номер операции', '2019-09-17 10:37:01', '2019-09-17 10:37:01'),
(650, 2, 379, 'Дата операции', '2019-09-17 10:37:15', '2019-09-17 10:37:15'),
(651, 2, 380, 'Описание', '2019-09-17 10:37:23', '2019-09-17 10:37:23'),
(652, 2, 381, 'Вывод', '2019-09-17 10:37:30', '2019-09-17 10:37:30'),
(653, 2, 382, 'Заявка на вывод', '2019-09-17 10:37:32', '2019-09-17 10:37:32'),
(654, 2, 383, 'Заказ', '2019-09-17 10:37:40', '2019-09-17 10:37:40'),
(655, 2, 384, 'Активная', '2019-09-17 10:37:41', '2019-09-17 10:37:41'),
(656, 2, 385, 'Возврат', '2019-09-17 10:37:54', '2019-09-17 10:37:54'),
(657, 2, 386, 'Оплачено', '2019-09-17 10:37:55', '2019-09-17 10:37:55'),
(658, 2, 387, 'Не оплачено', '2019-09-17 10:38:22', '2019-09-17 10:38:22'),
(659, 2, 388, 'В обработке', '2019-09-17 10:38:29', '2019-09-17 10:38:29'),
(660, 2, 389, 'Обработано', '2019-09-17 10:38:36', '2019-09-17 10:38:36'),
(661, 2, 390, 'Закрытая', '2019-09-17 10:38:43', '2019-09-17 10:38:43'),
(662, 2, 391, 'Номер заказа', '2019-09-17 10:38:44', '2019-09-17 10:38:44'),
(663, 2, 392, 'Платежная система', '2019-09-17 10:38:52', '2019-09-17 10:38:52'),
(664, 2, 393, 'Статус операции', '2019-09-17 10:39:00', '2019-09-17 10:39:00'),
(665, 2, 394, 'Внешняя транзакция', '2019-09-17 10:39:01', '2019-09-17 10:39:01'),
(666, 2, 395, 'Выдача наличных', '2019-09-17 10:52:05', '2019-09-17 10:52:05'),
(667, 1, 395, 'Сash withdrawal', '2019-09-17 10:55:49', '2019-09-17 10:55:49'),
(668, 2, 397, 'Сервер', '2019-09-17 11:01:44', '2019-09-17 11:01:44'),
(669, 2, 398, 'Цена за', '2019-09-17 11:02:37', '2019-09-17 11:02:37'),
(670, 2, 399, 'Наличие', '2019-09-17 11:03:17', '2019-09-17 11:03:17'),
(671, 1, 397, 'Server', '2019-09-17 11:06:53', '2019-09-17 11:06:53'),
(672, 1, 398, 'Price for', '2019-09-17 11:07:14', '2019-09-17 11:07:14'),
(673, 1, 399, 'Availability', '2019-09-17 11:07:36', '2019-09-17 11:07:36'),
(674, 1, 400, 'Lots', '2019-09-17 11:15:11', '2019-09-17 11:15:11'),
(675, 2, 400, 'Лоты', '2019-09-17 11:15:38', '2019-09-17 11:15:38'),
(676, 2, 401, 'Вид', '2019-09-17 11:16:38', '2019-09-17 11:16:38'),
(677, 2, 402, 'Позитивный', '2019-09-17 11:17:28', '2019-09-17 11:17:28'),
(678, 2, 403, 'Негативный', '2019-09-17 11:17:56', '2019-09-17 11:17:56'),
(679, 2, 404, 'Отправить', '2019-09-17 11:18:42', '2019-09-17 11:18:42'),
(680, 1, 401, 'View', '2019-09-17 11:20:26', '2019-09-17 11:20:26'),
(681, 1, 402, 'Positive', '2019-09-17 11:20:42', '2019-09-17 11:20:42'),
(682, 1, 403, 'Negative', '2019-09-17 11:20:59', '2019-09-17 11:20:59'),
(683, 1, 404, 'Send', '2019-09-17 11:21:45', '2019-09-17 11:21:45'),
(684, 1, 405, 'Seller', '2019-09-17 11:24:17', '2019-09-17 11:24:17'),
(685, 1, 406, 'Buyer', '2019-09-17 11:24:34', '2019-09-17 11:24:34'),
(686, 2, 407, 'Игра', '2019-09-17 11:25:39', '2019-09-17 11:25:39'),
(687, 2, 405, 'Продавец', '2019-09-17 11:25:56', '2019-09-17 11:25:56'),
(688, 2, 406, 'Покупатель', '2019-09-17 11:26:12', '2019-09-17 11:26:12'),
(689, 2, 408, 'Количество', '2019-09-17 11:27:06', '2019-09-17 11:27:06'),
(690, 2, 409, 'Тип', '2019-09-17 11:29:47', '2019-09-17 11:29:47'),
(691, 2, 410, 'Валюта', '2019-09-17 11:30:33', '2019-09-17 11:30:33'),
(692, 2, 411, 'шт', '2019-09-17 11:31:16', '2019-09-17 11:31:16'),
(693, 2, 412, 'Имя персонажа', '2019-09-17 11:32:04', '2019-09-17 11:32:04'),
(694, 2, 413, 'Открытая', '2019-09-17 11:33:14', '2019-09-17 11:33:14'),
(695, 2, 414, 'Ожидание оплаты', '2019-09-17 11:33:55', '2019-09-17 11:33:55'),
(696, 2, 415, 'Дополнительные опции', '2019-09-17 11:35:25', '2019-09-17 11:35:25'),
(697, 1, 407, 'Game', '2019-09-17 11:36:57', '2019-09-17 11:36:57'),
(698, 1, 408, 'Amount', '2019-09-17 11:37:16', '2019-09-17 11:37:16'),
(699, 1, 409, 'Type', '2019-09-17 11:37:34', '2019-09-17 11:37:34'),
(700, 1, 410, 'Currency', '2019-09-17 11:37:54', '2019-09-17 11:37:54'),
(701, 1, 411, 'thgs', '2019-09-17 11:38:12', '2019-09-17 11:38:12'),
(702, 1, 412, 'Character\'s name', '2019-09-17 11:38:37', '2019-09-17 11:38:37'),
(703, 1, 413, 'Open', '2019-09-17 11:38:56', '2019-09-17 11:38:56'),
(704, 1, 414, 'Waiting for payment', '2019-09-17 11:39:25', '2019-09-17 11:39:25'),
(705, 1, 415, 'Additional options', '2019-09-17 11:39:52', '2019-09-17 11:39:52'),
(706, 2, 416, 'Последние', '2019-09-17 11:48:16', '2019-09-17 11:48:16'),
(707, 2, 417, 'На сайте c', '2019-09-17 11:51:28', '2019-09-17 11:51:28'),
(708, 1, 417, 'On site', '2019-09-17 11:57:37', '2019-09-17 11:57:37'),
(709, 1, 416, 'Last', '2019-09-17 11:58:07', '2019-09-17 11:58:07'),
(710, 2, 418, 'Чат', '2019-09-17 11:59:58', '2019-09-17 11:59:58'),
(711, 2, 419, 'Показать ещё', '2019-09-17 12:00:27', '2019-09-17 12:00:27'),
(712, 2, 420, 'Введите сообщение', '2019-09-17 12:01:01', '2019-09-17 12:01:01'),
(713, 2, 421, 'Отправить', '2019-09-17 12:01:30', '2019-09-17 12:01:30'),
(714, 2, 422, 'Подтвердить заказ', '2019-09-17 12:02:08', '2019-09-17 12:02:08'),
(715, 2, 423, 'Вернуть деньги', '2019-09-17 12:02:51', '2019-09-17 12:02:51'),
(716, 1, 418, 'Chat', '2019-09-17 12:03:46', '2019-09-17 12:03:46'),
(717, 1, 419, 'Show more', '2019-09-17 12:04:18', '2019-09-17 12:04:18'),
(718, 1, 420, 'Enter message', '2019-09-17 12:04:41', '2019-09-17 12:04:41'),
(719, 1, 421, 'Send', '2019-09-17 12:04:53', '2019-09-17 12:04:53'),
(720, 1, 422, 'Confirm the order', '2019-09-17 12:05:10', '2019-09-17 12:05:10'),
(721, 1, 423, 'Return money', '2019-09-17 12:05:26', '2019-09-17 12:05:26'),
(722, 1, 424, 'You', '2019-09-17 12:06:59', '2019-09-17 12:07:15'),
(723, 1, 426, 'Currency', '2019-09-17 12:15:43', '2019-09-17 12:15:43'),
(724, 2, 425, 'Внутренный баланс', '2019-09-17 12:15:58', '2019-09-17 12:15:58'),
(725, 2, 428, 'Внутренный баланс', '2019-09-17 12:18:30', '2019-09-17 12:18:30'),
(726, 1, 428, 'Internal balance', '2019-09-17 12:19:02', '2019-09-17 12:19:02'),
(727, 2, 424, 'Вы', '2019-09-17 12:19:26', '2019-09-17 12:19:26'),
(728, 1, 429, 'Сurrency', '2019-09-17 12:20:00', '2019-09-17 12:20:00'),
(729, 2, 429, 'Валюта', '2019-09-17 12:20:15', '2019-09-17 12:20:15');

-- --------------------------------------------------------

--
-- Структура таблицы `lots`
--

CREATE TABLE `lots` (
  `id` int(10) UNSIGNED NOT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `game_id` int(10) UNSIGNED DEFAULT NULL,
  `owner_id` int(10) UNSIGNED DEFAULT NULL,
  `server_id` int(10) UNSIGNED DEFAULT NULL,
  `tag_id` int(10) UNSIGNED DEFAULT NULL,
  `price` double(20,3) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `availability` double(20,3) NOT NULL,
  `min_order` double(10,2) NOT NULL DEFAULT '0.00',
  `status` int(11) NOT NULL DEFAULT '1',
  `active` int(11) NOT NULL,
  `top` tinyint(1) DEFAULT NULL,
  `top_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `lots`
--

INSERT INTO `lots` (`id`, `currency_id`, `game_id`, `owner_id`, `server_id`, `tag_id`, `price`, `description`, `availability`, `min_order`, `status`, `active`, `top`, `top_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 20, 24, 5, 62, NULL, 10.000, NULL, 800.000, 100.00, 1, 1, NULL, NULL, '2018-09-01 09:55:17', '2019-08-21 09:11:03', NULL),
(2, 1, 1, 11, 1, NULL, 11.000, NULL, 114.000, 100.00, 1, 1, NULL, NULL, '2019-08-19 15:06:08', '2019-09-06 09:33:10', NULL),
(3, 1, 1, 11, 51, NULL, 114.000, NULL, 32313431.018, 100.00, 1, 1, NULL, NULL, '2019-08-19 15:58:14', '2019-09-12 10:58:17', NULL),
(4, NULL, 1, 11, 1, 2, 10.000, 'KOLCO', 64.000, 0.00, 1, 1, NULL, NULL, '2019-08-21 13:15:08', '2019-09-06 14:43:11', NULL),
(5, 1, 1, 11, 2, NULL, 12.000, NULL, 11251.000, 100.00, 1, 1, 1, '2019-09-17 15:47:49', '2019-08-27 11:08:00', '2019-09-16 15:48:17', NULL),
(6, 1, 1, 11, 3, NULL, 4.000, NULL, 11252.750, 100.00, 1, 1, NULL, NULL, '2019-08-27 11:08:00', '2019-09-12 11:09:30', NULL),
(7, 1, 1, 11, 52, NULL, 153.000, NULL, 12412.000, 100.00, 1, 1, NULL, NULL, '2019-08-27 11:08:00', '2019-09-06 09:33:10', NULL),
(8, 1, 1, 11, 80, NULL, 155.000, NULL, 12112.000, 100.00, 1, 1, NULL, NULL, '2019-08-27 11:08:00', '2019-09-06 09:33:10', NULL),
(9, 1, 1, 12, 1, NULL, 120.000, NULL, 989.717, 100.00, 1, 1, NULL, NULL, '2019-08-27 15:06:41', '2019-09-05 10:20:49', NULL),
(10, 1, 1, 12, 2, NULL, 121.000, NULL, 1000.000, 100.00, 1, 1, NULL, NULL, '2019-08-27 15:06:41', '2019-08-27 15:06:43', NULL),
(11, 1, 1, 12, 3, NULL, 130.000, NULL, 1000.000, 100.00, 1, 1, NULL, NULL, '2019-08-27 15:06:41', '2019-08-27 15:06:43', NULL),
(12, 1, 1, 12, 51, NULL, 110.000, NULL, 1000.000, 100.00, 1, 1, 1, '2019-09-17 15:45:49', '2019-08-27 15:06:41', '2019-09-16 15:45:53', NULL),
(13, 1, 1, 12, 52, NULL, 10.000, NULL, 935.400, 100.00, 1, 1, 1, '2019-09-19 15:42:29', '2019-08-27 15:06:42', '2019-09-16 15:41:34', NULL),
(14, 1, 1, 12, 80, NULL, 50.000, NULL, 1000.000, 100.00, 1, 1, NULL, NULL, '2019-08-27 15:06:42', '2019-08-27 15:06:43', NULL),
(15, NULL, 1, 12, 1, 1, 20000.000, 'lolkek4ebyrek', 1.000, 0.00, 1, 1, NULL, NULL, '2019-08-27 15:43:06', '2019-08-27 15:43:07', NULL),
(16, NULL, 1, 12, 1, 1, 34523.000, '23123123', 1.000, 0.00, 1, 1, NULL, NULL, '2019-08-27 15:43:39', '2019-08-27 15:43:40', NULL),
(17, NULL, 1, 12, 1, 1, 34234.000, '234234234', 1.000, 0.00, 1, 1, NULL, NULL, '2019-08-27 15:43:58', '2019-08-27 15:43:59', NULL),
(18, NULL, 1, 12, 1, 1, 21312.000, '12312312323', 1.000, 0.00, 1, 1, NULL, NULL, '2019-08-27 15:44:35', '2019-08-27 15:44:36', NULL),
(19, NULL, 1, 11, 1, 1, 4234234.000, '12312312433', 1.000, 0.00, 1, 1, NULL, NULL, '2019-08-27 15:45:24', '2019-08-27 15:45:25', NULL),
(20, NULL, 1, 11, 1, 1, 443223.000, '234234234', 1.000, 0.00, 1, 1, NULL, NULL, '2019-08-27 15:45:44', '2019-08-27 15:45:45', NULL),
(21, NULL, 1, 11, 1, 2, 324234.000, '234234', 324.000, 0.00, 1, 1, NULL, NULL, '2019-08-27 15:46:25', '2019-08-27 15:46:27', NULL),
(22, NULL, 1, 11, 1, 2, 12312.000, '1231234321', 3213.000, 0.00, 1, 1, NULL, NULL, '2019-08-27 15:47:06', '2019-08-27 15:47:07', NULL),
(23, NULL, 1, 11, 1, 2, 12334.000, '123123123123', 123123123.000, 0.00, 1, 1, NULL, NULL, '2019-08-27 15:48:37', '2019-08-27 15:48:38', NULL),
(24, NULL, 1, 11, 1, 3, 2000.000, '123123123', 1.000, 0.00, 1, 1, NULL, NULL, '2019-08-27 15:48:58', '2019-08-27 15:48:58', NULL),
(25, NULL, 1, 11, 1, 3, 12333.000, '33332113', 1.000, 0.00, 1, 1, NULL, NULL, '2019-08-27 15:49:15', '2019-08-27 15:49:15', NULL),
(26, NULL, 1, 11, 1, 3, 3323.000, '10lvl', 1.000, 0.00, 1, 1, NULL, NULL, '2019-08-27 15:49:39', '2019-08-27 15:49:39', NULL),
(27, NULL, 1, 12, 1, 3, 200.000, '123123', 1.000, 0.00, 1, 1, NULL, NULL, '2019-08-27 15:51:26', '2019-08-27 15:51:27', NULL),
(28, NULL, 1, 12, 1, 3, 321.000, '3123123', 1.000, 0.00, 1, 1, NULL, NULL, '2019-08-27 15:51:41', '2019-08-27 15:51:41', NULL),
(29, NULL, 1, 12, 1, 3, 333.000, '32131', 1.000, 0.00, 1, 1, NULL, NULL, '2019-08-27 15:51:53', '2019-08-27 15:51:54', NULL),
(30, NULL, 1, 12, 1, 2, 123.000, '123', 113.000, 0.00, 1, 1, NULL, NULL, '2019-08-27 15:54:11', '2019-09-06 09:25:32', NULL),
(31, NULL, 1, 12, 51, 2, 1232.000, '123', 1231.000, 0.00, 1, 1, NULL, NULL, '2019-08-27 15:54:30', '2019-08-27 15:54:31', NULL),
(32, NULL, 1, 12, 3, 2, 123.000, '123', 222.000, 0.00, 1, 1, NULL, NULL, '2019-08-27 15:54:57', '2019-08-27 15:54:58', NULL),
(33, NULL, 1, 12, 80, 2, 2000.000, '123', 17.000, 0.00, 1, 1, NULL, NULL, '2019-08-27 15:55:32', '2019-08-27 15:55:33', NULL),
(34, 1, 1, 2, 1, NULL, 23123.000, NULL, 123123.000, 100.00, 1, 1, NULL, NULL, '2019-09-04 13:47:21', '2019-09-04 13:47:23', NULL),
(35, 1, 1, 3, 1, NULL, 123123.000, NULL, 123123.000, 100.00, 1, 1, NULL, NULL, '2019-09-04 13:48:33', '2019-09-04 13:48:36', NULL),
(36, 1, 1, 4, 1, NULL, 1231231.000, NULL, 123123123.000, 100.00, 1, 1, NULL, NULL, '2019-09-04 13:49:25', '2019-09-04 13:49:27', NULL),
(37, 1, 1, 5, 1, NULL, 123123.000, NULL, 123123.000, 100.00, 1, 1, NULL, NULL, '2019-09-04 13:50:11', '2019-09-04 13:50:13', NULL),
(38, 1, 1, 6, 1, NULL, 1231231.000, NULL, 12312313123.000, 100.00, 1, 1, NULL, NULL, '2019-09-04 13:51:06', '2019-09-04 13:51:14', NULL),
(39, 1, 1, 7, 1, NULL, 123123123.000, NULL, 1231231231.000, 100.00, 1, 1, NULL, NULL, '2019-09-04 13:52:06', '2019-09-04 13:52:08', NULL),
(40, 1, 1, 10, 1, NULL, 123123.000, NULL, 123123123.000, 100.00, 1, 1, NULL, NULL, '2019-09-04 13:54:10', '2019-09-04 13:54:12', NULL),
(41, 1, 1, 1, 1, NULL, 123123.000, NULL, 12312312.000, 100.00, 1, 1, NULL, NULL, '2019-09-04 14:00:20', '2019-09-04 14:00:22', NULL),
(42, 1, 1, 14, 1, NULL, 12312.000, NULL, 123123.000, 100.00, 1, 1, NULL, NULL, '2019-09-04 14:08:24', '2019-09-04 14:08:25', NULL),
(43, 1, 1, 15, 1, NULL, 123123.000, NULL, 123123.000, 100.00, 1, 1, NULL, NULL, '2019-09-04 14:09:24', '2019-09-04 14:09:26', NULL),
(44, 1, 1, 16, 1, NULL, 123123.000, NULL, 123123.000, 100.00, 1, 1, NULL, NULL, '2019-09-04 14:13:00', '2019-09-04 14:13:05', NULL),
(45, 1, 30, 1, 81, NULL, 11.000, NULL, 123123123123.000, 100.00, 1, 1, NULL, NULL, '2019-09-13 12:57:39', '2019-09-13 12:57:41', NULL),
(46, NULL, 30, 1, 81, 3, 11.000, 'fasdfasdfadfasdfsdf', 1.000, 0.00, 1, 1, NULL, NULL, '2019-09-13 12:58:38', '2019-09-13 12:58:40', NULL),
(47, NULL, 30, 1, 81, 2, 1.000, 'qweqwedq', 111.000, 0.00, 1, 1, NULL, NULL, '2019-09-13 12:59:08', '2019-09-13 12:59:10', NULL),
(48, NULL, 30, 1, 81, 1, 23.000, '1eqwedqw', 1.000, 0.00, 1, 1, NULL, NULL, '2019-09-13 12:59:35', '2019-09-13 12:59:36', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `lot_sub_tags`
--

CREATE TABLE `lot_sub_tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `lot_id` int(10) UNSIGNED NOT NULL,
  `sub_tag_id` int(10) UNSIGNED NOT NULL,
  `sub_tag_value_id` int(10) UNSIGNED DEFAULT NULL,
  `other_value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `lot_sub_tags`
--

INSERT INTO `lot_sub_tags` (`id`, `lot_id`, `sub_tag_id`, `sub_tag_value_id`, `other_value`, `created_at`, `updated_at`) VALUES
(1, 4, 17, 79, NULL, '2019-08-21 13:15:08', '2019-08-21 13:15:08'),
(2, 4, 36, 182, NULL, '2019-08-21 13:15:08', '2019-08-21 13:15:08'),
(3, 15, 40, 246, NULL, '2019-08-27 15:43:06', '2019-08-27 15:43:06'),
(4, 15, 41, 287, NULL, '2019-08-27 15:43:06', '2019-08-27 15:43:06'),
(5, 16, 40, 251, NULL, '2019-08-27 15:43:39', '2019-08-27 15:43:39'),
(6, 16, 41, 281, NULL, '2019-08-27 15:43:39', '2019-08-27 15:43:39'),
(7, 17, 40, 247, NULL, '2019-08-27 15:43:58', '2019-08-27 15:43:58'),
(8, 17, 41, 283, NULL, '2019-08-27 15:43:59', '2019-08-27 15:43:59'),
(9, 18, 40, 248, NULL, '2019-08-27 15:44:35', '2019-08-27 15:44:35'),
(10, 18, 41, 283, NULL, '2019-08-27 15:44:36', '2019-08-27 15:44:36'),
(11, 19, 40, 248, NULL, '2019-08-27 15:45:25', '2019-08-27 15:45:25'),
(12, 19, 41, 283, NULL, '2019-08-27 15:45:25', '2019-08-27 15:45:25'),
(13, 20, 40, 251, NULL, '2019-08-27 15:45:44', '2019-08-27 15:45:44'),
(14, 20, 41, 280, NULL, '2019-08-27 15:45:44', '2019-08-27 15:45:44'),
(15, 21, 17, 78, NULL, '2019-08-27 15:46:25', '2019-08-27 15:46:25'),
(16, 21, 23, 102, NULL, '2019-08-27 15:46:25', '2019-08-27 15:46:25'),
(17, 21, 37, 187, NULL, '2019-08-27 15:46:26', '2019-08-27 15:46:26'),
(18, 21, 25, 218, NULL, '2019-08-27 15:46:26', '2019-08-27 15:46:26'),
(19, 21, 32, 143, NULL, '2019-08-27 15:46:26', '2019-08-27 15:46:26'),
(20, 21, 35, 177, NULL, '2019-08-27 15:46:26', '2019-08-27 15:46:26'),
(21, 22, 17, 79, NULL, '2019-08-27 15:47:06', '2019-08-27 15:47:06'),
(22, 22, 36, 182, NULL, '2019-08-27 15:47:06', '2019-08-27 15:47:06'),
(23, 23, 17, 67, NULL, '2019-08-27 15:48:37', '2019-08-27 15:48:37'),
(24, 23, 18, 97, NULL, '2019-08-27 15:48:37', '2019-08-27 15:48:37'),
(25, 23, 27, 154, NULL, '2019-08-27 15:48:37', '2019-08-27 15:48:37'),
(26, 23, 30, 136, NULL, '2019-08-27 15:48:37', '2019-08-27 15:48:37'),
(27, 24, 52, 345, NULL, '2019-08-27 15:48:58', '2019-08-27 15:48:58'),
(28, 25, 52, 346, NULL, '2019-08-27 15:49:15', '2019-08-27 15:49:15'),
(29, 26, 52, 345, NULL, '2019-08-27 15:49:39', '2019-08-27 15:49:39'),
(30, 27, 52, 345, NULL, '2019-08-27 15:51:26', '2019-08-27 15:51:26'),
(31, 28, 52, 346, NULL, '2019-08-27 15:51:41', '2019-08-27 15:51:41'),
(32, 29, 52, 347, NULL, '2019-08-27 15:51:53', '2019-08-27 15:51:53'),
(33, 30, 17, 79, NULL, '2019-08-27 15:54:12', '2019-08-27 15:54:12'),
(34, 30, 36, 182, NULL, '2019-08-27 15:54:12', '2019-08-27 15:54:12'),
(35, 31, 17, 79, NULL, '2019-08-27 15:54:31', '2019-08-27 15:54:31'),
(36, 31, 36, 183, NULL, '2019-08-27 15:54:31', '2019-08-27 15:54:31'),
(37, 32, 17, 68, NULL, '2019-08-27 15:54:57', '2019-08-27 15:54:57'),
(38, 32, 29, 165, NULL, '2019-08-27 15:54:57', '2019-08-27 15:54:57'),
(39, 32, 34, 171, NULL, '2019-08-27 15:54:57', '2019-08-27 15:54:57'),
(40, 33, 17, 78, NULL, '2019-08-27 15:55:32', '2019-08-27 15:55:32'),
(41, 33, 23, 101, NULL, '2019-08-27 15:55:32', '2019-08-27 15:55:32'),
(42, 33, 25, 220, NULL, '2019-08-27 15:55:33', '2019-08-27 15:55:33'),
(43, 33, 32, 145, NULL, '2019-08-27 15:55:33', '2019-08-27 15:55:33'),
(44, 33, 35, 177, NULL, '2019-08-27 15:55:33', '2019-08-27 15:55:33');

-- --------------------------------------------------------

--
-- Структура таблицы `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2017-09-14 06:07:06', '2017-09-14 06:07:06'),
(2, 'user', '2017-10-20 07:23:35', '2017-10-20 07:25:55'),
(3, 'help', '2017-10-20 07:36:26', '2017-10-20 07:36:26');

-- --------------------------------------------------------

--
-- Структура таблицы `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '/admin', '_self', 'voyager-boat', NULL, NULL, 1, '2017-09-14 06:07:06', '2017-09-14 06:07:06', NULL, NULL),
(2, 1, 'Медиа', '/admin/media', '_self', 'voyager-images', '#000000', NULL, 7, '2017-09-14 06:07:06', '2019-08-13 14:27:48', NULL, ''),
(3, 1, 'Посты', '/admin/posts', '_self', 'voyager-news', '#000000', NULL, 9, '2017-09-14 06:07:06', '2019-08-13 14:27:49', NULL, ''),
(4, 1, 'Пользователи', '/admin/users', '_self', 'voyager-person', '#000000', NULL, 3, '2017-09-14 06:07:06', '2017-10-30 14:16:02', NULL, ''),
(5, 1, 'Категории', '/admin/categories', '_self', 'voyager-categories', '#000000', NULL, 11, '2017-09-14 06:07:06', '2019-08-13 14:27:50', NULL, ''),
(6, 1, 'Страницы', '/admin/pages', '_self', 'voyager-file-text', '#000000', NULL, 10, '2017-09-14 06:07:06', '2019-08-13 14:27:49', NULL, ''),
(7, 1, 'Роли', '/admin/roles', '_self', 'voyager-lock', '#000000', NULL, 2, '2017-09-14 06:07:06', '2017-10-30 14:15:31', NULL, ''),
(8, 1, 'Инструменты', '', '_self', 'voyager-tools', '#000000', NULL, 13, '2017-09-14 06:07:06', '2019-08-13 14:49:07', NULL, ''),
(9, 1, 'Свойства меню', '/admin/menus', '_self', 'voyager-list', '#000000', 8, 1, '2017-09-14 06:07:06', '2017-10-30 14:20:15', NULL, ''),
(10, 1, 'База даных', '/admin/database', '_self', 'voyager-data', '#000000', 8, 2, '2017-09-14 06:07:06', '2017-10-30 14:20:27', NULL, ''),
(11, 1, 'Настройки', '/admin/settings', '_self', 'voyager-settings', '#000000', NULL, 14, '2017-09-14 06:07:06', '2019-08-13 14:49:07', NULL, ''),
(12, 1, 'Игры', '/admin/games-list', '_self', 'voyager-controller', '#000000', 15, 2, '2017-09-19 04:19:43', '2019-08-19 13:03:40', NULL, ''),
(13, 1, 'Тег', '/admin/tags', '_self', 'voyager-tag', '#000000', 15, 4, '2017-09-20 02:27:02', '2019-08-19 13:03:40', NULL, ''),
(14, 1, 'Сервера', '/admin/servers', '_self', 'voyager-data', '#000000', 15, 3, '2017-09-20 08:32:23', '2019-08-19 13:03:40', NULL, ''),
(15, 1, 'Настройки игр', '', '_self', 'voyager-rocket', '#000000', NULL, 4, '2017-09-21 02:11:42', '2017-10-30 14:16:49', NULL, ''),
(16, 1, 'Игровая валюта', '/admin/currency', '_self', 'voyager-dollar', '#000000', 15, 5, '2017-09-21 02:13:20', '2019-08-19 13:03:40', NULL, ''),
(18, 1, 'Под теги', '/admin/sub-tags', '_self', 'voyager-list-add', '#000000', 15, 6, '2017-09-21 05:51:33', '2019-08-19 13:03:40', NULL, ''),
(19, 1, 'Лоты', '', '_self', 'voyager-receipt', '#000000', NULL, 5, '2017-10-03 02:49:53', '2017-10-30 14:18:33', NULL, ''),
(20, 1, 'Список лотов', '/admin/lots', '_self', 'voyager-window-list', '#000000', 19, 1, '2017-10-03 02:50:56', '2017-10-30 14:18:45', NULL, ''),
(21, 2, 'Мои продажи', '/sales', '_self', NULL, '#000000', NULL, 1, '2017-10-20 07:24:11', '2019-08-14 12:47:51', NULL, ''),
(22, 2, 'Мои покупки', '/purchases', '_self', NULL, '#000000', NULL, 2, '2017-10-20 07:24:36', '2019-08-14 12:47:51', NULL, ''),
(23, 2, 'Сообщения', '/chats', '_self', NULL, '#000000', NULL, 3, '2017-10-20 07:25:02', '2019-08-14 12:47:51', NULL, ''),
(24, 2, 'Кабинет', '/profile', '_self', NULL, '#000000', NULL, 4, '2017-10-20 07:25:17', '2019-08-14 12:47:52', NULL, ''),
(25, 3, 'Правила для продавцов', '/page/pravila-dlya-prodavcov', '_self', NULL, '#000000', NULL, 1, '2017-10-20 07:39:26', '2017-10-31 10:24:53', NULL, ''),
(26, 3, 'Разрешение споров', '/page/razreshenie-sporov', '_self', NULL, '#000000', 28, 1, '2017-10-20 07:39:54', '2017-10-31 10:25:01', NULL, ''),
(27, 3, 'Вопросы и ответы', '/page/voprosy-i-otvety', '_self', NULL, '#000000', NULL, 3, '2017-10-20 07:40:39', '2017-10-31 10:25:01', NULL, ''),
(29, 3, 'Разрешение споров', '/page/razreshenie-sporov', '_self', NULL, '#000000', NULL, 16, '2017-10-31 10:26:00', '2017-10-31 10:26:00', NULL, ''),
(30, 1, 'Комиссия', '/admin/commission', '_self', 'voyager-dollar', '#000000', 15, 7, '2018-03-12 14:16:06', '2019-08-19 13:03:40', NULL, NULL),
(31, 1, 'Чаты', '', '_self', 'voyager-chat', '#000000', NULL, 6, '2018-03-12 14:16:06', '2019-08-13 14:27:48', NULL, NULL),
(32, 1, 'Настройки чата', '/admin/chat-setting', '_self', 'voyager-params', '#000000', 31, 1, '2018-03-12 14:16:06', '2019-08-13 14:27:48', NULL, NULL),
(33, 1, 'Все чаты', '/admin/chat', '_self', 'voyager-megaphone', '#000000', 31, 3, '2018-03-12 14:16:06', '2019-08-13 14:27:48', NULL, NULL),
(34, 1, 'Сделки', '', '_self', 'voyager-chat', '#000000', NULL, 8, '2018-03-12 14:16:06', '2019-08-13 14:27:49', NULL, NULL),
(35, 1, 'Заявки на вывод', '/admin/payout', '_self', 'voyager-dollar', '#000000', 34, 1, '2018-03-12 14:16:06', '2019-08-13 14:27:49', NULL, NULL),
(36, 1, 'Все сделки', '/admin/trade', '_self', 'voyager-megaphone', '#000000', 34, 2, '2018-03-12 14:16:06', '2019-08-13 14:27:49', NULL, NULL),
(37, 1, 'Платежи', '/admin/invoice', '_self', 'voyager-dollar', '#000000', 34, 3, '2018-03-12 14:16:06', '2019-08-13 14:27:49', NULL, NULL),
(38, 1, 'Ключи (Платежных систем)', '/admin/site/wallet', '_self', 'voyager-settings', '#000000', 34, 4, '2018-03-12 14:16:06', '2019-08-13 14:27:49', NULL, NULL),
(39, 1, 'Комментарии', '/admin/comments', '_self', 'voyager-megaphone', '#000000', 31, 2, '2018-03-12 14:16:06', '2019-08-13 14:27:48', NULL, NULL),
(40, 1, 'Языки', '/admin/lang', '_self', 'voyager-font', '#000000', 41, 1, '2019-08-13 14:27:37', '2019-08-15 13:52:20', NULL, ''),
(41, 1, 'Настройки Языков', '', '_self', 'voyager-font', '#000000', NULL, 12, '2019-08-13 14:48:17', '2019-08-13 14:48:32', NULL, ''),
(42, 1, 'Добавить Язык', '/admin/lang/add-lang', '_self', 'voyager-list-add', '#000000', 41, 2, '2019-08-13 14:50:13', '2019-08-13 14:50:24', NULL, ''),
(43, 1, 'Категории', '/admin/categories', '_self', 'voyager-categories', '#000000', 15, 1, '2019-08-19 13:03:29', '2019-08-19 13:03:40', NULL, '');

-- --------------------------------------------------------

--
-- Структура таблицы `messages`
--

CREATE TABLE `messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `from` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `to` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` datetime NOT NULL,
  `is_read` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_01_01_000000_create_pages_table', 1),
(6, '2016_01_01_000000_create_posts_table', 1),
(7, '2016_02_15_204651_create_categories_table', 1),
(8, '2016_05_19_173453_create_menu_table', 1),
(9, '2016_10_21_190000_create_roles_table', 1),
(10, '2016_10_21_190000_create_settings_table', 1),
(11, '2016_11_30_135954_create_permission_table', 1),
(12, '2016_11_30_141208_create_permission_role_table', 1),
(13, '2016_12_26_201236_data_types__add__server_side', 1),
(14, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(15, '2017_01_14_005015_create_translations_table', 1),
(16, '2017_01_15_000000_add_permission_group_id_to_permissions_table', 1),
(17, '2017_01_15_000000_create_permission_groups_table', 1),
(18, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(19, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(20, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(21, '2017_09_14_121916_add_fields_to_users', 1),
(22, '2017_09_18_104703_block_ip', 1),
(23, '2017_09_19_113914_games_table', 1),
(24, '2017_09_19_135217_sms_code_table', 1),
(25, '2017_09_20_081312_tags_table', 1),
(26, '2017_09_20_082304_game_tags_table', 1),
(27, '2017_09_20_143657_server_table', 1),
(28, '2017_09_21_081447_currency_table', 1),
(29, '2017_09_21_082438_game_currency_table', 1),
(30, '2017_09_21_102818_sub_tags_table', 1),
(31, '2017_09_21_102920_tag_sub_tag_table', 1),
(32, '2017_09_21_130515_sub_tag_metadata_table', 1),
(33, '2017_09_21_130806_subTag_subTagMetadata_table', 1),
(34, '2017_09_25_074551_lots_table', 1),
(35, '2017_09_27_141543_lot_sub_tags', 1),
(36, '2017_10_03_141508_chat_table', 1),
(37, '2017_10_05_133932_dialog_table', 1),
(38, '2017_10_06_102044_dialog_participants', 1),
(40, '2017_12_01_152000_payment_histories', 1),
(41, '2018_01_10_101120_create_messages_table', 1),
(42, '2018_01_11_135304_create_price_commissions_table', 1),
(43, '2018_01_31_172434_create_reviews_table', 1),
(44, '2018_02_22_143711_create_user_wallets_table', 1),
(45, '2018_03_12_124017_create_chat_settings_table', 1),
(46, '2018_03_20_183108_create_site_wallets_table', 1),
(47, '2018_04_12_112242_create_invoices_table', 1),
(48, '2018_05_12_171053_create_payouts_table', 1),
(49, '2018_06_26_140132_create_admin_passwords_table', 1),
(50, '2018_07_10_202307_create_chat_disputs_table', 1),
(52, '2019_08_13_152936_create_langs_table', 2),
(58, '2019_08_13_163759_create_lang_structures_table', 3),
(59, '2019_08_13_172212_create_lang_global_structures_table', 3),
(60, '2019_08_15_170011_create_lang_index_names_table', 4),
(61, '2019_08_15_170051_create_lang_index_structures_table', 4),
(63, '2019_08_15_170135_create_lang_index_translations_table', 5),
(66, '2019_08_22_121006_create_game_custom_params_table', 6);

-- --------------------------------------------------------

--
-- Структура таблицы `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Вопросы и ответы', NULL, '<h3>Как происходит покупка на PlayZo?</h3>\r\n<p>&nbsp; Покупка проходит в несколько этапов:</p>\r\n<p>&nbsp; &nbsp; 1. Покупатель выбирает нужное ему предложение, предварительно выбрав раздел с интересующими его услугами.</p>\r\n<p>&nbsp; &nbsp; 2. Связывается с продавцом, оговаривает условия сделки, оформляет заказ и производит оплату.</p>\r\n<p>&nbsp; &nbsp; 3. Продавец выполняет заказ и все свои обязательства.</p>\r\n<p>&nbsp; &nbsp; 4. Покупатель подтверждает выполнение заказа, нажав на кнопку \"Подтвердить заказ\" в разделе \"Мои покупки\".</p>\r\n<h3>Какие приемущества у PlayZo перед обычным магазинов или другими биржами?</h3>\r\n<p><strong>&nbsp; 1. Самая низкая цена на рынке.</strong></p>\r\n<p>Из-за&nbsp;высокой конкуренции на бирже, продавцы вынуждены всегда поддерживать оптимальные цены на те или иные услуги, постоянно проверяя цены конкурентов. Таким образом, общая цена постоянно падает и всегда есть отдельные предложения по более низкой цене, чем средне-рыночная.</p>\r\n<p><strong>&nbsp; 2. Возможность видеть последние сделки.</strong></p>\r\n<p>Если зайти на главную страницу сайта и промотать её вниз, то можно увидеть несколько последних подтверждённых сделок. Это даёт возможность быстро выбрать проверенного продавца, у которого буквально только была сделана успешная покупка.</p>\r\n<p><strong>&nbsp; 3. Честные и реальные отзывы.</strong></p>\r\n<p>Мы заинтересованы в том, что бы у наших посетителей не возникло ни единого сомнения в безопасности проведения сделок на нашей бирже. И ничто не может быть лучшим показателем надёжности продавца, чем отзывы о предыдущих сделках с ним. Мы так же тщательно следим за тем, чтобы все отзывы были от реальных покупателей, а не появлялись в результате \"накрутки\". \"Накрутка\" отзывов строго запрещена и может повлечь за собой блокировку аккаунта.</p>\r\n<p><strong>&nbsp; 4. Моментальная доставка.</strong></p>\r\n<p>Сделка проходит без посредника и покупатель на прямую связан с продавцом. Это позволяет продавцу моментально передать товар покупателю, т.к. не нужно задействовать различные склады посредников, как это работает в случае с обычнми магазинами.</p>\r\n<h3>Гарантирует ли PlayZo отсутствие санкций со стороны правообладателей?</h3>\r\n<p>&nbsp;</p>\r\n<p>Любой гарант-сервис, в том числе и PlayZo, гарантирует надёжность и безопасность сделки \"здесь и сейчас\". Не в наших силах уберечь кого-либо от последствий, если они вообще возможны.</p>\r\n<p>Все продавцы разные. У всех разные гарнтии и условия, в том числе и условия передачи (если речь о покупке предмета или игровой валюты). Советуем Вам больше обращать внимание на продавцов, которые зарегистрированы давно и на протяжении всего этого времени периодически имеют положительные отзывы. Это даёт понять, что продавец не просто выполнил заказ, но и после этого у покупателя не возникло никаких проблем.</p>\r\n<h3>Что делать, если покупатель/продавец не выполнил условия заказа в полном объёме или не выполнил их вовсе?</h3>\r\n<p>&nbsp;</p>\r\n<p>Если какая-либо из сторон считает, что сделка не выполнена,&nbsp;сразу же необходимо обратиться в арбитраж по этому поводу.</p>\r\n<p>Любые виды споров и инцидентов касательно проводимых сделок у нас на сайте, разрешает сервис арбитража PlayZo. Арбитраж так же несёт материальную ответственность за разрешение споров. Таким образом, если арбитраж допускает ошибку в разрешении спора, сервис PlayZo берёт на себя обязательства компенсировать как прямые, так и косвенные убытки, которые эта ошибка за собой повлекла.</p>', NULL, 'voprosy-i-otvety', NULL, NULL, 'INACTIVE', '2017-10-20 01:35:46', '2018-07-16 14:56:32'),
(2, 1, 'Разрешение споров', NULL, '<div class=\"c-text-content__wrap\">\r\n<p style=\"margin-bottom: 0cm;\"><span style=\"font-family: Arial, sans-serif;\"><span style=\"font-size: large;\"><strong>Арбитраж <span lang=\"en-US\">Playzo.ru</span></strong></span></span></p>\r\n<p style=\"margin-bottom: 0cm;\">&nbsp;</p>\r\n<p lang=\"ru-RU\" style=\"margin-bottom: 0cm; font-weight: normal;\"><span style=\"font-family: Arial, sans-serif;\"><span style=\"font-size: medium;\">Все участники сделок признают, что все сделки, которые они осуществляют на сайте <span lang=\"en-US\">playzo.ru </span>гарантируются и защищаются арбитражем сервиса. Вмешательство арбитража необходимо, если продавец и покупатель не могут разрешить спор самостоятельно. Обратиться в арбитраж может, как покупатель, так продавец. Оба участника спора для арбитража <span lang=\"en-US\">Playzo.ru </span>являются равными, арбитраж 3-я сторона и рассматривает спор с независимой точки зрения. </span></span></p>\r\n<p lang=\"ru-RU\" style=\"margin-bottom: 0cm; font-weight: normal;\">&nbsp;</p>\r\n<p lang=\"ru-RU\" style=\"margin-bottom: 0cm;\"><span style=\"font-family: Arial, sans-serif;\"><span style=\"font-size: medium;\"><strong>Как обратиться в арбитраж</strong></span></span></p>\r\n<p lang=\"ru-RU\" style=\"margin-bottom: 0cm;\">&nbsp;</p>\r\n<p lang=\"ru-RU\" style=\"margin-bottom: 0cm; font-weight: normal;\"><span style=\"font-family: Arial, sans-serif;\"><span style=\"font-size: medium;\">Для того чтоб начать арбитражное разбирательство, вам необходимо обратиться в чате к онлайн-консультанту (нижний правый угол сайта). Сообщить ему ваш ник на сайте <span lang=\"en-US\">playzo.ru </span>и номер сделки, который вы можете увидеть в разделе &laquo;мои покупки&raquo; или &laquo;мои продажи&raquo;, и изложить суть ваших претензий к другой стороне. </span></span></p>\r\n<p lang=\"ru-RU\" style=\"margin-bottom: 0cm; font-weight: normal;\">&nbsp;</p>\r\n<p lang=\"ru-RU\" style=\"margin-bottom: 0cm;\"><span style=\"font-family: Arial, sans-serif;\"><span style=\"font-size: medium;\"><strong>Как проходит арбитражное разбирательство</strong></span></span></p>\r\n<p lang=\"ru-RU\" style=\"margin-bottom: 0cm;\">&nbsp;</p>\r\n<p lang=\"ru-RU\" style=\"margin-bottom: 0cm; font-weight: normal;\"><span style=\"font-family: Arial, sans-serif;\"><span style=\"font-size: medium;\">После инициирования арбитражного дела, администрация <span lang=\"en-US\">playzo.ru </span>общается с обоими участниками процесса в системе чатов на сайте находящейся в разделе &laquo;сообщения&raquo;. </span></span></p>\r\n<p lang=\"ru-RU\" style=\"margin-bottom: 0cm; font-weight: normal;\">&nbsp;</p>\r\n<p lang=\"ru-RU\" style=\"margin-bottom: 0cm; font-weight: normal;\"><span style=\"font-family: Arial, sans-serif;\"><span style=\"font-size: medium;\">Если дело не очевидно для арбитража и его невозможно разрешить быстро, то арбитраж проводит идентификацию личностей участников процесса. Покупатель и продавец должны выслать на почту <span lang=\"en-US\"><a href=\"mailto:playzo@gmail.com\">playzo@gmail.com</a>&nbsp;&nbsp;</span>фотографию с паспортом в руках открытым на странице с ФИО и фотографией на фоне сайта <span lang=\"en-US\">playzo.ru. </span>В теме письма указать игровой ник и номер сделки, по которой идет арбитражный процесс. </span></span></p>\r\n<p lang=\"ru-RU\" style=\"margin-bottom: 0cm; font-weight: normal;\">&nbsp;</p>\r\n<p lang=\"ru-RU\" style=\"margin-bottom: 0cm; font-weight: normal;\"><span style=\"font-family: Arial, sans-serif;\"><span style=\"font-size: medium;\">Если кто-то из участников спора уклоняется от идентификации личности и (или) от ответов на вопросы арбитража, тем самым он дает право арбитражу вынести решение автоматически в пользу другой стороны. </span></span></p>\r\n<p lang=\"ru-RU\" style=\"margin-bottom: 0cm; font-weight: normal;\">&nbsp;</p>\r\n<p lang=\"ru-RU\" style=\"margin-bottom: 0cm; font-weight: normal;\"><span style=\"font-family: Arial, sans-serif;\"><span style=\"font-size: medium;\">На предоставление фотографии и ответы на вопросы арбитража участникам отводится 3 дня. </span></span></p>\r\n<p lang=\"ru-RU\" style=\"margin-bottom: 0cm; font-weight: normal;\">&nbsp;</p>\r\n<p lang=\"ru-RU\" style=\"margin-bottom: 0cm;\"><span style=\"font-family: Arial, sans-serif;\"><span style=\"font-size: medium;\"><strong>Вступление в силу решения арбитража </strong></span></span></p>\r\n<p lang=\"ru-RU\" style=\"margin-bottom: 0cm;\">&nbsp;</p>\r\n<p lang=\"ru-RU\" style=\"margin-bottom: 0cm; font-weight: normal;\"><span style=\"font-family: Arial, sans-serif;\"><span style=\"font-size: medium;\">Решение арбитража <span lang=\"en-US\">playzo.ru </span>вступает в силу с момента его оглашения обоим участникам спора. </span></span></p>\r\n</div>', NULL, 'razreshenie-sporov', NULL, NULL, 'ACTIVE', '2017-10-20 05:49:07', '2018-07-16 14:59:12'),
(3, 1, 'Правила для продавцов', 'tbody{\r\nborder:red 2px solid;\r\n}\r\ntd {\r\npadding: 10px;\r\nmargin-bottom: 20px;\r\n}', '<div class=\"c-rules__header\">&nbsp;</div>\r\n<p style=\"margin-bottom: 0.26cm; text-align: center;\"><strong><span style=\"color: #333333;\"><span style=\"font-family: \'Helvetica Neue\', Helvetica, Arial, sans-serif;\"><span style=\"font-size: 10pt;\"><strong>Уважаемые продавцы! Удобство и безопасность всех участников сделок является нашим главным приоритетом. Просьба внимательно отнестись к правилам нашего сайта!</strong></span></span></span></strong></p>\r\n<p style=\"margin-bottom: 0.26cm; text-align: center;\"><strong><span style=\"color: #333333;\"><span style=\"font-family: \'Helvetica Neue\', Helvetica, Arial, sans-serif;\"><span style=\"font-size: 10pt;\"><strong>Уровень санкций, которые выбирает наш сервис зависит от степени ущерба нанесенного покупателю или самому сервису, а также от репутации нарушителя. За повторные нарушения, как правило, санкции ужесточаются. </strong></span></span></span></strong></p>\r\n<p style=\"margin-bottom: 0.26cm; font-weight: normal;\"><br /><br /></p>\r\n<h2 class=\"western\" style=\"margin-top: 0.53cm; margin-bottom: 0.26cm; line-height: 110%; text-align: center;\"><span style=\"color: #333333;\"><span style=\"font-family: \'Helvetica Neue\', Helvetica, Arial, sans-serif;\"><span style=\"font-size: 22pt;\"><strong>Нарушения и санкции</strong></span></span></span></h2>\r\n<table style=\"height: 193px; padding: 8px; margin-left: auto; margin-right: auto;\" border=\"1\" width=\"642\" cellspacing=\"8\" cellpadding=\"8\">\r\n<tbody>\r\n<tr>\r\n<td style=\"width: 287px;\">\r\n<h6><strong>Нарушение</strong></h6>\r\n</td>\r\n<td style=\"width: 283px;\">\r\n<h6><strong>Санкции</strong></h6>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 287px;\">\r\n<h6>Попытка связаться с покупателем по любому типу связи, кроме как, через чат сервиса playzo.ru</h6>\r\n</td>\r\n<td style=\"width: 283px;\">\r\n<h6>Блокировка аккаунта от 10 суток до бессрочной. Если эти действия привели к ущербу покупателю или сервису &mdash; бессрочная блокировка аккаунта. Выплаты прекращаются на тот же срок.</h6>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 287px;\">\r\n<h6>Передача любых данных покупателя 3-м лицам.</h6>\r\n</td>\r\n<td style=\"width: 283px;\">\r\n<h6>Бессрочная блокировка аккаунта и прекращение выплат. Блокировка всех новых аккаунтов.</h6>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 287px;\">\r\n<h6>Продажа товара или услуги в несоответствующем разделе.</h6>\r\n</td>\r\n<td style=\"width: 283px;\">\r\n<h6>Удаление лотов и блокировка аккаунта на сутки. При повторном нарушении бессрочная блокировка.</h6>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 287px;\">\r\n<h6>Создание предложений с разных аккаунтов, принадлежащих одному продавцу. Дублирование лотов и т. п.</h6>\r\n</td>\r\n<td style=\"width: 283px;\">\r\n<h6>Удаление лотов. При повторных нарушениях блокировка аккаунта вплоть до бессрочной.</h6>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 287px;\">\r\n<h6>Создание фиктивных сделок с целью накрутки положительных отзывов.</h6>\r\n</td>\r\n<td style=\"width: 283px;\">\r\n<h6>Блокировка аккаунта на 7 дней и удаление всех отзывов и обнуление числа сделок.</h6>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 287px;\">\r\n<h6>Размещение лотов и длительное нахождение оффлайн (более 3 суток). Создание фейковых лотов (не реализация товаров указанных в лоте). Игнорирование сообщений покупателей, желающих купить лот.</h6>\r\n</td>\r\n<td style=\"width: 283px;\">\r\n<h6>Удаление лотов, при повторных нарушениях блокировка аккаунта от 2 дней до бессрочной.</h6>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 287px;\">\r\n<h6>Запрещено обсуждать с покупателями комиссии сервиса.</h6>\r\n</td>\r\n<td style=\"width: 283px;\">\r\n<h6>Блокировка аккаунта на 3-е суток.</h6>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 287px;\">\r\n<h6>Создание аккаунтов с похожими никами/аватарками уже существующих аккаунтов с целью мошенничества</h6>\r\n</td>\r\n<td style=\"width: 283px;\">\r\n<h6>Блокировка аккаунта.</h6>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p style=\"margin-bottom: 0.26cm;\">&nbsp;</p>\r\n<p style=\"margin-bottom: 0.26cm; text-align: center;\">_________________________________________________________________________________________________________________________________________</p>\r\n<p style=\"margin-bottom: 0.26cm;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Продажа товаров полученных нелегальным путем (брут, кардинг, взлом и т.д&nbsp; и т. п.) запрещено!&nbsp;</p>\r\n<div class=\"c-rules__footer text-center\"><a id=\"rules-btn\" class=\"btn btn_blue btn_upper btn_nowrap\" href=\"/confirm-rules\">Принять условия</a></div>', NULL, 'pravila-dlya-prodavcov', NULL, NULL, 'ACTIVE', '2017-10-20 05:53:45', '2018-07-13 11:49:37');

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('pilko.sw@gmail.com', 'c3c15d91e5a3dae41595c3a95465140bd1cf66b8', '2018-05-25 13:09:45');

-- --------------------------------------------------------

--
-- Структура таблицы `payment_histories`
--

CREATE TABLE `payment_histories` (
  `id` int(10) UNSIGNED NOT NULL,
  `money` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `payment_system` int(11) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `payouts`
--

CREATE TABLE `payouts` (
  `id` int(10) UNSIGNED NOT NULL,
  `wallet` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(10,2) DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `admin_id` int(10) UNSIGNED DEFAULT NULL,
  `payment_info` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `frozen` tinyint(1) NOT NULL DEFAULT '0',
  `confirm_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `payouts`
--

INSERT INTO `payouts` (`id`, `wallet`, `amount`, `user_id`, `currency_id`, `admin_id`, `payment_info`, `status`, `frozen`, `confirm_date`, `created_at`, `updated_at`) VALUES
(82, '41001672889783', 5.00, NULL, 3, 3, NULL, 1, 0, '2018-07-08 13:25:21', '2018-07-08 10:24:16', '2018-07-08 10:25:21');

-- --------------------------------------------------------

--
-- Структура таблицы `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `permission_group_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`, `permission_group_id`) VALUES
(1, 'browse_admin', NULL, '2017-09-14 06:07:06', '2017-09-14 06:07:06', NULL),
(2, 'browse_database', NULL, '2017-09-14 06:07:06', '2017-09-14 06:07:06', NULL),
(3, 'browse_media', NULL, '2017-09-14 06:07:06', '2017-09-14 06:07:06', NULL),
(4, 'browse_settings', NULL, '2017-09-14 06:07:06', '2017-09-14 06:07:06', NULL),
(5, 'browse_menus', 'menus', '2017-09-14 06:07:06', '2017-09-14 06:07:06', NULL),
(6, 'read_menus', 'menus', '2017-09-14 06:07:07', '2017-09-14 06:07:07', NULL),
(7, 'edit_menus', 'menus', '2017-09-14 06:07:07', '2017-09-14 06:07:07', NULL),
(8, 'add_menus', 'menus', '2017-09-14 06:07:07', '2017-09-14 06:07:07', NULL),
(9, 'delete_menus', 'menus', '2017-09-14 06:07:07', '2017-09-14 06:07:07', NULL),
(10, 'browse_pages', 'pages', '2017-09-14 06:07:07', '2017-09-14 06:07:07', NULL),
(11, 'read_pages', 'pages', '2017-09-14 06:07:07', '2017-09-14 06:07:07', NULL),
(12, 'edit_pages', 'pages', '2017-09-14 06:07:07', '2017-09-14 06:07:07', NULL),
(13, 'add_pages', 'pages', '2017-09-14 06:07:07', '2017-09-14 06:07:07', NULL),
(14, 'delete_pages', 'pages', '2017-09-14 06:07:07', '2017-09-14 06:07:07', NULL),
(15, 'browse_roles', 'roles', '2017-09-14 06:07:07', '2017-09-14 06:07:07', NULL),
(16, 'read_roles', 'roles', '2017-09-14 06:07:07', '2017-09-14 06:07:07', NULL),
(17, 'edit_roles', 'roles', '2017-09-14 06:07:07', '2017-09-14 06:07:07', NULL),
(18, 'add_roles', 'roles', '2017-09-14 06:07:07', '2017-09-14 06:07:07', NULL),
(19, 'delete_roles', 'roles', '2017-09-14 06:07:07', '2017-09-14 06:07:07', NULL),
(20, 'browse_users', 'users', '2017-09-14 06:07:07', '2017-09-14 06:07:07', NULL),
(21, 'read_users', 'users', '2017-09-14 06:07:07', '2017-09-14 06:07:07', NULL),
(22, 'edit_users', 'users', '2017-09-14 06:07:07', '2017-09-14 06:07:07', NULL),
(23, 'add_users', 'users', '2017-09-14 06:07:07', '2017-09-14 06:07:07', NULL),
(24, 'delete_users', 'users', '2017-09-14 06:07:07', '2017-09-14 06:07:07', NULL),
(25, 'browse_posts', 'posts', '2017-09-14 06:07:07', '2017-09-14 06:07:07', NULL),
(26, 'read_posts', 'posts', '2017-09-14 06:07:07', '2017-09-14 06:07:07', NULL),
(27, 'edit_posts', 'posts', '2017-09-14 06:07:07', '2017-09-14 06:07:07', NULL),
(28, 'add_posts', 'posts', '2017-09-14 06:07:07', '2017-09-14 06:07:07', NULL),
(29, 'delete_posts', 'posts', '2017-09-14 06:07:07', '2017-09-14 06:07:07', NULL),
(30, 'browse_categories', 'categories', '2017-09-14 06:07:07', '2017-09-14 06:07:07', NULL),
(31, 'read_categories', 'categories', '2017-09-14 06:07:07', '2017-09-14 06:07:07', NULL),
(32, 'edit_categories', 'categories', '2017-09-14 06:07:07', '2017-09-14 06:07:07', NULL),
(33, 'add_categories', 'categories', '2017-09-14 06:07:07', '2017-09-14 06:07:07', NULL),
(34, 'delete_categories', 'categories', '2017-09-14 06:07:07', '2017-09-14 06:07:07', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `permission_groups`
--

CREATE TABLE `permission_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `price_commissions`
--

CREATE TABLE `price_commissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keyword` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `operation_result` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coefficient` double(10,6) DEFAULT NULL,
  `site` double(5,2) DEFAULT NULL,
  `payment` double(5,2) DEFAULT NULL,
  `withdrawal` double(5,2) DEFAULT NULL,
  `other` double(5,2) DEFAULT NULL,
  `output_commission` double(5,2) NOT NULL DEFAULT '0.00',
  `priority` smallint(5) UNSIGNED DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `can_withdrawal` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `price_commissions`
--

INSERT INTO `price_commissions` (`id`, `title`, `keyword`, `operation_result`, `symbol`, `coefficient`, `site`, `payment`, `withdrawal`, `other`, `output_commission`, `priority`, `is_active`, `can_withdrawal`) VALUES
(1, 'Внутренный баланс', 'balance', NULL, '₽', 100.000000, 0.00, 0.00, 0.00, 0.00, 3.00, 1, 1, NULL),
(2, 'Банковская карта', 'card', NULL, '₽', 100.000000, 10.00, 0.00, 0.00, 0.00, 0.00, NULL, 1, NULL),
(3, 'Яндекс.Деньги', 'yandex_money', NULL, '₽', 100.000000, 11.00, 0.00, 0.00, 0.00, 0.00, NULL, 1, 1),
(4, 'Qiwi', 'qiwi', NULL, '₽', 100.000000, 14.00, 0.00, 0.00, 0.00, 1.00, NULL, 1, 1),
(5, 'МТС, Билайн, Мегафон', 'phone_operator', NULL, '₽', 100.000000, 2.00, 0.00, 4.00, 1.00, 1.00, NULL, 1, NULL),
(6, 'WebMoney WMR', 'wmr', NULL, 'WMR', 100.000000, 10.08, 0.80, 0.00, 0.00, 1.00, NULL, 1, 1),
(7, 'WebMoney WMZ', 'wmz', NULL, 'WMZ', 6321.000000, 2.00, 0.80, 2.00, 1.00, 1.00, NULL, 1, NULL),
(8, 'WebMoney WMU', 'wmu', NULL, 'WMU', 197.000000, 2.00, 0.80, 2.00, 1.00, 1.00, NULL, NULL, NULL),
(9, 'WebMoney WME', 'wme', NULL, 'WME', 7000.000000, 3.00, 0.80, 2.00, 0.00, 1.00, NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `reviews`
--

CREATE TABLE `reviews` (
  `id` int(10) UNSIGNED NOT NULL,
  `trade_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `seller_id` int(10) UNSIGNED NOT NULL,
  `mark` tinyint(1) DEFAULT NULL,
  `text` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `reviews`
--

INSERT INTO `reviews` (`id`, `trade_id`, `user_id`, `seller_id`, `mark`, `text`, `created_at`, `updated_at`) VALUES
(1, 8, 16, 11, 1, 'ahyenno', '2019-09-04 16:26:18', '2019-09-04 16:26:18'),
(2, 9, 16, 11, 0, 'гавно', '2019-09-04 16:27:34', '2019-09-04 16:27:34'),
(3, 25, 1, 11, 1, NULL, '2019-09-17 11:11:21', '2019-09-17 11:11:21');

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2017-09-14 06:07:06', '2017-09-14 06:07:06'),
(2, 'user', 'Normal User', '2017-09-14 06:07:06', '2017-09-14 06:07:06');

-- --------------------------------------------------------

--
-- Структура таблицы `servers`
--

CREATE TABLE `servers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `side` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `game_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `servers`
--

INSERT INTO `servers` (`id`, `name`, `side`, `game_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Airin', NULL, 1, '2018-03-07 19:03:35', '2018-05-24 12:41:47', NULL),
(2, 'BlackBird', NULL, 1, '2018-03-07 19:03:35', '2018-05-24 12:41:47', NULL),
(3, 'Estus', NULL, 1, '2018-03-07 19:03:35', '2018-05-24 12:41:47', NULL),
(4, 'Dota Steam', NULL, 2, '2018-03-07 19:03:35', '2018-05-24 12:38:05', '2018-05-24 12:38:05'),
(5, 'Fifa server 1', NULL, 3, '2018-03-07 19:03:35', '2018-05-24 12:38:15', '2018-05-24 12:38:15'),
(6, 'Fifa server 2', NULL, 3, '2018-03-07 19:03:35', '2018-05-24 12:38:15', '2018-05-24 12:38:15'),
(7, 'Fifa server 3', NULL, 3, '2018-03-07 19:03:35', '2018-05-24 12:38:15', '2018-05-24 12:38:15'),
(8, 'TESO server 1', NULL, 4, '2018-03-07 19:03:35', '2018-05-24 12:40:10', '2018-05-24 12:40:10'),
(9, 'TESO server 2', NULL, 4, '2018-03-07 19:03:35', '2018-05-24 12:40:10', '2018-05-24 12:40:10'),
(10, 'TESO server 3', 'Alliance', 4, '2018-03-07 19:03:35', '2018-05-24 12:40:10', '2018-05-24 12:40:10'),
(11, 'TESO server 4', 'Alliance', 4, '2018-03-07 19:03:35', '2018-05-24 12:40:10', '2018-05-24 12:40:10'),
(12, 'TESO server 5', NULL, 4, '2018-03-07 19:03:35', '2018-05-24 12:40:10', '2018-05-24 12:40:10'),
(13, 'TESO server 6', NULL, 4, '2018-03-07 19:03:35', '2018-05-24 12:40:10', '2018-05-24 12:40:10'),
(14, 'Aion server 1', NULL, 5, '2018-03-07 19:03:35', '2018-05-24 12:40:15', '2018-05-24 12:40:15'),
(15, 'Aion server 2', NULL, 5, '2018-03-07 19:03:35', '2018-05-24 12:40:15', '2018-05-24 12:40:15'),
(16, 'Aion server 3', NULL, 5, '2018-03-07 19:03:35', '2018-05-24 12:40:15', '2018-05-24 12:40:15'),
(17, 'ArcheAge server 1', NULL, 9, '2018-03-07 19:03:35', '2018-05-24 12:39:39', '2018-05-24 12:39:39'),
(18, 'ArcheAge server 2', NULL, 9, '2018-03-07 19:03:35', '2018-05-24 12:39:39', '2018-05-24 12:39:39'),
(19, '	Black Desert server 1', NULL, 10, '2018-03-07 19:03:35', '2018-05-24 12:39:29', '2018-05-24 12:39:29'),
(20, 'Hearthstone server 1', NULL, 11, '2018-03-07 19:03:35', '2018-05-24 12:38:59', '2018-05-24 12:38:59'),
(21, 'Hearthstone server 2', NULL, 11, '2018-03-07 19:03:35', '2018-05-24 12:38:59', '2018-05-24 12:38:59'),
(22, 'Hearthstone server 3', NULL, 11, '2018-03-07 19:03:35', '2018-05-24 12:38:59', '2018-05-24 12:38:59'),
(23, 'GTA 5 server 1', NULL, 12, '2018-03-07 19:03:35', '2018-05-24 12:39:24', '2018-05-24 12:39:24'),
(24, 'GTA 5 server 2', NULL, 12, '2018-03-07 19:03:35', '2018-05-24 12:39:24', '2018-05-24 12:39:24'),
(25, 'Gran Kain', NULL, 13, '2018-03-07 19:03:35', '2018-05-24 12:45:27', NULL),
(26, 'Shillien', NULL, 13, '2018-03-07 19:03:35', '2018-05-24 12:45:27', NULL),
(27, 'Einhasad', NULL, 13, '2018-03-07 19:03:35', '2018-05-24 12:45:27', NULL),
(28, 'Lineage 2 Classic server 4', NULL, 13, '2018-03-07 19:03:35', '2018-05-24 12:45:11', '2018-05-24 12:45:11'),
(29, 'Paagrio', NULL, 13, '2018-03-07 19:03:35', '2018-05-24 12:45:27', NULL),
(30, 'Lineage 2 Classic server 6', NULL, 13, '2018-03-07 19:03:35', '2018-05-24 12:45:14', '2018-05-24 12:45:14'),
(31, 'Первый сервер', 'Тьма', 14, '2018-03-07 23:10:10', '2018-05-24 12:39:14', '2018-05-24 12:39:14'),
(32, 'Второй сервер', 'тьма', 14, '2018-03-07 23:10:10', '2018-05-24 12:39:14', '2018-05-24 12:39:14'),
(33, 'Первый сервер', 'свет', 14, '2018-03-07 23:10:10', '2018-05-24 12:39:14', '2018-05-24 12:39:14'),
(34, 'Второй сервер', 'тьма', 14, '2018-03-07 23:10:10', '2018-05-24 12:39:14', '2018-05-24 12:39:14'),
(35, 'Первый сервер', 'огонь', 14, '2018-03-07 23:10:10', '2018-05-24 12:39:14', '2018-05-24 12:39:14'),
(36, 'Первый сервер', 'вода', 14, '2018-03-07 23:10:10', '2018-05-24 12:39:14', '2018-05-24 12:39:14'),
(37, 'Новый', NULL, 15, '2018-03-12 14:17:23', '2018-05-24 12:39:07', '2018-05-24 12:39:07'),
(38, 'Старый', NULL, 15, '2018-03-12 14:17:23', '2018-05-24 12:39:07', '2018-05-24 12:39:07'),
(39, 'Нейтральный', NULL, 15, '2018-03-12 14:17:23', '2018-05-24 12:39:07', '2018-05-24 12:39:07'),
(40, 'Свет', 'такоей', 18, '2018-03-12 14:25:51', '2018-05-24 12:39:20', '2018-05-24 12:39:20'),
(41, 'Темень', 'Такая то', 18, '2018-03-12 14:25:51', '2018-05-24 12:39:20', '2018-05-24 12:39:20'),
(42, 'Орион', NULL, 19, '2018-03-24 20:27:47', '2018-05-24 12:39:43', '2018-05-24 12:39:43'),
(43, 'Атлас', NULL, 19, '2018-03-24 20:27:47', '2018-05-24 12:39:43', '2018-05-24 12:39:43'),
(44, 'Вега', NULL, 19, '2018-03-24 20:27:47', '2018-05-24 12:39:43', '2018-05-24 12:39:43'),
(45, 'Тестосервер один', 'тьма', 20, '2018-03-28 10:38:40', '2018-05-24 12:38:22', '2018-05-24 12:38:22'),
(46, 'Тестосервер один', 'свет', 20, '2018-03-28 10:38:40', '2018-05-24 12:38:22', '2018-05-24 12:38:22'),
(47, 'Тестосервер один', 'сумерки', 20, '2018-03-28 10:38:40', '2018-05-24 12:38:22', '2018-05-24 12:38:22'),
(48, 'Тестосервер два', 'тьма', 20, '2018-03-28 10:38:40', '2018-05-24 12:38:22', '2018-05-24 12:38:22'),
(49, 'Тестосервер два', 'свет', 20, '2018-03-28 10:38:40', '2018-05-24 12:38:22', '2018-05-24 12:38:22'),
(50, 'Тестосервер два', 'сумерки', 20, '2018-03-28 10:38:40', '2018-05-24 12:38:22', '2018-05-24 12:38:22'),
(51, 'Elcardia', NULL, 1, '2018-05-24 12:41:47', '2018-05-24 12:41:47', NULL),
(52, 'Hatos', NULL, 1, '2018-05-24 12:41:47', '2018-05-24 12:41:47', NULL),
(53, 'Асгард', 'Асмодиане', 23, '2018-05-24 19:55:40', '2018-06-11 16:05:18', NULL),
(54, 'Атлас', NULL, 24, '2018-06-11 15:56:32', '2018-06-11 15:56:32', NULL),
(55, 'Гелиос', NULL, 24, '2018-06-11 15:56:32', '2018-06-11 15:56:32', NULL),
(56, 'Гидра', NULL, 24, '2018-06-11 15:56:32', '2018-06-11 15:56:32', NULL),
(57, 'Дракон', NULL, 24, '2018-06-11 15:56:32', '2018-06-11 15:56:32', NULL),
(58, 'Кассиопея', NULL, 24, '2018-06-11 15:56:32', '2018-06-11 15:56:32', NULL),
(59, 'Лисичка', NULL, 24, '2018-06-11 15:56:32', '2018-06-11 15:56:32', NULL),
(60, 'Мира', NULL, 24, '2018-06-11 15:56:32', '2018-06-11 15:56:32', NULL),
(61, 'Орион', NULL, 24, '2018-06-11 15:56:32', '2018-06-11 15:56:32', NULL),
(62, 'Цербер', NULL, 24, '2018-06-11 15:56:32', '2018-06-11 15:56:32', NULL),
(63, 'Электра', NULL, 24, '2018-06-11 15:56:32', '2018-06-11 15:56:32', NULL),
(64, 'Асгард', 'Элийцы', 23, '2018-06-11 16:05:18', '2018-06-11 16:05:18', NULL),
(65, 'Оберон', 'Асмодиане', 23, '2018-06-11 16:05:18', '2018-06-11 16:05:18', NULL),
(66, 'Оберон', 'Элийцы', 23, '2018-06-11 16:05:18', '2018-06-11 16:05:18', NULL),
(67, '(EU) Antriksha', 'Асмодиане (Asmodians)', 25, '2018-06-11 16:12:46', '2018-06-11 16:12:46', NULL),
(68, '(EU) Antriksha', 'Элийцы (Elyos)', 25, '2018-06-11 16:12:46', '2018-06-11 16:12:46', NULL),
(69, 'Barus', 'Асмодиане (Asmodians)', 25, '2018-06-11 16:12:46', '2018-06-11 16:12:46', NULL),
(70, 'Barus', 'Элийцы (Elyos)', 25, '2018-06-11 16:12:46', '2018-06-11 16:12:46', NULL),
(71, '(EU) Core+Ramona', NULL, 26, '2018-06-25 18:03:24', '2018-06-25 18:03:24', NULL),
(72, '(NA) Freya', NULL, 26, '2018-06-25 18:03:24', '2018-06-25 18:03:24', NULL),
(73, '(NA) Nain', NULL, 26, '2018-06-25 18:03:24', '2018-06-25 18:03:24', NULL),
(74, '(NA) Zaken', NULL, 26, '2018-06-25 18:03:24', '2018-06-25 18:03:24', NULL),
(75, '(NA) Chronos', NULL, 26, '2018-06-25 18:03:24', '2018-06-25 18:03:24', NULL),
(76, 'Нить Судьбы', 'Лига', 27, '2018-07-09 16:35:23', '2018-07-09 16:35:23', NULL),
(77, 'Нить Судьбы', 'Империя', 27, '2018-07-09 16:35:23', '2018-07-09 16:35:23', NULL),
(78, 'Сервер 2', 'Тьма', 28, '2018-07-21 21:16:38', '2018-07-21 21:17:48', NULL),
(79, 'Сервер 1', 'Свет', 28, '2018-07-21 21:17:10', '2018-07-21 21:17:48', NULL),
(80, 'Wowlol', NULL, 1, '2019-08-21 12:21:56', '2019-08-21 12:21:56', NULL),
(81, 'uwow.biz', 'asdasdasd', 30, '2019-09-13 12:12:37', '2019-09-13 12:12:37', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `site_wallets`
--

CREATE TABLE `site_wallets` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keyword` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wallet_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secret_key` text COLLATE utf8mb4_unicode_ci,
  `secret_password` text COLLATE utf8mb4_unicode_ci,
  `additional_field` text COLLATE utf8mb4_unicode_ci,
  `api_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `merchant_id` int(10) UNSIGNED DEFAULT NULL,
  `additional_field2` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `site_wallets`
--

INSERT INTO `site_wallets` (`id`, `title`, `keyword`, `wallet_key`, `secret_key`, `secret_password`, `additional_field`, `api_key`, `is_active`, `merchant_id`, `additional_field2`, `created_at`, `updated_at`) VALUES
(2, 'Free-Kassa', 'freekassa', '80001', 'eyJpdiI6IjhYNytOeTdkbEdzTUI4M0U2UGdFNGc9PSIsInZhbHVlIjoiXC9IVkZsTkVPdUdxWUxhWEhuTmpLUkE9PSIsIm1hYyI6ImM2NzY5ZWQ1YjJkN2Y3NjZlMzA0YTZkYzU3MTZjNTkwNTg3NmI0MGRiOGRkZGMzNmJkZTRlNTVkOTJhMmVhYWQifQ==', NULL, 'eyJpdiI6IkJRb3FCanRDcks3b0RWZDBRaE56Z2c9PSIsInZhbHVlIjoiSmtWeU5GV2VDMWdXajBzV3BsZ1lSQT09IiwibWFjIjoiYTRhMjZiNTc2NzE1NjY3NmFkMzZlNDdlZmFhZGIxYmJhNjgxMmY0Njg4N2EzZTgxOTMwNDI3Y2VhOWNkMzk3MCJ9', '80001', 1, NULL, NULL, '2018-04-13 09:21:55', '2018-07-18 15:29:13'),
(3, 'Webmoney WMR', 'wmr', 'R820253507708', NULL, NULL, NULL, 'dfg45sfgs415gf', 1, NULL, NULL, '2018-04-23 14:38:10', '2018-06-21 08:59:30'),
(4, 'Webmoney WMZ', 'wmz', 'Z092383241467', NULL, NULL, NULL, 'dfg45sfgs415gf2', 1, NULL, NULL, '2018-04-23 14:40:35', '2018-05-23 07:14:36'),
(5, 'Webmoney WMU', 'wmu', 'U240548140021', NULL, NULL, NULL, 'dfg45sfgs415gf3', 1, NULL, NULL, '2018-04-23 14:46:12', '2018-06-26 10:31:05'),
(6, 'Webmoney WME', 'wme', 'E839756246200', NULL, NULL, NULL, 'dfg45sfgs415gf4', 1, NULL, NULL, '2018-04-23 14:46:41', '2018-05-23 07:14:47'),
(7, 'Яндекс 1 кошелёк', 'yandex_money', '410014923133303', 'eyJpdiI6InFCUWFPZGVhQmMxVFpwUTJOT3hxOWc9PSIsInZhbHVlIjoieFB1U0JSXC8wM0gwYVpnQ2FVaFNqUVNRblVHa0VsUlhnQ0JUOFwvZXFHUWJpXC85UFJzc0tkaW93czhcL0grUTJEWFkwRUxVaVRkUkd5aEhjMXgxK1wvZUtjRmFiRVVPaXlOUzVKZTdMUTlYVHRvb0o1R201T0pcLzdiTnRnd0dWQ2Q3NHNDNzZoSzN5YUpvWnJpRWdMQVlpTWs4YWxGeEw4WDZUYStJY2ZTSmxVQzBwVlFOTjBaaWJXTWp2cWh1aXNiUDdyIiwibWFjIjoiNDg0MTcyZWZhNjdhZDhiNDBjOGY1ZmQ5MDFkZGJkNThhNDhkY2I5ZDBiMzY4YmMxZjk2Njg4MzYzNzkxNmZkZiJ9', 'eyJpdiI6ImE1ZWtGXC83aWlidzVsZGpVbmNUalZ3PT0iLCJ2YWx1ZSI6IkhsODNYTk11VFwvRTFSc25wdFFjdzV3PT0iLCJtYWMiOiJlNDFmZWUxOWFiNTY4OTk1YmRkZGZiNDFiNzhjNDFmMDU0ZWI2MDc3OWM1MjZlYTI2NTgzYWZiM2JiMjQwM2M5In0=', 'eyJpdiI6IkxYQkRCZWREdW5pOXZjTG1lMWh0Y2c9PSIsInZhbHVlIjoiT0Mrd3g0dkUwU1BBZWQyVzFoQ2gwZCs3OUpOdXhURlNJaDBrd3JOM3dJeUhwNkIySDVLNk1Kbmg4N0pDdzBUMSIsIm1hYyI6IjRkYTRkZjgwNzJkMGFmNzRkYTBjODU1YzcwNTYzZTY2OGZkNjU1OWZlNGJiMDQ5YTcwNTMyNTQxOWE5YjFkYzIifQ==', 'A9DF19984DD269C8088BA4DE07D04A897ECE802CA98F72BD285067F5CD3C40A3', 0, NULL, 'xXhVipy53alemPziSLUmxpxnGqZDsMpc7jxwJfS8nfaBKiiSc5ufMEvtiqmtUkZM', '2018-05-04 15:31:58', '2018-07-23 14:23:01'),
(8, 'QIWI (ID)', 'qiwi', '+79895225765', 'eyJpdiI6InY0Q3EyeGk3eGV5WmRiOG50QzZCS2c9PSIsInZhbHVlIjoiNHNFSnNvV2tNVHNnaFhEV2NDQWVKXC83YTZ2MVdwdE84T096UDZvRDUxQ3c9IiwibWFjIjoiN2Y2ZDc5MDVmNThiOTUwYjYzOWMyMDhiMjE0ZjUzNjI2MmQyNjQzYTRiNTQwZjUxYmFiMjE4Njc3NTczNmVlMSJ9', NULL, 'eyJpdiI6IjUyMlFIU3RJNW9MU3JlSzRRekl3ZWc9PSIsInZhbHVlIjoiWlZreVZpS0RTUDRmOHd4VHlYclRNQjY0TWRSeGNVRmhCbGRyWnN4cDQ0NnNpVEFsVDB6a2pqbFBWNlJSWkhCQSIsIm1hYyI6ImU2ZmJmZjYzODNkOGFlMjIxMjA2YmM1ZjkzMmE4NGE3NjQ4MTUxODM2ZjUwMTg1Nzc0MmU0ZGQ1MTc0YzExZDMifQ==', '87672961', 1, NULL, NULL, '2018-05-07 14:57:19', '2018-07-22 13:13:32'),
(9, 'WMR (Вывод)', 'wmr_out', 'R820253507708', 'eyJpdiI6IlkrVkRsd01cLzZqT2QycHJEWkRvT0R3PT0iLCJ2YWx1ZSI6ImZlSG5yK1NCV1l2VlN4SjJYOFpjdVE9PSIsIm1hYyI6IjZmNmVhZWQ3NDMzYmQzMmM2ZTgyMGMwMWRhNDBhZjhkODBkMmZkNTBlZTg1M2JmMjliY2YwYjViM2Q1NTdkMTAifQ==', NULL, NULL, '236312820801', 1, NULL, NULL, '2018-05-23 07:20:19', '2018-07-18 11:33:25'),
(11, 'Яндекс 2 кошелёк', 'yandex_money', '410017142403903', 'eyJpdiI6IjBUSjB2SjFKTGoySXZWZTVJSEwrNWc9PSIsInZhbHVlIjoiYndkNUhFZU0wbXF3a0QwUlVGNktBb0F5RVU5Rk12SUhoZXVMRXJNeGlsdUdwM25MTVwvT0VaMzBNbm1PSTdcL2RyTzRUWGZrK1BxZVwvXC9KaDVvZExjOUdRTE95b0lnTUptdVlzbGVnMEh3VFZWbml1V0VDb2VWblFTTmZsTVdFbFJzOTlHVEdnUDNCTEZhYmJCZUkybFdBek9xaThtVGRhNmlyWDBucjRHcU93K0M0bGU5dWUzK2dVOHJVQ3k1SFhUUyIsIm1hYyI6IjM1NjliNjVjOWNhMjFlMTIyZDJmNTc5OTI2NzQ4ODgwZjhlYTZjMDVhOGJiYzc3YjU4OTA1NTVmNGNmMDg0NjYifQ==', 'eyJpdiI6ImRqaXFaM2gyOWlJZW9nUFBNME8rQ2c9PSIsInZhbHVlIjoiM2NkTVRtbTRYXC83c01jRVExbmVKZjNcL1VWZ3pqRlp2UXE2Y2pqbXZXSTkxZEF3QmN2OENucndWSGp1OHJ4YkpuQ1F2RGxqWjNkYmlEckErejNlTUZmTTMrOGVnVmR3cStNK2JcL1l1QTlZQmNMemVPMXBIU1lLakZ5SkRzU1dUYUh0T2VhNzN1dzRJTEhlTHoxckxXalJOem9NSDVKME14eXh1emg1anRuMlwvbGFKNU9ZNDJZNE51Qis1XC95RFQrWjlMYUpIamQ4MlZzZUJwNjNhM1IxYlJ2UWhLemdvK1pEUHRtcHEwZEpLbVdMeFJlMzl3bTR3UmhwRjg2V2RoTkVBSnFDZmhUXC91ZlJJUXVIN2N6UjVzZUZkYmhMeWxvS1Q2XC9BOTU5alhOTm1PMllQU2MwcGpaY2ZHQnQxY0JNSEtOY0dtY0VBWXRIWkw0Q2t3R1lDUzNyK1BzQktsdGpvMlNQdFFPays1YTFla1BNT3R5UVp1UTVPUjdwNCszV09ZdyIsIm1hYyI6Ijk1OGE0M2QyOWM5OTU1MDc0NWU0MmY0ZGRlNzc2Nzg5Zjg1MGU1NWJmM2NiNzkyMTI2YjQ2NDg2MmNlNTVhMDkifQ==', 'eyJpdiI6IkU2b2JIb2FSVTluZEtQcnBOeDZodXc9PSIsInZhbHVlIjoiNnNNRTV1VGtYSzBvTU5EWXY3VFZiYkczdjFUQ3BocHlXb1gybUxtSlQ4cjNGZjhRb2owbUlIUzFXT215RXB1USIsIm1hYyI6ImIwMDA1MGRkNmUwMGE5NThiYWY1OGYzZDg1MjRjMDAwYzBlNzgzOTdmMWU5NTNmMTc0OGM2NzlmMTViYzU3NmIifQ==', 'EA9E0BCFB2B8FCAE7767271F95D589A67E4AF088C1CB337D528CD466B41643DE', 1, NULL, NULL, '2018-07-11 15:29:59', '2018-07-23 14:23:30');

-- --------------------------------------------------------

--
-- Структура таблицы `sms_codes`
--

CREATE TABLE `sms_codes` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `sms_codes`
--

INSERT INTO `sms_codes` (`id`, `code`, `phone`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, '5199', '968182526', '2018-05-07 16:45:11', '2018-05-07 16:45:11', NULL),
(3, '7261', '0968182526', '2018-05-07 16:46:15', '2018-05-07 16:46:35', '2018-05-07 16:46:35'),
(5, '8647', '380968182526', '2018-05-11 16:19:03', '2018-05-11 16:19:35', '2018-05-11 16:19:35'),
(6, '4995', '79646842504', '2018-05-11 18:25:55', '2018-05-11 18:30:29', '2018-05-11 18:30:29'),
(7, '7442', '3213123123', '2018-05-12 10:37:46', '2018-05-12 10:37:46', NULL),
(8, '7565', '1231233213', '2018-05-12 10:38:26', '2018-05-12 10:38:26', NULL),
(9, '6183', '380968182526', '2018-06-01 12:17:25', '2018-06-01 12:17:25', NULL),
(10, '2109', '79854691652', '2018-06-08 14:56:29', '2018-06-08 14:57:03', '2018-06-08 14:57:03'),
(11, '4177', '380672777859', '2018-06-13 16:07:37', '2018-06-13 16:07:51', '2018-06-13 16:07:51'),
(15, '2508', '380631996701', '2018-06-14 09:39:27', '2018-06-14 09:39:34', '2018-06-14 09:39:34'),
(16, '9573', '380660525134', '2018-06-14 13:50:45', '2018-06-14 13:50:45', NULL),
(17, '1688', '380660523154', '2018-06-14 13:52:36', '2018-06-14 13:54:06', '2018-06-14 13:54:06'),
(18, '2962', '380631288916', '2018-06-14 17:23:36', '2018-06-14 17:23:36', NULL),
(19, '3503', '380965207017', '2018-06-14 17:29:08', '2018-06-14 17:29:39', '2018-06-14 17:29:39'),
(20, '5108', '380672777859', '2018-07-04 17:55:05', '2018-07-04 17:55:20', '2018-07-04 17:55:20'),
(21, '3160', '380664429993', '2018-07-07 22:14:06', '2018-07-07 22:14:24', '2018-07-07 22:14:24'),
(22, '8645', '0936336842', '2018-09-01 09:52:33', '2018-09-01 09:52:57', '2018-09-01 09:52:57'),
(23, '5403', '', '2019-08-15 12:53:06', '2019-08-15 12:53:06', NULL),
(24, '6694', '380931137675', '2019-08-19 14:53:37', '2019-08-19 14:53:50', '2019-08-19 14:53:50'),
(25, '5470', '380979080926', '2019-08-27 15:03:47', '2019-08-27 15:04:05', '2019-08-27 15:04:05');

-- --------------------------------------------------------

--
-- Структура таблицы `sub_tags`
--

CREATE TABLE `sub_tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` int(11) DEFAULT NULL,
  `attach` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `sub_tags`
--

INSERT INTO `sub_tags` (`id`, `name`, `priority`, `attach`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Race', NULL, 0, '2017-09-22 05:28:01', '2018-05-25 17:55:08', '2018-05-25 17:55:08'),
(2, 'Equipment', NULL, 0, '2017-09-22 06:02:53', '2018-05-25 17:55:17', '2018-05-25 17:55:17'),
(3, 'sasasasasa', NULL, 0, '2017-09-22 09:25:49', '2017-09-23 05:27:07', '2017-09-23 05:27:07'),
(4, 'Level', NULL, 0, '2017-09-25 02:34:58', '2018-05-25 17:55:14', '2018-05-25 17:55:14'),
(5, 'Profession', NULL, 0, '2017-09-25 02:43:43', '2018-05-25 17:55:11', '2018-05-25 17:55:11'),
(6, 'Rang', NULL, 0, '2017-09-25 06:27:45', '2018-05-25 12:09:29', '2018-05-25 12:09:29'),
(7, 'Category', NULL, 0, '2017-09-25 06:28:38', '2018-05-25 17:55:20', '2018-05-25 17:55:20'),
(8, 'Тип', NULL, 0, '2017-09-25 09:07:40', '2017-09-25 09:20:26', '2017-09-25 09:20:26'),
(9, 'Тип', NULL, 0, '2017-09-25 09:20:44', '2017-09-25 09:20:53', '2017-09-25 09:20:53'),
(10, '12121212', NULL, 0, '2017-09-26 05:49:32', '2018-05-25 07:49:37', '2018-05-25 07:49:37'),
(11, '212121', NULL, 0, '2017-10-30 14:37:56', '2017-10-30 14:38:36', '2017-10-30 14:38:36'),
(12, 'Уровень', NULL, 0, '2018-05-25 07:54:54', '2018-05-25 17:55:05', '2018-05-25 17:55:05'),
(13, 'Категория', 10, 50, '2018-05-25 17:58:09', '2018-05-31 14:52:06', '2018-05-31 14:52:06'),
(14, 'Лавианроз', 1, 0, '2018-03-30 18:16:33', '2018-05-31 14:40:44', '2018-05-31 14:40:44'),
(15, 'Тип', 90, 47, '2018-05-30 10:25:59', '2018-05-31 14:40:32', '2018-05-31 14:40:32'),
(16, 'Тип', 90, 48, '2018-05-30 10:26:50', '2018-05-31 14:40:35', '2018-05-31 14:40:35'),
(17, 'Категории', 1, 0, '2018-05-31 14:52:45', '2018-05-31 19:33:26', NULL),
(18, 'Разновидность', 3, 67, '2018-05-31 14:59:31', '2018-06-08 14:24:08', NULL),
(19, 'Основной тег 2', 10, 0, '2018-05-31 14:59:53', '2018-05-31 16:22:44', '2018-05-31 16:22:44'),
(20, 'Субтег к 1 тегу', 2, 70, '2018-05-31 15:00:53', '2018-05-31 16:22:51', '2018-05-31 16:22:51'),
(21, 'Субтег 2 к ТЕГ1', 2, 69, '2018-05-31 15:01:20', '2018-05-31 16:22:47', '2018-05-31 16:22:47'),
(22, 'Доспех', 1, 0, '2018-05-31 16:08:41', '2018-05-31 16:09:51', '2018-05-31 16:09:51'),
(23, 'Комплектация', 2, 78, '2018-05-31 16:10:31', '2018-06-04 19:11:47', NULL),
(24, 'Особенности', 4, 102, '2018-05-31 16:16:40', '2018-05-31 19:20:01', '2018-05-31 19:20:01'),
(25, 'Разновидность', 4, 78, '2018-05-31 16:28:03', '2018-06-05 15:52:17', NULL),
(26, 'Разновидность', 3, 102, '2018-05-31 16:36:15', '2018-05-31 19:19:31', '2018-05-31 19:19:31'),
(27, 'Особенности', 4, 67, '2018-05-31 16:37:31', '2018-06-08 14:24:28', NULL),
(28, 'Категории', 1, 0, '2018-05-31 16:59:22', '2018-05-31 17:31:31', '2018-05-31 17:31:31'),
(29, 'Разновидность', 99, 68, '2018-05-31 19:22:23', '2018-06-06 16:34:36', NULL),
(30, 'Ур.Заточки', 5, 67, '2018-05-31 19:24:35', '2018-06-08 14:22:25', NULL),
(31, 'Ур.Заточки', 100, 78, '2018-05-31 19:28:38', '2018-06-04 18:56:29', '2018-06-04 18:56:29'),
(32, 'Особенности', 5, 78, '2018-05-31 19:43:56', '2018-06-05 15:52:34', NULL),
(33, 'Категории', 1, 0, '2018-05-31 19:58:07', '2018-06-05 15:51:08', NULL),
(34, 'Уровень', 100, 68, '2018-06-04 18:52:36', '2018-06-04 18:52:36', NULL),
(35, 'Ур.Заточки', 6, 78, '2018-06-04 18:57:18', '2018-06-05 15:52:50', NULL),
(36, 'Разновидность', 100, 79, '2018-06-04 19:04:11', '2018-06-04 19:17:37', NULL),
(37, 'Часть Доспеха', 3, 102, '2018-06-04 19:08:37', '2018-06-05 15:51:58', NULL),
(38, 'Разновидность', 2, 181, '2018-06-05 15:55:59', '2018-06-05 15:55:59', NULL),
(39, 'Уровень', 3, 181, '2018-06-05 16:02:40', '2018-06-05 16:02:40', NULL),
(40, 'Профессия', 1, 0, '2018-06-08 13:53:13', '2018-06-08 13:53:13', NULL),
(41, 'Уровень', 100, 0, '2018-06-08 14:00:56', '2018-06-08 14:00:56', NULL),
(42, 'Виды Услуг', 2, 0, '2018-06-08 14:04:13', '2018-06-11 15:44:38', '2018-06-11 15:44:38'),
(43, 'Ранг', 2, 179, '2018-06-08 14:13:39', '2018-06-08 14:13:39', NULL),
(44, 'Ранг', 2, 178, '2018-06-08 14:14:54', '2018-06-08 14:14:54', NULL),
(45, 'Разновидность', 5, 179, '2018-06-08 14:15:53', '2018-06-08 14:38:23', NULL),
(46, 'Разновидность', 3, 178, '2018-06-08 14:20:22', '2018-06-08 14:20:22', NULL),
(47, 'Комплектация', 3, 179, '2018-06-08 14:28:46', '2018-06-08 14:37:30', NULL),
(48, 'Часть Доспеха', 4, 321, '2018-06-08 14:31:30', '2018-06-08 14:38:07', NULL),
(49, 'Ур.Заточки', 6, 179, '2018-06-08 14:34:24', '2018-06-08 14:38:40', NULL),
(50, 'Ур.Заточки', 100, 178, '2018-06-08 14:35:26', '2018-06-08 14:35:26', NULL),
(51, 'Разновидность', 2, 180, '2018-06-08 14:41:25', '2018-06-08 14:41:25', NULL),
(52, 'Виды Услуг', 1, 0, '2018-06-11 15:45:24', '2018-06-11 15:45:24', NULL),
(53, 'Категории', 0, 0, '2018-06-11 15:59:52', '2018-06-11 15:59:52', NULL),
(54, 'Класс', 1, 0, '2018-06-11 16:07:20', '2018-06-11 16:07:20', NULL),
(55, 'Категории', 1, 0, '2018-06-11 16:08:44', '2018-06-11 16:08:44', NULL),
(56, 'Виды Услуг', 1, 0, '2018-06-25 18:18:18', '2018-06-25 18:18:18', NULL),
(57, 'Категории', 1, 0, '2018-06-25 18:22:07', '2018-06-25 18:22:07', NULL),
(58, 'Комплектация', 2, 375, '2018-06-25 18:25:26', '2018-07-21 17:46:20', NULL),
(59, 'Особенности', 5, 375, '2018-06-25 18:27:17', '2018-07-21 18:04:43', NULL),
(60, 'Особенности', 4, 178, '2018-06-25 18:29:02', '2018-06-25 18:29:02', NULL),
(61, 'Профессия', 1, 0, '2018-06-25 18:35:35', '2018-06-25 18:35:35', NULL),
(62, 'Разновидность', 100, 79, '2018-06-25 18:37:46', '2018-06-25 18:37:46', NULL),
(63, 'Разновидность', 5, 375, '2018-06-25 18:39:09', '2018-07-21 18:02:26', NULL),
(64, 'Разновидность', 99, 68, '2018-06-25 18:42:25', '2018-06-25 18:42:25', NULL),
(65, 'Разновидность', 3, 67, '2018-06-25 18:45:32', '2018-06-25 18:45:32', NULL),
(66, 'Ур.Заточки', 6, 375, '2018-06-25 18:47:39', '2018-07-21 18:01:56', NULL),
(67, 'Ур.Заточки', 5, 67, '2018-06-25 18:50:32', '2018-06-25 18:50:32', NULL),
(68, 'Уровень', 100, 0, '2018-06-25 18:52:27', '2018-06-25 18:52:27', NULL),
(69, 'Уровень', 100, 68, '2018-06-25 18:53:46', '2018-06-25 18:53:46', NULL),
(70, 'Часть Доспеха', 4, 380, '2018-06-25 18:55:52', '2018-07-21 18:03:45', NULL),
(71, 'Разновидность', 5, 375, '2018-07-21 17:49:03', '2018-07-21 17:59:58', '2018-07-21 17:59:58'),
(72, 'Часть Доспеха', 4, 380, '2018-07-21 17:54:52', '2018-07-21 18:00:22', '2018-07-21 18:00:22'),
(73, 'Ресурсы', 1, 129, '2018-07-21 21:20:36', '2018-07-21 22:46:53', '2018-07-21 22:46:53'),
(74, 'Ресурсы', 1, 0, '2018-07-21 22:47:34', '2018-07-21 22:47:34', NULL),
(75, 'Ур. Ресурса', 2, 525, '2018-07-21 22:51:16', '2018-07-21 22:51:16', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `sub_tag_metadatas`
--

CREATE TABLE `sub_tag_metadatas` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` int(11) DEFAULT NULL,
  `subtags_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `sub_tag_metadatas`
--

INSERT INTO `sub_tag_metadatas` (`id`, `name`, `priority`, `subtags_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(12, 'Human', NULL, 1, '2017-09-22 05:59:22', '2018-05-25 17:55:08', '2018-05-25 17:55:08'),
(13, 'Elf', NULL, 1, '2017-09-22 05:59:22', '2018-05-25 17:55:08', '2018-05-25 17:55:08'),
(14, 'Dark Elf', NULL, 1, '2017-09-22 05:59:22', '2018-05-25 17:55:08', '2018-05-25 17:55:08'),
(15, 'Ork', NULL, 1, '2017-09-22 05:59:22', '2018-05-25 17:55:08', '2018-05-25 17:55:08'),
(16, 'Naked', NULL, 2, '2017-09-22 06:02:53', '2018-05-25 17:55:17', '2018-05-25 17:55:17'),
(17, 'Dressed (details in description)', NULL, 2, '2017-09-22 06:02:53', '2018-05-25 17:55:17', '2018-05-25 17:55:17'),
(18, 'sasasasasa', NULL, 3, '2017-09-22 09:25:49', '2017-09-23 05:06:03', '2017-09-23 05:06:03'),
(19, 'assasaasas', NULL, 3, '2017-09-22 09:25:49', '2017-09-23 05:06:03', '2017-09-23 05:06:03'),
(20, 'asasasasasa', NULL, 3, '2017-09-22 09:25:49', '2017-09-23 05:06:03', '2017-09-23 05:06:03'),
(21, 'assasasasasa', NULL, 3, '2017-09-22 09:25:49', '2017-09-23 05:06:03', '2017-09-23 05:06:03'),
(22, 'a', NULL, 6, '2017-09-25 06:27:45', '2018-05-24 19:50:54', '2018-05-24 19:50:54'),
(23, 'b', NULL, 6, '2017-09-25 06:27:45', '2018-05-24 19:50:55', '2018-05-24 19:50:55'),
(24, 'c', NULL, 6, '2017-09-25 06:27:45', '2018-05-24 19:50:53', '2018-05-24 19:50:53'),
(25, 'Armor', NULL, 7, '2017-09-25 06:28:38', '2018-05-25 17:55:20', '2018-05-25 17:55:20'),
(26, 'Weapon', NULL, 7, '2017-09-25 06:28:38', '2018-05-25 17:55:20', '2018-05-25 17:55:20'),
(27, 'Td', NULL, 7, '2017-09-25 06:28:38', '2018-05-25 17:55:20', '2018-05-25 17:55:20'),
(28, 'Одежда', NULL, 8, '2017-09-25 09:07:40', '2017-09-25 09:20:26', '2017-09-25 09:20:26'),
(29, 'Курьеры', NULL, 8, '2017-09-25 09:07:40', '2017-09-25 09:20:26', '2017-09-25 09:20:26'),
(30, 'Варды', NULL, 8, '2017-09-25 09:07:40', '2017-09-25 09:20:26', '2017-09-25 09:20:26'),
(31, 'Ключи', NULL, 8, '2017-09-25 09:07:40', '2017-09-25 09:20:26', '2017-09-25 09:20:26'),
(32, 'Экраны', NULL, 8, '2017-09-25 09:07:40', '2017-09-25 09:20:26', '2017-09-25 09:20:26'),
(33, 'Руны', NULL, 8, '2017-09-25 09:07:40', '2017-09-25 09:20:26', '2017-09-25 09:20:26'),
(34, 'Интерфейсы', NULL, 8, '2017-09-25 09:07:40', '2017-09-25 09:20:26', '2017-09-25 09:20:26'),
(35, 'Игроки', NULL, 8, '2017-09-25 09:07:40', '2017-09-25 09:20:26', '2017-09-25 09:20:26'),
(36, 'Комментаторы', NULL, 8, '2017-09-25 09:07:40', '2017-09-25 09:20:26', '2017-09-25 09:20:26'),
(37, 'Другое', NULL, 8, '2017-09-25 09:07:40', '2017-09-25 09:20:26', '2017-09-25 09:20:26'),
(38, '12212121', NULL, 10, '2017-09-26 05:49:32', '2018-05-25 07:49:37', '2018-05-25 07:49:37'),
(39, '21212121', NULL, 10, '2017-09-26 05:49:32', '2018-05-25 07:49:37', '2018-05-25 07:49:37'),
(40, 'R', NULL, 6, '2018-05-24 19:50:47', '2018-05-25 12:09:29', '2018-05-25 12:09:29'),
(41, 'R95', NULL, 6, '2018-05-24 19:50:47', '2018-05-25 12:09:29', '2018-05-25 12:09:29'),
(42, 'R99', NULL, 6, '2018-05-24 19:50:47', '2018-05-25 12:09:29', '2018-05-25 12:09:29'),
(43, '1-10', NULL, 12, '2018-05-25 07:54:54', '2018-05-25 17:55:05', '2018-05-25 17:55:05'),
(44, '11-20', NULL, 12, '2018-05-25 07:54:54', '2018-05-25 17:55:05', '2018-05-25 17:55:05'),
(45, '21-40', NULL, 12, '2018-05-25 07:54:54', '2018-05-25 17:55:05', '2018-05-25 17:55:05'),
(46, '41-80', NULL, 12, '2018-05-25 07:54:54', '2018-05-25 17:55:05', '2018-05-25 17:55:05'),
(47, 'Оружие', NULL, 13, '2018-05-25 17:58:09', '2018-05-31 14:52:06', '2018-05-31 14:52:06'),
(48, 'Одежда', NULL, 13, '2018-05-25 17:58:09', '2018-05-31 14:52:06', '2018-05-31 14:52:06'),
(49, 'Бижутерия', NULL, 13, '2018-05-25 17:58:09', '2018-05-31 14:52:06', '2018-05-31 14:52:06'),
(50, 'Камни лавианроз', NULL, 13, '2018-05-25 17:58:09', '2018-05-31 14:52:06', '2018-05-31 14:52:06'),
(51, 'Другое', NULL, 13, '2018-05-25 17:58:09', '2018-05-31 14:52:06', '2018-05-31 14:52:06'),
(52, 'Рубин', NULL, 14, '2018-05-25 18:16:33', '2018-05-31 14:40:02', '2018-05-31 14:40:02'),
(53, 'Аметист', NULL, 14, '2018-05-25 18:16:33', '2018-05-31 14:40:02', '2018-05-31 14:40:02'),
(54, 'Красный кошачий глаз', NULL, 14, '2018-05-25 18:16:33', '2018-05-31 14:40:01', '2018-05-31 14:40:01'),
(55, 'Синий кошачий глаз', NULL, 14, '2018-05-25 18:16:33', '2018-05-31 14:40:00', '2018-05-31 14:40:00'),
(56, 'Сапфир', NULL, 14, '2018-05-25 18:16:33', '2018-05-31 14:39:59', '2018-05-31 14:39:59'),
(57, 'Обсидиан', NULL, 14, '2018-05-25 18:16:33', '2018-05-31 14:39:57', '2018-05-31 14:39:57'),
(58, 'Одноручный меч', NULL, 15, '2018-05-30 10:25:59', '2018-05-31 14:40:32', '2018-05-31 14:40:32'),
(59, 'Одноручный маг. меч', NULL, 15, '2018-05-30 10:25:59', '2018-05-31 14:40:32', '2018-05-31 14:40:32'),
(60, 'Кинжал', NULL, 15, '2018-05-30 10:25:59', '2018-05-31 14:40:32', '2018-05-31 14:40:32'),
(61, 'Рапира', NULL, 15, '2018-05-30 10:25:59', '2018-05-31 14:40:32', '2018-05-31 14:40:32'),
(62, 'Шлем', NULL, 16, '2018-05-30 10:26:50', '2018-05-31 14:40:35', '2018-05-31 14:40:35'),
(63, 'Верхняя часть доспехов', NULL, 16, '2018-05-30 10:26:50', '2018-05-31 14:40:35', '2018-05-31 14:40:35'),
(64, 'Нижняя часть доспехов', NULL, 16, '2018-05-30 10:26:50', '2018-05-31 14:40:35', '2018-05-31 14:40:35'),
(65, 'Рубин', NULL, 13, '2018-05-31 14:50:03', '2018-05-31 14:52:06', '2018-05-31 14:52:06'),
(66, 'Опал', NULL, 13, '2018-05-31 14:50:03', '2018-05-31 14:52:06', '2018-05-31 14:52:06'),
(67, 'Оружие', 100, 17, '2018-05-31 14:52:45', '2018-06-06 16:33:18', NULL),
(68, 'Камни Лавианроз', 97, 17, '2018-05-31 14:52:45', '2018-06-06 16:33:18', NULL),
(69, '1', NULL, 18, '2018-05-31 14:59:31', '2018-05-31 16:01:57', '2018-05-31 16:01:57'),
(70, '2', NULL, 18, '2018-05-31 14:59:31', '2018-05-31 16:01:58', '2018-05-31 16:01:58'),
(71, '3', NULL, 18, '2018-05-31 14:59:31', '2018-05-31 16:01:59', '2018-05-31 16:01:59'),
(72, '1', NULL, 19, '2018-05-31 14:59:53', '2018-05-31 16:22:44', '2018-05-31 16:22:44'),
(73, '2', NULL, 19, '2018-05-31 14:59:53', '2018-05-31 16:22:44', '2018-05-31 16:22:44'),
(74, 'УУУ', NULL, 20, '2018-05-31 15:00:53', '2018-05-31 16:22:51', '2018-05-31 16:22:51'),
(75, 'ВВВ', NULL, 20, '2018-05-31 15:00:53', '2018-05-31 16:22:51', '2018-05-31 16:22:51'),
(76, 'ккк', NULL, 21, '2018-05-31 15:01:20', '2018-05-31 16:22:47', '2018-05-31 16:22:47'),
(77, 'аааа', NULL, 21, '2018-05-31 15:01:20', '2018-05-31 16:22:47', '2018-05-31 16:22:47'),
(78, 'Доспехи', 99, 17, '2018-05-31 15:52:55', '2018-06-06 16:33:18', NULL),
(79, 'Бижутерия', 98, 17, '2018-05-31 15:52:55', '2018-06-06 16:33:18', NULL),
(80, 'Другое', 96, 17, '2018-05-31 15:52:55', '2018-06-06 16:33:18', NULL),
(81, '1 Одноручный Меч', NULL, 18, '2018-05-31 16:01:05', '2018-05-31 16:01:39', '2018-05-31 16:01:39'),
(82, '1 Одноручный Меч', NULL, 18, '2018-05-31 16:01:53', '2018-05-31 16:06:51', '2018-05-31 16:06:51'),
(83, '2 Одноручный маг. меч', NULL, 18, '2018-05-31 16:01:53', '2018-05-31 16:06:50', '2018-05-31 16:06:50'),
(84, '3 Кинжал', NULL, 18, '2018-05-31 16:01:53', '2018-05-31 16:06:48', '2018-05-31 16:06:48'),
(85, 'Одноручный Меч', 90, 18, '2018-05-31 16:03:40', '2018-06-08 14:24:08', NULL),
(86, 'Одноручный маг. меч', 100, 18, '2018-05-31 16:03:40', '2018-06-08 14:24:08', NULL),
(87, 'Кинжал', 97, 18, '2018-05-31 16:03:40', '2018-06-08 14:24:08', NULL),
(88, 'Рапира', 86, 18, '2018-05-31 16:03:40', '2018-06-08 14:24:08', NULL),
(89, 'Двуручный меч', 88, 18, '2018-05-31 16:03:40', '2018-06-08 14:24:08', NULL),
(90, 'Древний меч', 85, 18, '2018-05-31 16:03:40', '2018-06-08 14:24:08', NULL),
(91, 'Парные мечи', 89, 18, '2018-05-31 16:03:40', '2018-06-08 14:24:08', NULL),
(92, 'Парные кинжалы', 96, 18, '2018-05-31 16:03:40', '2018-06-08 14:24:08', NULL),
(93, 'Одноручное дробящее', 92, 18, '2018-05-31 16:03:40', '2018-06-08 14:24:08', NULL),
(94, 'Одноручное маг. дробящее', 99, 18, '2018-05-31 16:03:40', '2018-06-08 14:24:08', NULL),
(95, 'Парное дробящее', 91, 18, '2018-05-31 16:03:40', '2018-06-08 14:24:08', NULL),
(96, 'Лук', 95, 18, '2018-05-31 16:04:31', '2018-06-08 14:24:08', NULL),
(97, 'Арбалет', 94, 18, '2018-05-31 16:04:31', '2018-06-08 14:24:08', NULL),
(98, 'Кастеты', 93, 18, '2018-05-31 16:04:31', '2018-06-08 14:24:08', NULL),
(99, 'Древкое', NULL, 18, '2018-05-31 16:04:31', '2018-06-08 13:12:01', '2018-06-08 13:12:01'),
(100, 'Другое', NULL, 18, '2018-05-31 16:04:31', '2018-06-08 13:12:23', '2018-06-08 13:12:23'),
(101, 'Полный комплект (сет)', 100, 23, '2018-05-31 16:12:21', '2018-06-08 13:20:13', NULL),
(102, 'Части (Перчатки/Ботинки/Шлем/Верх/Низ)', 99, 23, '2018-05-31 16:12:21', '2018-06-08 13:20:13', NULL),
(103, 'Шлем', NULL, 24, '2018-05-31 16:16:40', '2018-05-31 16:31:59', '2018-05-31 16:31:59'),
(104, 'Верхняя часть доспехов', NULL, 24, '2018-05-31 16:16:40', '2018-05-31 16:32:00', '2018-05-31 16:32:00'),
(105, 'Нижняя часть доспехов', NULL, 24, '2018-05-31 16:16:40', '2018-05-31 16:32:02', '2018-05-31 16:32:02'),
(106, 'Полный доспех', NULL, 24, '2018-05-31 16:16:40', '2018-05-31 16:32:02', '2018-05-31 16:32:02'),
(107, 'Перчатки', NULL, 24, '2018-05-31 16:16:40', '2018-05-31 16:32:03', '2018-05-31 16:32:03'),
(108, 'Ботинки', NULL, 24, '2018-05-31 16:16:40', '2018-05-31 16:32:03', '2018-05-31 16:32:03'),
(109, 'Щит/Символ', NULL, 24, '2018-05-31 16:16:40', '2018-05-31 16:32:04', '2018-05-31 16:32:04'),
(110, 'Другое', NULL, 24, '2018-05-31 16:16:40', '2018-05-31 16:32:05', '2018-05-31 16:32:05'),
(111, 'Легкий', 100, 25, '2018-05-31 16:28:03', '2018-06-08 13:22:22', '2018-06-08 13:22:22'),
(112, 'Магический', 99, 25, '2018-05-31 16:28:03', '2018-06-08 13:22:19', '2018-06-08 13:22:19'),
(113, 'Тяжелый', 98, 25, '2018-05-31 16:28:03', '2018-06-08 13:22:16', '2018-06-08 13:22:16'),
(114, 'Обычные', NULL, 24, '2018-05-31 16:32:41', '2018-05-31 19:20:01', '2018-05-31 19:20:01'),
(115, 'Благословенные', NULL, 24, '2018-05-31 16:32:41', '2018-05-31 19:20:01', '2018-05-31 19:20:01'),
(116, 'ПВЕ', NULL, 24, '2018-05-31 16:32:41', '2018-05-31 19:20:01', '2018-05-31 19:20:01'),
(117, 'ПВП', NULL, 24, '2018-05-31 16:32:41', '2018-05-31 19:20:01', '2018-05-31 19:20:01'),
(118, 'Совершенные/Безупречные', NULL, 24, '2018-05-31 16:32:41', '2018-05-31 19:20:01', '2018-05-31 19:20:01'),
(119, 'Легкие', NULL, 26, '2018-05-31 16:36:15', '2018-05-31 19:19:31', '2018-05-31 19:19:31'),
(120, 'Магические', NULL, 26, '2018-05-31 16:36:15', '2018-05-31 19:19:31', '2018-05-31 19:19:31'),
(121, 'Тяжелые', NULL, 26, '2018-05-31 16:36:15', '2018-05-31 19:19:31', '2018-05-31 19:19:31'),
(122, 'Обычный', NULL, 27, '2018-05-31 16:37:31', '2018-06-04 18:37:36', '2018-06-04 18:37:36'),
(123, 'Благословенный', NULL, 27, '2018-05-31 16:37:31', '2018-06-04 18:37:35', '2018-06-04 18:37:35'),
(124, 'ПВЕ', NULL, 27, '2018-05-31 16:37:31', '2018-06-04 18:37:47', '2018-06-04 18:37:47'),
(125, 'ПВП', NULL, 27, '2018-05-31 16:37:31', '2018-06-04 18:37:46', '2018-06-04 18:37:46'),
(126, 'Совершенный/Безупречный', NULL, 27, '2018-05-31 16:37:31', '2018-06-04 18:36:42', '2018-06-04 18:36:42'),
(127, 'Рубин', 97, 29, '2018-05-31 19:22:23', '2018-06-08 13:26:36', NULL),
(128, 'Бриллиант', 95, 29, '2018-05-31 19:22:23', '2018-06-08 13:26:36', NULL),
(129, 'Аметист', 100, 29, '2018-05-31 19:22:23', '2018-06-08 13:26:36', NULL),
(130, 'Сапфри', NULL, 29, '2018-05-31 19:22:23', '2018-06-04 18:55:19', '2018-06-04 18:55:19'),
(131, '+6', 99, 30, '2018-05-31 19:24:51', '2018-06-08 14:22:25', NULL),
(132, '+8', 97, 30, '2018-05-31 19:24:51', '2018-06-08 14:22:25', NULL),
(133, '+10', 95, 30, '2018-05-31 19:24:51', '2018-06-08 14:22:25', NULL),
(134, '+12', 93, 30, '2018-05-31 19:26:39', '2018-06-08 14:22:25', NULL),
(135, '+14', 91, 30, '2018-05-31 19:26:39', '2018-06-08 14:22:25', NULL),
(136, '+16', 89, 30, '2018-05-31 19:26:39', '2018-06-08 14:22:25', NULL),
(137, '+6', NULL, 31, '2018-05-31 19:28:38', '2018-06-04 18:43:56', '2018-06-04 18:43:56'),
(138, '+8', NULL, 31, '2018-05-31 19:28:38', '2018-06-04 18:43:55', '2018-06-04 18:43:55'),
(139, '+10', NULL, 31, '2018-05-31 19:28:38', '2018-06-04 18:43:54', '2018-06-04 18:43:54'),
(140, '+16', NULL, 31, '2018-05-31 19:28:38', '2018-06-04 18:43:50', '2018-06-04 18:43:50'),
(141, 'Обычный', 100, 32, '2018-05-31 19:43:56', '2018-06-08 13:20:41', NULL),
(142, 'Благословенный', 99, 32, '2018-05-31 19:43:56', '2018-06-08 13:20:41', NULL),
(143, 'ПВЕ', 98, 32, '2018-05-31 19:43:56', '2018-06-08 13:20:41', NULL),
(144, 'ПВП', 97, 32, '2018-05-31 19:43:56', '2018-06-08 13:20:41', NULL),
(145, 'Совершенный/Безупречный', 96, 32, '2018-05-31 19:43:56', '2018-06-08 13:20:41', NULL),
(146, 'Классика1', NULL, 33, '2018-05-31 19:58:07', '2018-06-04 18:59:22', '2018-06-04 18:59:22'),
(147, 'Классика2', NULL, 33, '2018-05-31 19:58:07', '2018-06-04 18:59:21', '2018-06-04 18:59:21'),
(148, 'Классика3', NULL, 33, '2018-05-31 19:58:07', '2018-06-04 18:59:20', '2018-06-04 18:59:20'),
(149, 'Классика4', NULL, 33, '2018-05-31 19:58:07', '2018-06-04 18:59:17', '2018-06-04 18:59:17'),
(150, 'Обычное', NULL, 27, '2018-06-04 18:36:44', '2018-06-04 18:37:40', '2018-06-04 18:37:40'),
(151, 'Благословенное', NULL, 27, '2018-06-04 18:36:44', '2018-06-04 18:37:41', '2018-06-04 18:37:41'),
(152, 'Обычное', 100, 27, '2018-06-04 18:38:11', '2018-06-08 14:24:28', NULL),
(153, 'Благословенное', 99, 27, '2018-06-04 18:38:11', '2018-06-08 14:24:28', NULL),
(154, 'ПВЕ', 98, 27, '2018-06-04 18:38:11', '2018-06-08 14:24:28', NULL),
(155, 'ПВП', 97, 27, '2018-06-04 18:38:11', '2018-06-08 14:24:28', NULL),
(156, '+6', NULL, 31, '2018-06-04 18:44:25', '2018-06-04 18:56:29', '2018-06-04 18:56:29'),
(157, '+8', NULL, 31, '2018-06-04 18:44:25', '2018-06-04 18:56:29', '2018-06-04 18:56:29'),
(158, '+10', NULL, 31, '2018-06-04 18:44:25', '2018-06-04 18:56:29', '2018-06-04 18:56:29'),
(159, '+12', NULL, 31, '2018-06-04 18:44:25', '2018-06-04 18:56:29', '2018-06-04 18:56:29'),
(160, '+14', NULL, 31, '2018-06-04 18:44:25', '2018-06-04 18:56:29', '2018-06-04 18:56:29'),
(161, '+16', NULL, 31, '2018-06-04 18:44:25', '2018-06-04 18:56:29', '2018-06-04 18:56:29'),
(162, 'Сапфир', 96, 29, '2018-06-04 18:50:27', '2018-06-08 13:26:36', NULL),
(163, 'Опал', 94, 29, '2018-06-04 18:50:27', '2018-06-08 13:26:36', NULL),
(164, 'Обсидиан', 92, 29, '2018-06-04 18:50:27', '2018-06-08 13:26:36', NULL),
(165, 'Жемчуг', 93, 29, '2018-06-04 18:50:27', '2018-06-08 13:26:36', NULL),
(166, '1-го уровня', 100, 34, '2018-06-04 18:52:36', '2018-06-08 13:29:07', NULL),
(167, '2-го уровня', 99, 34, '2018-06-04 18:52:36', '2018-06-08 13:29:07', NULL),
(168, '3-го уровня', 98, 34, '2018-06-04 18:52:36', '2018-06-08 13:29:07', NULL),
(169, '4-го уровня', 97, 34, '2018-06-04 18:52:36', '2018-06-08 13:29:07', NULL),
(170, '5-го уровня', 96, 34, '2018-06-04 18:52:36', '2018-06-08 13:29:07', NULL),
(171, '6-го уровня', 95, 34, '2018-06-04 18:52:36', '2018-06-08 13:29:07', NULL),
(172, '+6', 99, 35, '2018-06-04 18:57:18', '2018-06-08 13:34:52', NULL),
(173, '+8', 97, 35, '2018-06-04 18:57:18', '2018-06-08 13:34:52', NULL),
(174, '+10', 95, 35, '2018-06-04 18:57:18', '2018-06-08 13:34:52', NULL),
(175, '+12', 93, 35, '2018-06-04 18:57:18', '2018-06-08 13:34:52', NULL),
(176, '+14', 91, 35, '2018-06-04 18:57:18', '2018-06-08 13:34:52', NULL),
(177, '+16', 89, 35, '2018-06-04 18:57:18', '2018-06-08 13:34:52', NULL),
(178, 'Оружие', 100, 33, '2018-06-04 18:59:11', '2018-06-08 13:19:53', NULL),
(179, 'Доспехи', 99, 33, '2018-06-04 18:59:11', '2018-06-08 13:19:53', NULL),
(180, 'Бижутерия', 98, 33, '2018-06-04 18:59:11', '2018-06-08 13:19:53', NULL),
(181, 'Руны', 97, 33, '2018-06-04 18:59:11', '2018-06-08 13:19:53', NULL),
(182, 'Кольцо', 100, 36, '2018-06-04 19:04:11', '2018-06-08 13:21:27', NULL),
(183, 'Серьга', 99, 36, '2018-06-04 19:04:11', '2018-06-08 13:21:27', NULL),
(184, 'Ожерелье', 98, 36, '2018-06-04 19:04:11', '2018-06-08 13:21:27', NULL),
(185, 'Брошка', 97, 36, '2018-06-04 19:06:49', '2018-06-08 13:21:27', NULL),
(186, 'Шлем', 98, 37, '2018-06-04 19:10:53', '2018-06-08 13:31:40', NULL),
(187, 'Верхняя часть доспеха', 100, 37, '2018-06-04 19:10:53', '2018-06-08 13:31:40', NULL),
(188, 'Нижняя часть доспеха', 99, 37, '2018-06-04 19:10:53', '2018-06-08 13:31:40', NULL),
(189, 'Полный Доспех', 95, 37, '2018-06-04 19:10:53', '2018-06-08 13:31:40', NULL),
(190, 'Перчатки', 97, 37, '2018-06-04 19:10:53', '2018-06-08 13:31:40', NULL),
(191, 'Ботинки', 96, 37, '2018-06-04 19:10:53', '2018-06-08 13:31:40', NULL),
(192, 'Щит/символ', 94, 37, '2018-06-04 19:10:53', '2018-06-08 13:31:40', NULL),
(193, 'Руна Одала', NULL, 38, '2018-06-05 15:55:59', '2018-06-05 15:57:18', '2018-06-05 15:57:18'),
(194, 'Руна Сигиля', NULL, 38, '2018-06-05 15:55:59', '2018-06-05 15:57:17', '2018-06-05 15:57:17'),
(195, 'Руна Эура', NULL, 38, '2018-06-05 15:55:59', '2018-06-05 15:57:16', '2018-06-05 15:57:16'),
(196, 'Руна Веньое', NULL, 38, '2018-06-05 15:55:59', '2018-06-05 15:57:16', '2018-06-05 15:57:16'),
(197, 'Руна Сигеля', NULL, 38, '2018-06-05 15:56:53', '2018-06-05 15:57:15', '2018-06-05 15:57:15'),
(198, 'Руна Сигеля2', NULL, 38, '2018-06-05 15:57:08', '2018-06-05 15:57:14', '2018-06-05 15:57:14'),
(199, 'Руна Сигеля', NULL, 38, '2018-06-05 15:58:33', '2018-06-05 15:58:33', NULL),
(200, 'Руна Тира', NULL, 38, '2018-06-05 15:58:33', '2018-06-05 15:58:33', NULL),
(201, 'Руна Одала', NULL, 38, '2018-06-05 15:58:33', '2018-06-05 15:58:33', NULL),
(202, 'Руна Эура', NULL, 38, '2018-06-05 15:58:33', '2018-06-05 15:58:33', NULL),
(203, 'Руна Фео', NULL, 38, '2018-06-05 15:58:33', '2018-06-05 15:58:33', NULL),
(204, 'Руна Иса', NULL, 38, '2018-06-05 15:58:33', '2018-06-05 15:58:33', NULL),
(205, 'Руна Веньо', NULL, 38, '2018-06-05 15:58:33', '2018-06-05 15:58:33', NULL),
(206, 'Руна Альгиза', NULL, 38, '2018-06-05 15:58:33', '2018-06-05 15:58:33', NULL),
(207, '6 Уровня', 100, 39, '2018-06-05 16:02:40', '2018-06-08 13:29:38', NULL),
(208, '7 Уровня', 99, 39, '2018-06-05 16:02:40', '2018-06-08 13:29:38', NULL),
(209, '8 Уровня', 98, 39, '2018-06-05 16:02:40', '2018-06-08 13:29:38', NULL),
(210, '9 Уровня', 97, 39, '2018-06-05 16:02:40', '2018-06-08 13:29:38', NULL),
(211, '10 Уровня', 96, 39, '2018-06-05 16:02:40', '2018-06-08 13:29:38', NULL),
(212, '11 Уровня', 95, 39, '2018-06-05 16:02:40', '2018-06-08 13:29:38', NULL),
(213, '12 Уровня', 94, 39, '2018-06-05 16:02:40', '2018-06-08 13:29:38', NULL),
(214, '13 Уровня', 93, 39, '2018-06-05 16:02:40', '2018-06-08 13:29:38', NULL),
(215, 'Двуручное дробящее', 87, 18, '2018-06-08 13:10:08', '2018-06-08 14:24:08', NULL),
(216, 'Двуручное маг. дробящее', 98, 18, '2018-06-08 13:10:08', '2018-06-08 14:24:08', NULL),
(217, 'Другое оружие', 84, 18, '2018-06-08 13:11:17', '2018-06-08 14:24:08', NULL),
(218, 'Легкие', 100, 25, '2018-06-08 13:22:10', '2018-06-08 13:22:24', NULL),
(219, 'Магические', 99, 25, '2018-06-08 13:22:10', '2018-06-08 13:22:24', NULL),
(220, 'Тяжелые', 98, 25, '2018-06-08 13:22:10', '2018-06-08 13:22:24', NULL),
(221, 'Красный Кошачий Глаз', 99, 29, '2018-06-08 13:26:36', '2018-06-08 13:26:36', NULL),
(222, 'Синий Кошачий Глаз', 98, 29, '2018-06-08 13:26:36', '2018-06-08 13:26:36', NULL),
(223, 'Изумруд', 91, 29, '2018-06-08 13:26:36', '2018-06-08 13:26:36', NULL),
(224, 'Гранат', 90, 29, '2018-06-08 13:26:36', '2018-06-08 13:26:36', NULL),
(225, 'Танзанит', 89, 29, '2018-06-08 13:26:36', '2018-06-08 13:26:36', NULL),
(226, 'Кошачий Глаз', 88, 29, '2018-06-08 13:26:36', '2018-06-08 13:26:36', NULL),
(227, 'Энергии', 87, 29, '2018-06-08 13:26:36', '2018-06-08 13:26:36', NULL),
(228, 'Аквамарин', 86, 29, '2018-06-08 13:26:36', '2018-06-08 13:26:36', NULL),
(229, 'Порошок', 85, 29, '2018-06-08 13:26:36', '2018-06-08 13:26:36', NULL),
(230, '+1-5', 100, 35, '2018-06-08 13:34:52', '2018-06-08 13:34:52', NULL),
(231, '+7', 98, 35, '2018-06-08 13:34:52', '2018-06-08 13:34:52', NULL),
(232, '+9', 96, 35, '2018-06-08 13:34:52', '2018-06-08 13:34:52', NULL),
(233, '+11', 94, 35, '2018-06-08 13:34:52', '2018-06-08 13:34:52', NULL),
(234, '+13', 92, 35, '2018-06-08 13:34:52', '2018-06-08 13:34:52', NULL),
(235, '+15', 90, 35, '2018-06-08 13:34:52', '2018-06-08 13:34:52', NULL),
(236, '+1-5', 100, 30, '2018-06-08 13:36:35', '2018-06-08 14:22:25', NULL),
(237, '+7', 98, 30, '2018-06-08 13:36:35', '2018-06-08 14:22:25', NULL),
(238, '+9', 96, 30, '2018-06-08 13:36:35', '2018-06-08 14:22:25', NULL),
(239, '+11', 94, 30, '2018-06-08 13:36:35', '2018-06-08 14:22:25', NULL),
(240, '+13', 92, 30, '2018-06-08 13:36:35', '2018-06-08 14:22:25', NULL),
(241, '+15', 90, 30, '2018-06-08 13:36:35', '2018-06-08 14:22:25', NULL),
(242, 'Жрец Евы Альгиза', 100, 40, '2018-06-08 13:53:13', '2018-06-08 13:58:37', NULL),
(243, 'Жрец Шилен Альгиза', 99, 40, '2018-06-08 13:53:13', '2018-06-08 13:58:37', NULL),
(244, 'Кардинал Альгиза', 98, 40, '2018-06-08 13:53:13', '2018-06-08 13:58:37', NULL),
(245, 'Глас Судьбы Иса', 97, 40, '2018-06-08 13:53:13', '2018-06-08 13:58:37', NULL),
(246, 'Деспот Иса', 96, 40, '2018-06-08 13:53:13', '2018-06-08 13:58:37', NULL),
(247, 'Виртуоз Иса', 95, 40, '2018-06-08 13:53:13', '2018-06-08 13:58:37', NULL),
(248, 'Призрачный Танцор Иса', 94, 40, '2018-06-08 13:53:13', '2018-06-08 13:58:37', NULL),
(249, 'Апостол Иса', 93, 40, '2018-06-08 13:53:13', '2018-06-08 13:58:37', NULL),
(250, 'Инквизитор Фео', 92, 40, '2018-06-08 13:53:13', '2018-06-08 13:58:37', NULL),
(251, 'Пожиратель Душ Фео', 91, 40, '2018-06-08 13:53:13', '2018-06-08 13:58:37', NULL),
(252, 'Архимаг Фео', 90, 40, '2018-06-08 13:53:13', '2018-06-08 13:58:37', NULL),
(253, 'Магистр Магии Фео', 89, 40, '2018-06-08 13:53:13', '2018-06-08 13:58:37', NULL),
(254, 'Повелитель Бури Фео', 88, 40, '2018-06-08 13:53:13', '2018-06-08 13:58:37', NULL),
(255, 'Снайпер Эура', 87, 40, '2018-06-08 13:53:13', '2018-06-08 13:58:37', NULL),
(256, 'Страж Лунного Света Эура', 86, 40, '2018-06-08 13:53:13', '2018-06-08 13:58:37', NULL),
(257, 'Страж Теней Эура', 85, 40, '2018-06-08 13:53:13', '2018-06-08 13:58:37', NULL),
(258, 'Диверсант Эура', 84, 40, '2018-06-08 13:53:13', '2018-06-08 13:58:37', NULL),
(259, 'Призрачный Охотник Одала', 83, 40, '2018-06-08 13:53:13', '2018-06-08 13:58:37', NULL),
(260, 'Странник Ветра Одала', 82, 40, '2018-06-08 13:53:13', '2018-06-08 13:58:37', NULL),
(261, 'Авантюрист Одала', 81, 40, '2018-06-08 13:53:13', '2018-06-08 13:58:37', NULL),
(262, 'Кладоискатель Одала', 80, 40, '2018-06-08 13:53:13', '2018-06-08 13:58:37', NULL),
(263, 'Полководец Тира', 79, 40, '2018-06-08 13:53:13', '2018-06-08 13:58:37', NULL),
(264, 'Дуэлист Тира', 78, 40, '2018-06-08 13:53:13', '2018-06-08 13:58:37', NULL),
(265, 'Аватар Тира', 77, 40, '2018-06-08 13:53:13', '2018-06-08 13:58:37', NULL),
(266, 'Каратель Тира', 76, 40, '2018-06-08 13:53:13', '2018-06-08 13:58:37', NULL),
(267, 'Титан Тира', 75, 40, '2018-06-08 13:53:13', '2018-06-08 13:58:37', NULL),
(268, 'Мастер Тира', 74, 40, '2018-06-08 13:53:13', '2018-06-08 13:58:37', NULL),
(269, 'Чернокнижник Веньо', 73, 40, '2018-06-08 13:58:37', '2018-06-08 13:58:37', NULL),
(270, 'Владыка Теней Веньо', 72, 40, '2018-06-08 13:58:37', '2018-06-08 13:58:37', NULL),
(271, 'Мастер Стихий Веньо', 71, 40, '2018-06-08 13:58:37', '2018-06-08 13:58:37', NULL),
(272, 'Рыцарь Феникса Сигеля', 70, 40, '2018-06-08 13:58:37', '2018-06-08 13:58:37', NULL),
(273, 'Храмовник Евы Сигеля', 69, 40, '2018-06-08 13:58:37', '2018-06-08 13:58:37', NULL),
(274, 'Храмовник Шилен Сигеля', 68, 40, '2018-06-08 13:58:37', '2018-06-08 13:58:37', NULL),
(275, 'Рыцарь Ада Сигеля', 67, 40, '2018-06-08 13:58:37', '2018-06-08 13:58:37', NULL),
(276, 'Заступник Сайхи', 66, 40, '2018-06-08 13:58:37', '2018-06-08 13:58:37', NULL),
(277, 'Громовержец Сайхи', 65, 40, '2018-06-08 13:58:37', '2018-06-08 13:58:37', NULL),
(278, '85+', 100, 41, '2018-06-08 14:00:56', '2018-06-08 14:00:56', NULL),
(279, '90+', 99, 41, '2018-06-08 14:00:56', '2018-06-08 14:00:56', NULL),
(280, '95+', 98, 41, '2018-06-08 14:00:56', '2018-06-08 14:00:56', NULL),
(281, '99+', 97, 41, '2018-06-08 14:00:56', '2018-06-08 14:00:56', NULL),
(282, '100+', 96, 41, '2018-06-08 14:00:56', '2018-06-08 14:00:56', NULL),
(283, '101+', 95, 41, '2018-06-08 14:00:56', '2018-06-08 14:00:56', NULL),
(284, '102+', 94, 41, '2018-06-08 14:00:56', '2018-06-08 14:00:56', NULL),
(285, '103+', 93, 41, '2018-06-08 14:00:56', '2018-06-08 14:00:56', NULL),
(286, '104+', 92, 41, '2018-06-08 14:00:56', '2018-06-08 14:00:56', NULL),
(287, '105+', 91, 41, '2018-06-08 14:00:56', '2018-06-08 14:00:56', NULL),
(288, 'Прокачка', 100, 42, '2018-06-08 14:04:13', '2018-06-11 15:44:38', '2018-06-11 15:44:38'),
(289, 'Драйвер', 99, 42, '2018-06-08 14:04:13', '2018-06-11 15:44:38', '2018-06-11 15:44:38'),
(290, 'Другое', 98, 42, '2018-06-08 14:04:13', '2018-06-11 15:44:38', '2018-06-11 15:44:38'),
(291, 'D - ранг', 100, 43, '2018-06-08 14:13:39', '2018-06-08 14:13:39', NULL),
(292, 'С - ранг', 99, 43, '2018-06-08 14:13:39', '2018-06-08 14:13:39', NULL),
(293, 'В - ранг', 98, 43, '2018-06-08 14:13:39', '2018-06-08 14:13:39', NULL),
(294, 'А - ранг', 97, 43, '2018-06-08 14:13:39', '2018-06-08 14:13:39', NULL),
(295, 'Без ранга', 96, 43, '2018-06-08 14:13:39', '2018-06-08 14:13:39', NULL),
(296, 'D - ранг', 100, 44, '2018-06-08 14:14:54', '2018-06-08 14:14:54', NULL),
(297, 'С - ранг', 99, 44, '2018-06-08 14:14:54', '2018-06-08 14:14:54', NULL),
(298, 'В - ранг', 98, 44, '2018-06-08 14:14:54', '2018-06-08 14:14:54', NULL),
(299, 'А - ранг', 97, 44, '2018-06-08 14:14:54', '2018-06-08 14:14:54', NULL),
(300, 'Без ранга', 96, 44, '2018-06-08 14:14:54', '2018-06-08 14:14:54', NULL),
(301, 'Легкие', 100, 45, '2018-06-08 14:15:53', '2018-06-08 14:38:23', NULL),
(302, 'Магические', 99, 45, '2018-06-08 14:15:53', '2018-06-08 14:38:23', NULL),
(303, 'Тяжелые', 98, 45, '2018-06-08 14:15:53', '2018-06-08 14:38:23', NULL),
(304, 'Одноручный маг. меч', 100, 46, '2018-06-08 14:20:22', '2018-06-08 14:20:22', NULL),
(305, 'Одноручное маг. дробящее', 99, 46, '2018-06-08 14:20:22', '2018-06-08 14:20:22', NULL),
(306, 'Двуручное маг. дробящее', 98, 46, '2018-06-08 14:20:22', '2018-06-08 14:20:22', NULL),
(307, 'Кинжал', 97, 46, '2018-06-08 14:20:22', '2018-06-08 14:20:22', NULL),
(308, 'Парные кинжалы', 96, 46, '2018-06-08 14:20:22', '2018-06-08 14:20:22', NULL),
(309, 'Лук', 95, 46, '2018-06-08 14:20:22', '2018-06-08 14:20:22', NULL),
(310, 'Арбалет', 94, 46, '2018-06-08 14:20:22', '2018-06-08 14:20:22', NULL),
(311, 'Одноручный меч', 93, 46, '2018-06-08 14:20:22', '2018-06-08 14:20:22', NULL),
(312, 'Парные мечи', 92, 46, '2018-06-08 14:20:22', '2018-06-08 14:20:22', NULL),
(313, 'Двуручный меч', 91, 46, '2018-06-08 14:20:22', '2018-06-08 14:20:22', NULL),
(314, 'Двуручное дробящее', 90, 46, '2018-06-08 14:20:22', '2018-06-08 14:20:22', NULL),
(315, 'Парное дробящее', 89, 46, '2018-06-08 14:20:22', '2018-06-08 14:20:22', NULL),
(316, 'Одноручное дробящее', 88, 46, '2018-06-08 14:20:22', '2018-06-08 14:20:22', NULL),
(317, 'Кастеты', 87, 46, '2018-06-08 14:20:22', '2018-06-08 14:20:22', NULL),
(318, 'Древкое', 86, 46, '2018-06-08 14:20:22', '2018-06-08 14:20:22', NULL),
(319, 'Другое оружие', 85, 46, '2018-06-08 14:20:22', '2018-06-08 14:20:22', NULL),
(320, 'Полный комплект (сет)', 100, 47, '2018-06-08 14:28:46', '2018-06-08 14:37:30', NULL),
(321, 'Части (Перчатки/Ботинки/Шлем/верх/низ)', 99, 47, '2018-06-08 14:28:46', '2018-06-08 14:37:30', NULL),
(322, 'Верхняя Часть Доспеха', 100, 48, '2018-06-08 14:31:30', '2018-06-08 14:38:07', NULL),
(323, 'Нижняя часть доспеха', 99, 48, '2018-06-08 14:31:30', '2018-06-08 14:38:07', NULL),
(324, 'Шлем', 98, 48, '2018-06-08 14:31:30', '2018-06-08 14:38:07', NULL),
(325, 'Перчатки', 97, 48, '2018-06-08 14:31:30', '2018-06-08 14:38:07', NULL),
(326, 'Ботинки', 96, 48, '2018-06-08 14:31:30', '2018-06-08 14:38:07', NULL),
(327, 'Полный Доспех', 95, 48, '2018-06-08 14:31:30', '2018-06-08 14:38:07', NULL),
(328, 'Щит/Символ', 94, 48, '2018-06-08 14:31:30', '2018-06-08 14:38:07', NULL),
(329, '+3', 100, 49, '2018-06-08 14:34:24', '2018-06-08 14:38:40', NULL),
(330, '+4', 99, 49, '2018-06-08 14:34:24', '2018-06-08 14:38:40', NULL),
(331, '+5', 98, 49, '2018-06-08 14:34:24', '2018-06-08 14:38:40', NULL),
(332, '+6', 97, 49, '2018-06-08 14:34:24', '2018-06-08 14:38:40', NULL),
(333, '+7', 96, 49, '2018-06-08 14:34:24', '2018-06-08 14:38:40', NULL),
(334, '+8', 95, 49, '2018-06-08 14:34:24', '2018-06-08 14:38:40', NULL),
(335, '+9', 94, 49, '2018-06-08 14:34:24', '2018-06-08 14:38:40', NULL),
(336, '+10', 93, 49, '2018-06-08 14:34:24', '2018-06-08 14:38:40', NULL),
(337, '+3-6', NULL, 50, '2018-06-08 14:35:26', '2018-06-08 14:35:26', NULL),
(338, '+7-10', NULL, 50, '2018-06-08 14:35:26', '2018-06-08 14:35:26', NULL),
(339, '+11-15', NULL, 50, '2018-06-08 14:35:26', '2018-06-08 14:35:26', NULL),
(340, '16+', NULL, 50, '2018-06-08 14:35:26', '2018-06-08 14:35:26', NULL),
(341, 'Кольцо', 100, 51, '2018-06-08 14:41:25', '2018-06-08 14:42:53', NULL),
(342, 'Серьга', 99, 51, '2018-06-08 14:41:25', '2018-06-08 14:42:53', NULL),
(343, 'Ожерьлье', 98, 51, '2018-06-08 14:41:25', '2018-06-08 14:42:51', '2018-06-08 14:42:51'),
(344, 'Ожерелье', 98, 51, '2018-06-08 14:42:47', '2018-06-08 14:42:53', NULL),
(345, 'Прокачка', 100, 52, '2018-06-11 15:45:46', '2018-06-11 15:46:02', NULL),
(346, 'Драйвер', 99, 52, '2018-06-11 15:45:46', '2018-06-11 15:46:02', NULL),
(347, 'Другое', 98, 52, '2018-06-11 15:45:46', '2018-06-11 15:46:02', NULL),
(348, 'Оружие', 100, 53, '2018-06-11 15:59:52', '2018-06-11 15:59:52', NULL),
(349, 'Доспехи', 99, 53, '2018-06-11 15:59:52', '2018-06-11 15:59:52', NULL),
(350, 'Украшения', 98, 53, '2018-06-11 15:59:52', '2018-06-11 15:59:52', NULL),
(351, 'Мода', 97, 53, '2018-06-11 15:59:52', '2018-06-11 15:59:52', NULL),
(352, 'Питомцы', 96, 53, '2018-06-11 15:59:52', '2018-06-11 15:59:52', NULL),
(353, 'Камни', 95, 53, '2018-06-11 15:59:52', '2018-06-11 15:59:52', NULL),
(354, 'Зелья', 94, 53, '2018-06-11 15:59:52', '2018-06-11 15:59:52', NULL),
(355, 'Другое', 93, 53, '2018-06-11 15:59:52', '2018-06-11 15:59:52', NULL),
(356, 'Убийца', NULL, 54, '2018-06-11 16:07:20', '2018-06-11 16:07:20', NULL),
(357, 'Стрелок', NULL, 54, '2018-06-11 16:07:20', '2018-06-11 16:07:20', NULL),
(358, 'Гладиатор', NULL, 54, '2018-06-11 16:07:20', '2018-06-11 16:07:20', NULL),
(359, 'Страж', NULL, 54, '2018-06-11 16:07:20', '2018-06-11 16:07:20', NULL),
(360, 'Волшебник', NULL, 54, '2018-06-11 16:07:20', '2018-06-11 16:07:20', NULL),
(361, 'Заклинатель', NULL, 54, '2018-06-11 16:07:20', '2018-06-11 16:07:20', NULL),
(362, 'Целитель', NULL, 54, '2018-06-11 16:07:20', '2018-06-11 16:07:20', NULL),
(363, 'Чародей', NULL, 54, '2018-06-11 16:07:20', '2018-06-11 16:07:20', NULL),
(364, 'Снайпер', NULL, 54, '2018-06-11 16:07:20', '2018-06-11 16:07:20', NULL),
(365, 'Бард', NULL, 54, '2018-06-11 16:07:20', '2018-06-11 16:07:20', NULL),
(366, 'Пилот', NULL, 54, '2018-06-11 16:07:20', '2018-06-11 16:07:20', NULL),
(367, 'Оружие', 100, 55, '2018-06-11 16:08:44', '2018-06-11 16:08:44', NULL),
(368, 'Доспехи', 99, 55, '2018-06-11 16:08:44', '2018-06-11 16:08:44', NULL),
(369, 'Украшения', 98, 55, '2018-06-11 16:08:44', '2018-06-11 16:08:44', NULL),
(370, 'Другое', 97, 55, '2018-06-11 16:08:44', '2018-06-11 16:08:44', NULL),
(371, 'Прокачка', 100, 56, '2018-06-25 18:18:18', '2018-06-25 18:18:18', NULL),
(372, 'Драйвер', 99, 56, '2018-06-25 18:18:18', '2018-06-25 18:18:18', NULL),
(373, 'Другое', 98, 56, '2018-06-25 18:18:18', '2018-06-25 18:18:18', NULL),
(374, 'Оружие', 100, 57, '2018-06-25 18:22:07', '2018-06-25 18:22:07', NULL),
(375, 'Доспехи', 99, 57, '2018-06-25 18:22:07', '2018-06-25 18:22:07', NULL),
(376, 'Бижутерия', 98, 57, '2018-06-25 18:22:07', '2018-06-25 18:22:07', NULL),
(377, 'Камни Лавианроз', 97, 57, '2018-06-25 18:22:07', '2018-06-25 18:22:07', NULL),
(378, 'Другое', 96, 57, '2018-06-25 18:22:07', '2018-06-25 18:22:07', NULL),
(379, 'Полный комплект (сет)', 100, 58, '2018-06-25 18:25:26', '2018-07-21 17:46:43', NULL),
(380, 'Части (Перчатки/Ботинки/Шлем/Верх/Низ)', 99, 58, '2018-06-25 18:25:26', '2018-07-21 17:46:43', NULL),
(381, 'Обычный', 100, 59, '2018-06-25 18:27:17', '2018-07-21 18:04:43', NULL),
(382, 'Благословенный', 99, 59, '2018-06-25 18:27:17', '2018-07-21 18:04:43', NULL),
(383, 'ПВЕ', 98, 59, '2018-06-25 18:27:17', '2018-07-21 18:04:43', NULL),
(384, 'ПВП', 97, 59, '2018-06-25 18:27:17', '2018-07-21 18:04:43', NULL),
(385, 'Совершенный/Безупречный', 96, 59, '2018-06-25 18:27:17', '2018-07-21 18:04:43', NULL),
(386, 'Обычное', 100, 60, '2018-06-25 18:29:02', '2018-06-25 18:29:02', NULL),
(387, 'Благословенное', 99, 60, '2018-06-25 18:29:02', '2018-06-25 18:29:02', NULL),
(388, 'ПВЕ', 98, 60, '2018-06-25 18:29:02', '2018-06-25 18:29:02', NULL),
(389, 'ПВП', 97, 60, '2018-06-25 18:29:02', '2018-06-25 18:29:02', NULL),
(390, 'Жрец Евы Альгиза', 100, 61, '2018-06-25 18:35:35', '2018-06-25 18:35:35', NULL),
(391, 'Жрец Шилен Альгиза', 99, 61, '2018-06-25 18:35:35', '2018-06-25 18:35:35', NULL),
(392, 'Кардинал Альгиза', 98, 61, '2018-06-25 18:35:35', '2018-06-25 18:35:35', NULL),
(393, 'Глас Судьбы Иса', 97, 61, '2018-06-25 18:35:35', '2018-06-25 18:35:35', NULL),
(394, 'Деспот Иса', 96, 61, '2018-06-25 18:35:35', '2018-06-25 18:35:35', NULL),
(395, 'Виртуоз Иса', 95, 61, '2018-06-25 18:35:35', '2018-06-25 18:35:35', NULL),
(396, 'Призрачный Танцор Иса', 94, 61, '2018-06-25 18:35:35', '2018-06-25 18:35:35', NULL),
(397, 'Апостол Иса', 93, 61, '2018-06-25 18:35:35', '2018-06-25 18:35:35', NULL),
(398, 'Инквизитор Фео', 92, 61, '2018-06-25 18:35:35', '2018-06-25 18:35:35', NULL),
(399, 'Пожиратель Душ Фео', 91, 61, '2018-06-25 18:35:35', '2018-06-25 18:35:35', NULL),
(400, 'Архимаг Фео', 90, 61, '2018-06-25 18:35:35', '2018-06-25 18:35:35', NULL),
(401, 'Магистр Магии Фео', 89, 61, '2018-06-25 18:35:35', '2018-06-25 18:35:35', NULL),
(402, 'Повелитель Бури Фео', 88, 61, '2018-06-25 18:35:35', '2018-06-25 18:35:35', NULL),
(403, 'Снайпер Эура', 87, 61, '2018-06-25 18:35:35', '2018-06-25 18:35:35', NULL),
(404, 'Страж Лунного Света Эура', 86, 61, '2018-06-25 18:35:35', '2018-06-25 18:35:35', NULL),
(405, 'Страж Теней Эура', 85, 61, '2018-06-25 18:35:35', '2018-06-25 18:35:35', NULL),
(406, 'Диверсант Эура', 84, 61, '2018-06-25 18:35:35', '2018-06-25 18:35:35', NULL),
(407, 'Призрачный Охотник Одала', 83, 61, '2018-06-25 18:35:35', '2018-06-25 18:35:35', NULL),
(408, 'Странник Ветра Одала', 82, 61, '2018-06-25 18:35:35', '2018-06-25 18:35:35', NULL),
(409, 'Авантюрист Одала', 81, 61, '2018-06-25 18:35:35', '2018-06-25 18:35:35', NULL),
(410, 'Кладоискатель Одала', 80, 61, '2018-06-25 18:35:35', '2018-06-25 18:35:35', NULL),
(411, 'Полководец Тира', 79, 61, '2018-06-25 18:35:35', '2018-06-25 18:35:35', NULL),
(412, 'Дуэлист Тира', 78, 61, '2018-06-25 18:35:35', '2018-06-25 18:35:35', NULL),
(413, 'Аватар Тира', 77, 61, '2018-06-25 18:35:35', '2018-06-25 18:35:35', NULL),
(414, 'Каратель Тира', 76, 61, '2018-06-25 18:35:35', '2018-06-25 18:35:35', NULL),
(415, 'Титан Тира', 75, 61, '2018-06-25 18:35:35', '2018-06-25 18:35:35', NULL),
(416, 'Мастер Тира', 74, 61, '2018-06-25 18:35:35', '2018-06-25 18:35:35', NULL),
(417, 'Чернокнижник Веньо', 73, 61, '2018-06-25 18:35:35', '2018-06-25 18:35:35', NULL),
(418, 'Владыка Теней Веньо', 72, 61, '2018-06-25 18:35:35', '2018-06-25 18:35:35', NULL),
(419, 'Мастер Стихий Веньо', 71, 61, '2018-06-25 18:35:35', '2018-06-25 18:35:35', NULL),
(420, 'Рыцарь Феникса Сигеля', 70, 61, '2018-06-25 18:35:35', '2018-06-25 18:35:35', NULL),
(421, 'Храмовник Евы Сигеля', 69, 61, '2018-06-25 18:35:35', '2018-06-25 18:35:35', NULL),
(422, 'Храмовник Шилен Сигеля', 68, 61, '2018-06-25 18:35:35', '2018-06-25 18:35:35', NULL),
(423, 'Рыцарь Ада Сигеля', 67, 61, '2018-06-25 18:35:35', '2018-06-25 18:35:35', NULL),
(424, 'Заступник Сайхи', 66, 61, '2018-06-25 18:35:35', '2018-06-25 18:35:35', NULL),
(425, 'Громовержец Сайхи', 65, 61, '2018-06-25 18:35:35', '2018-06-25 18:35:35', NULL),
(426, 'Кольцо', 100, 62, '2018-06-25 18:37:46', '2018-06-25 18:37:46', NULL),
(427, 'Серьга', 99, 62, '2018-06-25 18:37:46', '2018-06-25 18:37:46', NULL),
(428, 'Ожерелье', 98, 62, '2018-06-25 18:37:46', '2018-06-25 18:37:46', NULL),
(429, 'Брошка', 97, 62, '2018-06-25 18:37:46', '2018-06-25 18:37:46', NULL),
(430, 'Легкие', 100, 63, '2018-06-25 18:39:09', '2018-07-21 18:02:26', NULL),
(431, 'Магические', 99, 63, '2018-06-25 18:39:09', '2018-07-21 18:02:26', NULL),
(432, 'Тяжелые', 98, 63, '2018-06-25 18:39:09', '2018-07-21 18:02:26', NULL),
(433, 'Аметист', 100, 64, '2018-06-25 18:42:25', '2018-06-25 18:42:25', NULL),
(434, 'Красный Кошачий Глаз', 99, 64, '2018-06-25 18:42:25', '2018-06-25 18:42:25', NULL),
(435, 'Синий Кошачий Глаз', 98, 64, '2018-06-25 18:42:25', '2018-06-25 18:42:25', NULL),
(436, 'Рубин', 97, 64, '2018-06-25 18:42:25', '2018-06-25 18:42:25', NULL),
(437, 'Сапфир', 96, 64, '2018-06-25 18:42:25', '2018-06-25 18:42:25', NULL),
(438, 'Бриллиант', 95, 64, '2018-06-25 18:42:25', '2018-06-25 18:42:25', NULL),
(439, 'Опал', 94, 64, '2018-06-25 18:42:25', '2018-06-25 18:42:25', NULL),
(440, 'Жемчуг', 93, 64, '2018-06-25 18:42:25', '2018-06-25 18:42:25', NULL),
(441, 'Обсидиан', 92, 64, '2018-06-25 18:42:25', '2018-06-25 18:42:25', NULL),
(442, 'Изумруд', 91, 64, '2018-06-25 18:42:25', '2018-06-25 18:42:25', NULL),
(443, 'Гранат', 90, 64, '2018-06-25 18:42:25', '2018-06-25 18:42:25', NULL),
(444, 'Танзанит', 89, 64, '2018-06-25 18:42:25', '2018-06-25 18:42:25', NULL),
(445, 'Кошачий Глаз', 88, 64, '2018-06-25 18:42:25', '2018-06-25 18:42:25', NULL),
(446, 'Энергии', 87, 64, '2018-06-25 18:42:25', '2018-06-25 18:42:25', NULL),
(447, 'Аквамарин', 86, 64, '2018-06-25 18:42:25', '2018-06-25 18:42:25', NULL),
(448, 'Порошок', 85, 64, '2018-06-25 18:42:25', '2018-06-25 18:42:25', NULL),
(449, 'Одноручный маг. меч', 100, 65, '2018-06-25 18:45:32', '2018-06-25 18:45:32', NULL),
(450, 'Одноручное маг. дробящее', 99, 65, '2018-06-25 18:45:32', '2018-06-25 18:45:32', NULL),
(451, 'Двуручное маг. дробящее', 98, 65, '2018-06-25 18:45:32', '2018-06-25 18:45:32', NULL),
(452, 'Кинжал', 97, 65, '2018-06-25 18:45:32', '2018-06-25 18:45:32', NULL),
(453, 'Парные кинжалы', 96, 65, '2018-06-25 18:45:32', '2018-06-25 18:45:32', NULL),
(454, 'Лук', 95, 65, '2018-06-25 18:45:32', '2018-06-25 18:45:32', NULL),
(455, 'Арбалет', 94, 65, '2018-06-25 18:45:32', '2018-06-25 18:45:32', NULL),
(456, 'Кастеты', 93, 65, '2018-06-25 18:45:32', '2018-06-25 18:45:32', NULL),
(457, 'Одноручное дробящее', 92, 65, '2018-06-25 18:45:32', '2018-06-25 18:45:32', NULL),
(458, 'Парное дробящее', 91, 65, '2018-06-25 18:45:32', '2018-06-25 18:45:32', NULL),
(459, 'Одноручный Меч', 90, 65, '2018-06-25 18:45:32', '2018-06-25 18:45:32', NULL),
(460, 'Парные мечи', 89, 65, '2018-06-25 18:45:32', '2018-06-25 18:45:32', NULL),
(461, 'Двуручный меч', 88, 65, '2018-06-25 18:45:32', '2018-06-25 18:45:32', NULL),
(462, 'Двуручное дробящее', 87, 65, '2018-06-25 18:45:32', '2018-06-25 18:45:32', NULL),
(463, 'Рапира', 86, 65, '2018-06-25 18:45:32', '2018-06-25 18:45:32', NULL),
(464, 'Древний меч', 85, 65, '2018-06-25 18:45:32', '2018-06-25 18:45:32', NULL),
(465, 'Другое оружие', 84, 65, '2018-06-25 18:45:32', '2018-06-25 18:45:32', NULL),
(466, '+1-5', 100, 66, '2018-06-25 18:47:39', '2018-07-21 18:01:56', NULL),
(467, '+6', 99, 66, '2018-06-25 18:47:39', '2018-07-21 18:01:56', NULL),
(468, '+7', 98, 66, '2018-06-25 18:47:39', '2018-07-21 18:01:56', NULL),
(469, '+8', 97, 66, '2018-06-25 18:47:39', '2018-07-21 18:01:56', NULL),
(470, '+9', 96, 66, '2018-06-25 18:47:39', '2018-07-21 18:01:56', NULL),
(471, '+10', 95, 66, '2018-06-25 18:47:39', '2018-07-21 18:01:56', NULL),
(472, '+11', 94, 66, '2018-06-25 18:47:39', '2018-07-21 18:01:56', NULL),
(473, '+12', 93, 66, '2018-06-25 18:47:39', '2018-07-21 18:01:56', NULL),
(474, '+13', 92, 66, '2018-06-25 18:47:39', '2018-07-21 18:01:56', NULL),
(475, '+14', 91, 66, '2018-06-25 18:47:39', '2018-07-21 18:01:56', NULL),
(476, '+15', 90, 66, '2018-06-25 18:47:39', '2018-07-21 18:01:56', NULL),
(477, '+16', 89, 66, '2018-06-25 18:47:39', '2018-07-21 18:01:56', NULL),
(478, '+1-5', 100, 67, '2018-06-25 18:50:32', '2018-06-25 18:50:32', NULL),
(479, '+6', 99, 67, '2018-06-25 18:50:32', '2018-06-25 18:50:32', NULL),
(480, '+7', 98, 67, '2018-06-25 18:50:32', '2018-06-25 18:50:32', NULL),
(481, '+8', 97, 67, '2018-06-25 18:50:32', '2018-06-25 18:50:32', NULL),
(482, '+9', 96, 67, '2018-06-25 18:50:32', '2018-06-25 18:50:32', NULL),
(483, '+10', 95, 67, '2018-06-25 18:50:32', '2018-06-25 18:50:32', NULL),
(484, '+11', 94, 67, '2018-06-25 18:50:32', '2018-06-25 18:50:32', NULL),
(485, '+12', 93, 67, '2018-06-25 18:50:32', '2018-06-25 18:50:32', NULL),
(486, '+13', 92, 67, '2018-06-25 18:50:32', '2018-06-25 18:50:32', NULL),
(487, '+14', 91, 67, '2018-06-25 18:50:32', '2018-06-25 18:50:32', NULL),
(488, '+15', 90, 67, '2018-06-25 18:50:32', '2018-06-25 18:50:32', NULL),
(489, '+16', 89, 67, '2018-06-25 18:50:32', '2018-06-25 18:50:32', NULL),
(490, '85+', 100, 68, '2018-06-25 18:52:27', '2018-06-25 18:52:27', NULL),
(491, '90+', 99, 68, '2018-06-25 18:52:27', '2018-06-25 18:52:27', NULL),
(492, '95+', 98, 68, '2018-06-25 18:52:27', '2018-06-25 18:52:27', NULL),
(493, '99+', 97, 68, '2018-06-25 18:52:27', '2018-06-25 18:52:27', NULL),
(494, '100+', 96, 68, '2018-06-25 18:52:27', '2018-06-25 18:52:27', NULL),
(495, '101+', 95, 68, '2018-06-25 18:52:27', '2018-06-25 18:52:27', NULL),
(496, '102+', 94, 68, '2018-06-25 18:52:27', '2018-06-25 18:52:27', NULL),
(497, '103+', 93, 68, '2018-06-25 18:52:27', '2018-06-25 18:52:27', NULL),
(498, '104+', 92, 68, '2018-06-25 18:52:27', '2018-06-25 18:52:27', NULL),
(499, '105+', 91, 68, '2018-06-25 18:52:27', '2018-06-25 18:52:27', NULL),
(500, '1-го уровня', 100, 69, '2018-06-25 18:53:46', '2018-06-25 18:53:46', NULL),
(501, '2-го уровня', 99, 69, '2018-06-25 18:53:46', '2018-06-25 18:53:46', NULL),
(502, '3-го уровня', 98, 69, '2018-06-25 18:53:46', '2018-06-25 18:53:46', NULL),
(503, '4-го уровня', 97, 69, '2018-06-25 18:53:46', '2018-06-25 18:53:46', NULL),
(504, '5-го уровня', 96, 69, '2018-06-25 18:53:46', '2018-06-25 18:53:46', NULL),
(505, '6-го уровня', 95, 69, '2018-06-25 18:53:46', '2018-06-25 18:53:46', NULL),
(506, 'Верхняя часть доспеха', 100, 70, '2018-06-25 18:55:52', '2018-07-21 18:03:45', NULL),
(507, 'Нижняя часть доспеха', 99, 70, '2018-06-25 18:55:52', '2018-07-21 18:03:45', NULL),
(508, 'Шлем', 98, 70, '2018-06-25 18:55:52', '2018-07-21 18:03:45', NULL),
(509, 'Перчатки', 97, 70, '2018-06-25 18:55:52', '2018-07-21 18:03:45', NULL),
(510, 'Ботинки', 96, 70, '2018-06-25 18:55:52', '2018-07-21 18:03:45', NULL),
(511, 'Полный Доспех', 95, 70, '2018-06-25 18:55:52', '2018-07-21 18:03:45', NULL),
(512, 'Щит/символ', 94, 70, '2018-06-25 18:55:52', '2018-07-21 18:03:45', NULL),
(513, 'Легкие', NULL, 71, '2018-07-21 17:49:03', '2018-07-21 17:59:58', '2018-07-21 17:59:58'),
(514, 'Магические', NULL, 71, '2018-07-21 17:49:03', '2018-07-21 17:59:58', '2018-07-21 17:59:58'),
(515, 'Тяжелые', NULL, 71, '2018-07-21 17:49:03', '2018-07-21 17:59:58', '2018-07-21 17:59:58'),
(516, 'Верхняя Часть доспеха', 100, 72, '2018-07-21 17:54:52', '2018-07-21 18:00:22', '2018-07-21 18:00:22'),
(517, 'Нижняя часть доспеха', 99, 72, '2018-07-21 17:54:52', '2018-07-21 18:00:22', '2018-07-21 18:00:22'),
(518, 'Шлем', 98, 72, '2018-07-21 17:54:52', '2018-07-21 18:00:22', '2018-07-21 18:00:22'),
(519, 'Перчатки', 97, 72, '2018-07-21 17:54:52', '2018-07-21 18:00:22', '2018-07-21 18:00:22'),
(520, 'Без ранга', 96, 72, '2018-07-21 17:54:52', '2018-07-21 18:00:22', '2018-07-21 18:00:22'),
(521, 'Полный Доспех', 95, 72, '2018-07-21 17:54:52', '2018-07-21 18:00:22', '2018-07-21 18:00:22'),
(522, 'Щит/Символ', 94, 72, '2018-07-21 17:54:52', '2018-07-21 18:00:22', '2018-07-21 18:00:22'),
(523, 'Уголь', 1, 73, '2018-07-21 21:24:53', '2018-07-21 22:46:53', '2018-07-21 22:46:53'),
(524, 'Железо', 2, 73, '2018-07-21 21:26:56', '2018-07-21 22:46:53', '2018-07-21 22:46:53'),
(525, 'Железо', 100, 74, '2018-07-21 22:47:34', '2018-07-21 22:47:34', NULL),
(526, 'Уголь', 99, 74, '2018-07-21 22:47:34', '2018-07-21 22:47:34', NULL),
(527, '1 ур.', NULL, 75, '2018-07-21 22:51:16', '2018-07-21 22:51:16', NULL),
(528, '2 ур.', NULL, 75, '2018-07-21 22:51:16', '2018-07-21 22:51:16', NULL),
(529, '3 ур.', NULL, 75, '2018-07-21 22:51:16', '2018-07-21 22:51:16', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `sub_tag_sub_tag_metadata`
--

CREATE TABLE `sub_tag_sub_tag_metadata` (
  `id` int(10) UNSIGNED NOT NULL,
  `sub_tag_id` int(11) NOT NULL,
  `sub_tag_metadata_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `sub_tag_tag`
--

CREATE TABLE `sub_tag_tag` (
  `id` int(10) UNSIGNED NOT NULL,
  `tag_id` int(11) NOT NULL,
  `sub_tag_id` int(11) NOT NULL,
  `game_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `sub_tag_tag`
--

INSERT INTO `sub_tag_tag` (`id`, `tag_id`, `sub_tag_id`, `game_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(13, 2, 17, 1, '2018-05-31 14:52:45', '2018-06-06 16:33:18', NULL),
(14, 2, 18, 1, '2018-05-31 14:59:31', '2018-06-08 14:24:08', NULL),
(19, 2, 23, 1, '2018-05-31 16:10:31', '2018-06-08 13:20:13', NULL),
(21, 2, 25, 1, '2018-05-31 16:28:03', '2018-06-08 13:22:24', NULL),
(23, 2, 27, 1, '2018-05-31 16:37:31', '2018-06-08 14:24:28', NULL),
(25, 2, 29, 1, '2018-05-31 19:22:23', '2018-06-08 13:26:36', NULL),
(26, 2, 30, 1, '2018-05-31 19:24:35', '2018-06-08 14:22:25', NULL),
(28, 2, 32, 1, '2018-05-31 19:43:56', '2018-06-08 13:20:41', NULL),
(29, 2, 33, 13, '2018-05-31 19:58:07', '2018-06-08 13:19:53', NULL),
(30, 2, 34, 1, '2018-06-04 18:52:36', '2018-06-08 13:29:07', NULL),
(31, 2, 35, 1, '2018-06-04 18:57:18', '2018-06-08 13:34:52', NULL),
(32, 2, 36, 1, '2018-06-04 19:04:11', '2018-06-08 13:21:27', NULL),
(33, 2, 37, 1, '2018-06-04 19:08:37', '2018-06-08 13:31:40', NULL),
(34, 2, 38, 13, '2018-06-05 15:55:59', '2018-06-05 15:58:33', NULL),
(35, 2, 39, 13, '2018-06-05 16:02:40', '2018-06-08 13:29:38', NULL),
(36, 1, 40, 1, '2018-06-08 13:53:13', '2018-06-08 13:58:37', NULL),
(37, 1, 41, 1, '2018-06-08 14:00:56', '2018-06-08 14:00:56', NULL),
(39, 2, 43, 13, '2018-06-08 14:13:39', '2018-06-08 14:13:39', NULL),
(40, 2, 44, 13, '2018-06-08 14:14:54', '2018-06-08 14:14:54', NULL),
(41, 2, 45, 13, '2018-06-08 14:15:53', '2018-06-08 14:38:23', NULL),
(42, 2, 46, 13, '2018-06-08 14:20:22', '2018-06-08 14:20:22', NULL),
(43, 2, 47, 13, '2018-06-08 14:28:46', '2018-06-08 14:37:30', NULL),
(44, 2, 48, 13, '2018-06-08 14:31:30', '2018-06-08 14:38:07', NULL),
(45, 2, 49, 13, '2018-06-08 14:34:24', '2018-06-08 14:38:40', NULL),
(46, 2, 50, 13, '2018-06-08 14:35:26', '2018-06-08 14:35:26', NULL),
(47, 2, 51, 13, '2018-06-08 14:41:25', '2018-06-08 14:42:53', NULL),
(48, 3, 52, 1, '2018-06-11 15:45:24', '2018-06-11 15:46:02', NULL),
(49, 2, 53, 24, '2018-06-11 15:59:52', '2018-06-11 15:59:52', NULL),
(50, 1, 54, 23, '2018-06-11 16:07:20', '2018-06-11 16:07:20', NULL),
(51, 2, 55, 23, '2018-06-11 16:08:44', '2018-06-11 16:08:44', NULL),
(52, 3, 56, 26, '2018-06-25 18:18:18', '2018-06-25 18:18:18', NULL),
(53, 2, 57, 26, '2018-06-25 18:22:07', '2018-06-25 18:22:07', NULL),
(54, 2, 58, 26, '2018-06-25 18:25:26', '2018-07-21 17:46:43', NULL),
(55, 2, 59, 26, '2018-06-25 18:27:17', '2018-07-21 18:04:43', NULL),
(56, 2, 60, 26, '2018-06-25 18:29:02', '2018-06-25 18:29:02', NULL),
(57, 1, 61, 26, '2018-06-25 18:35:35', '2018-06-25 18:35:35', NULL),
(58, 2, 62, 26, '2018-06-25 18:37:46', '2018-06-25 18:37:46', NULL),
(59, 2, 63, 26, '2018-06-25 18:39:09', '2018-07-21 18:02:26', NULL),
(60, 2, 64, 26, '2018-06-25 18:42:25', '2018-06-25 18:42:25', NULL),
(61, 2, 65, 26, '2018-06-25 18:45:32', '2018-06-25 18:45:32', NULL),
(62, 2, 66, 26, '2018-06-25 18:47:39', '2018-07-21 18:01:56', NULL),
(63, 2, 67, 26, '2018-06-25 18:50:32', '2018-06-25 18:50:32', NULL),
(64, 1, 68, 26, '2018-06-25 18:52:27', '2018-06-25 18:52:27', NULL),
(65, 2, 69, 26, '2018-06-25 18:53:46', '2018-06-25 18:53:46', NULL),
(66, 2, 70, 26, '2018-06-25 18:55:52', '2018-07-21 18:03:45', NULL),
(70, 2, 74, 28, '2018-07-21 22:47:34', '2018-07-21 22:47:34', NULL),
(71, 2, 75, 28, '2018-07-21 22:51:16', '2018-07-21 22:51:16', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `tags`
--

CREATE TABLE `tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price_per_unit` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `tags`
--

INSERT INTO `tags` (`id`, `name`, `price_per_unit`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Accounts', 0, '2017-09-20 06:06:18', '2019-08-15 11:46:17', NULL),
(2, 'Items', 1, '2017-09-20 06:06:29', '2019-08-15 11:43:06', NULL),
(3, 'Services', 0, '2017-09-20 06:06:39', '2019-08-15 11:45:01', NULL),
(4, 'Кинары', 0, '2017-09-20 06:06:47', '2017-09-21 03:40:23', '2017-09-21 03:40:23'),
(5, 'RU', 0, '2017-09-20 08:48:58', '2017-09-20 08:50:00', '2017-09-20 08:50:00'),
(6, 'Новый тег', 0, '2018-07-09 16:47:28', '2018-07-10 12:16:58', '2018-07-10 12:16:58'),
(7, 'Crystals', 0, '2018-07-09 16:49:25', '2019-08-15 11:46:27', NULL),
(8, 'Silver', 0, '2018-07-09 19:50:40', '2019-08-15 11:44:28', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `trades`
--

CREATE TABLE `trades` (
  `id` int(10) UNSIGNED NOT NULL,
  `owner_id` int(10) UNSIGNED DEFAULT NULL,
  `buyer_id` int(10) UNSIGNED DEFAULT NULL,
  `send_id` int(11) DEFAULT NULL,
  `lot_id` int(10) UNSIGNED DEFAULT NULL,
  `payment_id` int(11) NOT NULL,
  `character_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount_clear` double(20,3) DEFAULT NULL,
  `price` double(20,3) NOT NULL,
  `get_availability` double(20,3) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `refuse_moderator_id` int(10) UNSIGNED DEFAULT NULL,
  `refuse_date` datetime DEFAULT NULL,
  `is_payed` int(11) NOT NULL DEFAULT '0',
  `closed_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `trades`
--

INSERT INTO `trades` (`id`, `owner_id`, `buyer_id`, `send_id`, `lot_id`, `payment_id`, `character_name`, `amount_clear`, `price`, `get_availability`, `status`, `refuse_moderator_id`, `refuse_date`, `is_payed`, `closed_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 11, 1, NULL, 4, 5, 'wickbull', 120.000, 129.032, 12.000, 1, NULL, NULL, 0, NULL, '2019-08-23 12:17:38', '2019-08-23 12:17:38', NULL),
(2, 12, 1, NULL, 13, 1, 'wickbull', 100.000, 100.000, 10.000, 0, NULL, NULL, 1, NULL, '2019-09-04 14:26:46', '2019-09-16 13:33:49', NULL),
(3, 11, 1, NULL, 5, 1, 'wickbull', 123.000, 123.000, 10.250, 1, NULL, NULL, 1, NULL, '2019-09-04 14:27:06', '2019-09-04 14:27:06', NULL),
(4, 11, 1, NULL, 5, 1, 'wickbull', 123.000, 123.000, 10.250, 1, NULL, NULL, 1, NULL, '2019-09-04 14:27:14', '2019-09-04 14:27:14', NULL),
(5, 12, 11, NULL, 13, 1, 'asdasd', 100.000, 100.000, 10.000, 1, NULL, NULL, 1, NULL, '2019-09-04 14:28:06', '2019-09-04 14:28:06', NULL),
(6, 12, 11, NULL, 13, 1, 'asdasd', 100.000, 100.000, 10.000, 1, NULL, NULL, 1, NULL, '2019-09-04 14:28:11', '2019-09-04 14:28:11', NULL),
(7, 12, 11, NULL, 13, 1, 'asdasd', 100.000, 100.000, 10.000, 1, NULL, NULL, 1, NULL, '2019-09-04 14:28:14', '2019-09-04 14:28:14', NULL),
(8, 11, 16, NULL, 5, 1, 'lol', 9999.996, 10000.000, 833.333, 0, NULL, NULL, 1, NULL, '2019-09-04 16:25:39', '2019-09-04 16:26:11', NULL),
(9, 11, 16, NULL, 6, 1, 'lolяЧ', 1000.000, 1000.000, 250.000, 0, NULL, NULL, 1, NULL, '2019-09-04 16:27:13', '2019-09-04 16:27:22', NULL),
(10, 11, 16, NULL, 4, 1, 'wickbull', 120.000, 120.000, 12.000, 1, NULL, NULL, 1, NULL, '2019-09-04 17:14:28', '2019-09-04 17:14:28', NULL),
(11, 11, 16, NULL, 5, 1, '23', 321.000, 321.000, 26.750, 1, NULL, NULL, 1, NULL, '2019-09-04 17:42:02', '2019-09-04 17:42:02', NULL),
(12, 12, 11, NULL, 9, 1, 'pzdc', 1233.960, 1234.000, 10.283, 1, NULL, NULL, 1, NULL, '2019-09-05 10:10:03', '2019-09-05 10:10:04', NULL),
(13, 12, 11, NULL, 13, 1, 'hyui', 123.000, 123.000, 12.300, 1, NULL, NULL, 1, NULL, '2019-09-06 09:21:27', '2019-09-06 09:21:28', NULL),
(14, 12, 11, NULL, 13, 1, 'hyui', 123.000, 123.000, 12.300, 1, NULL, NULL, 1, NULL, '2019-09-06 09:22:03', '2019-09-06 09:22:04', NULL),
(15, 12, 11, NULL, 30, 1, 'hyi', 1230.000, 1230.000, 10.000, 0, NULL, NULL, 1, NULL, '2019-09-06 09:22:32', '2019-09-06 09:23:26', NULL),
(16, 11, 12, NULL, 6, 1, 'wickbull', 2000.000, 2000.000, 500.000, 1, NULL, NULL, 1, NULL, '2019-09-06 12:39:20', '2019-09-06 12:39:20', NULL),
(17, 11, 12, NULL, 4, 1, 'wickbull', 120.000, 120.000, 12.000, 1, NULL, NULL, 1, NULL, '2019-09-06 12:40:33', '2019-09-06 12:40:33', NULL),
(18, 11, 12, NULL, 4, 1, 'wickbull', 10.000, 10.000, 1.000, 1, NULL, NULL, 1, NULL, '2019-09-06 13:19:26', '2019-09-06 13:19:27', NULL),
(19, 11, 12, 10, 4, 1, 'wickbull', 10.000, 10.000, 1.000, 1, NULL, NULL, 1, NULL, '2019-09-06 13:37:31', '2019-09-06 13:37:31', NULL),
(20, 11, 12, 12, 4, 1, 'wickbull', 100.000, 100.000, 10.000, 1, NULL, NULL, 1, NULL, '2019-09-06 14:41:15', '2019-09-06 14:41:15', NULL),
(21, 11, 1, NULL, 3, 1, 'wwww', 111.948, 112.000, 0.982, 1, NULL, NULL, 1, NULL, '2019-09-12 10:34:38', '2019-09-12 10:34:38', NULL),
(22, 11, 1, NULL, 6, 1, 'weqe', 122.000, 122.000, 30.500, 1, NULL, NULL, 1, NULL, '2019-09-12 10:58:49', '2019-09-12 10:58:49', NULL),
(23, 11, 1, NULL, 6, 1, 'weqe', 122.000, 122.000, 30.500, 1, NULL, NULL, 1, NULL, '2019-09-12 11:00:09', '2019-09-12 11:00:09', NULL),
(24, 11, 1, NULL, 6, 1, 'weqe', 122.000, 122.000, 30.500, 1, NULL, NULL, 1, NULL, '2019-09-12 11:00:26', '2019-09-12 11:00:27', NULL),
(25, 11, 1, NULL, 6, 1, 'sdas', 111.000, 111.000, 27.750, 0, NULL, NULL, 1, NULL, '2019-09-12 11:02:27', '2019-09-17 11:10:50', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_block` tinyint(1) DEFAULT NULL,
  `is_block_payment` tinyint(1) DEFAULT NULL,
  `create_lot` tinyint(4) DEFAULT NULL,
  `buy_lot` tinyint(4) DEFAULT NULL,
  `get_money` tinyint(4) DEFAULT NULL,
  `online` tinyint(4) DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `ip` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `balance` double(10,3) DEFAULT '0.000',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `confirmed_rules` tinyint(1) NOT NULL DEFAULT '0',
  `confirmation_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `firstname`, `lastname`, `username`, `provider`, `provider_id`, `is_block`, `is_block_payment`, `create_lot`, `buy_lot`, `get_money`, `online`, `password`, `remember_token`, `created_at`, `updated_at`, `ip`, `phone`, `rating`, `balance`, `status`, `confirmed`, `confirmed_rules`, `confirmation_code`, `deleted_at`) VALUES
(1, 1, 'Admin', 'admin@tv.laraman.ru', 'users/default.png', '0', '0', '0', '0', '0', NULL, NULL, 0, 0, 0, 0, 'e5e9fa1ba31ecd1ae84f75caaa474f3a663f05f4', 'Ba3U1QNzXV58xnQ70gyrEnPWMm0OGL52q3ZLgw7ZYgpvDFHq5PAUCHMZYLpX', '2018-04-24 14:32:56', '2019-09-17 01:12:17', '94.153.103.177', '380968182526', '0', 1044.998, '0', 1, 1, '0', NULL),
(2, 1, 'SomeSay', 'badolf2015@gmail.com', 'https://lh5.googleusercontent.com/-AtwACJmBg1s/AAAAAAAAAAI/AAAAAAAAAJY/phU-5Xvc3Hs/photo.jpg?sz=50', '0', '0', '0', 'google', '109195121458633655171', NULL, NULL, 0, 0, 0, 0, 'e5e9fa1ba31ecd1ae84f75caaa474f3a663f05f4', 'suz43WgEjrKHtbxIKxaQhmK8VBEVyhAdwlNGiBLwReDW5zWaMt6YsxN4sHWC', '2018-04-24 14:38:07', '2019-09-04 13:46:37', '127.0.0.1', '380968182526', '0', 1848.360, '0', 1, 1, NULL, NULL),
(3, 1, 'Testo', 'orobey_ruslan90@mail.ru', NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, 'e5e9fa1ba31ecd1ae84f75caaa474f3a663f05f4', 'mekrP0cNY8vNp6Ykj96S8dzADXf4EMf3yDDnuxlOYbbFnxIgnsT4fGM5KKHP', '2018-04-24 14:39:59', '2019-09-04 13:48:08', '127.0.0.1', '380672777859', '17', 4324.180, '0', 1, 1, NULL, NULL),
(4, 1, 'Andriy Pilko', 'pilkoandriy94@gmail.com', NULL, '0', '0', '0', '0', '0', 0, 0, 0, 0, 0, 0, 'e5e9fa1ba31ecd1ae84f75caaa474f3a663f05f4', 'yqMfSF0klRrTXsR7ZQ4IOssAkMzsZBg7Kbmevs3E9UNozWKarBbzuENW52MR', '2018-04-24 14:43:11', '2019-09-04 13:48:58', '127.0.0.1', '+380631996721', '0', 1724.476, '0', 1, 1, '0', NULL),
(5, 2, 'vagabund2', 'vagabund2@ukr.net', '/default-avatar.svg', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, 'e5e9fa1ba31ecd1ae84f75caaa474f3a663f05f4', '4CsgcombFbfgvToHbtt6fPjBbtmXD8npMSLZBkMe0xOIX3QE0sXoAPA6T1vp', '2018-09-01 09:51:10', '2019-09-04 13:49:46', '127.0.0.1', '0936336842', '0', 4324.180, '0', 1, 1, NULL, NULL),
(6, 2, 'Master gold', 'pwupload@yandex.ru', '/users_avatars/1537358979-C33D7AE8-6E0B-4195-9DB0-0690C123711E.jpeg', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, 'e5e9fa1ba31ecd1ae84f75caaa474f3a663f05f4', 'E52TqjyxzuGCn7tebqZqFf0t1bzfr7edxJHJWuduwjs292nFz7ommT8DllO9', '2018-09-19 12:08:55', '2019-09-04 13:50:39', '127.0.0.1', '0936336842', '0', 4324.180, '0', 1, 1, 'u1uzfZuZj7YgfpH5mlDwzqI5bdMAPY', NULL),
(7, 2, 'YentZer', 'amon4122@gmail.com', '/default-avatar.svg', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, 'e5e9fa1ba31ecd1ae84f75caaa474f3a663f05f4', 'HfRx93CdETztq2FtQXEdZvWN8INvvmqPVXIhTAnlcRAsw8BxTMD568aaW3N6', '2018-11-19 15:42:47', '2019-09-04 13:51:33', '127.0.0.1', '0936336842', '0', 4324.180, '0', 1, 1, 'fmhCzO8Ai880v5VdT88sEXFajNuKzf', NULL),
(10, 2, 'paza', 'admin2@tv.laraman.ru', '/default-avatar.svg', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, 'e5e9fa1ba31ecd1ae84f75caaa474f3a663f05f4', '4iPIb9cGnuWDz5778lKAbwZHifdpwiskip25wQHgnCifSvvNJCF0GLO5gqFE', '2019-08-19 10:44:42', '2019-08-19 10:44:42', '127.0.0.1', '0936336842', '0', 4324.180, '0', 1, 1, 'eybPj7SVLEcqNlD6k7smN6CIEJgtoH', NULL),
(11, 1, 'wickbull', 'wicked.redbull@gmail.com', '/default-avatar.svg', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, 'e5e9fa1ba31ecd1ae84f75caaa474f3a663f05f4', 'EBLcnox8fz0Ya8JHD5DzINK3pEsgKGgRe0oafmcyVyNIGTpB0L1Ln0qaoL2B', '2019-08-19 10:53:20', '2019-09-17 11:11:21', '127.0.0.1', '380931137675', '1', 12425.176, '0', 1, 1, NULL, NULL),
(12, 1, 'vikiokina', 'vikiokina@gmail.com', '/default-avatar.svg', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, 'e5e9fa1ba31ecd1ae84f75caaa474f3a663f05f4', 'c0ETGzIngJ8Ojp15izhA5EPfs43HNvR24gjxasyG8wsgg8SO964Bt6MJRVc2', '2019-08-27 15:01:51', '2019-09-16 13:33:43', '127.0.0.1', '380979080926', '0', 3414.180, '0', 1, 1, NULL, NULL),
(13, 2, 'd', 'kadevska@ucu.edu.ua', '/default-avatar.svg', NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, 'e5e9fa1ba31ecd1ae84f75caaa474f3a663f05f4', NULL, '2019-09-02 12:45:07', '2019-09-02 12:45:07', '176.125.46.97', '0936336842', '0', 4324.180, '0', 1, 1, '6vm6JhrASPuKS5aaQVnnWrjlIJiBGF', NULL),
(14, 2, 'dub', 'dub@dub.com', '/default-avatar.svg', '0', '0', '0', '0', '0', NULL, NULL, NULL, 0, 0, 0, 'e5e9fa1ba31ecd1ae84f75caaa474f3a663f05f4', 'ymSnhS536BiZauXZHdXVcn0iMMLTe2cRhBefmvAPadRkGLFR7aVtvJGBln6C', '2019-09-04 14:04:27', '2019-09-04 14:07:37', '127.0.0.1', '0931137675', '0', 43.240, '0', 1, 1, NULL, NULL),
(15, 2, 'dub2', 'dub2@dub.com', '/default-avatar.svg', '0', '0', '0', '0', '0', 0, 0, 0, 0, 0, 0, 'e5e9fa1ba31ecd1ae84f75caaa474f3a663f05f4', 'GZ5IABmvKlrUB8cMjdNntHfDKlQ5brjjHOXg6ahfWOlL6owxtYEEUb4jKPKs', '2019-09-04 14:06:01', '2019-09-04 14:08:57', '127.0.0.1', '0931137675', '0', 43.000, '0', 1, 1, NULL, NULL),
(16, 2, 'dub3', 'dub3@dub.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'e5e9fa1ba31ecd1ae84f75caaa474f3a663f05f4', 'otDlfZtsoey5NXWK0AHSTh6nQkaAifyw8UPuRlzMk5GjB2i1oz5TKIOdcNqd', '2019-09-04 14:10:08', '2019-09-04 17:42:02', '127.0.0.1', '0931137675', '0', 88559.000, NULL, 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `user_wallets`
--

CREATE TABLE `user_wallets` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `wallet_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `user_wallets`
--

INSERT INTO `user_wallets` (`id`, `user_id`, `currency_id`, `wallet_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(67, 2, 6, 'R428330913902', '2018-06-20 17:16:11', '2018-06-20 17:16:11', NULL),
(68, 2, 3, '410011580546087', '2018-06-20 17:16:11', '2018-06-20 17:16:11', NULL),
(69, 2, 4, '+380968182526', '2018-06-20 17:16:11', '2018-06-20 17:16:11', NULL),
(87, 3, 3, '41001672889783', '2018-07-05 19:41:11', '2018-07-05 19:41:11', NULL),
(88, 3, 4, '+79522917240', '2018-07-05 19:41:11', '2018-07-05 19:41:11', NULL),
(97, 82, 3, '41001529754338', '2018-07-23 17:30:27', '2018-07-23 17:30:27', NULL),
(98, 4, 6, 'R123123212', '2018-07-24 10:25:53', '2018-07-24 10:25:53', NULL),
(99, 4, 3, '41001672889783', '2018-07-24 10:25:53', '2018-07-24 10:25:53', NULL),
(100, 4, 6, 'U340484593611', '2018-07-24 10:25:53', '2018-07-24 10:25:53', NULL),
(101, 4, 6, 'R820253507708', '2018-07-24 10:25:53', '2018-07-24 10:25:53', NULL),
(102, 4, 6, 'R305371395884', '2018-07-24 10:25:53', '2018-07-24 10:25:53', NULL),
(103, 4, 4, '+380631996701', '2018-07-24 10:25:53', '2018-07-24 10:25:53', NULL),
(104, 4, 6, 'R428330913902', '2018-07-24 10:25:53', '2018-07-24 10:25:53', NULL),
(105, 4, 6, 'E991901919453', '2018-07-24 10:25:53', '2018-07-24 10:25:53', NULL),
(106, 1, 6, 'R305371395884', '2019-09-17 10:46:13', '2019-09-17 10:46:13', NULL),
(107, 1, 3, '123123123123', '2019-09-17 10:46:13', '2019-09-17 10:46:13', NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `block_ips`
--
ALTER TABLE `block_ips`
  ADD PRIMARY KEY (`id`),
  ADD KEY `block_ips_user_id_foreign` (`user_id`);

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Индексы таблицы `chat_disputs`
--
ALTER TABLE `chat_disputs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_disputs_admin_id_foreign` (`admin_id`),
  ADD KEY `chat_disputs_dialog_id_foreign` (`dialog_id`);

--
-- Индексы таблицы `chat_settings`
--
ALTER TABLE `chat_settings`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Индексы таблицы `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Индексы таблицы `dialogs`
--
ALTER TABLE `dialogs`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `dialog_messages`
--
ALTER TABLE `dialog_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dialog_messages_sender_id_foreign` (`sender_id`),
  ADD KEY `dialog_messages_dialog_id_foreign` (`dialog_id`),
  ADD KEY `dialog_messages_lot_id_foreign` (`lot_id`);

--
-- Индексы таблицы `dialog_participants`
--
ALTER TABLE `dialog_participants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dialog_participants_user_id_foreign` (`user_id`),
  ADD KEY `dialog_participants_dialog_id_foreign` (`dialog_id`);

--
-- Индексы таблицы `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `game_currency`
--
ALTER TABLE `game_currency`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `game_custom_params`
--
ALTER TABLE `game_custom_params`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `game_tag`
--
ALTER TABLE `game_tag`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoices_currency_id_foreign` (`currency_id`),
  ADD KEY `invoices_trade_id_foreign` (`trade_id`),
  ADD KEY `invoices_user_id_foreign` (`user_id`);

--
-- Индексы таблицы `langs`
--
ALTER TABLE `langs`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `lang_index_names`
--
ALTER TABLE `lang_index_names`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `lang_index_structures`
--
ALTER TABLE `lang_index_structures`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `lang_index_translations`
--
ALTER TABLE `lang_index_translations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `lots`
--
ALTER TABLE `lots`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lots_currency_id_foreign` (`currency_id`),
  ADD KEY `lots_game_id_foreign` (`game_id`),
  ADD KEY `lots_owner_id_foreign` (`owner_id`),
  ADD KEY `lots_server_id_foreign` (`server_id`),
  ADD KEY `lots_tag_id_foreign` (`tag_id`);

--
-- Индексы таблицы `lot_sub_tags`
--
ALTER TABLE `lot_sub_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lot_sub_tags_lot_id_foreign` (`lot_id`),
  ADD KEY `lot_sub_tags_sub_tag_id_foreign` (`sub_tag_id`),
  ADD KEY `lot_sub_tags_sub_tag_value_id_foreign` (`sub_tag_value_id`);

--
-- Индексы таблицы `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Индексы таблицы `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Индексы таблицы `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `payment_histories`
--
ALTER TABLE `payment_histories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `payouts`
--
ALTER TABLE `payouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payouts_user_id_foreign` (`user_id`),
  ADD KEY `payouts_admin_id_foreign` (`admin_id`),
  ADD KEY `payouts_currency_id_foreign` (`currency_id`);

--
-- Индексы таблицы `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Индексы таблицы `permission_groups`
--
ALTER TABLE `permission_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permission_groups_name_unique` (`name`);

--
-- Индексы таблицы `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Индексы таблицы `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Индексы таблицы `price_commissions`
--
ALTER TABLE `price_commissions`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_trade_id_foreign` (`trade_id`),
  ADD KEY `reviews_user_id_foreign` (`user_id`),
  ADD KEY `reviews_seller_id_foreign` (`seller_id`);

--
-- Индексы таблицы `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Индексы таблицы `servers`
--
ALTER TABLE `servers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `servers_game_id_foreign` (`game_id`);

--
-- Индексы таблицы `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Индексы таблицы `site_wallets`
--
ALTER TABLE `site_wallets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `site_wallets_merchant_id_foreign` (`merchant_id`);

--
-- Индексы таблицы `sms_codes`
--
ALTER TABLE `sms_codes`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `sub_tags`
--
ALTER TABLE `sub_tags`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `sub_tag_metadatas`
--
ALTER TABLE `sub_tag_metadatas`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `sub_tag_sub_tag_metadata`
--
ALTER TABLE `sub_tag_sub_tag_metadata`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `sub_tag_tag`
--
ALTER TABLE `sub_tag_tag`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tags_name_unique` (`name`);

--
-- Индексы таблицы `trades`
--
ALTER TABLE `trades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `trades_refuse_moderator_id_foreign` (`refuse_moderator_id`),
  ADD KEY `trades_owner_id_foreign` (`owner_id`),
  ADD KEY `trades_buyer_id_foreign` (`buyer_id`),
  ADD KEY `trades_lot_id_foreign` (`lot_id`);

--
-- Индексы таблицы `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Индексы таблицы `user_wallets`
--
ALTER TABLE `user_wallets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_wallets_user_id_foreign` (`user_id`),
  ADD KEY `user_wallets_currency_id_foreign` (`currency_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `block_ips`
--
ALTER TABLE `block_ips`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `chat_disputs`
--
ALTER TABLE `chat_disputs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `chat_settings`
--
ALTER TABLE `chat_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT для таблицы `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;
--
-- AUTO_INCREMENT для таблицы `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT для таблицы `dialogs`
--
ALTER TABLE `dialogs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT для таблицы `dialog_messages`
--
ALTER TABLE `dialog_messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;
--
-- AUTO_INCREMENT для таблицы `dialog_participants`
--
ALTER TABLE `dialog_participants`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT для таблицы `games`
--
ALTER TABLE `games`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT для таблицы `game_currency`
--
ALTER TABLE `game_currency`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;
--
-- AUTO_INCREMENT для таблицы `game_custom_params`
--
ALTER TABLE `game_custom_params`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT для таблицы `game_tag`
--
ALTER TABLE `game_tag`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=320;
--
-- AUTO_INCREMENT для таблицы `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT для таблицы `langs`
--
ALTER TABLE `langs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `lang_index_names`
--
ALTER TABLE `lang_index_names`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT для таблицы `lang_index_structures`
--
ALTER TABLE `lang_index_structures`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=430;
--
-- AUTO_INCREMENT для таблицы `lang_index_translations`
--
ALTER TABLE `lang_index_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=730;
--
-- AUTO_INCREMENT для таблицы `lots`
--
ALTER TABLE `lots`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT для таблицы `lot_sub_tags`
--
ALTER TABLE `lot_sub_tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT для таблицы `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT для таблицы `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;
--
-- AUTO_INCREMENT для таблицы `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `payment_histories`
--
ALTER TABLE `payment_histories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `payouts`
--
ALTER TABLE `payouts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;
--
-- AUTO_INCREMENT для таблицы `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT для таблицы `permission_groups`
--
ALTER TABLE `permission_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `price_commissions`
--
ALTER TABLE `price_commissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT для таблицы `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `servers`
--
ALTER TABLE `servers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;
--
-- AUTO_INCREMENT для таблицы `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `site_wallets`
--
ALTER TABLE `site_wallets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT для таблицы `sms_codes`
--
ALTER TABLE `sms_codes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT для таблицы `sub_tags`
--
ALTER TABLE `sub_tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;
--
-- AUTO_INCREMENT для таблицы `sub_tag_metadatas`
--
ALTER TABLE `sub_tag_metadatas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=530;
--
-- AUTO_INCREMENT для таблицы `sub_tag_sub_tag_metadata`
--
ALTER TABLE `sub_tag_sub_tag_metadata`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `sub_tag_tag`
--
ALTER TABLE `sub_tag_tag`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;
--
-- AUTO_INCREMENT для таблицы `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT для таблицы `trades`
--
ALTER TABLE `trades`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT для таблицы `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT для таблицы `user_wallets`
--
ALTER TABLE `user_wallets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `block_ips`
--
ALTER TABLE `block_ips`
  ADD CONSTRAINT `block_ips_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `chat_disputs`
--
ALTER TABLE `chat_disputs`
  ADD CONSTRAINT `chat_disputs_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `chat_disputs_dialog_id_foreign` FOREIGN KEY (`dialog_id`) REFERENCES `dialogs` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `dialog_messages`
--
ALTER TABLE `dialog_messages`
  ADD CONSTRAINT `dialog_messages_dialog_id_foreign` FOREIGN KEY (`dialog_id`) REFERENCES `dialogs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `dialog_messages_lot_id_foreign` FOREIGN KEY (`lot_id`) REFERENCES `lots` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `dialog_messages_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `dialog_participants`
--
ALTER TABLE `dialog_participants`
  ADD CONSTRAINT `dialog_participants_dialog_id_foreign` FOREIGN KEY (`dialog_id`) REFERENCES `dialogs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `dialog_participants_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Ограничения внешнего ключа таблицы `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `price_commissions` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `invoices_trade_id_foreign` FOREIGN KEY (`trade_id`) REFERENCES `trades` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `invoices_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `lots`
--
ALTER TABLE `lots`
  ADD CONSTRAINT `lots_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `lots_game_id_foreign` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `lots_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `lots_server_id_foreign` FOREIGN KEY (`server_id`) REFERENCES `servers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `lots_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `lot_sub_tags`
--
ALTER TABLE `lot_sub_tags`
  ADD CONSTRAINT `lot_sub_tags_lot_id_foreign` FOREIGN KEY (`lot_id`) REFERENCES `lots` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lot_sub_tags_sub_tag_id_foreign` FOREIGN KEY (`sub_tag_id`) REFERENCES `sub_tags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lot_sub_tags_sub_tag_value_id_foreign` FOREIGN KEY (`sub_tag_value_id`) REFERENCES `sub_tag_metadatas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `payouts`
--
ALTER TABLE `payouts`
  ADD CONSTRAINT `payouts_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `payouts_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `price_commissions` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `payouts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_seller_id_foreign` FOREIGN KEY (`seller_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reviews_trade_id_foreign` FOREIGN KEY (`trade_id`) REFERENCES `trades` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `servers`
--
ALTER TABLE `servers`
  ADD CONSTRAINT `servers_game_id_foreign` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `site_wallets`
--
ALTER TABLE `site_wallets`
  ADD CONSTRAINT `site_wallets_merchant_id_foreign` FOREIGN KEY (`merchant_id`) REFERENCES `price_commissions` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `trades`
--
ALTER TABLE `trades`
  ADD CONSTRAINT `trades_buyer_id_foreign` FOREIGN KEY (`buyer_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `trades_lot_id_foreign` FOREIGN KEY (`lot_id`) REFERENCES `lots` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `trades_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `trades_refuse_moderator_id_foreign` FOREIGN KEY (`refuse_moderator_id`) REFERENCES `users` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
