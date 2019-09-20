-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Хост: 46.36.217.60
-- Время создания: Авг 07 2019 г., 13:47
-- Версия сервера: 5.6.43
-- Версия PHP: 7.3.7-2+ubuntu18.04.1+deb.sury.org+1

-- SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `big2`
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
(1, 'Адена', 'кк', 0.00000, '2017-09-21 02:46:18', '2018-06-11 13:39:22', NULL),
(2, 'Кинары', 'кк', 0.00000, '2017-09-21 03:34:22', '2018-06-09 17:58:43', NULL),
(3, 'Золото', 'к', 0.00000, '2017-09-21 03:34:38', '2018-06-11 12:33:31', NULL),
(4, 'Серебро', NULL, 0.00000, '2017-09-21 03:34:44', '2017-09-21 03:34:44', NULL),
(5, 'Alz', NULL, 0.00000, '2017-09-21 03:35:06', '2017-09-21 03:35:06', NULL),
(6, 'Монеты', NULL, 0.00000, '2017-09-21 03:35:15', '2017-09-21 03:35:15', NULL),
(7, 'Кредиты', NULL, 0.00000, '2017-09-21 03:35:23', '2017-09-21 03:35:23', NULL),
(8, 'Вирты', NULL, 0.00000, '2017-09-21 03:35:44', '2017-09-21 03:35:44', NULL),
(9, 'ISK', NULL, 0.00000, '2017-09-21 03:35:58', '2017-09-21 03:35:58', NULL),
(10, 'Бриллианты', NULL, 0.00000, '2017-09-21 03:36:08', '2017-09-21 03:36:08', NULL),
(11, 'Сферы возвышения', NULL, 0.00000, '2017-09-21 03:36:51', '2017-09-21 03:36:51', NULL),
(12, 'Зени', NULL, 0.00000, '2017-09-21 03:37:09', '2017-09-21 03:37:09', NULL),
(13, 'Рупи', NULL, 0.00000, '2017-09-21 03:37:17', '2017-09-21 03:37:17', NULL),
(14, 'Валюта', NULL, 0.00000, '2017-09-21 03:37:26', '2017-09-21 03:37:26', NULL),
(15, 'Ляни', NULL, 0.00000, '2017-09-21 03:37:39', '2017-09-21 03:37:39', NULL),
(16, 'Платина', NULL, 0.00000, '2017-09-21 03:37:52', '2017-09-21 03:37:52', NULL),
(17, 'Пополнение баланса', NULL, 0.00000, '2017-09-21 03:38:12', '2017-09-21 03:38:12', NULL),
(18, 'Рубли', '1000', 0.00000, '2017-09-21 03:38:21', '2017-09-26 09:45:46', NULL),
(19, 'Flux', NULL, 0.00000, '2017-09-21 03:38:32', '2017-09-21 03:38:32', NULL),
(20, 'Юани', 'кк', 0.00000, '2017-09-21 03:38:39', '2018-06-09 17:58:34', NULL),
(21, 'EUN', NULL, 0.00000, '2017-09-21 03:39:33', '2017-09-21 03:39:33', NULL),
(22, 'GB', NULL, 0.00000, '2017-09-21 03:39:38', '2017-09-21 03:39:38', NULL),
(23, 'Адена классик', '1к', 0.00000, '2018-06-09 18:12:37', '2018-06-09 18:21:39', '2018-06-09 18:21:39'),
(24, 'Адена.', '1к', 0.00000, '2018-06-09 18:21:57', '2018-06-09 20:33:11', '2018-06-09 20:33:11'),
(27, 'Золото', 'КК', 1.00000, '2018-06-11 12:33:21', '2018-06-11 12:33:21', NULL),
(28, 'Золото', 'ккк', 1.00000, '2018-06-11 12:40:57', '2018-06-11 12:40:57', NULL),
(29, 'Золото', 'зол.', 1.00000, '2018-06-11 12:41:05', '2018-06-11 12:41:05', NULL),
(30, 'Адена', 'к', 1.00000, '2018-06-11 12:52:16', '2018-06-19 15:57:45', NULL),
(31, 'Кристаллы', NULL, 1.00000, '2018-07-10 10:06:40', '2018-07-16 09:22:41', NULL),
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
(28, 'ArcheAge', 'RU, EU', NULL, '2018-07-21 21:14:12', '2018-07-21 21:18:01', NULL);

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
(51, '32', '28', NULL, NULL, NULL);

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
(309, 3, 28, NULL, NULL, NULL);

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `lots`
--

INSERT INTO `lots` (`id`, `currency_id`, `game_id`, `owner_id`, `server_id`, `tag_id`, `price`, `description`, `availability`, `min_order`, `status`, `active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 20, 24, 5, 62, NULL, 10.000, NULL, 800.000, 100.00, 1, 1, '2018-09-01 09:55:17', '2018-09-01 09:55:43', NULL);

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
(2, 1, 'Медиа', '/admin/media', '_self', 'voyager-images', '#000000', NULL, 6, '2017-09-14 06:07:06', '2017-10-30 14:18:55', NULL, ''),
(3, 1, 'Посты', '/admin/posts', '_self', 'voyager-news', '#000000', NULL, 7, '2017-09-14 06:07:06', '2017-10-30 14:19:16', NULL, ''),
(4, 1, 'Пользователи', '/admin/users', '_self', 'voyager-person', '#000000', NULL, 3, '2017-09-14 06:07:06', '2017-10-30 14:16:02', NULL, ''),
(5, 1, 'Категории', '/admin/categories', '_self', 'voyager-categories', '#000000', NULL, 9, '2017-09-14 06:07:06', '2017-10-30 14:19:34', NULL, ''),
(6, 1, 'Страницы', '/admin/pages', '_self', 'voyager-file-text', '#000000', NULL, 8, '2017-09-14 06:07:06', '2017-10-30 14:19:25', NULL, ''),
(7, 1, 'Роли', '/admin/roles', '_self', 'voyager-lock', '#000000', NULL, 2, '2017-09-14 06:07:06', '2017-10-30 14:15:31', NULL, ''),
(8, 1, 'Инструменты', '', '_self', 'voyager-tools', '#000000', NULL, 10, '2017-09-14 06:07:06', '2017-10-30 14:19:54', NULL, ''),
(9, 1, 'Свойства меню', '/admin/menus', '_self', 'voyager-list', '#000000', 8, 1, '2017-09-14 06:07:06', '2017-10-30 14:20:15', NULL, ''),
(10, 1, 'База даных', '/admin/database', '_self', 'voyager-data', '#000000', 8, 2, '2017-09-14 06:07:06', '2017-10-30 14:20:27', NULL, ''),
(11, 1, 'Настройки', '/admin/settings', '_self', 'voyager-settings', '#000000', NULL, 11, '2017-09-14 06:07:06', '2017-10-30 14:20:34', NULL, ''),
(12, 1, 'Игры', '/admin/games-list', '_self', 'voyager-controller', '#000000', 15, 1, '2017-09-19 04:19:43', '2017-10-30 14:17:00', NULL, ''),
(13, 1, 'Тег', '/admin/tags', '_self', 'voyager-tag', '#000000', 15, 3, '2017-09-20 02:27:02', '2017-10-30 14:17:27', NULL, ''),
(14, 1, 'Сервера', '/admin/servers', '_self', 'voyager-data', '#000000', 15, 2, '2017-09-20 08:32:23', '2017-10-30 14:17:07', NULL, ''),
(15, 1, 'Настройки игр', '', '_self', 'voyager-rocket', '#000000', NULL, 4, '2017-09-21 02:11:42', '2017-10-30 14:16:49', NULL, ''),
(16, 1, 'Игровая валюта', '/admin/currency', '_self', 'voyager-dollar', '#000000', 15, 4, '2017-09-21 02:13:20', '2017-10-30 14:17:37', NULL, ''),
(18, 1, 'Под теги', '/admin/sub-tags', '_self', 'voyager-list-add', '#000000', 15, 5, '2017-09-21 05:51:33', '2017-10-30 14:18:00', NULL, ''),
(19, 1, 'Лоты', '', '_self', 'voyager-receipt', '#000000', NULL, 5, '2017-10-03 02:49:53', '2017-10-30 14:18:33', NULL, ''),
(20, 1, 'Список лотов', '/admin/lots', '_self', 'voyager-window-list', '#000000', 19, 1, '2017-10-03 02:50:56', '2017-10-30 14:18:45', NULL, ''),
(21, 2, 'Мои продажи', '/sales', '_self', NULL, '#000000', NULL, 12, '2017-10-20 07:24:11', '2017-10-20 07:24:11', NULL, ''),
(22, 2, 'Мои покупки', '/purchases', '_self', NULL, '#000000', NULL, 13, '2017-10-20 07:24:36', '2017-10-20 07:24:36', NULL, ''),
(23, 2, 'Сообщения', '/chats', '_self', NULL, '#000000', NULL, 14, '2017-10-20 07:25:02', '2017-10-20 07:25:02', NULL, ''),
(24, 2, 'Кабинет', '/profile', '_self', NULL, '#000000', NULL, 15, '2017-10-20 07:25:17', '2017-10-20 07:25:17', NULL, ''),
(25, 3, 'Правила для продавцов', '/page/pravila-dlya-prodavcov', '_self', NULL, '#000000', NULL, 1, '2017-10-20 07:39:26', '2017-10-31 10:24:53', NULL, ''),
(26, 3, 'Разрешение споров', '/page/razreshenie-sporov', '_self', NULL, '#000000', 28, 1, '2017-10-20 07:39:54', '2017-10-31 10:25:01', NULL, ''),
(27, 3, 'Вопросы и ответы', '/page/voprosy-i-otvety', '_self', NULL, '#000000', NULL, 3, '2017-10-20 07:40:39', '2017-10-31 10:25:01', NULL, ''),
(29, 3, 'Разрешение споров', '/page/razreshenie-sporov', '_self', NULL, '#000000', NULL, 16, '2017-10-31 10:26:00', '2017-10-31 10:26:00', NULL, ''),
(30, 1, 'Комиссия', '/admin/commission', '_self', 'voyager-dollar', '#000000', 15, 17, '2018-03-12 14:16:06', '2018-03-12 14:16:06', NULL, NULL),
(31, 1, 'Чаты', '', '_self', 'voyager-chat', '#000000', NULL, 5, '2018-03-12 14:16:06', '2018-03-12 14:16:06', NULL, NULL),
(32, 1, 'Настройки чата', '/admin/chat-setting', '_self', 'voyager-params', '#000000', 31, 6, '2018-03-12 14:16:06', '2018-03-12 14:16:06', NULL, NULL),
(33, 1, 'Все чаты', '/admin/chat', '_self', 'voyager-megaphone', '#000000', 31, 7, '2018-03-12 14:16:06', '2018-03-12 14:16:06', NULL, NULL),
(34, 1, 'Сделки', '', '_self', 'voyager-chat', '#000000', NULL, 6, '2018-03-12 14:16:06', '2018-03-12 14:16:06', NULL, NULL),
(35, 1, 'Заявки на вывод', '/admin/payout', '_self', 'voyager-dollar', '#000000', 34, 6, '2018-03-12 14:16:06', '2018-03-12 14:16:06', NULL, NULL),
(36, 1, 'Все сделки', '/admin/trade', '_self', 'voyager-megaphone', '#000000', 34, 7, '2018-03-12 14:16:06', '2018-03-12 14:16:06', NULL, NULL),
(37, 1, 'Платежи', '/admin/invoice', '_self', 'voyager-dollar', '#000000', 34, 8, '2018-03-12 14:16:06', '2018-03-12 14:16:06', NULL, NULL),
(38, 1, 'Ключи (Платежных систем)', '/admin/site/wallet', '_self', 'voyager-settings', '#000000', 34, 9, '2018-03-12 14:16:06', '2018-03-12 14:16:06', NULL, NULL),
(39, 1, 'Комментарии', '/admin/comments', '_self', 'voyager-megaphone', '#000000', 31, 6, '2018-03-12 14:16:06', '2018-03-12 14:16:06', NULL, NULL);

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
(79, 'Сервер 1', 'Свет', 28, '2018-07-21 21:17:10', '2018-07-21 21:17:48', NULL);

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
(22, '8645', '0936336842', '2018-09-01 09:52:33', '2018-09-01 09:52:57', '2018-09-01 09:52:57');

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
(1, 'Аккаунты', 0, '2017-09-20 06:06:18', '2017-09-20 06:06:18', NULL),
(2, 'Предметы', 1, '2017-09-20 06:06:29', '2017-09-25 03:55:17', NULL),
(3, 'Услуги', 0, '2017-09-20 06:06:39', '2017-09-20 06:06:39', NULL),
(4, 'Кинары', 0, '2017-09-20 06:06:47', '2017-09-21 03:40:23', '2017-09-21 03:40:23'),
(5, 'RU', 0, '2017-09-20 08:48:58', '2017-09-20 08:50:00', '2017-09-20 08:50:00'),
(6, 'Новый тег', 0, '2018-07-09 16:47:28', '2018-07-10 12:16:58', '2018-07-10 12:16:58'),
(7, 'Кристаллы', 0, '2018-07-09 16:49:25', '2018-07-09 16:49:25', NULL),
(8, 'Серебро', 0, '2018-07-09 19:50:40', '2018-07-09 19:50:40', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `trades`
--

CREATE TABLE `trades` (
  `id` int(10) UNSIGNED NOT NULL,
  `owner_id` int(10) UNSIGNED DEFAULT NULL,
  `buyer_id` int(10) UNSIGNED DEFAULT NULL,
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
(1, 1, 'Playzone', 'playzone@gmail.com', 'users/default.png', '0', '0', '0', '0', '0', NULL, NULL, 0, 0, 0, 0, '3d4f2bf07dc1be38b20cd6e46949a1071f9d0e3d', '8JToBkABZc9ARsJK83ZxfqrSierEHlGeoGRkxWXidUX3bnClnqAhjBvNWryM', '2018-04-24 14:32:56', '2018-06-15 18:09:23', '1', '0', '0', 1979.998, '0', 1, 1, '0', NULL),
(2, 1, 'SomeSay', 'badolf2015@gmail.com', 'https://lh5.googleusercontent.com/-AtwACJmBg1s/AAAAAAAAAAI/AAAAAAAAAJY/phU-5Xvc3Hs/photo.jpg?sz=50', '0', '0', '0', 'google', '109195121458633655171', NULL, NULL, 0, 0, 0, 0, '5cae74fc7112eae7381205eb195b0828c98514f4', 'We9vYvpKX5N0TDTYLtNIjbdjKyE2XeWKAFZYQshIVmy4c7hxxTOHXNTrSthg', '2018-04-24 14:38:07', '2018-07-25 17:31:22', '185.17.127.234', '380968182526', '0', 1848.360, '0', 1, 1, NULL, NULL),
(3, 1, 'Testo', 'orobey_ruslan90@mail.ru', NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, '07a5f035bfe798d5a7f7e6f6bed72258f90a68f1', '9V2ABrRjkCzjvsV4vxARJhXqUDJULOiaIIIC0iTBIxqL0mDO2fUtDFVhbGIl', '2018-04-24 14:39:59', '2018-07-25 17:31:40', '46.162.13.54', '380672777859', '17', 4324.180, '0', 1, 1, NULL, NULL),
(4, 1, 'Andriy Pilko', 'pilkoandriy94@gmail.com', NULL, '0', '0', '0', '0', '0', 0, 0, 0, 0, 0, 0, '811b3503d6600ca64f22ee82438350474be07ea5', 'Y6EnaP9k17cipwZRpM8bntZW2GYGDET1HIRajiBxr82OHOiyd0IMjwyTz7zH', '2018-04-24 14:43:11', '2018-07-25 17:32:07', '176.125.46.51', '+380631996721', '0', 1724.476, '0', 1, 1, '0', NULL),
(5, 2, 'vagabund2', 'vagabund2@ukr.net', '/default-avatar.svg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0d2eb2048d9b9c98196b1673cb290e91801b7cae', NULL, '2018-09-01 09:51:10', '2018-09-01 09:54:40', '176.37.50.106', '0936336842', '0', 0.000, NULL, 1, 1, NULL, NULL),
(6, 2, 'Master gold', 'pwupload@yandex.ru', '/users_avatars/1537358979-C33D7AE8-6E0B-4195-9DB0-0690C123711E.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '4ebc836bc3bf4aacd141b58a0ea262c7d8ba4a61', NULL, '2018-09-19 12:08:55', '2018-09-19 12:09:39', '178.133.28.109', NULL, '0', 0.000, NULL, 0, 0, 'u1uzfZuZj7YgfpH5mlDwzqI5bdMAPY', NULL),
(7, 2, 'YentZer', 'amon4122@gmail.com', '/default-avatar.svg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '08a35bcfaf01bf2d0f4c8a9f9706482ddb25748e', NULL, '2018-11-19 15:42:47', '2018-11-19 15:42:47', '176.209.131.61', NULL, '0', 0.000, NULL, 0, 0, 'fmhCzO8Ai880v5VdT88sEXFajNuKzf', NULL);

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
(32, 1, 6, 'R305371395884', '2018-05-12 15:03:57', '2018-05-12 15:03:57', NULL),
(33, 1, 3, '123123123123', '2018-05-12 15:03:57', '2018-05-12 15:03:57', NULL),
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
(105, 4, 6, 'E991901919453', '2018-07-24 10:25:53', '2018-07-24 10:25:53', NULL);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `dialog_messages`
--
ALTER TABLE `dialog_messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `dialog_participants`
--
ALTER TABLE `dialog_participants`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `games`
--
ALTER TABLE `games`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT для таблицы `game_currency`
--
ALTER TABLE `game_currency`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT для таблицы `game_tag`
--
ALTER TABLE `game_tag`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=310;

--
-- AUTO_INCREMENT для таблицы `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `lots`
--
ALTER TABLE `lots`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `lot_sub_tags`
--
ALTER TABLE `lot_sub_tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT для таблицы `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `servers`
--
ALTER TABLE `servers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `user_wallets`
--
ALTER TABLE `user_wallets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

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

--
-- Ограничения внешнего ключа таблицы `user_wallets`
--
ALTER TABLE `user_wallets`
  ADD CONSTRAINT `user_wallets_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `price_commissions` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `user_wallets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- SET FOREIGN_KEY_CHECKS=1;
