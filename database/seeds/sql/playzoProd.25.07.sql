-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               5.7.20 - MySQL Community Server (GPL)
-- Операционная система:         Win32
-- HeidiSQL Версия:              9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Дамп структуры базы данных big2
CREATE DATABASE IF NOT EXISTS `big2` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `big2`;

-- Дамп структуры для таблица big2.admin_passwords
CREATE TABLE IF NOT EXISTS `admin_passwords` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы big2.admin_passwords: ~2 rows (приблизительно)
/*!40000 ALTER TABLE `admin_passwords` DISABLE KEYS */;
INSERT INTO `admin_passwords` (`id`, `password`, `created_at`, `updated_at`) VALUES
	(1, 'be78d7107c320af90bee7f9d4a5769c909d21205', '2018-06-26 14:54:15', '2018-06-26 14:54:15'),
	(2, 'a385ebd45cb1abdcca31e5444dd0173fa2f1f07f', '2018-07-25 13:27:25', '2018-07-25 13:27:25');
/*!40000 ALTER TABLE `admin_passwords` ENABLE KEYS */;

-- Дамп структуры для таблица big2.block_ips
CREATE TABLE IF NOT EXISTS `block_ips` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `from` datetime NOT NULL,
  `to` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `block_ips_user_id_foreign` (`user_id`),
  CONSTRAINT `block_ips_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы big2.block_ips: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `block_ips` DISABLE KEYS */;
/*!40000 ALTER TABLE `block_ips` ENABLE KEYS */;

-- Дамп структуры для таблица big2.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы big2.categories: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Дамп структуры для таблица big2.chat_disputs
CREATE TABLE IF NOT EXISTS `chat_disputs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dialog_id` int(10) unsigned DEFAULT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci,
  `admin_id` int(10) unsigned DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `closed_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `chat_disputs_admin_id_foreign` (`admin_id`),
  KEY `chat_disputs_dialog_id_foreign` (`dialog_id`),
  CONSTRAINT `chat_disputs_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `chat_disputs_dialog_id_foreign` FOREIGN KEY (`dialog_id`) REFERENCES `dialogs` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы big2.chat_disputs: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `chat_disputs` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat_disputs` ENABLE KEYS */;

-- Дамп структуры для таблица big2.chat_settings
CREATE TABLE IF NOT EXISTS `chat_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keyword` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `value` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы big2.chat_settings: ~1 rows (приблизительно)
/*!40000 ALTER TABLE `chat_settings` DISABLE KEYS */;
INSERT INTO `chat_settings` (`id`, `title`, `keyword`, `is_active`, `value`, `created_at`, `updated_at`) VALUES
	(1, 'Сообщений в день для пользователя (Все чаты)', 'msg_per_day', 1, 1000, '2018-03-12 17:16:06', '2018-03-12 18:52:30');
/*!40000 ALTER TABLE `chat_settings` ENABLE KEYS */;

-- Дамп структуры для таблица big2.currencies
CREATE TABLE IF NOT EXISTS `currencies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unity` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `multiplier` double(10,5) NOT NULL DEFAULT '0.00000',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы big2.currencies: ~30 rows (приблизительно)
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` (`id`, `name`, `unity`, `multiplier`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Адена', 'кк', 0.00000, '2017-09-21 05:46:18', '2018-06-11 16:39:22', NULL),
	(2, 'Кинары', 'кк', 0.00000, '2017-09-21 06:34:22', '2018-06-09 20:58:43', NULL),
	(3, 'Золото', 'к', 0.00000, '2017-09-21 06:34:38', '2018-06-11 15:33:31', NULL),
	(4, 'Серебро', NULL, 0.00000, '2017-09-21 06:34:44', '2017-09-21 06:34:44', NULL),
	(5, 'Alz', NULL, 0.00000, '2017-09-21 06:35:06', '2017-09-21 06:35:06', NULL),
	(6, 'Монеты', NULL, 0.00000, '2017-09-21 06:35:15', '2017-09-21 06:35:15', NULL),
	(7, 'Кредиты', NULL, 0.00000, '2017-09-21 06:35:23', '2017-09-21 06:35:23', NULL),
	(8, 'Вирты', NULL, 0.00000, '2017-09-21 06:35:44', '2017-09-21 06:35:44', NULL),
	(9, 'ISK', NULL, 0.00000, '2017-09-21 06:35:58', '2017-09-21 06:35:58', NULL),
	(10, 'Бриллианты', NULL, 0.00000, '2017-09-21 06:36:08', '2017-09-21 06:36:08', NULL),
	(11, 'Сферы возвышения', NULL, 0.00000, '2017-09-21 06:36:51', '2017-09-21 06:36:51', NULL),
	(12, 'Зени', NULL, 0.00000, '2017-09-21 06:37:09', '2017-09-21 06:37:09', NULL),
	(13, 'Рупи', NULL, 0.00000, '2017-09-21 06:37:17', '2017-09-21 06:37:17', NULL),
	(14, 'Валюта', NULL, 0.00000, '2017-09-21 06:37:26', '2017-09-21 06:37:26', NULL),
	(15, 'Ляни', NULL, 0.00000, '2017-09-21 06:37:39', '2017-09-21 06:37:39', NULL),
	(16, 'Платина', NULL, 0.00000, '2017-09-21 06:37:52', '2017-09-21 06:37:52', NULL),
	(17, 'Пополнение баланса', NULL, 0.00000, '2017-09-21 06:38:12', '2017-09-21 06:38:12', NULL),
	(18, 'Рубли', '1000', 0.00000, '2017-09-21 06:38:21', '2017-09-26 12:45:46', NULL),
	(19, 'Flux', NULL, 0.00000, '2017-09-21 06:38:32', '2017-09-21 06:38:32', NULL),
	(20, 'Юани', 'кк', 0.00000, '2017-09-21 06:38:39', '2018-06-09 20:58:34', NULL),
	(21, 'EUN', NULL, 0.00000, '2017-09-21 06:39:33', '2017-09-21 06:39:33', NULL),
	(22, 'GB', NULL, 0.00000, '2017-09-21 06:39:38', '2017-09-21 06:39:38', NULL),
	(23, 'Адена классик', '1к', 0.00000, '2018-06-09 21:12:37', '2018-06-09 21:21:39', '2018-06-09 21:21:39'),
	(24, 'Адена.', '1к', 0.00000, '2018-06-09 21:21:57', '2018-06-09 23:33:11', '2018-06-09 23:33:11'),
	(27, 'Золото', 'КК', 1.00000, '2018-06-11 15:33:21', '2018-06-11 15:33:21', NULL),
	(28, 'Золото', 'ккк', 1.00000, '2018-06-11 15:40:57', '2018-06-11 15:40:57', NULL),
	(29, 'Золото', 'зол.', 1.00000, '2018-06-11 15:41:05', '2018-06-11 15:41:05', NULL),
	(30, 'Адена', 'к', 1.00000, '2018-06-11 15:52:16', '2018-06-19 18:57:45', NULL),
	(31, 'Кристаллы', NULL, 1.00000, '2018-07-10 13:06:40', '2018-07-16 12:22:41', NULL),
	(32, 'Gold', '1 ед.', 0.00000, '2018-07-22 00:12:51', '2018-07-22 00:13:14', NULL);
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;

-- Дамп структуры для таблица big2.data_rows
CREATE TABLE IF NOT EXISTS `data_rows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) unsigned NOT NULL,
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
  `order` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы big2.data_rows: ~72 rows (приблизительно)
/*!40000 ALTER TABLE `data_rows` DISABLE KEYS */;
INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
	(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '', 1),
	(2, 1, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, '', 2),
	(3, 1, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, '', 3),
	(4, 1, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '', 4),
	(5, 1, 'excerpt', 'text_area', 'excerpt', 1, 0, 1, 1, 1, 1, '', 5),
	(6, 1, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, '', 6),
	(7, 1, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '\n{\n    "resize": {\n        "width": "1000",\n        "height": "null"\n    },\n    "quality": "70%",\n    "upsize": true,\n    "thumbnails": [\n        {\n            "name": "medium",\n            "scale": "50%"\n        },\n        {\n            "name": "small",\n            "scale": "25%"\n        },\n        {\n            "name": "cropped",\n            "crop": {\n                "width": "300",\n                "height": "250"\n            }\n        }\n    ]\n}', 7),
	(8, 1, 'slug', 'text', 'slug', 1, 0, 1, 1, 1, 1, '\n{\n    "slugify": {\n        "origin": "title",\n        "forceUpdate": true\n    }\n}', 8),
	(9, 1, 'meta_description', 'text_area', 'meta_description', 1, 0, 1, 1, 1, 1, '', 9),
	(10, 1, 'meta_keywords', 'text_area', 'meta_keywords', 1, 0, 1, 1, 1, 1, '', 10),
	(11, 1, 'status', 'select_dropdown', 'status', 1, 1, 1, 1, 1, 1, '\n{\n    "default": "DRAFT",\n    "options": {\n        "PUBLISHED": "published",\n        "DRAFT": "draft",\n        "PENDING": "pending"\n    }\n}', 11),
	(12, 1, 'created_at', 'timestamp', 'created_at', 0, 1, 1, 0, 0, 0, '', 12),
	(13, 1, 'updated_at', 'timestamp', 'updated_at', 0, 0, 0, 0, 0, 0, '', 13),
	(14, 2, 'id', 'number', 'id', 1, 0, 0, 0, 0, 0, '', 1),
	(15, 2, 'author_id', 'text', 'author_id', 1, 0, 0, 0, 0, 0, '', 2),
	(16, 2, 'title', 'text', 'title', 1, 1, 1, 1, 1, 1, '', 3),
	(17, 2, 'excerpt', 'text_area', 'excerpt', 1, 0, 1, 1, 1, 1, '', 4),
	(18, 2, 'body', 'rich_text_box', 'body', 1, 0, 1, 1, 1, 1, '', 5),
	(19, 2, 'slug', 'text', 'slug', 1, 0, 1, 1, 1, 1, '{"slugify":{"origin":"title"}}', 6),
	(20, 2, 'meta_description', 'text', 'meta_description', 1, 0, 1, 1, 1, 1, '', 7),
	(21, 2, 'meta_keywords', 'text', 'meta_keywords', 1, 0, 1, 1, 1, 1, '', 8),
	(22, 2, 'status', 'select_dropdown', 'status', 1, 1, 1, 1, 1, 1, '{"default":"INACTIVE","options":{"INACTIVE":"INACTIVE","ACTIVE":"ACTIVE"}}', 9),
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
	(39, 4, 'parent_id', 'select_dropdown', 'parent_id', 0, 0, 1, 1, 1, 1, '{"default":"","null":"","options":{"":"-- None --"},"relationship":{"key":"id","label":"name"}}', 2),
	(40, 4, 'order', 'text', 'order', 1, 1, 1, 1, 1, 1, '{"default":1}', 3),
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
/*!40000 ALTER TABLE `data_rows` ENABLE KEYS */;

-- Дамп структуры для таблица big2.data_types
CREATE TABLE IF NOT EXISTS `data_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы big2.data_types: ~6 rows (приблизительно)
/*!40000 ALTER TABLE `data_types` DISABLE KEYS */;
INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `controller`, `description`, `generate_permissions`, `server_side`, `created_at`, `updated_at`) VALUES
	(1, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', '', '', 1, 0, '2017-09-14 09:07:06', '2017-09-14 09:07:06'),
	(2, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', '', '', 1, 0, '2017-09-14 09:07:06', '2017-09-14 09:07:06'),
	(3, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', NULL, NULL, 1, 0, '2017-09-14 09:07:06', '2017-09-15 11:54:40'),
	(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', '', '', 1, 0, '2017-09-14 09:07:06', '2017-09-14 09:07:06'),
	(5, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', '', '', 1, 0, '2017-09-14 09:07:06', '2017-09-14 09:07:06'),
	(6, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', '', '', 1, 0, '2017-09-14 09:07:06', '2017-09-14 09:07:06');
/*!40000 ALTER TABLE `data_types` ENABLE KEYS */;

-- Дамп структуры для таблица big2.dialogs
CREATE TABLE IF NOT EXISTS `dialogs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы big2.dialogs: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `dialogs` DISABLE KEYS */;
/*!40000 ALTER TABLE `dialogs` ENABLE KEYS */;

-- Дамп структуры для таблица big2.dialog_messages
CREATE TABLE IF NOT EXISTS `dialog_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `seen` int(11) DEFAULT NULL,
  `sender_id` int(10) unsigned DEFAULT NULL,
  `dialog_id` int(10) unsigned NOT NULL,
  `lot_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dialog_messages_sender_id_foreign` (`sender_id`),
  KEY `dialog_messages_dialog_id_foreign` (`dialog_id`),
  KEY `dialog_messages_lot_id_foreign` (`lot_id`),
  CONSTRAINT `dialog_messages_dialog_id_foreign` FOREIGN KEY (`dialog_id`) REFERENCES `dialogs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `dialog_messages_lot_id_foreign` FOREIGN KEY (`lot_id`) REFERENCES `lots` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `dialog_messages_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1405 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы big2.dialog_messages: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `dialog_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `dialog_messages` ENABLE KEYS */;

-- Дамп структуры для таблица big2.dialog_participants
CREATE TABLE IF NOT EXISTS `dialog_participants` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `dialog_id` int(10) unsigned NOT NULL,
  `last_read` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dialog_participants_user_id_foreign` (`user_id`),
  KEY `dialog_participants_dialog_id_foreign` (`dialog_id`),
  CONSTRAINT `dialog_participants_dialog_id_foreign` FOREIGN KEY (`dialog_id`) REFERENCES `dialogs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `dialog_participants_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=175 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы big2.dialog_participants: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `dialog_participants` DISABLE KEYS */;
/*!40000 ALTER TABLE `dialog_participants` ENABLE KEYS */;

-- Дамп структуры для таблица big2.games
CREATE TABLE IF NOT EXISTS `games` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `region` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы big2.games: ~28 rows (приблизительно)
/*!40000 ALTER TABLE `games` DISABLE KEYS */;
INSERT INTO `games` (`id`, `name`, `region`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'LineAge 2', 'RU', '<p><span style="color: #00ccff;"><strong>Lineage II</strong></span>&nbsp;- многопользовательская ролевая онлайн-игра&nbsp;. Игра является&nbsp;приквелом, события в котором происходят за 150 лет до начала оригинальной&nbsp;Lineage. Была запущена&nbsp;в&nbsp;Южной Корее 1 октября 2003 года.&nbsp;</p>\r\n<p>В Lineage II игровая валюта имеет названия "Адена", заработать адену можно следующими способами:&nbsp;&nbsp;</p>\r\n<p><strong>Фарм</strong>, попытка заработать игровю валюту/предметы с помощью убийства монстров, крафта, торговли. Недостатком фарма есть время затраченое на данный способ добычи адены. Время которое можно потратить на свою учебу/друзей/работу/семью поэтому многие вместо долгого и скучного фарма выбирают такой вариант добычи&nbsp;игровых ценностей как: покупка&nbsp; адены, прокачка персонажа, покупка игровых предметов. Пожалуй это самый&nbsp;быстрый и самый простой способ начать получать удовольствие от игры, не ограничивая себя&nbsp;скучным фармом.&nbsp;&nbsp;</p>\r\n<p>Если Вы хотите с удовольствием играть в Lineage II , то купить игровые ценности&nbsp;&nbsp;дешево, без риска и посредников Вам поможет наша биржа. На нашей бирже Вы всегда можете купить или продать&nbsp;игровые предметы и валюту&nbsp;&nbsp;Lineage II по выгодным ценам. Купить адену&nbsp; &ndash; Ваш шанс быстро включиться в игру&nbsp; а это значит быстро перейти к самому интересному&nbsp; что может предоставить Lineage II &ndash; захватывать замки, побеждать драконов, учавстовать в массовых&nbsp; ПвП битвах, учавстовать в приключениях вместе с друзьями в группах и кланах, брать участие в Олимпиаде где можно получить статус Героя и доказать что Вы один из лучших игроков на просторах игры . В Lineage II возможно все, если у вас есть много времени или возможность купить адену/предметы.&nbsp;</p>\r\n<p><span style="color: #00ccff;"><strong>Как приобрести адену</strong></span></p>\r\n<p>1) Выбрать сервер.</p>\r\n<p>2) Выбрать продавца с приемлемой ценой, связаться с ним.</p>\r\n<p>3) Получить игровую валюту от продавца под контролем Гаранта.</p>\r\n<p>4) Завершить перевод средств продавцу.</p>\r\n<p><span style="color: #00ccff;"><strong>Продажа адены на&nbsp;бирже ведется круглосуточно, более того, вы всегда можете видеть:</strong></span></p>\r\n<p>- статус продавцов,</p>\r\n<p>- отзывы о них,</p>\r\n<p>- время их нахождения на сайте,</p>\r\n<p>- количество игровой валюты в наличии у каждого и цену.</p>\r\n<p><span style="color: #00ccff;"><strong>Почему выгодно покупать адену на бирже PlayZo:</strong></span></p>\r\n<p>- Здесь игроки покупают у других игроков, без посредников</p>\r\n<p>- Все продавцы имеют рейтинг и отзывы.</p>\r\n<p>- Комиссия PlayZo, самая низкая на рынке.</p>\r\n<p>- Оплата и получение игровой валюты проходит мгновенно</p>\r\n<p>&nbsp;</p>\r\n<p>PlayZo не располагает игрой Lineage или ее составными частями.&nbsp; Официальный сайт игры: ru.4game.com</p>', '2017-09-20 09:07:13', '2018-07-16 11:48:15', NULL),
	(2, 'Dota2', NULL, NULL, '2017-09-20 09:07:48', '2018-05-24 15:38:05', '2018-05-24 15:38:05'),
	(3, 'Fifa', NULL, NULL, '2017-09-20 09:08:00', '2018-05-24 15:38:15', '2018-05-24 15:38:15'),
	(4, 'Elder Scrolls (TESO)', NULL, NULL, '2017-09-20 09:08:21', '2018-05-24 15:40:10', '2018-05-24 15:40:10'),
	(5, 'Aion', NULL, NULL, '2017-09-20 09:17:06', '2018-05-24 15:40:15', '2018-05-24 15:40:15'),
	(6, 'dsafadf', NULL, NULL, '2017-09-20 09:21:33', '2017-09-20 10:35:22', '2017-09-20 10:35:22'),
	(7, 'asdadasd', NULL, NULL, '2017-09-20 09:41:23', '2017-09-20 09:42:31', '2017-09-20 09:42:31'),
	(8, 'asdas', NULL, NULL, '2017-09-20 10:28:11', '2017-09-20 10:35:26', '2017-09-20 10:35:26'),
	(9, 'ArcheAge', NULL, NULL, '2017-09-20 11:11:37', '2018-05-24 15:39:39', '2018-05-24 15:39:39'),
	(10, 'Black Desert', NULL, NULL, '2017-09-20 11:12:09', '2018-05-24 15:39:29', '2018-05-24 15:39:29'),
	(11, 'Hearthstone', NULL, NULL, '2017-09-20 12:05:06', '2018-05-24 15:38:59', '2018-05-24 15:38:59'),
	(12, 'GTA 5', NULL, NULL, '2017-09-21 05:01:26', '2018-05-24 15:39:24', '2018-05-24 15:39:24'),
	(13, 'Lineage 2 Classic', 'RU', '<p><span style="color: #00ccff;"><strong>Lineage II</strong></span>&nbsp;- многопользовательская ролевая онлайн-игра&nbsp;. Игра является&nbsp;приквелом, события в котором происходят за 150 лет до начала оригинальной&nbsp;Lineage. Была запущена&nbsp;в&nbsp;Южной Корее 1 октября 2003 года.&nbsp;</p>\r\n<p>В Lineage II игровая валюта имеет названия "Адена", заработать адену можно следующими способами:&nbsp;&nbsp;</p>\r\n<p><strong>Фарм</strong>, попытка заработать игровю валюту/предметы с помощью убийства монстров, крафта, торговли. Недостатком фарма есть время затраченое на данный способ добычи адены. Время которое можно потратить на свою учебу/друзей/работу/семью поэтому многие вместо долгого и скучного фарма выбирают такой вариант добычи&nbsp;игровых ценностей как: покупка&nbsp; адены, прокачка персонажа, покупка игровых предметов. Пожалуй это самый&nbsp;быстрый и самый простой способ начать получать удовольствие от игры, не ограничивая себя&nbsp;скучным фармом.&nbsp;&nbsp;</p>\r\n<p>Если Вы хотите с удовольствием играть в Lineage II , то купить игровые ценности&nbsp;&nbsp;дешево, без риска и посредников Вам поможет наша биржа. На нашей бирже Вы всегда можете купить или продать&nbsp;игровые предметы и валюту&nbsp;&nbsp;Lineage II по выгодным ценам. Купить адену&nbsp; &ndash; Ваш шанс быстро включиться в игру&nbsp; а это значит быстро перейти к самому интересному&nbsp; что может предоставить Lineage II &ndash; захватывать замки, побеждать драконов, учавстовать в массовых&nbsp; ПвП битвах, учавстовать в приключениях вместе с друзьями в группах и кланах, брать участие в Олимпиаде где можно получить статус Героя и доказать что Вы один из лучших игроков на просторах игры . В Lineage II возможно все, если у вас есть много времени или возможность купить адену/предметы.&nbsp;</p>\r\n<p><span style="color: #00ccff;"><strong>Как приобрести адену</strong></span></p>\r\n<p>1) Выбрать сервер.</p>\r\n<p>2) Выбрать продавца с приемлемой ценой, связаться с ним.</p>\r\n<p>3) Получить игровую валюту от продавца под контролем Гаранта.</p>\r\n<p>4) Завершить перевод средств продавцу.</p>\r\n<p><span style="color: #00ccff;"><strong>Продажа адены на&nbsp;бирже ведется круглосуточно, более того, вы всегда можете видеть:</strong></span></p>\r\n<p>- статус продавцов,</p>\r\n<p>- отзывы о них,</p>\r\n<p>- время их нахождения на сайте,</p>\r\n<p>- количество игровой валюты в наличии у каждого и цену.</p>\r\n<p><span style="color: #00ccff;"><strong>Почему выгодно покупать адену на бирже PlayZo:</strong></span></p>\r\n<p>- Здесь игроки покупают у других игроков, без посредников</p>\r\n<p>- Все продавцы имеют рейтинг и отзывы.</p>\r\n<p>- Комиссия PlayZo, самая низкая на рынке.</p>\r\n<p>- Оплата и получение игровой валюты проходит мгновенно</p>\r\n<p>&nbsp;</p>\r\n<p>PlayZo не располагает игрой Lineage или ее составными частями.&nbsp; Официальный сайт игры: ru.4game.com</p>', '2017-10-03 10:29:47', '2018-07-16 11:49:07', NULL),
	(14, 'Тестовый сервер второй', 'RU', NULL, '2018-03-08 02:10:10', '2018-05-24 15:39:14', '2018-05-24 15:39:14'),
	(15, 'Новая игра', 'Ru, Eu', NULL, '2018-03-12 17:17:23', '2018-05-24 15:39:07', '2018-05-24 15:39:07'),
	(16, 'Game 2', NULL, NULL, '2018-03-12 17:19:08', '2018-05-24 15:37:51', '2018-05-24 15:37:51'),
	(17, 'Game212', NULL, NULL, '2018-03-12 17:20:09', '2018-05-24 15:37:58', '2018-05-24 15:37:58'),
	(18, 'Какая то игра', NULL, NULL, '2018-03-12 17:25:51', '2018-05-24 15:39:20', '2018-05-24 15:39:20'),
	(19, 'Perfect World', 'RU', NULL, '2018-03-24 23:27:47', '2018-05-24 15:39:43', '2018-05-24 15:39:43'),
	(20, 'Игротест', 'RU', NULL, '2018-03-28 13:38:40', '2018-05-24 15:38:22', '2018-05-24 15:38:22'),
	(21, 'GTA 5', 'Ru, EU', 'GTA 5 - online', '2018-05-24 15:53:02', '2018-05-24 15:57:54', '2018-05-24 15:57:54'),
	(22, 'GTA 5', 'Ru, EU', 'GTA 5 - online', '2018-05-24 15:53:36', '2018-05-24 15:53:54', '2018-05-24 15:53:54'),
	(23, 'Aion', 'RU', '<p><span style="color: #00ccff;"><strong>Aion -&nbsp;</strong></span><span style="color: #222222; font-family: sans-serif;">&nbsp;</span><span style="color: #222222; font-family: sans-serif;">компьютерная и</span>гра<span style="color: #222222; font-family: sans-serif;">&nbsp;в жанре&nbsp;</span><span style="color: #222222; font-family: sans-serif;">MMORPG</span>,&nbsp;<span style="color: #222222; font-family: sans-serif;">разработанная&nbsp;NCSoft</span><span style="color: #222222; font-family: sans-serif;">, сочетающая в себе&nbsp;PvP</span><span style="color: #222222; font-family: sans-serif;">&nbsp;и PvE</span><span style="color: #222222; font-family: sans-serif;">&nbsp;в мире фэнтези.</span></p>\r\n<p>В Aion&nbsp;игровая валюта имеет названия "Кинары", заработать&nbsp;кинары можно как и в других&nbsp;&nbsp;играх&nbsp;<span style="color: #222222; font-family: sans-serif;">в жанре&nbsp;MMORPG</span>&nbsp;с помощью фарма, но мы предлагаем сделать игру более приятной с помощью покупки игровых предметов и валюты на нашей бирже что поможет Вам получить от игры максимум удовольствия без затраты Вашего времени на скучный рутинный фарм. Пускай время которое Вы могли бы потратить на фарм кинаров будет использовано для получение максимального удовольствия от прохождение контента игры вместе с друзьями.</p>\r\n<p><span style="color: #00ccff;"><strong>Как приобрести Кинары</strong></span></p>\r\n<p>1) Выбрать сервер.</p>\r\n<p>2) Выбрать продавца с приемлемой ценой, связаться с ним.</p>\r\n<p>3) Получить игровую валюту от продавца под контролем Гаранта.</p>\r\n<p>4) Завершить перевод средств продавцу.</p>\r\n<p><span style="color: #00ccff;"><strong>Продажа&nbsp;кинаров на&nbsp;бирже&nbsp;ведется круглосуточно, более того, вы всегда можете видеть:</strong></span></p>\r\n<p>- статус продавцов,</p>\r\n<p>- отзывы о них,</p>\r\n<p>- время их нахождения на сайте,</p>\r\n<p>- количество игровой валюты в наличии у каждого и цену.</p>\r\n<p><span style="color: #00ccff;"><strong>Почему выгодно покупать&nbsp;кинары&nbsp;на бирже PlayZo:</strong></span></p>\r\n<p>- Здесь игроки покупают у других игроков, без посредников</p>\r\n<p>- Все продавцы имеют рейтинг и отзывы.</p>\r\n<p>- Комиссия PlayZo, самая низкая на рынке.</p>\r\n<p>- Оплата и получение игровой валюты проходит мгновенно</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>PlayZo не располагает игрой Aion&nbsp;или ее составными частями.&nbsp; Официальный сайт игры: ru.4game.com</p>', '2018-05-24 22:55:40', '2018-07-16 14:43:44', NULL),
	(24, 'Perfect World', 'RU', '<p><strong><span style="color: #00ccff;">Perfect World</span></strong><span style="color: #222222; font-family: sans-serif;"><span style="color: #00ccff;">&nbsp;</span></span><span style="color: #222222; font-family: sans-serif;">&nbsp;&mdash; китайская многопользовательская релоевая онлайн-игра, созданная компанией&nbsp;</span><span style="color: #222222; font-family: sans-serif;">Beijing Perfect World.</span></p>\r\n<p>В Perfect World игровой валютой являются "Юани"&nbsp;</p>\r\n<p style="box-sizing: border-box; margin: 0px 0px 15px; line-height: 20px; color: #777777; font-family: Roboto, sans-serif; outline: none !important;">&nbsp;</p>\r\n<p style="box-sizing: border-box; margin: 0px 0px 15px; line-height: 20px; color: #777777; font-family: Roboto, sans-serif; outline: none !important;"><span style="box-sizing: border-box; outline: none !important; color: #00ccff;"><strong style="box-sizing: border-box; outline: none !important;">Как приобрести&nbsp;игровые ценности</strong></span></p>\r\n<p style="box-sizing: border-box; margin: 0px 0px 15px; line-height: 20px; color: #777777; font-family: Roboto, sans-serif; outline: none !important;">1) Выбрать сервер.</p>\r\n<p style="box-sizing: border-box; margin: 0px 0px 15px; line-height: 20px; color: #777777; font-family: Roboto, sans-serif; outline: none !important;">2) Выбрать продавца с приемлемой ценой, связаться с ним.</p>\r\n<p style="box-sizing: border-box; margin: 0px 0px 15px; line-height: 20px; color: #777777; font-family: Roboto, sans-serif; outline: none !important;">3) Получить игровую валюту от продавца под контролем Гаранта.</p>\r\n<p style="box-sizing: border-box; margin: 0px 0px 15px; line-height: 20px; color: #777777; font-family: Roboto, sans-serif; outline: none !important;">4) Завершить перевод средств продавцу.</p>\r\n<p style="box-sizing: border-box; margin: 0px 0px 15px; line-height: 20px; color: #777777; font-family: Roboto, sans-serif; outline: none !important;"><span style="box-sizing: border-box; outline: none !important; color: #00ccff;"><strong style="box-sizing: border-box; outline: none !important;">Продажа на&nbsp;бирже&nbsp;ведется круглосуточно, более того, вы всегда можете видеть:</strong></span></p>\r\n<p style="box-sizing: border-box; margin: 0px 0px 15px; line-height: 20px; color: #777777; font-family: Roboto, sans-serif; outline: none !important;">- статус продавцов,</p>\r\n<p style="box-sizing: border-box; margin: 0px 0px 15px; line-height: 20px; color: #777777; font-family: Roboto, sans-serif; outline: none !important;">- отзывы о них,</p>\r\n<p style="box-sizing: border-box; margin: 0px 0px 15px; line-height: 20px; color: #777777; font-family: Roboto, sans-serif; outline: none !important;">- время их нахождения на сайте,</p>\r\n<p style="box-sizing: border-box; margin: 0px 0px 15px; line-height: 20px; color: #777777; font-family: Roboto, sans-serif; outline: none !important;">- количество игровой валюты в наличии у каждого и цену.</p>\r\n<p style="box-sizing: border-box; margin: 0px 0px 15px; line-height: 20px; color: #777777; font-family: Roboto, sans-serif; outline: none !important;"><span style="box-sizing: border-box; outline: none !important; color: #00ccff;"><strong style="box-sizing: border-box; outline: none !important;">Почему выгодно покупать на бирже PlayZo:</strong></span></p>\r\n<p style="box-sizing: border-box; margin: 0px 0px 15px; line-height: 20px; color: #777777; font-family: Roboto, sans-serif; outline: none !important;">- Здесь игроки покупают у других игроков, без посредников</p>\r\n<p style="box-sizing: border-box; margin: 0px 0px 15px; line-height: 20px; color: #777777; font-family: Roboto, sans-serif; outline: none !important;">- Все продавцы имеют рейтинг и отзывы.</p>\r\n<p style="box-sizing: border-box; margin: 0px 0px 15px; line-height: 20px; color: #777777; font-family: Roboto, sans-serif; outline: none !important;">- Комиссия PlayZo, самая низкая на рынке.</p>\r\n<p style="box-sizing: border-box; margin: 0px 0px 15px; line-height: 20px; color: #777777; font-family: Roboto, sans-serif; outline: none !important;">- Оплата и получение игровой валюты проходит мгновенно</p>\r\n<p style="box-sizing: border-box; margin: 0px 0px 15px; line-height: 20px; color: #777777; font-family: Roboto, sans-serif; outline: none !important;">&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p style="box-sizing: border-box; margin: 0px 0px 15px; line-height: 20px; color: #777777; font-family: Roboto, sans-serif; outline: none !important;">PlayZo не располагает игрой Perfect World&nbsp;или ее составными частями.&nbsp; Официальный сайт игры: pw.mail.ru</p>', '2018-06-11 18:56:32', '2018-07-16 16:36:21', NULL),
	(25, 'Aion', 'EU,NA', '<p><span style="color: #00ccff;"><strong>Aion -&nbsp;</strong></span><span style="color: #222222; font-family: sans-serif;">&nbsp;компьютерная и</span>гра<span style="color: #222222; font-family: sans-serif;">&nbsp;в жанре&nbsp;</span><span style="color: #222222; font-family: sans-serif;">MMORPG</span>,&nbsp;<span style="color: #222222; font-family: sans-serif;">разработанная&nbsp;NCSoft</span><span style="color: #222222; font-family: sans-serif;">, сочетающая в себе&nbsp;PvP</span><span style="color: #222222; font-family: sans-serif;">&nbsp;и PvE</span><span style="color: #222222; font-family: sans-serif;">&nbsp;в мире фэнтези.</span></p>\r\n<p>В Aion&nbsp;игровая валюта имеет названия "Кинары", заработать&nbsp;кинары можно как и в других&nbsp;&nbsp;играх&nbsp;<span style="color: #222222; font-family: sans-serif;">в жанре&nbsp;MMORPG</span>&nbsp;с помощью фарма, но мы предлагаем сделать игру более приятной с помощью покупки игровых предметов и валюты на нашей бирже что поможет Вам получить от игры максимум удовольствия без затраты Вашего времени на скучный рутинный фарм. Пускай время которое Вы могли бы потратить на фарм кинаров будет использовано для получение максимального удовольствия от прохождение контента игры вместе с друзьями.</p>\r\n<p><span style="color: #00ccff;"><strong>Как приобрести Кинары</strong></span></p>\r\n<p>1) Выбрать сервер.</p>\r\n<p>2) Выбрать продавца с приемлемой ценой, связаться с ним.</p>\r\n<p>3) Получить игровую валюту от продавца под контролем Гаранта.</p>\r\n<p>4) Завершить перевод средств продавцу.</p>\r\n<p><span style="color: #00ccff;"><strong>Продажа&nbsp;кинаров на&nbsp;бирже&nbsp;ведется круглосуточно, более того, вы всегда можете видеть:</strong></span></p>\r\n<p>- статус продавцов,</p>\r\n<p>- отзывы о них,</p>\r\n<p>- время их нахождения на сайте,</p>\r\n<p>- количество игровой валюты в наличии у каждого и цену.</p>\r\n<p><span style="color: #00ccff;"><strong>Почему выгодно покупать&nbsp;кинары&nbsp;на бирже PlayZo:</strong></span></p>\r\n<p>- Здесь игроки покупают у других игроков, без посредников</p>\r\n<p>- Все продавцы имеют рейтинг и отзывы.</p>\r\n<p>- Комиссия PlayZo, самая низкая на рынке.</p>\r\n<p>- Оплата и получение игровой валюты проходит мгновенно</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>PlayZo не располагает игрой Aion&nbsp;или ее составными частями.</p>', '2018-06-11 19:12:46', '2018-07-16 14:42:46', NULL),
	(26, 'LineAge 2', 'EU/NA', '<p><span style="color: #00ccff;"><strong>Lineage II</strong></span>&nbsp;- многопользовательская ролевая онлайн-игра&nbsp;. Игра является&nbsp;приквелом, события в котором происходят за 150 лет до начала оригинальной&nbsp;Lineage. Была запущена&nbsp;в&nbsp;Южной Корее 1 октября 2003 года.&nbsp;</p>\r\n<p>В Lineage II игровая валюта имеет названия "Адена", заработать адену можно следующими способами:&nbsp;&nbsp;</p>\r\n<p><strong>Фарм</strong>, попытка заработать игровю валюту/предметы с помощью убийства монстров, крафта, торговли. Недостатком фарма есть время затраченое на данный способ добычи адены. Время которое можно потратить на свою учебу/друзей/работу/семью поэтому многие вместо долгого и скучного фарма выбирают такой вариант добычи&nbsp;игровых ценностей как: покупка&nbsp; адены, прокачка персонажа, покупка игровых предметов. Пожалуй это самый&nbsp;быстрый и самый простой способ начать получать удовольствие от игры, не ограничивая себя&nbsp;скучным фармом.&nbsp;&nbsp;</p>\r\n<p>Если Вы хотите с удовольствием играть в Lineage II , то купить игровые ценности&nbsp;&nbsp;дешево, без риска и посредников Вам поможет наша биржа. На нашей бирже Вы всегда можете купить или продать&nbsp;игровые предметы и валюту&nbsp;&nbsp;Lineage II по выгодным ценам. Купить адену&nbsp; &ndash; Ваш шанс быстро включиться в игру&nbsp; а это значит быстро перейти к самому интересному&nbsp; что может предоставить Lineage II &ndash; захватывать замки, побеждать драконов, учавстовать в массовых&nbsp; ПвП битвах, учавстовать в приключениях вместе с друзьями в группах и кланах, брать участие в Олимпиаде где можно получить статус Героя и доказать что Вы один из лучших игроков на просторах игры . В Lineage II возможно все, если у вас есть много времени или возможность купить адену/предметы.&nbsp;</p>\r\n<p><span style="color: #00ccff;"><strong>Как приобрести адену</strong></span></p>\r\n<p>1) Выбрать сервер.</p>\r\n<p>2) Выбрать продавца с приемлемой ценой, связаться с ним.</p>\r\n<p>3) Получить игровую валюту от продавца под контролем Гаранта.</p>\r\n<p>4) Завершить перевод средств продавцу.</p>\r\n<p><span style="color: #00ccff;"><strong>Продажа адены на&nbsp;бирже ведется круглосуточно, более того, вы всегда можете видеть:</strong></span></p>\r\n<p>- статус продавцов,</p>\r\n<p>- отзывы о них,</p>\r\n<p>- время их нахождения на сайте,</p>\r\n<p>- количество игровой валюты в наличии у каждого и цену.</p>\r\n<p><span style="color: #00ccff;"><strong>Почему выгодно покупать адену на бирже PlayZo:</strong></span></p>\r\n<p>- Здесь игроки покупают у других игроков, без посредников</p>\r\n<p>- Все продавцы имеют рейтинг и отзывы.</p>\r\n<p>- Комиссия PlayZo, самая низкая на рынке.</p>\r\n<p>- Оплата и получение игровой валюты проходит мгновенно</p>\r\n<p>&nbsp;</p>\r\n<p>PlayZo не располагает игрой Lineage или ее составными частями.&nbsp;</p>', '2018-06-25 21:03:24', '2018-07-16 11:48:39', NULL),
	(27, 'Аллоды Online', 'RU', '<p><strong style="color: #222222; font-family: sans-serif;"><span style="color: #00ccff;">&laquo;Аллоды Онлайн&raquo;</span>&nbsp;</strong><span style="color: #222222; font-family: sans-serif;">&nbsp;&mdash; фэнтезийная многопользовательская ролевая онлайн-игра, продолжающая игровую серию "Аллоды" , но уже в масштабе MMORPG-вселенной.&nbsp;</span><span style="color: #222222; font-family: sans-serif;">Игру разрабатывает студия&nbsp;Allods Team.</span></p>\r\n<p><span style="color: #222222; font-family: sans-serif;">Игровой валютой в Аллоды Онлайн есть "Золото"</span></p>\r\n<p>&nbsp;</p>\r\n<p style="box-sizing: border-box; margin: 0px 0px 15px; line-height: 20px; color: #777777; font-family: Roboto, sans-serif; outline: none !important;"><span style="box-sizing: border-box; outline: none !important; color: #00ccff;"><strong style="box-sizing: border-box; outline: none !important;">Как приобрести&nbsp;игровые ценности</strong></span></p>\r\n<p style="box-sizing: border-box; margin: 0px 0px 15px; line-height: 20px; color: #777777; font-family: Roboto, sans-serif; outline: none !important;">1) Выбрать сервер.</p>\r\n<p style="box-sizing: border-box; margin: 0px 0px 15px; line-height: 20px; color: #777777; font-family: Roboto, sans-serif; outline: none !important;">2) Выбрать продавца с приемлемой ценой, связаться с ним.</p>\r\n<p style="box-sizing: border-box; margin: 0px 0px 15px; line-height: 20px; color: #777777; font-family: Roboto, sans-serif; outline: none !important;">3) Получить игровую валюту от продавца под контролем Гаранта.</p>\r\n<p style="box-sizing: border-box; margin: 0px 0px 15px; line-height: 20px; color: #777777; font-family: Roboto, sans-serif; outline: none !important;">4) Завершить перевод средств продавцу.</p>\r\n<p style="box-sizing: border-box; margin: 0px 0px 15px; line-height: 20px; color: #777777; font-family: Roboto, sans-serif; outline: none !important;"><span style="box-sizing: border-box; outline: none !important; color: #00ccff;"><strong style="box-sizing: border-box; outline: none !important;">Продажа на&nbsp;бирже&nbsp;ведется круглосуточно, более того, вы всегда можете видеть:</strong></span></p>\r\n<p style="box-sizing: border-box; margin: 0px 0px 15px; line-height: 20px; color: #777777; font-family: Roboto, sans-serif; outline: none !important;">- статус продавцов,</p>\r\n<p style="box-sizing: border-box; margin: 0px 0px 15px; line-height: 20px; color: #777777; font-family: Roboto, sans-serif; outline: none !important;">- отзывы о них,</p>\r\n<p style="box-sizing: border-box; margin: 0px 0px 15px; line-height: 20px; color: #777777; font-family: Roboto, sans-serif; outline: none !important;">- время их нахождения на сайте,</p>\r\n<p style="box-sizing: border-box; margin: 0px 0px 15px; line-height: 20px; color: #777777; font-family: Roboto, sans-serif; outline: none !important;">- количество игровой валюты в наличии у каждого и цену.</p>\r\n<p style="box-sizing: border-box; margin: 0px 0px 15px; line-height: 20px; color: #777777; font-family: Roboto, sans-serif; outline: none !important;"><span style="box-sizing: border-box; outline: none !important; color: #00ccff;"><strong style="box-sizing: border-box; outline: none !important;">Почему выгодно покупать на бирже PlayZo:</strong></span></p>\r\n<p style="box-sizing: border-box; margin: 0px 0px 15px; line-height: 20px; color: #777777; font-family: Roboto, sans-serif; outline: none !important;">- Здесь игроки покупают у других игроков, без посредников</p>\r\n<p style="box-sizing: border-box; margin: 0px 0px 15px; line-height: 20px; color: #777777; font-family: Roboto, sans-serif; outline: none !important;">- Все продавцы имеют рейтинг и отзывы.</p>\r\n<p style="box-sizing: border-box; margin: 0px 0px 15px; line-height: 20px; color: #777777; font-family: Roboto, sans-serif; outline: none !important;">- Комиссия PlayZo, самая низкая на рынке.</p>\r\n<p>&nbsp;</p>\r\n<p style="box-sizing: border-box; margin: 0px 0px 15px; line-height: 20px; color: #777777; font-family: Roboto, sans-serif; outline: none !important;">- Оплата и получение игровой валюты проходит мгновенно</p>\r\n<p style="box-sizing: border-box; margin: 0px 0px 15px; line-height: 20px; color: #777777; font-family: Roboto, sans-serif; outline: none !important;">&nbsp;</p>\r\n<p style="box-sizing: border-box; margin: 0px 0px 15px; line-height: 20px; color: #777777; font-family: Roboto, sans-serif; outline: none !important;">PlayZo не располагает игрой&nbsp;Аллоды онлайн&nbsp;или ее составными частями.&nbsp; Официальный сайт игры: allods.mail.ru</p>', '2018-07-09 19:35:23', '2018-07-16 16:36:47', NULL),
	(28, 'ArcheAge', 'RU, EU', NULL, '2018-07-22 00:14:12', '2018-07-22 00:18:01', NULL);
/*!40000 ALTER TABLE `games` ENABLE KEYS */;

-- Дамп структуры для таблица big2.game_currency
CREATE TABLE IF NOT EXISTS `game_currency` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `currency_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `game_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы big2.game_currency: ~15 rows (приблизительно)
/*!40000 ALTER TABLE `game_currency` DISABLE KEYS */;
INSERT INTO `game_currency` (`id`, `currency_id`, `game_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(2, '18', '2', '2017-09-26 09:57:03', '2017-09-26 09:57:03', NULL),
	(5, '20', '15', '2018-03-12 17:17:44', '2018-03-12 17:17:44', NULL),
	(8, '10', '18', '2018-03-12 18:51:13', '2018-03-12 18:51:13', NULL),
	(11, '20', '19', '2018-03-24 23:44:33', '2018-03-24 23:44:33', NULL),
	(12, '1', '20', '2018-03-28 13:38:40', '2018-03-28 13:38:40', NULL),
	(16, '1', '22', '2018-05-24 15:53:44', '2018-05-24 15:53:44', NULL),
	(32, '20', '24', '2018-06-11 18:56:32', '2018-06-11 18:56:32', NULL),
	(33, '2', '23', '2018-06-11 19:05:18', '2018-06-11 19:05:18', NULL),
	(34, '2', '25', '2018-06-11 19:12:46', '2018-06-11 19:12:46', NULL),
	(35, '1', '13', '2018-06-19 18:58:12', '2018-06-19 18:58:12', NULL),
	(39, '1', '1', '2018-06-21 18:34:05', '2018-06-21 18:34:05', NULL),
	(42, '1', '26', '2018-06-25 21:20:05', '2018-06-25 21:20:05', NULL),
	(49, '29', '27', '2018-07-09 22:57:57', '2018-07-09 22:57:57', NULL),
	(50, '31', '27', NULL, NULL, NULL),
	(51, '32', '28', NULL, NULL, NULL);
/*!40000 ALTER TABLE `game_currency` ENABLE KEYS */;

-- Дамп структуры для таблица big2.game_tag
CREATE TABLE IF NOT EXISTS `game_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag_id` int(10) unsigned NOT NULL,
  `game_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=310 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы big2.game_tag: ~58 rows (приблизительно)
/*!40000 ALTER TABLE `game_tag` DISABLE KEYS */;
INSERT INTO `game_tag` (`id`, `tag_id`, `game_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(9, 1, 4, '2017-09-20 09:08:21', '2017-09-20 09:08:21', NULL),
	(10, 2, 4, '2017-09-20 09:08:21', '2017-09-20 09:08:21', NULL),
	(11, 3, 4, '2017-09-20 09:08:21', '2017-09-20 09:08:21', NULL),
	(12, 4, 4, '2017-09-20 09:08:21', '2017-09-20 09:08:21', NULL),
	(15, 3, 6, '2017-09-20 09:21:33', '2017-09-20 09:21:33', NULL),
	(23, 2, 7, '2017-09-20 09:41:23', '2017-09-20 09:41:23', NULL),
	(29, 3, 8, '2017-09-20 10:34:55', '2017-09-20 10:34:55', NULL),
	(37, 3, 3, '2017-09-20 10:35:12', '2017-09-20 10:35:12', NULL),
	(38, 2, 9, '2017-09-20 11:11:37', '2017-09-20 11:11:37', NULL),
	(39, 4, 9, '2017-09-20 11:11:37', '2017-09-20 11:11:37', NULL),
	(40, 3, 10, '2017-09-20 11:12:09', '2017-09-20 11:12:09', NULL),
	(41, 4, 10, '2017-09-20 11:12:09', '2017-09-20 11:12:09', NULL),
	(86, 2, 11, '2017-09-20 12:05:06', '2017-09-20 12:05:06', NULL),
	(87, 3, 11, '2017-09-20 12:05:06', '2017-09-20 12:05:06', NULL),
	(102, 2, 5, '2017-09-21 05:00:40', '2017-09-21 05:00:40', NULL),
	(103, 4, 5, '2017-09-21 05:00:40', '2017-09-21 05:00:40', NULL),
	(152, 1, 2, '2017-09-26 09:57:03', '2017-09-26 09:57:03', NULL),
	(153, 2, 2, '2017-09-26 09:57:03', '2017-09-26 09:57:03', NULL),
	(154, 3, 2, '2017-09-26 09:57:03', '2017-09-26 09:57:03', NULL),
	(170, 1, 14, '2018-03-08 02:10:10', '2018-03-08 02:10:10', NULL),
	(171, 2, 14, '2018-03-08 02:10:10', '2018-03-08 02:10:10', NULL),
	(172, 3, 14, '2018-03-08 02:10:10', '2018-03-08 02:10:10', NULL),
	(175, 1, 15, '2018-03-12 17:17:44', '2018-03-12 17:17:44', NULL),
	(176, 2, 15, '2018-03-12 17:17:44', '2018-03-12 17:17:44', NULL),
	(180, 1, 18, '2018-03-12 18:51:13', '2018-03-12 18:51:13', NULL),
	(181, 2, 18, '2018-03-12 18:51:13', '2018-03-12 18:51:13', NULL),
	(182, 3, 18, '2018-03-12 18:51:13', '2018-03-12 18:51:13', NULL),
	(183, 1, 19, '2018-03-24 23:44:33', '2018-03-24 23:44:33', NULL),
	(184, 1, 20, '2018-03-28 13:38:40', '2018-03-28 13:38:40', NULL),
	(185, 2, 20, '2018-03-28 13:38:40', '2018-03-28 13:38:40', NULL),
	(186, 3, 20, '2018-03-28 13:38:40', '2018-03-28 13:38:40', NULL),
	(205, 1, 22, '2018-05-24 15:53:44', '2018-05-24 15:53:44', NULL),
	(206, 3, 22, '2018-05-24 15:53:44', '2018-05-24 15:53:44', NULL),
	(207, 1, 21, '2018-05-24 15:53:58', '2018-05-24 15:53:58', NULL),
	(208, 3, 21, '2018-05-24 15:53:58', '2018-05-24 15:53:58', NULL),
	(251, 1, 24, '2018-06-11 18:56:32', '2018-06-11 18:56:32', NULL),
	(252, 2, 24, '2018-06-11 18:56:32', '2018-06-11 18:56:32', NULL),
	(253, 3, 24, '2018-06-11 18:56:32', '2018-06-11 18:56:32', NULL),
	(254, 1, 23, '2018-06-11 19:05:18', '2018-06-11 19:05:18', NULL),
	(255, 2, 23, '2018-06-11 19:05:18', '2018-06-11 19:05:18', NULL),
	(256, 3, 23, '2018-06-11 19:05:18', '2018-06-11 19:05:18', NULL),
	(257, 1, 25, '2018-06-11 19:12:46', '2018-06-11 19:12:46', NULL),
	(258, 2, 25, '2018-06-11 19:12:46', '2018-06-11 19:12:46', NULL),
	(259, 3, 25, '2018-06-11 19:12:46', '2018-06-11 19:12:46', NULL),
	(260, 2, 13, '2018-06-19 18:58:12', '2018-06-19 18:58:12', NULL),
	(261, 3, 13, '2018-06-19 18:58:12', '2018-06-19 18:58:12', NULL),
	(271, 1, 1, '2018-06-21 18:34:05', '2018-06-21 18:34:05', NULL),
	(272, 2, 1, '2018-06-21 18:34:05', '2018-06-21 18:34:05', NULL),
	(273, 3, 1, '2018-06-21 18:34:05', '2018-06-21 18:34:05', NULL),
	(280, 1, 26, '2018-06-25 21:20:05', '2018-06-25 21:20:05', NULL),
	(281, 2, 26, '2018-06-25 21:20:05', '2018-06-25 21:20:05', NULL),
	(282, 3, 26, '2018-06-25 21:20:05', '2018-06-25 21:20:05', NULL),
	(299, 1, 27, '2018-07-09 22:57:57', '2018-07-09 22:57:57', NULL),
	(300, 2, 27, '2018-07-09 22:57:57', '2018-07-09 22:57:57', NULL),
	(301, 3, 27, '2018-07-09 22:57:57', '2018-07-09 22:57:57', NULL),
	(307, 1, 28, NULL, NULL, NULL),
	(308, 2, 28, NULL, NULL, NULL),
	(309, 3, 28, NULL, NULL, NULL);
/*!40000 ALTER TABLE `game_tag` ENABLE KEYS */;

-- Дамп структуры для таблица big2.invoices
CREATE TABLE IF NOT EXISTS `invoices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(20,3) NOT NULL,
  `currency_id` int(10) unsigned DEFAULT NULL,
  `trade_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `payment_detail` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'in',
  `payout_purse` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `payment_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoices_currency_id_foreign` (`currency_id`),
  KEY `invoices_trade_id_foreign` (`trade_id`),
  KEY `invoices_user_id_foreign` (`user_id`),
  CONSTRAINT `invoices_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `price_commissions` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `invoices_trade_id_foreign` FOREIGN KEY (`trade_id`) REFERENCES `trades` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `invoices_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1214 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы big2.invoices: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;

-- Дамп структуры для таблица big2.lots
CREATE TABLE IF NOT EXISTS `lots` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `currency_id` int(10) unsigned DEFAULT NULL,
  `game_id` int(10) unsigned DEFAULT NULL,
  `owner_id` int(10) unsigned DEFAULT NULL,
  `server_id` int(10) unsigned DEFAULT NULL,
  `tag_id` int(10) unsigned DEFAULT NULL,
  `price` double(20,3) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `availability` double(20,3) NOT NULL,
  `min_order` double(10,2) NOT NULL DEFAULT '0.00',
  `status` int(11) NOT NULL DEFAULT '1',
  `active` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lots_currency_id_foreign` (`currency_id`),
  KEY `lots_game_id_foreign` (`game_id`),
  KEY `lots_owner_id_foreign` (`owner_id`),
  KEY `lots_server_id_foreign` (`server_id`),
  KEY `lots_tag_id_foreign` (`tag_id`),
  CONSTRAINT `lots_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `lots_game_id_foreign` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `lots_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `lots_server_id_foreign` FOREIGN KEY (`server_id`) REFERENCES `servers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `lots_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы big2.lots: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `lots` DISABLE KEYS */;
/*!40000 ALTER TABLE `lots` ENABLE KEYS */;

-- Дамп структуры для таблица big2.lot_sub_tags
CREATE TABLE IF NOT EXISTS `lot_sub_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lot_id` int(10) unsigned NOT NULL,
  `sub_tag_id` int(10) unsigned NOT NULL,
  `sub_tag_value_id` int(10) unsigned DEFAULT NULL,
  `other_value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lot_sub_tags_lot_id_foreign` (`lot_id`),
  KEY `lot_sub_tags_sub_tag_id_foreign` (`sub_tag_id`),
  KEY `lot_sub_tags_sub_tag_value_id_foreign` (`sub_tag_value_id`),
  CONSTRAINT `lot_sub_tags_lot_id_foreign` FOREIGN KEY (`lot_id`) REFERENCES `lots` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lot_sub_tags_sub_tag_id_foreign` FOREIGN KEY (`sub_tag_id`) REFERENCES `sub_tags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lot_sub_tags_sub_tag_value_id_foreign` FOREIGN KEY (`sub_tag_value_id`) REFERENCES `sub_tag_metadatas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=248 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы big2.lot_sub_tags: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `lot_sub_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `lot_sub_tags` ENABLE KEYS */;

-- Дамп структуры для таблица big2.menus
CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы big2.menus: ~3 rows (приблизительно)
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'admin', '2017-09-14 09:07:06', '2017-09-14 09:07:06'),
	(2, 'user', '2017-10-20 10:23:35', '2017-10-20 10:25:55'),
	(3, 'help', '2017-10-20 10:36:26', '2017-10-20 10:36:26');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;

-- Дамп структуры для таблица big2.menu_items
CREATE TABLE IF NOT EXISTS `menu_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned DEFAULT NULL,
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
  `parameters` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы big2.menu_items: ~37 rows (приблизительно)
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
	(1, 1, 'Dashboard', '/admin', '_self', 'voyager-boat', NULL, NULL, 1, '2017-09-14 09:07:06', '2017-09-14 09:07:06', NULL, NULL),
	(2, 1, 'Медиа', '/admin/media', '_self', 'voyager-images', '#000000', NULL, 6, '2017-09-14 09:07:06', '2017-10-30 17:18:55', NULL, ''),
	(3, 1, 'Посты', '/admin/posts', '_self', 'voyager-news', '#000000', NULL, 7, '2017-09-14 09:07:06', '2017-10-30 17:19:16', NULL, ''),
	(4, 1, 'Пользователи', '/admin/users', '_self', 'voyager-person', '#000000', NULL, 3, '2017-09-14 09:07:06', '2017-10-30 17:16:02', NULL, ''),
	(5, 1, 'Категории', '/admin/categories', '_self', 'voyager-categories', '#000000', NULL, 9, '2017-09-14 09:07:06', '2017-10-30 17:19:34', NULL, ''),
	(6, 1, 'Страницы', '/admin/pages', '_self', 'voyager-file-text', '#000000', NULL, 8, '2017-09-14 09:07:06', '2017-10-30 17:19:25', NULL, ''),
	(7, 1, 'Роли', '/admin/roles', '_self', 'voyager-lock', '#000000', NULL, 2, '2017-09-14 09:07:06', '2017-10-30 17:15:31', NULL, ''),
	(8, 1, 'Инструменты', '', '_self', 'voyager-tools', '#000000', NULL, 10, '2017-09-14 09:07:06', '2017-10-30 17:19:54', NULL, ''),
	(9, 1, 'Свойства меню', '/admin/menus', '_self', 'voyager-list', '#000000', 8, 1, '2017-09-14 09:07:06', '2017-10-30 17:20:15', NULL, ''),
	(10, 1, 'База даных', '/admin/database', '_self', 'voyager-data', '#000000', 8, 2, '2017-09-14 09:07:06', '2017-10-30 17:20:27', NULL, ''),
	(11, 1, 'Настройки', '/admin/settings', '_self', 'voyager-settings', '#000000', NULL, 11, '2017-09-14 09:07:06', '2017-10-30 17:20:34', NULL, ''),
	(12, 1, 'Игры', '/admin/games-list', '_self', 'voyager-controller', '#000000', 15, 1, '2017-09-19 07:19:43', '2017-10-30 17:17:00', NULL, ''),
	(13, 1, 'Тег', '/admin/tags', '_self', 'voyager-tag', '#000000', 15, 3, '2017-09-20 05:27:02', '2017-10-30 17:17:27', NULL, ''),
	(14, 1, 'Сервера', '/admin/servers', '_self', 'voyager-data', '#000000', 15, 2, '2017-09-20 11:32:23', '2017-10-30 17:17:07', NULL, ''),
	(15, 1, 'Настройки игр', '', '_self', 'voyager-rocket', '#000000', NULL, 4, '2017-09-21 05:11:42', '2017-10-30 17:16:49', NULL, ''),
	(16, 1, 'Игровая валюта', '/admin/currency', '_self', 'voyager-dollar', '#000000', 15, 4, '2017-09-21 05:13:20', '2017-10-30 17:17:37', NULL, ''),
	(18, 1, 'Под теги', '/admin/sub-tags', '_self', 'voyager-list-add', '#000000', 15, 5, '2017-09-21 08:51:33', '2017-10-30 17:18:00', NULL, ''),
	(19, 1, 'Лоты', '', '_self', 'voyager-receipt', '#000000', NULL, 5, '2017-10-03 05:49:53', '2017-10-30 17:18:33', NULL, ''),
	(20, 1, 'Список лотов', '/admin/lots', '_self', 'voyager-window-list', '#000000', 19, 1, '2017-10-03 05:50:56', '2017-10-30 17:18:45', NULL, ''),
	(21, 2, 'Мои продажи', '/sales', '_self', NULL, '#000000', NULL, 12, '2017-10-20 10:24:11', '2017-10-20 10:24:11', NULL, ''),
	(22, 2, 'Мои покупки', '/purchases', '_self', NULL, '#000000', NULL, 13, '2017-10-20 10:24:36', '2017-10-20 10:24:36', NULL, ''),
	(23, 2, 'Сообщения', '/chats', '_self', NULL, '#000000', NULL, 14, '2017-10-20 10:25:02', '2017-10-20 10:25:02', NULL, ''),
	(24, 2, 'Кабинет', '/profile', '_self', NULL, '#000000', NULL, 15, '2017-10-20 10:25:17', '2017-10-20 10:25:17', NULL, ''),
	(25, 3, 'Правила для продавцов', '/page/pravila-dlya-prodavcov', '_self', NULL, '#000000', NULL, 1, '2017-10-20 10:39:26', '2017-10-31 13:24:53', NULL, ''),
	(26, 3, 'Разрешение споров', '/page/razreshenie-sporov', '_self', NULL, '#000000', 28, 1, '2017-10-20 10:39:54', '2017-10-31 13:25:01', NULL, ''),
	(27, 3, 'Вопросы и ответы', '/page/voprosy-i-otvety', '_self', NULL, '#000000', NULL, 3, '2017-10-20 10:40:39', '2017-10-31 13:25:01', NULL, ''),
	(29, 3, 'Разрешение споров', '/page/razreshenie-sporov', '_self', NULL, '#000000', NULL, 16, '2017-10-31 13:26:00', '2017-10-31 13:26:00', NULL, ''),
	(30, 1, 'Комиссия', '/admin/commission', '_self', 'voyager-dollar', '#000000', 15, 17, '2018-03-12 17:16:06', '2018-03-12 17:16:06', NULL, NULL),
	(31, 1, 'Чаты', '', '_self', 'voyager-chat', '#000000', NULL, 5, '2018-03-12 17:16:06', '2018-03-12 17:16:06', NULL, NULL),
	(32, 1, 'Настройки чата', '/admin/chat-setting', '_self', 'voyager-params', '#000000', 31, 6, '2018-03-12 17:16:06', '2018-03-12 17:16:06', NULL, NULL),
	(33, 1, 'Все чаты', '/admin/chat', '_self', 'voyager-megaphone', '#000000', 31, 7, '2018-03-12 17:16:06', '2018-03-12 17:16:06', NULL, NULL),
	(34, 1, 'Сделки', '', '_self', 'voyager-chat', '#000000', NULL, 6, '2018-03-12 17:16:06', '2018-03-12 17:16:06', NULL, NULL),
	(35, 1, 'Заявки на вывод', '/admin/payout', '_self', 'voyager-dollar', '#000000', 34, 6, '2018-03-12 17:16:06', '2018-03-12 17:16:06', NULL, NULL),
	(36, 1, 'Все сделки', '/admin/trade', '_self', 'voyager-megaphone', '#000000', 34, 7, '2018-03-12 17:16:06', '2018-03-12 17:16:06', NULL, NULL),
	(37, 1, 'Платежи', '/admin/invoice', '_self', 'voyager-dollar', '#000000', 34, 8, '2018-03-12 17:16:06', '2018-03-12 17:16:06', NULL, NULL),
	(38, 1, 'Ключи (Платежных систем)', '/admin/site/wallet', '_self', 'voyager-settings', '#000000', 34, 9, '2018-03-12 17:16:06', '2018-03-12 17:16:06', NULL, NULL),
	(39, 1, 'Комментарии', '/admin/comments', '_self', 'voyager-megaphone', '#000000', 31, 6, '2018-03-12 17:16:06', '2018-03-12 17:16:06', NULL, NULL);
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;

-- Дамп структуры для таблица big2.messages
CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `from` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `to` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` datetime NOT NULL,
  `is_read` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы big2.messages: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;

-- Дамп структуры для таблица big2.pages
CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы big2.pages: ~3 rows (приблизительно)
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
	(1, 1, 'Вопросы и ответы', NULL, '<h3>Как происходит покупка на PlayZo?</h3>\r\n<p>&nbsp; Покупка проходит в несколько этапов:</p>\r\n<p>&nbsp; &nbsp; 1. Покупатель выбирает нужное ему предложение, предварительно выбрав раздел с интересующими его услугами.</p>\r\n<p>&nbsp; &nbsp; 2. Связывается с продавцом, оговаривает условия сделки, оформляет заказ и производит оплату.</p>\r\n<p>&nbsp; &nbsp; 3. Продавец выполняет заказ и все свои обязательства.</p>\r\n<p>&nbsp; &nbsp; 4. Покупатель подтверждает выполнение заказа, нажав на кнопку "Подтвердить заказ" в разделе "Мои покупки".</p>\r\n<h3>Какие приемущества у PlayZo перед обычным магазинов или другими биржами?</h3>\r\n<p><strong>&nbsp; 1. Самая низкая цена на рынке.</strong></p>\r\n<p>Из-за&nbsp;высокой конкуренции на бирже, продавцы вынуждены всегда поддерживать оптимальные цены на те или иные услуги, постоянно проверяя цены конкурентов. Таким образом, общая цена постоянно падает и всегда есть отдельные предложения по более низкой цене, чем средне-рыночная.</p>\r\n<p><strong>&nbsp; 2. Возможность видеть последние сделки.</strong></p>\r\n<p>Если зайти на главную страницу сайта и промотать её вниз, то можно увидеть несколько последних подтверждённых сделок. Это даёт возможность быстро выбрать проверенного продавца, у которого буквально только была сделана успешная покупка.</p>\r\n<p><strong>&nbsp; 3. Честные и реальные отзывы.</strong></p>\r\n<p>Мы заинтересованы в том, что бы у наших посетителей не возникло ни единого сомнения в безопасности проведения сделок на нашей бирже. И ничто не может быть лучшим показателем надёжности продавца, чем отзывы о предыдущих сделках с ним. Мы так же тщательно следим за тем, чтобы все отзывы были от реальных покупателей, а не появлялись в результате "накрутки". "Накрутка" отзывов строго запрещена и может повлечь за собой блокировку аккаунта.</p>\r\n<p><strong>&nbsp; 4. Моментальная доставка.</strong></p>\r\n<p>Сделка проходит без посредника и покупатель на прямую связан с продавцом. Это позволяет продавцу моментально передать товар покупателю, т.к. не нужно задействовать различные склады посредников, как это работает в случае с обычнми магазинами.</p>\r\n<h3>Гарантирует ли PlayZo отсутствие санкций со стороны правообладателей?</h3>\r\n<p>&nbsp;</p>\r\n<p>Любой гарант-сервис, в том числе и PlayZo, гарантирует надёжность и безопасность сделки "здесь и сейчас". Не в наших силах уберечь кого-либо от последствий, если они вообще возможны.</p>\r\n<p>Все продавцы разные. У всех разные гарнтии и условия, в том числе и условия передачи (если речь о покупке предмета или игровой валюты). Советуем Вам больше обращать внимание на продавцов, которые зарегистрированы давно и на протяжении всего этого времени периодически имеют положительные отзывы. Это даёт понять, что продавец не просто выполнил заказ, но и после этого у покупателя не возникло никаких проблем.</p>\r\n<h3>Что делать, если покупатель/продавец не выполнил условия заказа в полном объёме или не выполнил их вовсе?</h3>\r\n<p>&nbsp;</p>\r\n<p>Если какая-либо из сторон считает, что сделка не выполнена,&nbsp;сразу же необходимо обратиться в арбитраж по этому поводу.</p>\r\n<p>Любые виды споров и инцидентов касательно проводимых сделок у нас на сайте, разрешает сервис арбитража PlayZo. Арбитраж так же несёт материальную ответственность за разрешение споров. Таким образом, если арбитраж допускает ошибку в разрешении спора, сервис PlayZo берёт на себя обязательства компенсировать как прямые, так и косвенные убытки, которые эта ошибка за собой повлекла.</p>', NULL, 'voprosy-i-otvety', NULL, NULL, 'INACTIVE', '2017-10-20 04:35:46', '2018-07-16 17:56:32'),
	(2, 1, 'Разрешение споров', NULL, '<div class="c-text-content__wrap">\r\n<p style="margin-bottom: 0cm;"><span style="font-family: Arial, sans-serif;"><span style="font-size: large;"><strong>Арбитраж <span lang="en-US">Playzo.ru</span></strong></span></span></p>\r\n<p style="margin-bottom: 0cm;">&nbsp;</p>\r\n<p lang="ru-RU" style="margin-bottom: 0cm; font-weight: normal;"><span style="font-family: Arial, sans-serif;"><span style="font-size: medium;">Все участники сделок признают, что все сделки, которые они осуществляют на сайте <span lang="en-US">playzo.ru </span>гарантируются и защищаются арбитражем сервиса. Вмешательство арбитража необходимо, если продавец и покупатель не могут разрешить спор самостоятельно. Обратиться в арбитраж может, как покупатель, так продавец. Оба участника спора для арбитража <span lang="en-US">Playzo.ru </span>являются равными, арбитраж 3-я сторона и рассматривает спор с независимой точки зрения. </span></span></p>\r\n<p lang="ru-RU" style="margin-bottom: 0cm; font-weight: normal;">&nbsp;</p>\r\n<p lang="ru-RU" style="margin-bottom: 0cm;"><span style="font-family: Arial, sans-serif;"><span style="font-size: medium;"><strong>Как обратиться в арбитраж</strong></span></span></p>\r\n<p lang="ru-RU" style="margin-bottom: 0cm;">&nbsp;</p>\r\n<p lang="ru-RU" style="margin-bottom: 0cm; font-weight: normal;"><span style="font-family: Arial, sans-serif;"><span style="font-size: medium;">Для того чтоб начать арбитражное разбирательство, вам необходимо обратиться в чате к онлайн-консультанту (нижний правый угол сайта). Сообщить ему ваш ник на сайте <span lang="en-US">playzo.ru </span>и номер сделки, который вы можете увидеть в разделе &laquo;мои покупки&raquo; или &laquo;мои продажи&raquo;, и изложить суть ваших претензий к другой стороне. </span></span></p>\r\n<p lang="ru-RU" style="margin-bottom: 0cm; font-weight: normal;">&nbsp;</p>\r\n<p lang="ru-RU" style="margin-bottom: 0cm;"><span style="font-family: Arial, sans-serif;"><span style="font-size: medium;"><strong>Как проходит арбитражное разбирательство</strong></span></span></p>\r\n<p lang="ru-RU" style="margin-bottom: 0cm;">&nbsp;</p>\r\n<p lang="ru-RU" style="margin-bottom: 0cm; font-weight: normal;"><span style="font-family: Arial, sans-serif;"><span style="font-size: medium;">После инициирования арбитражного дела, администрация <span lang="en-US">playzo.ru </span>общается с обоими участниками процесса в системе чатов на сайте находящейся в разделе &laquo;сообщения&raquo;. </span></span></p>\r\n<p lang="ru-RU" style="margin-bottom: 0cm; font-weight: normal;">&nbsp;</p>\r\n<p lang="ru-RU" style="margin-bottom: 0cm; font-weight: normal;"><span style="font-family: Arial, sans-serif;"><span style="font-size: medium;">Если дело не очевидно для арбитража и его невозможно разрешить быстро, то арбитраж проводит идентификацию личностей участников процесса. Покупатель и продавец должны выслать на почту <span lang="en-US"><a href="mailto:playzo@gmail.com">playzo@gmail.com</a>&nbsp;&nbsp;</span>фотографию с паспортом в руках открытым на странице с ФИО и фотографией на фоне сайта <span lang="en-US">playzo.ru. </span>В теме письма указать игровой ник и номер сделки, по которой идет арбитражный процесс. </span></span></p>\r\n<p lang="ru-RU" style="margin-bottom: 0cm; font-weight: normal;">&nbsp;</p>\r\n<p lang="ru-RU" style="margin-bottom: 0cm; font-weight: normal;"><span style="font-family: Arial, sans-serif;"><span style="font-size: medium;">Если кто-то из участников спора уклоняется от идентификации личности и (или) от ответов на вопросы арбитража, тем самым он дает право арбитражу вынести решение автоматически в пользу другой стороны. </span></span></p>\r\n<p lang="ru-RU" style="margin-bottom: 0cm; font-weight: normal;">&nbsp;</p>\r\n<p lang="ru-RU" style="margin-bottom: 0cm; font-weight: normal;"><span style="font-family: Arial, sans-serif;"><span style="font-size: medium;">На предоставление фотографии и ответы на вопросы арбитража участникам отводится 3 дня. </span></span></p>\r\n<p lang="ru-RU" style="margin-bottom: 0cm; font-weight: normal;">&nbsp;</p>\r\n<p lang="ru-RU" style="margin-bottom: 0cm;"><span style="font-family: Arial, sans-serif;"><span style="font-size: medium;"><strong>Вступление в силу решения арбитража </strong></span></span></p>\r\n<p lang="ru-RU" style="margin-bottom: 0cm;">&nbsp;</p>\r\n<p lang="ru-RU" style="margin-bottom: 0cm; font-weight: normal;"><span style="font-family: Arial, sans-serif;"><span style="font-size: medium;">Решение арбитража <span lang="en-US">playzo.ru </span>вступает в силу с момента его оглашения обоим участникам спора. </span></span></p>\r\n</div>', NULL, 'razreshenie-sporov', NULL, NULL, 'ACTIVE', '2017-10-20 08:49:07', '2018-07-16 17:59:12'),
	(3, 1, 'Правила для продавцов', 'tbody{\r\nborder:red 2px solid;\r\n}\r\ntd {\r\npadding: 10px;\r\nmargin-bottom: 20px;\r\n}', '<div class="c-rules__header">&nbsp;</div>\r\n<p style="margin-bottom: 0.26cm; text-align: center;"><strong><span style="color: #333333;"><span style="font-family: \'Helvetica Neue\', Helvetica, Arial, sans-serif;"><span style="font-size: 10pt;"><strong>Уважаемые продавцы! Удобство и безопасность всех участников сделок является нашим главным приоритетом. Просьба внимательно отнестись к правилам нашего сайта!</strong></span></span></span></strong></p>\r\n<p style="margin-bottom: 0.26cm; text-align: center;"><strong><span style="color: #333333;"><span style="font-family: \'Helvetica Neue\', Helvetica, Arial, sans-serif;"><span style="font-size: 10pt;"><strong>Уровень санкций, которые выбирает наш сервис зависит от степени ущерба нанесенного покупателю или самому сервису, а также от репутации нарушителя. За повторные нарушения, как правило, санкции ужесточаются. </strong></span></span></span></strong></p>\r\n<p style="margin-bottom: 0.26cm; font-weight: normal;"><br /><br /></p>\r\n<h2 class="western" style="margin-top: 0.53cm; margin-bottom: 0.26cm; line-height: 110%; text-align: center;"><span style="color: #333333;"><span style="font-family: \'Helvetica Neue\', Helvetica, Arial, sans-serif;"><span style="font-size: 22pt;"><strong>Нарушения и санкции</strong></span></span></span></h2>\r\n<table style="height: 193px; padding: 8px; margin-left: auto; margin-right: auto;" border="1" width="642" cellspacing="8" cellpadding="8">\r\n<tbody>\r\n<tr>\r\n<td style="width: 287px;">\r\n<h6><strong>Нарушение</strong></h6>\r\n</td>\r\n<td style="width: 283px;">\r\n<h6><strong>Санкции</strong></h6>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style="width: 287px;">\r\n<h6>Попытка связаться с покупателем по любому типу связи, кроме как, через чат сервиса playzo.ru</h6>\r\n</td>\r\n<td style="width: 283px;">\r\n<h6>Блокировка аккаунта от 10 суток до бессрочной. Если эти действия привели к ущербу покупателю или сервису &mdash; бессрочная блокировка аккаунта. Выплаты прекращаются на тот же срок.</h6>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style="width: 287px;">\r\n<h6>Передача любых данных покупателя 3-м лицам.</h6>\r\n</td>\r\n<td style="width: 283px;">\r\n<h6>Бессрочная блокировка аккаунта и прекращение выплат. Блокировка всех новых аккаунтов.</h6>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style="width: 287px;">\r\n<h6>Продажа товара или услуги в несоответствующем разделе.</h6>\r\n</td>\r\n<td style="width: 283px;">\r\n<h6>Удаление лотов и блокировка аккаунта на сутки. При повторном нарушении бессрочная блокировка.</h6>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style="width: 287px;">\r\n<h6>Создание предложений с разных аккаунтов, принадлежащих одному продавцу. Дублирование лотов и т. п.</h6>\r\n</td>\r\n<td style="width: 283px;">\r\n<h6>Удаление лотов. При повторных нарушениях блокировка аккаунта вплоть до бессрочной.</h6>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style="width: 287px;">\r\n<h6>Создание фиктивных сделок с целью накрутки положительных отзывов.</h6>\r\n</td>\r\n<td style="width: 283px;">\r\n<h6>Блокировка аккаунта на 7 дней и удаление всех отзывов и обнуление числа сделок.</h6>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style="width: 287px;">\r\n<h6>Размещение лотов и длительное нахождение оффлайн (более 3 суток). Создание фейковых лотов (не реализация товаров указанных в лоте). Игнорирование сообщений покупателей, желающих купить лот.</h6>\r\n</td>\r\n<td style="width: 283px;">\r\n<h6>Удаление лотов, при повторных нарушениях блокировка аккаунта от 2 дней до бессрочной.</h6>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style="width: 287px;">\r\n<h6>Запрещено обсуждать с покупателями комиссии сервиса.</h6>\r\n</td>\r\n<td style="width: 283px;">\r\n<h6>Блокировка аккаунта на 3-е суток.</h6>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style="width: 287px;">\r\n<h6>Создание аккаунтов с похожими никами/аватарками уже существующих аккаунтов с целью мошенничества</h6>\r\n</td>\r\n<td style="width: 283px;">\r\n<h6>Блокировка аккаунта.</h6>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p style="margin-bottom: 0.26cm;">&nbsp;</p>\r\n<p style="margin-bottom: 0.26cm; text-align: center;">_________________________________________________________________________________________________________________________________________</p>\r\n<p style="margin-bottom: 0.26cm;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Продажа товаров полученных нелегальным путем (брут, кардинг, взлом и т.д&nbsp; и т. п.) запрещено!&nbsp;</p>\r\n<div class="c-rules__footer text-center"><a id="rules-btn" class="btn btn_blue btn_upper btn_nowrap" href="/confirm-rules">Принять условия</a></div>', NULL, 'pravila-dlya-prodavcov', NULL, NULL, 'ACTIVE', '2017-10-20 08:53:45', '2018-07-13 14:49:37');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;

-- Дамп структуры для таблица big2.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы big2.password_resets: ~1 rows (приблизительно)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
	('pilko.sw@gmail.com', 'c3c15d91e5a3dae41595c3a95465140bd1cf66b8', '2018-05-25 16:09:45');
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Дамп структуры для таблица big2.payment_histories
CREATE TABLE IF NOT EXISTS `payment_histories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `money` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `payment_system` int(11) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы big2.payment_histories: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `payment_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_histories` ENABLE KEYS */;

-- Дамп структуры для таблица big2.payouts
CREATE TABLE IF NOT EXISTS `payouts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `wallet` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(10,2) DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `currency_id` int(10) unsigned DEFAULT NULL,
  `admin_id` int(10) unsigned DEFAULT NULL,
  `payment_info` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `frozen` tinyint(1) NOT NULL DEFAULT '0',
  `confirm_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payouts_user_id_foreign` (`user_id`),
  KEY `payouts_admin_id_foreign` (`admin_id`),
  KEY `payouts_currency_id_foreign` (`currency_id`),
  CONSTRAINT `payouts_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `payouts_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `price_commissions` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `payouts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы big2.payouts: ~1 rows (приблизительно)
/*!40000 ALTER TABLE `payouts` DISABLE KEYS */;
INSERT INTO `payouts` (`id`, `wallet`, `amount`, `user_id`, `currency_id`, `admin_id`, `payment_info`, `status`, `frozen`, `confirm_date`, `created_at`, `updated_at`) VALUES
	(82, '41001672889783', 5.00, NULL, 3, 3, NULL, 1, 0, '2018-07-08 13:25:21', '2018-07-08 13:24:16', '2018-07-08 13:25:21');
/*!40000 ALTER TABLE `payouts` ENABLE KEYS */;

-- Дамп структуры для таблица big2.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `permission_group_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы big2.permissions: ~34 rows (приблизительно)
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`, `permission_group_id`) VALUES
	(1, 'browse_admin', NULL, '2017-09-14 09:07:06', '2017-09-14 09:07:06', NULL),
	(2, 'browse_database', NULL, '2017-09-14 09:07:06', '2017-09-14 09:07:06', NULL),
	(3, 'browse_media', NULL, '2017-09-14 09:07:06', '2017-09-14 09:07:06', NULL),
	(4, 'browse_settings', NULL, '2017-09-14 09:07:06', '2017-09-14 09:07:06', NULL),
	(5, 'browse_menus', 'menus', '2017-09-14 09:07:06', '2017-09-14 09:07:06', NULL),
	(6, 'read_menus', 'menus', '2017-09-14 09:07:07', '2017-09-14 09:07:07', NULL),
	(7, 'edit_menus', 'menus', '2017-09-14 09:07:07', '2017-09-14 09:07:07', NULL),
	(8, 'add_menus', 'menus', '2017-09-14 09:07:07', '2017-09-14 09:07:07', NULL),
	(9, 'delete_menus', 'menus', '2017-09-14 09:07:07', '2017-09-14 09:07:07', NULL),
	(10, 'browse_pages', 'pages', '2017-09-14 09:07:07', '2017-09-14 09:07:07', NULL),
	(11, 'read_pages', 'pages', '2017-09-14 09:07:07', '2017-09-14 09:07:07', NULL),
	(12, 'edit_pages', 'pages', '2017-09-14 09:07:07', '2017-09-14 09:07:07', NULL),
	(13, 'add_pages', 'pages', '2017-09-14 09:07:07', '2017-09-14 09:07:07', NULL),
	(14, 'delete_pages', 'pages', '2017-09-14 09:07:07', '2017-09-14 09:07:07', NULL),
	(15, 'browse_roles', 'roles', '2017-09-14 09:07:07', '2017-09-14 09:07:07', NULL),
	(16, 'read_roles', 'roles', '2017-09-14 09:07:07', '2017-09-14 09:07:07', NULL),
	(17, 'edit_roles', 'roles', '2017-09-14 09:07:07', '2017-09-14 09:07:07', NULL),
	(18, 'add_roles', 'roles', '2017-09-14 09:07:07', '2017-09-14 09:07:07', NULL),
	(19, 'delete_roles', 'roles', '2017-09-14 09:07:07', '2017-09-14 09:07:07', NULL),
	(20, 'browse_users', 'users', '2017-09-14 09:07:07', '2017-09-14 09:07:07', NULL),
	(21, 'read_users', 'users', '2017-09-14 09:07:07', '2017-09-14 09:07:07', NULL),
	(22, 'edit_users', 'users', '2017-09-14 09:07:07', '2017-09-14 09:07:07', NULL),
	(23, 'add_users', 'users', '2017-09-14 09:07:07', '2017-09-14 09:07:07', NULL),
	(24, 'delete_users', 'users', '2017-09-14 09:07:07', '2017-09-14 09:07:07', NULL),
	(25, 'browse_posts', 'posts', '2017-09-14 09:07:07', '2017-09-14 09:07:07', NULL),
	(26, 'read_posts', 'posts', '2017-09-14 09:07:07', '2017-09-14 09:07:07', NULL),
	(27, 'edit_posts', 'posts', '2017-09-14 09:07:07', '2017-09-14 09:07:07', NULL),
	(28, 'add_posts', 'posts', '2017-09-14 09:07:07', '2017-09-14 09:07:07', NULL),
	(29, 'delete_posts', 'posts', '2017-09-14 09:07:07', '2017-09-14 09:07:07', NULL),
	(30, 'browse_categories', 'categories', '2017-09-14 09:07:07', '2017-09-14 09:07:07', NULL),
	(31, 'read_categories', 'categories', '2017-09-14 09:07:07', '2017-09-14 09:07:07', NULL),
	(32, 'edit_categories', 'categories', '2017-09-14 09:07:07', '2017-09-14 09:07:07', NULL),
	(33, 'add_categories', 'categories', '2017-09-14 09:07:07', '2017-09-14 09:07:07', NULL),
	(34, 'delete_categories', 'categories', '2017-09-14 09:07:07', '2017-09-14 09:07:07', NULL);
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;

-- Дамп структуры для таблица big2.permission_groups
CREATE TABLE IF NOT EXISTS `permission_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permission_groups_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы big2.permission_groups: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `permission_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `permission_groups` ENABLE KEYS */;

-- Дамп структуры для таблица big2.permission_role
CREATE TABLE IF NOT EXISTS `permission_role` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы big2.permission_role: ~34 rows (приблизительно)
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
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
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;

-- Дамп структуры для таблица big2.posts
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы big2.posts: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;

-- Дамп структуры для таблица big2.price_commissions
CREATE TABLE IF NOT EXISTS `price_commissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `priority` smallint(5) unsigned DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `can_withdrawal` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы big2.price_commissions: ~9 rows (приблизительно)
/*!40000 ALTER TABLE `price_commissions` DISABLE KEYS */;
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
/*!40000 ALTER TABLE `price_commissions` ENABLE KEYS */;

-- Дамп структуры для таблица big2.reviews
CREATE TABLE IF NOT EXISTS `reviews` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `trade_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `seller_id` int(10) unsigned NOT NULL,
  `mark` tinyint(1) DEFAULT NULL,
  `text` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reviews_trade_id_foreign` (`trade_id`),
  KEY `reviews_user_id_foreign` (`user_id`),
  KEY `reviews_seller_id_foreign` (`seller_id`),
  CONSTRAINT `reviews_seller_id_foreign` FOREIGN KEY (`seller_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reviews_trade_id_foreign` FOREIGN KEY (`trade_id`) REFERENCES `trades` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы big2.reviews: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;

-- Дамп структуры для таблица big2.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы big2.roles: ~2 rows (приблизительно)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
	(1, 'admin', 'Administrator', '2017-09-14 09:07:06', '2017-09-14 09:07:06'),
	(2, 'user', 'Normal User', '2017-09-14 09:07:06', '2017-09-14 09:07:06');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Дамп структуры для таблица big2.servers
CREATE TABLE IF NOT EXISTS `servers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `side` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `game_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `servers_game_id_foreign` (`game_id`),
  CONSTRAINT `servers_game_id_foreign` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы big2.servers: ~79 rows (приблизительно)
/*!40000 ALTER TABLE `servers` DISABLE KEYS */;
INSERT INTO `servers` (`id`, `name`, `side`, `game_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Airin', NULL, 1, '2018-03-07 22:03:35', '2018-05-24 15:41:47', NULL),
	(2, 'BlackBird', NULL, 1, '2018-03-07 22:03:35', '2018-05-24 15:41:47', NULL),
	(3, 'Estus', NULL, 1, '2018-03-07 22:03:35', '2018-05-24 15:41:47', NULL),
	(4, 'Dota Steam', NULL, 2, '2018-03-07 22:03:35', '2018-05-24 15:38:05', '2018-05-24 15:38:05'),
	(5, 'Fifa server 1', NULL, 3, '2018-03-07 22:03:35', '2018-05-24 15:38:15', '2018-05-24 15:38:15'),
	(6, 'Fifa server 2', NULL, 3, '2018-03-07 22:03:35', '2018-05-24 15:38:15', '2018-05-24 15:38:15'),
	(7, 'Fifa server 3', NULL, 3, '2018-03-07 22:03:35', '2018-05-24 15:38:15', '2018-05-24 15:38:15'),
	(8, 'TESO server 1', NULL, 4, '2018-03-07 22:03:35', '2018-05-24 15:40:10', '2018-05-24 15:40:10'),
	(9, 'TESO server 2', NULL, 4, '2018-03-07 22:03:35', '2018-05-24 15:40:10', '2018-05-24 15:40:10'),
	(10, 'TESO server 3', 'Alliance', 4, '2018-03-07 22:03:35', '2018-05-24 15:40:10', '2018-05-24 15:40:10'),
	(11, 'TESO server 4', 'Alliance', 4, '2018-03-07 22:03:35', '2018-05-24 15:40:10', '2018-05-24 15:40:10'),
	(12, 'TESO server 5', NULL, 4, '2018-03-07 22:03:35', '2018-05-24 15:40:10', '2018-05-24 15:40:10'),
	(13, 'TESO server 6', NULL, 4, '2018-03-07 22:03:35', '2018-05-24 15:40:10', '2018-05-24 15:40:10'),
	(14, 'Aion server 1', NULL, 5, '2018-03-07 22:03:35', '2018-05-24 15:40:15', '2018-05-24 15:40:15'),
	(15, 'Aion server 2', NULL, 5, '2018-03-07 22:03:35', '2018-05-24 15:40:15', '2018-05-24 15:40:15'),
	(16, 'Aion server 3', NULL, 5, '2018-03-07 22:03:35', '2018-05-24 15:40:15', '2018-05-24 15:40:15'),
	(17, 'ArcheAge server 1', NULL, 9, '2018-03-07 22:03:35', '2018-05-24 15:39:39', '2018-05-24 15:39:39'),
	(18, 'ArcheAge server 2', NULL, 9, '2018-03-07 22:03:35', '2018-05-24 15:39:39', '2018-05-24 15:39:39'),
	(19, '	Black Desert server 1', NULL, 10, '2018-03-07 22:03:35', '2018-05-24 15:39:29', '2018-05-24 15:39:29'),
	(20, 'Hearthstone server 1', NULL, 11, '2018-03-07 22:03:35', '2018-05-24 15:38:59', '2018-05-24 15:38:59'),
	(21, 'Hearthstone server 2', NULL, 11, '2018-03-07 22:03:35', '2018-05-24 15:38:59', '2018-05-24 15:38:59'),
	(22, 'Hearthstone server 3', NULL, 11, '2018-03-07 22:03:35', '2018-05-24 15:38:59', '2018-05-24 15:38:59'),
	(23, 'GTA 5 server 1', NULL, 12, '2018-03-07 22:03:35', '2018-05-24 15:39:24', '2018-05-24 15:39:24'),
	(24, 'GTA 5 server 2', NULL, 12, '2018-03-07 22:03:35', '2018-05-24 15:39:24', '2018-05-24 15:39:24'),
	(25, 'Gran Kain', NULL, 13, '2018-03-07 22:03:35', '2018-05-24 15:45:27', NULL),
	(26, 'Shillien', NULL, 13, '2018-03-07 22:03:35', '2018-05-24 15:45:27', NULL),
	(27, 'Einhasad', NULL, 13, '2018-03-07 22:03:35', '2018-05-24 15:45:27', NULL),
	(28, 'Lineage 2 Classic server 4', NULL, 13, '2018-03-07 22:03:35', '2018-05-24 15:45:11', '2018-05-24 15:45:11'),
	(29, 'Paagrio', NULL, 13, '2018-03-07 22:03:35', '2018-05-24 15:45:27', NULL),
	(30, 'Lineage 2 Classic server 6', NULL, 13, '2018-03-07 22:03:35', '2018-05-24 15:45:14', '2018-05-24 15:45:14'),
	(31, 'Первый сервер', 'Тьма', 14, '2018-03-08 02:10:10', '2018-05-24 15:39:14', '2018-05-24 15:39:14'),
	(32, 'Второй сервер', 'тьма', 14, '2018-03-08 02:10:10', '2018-05-24 15:39:14', '2018-05-24 15:39:14'),
	(33, 'Первый сервер', 'свет', 14, '2018-03-08 02:10:10', '2018-05-24 15:39:14', '2018-05-24 15:39:14'),
	(34, 'Второй сервер', 'тьма', 14, '2018-03-08 02:10:10', '2018-05-24 15:39:14', '2018-05-24 15:39:14'),
	(35, 'Первый сервер', 'огонь', 14, '2018-03-08 02:10:10', '2018-05-24 15:39:14', '2018-05-24 15:39:14'),
	(36, 'Первый сервер', 'вода', 14, '2018-03-08 02:10:10', '2018-05-24 15:39:14', '2018-05-24 15:39:14'),
	(37, 'Новый', NULL, 15, '2018-03-12 17:17:23', '2018-05-24 15:39:07', '2018-05-24 15:39:07'),
	(38, 'Старый', NULL, 15, '2018-03-12 17:17:23', '2018-05-24 15:39:07', '2018-05-24 15:39:07'),
	(39, 'Нейтральный', NULL, 15, '2018-03-12 17:17:23', '2018-05-24 15:39:07', '2018-05-24 15:39:07'),
	(40, 'Свет', 'такоей', 18, '2018-03-12 17:25:51', '2018-05-24 15:39:20', '2018-05-24 15:39:20'),
	(41, 'Темень', 'Такая то', 18, '2018-03-12 17:25:51', '2018-05-24 15:39:20', '2018-05-24 15:39:20'),
	(42, 'Орион', NULL, 19, '2018-03-24 23:27:47', '2018-05-24 15:39:43', '2018-05-24 15:39:43'),
	(43, 'Атлас', NULL, 19, '2018-03-24 23:27:47', '2018-05-24 15:39:43', '2018-05-24 15:39:43'),
	(44, 'Вега', NULL, 19, '2018-03-24 23:27:47', '2018-05-24 15:39:43', '2018-05-24 15:39:43'),
	(45, 'Тестосервер один', 'тьма', 20, '2018-03-28 13:38:40', '2018-05-24 15:38:22', '2018-05-24 15:38:22'),
	(46, 'Тестосервер один', 'свет', 20, '2018-03-28 13:38:40', '2018-05-24 15:38:22', '2018-05-24 15:38:22'),
	(47, 'Тестосервер один', 'сумерки', 20, '2018-03-28 13:38:40', '2018-05-24 15:38:22', '2018-05-24 15:38:22'),
	(48, 'Тестосервер два', 'тьма', 20, '2018-03-28 13:38:40', '2018-05-24 15:38:22', '2018-05-24 15:38:22'),
	(49, 'Тестосервер два', 'свет', 20, '2018-03-28 13:38:40', '2018-05-24 15:38:22', '2018-05-24 15:38:22'),
	(50, 'Тестосервер два', 'сумерки', 20, '2018-03-28 13:38:40', '2018-05-24 15:38:22', '2018-05-24 15:38:22'),
	(51, 'Elcardia', NULL, 1, '2018-05-24 15:41:47', '2018-05-24 15:41:47', NULL),
	(52, 'Hatos', NULL, 1, '2018-05-24 15:41:47', '2018-05-24 15:41:47', NULL),
	(53, 'Асгард', 'Асмодиане', 23, '2018-05-24 22:55:40', '2018-06-11 19:05:18', NULL),
	(54, 'Атлас', NULL, 24, '2018-06-11 18:56:32', '2018-06-11 18:56:32', NULL),
	(55, 'Гелиос', NULL, 24, '2018-06-11 18:56:32', '2018-06-11 18:56:32', NULL),
	(56, 'Гидра', NULL, 24, '2018-06-11 18:56:32', '2018-06-11 18:56:32', NULL),
	(57, 'Дракон', NULL, 24, '2018-06-11 18:56:32', '2018-06-11 18:56:32', NULL),
	(58, 'Кассиопея', NULL, 24, '2018-06-11 18:56:32', '2018-06-11 18:56:32', NULL),
	(59, 'Лисичка', NULL, 24, '2018-06-11 18:56:32', '2018-06-11 18:56:32', NULL),
	(60, 'Мира', NULL, 24, '2018-06-11 18:56:32', '2018-06-11 18:56:32', NULL),
	(61, 'Орион', NULL, 24, '2018-06-11 18:56:32', '2018-06-11 18:56:32', NULL),
	(62, 'Цербер', NULL, 24, '2018-06-11 18:56:32', '2018-06-11 18:56:32', NULL),
	(63, 'Электра', NULL, 24, '2018-06-11 18:56:32', '2018-06-11 18:56:32', NULL),
	(64, 'Асгард', 'Элийцы', 23, '2018-06-11 19:05:18', '2018-06-11 19:05:18', NULL),
	(65, 'Оберон', 'Асмодиане', 23, '2018-06-11 19:05:18', '2018-06-11 19:05:18', NULL),
	(66, 'Оберон', 'Элийцы', 23, '2018-06-11 19:05:18', '2018-06-11 19:05:18', NULL),
	(67, '(EU) Antriksha', 'Асмодиане (Asmodians)', 25, '2018-06-11 19:12:46', '2018-06-11 19:12:46', NULL),
	(68, '(EU) Antriksha', 'Элийцы (Elyos)', 25, '2018-06-11 19:12:46', '2018-06-11 19:12:46', NULL),
	(69, 'Barus', 'Асмодиане (Asmodians)', 25, '2018-06-11 19:12:46', '2018-06-11 19:12:46', NULL),
	(70, 'Barus', 'Элийцы (Elyos)', 25, '2018-06-11 19:12:46', '2018-06-11 19:12:46', NULL),
	(71, '(EU) Core+Ramona', NULL, 26, '2018-06-25 21:03:24', '2018-06-25 21:03:24', NULL),
	(72, '(NA) Freya', NULL, 26, '2018-06-25 21:03:24', '2018-06-25 21:03:24', NULL),
	(73, '(NA) Nain', NULL, 26, '2018-06-25 21:03:24', '2018-06-25 21:03:24', NULL),
	(74, '(NA) Zaken', NULL, 26, '2018-06-25 21:03:24', '2018-06-25 21:03:24', NULL),
	(75, '(NA) Chronos', NULL, 26, '2018-06-25 21:03:24', '2018-06-25 21:03:24', NULL),
	(76, 'Нить Судьбы', 'Лига', 27, '2018-07-09 19:35:23', '2018-07-09 19:35:23', NULL),
	(77, 'Нить Судьбы', 'Империя', 27, '2018-07-09 19:35:23', '2018-07-09 19:35:23', NULL),
	(78, 'Сервер 2', 'Тьма', 28, '2018-07-22 00:16:38', '2018-07-22 00:17:48', NULL),
	(79, 'Сервер 1', 'Свет', 28, '2018-07-22 00:17:10', '2018-07-22 00:17:48', NULL);
/*!40000 ALTER TABLE `servers` ENABLE KEYS */;

-- Дамп структуры для таблица big2.settings
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы big2.settings: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;

-- Дамп структуры для таблица big2.site_wallets
CREATE TABLE IF NOT EXISTS `site_wallets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keyword` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wallet_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secret_key` text COLLATE utf8mb4_unicode_ci,
  `secret_password` text COLLATE utf8mb4_unicode_ci,
  `additional_field` text COLLATE utf8mb4_unicode_ci,
  `api_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `merchant_id` int(10) unsigned DEFAULT NULL,
  `additional_field2` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `site_wallets_merchant_id_foreign` (`merchant_id`),
  CONSTRAINT `site_wallets_merchant_id_foreign` FOREIGN KEY (`merchant_id`) REFERENCES `price_commissions` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы big2.site_wallets: ~9 rows (приблизительно)
/*!40000 ALTER TABLE `site_wallets` DISABLE KEYS */;
INSERT INTO `site_wallets` (`id`, `title`, `keyword`, `wallet_key`, `secret_key`, `secret_password`, `additional_field`, `api_key`, `is_active`, `merchant_id`, `additional_field2`, `created_at`, `updated_at`) VALUES
	(2, 'Free-Kassa', 'freekassa', '80001', 'eyJpdiI6IjhYNytOeTdkbEdzTUI4M0U2UGdFNGc9PSIsInZhbHVlIjoiXC9IVkZsTkVPdUdxWUxhWEhuTmpLUkE9PSIsIm1hYyI6ImM2NzY5ZWQ1YjJkN2Y3NjZlMzA0YTZkYzU3MTZjNTkwNTg3NmI0MGRiOGRkZGMzNmJkZTRlNTVkOTJhMmVhYWQifQ==', NULL, 'eyJpdiI6IkJRb3FCanRDcks3b0RWZDBRaE56Z2c9PSIsInZhbHVlIjoiSmtWeU5GV2VDMWdXajBzV3BsZ1lSQT09IiwibWFjIjoiYTRhMjZiNTc2NzE1NjY3NmFkMzZlNDdlZmFhZGIxYmJhNjgxMmY0Njg4N2EzZTgxOTMwNDI3Y2VhOWNkMzk3MCJ9', '80001', 1, NULL, NULL, '2018-04-13 12:21:55', '2018-07-18 18:29:13'),
	(3, 'Webmoney WMR', 'wmr', 'R820253507708', NULL, NULL, NULL, 'dfg45sfgs415gf', 1, NULL, NULL, '2018-04-23 17:38:10', '2018-06-21 11:59:30'),
	(4, 'Webmoney WMZ', 'wmz', 'Z092383241467', NULL, NULL, NULL, 'dfg45sfgs415gf2', 1, NULL, NULL, '2018-04-23 17:40:35', '2018-05-23 10:14:36'),
	(5, 'Webmoney WMU', 'wmu', 'U240548140021', NULL, NULL, NULL, 'dfg45sfgs415gf3', 1, NULL, NULL, '2018-04-23 17:46:12', '2018-06-26 13:31:05'),
	(6, 'Webmoney WME', 'wme', 'E839756246200', NULL, NULL, NULL, 'dfg45sfgs415gf4', 1, NULL, NULL, '2018-04-23 17:46:41', '2018-05-23 10:14:47'),
	(7, 'Яндекс 1 кошелёк', 'yandex_money', '410014923133303', 'eyJpdiI6InFCUWFPZGVhQmMxVFpwUTJOT3hxOWc9PSIsInZhbHVlIjoieFB1U0JSXC8wM0gwYVpnQ2FVaFNqUVNRblVHa0VsUlhnQ0JUOFwvZXFHUWJpXC85UFJzc0tkaW93czhcL0grUTJEWFkwRUxVaVRkUkd5aEhjMXgxK1wvZUtjRmFiRVVPaXlOUzVKZTdMUTlYVHRvb0o1R201T0pcLzdiTnRnd0dWQ2Q3NHNDNzZoSzN5YUpvWnJpRWdMQVlpTWs4YWxGeEw4WDZUYStJY2ZTSmxVQzBwVlFOTjBaaWJXTWp2cWh1aXNiUDdyIiwibWFjIjoiNDg0MTcyZWZhNjdhZDhiNDBjOGY1ZmQ5MDFkZGJkNThhNDhkY2I5ZDBiMzY4YmMxZjk2Njg4MzYzNzkxNmZkZiJ9', 'eyJpdiI6ImE1ZWtGXC83aWlidzVsZGpVbmNUalZ3PT0iLCJ2YWx1ZSI6IkhsODNYTk11VFwvRTFSc25wdFFjdzV3PT0iLCJtYWMiOiJlNDFmZWUxOWFiNTY4OTk1YmRkZGZiNDFiNzhjNDFmMDU0ZWI2MDc3OWM1MjZlYTI2NTgzYWZiM2JiMjQwM2M5In0=', 'eyJpdiI6IkxYQkRCZWREdW5pOXZjTG1lMWh0Y2c9PSIsInZhbHVlIjoiT0Mrd3g0dkUwU1BBZWQyVzFoQ2gwZCs3OUpOdXhURlNJaDBrd3JOM3dJeUhwNkIySDVLNk1Kbmg4N0pDdzBUMSIsIm1hYyI6IjRkYTRkZjgwNzJkMGFmNzRkYTBjODU1YzcwNTYzZTY2OGZkNjU1OWZlNGJiMDQ5YTcwNTMyNTQxOWE5YjFkYzIifQ==', 'A9DF19984DD269C8088BA4DE07D04A897ECE802CA98F72BD285067F5CD3C40A3', 0, NULL, 'xXhVipy53alemPziSLUmxpxnGqZDsMpc7jxwJfS8nfaBKiiSc5ufMEvtiqmtUkZM', '2018-05-04 18:31:58', '2018-07-23 17:23:01'),
	(8, 'QIWI (ID)', 'qiwi', '+79895225765', 'eyJpdiI6InY0Q3EyeGk3eGV5WmRiOG50QzZCS2c9PSIsInZhbHVlIjoiNHNFSnNvV2tNVHNnaFhEV2NDQWVKXC83YTZ2MVdwdE84T096UDZvRDUxQ3c9IiwibWFjIjoiN2Y2ZDc5MDVmNThiOTUwYjYzOWMyMDhiMjE0ZjUzNjI2MmQyNjQzYTRiNTQwZjUxYmFiMjE4Njc3NTczNmVlMSJ9', NULL, 'eyJpdiI6IjUyMlFIU3RJNW9MU3JlSzRRekl3ZWc9PSIsInZhbHVlIjoiWlZreVZpS0RTUDRmOHd4VHlYclRNQjY0TWRSeGNVRmhCbGRyWnN4cDQ0NnNpVEFsVDB6a2pqbFBWNlJSWkhCQSIsIm1hYyI6ImU2ZmJmZjYzODNkOGFlMjIxMjA2YmM1ZjkzMmE4NGE3NjQ4MTUxODM2ZjUwMTg1Nzc0MmU0ZGQ1MTc0YzExZDMifQ==', '87672961', 1, NULL, NULL, '2018-05-07 17:57:19', '2018-07-22 16:13:32'),
	(9, 'WMR (Вывод)', 'wmr_out', 'R820253507708', 'eyJpdiI6IlkrVkRsd01cLzZqT2QycHJEWkRvT0R3PT0iLCJ2YWx1ZSI6ImZlSG5yK1NCV1l2VlN4SjJYOFpjdVE9PSIsIm1hYyI6IjZmNmVhZWQ3NDMzYmQzMmM2ZTgyMGMwMWRhNDBhZjhkODBkMmZkNTBlZTg1M2JmMjliY2YwYjViM2Q1NTdkMTAifQ==', NULL, NULL, '236312820801', 1, NULL, NULL, '2018-05-23 10:20:19', '2018-07-18 14:33:25'),
	(11, 'Яндекс 2 кошелёк', 'yandex_money', '410017142403903', 'eyJpdiI6IjBUSjB2SjFKTGoySXZWZTVJSEwrNWc9PSIsInZhbHVlIjoiYndkNUhFZU0wbXF3a0QwUlVGNktBb0F5RVU5Rk12SUhoZXVMRXJNeGlsdUdwM25MTVwvT0VaMzBNbm1PSTdcL2RyTzRUWGZrK1BxZVwvXC9KaDVvZExjOUdRTE95b0lnTUptdVlzbGVnMEh3VFZWbml1V0VDb2VWblFTTmZsTVdFbFJzOTlHVEdnUDNCTEZhYmJCZUkybFdBek9xaThtVGRhNmlyWDBucjRHcU93K0M0bGU5dWUzK2dVOHJVQ3k1SFhUUyIsIm1hYyI6IjM1NjliNjVjOWNhMjFlMTIyZDJmNTc5OTI2NzQ4ODgwZjhlYTZjMDVhOGJiYzc3YjU4OTA1NTVmNGNmMDg0NjYifQ==', 'eyJpdiI6ImRqaXFaM2gyOWlJZW9nUFBNME8rQ2c9PSIsInZhbHVlIjoiM2NkTVRtbTRYXC83c01jRVExbmVKZjNcL1VWZ3pqRlp2UXE2Y2pqbXZXSTkxZEF3QmN2OENucndWSGp1OHJ4YkpuQ1F2RGxqWjNkYmlEckErejNlTUZmTTMrOGVnVmR3cStNK2JcL1l1QTlZQmNMemVPMXBIU1lLakZ5SkRzU1dUYUh0T2VhNzN1dzRJTEhlTHoxckxXalJOem9NSDVKME14eXh1emg1anRuMlwvbGFKNU9ZNDJZNE51Qis1XC95RFQrWjlMYUpIamQ4MlZzZUJwNjNhM1IxYlJ2UWhLemdvK1pEUHRtcHEwZEpLbVdMeFJlMzl3bTR3UmhwRjg2V2RoTkVBSnFDZmhUXC91ZlJJUXVIN2N6UjVzZUZkYmhMeWxvS1Q2XC9BOTU5alhOTm1PMllQU2MwcGpaY2ZHQnQxY0JNSEtOY0dtY0VBWXRIWkw0Q2t3R1lDUzNyK1BzQktsdGpvMlNQdFFPays1YTFla1BNT3R5UVp1UTVPUjdwNCszV09ZdyIsIm1hYyI6Ijk1OGE0M2QyOWM5OTU1MDc0NWU0MmY0ZGRlNzc2Nzg5Zjg1MGU1NWJmM2NiNzkyMTI2YjQ2NDg2MmNlNTVhMDkifQ==', 'eyJpdiI6IkU2b2JIb2FSVTluZEtQcnBOeDZodXc9PSIsInZhbHVlIjoiNnNNRTV1VGtYSzBvTU5EWXY3VFZiYkczdjFUQ3BocHlXb1gybUxtSlQ4cjNGZjhRb2owbUlIUzFXT215RXB1USIsIm1hYyI6ImIwMDA1MGRkNmUwMGE5NThiYWY1OGYzZDg1MjRjMDAwYzBlNzgzOTdmMWU5NTNmMTc0OGM2NzlmMTViYzU3NmIifQ==', 'EA9E0BCFB2B8FCAE7767271F95D589A67E4AF088C1CB337D528CD466B41643DE', 1, NULL, NULL, '2018-07-11 18:29:59', '2018-07-23 17:23:30');
/*!40000 ALTER TABLE `site_wallets` ENABLE KEYS */;

-- Дамп структуры для таблица big2.sms_codes
CREATE TABLE IF NOT EXISTS `sms_codes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы big2.sms_codes: ~16 rows (приблизительно)
/*!40000 ALTER TABLE `sms_codes` DISABLE KEYS */;
INSERT INTO `sms_codes` (`id`, `code`, `phone`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(2, '5199', '968182526', '2018-05-07 19:45:11', '2018-05-07 19:45:11', NULL),
	(3, '7261', '0968182526', '2018-05-07 19:46:15', '2018-05-07 19:46:35', '2018-05-07 19:46:35'),
	(5, '8647', '380968182526', '2018-05-11 19:19:03', '2018-05-11 19:19:35', '2018-05-11 19:19:35'),
	(6, '4995', '79646842504', '2018-05-11 21:25:55', '2018-05-11 21:30:29', '2018-05-11 21:30:29'),
	(7, '7442', '3213123123', '2018-05-12 13:37:46', '2018-05-12 13:37:46', NULL),
	(8, '7565', '1231233213', '2018-05-12 13:38:26', '2018-05-12 13:38:26', NULL),
	(9, '6183', '380968182526', '2018-06-01 15:17:25', '2018-06-01 15:17:25', NULL),
	(10, '2109', '79854691652', '2018-06-08 17:56:29', '2018-06-08 17:57:03', '2018-06-08 17:57:03'),
	(11, '4177', '380672777859', '2018-06-13 19:07:37', '2018-06-13 19:07:51', '2018-06-13 19:07:51'),
	(15, '2508', '380631996701', '2018-06-14 12:39:27', '2018-06-14 12:39:34', '2018-06-14 12:39:34'),
	(16, '9573', '380660525134', '2018-06-14 16:50:45', '2018-06-14 16:50:45', NULL),
	(17, '1688', '380660523154', '2018-06-14 16:52:36', '2018-06-14 16:54:06', '2018-06-14 16:54:06'),
	(18, '2962', '380631288916', '2018-06-14 20:23:36', '2018-06-14 20:23:36', NULL),
	(19, '3503', '380965207017', '2018-06-14 20:29:08', '2018-06-14 20:29:39', '2018-06-14 20:29:39'),
	(20, '5108', '380672777859', '2018-07-04 20:55:05', '2018-07-04 20:55:20', '2018-07-04 20:55:20'),
	(21, '3160', '380664429993', '2018-07-08 01:14:06', '2018-07-08 01:14:24', '2018-07-08 01:14:24');
/*!40000 ALTER TABLE `sms_codes` ENABLE KEYS */;

-- Дамп структуры для таблица big2.sub_tags
CREATE TABLE IF NOT EXISTS `sub_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` int(11) DEFAULT NULL,
  `attach` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы big2.sub_tags: ~75 rows (приблизительно)
/*!40000 ALTER TABLE `sub_tags` DISABLE KEYS */;
INSERT INTO `sub_tags` (`id`, `name`, `priority`, `attach`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Race', NULL, 0, '2017-09-22 08:28:01', '2018-05-25 20:55:08', '2018-05-25 20:55:08'),
	(2, 'Equipment', NULL, 0, '2017-09-22 09:02:53', '2018-05-25 20:55:17', '2018-05-25 20:55:17'),
	(3, 'sasasasasa', NULL, 0, '2017-09-22 12:25:49', '2017-09-23 08:27:07', '2017-09-23 08:27:07'),
	(4, 'Level', NULL, 0, '2017-09-25 05:34:58', '2018-05-25 20:55:14', '2018-05-25 20:55:14'),
	(5, 'Profession', NULL, 0, '2017-09-25 05:43:43', '2018-05-25 20:55:11', '2018-05-25 20:55:11'),
	(6, 'Rang', NULL, 0, '2017-09-25 09:27:45', '2018-05-25 15:09:29', '2018-05-25 15:09:29'),
	(7, 'Category', NULL, 0, '2017-09-25 09:28:38', '2018-05-25 20:55:20', '2018-05-25 20:55:20'),
	(8, 'Тип', NULL, 0, '2017-09-25 12:07:40', '2017-09-25 12:20:26', '2017-09-25 12:20:26'),
	(9, 'Тип', NULL, 0, '2017-09-25 12:20:44', '2017-09-25 12:20:53', '2017-09-25 12:20:53'),
	(10, '12121212', NULL, 0, '2017-09-26 08:49:32', '2018-05-25 10:49:37', '2018-05-25 10:49:37'),
	(11, '212121', NULL, 0, '2017-10-30 17:37:56', '2017-10-30 17:38:36', '2017-10-30 17:38:36'),
	(12, 'Уровень', NULL, 0, '2018-05-25 10:54:54', '2018-05-25 20:55:05', '2018-05-25 20:55:05'),
	(13, 'Категория', 10, 50, '2018-05-25 20:58:09', '2018-05-31 17:52:06', '2018-05-31 17:52:06'),
	(14, 'Лавианроз', 1, 0, '2018-03-30 21:16:33', '2018-05-31 17:40:44', '2018-05-31 17:40:44'),
	(15, 'Тип', 90, 47, '2018-05-30 13:25:59', '2018-05-31 17:40:32', '2018-05-31 17:40:32'),
	(16, 'Тип', 90, 48, '2018-05-30 13:26:50', '2018-05-31 17:40:35', '2018-05-31 17:40:35'),
	(17, 'Категории', 1, 0, '2018-05-31 17:52:45', '2018-05-31 22:33:26', NULL),
	(18, 'Разновидность', 3, 67, '2018-05-31 17:59:31', '2018-06-08 17:24:08', NULL),
	(19, 'Основной тег 2', 10, 0, '2018-05-31 17:59:53', '2018-05-31 19:22:44', '2018-05-31 19:22:44'),
	(20, 'Субтег к 1 тегу', 2, 70, '2018-05-31 18:00:53', '2018-05-31 19:22:51', '2018-05-31 19:22:51'),
	(21, 'Субтег 2 к ТЕГ1', 2, 69, '2018-05-31 18:01:20', '2018-05-31 19:22:47', '2018-05-31 19:22:47'),
	(22, 'Доспех', 1, 0, '2018-05-31 19:08:41', '2018-05-31 19:09:51', '2018-05-31 19:09:51'),
	(23, 'Комплектация', 2, 78, '2018-05-31 19:10:31', '2018-06-04 22:11:47', NULL),
	(24, 'Особенности', 4, 102, '2018-05-31 19:16:40', '2018-05-31 22:20:01', '2018-05-31 22:20:01'),
	(25, 'Разновидность', 4, 78, '2018-05-31 19:28:03', '2018-06-05 18:52:17', NULL),
	(26, 'Разновидность', 3, 102, '2018-05-31 19:36:15', '2018-05-31 22:19:31', '2018-05-31 22:19:31'),
	(27, 'Особенности', 4, 67, '2018-05-31 19:37:31', '2018-06-08 17:24:28', NULL),
	(28, 'Категории', 1, 0, '2018-05-31 19:59:22', '2018-05-31 20:31:31', '2018-05-31 20:31:31'),
	(29, 'Разновидность', 99, 68, '2018-05-31 22:22:23', '2018-06-06 19:34:36', NULL),
	(30, 'Ур.Заточки', 5, 67, '2018-05-31 22:24:35', '2018-06-08 17:22:25', NULL),
	(31, 'Ур.Заточки', 100, 78, '2018-05-31 22:28:38', '2018-06-04 21:56:29', '2018-06-04 21:56:29'),
	(32, 'Особенности', 5, 78, '2018-05-31 22:43:56', '2018-06-05 18:52:34', NULL),
	(33, 'Категории', 1, 0, '2018-05-31 22:58:07', '2018-06-05 18:51:08', NULL),
	(34, 'Уровень', 100, 68, '2018-06-04 21:52:36', '2018-06-04 21:52:36', NULL),
	(35, 'Ур.Заточки', 6, 78, '2018-06-04 21:57:18', '2018-06-05 18:52:50', NULL),
	(36, 'Разновидность', 100, 79, '2018-06-04 22:04:11', '2018-06-04 22:17:37', NULL),
	(37, 'Часть Доспеха', 3, 102, '2018-06-04 22:08:37', '2018-06-05 18:51:58', NULL),
	(38, 'Разновидность', 2, 181, '2018-06-05 18:55:59', '2018-06-05 18:55:59', NULL),
	(39, 'Уровень', 3, 181, '2018-06-05 19:02:40', '2018-06-05 19:02:40', NULL),
	(40, 'Профессия', 1, 0, '2018-06-08 16:53:13', '2018-06-08 16:53:13', NULL),
	(41, 'Уровень', 100, 0, '2018-06-08 17:00:56', '2018-06-08 17:00:56', NULL),
	(42, 'Виды Услуг', 2, 0, '2018-06-08 17:04:13', '2018-06-11 18:44:38', '2018-06-11 18:44:38'),
	(43, 'Ранг', 2, 179, '2018-06-08 17:13:39', '2018-06-08 17:13:39', NULL),
	(44, 'Ранг', 2, 178, '2018-06-08 17:14:54', '2018-06-08 17:14:54', NULL),
	(45, 'Разновидность', 5, 179, '2018-06-08 17:15:53', '2018-06-08 17:38:23', NULL),
	(46, 'Разновидность', 3, 178, '2018-06-08 17:20:22', '2018-06-08 17:20:22', NULL),
	(47, 'Комплектация', 3, 179, '2018-06-08 17:28:46', '2018-06-08 17:37:30', NULL),
	(48, 'Часть Доспеха', 4, 321, '2018-06-08 17:31:30', '2018-06-08 17:38:07', NULL),
	(49, 'Ур.Заточки', 6, 179, '2018-06-08 17:34:24', '2018-06-08 17:38:40', NULL),
	(50, 'Ур.Заточки', 100, 178, '2018-06-08 17:35:26', '2018-06-08 17:35:26', NULL),
	(51, 'Разновидность', 2, 180, '2018-06-08 17:41:25', '2018-06-08 17:41:25', NULL),
	(52, 'Виды Услуг', 1, 0, '2018-06-11 18:45:24', '2018-06-11 18:45:24', NULL),
	(53, 'Категории', 0, 0, '2018-06-11 18:59:52', '2018-06-11 18:59:52', NULL),
	(54, 'Класс', 1, 0, '2018-06-11 19:07:20', '2018-06-11 19:07:20', NULL),
	(55, 'Категории', 1, 0, '2018-06-11 19:08:44', '2018-06-11 19:08:44', NULL),
	(56, 'Виды Услуг', 1, 0, '2018-06-25 21:18:18', '2018-06-25 21:18:18', NULL),
	(57, 'Категории', 1, 0, '2018-06-25 21:22:07', '2018-06-25 21:22:07', NULL),
	(58, 'Комплектация', 2, 375, '2018-06-25 21:25:26', '2018-07-21 20:46:20', NULL),
	(59, 'Особенности', 5, 375, '2018-06-25 21:27:17', '2018-07-21 21:04:43', NULL),
	(60, 'Особенности', 4, 178, '2018-06-25 21:29:02', '2018-06-25 21:29:02', NULL),
	(61, 'Профессия', 1, 0, '2018-06-25 21:35:35', '2018-06-25 21:35:35', NULL),
	(62, 'Разновидность', 100, 79, '2018-06-25 21:37:46', '2018-06-25 21:37:46', NULL),
	(63, 'Разновидность', 5, 375, '2018-06-25 21:39:09', '2018-07-21 21:02:26', NULL),
	(64, 'Разновидность', 99, 68, '2018-06-25 21:42:25', '2018-06-25 21:42:25', NULL),
	(65, 'Разновидность', 3, 67, '2018-06-25 21:45:32', '2018-06-25 21:45:32', NULL),
	(66, 'Ур.Заточки', 6, 375, '2018-06-25 21:47:39', '2018-07-21 21:01:56', NULL),
	(67, 'Ур.Заточки', 5, 67, '2018-06-25 21:50:32', '2018-06-25 21:50:32', NULL),
	(68, 'Уровень', 100, 0, '2018-06-25 21:52:27', '2018-06-25 21:52:27', NULL),
	(69, 'Уровень', 100, 68, '2018-06-25 21:53:46', '2018-06-25 21:53:46', NULL),
	(70, 'Часть Доспеха', 4, 380, '2018-06-25 21:55:52', '2018-07-21 21:03:45', NULL),
	(71, 'Разновидность', 5, 375, '2018-07-21 20:49:03', '2018-07-21 20:59:58', '2018-07-21 20:59:58'),
	(72, 'Часть Доспеха', 4, 380, '2018-07-21 20:54:52', '2018-07-21 21:00:22', '2018-07-21 21:00:22'),
	(73, 'Ресурсы', 1, 129, '2018-07-22 00:20:36', '2018-07-22 01:46:53', '2018-07-22 01:46:53'),
	(74, 'Ресурсы', 1, 0, '2018-07-22 01:47:34', '2018-07-22 01:47:34', NULL),
	(75, 'Ур. Ресурса', 2, 525, '2018-07-22 01:51:16', '2018-07-22 01:51:16', NULL);
/*!40000 ALTER TABLE `sub_tags` ENABLE KEYS */;

-- Дамп структуры для таблица big2.sub_tag_metadatas
CREATE TABLE IF NOT EXISTS `sub_tag_metadatas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` int(11) DEFAULT NULL,
  `subtags_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=530 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы big2.sub_tag_metadatas: ~518 rows (приблизительно)
/*!40000 ALTER TABLE `sub_tag_metadatas` DISABLE KEYS */;
INSERT INTO `sub_tag_metadatas` (`id`, `name`, `priority`, `subtags_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(12, 'Human', NULL, 1, '2017-09-22 08:59:22', '2018-05-25 20:55:08', '2018-05-25 20:55:08'),
	(13, 'Elf', NULL, 1, '2017-09-22 08:59:22', '2018-05-25 20:55:08', '2018-05-25 20:55:08'),
	(14, 'Dark Elf', NULL, 1, '2017-09-22 08:59:22', '2018-05-25 20:55:08', '2018-05-25 20:55:08'),
	(15, 'Ork', NULL, 1, '2017-09-22 08:59:22', '2018-05-25 20:55:08', '2018-05-25 20:55:08'),
	(16, 'Naked', NULL, 2, '2017-09-22 09:02:53', '2018-05-25 20:55:17', '2018-05-25 20:55:17'),
	(17, 'Dressed (details in description)', NULL, 2, '2017-09-22 09:02:53', '2018-05-25 20:55:17', '2018-05-25 20:55:17'),
	(18, 'sasasasasa', NULL, 3, '2017-09-22 12:25:49', '2017-09-23 08:06:03', '2017-09-23 08:06:03'),
	(19, 'assasaasas', NULL, 3, '2017-09-22 12:25:49', '2017-09-23 08:06:03', '2017-09-23 08:06:03'),
	(20, 'asasasasasa', NULL, 3, '2017-09-22 12:25:49', '2017-09-23 08:06:03', '2017-09-23 08:06:03'),
	(21, 'assasasasasa', NULL, 3, '2017-09-22 12:25:49', '2017-09-23 08:06:03', '2017-09-23 08:06:03'),
	(22, 'a', NULL, 6, '2017-09-25 09:27:45', '2018-05-24 22:50:54', '2018-05-24 22:50:54'),
	(23, 'b', NULL, 6, '2017-09-25 09:27:45', '2018-05-24 22:50:55', '2018-05-24 22:50:55'),
	(24, 'c', NULL, 6, '2017-09-25 09:27:45', '2018-05-24 22:50:53', '2018-05-24 22:50:53'),
	(25, 'Armor', NULL, 7, '2017-09-25 09:28:38', '2018-05-25 20:55:20', '2018-05-25 20:55:20'),
	(26, 'Weapon', NULL, 7, '2017-09-25 09:28:38', '2018-05-25 20:55:20', '2018-05-25 20:55:20'),
	(27, 'Td', NULL, 7, '2017-09-25 09:28:38', '2018-05-25 20:55:20', '2018-05-25 20:55:20'),
	(28, 'Одежда', NULL, 8, '2017-09-25 12:07:40', '2017-09-25 12:20:26', '2017-09-25 12:20:26'),
	(29, 'Курьеры', NULL, 8, '2017-09-25 12:07:40', '2017-09-25 12:20:26', '2017-09-25 12:20:26'),
	(30, 'Варды', NULL, 8, '2017-09-25 12:07:40', '2017-09-25 12:20:26', '2017-09-25 12:20:26'),
	(31, 'Ключи', NULL, 8, '2017-09-25 12:07:40', '2017-09-25 12:20:26', '2017-09-25 12:20:26'),
	(32, 'Экраны', NULL, 8, '2017-09-25 12:07:40', '2017-09-25 12:20:26', '2017-09-25 12:20:26'),
	(33, 'Руны', NULL, 8, '2017-09-25 12:07:40', '2017-09-25 12:20:26', '2017-09-25 12:20:26'),
	(34, 'Интерфейсы', NULL, 8, '2017-09-25 12:07:40', '2017-09-25 12:20:26', '2017-09-25 12:20:26'),
	(35, 'Игроки', NULL, 8, '2017-09-25 12:07:40', '2017-09-25 12:20:26', '2017-09-25 12:20:26'),
	(36, 'Комментаторы', NULL, 8, '2017-09-25 12:07:40', '2017-09-25 12:20:26', '2017-09-25 12:20:26'),
	(37, 'Другое', NULL, 8, '2017-09-25 12:07:40', '2017-09-25 12:20:26', '2017-09-25 12:20:26'),
	(38, '12212121', NULL, 10, '2017-09-26 08:49:32', '2018-05-25 10:49:37', '2018-05-25 10:49:37'),
	(39, '21212121', NULL, 10, '2017-09-26 08:49:32', '2018-05-25 10:49:37', '2018-05-25 10:49:37'),
	(40, 'R', NULL, 6, '2018-05-24 22:50:47', '2018-05-25 15:09:29', '2018-05-25 15:09:29'),
	(41, 'R95', NULL, 6, '2018-05-24 22:50:47', '2018-05-25 15:09:29', '2018-05-25 15:09:29'),
	(42, 'R99', NULL, 6, '2018-05-24 22:50:47', '2018-05-25 15:09:29', '2018-05-25 15:09:29'),
	(43, '1-10', NULL, 12, '2018-05-25 10:54:54', '2018-05-25 20:55:05', '2018-05-25 20:55:05'),
	(44, '11-20', NULL, 12, '2018-05-25 10:54:54', '2018-05-25 20:55:05', '2018-05-25 20:55:05'),
	(45, '21-40', NULL, 12, '2018-05-25 10:54:54', '2018-05-25 20:55:05', '2018-05-25 20:55:05'),
	(46, '41-80', NULL, 12, '2018-05-25 10:54:54', '2018-05-25 20:55:05', '2018-05-25 20:55:05'),
	(47, 'Оружие', NULL, 13, '2018-05-25 20:58:09', '2018-05-31 17:52:06', '2018-05-31 17:52:06'),
	(48, 'Одежда', NULL, 13, '2018-05-25 20:58:09', '2018-05-31 17:52:06', '2018-05-31 17:52:06'),
	(49, 'Бижутерия', NULL, 13, '2018-05-25 20:58:09', '2018-05-31 17:52:06', '2018-05-31 17:52:06'),
	(50, 'Камни лавианроз', NULL, 13, '2018-05-25 20:58:09', '2018-05-31 17:52:06', '2018-05-31 17:52:06'),
	(51, 'Другое', NULL, 13, '2018-05-25 20:58:09', '2018-05-31 17:52:06', '2018-05-31 17:52:06'),
	(52, 'Рубин', NULL, 14, '2018-05-25 21:16:33', '2018-05-31 17:40:02', '2018-05-31 17:40:02'),
	(53, 'Аметист', NULL, 14, '2018-05-25 21:16:33', '2018-05-31 17:40:02', '2018-05-31 17:40:02'),
	(54, 'Красный кошачий глаз', NULL, 14, '2018-05-25 21:16:33', '2018-05-31 17:40:01', '2018-05-31 17:40:01'),
	(55, 'Синий кошачий глаз', NULL, 14, '2018-05-25 21:16:33', '2018-05-31 17:40:00', '2018-05-31 17:40:00'),
	(56, 'Сапфир', NULL, 14, '2018-05-25 21:16:33', '2018-05-31 17:39:59', '2018-05-31 17:39:59'),
	(57, 'Обсидиан', NULL, 14, '2018-05-25 21:16:33', '2018-05-31 17:39:57', '2018-05-31 17:39:57'),
	(58, 'Одноручный меч', NULL, 15, '2018-05-30 13:25:59', '2018-05-31 17:40:32', '2018-05-31 17:40:32'),
	(59, 'Одноручный маг. меч', NULL, 15, '2018-05-30 13:25:59', '2018-05-31 17:40:32', '2018-05-31 17:40:32'),
	(60, 'Кинжал', NULL, 15, '2018-05-30 13:25:59', '2018-05-31 17:40:32', '2018-05-31 17:40:32'),
	(61, 'Рапира', NULL, 15, '2018-05-30 13:25:59', '2018-05-31 17:40:32', '2018-05-31 17:40:32'),
	(62, 'Шлем', NULL, 16, '2018-05-30 13:26:50', '2018-05-31 17:40:35', '2018-05-31 17:40:35'),
	(63, 'Верхняя часть доспехов', NULL, 16, '2018-05-30 13:26:50', '2018-05-31 17:40:35', '2018-05-31 17:40:35'),
	(64, 'Нижняя часть доспехов', NULL, 16, '2018-05-30 13:26:50', '2018-05-31 17:40:35', '2018-05-31 17:40:35'),
	(65, 'Рубин', NULL, 13, '2018-05-31 17:50:03', '2018-05-31 17:52:06', '2018-05-31 17:52:06'),
	(66, 'Опал', NULL, 13, '2018-05-31 17:50:03', '2018-05-31 17:52:06', '2018-05-31 17:52:06'),
	(67, 'Оружие', 100, 17, '2018-05-31 17:52:45', '2018-06-06 19:33:18', NULL),
	(68, 'Камни Лавианроз', 97, 17, '2018-05-31 17:52:45', '2018-06-06 19:33:18', NULL),
	(69, '1', NULL, 18, '2018-05-31 17:59:31', '2018-05-31 19:01:57', '2018-05-31 19:01:57'),
	(70, '2', NULL, 18, '2018-05-31 17:59:31', '2018-05-31 19:01:58', '2018-05-31 19:01:58'),
	(71, '3', NULL, 18, '2018-05-31 17:59:31', '2018-05-31 19:01:59', '2018-05-31 19:01:59'),
	(72, '1', NULL, 19, '2018-05-31 17:59:53', '2018-05-31 19:22:44', '2018-05-31 19:22:44'),
	(73, '2', NULL, 19, '2018-05-31 17:59:53', '2018-05-31 19:22:44', '2018-05-31 19:22:44'),
	(74, 'УУУ', NULL, 20, '2018-05-31 18:00:53', '2018-05-31 19:22:51', '2018-05-31 19:22:51'),
	(75, 'ВВВ', NULL, 20, '2018-05-31 18:00:53', '2018-05-31 19:22:51', '2018-05-31 19:22:51'),
	(76, 'ккк', NULL, 21, '2018-05-31 18:01:20', '2018-05-31 19:22:47', '2018-05-31 19:22:47'),
	(77, 'аааа', NULL, 21, '2018-05-31 18:01:20', '2018-05-31 19:22:47', '2018-05-31 19:22:47'),
	(78, 'Доспехи', 99, 17, '2018-05-31 18:52:55', '2018-06-06 19:33:18', NULL),
	(79, 'Бижутерия', 98, 17, '2018-05-31 18:52:55', '2018-06-06 19:33:18', NULL),
	(80, 'Другое', 96, 17, '2018-05-31 18:52:55', '2018-06-06 19:33:18', NULL),
	(81, '1 Одноручный Меч', NULL, 18, '2018-05-31 19:01:05', '2018-05-31 19:01:39', '2018-05-31 19:01:39'),
	(82, '1 Одноручный Меч', NULL, 18, '2018-05-31 19:01:53', '2018-05-31 19:06:51', '2018-05-31 19:06:51'),
	(83, '2 Одноручный маг. меч', NULL, 18, '2018-05-31 19:01:53', '2018-05-31 19:06:50', '2018-05-31 19:06:50'),
	(84, '3 Кинжал', NULL, 18, '2018-05-31 19:01:53', '2018-05-31 19:06:48', '2018-05-31 19:06:48'),
	(85, 'Одноручный Меч', 90, 18, '2018-05-31 19:03:40', '2018-06-08 17:24:08', NULL),
	(86, 'Одноручный маг. меч', 100, 18, '2018-05-31 19:03:40', '2018-06-08 17:24:08', NULL),
	(87, 'Кинжал', 97, 18, '2018-05-31 19:03:40', '2018-06-08 17:24:08', NULL),
	(88, 'Рапира', 86, 18, '2018-05-31 19:03:40', '2018-06-08 17:24:08', NULL),
	(89, 'Двуручный меч', 88, 18, '2018-05-31 19:03:40', '2018-06-08 17:24:08', NULL),
	(90, 'Древний меч', 85, 18, '2018-05-31 19:03:40', '2018-06-08 17:24:08', NULL),
	(91, 'Парные мечи', 89, 18, '2018-05-31 19:03:40', '2018-06-08 17:24:08', NULL),
	(92, 'Парные кинжалы', 96, 18, '2018-05-31 19:03:40', '2018-06-08 17:24:08', NULL),
	(93, 'Одноручное дробящее', 92, 18, '2018-05-31 19:03:40', '2018-06-08 17:24:08', NULL),
	(94, 'Одноручное маг. дробящее', 99, 18, '2018-05-31 19:03:40', '2018-06-08 17:24:08', NULL),
	(95, 'Парное дробящее', 91, 18, '2018-05-31 19:03:40', '2018-06-08 17:24:08', NULL),
	(96, 'Лук', 95, 18, '2018-05-31 19:04:31', '2018-06-08 17:24:08', NULL),
	(97, 'Арбалет', 94, 18, '2018-05-31 19:04:31', '2018-06-08 17:24:08', NULL),
	(98, 'Кастеты', 93, 18, '2018-05-31 19:04:31', '2018-06-08 17:24:08', NULL),
	(99, 'Древкое', NULL, 18, '2018-05-31 19:04:31', '2018-06-08 16:12:01', '2018-06-08 16:12:01'),
	(100, 'Другое', NULL, 18, '2018-05-31 19:04:31', '2018-06-08 16:12:23', '2018-06-08 16:12:23'),
	(101, 'Полный комплект (сет)', 100, 23, '2018-05-31 19:12:21', '2018-06-08 16:20:13', NULL),
	(102, 'Части (Перчатки/Ботинки/Шлем/Верх/Низ)', 99, 23, '2018-05-31 19:12:21', '2018-06-08 16:20:13', NULL),
	(103, 'Шлем', NULL, 24, '2018-05-31 19:16:40', '2018-05-31 19:31:59', '2018-05-31 19:31:59'),
	(104, 'Верхняя часть доспехов', NULL, 24, '2018-05-31 19:16:40', '2018-05-31 19:32:00', '2018-05-31 19:32:00'),
	(105, 'Нижняя часть доспехов', NULL, 24, '2018-05-31 19:16:40', '2018-05-31 19:32:02', '2018-05-31 19:32:02'),
	(106, 'Полный доспех', NULL, 24, '2018-05-31 19:16:40', '2018-05-31 19:32:02', '2018-05-31 19:32:02'),
	(107, 'Перчатки', NULL, 24, '2018-05-31 19:16:40', '2018-05-31 19:32:03', '2018-05-31 19:32:03'),
	(108, 'Ботинки', NULL, 24, '2018-05-31 19:16:40', '2018-05-31 19:32:03', '2018-05-31 19:32:03'),
	(109, 'Щит/Символ', NULL, 24, '2018-05-31 19:16:40', '2018-05-31 19:32:04', '2018-05-31 19:32:04'),
	(110, 'Другое', NULL, 24, '2018-05-31 19:16:40', '2018-05-31 19:32:05', '2018-05-31 19:32:05'),
	(111, 'Легкий', 100, 25, '2018-05-31 19:28:03', '2018-06-08 16:22:22', '2018-06-08 16:22:22'),
	(112, 'Магический', 99, 25, '2018-05-31 19:28:03', '2018-06-08 16:22:19', '2018-06-08 16:22:19'),
	(113, 'Тяжелый', 98, 25, '2018-05-31 19:28:03', '2018-06-08 16:22:16', '2018-06-08 16:22:16'),
	(114, 'Обычные', NULL, 24, '2018-05-31 19:32:41', '2018-05-31 22:20:01', '2018-05-31 22:20:01'),
	(115, 'Благословенные', NULL, 24, '2018-05-31 19:32:41', '2018-05-31 22:20:01', '2018-05-31 22:20:01'),
	(116, 'ПВЕ', NULL, 24, '2018-05-31 19:32:41', '2018-05-31 22:20:01', '2018-05-31 22:20:01'),
	(117, 'ПВП', NULL, 24, '2018-05-31 19:32:41', '2018-05-31 22:20:01', '2018-05-31 22:20:01'),
	(118, 'Совершенные/Безупречные', NULL, 24, '2018-05-31 19:32:41', '2018-05-31 22:20:01', '2018-05-31 22:20:01'),
	(119, 'Легкие', NULL, 26, '2018-05-31 19:36:15', '2018-05-31 22:19:31', '2018-05-31 22:19:31'),
	(120, 'Магические', NULL, 26, '2018-05-31 19:36:15', '2018-05-31 22:19:31', '2018-05-31 22:19:31'),
	(121, 'Тяжелые', NULL, 26, '2018-05-31 19:36:15', '2018-05-31 22:19:31', '2018-05-31 22:19:31'),
	(122, 'Обычный', NULL, 27, '2018-05-31 19:37:31', '2018-06-04 21:37:36', '2018-06-04 21:37:36'),
	(123, 'Благословенный', NULL, 27, '2018-05-31 19:37:31', '2018-06-04 21:37:35', '2018-06-04 21:37:35'),
	(124, 'ПВЕ', NULL, 27, '2018-05-31 19:37:31', '2018-06-04 21:37:47', '2018-06-04 21:37:47'),
	(125, 'ПВП', NULL, 27, '2018-05-31 19:37:31', '2018-06-04 21:37:46', '2018-06-04 21:37:46'),
	(126, 'Совершенный/Безупречный', NULL, 27, '2018-05-31 19:37:31', '2018-06-04 21:36:42', '2018-06-04 21:36:42'),
	(127, 'Рубин', 97, 29, '2018-05-31 22:22:23', '2018-06-08 16:26:36', NULL),
	(128, 'Бриллиант', 95, 29, '2018-05-31 22:22:23', '2018-06-08 16:26:36', NULL),
	(129, 'Аметист', 100, 29, '2018-05-31 22:22:23', '2018-06-08 16:26:36', NULL),
	(130, 'Сапфри', NULL, 29, '2018-05-31 22:22:23', '2018-06-04 21:55:19', '2018-06-04 21:55:19'),
	(131, '+6', 99, 30, '2018-05-31 22:24:51', '2018-06-08 17:22:25', NULL),
	(132, '+8', 97, 30, '2018-05-31 22:24:51', '2018-06-08 17:22:25', NULL),
	(133, '+10', 95, 30, '2018-05-31 22:24:51', '2018-06-08 17:22:25', NULL),
	(134, '+12', 93, 30, '2018-05-31 22:26:39', '2018-06-08 17:22:25', NULL),
	(135, '+14', 91, 30, '2018-05-31 22:26:39', '2018-06-08 17:22:25', NULL),
	(136, '+16', 89, 30, '2018-05-31 22:26:39', '2018-06-08 17:22:25', NULL),
	(137, '+6', NULL, 31, '2018-05-31 22:28:38', '2018-06-04 21:43:56', '2018-06-04 21:43:56'),
	(138, '+8', NULL, 31, '2018-05-31 22:28:38', '2018-06-04 21:43:55', '2018-06-04 21:43:55'),
	(139, '+10', NULL, 31, '2018-05-31 22:28:38', '2018-06-04 21:43:54', '2018-06-04 21:43:54'),
	(140, '+16', NULL, 31, '2018-05-31 22:28:38', '2018-06-04 21:43:50', '2018-06-04 21:43:50'),
	(141, 'Обычный', 100, 32, '2018-05-31 22:43:56', '2018-06-08 16:20:41', NULL),
	(142, 'Благословенный', 99, 32, '2018-05-31 22:43:56', '2018-06-08 16:20:41', NULL),
	(143, 'ПВЕ', 98, 32, '2018-05-31 22:43:56', '2018-06-08 16:20:41', NULL),
	(144, 'ПВП', 97, 32, '2018-05-31 22:43:56', '2018-06-08 16:20:41', NULL),
	(145, 'Совершенный/Безупречный', 96, 32, '2018-05-31 22:43:56', '2018-06-08 16:20:41', NULL),
	(146, 'Классика1', NULL, 33, '2018-05-31 22:58:07', '2018-06-04 21:59:22', '2018-06-04 21:59:22'),
	(147, 'Классика2', NULL, 33, '2018-05-31 22:58:07', '2018-06-04 21:59:21', '2018-06-04 21:59:21'),
	(148, 'Классика3', NULL, 33, '2018-05-31 22:58:07', '2018-06-04 21:59:20', '2018-06-04 21:59:20'),
	(149, 'Классика4', NULL, 33, '2018-05-31 22:58:07', '2018-06-04 21:59:17', '2018-06-04 21:59:17'),
	(150, 'Обычное', NULL, 27, '2018-06-04 21:36:44', '2018-06-04 21:37:40', '2018-06-04 21:37:40'),
	(151, 'Благословенное', NULL, 27, '2018-06-04 21:36:44', '2018-06-04 21:37:41', '2018-06-04 21:37:41'),
	(152, 'Обычное', 100, 27, '2018-06-04 21:38:11', '2018-06-08 17:24:28', NULL),
	(153, 'Благословенное', 99, 27, '2018-06-04 21:38:11', '2018-06-08 17:24:28', NULL),
	(154, 'ПВЕ', 98, 27, '2018-06-04 21:38:11', '2018-06-08 17:24:28', NULL),
	(155, 'ПВП', 97, 27, '2018-06-04 21:38:11', '2018-06-08 17:24:28', NULL),
	(156, '+6', NULL, 31, '2018-06-04 21:44:25', '2018-06-04 21:56:29', '2018-06-04 21:56:29'),
	(157, '+8', NULL, 31, '2018-06-04 21:44:25', '2018-06-04 21:56:29', '2018-06-04 21:56:29'),
	(158, '+10', NULL, 31, '2018-06-04 21:44:25', '2018-06-04 21:56:29', '2018-06-04 21:56:29'),
	(159, '+12', NULL, 31, '2018-06-04 21:44:25', '2018-06-04 21:56:29', '2018-06-04 21:56:29'),
	(160, '+14', NULL, 31, '2018-06-04 21:44:25', '2018-06-04 21:56:29', '2018-06-04 21:56:29'),
	(161, '+16', NULL, 31, '2018-06-04 21:44:25', '2018-06-04 21:56:29', '2018-06-04 21:56:29'),
	(162, 'Сапфир', 96, 29, '2018-06-04 21:50:27', '2018-06-08 16:26:36', NULL),
	(163, 'Опал', 94, 29, '2018-06-04 21:50:27', '2018-06-08 16:26:36', NULL),
	(164, 'Обсидиан', 92, 29, '2018-06-04 21:50:27', '2018-06-08 16:26:36', NULL),
	(165, 'Жемчуг', 93, 29, '2018-06-04 21:50:27', '2018-06-08 16:26:36', NULL),
	(166, '1-го уровня', 100, 34, '2018-06-04 21:52:36', '2018-06-08 16:29:07', NULL),
	(167, '2-го уровня', 99, 34, '2018-06-04 21:52:36', '2018-06-08 16:29:07', NULL),
	(168, '3-го уровня', 98, 34, '2018-06-04 21:52:36', '2018-06-08 16:29:07', NULL),
	(169, '4-го уровня', 97, 34, '2018-06-04 21:52:36', '2018-06-08 16:29:07', NULL),
	(170, '5-го уровня', 96, 34, '2018-06-04 21:52:36', '2018-06-08 16:29:07', NULL),
	(171, '6-го уровня', 95, 34, '2018-06-04 21:52:36', '2018-06-08 16:29:07', NULL),
	(172, '+6', 99, 35, '2018-06-04 21:57:18', '2018-06-08 16:34:52', NULL),
	(173, '+8', 97, 35, '2018-06-04 21:57:18', '2018-06-08 16:34:52', NULL),
	(174, '+10', 95, 35, '2018-06-04 21:57:18', '2018-06-08 16:34:52', NULL),
	(175, '+12', 93, 35, '2018-06-04 21:57:18', '2018-06-08 16:34:52', NULL),
	(176, '+14', 91, 35, '2018-06-04 21:57:18', '2018-06-08 16:34:52', NULL),
	(177, '+16', 89, 35, '2018-06-04 21:57:18', '2018-06-08 16:34:52', NULL),
	(178, 'Оружие', 100, 33, '2018-06-04 21:59:11', '2018-06-08 16:19:53', NULL),
	(179, 'Доспехи', 99, 33, '2018-06-04 21:59:11', '2018-06-08 16:19:53', NULL),
	(180, 'Бижутерия', 98, 33, '2018-06-04 21:59:11', '2018-06-08 16:19:53', NULL),
	(181, 'Руны', 97, 33, '2018-06-04 21:59:11', '2018-06-08 16:19:53', NULL),
	(182, 'Кольцо', 100, 36, '2018-06-04 22:04:11', '2018-06-08 16:21:27', NULL),
	(183, 'Серьга', 99, 36, '2018-06-04 22:04:11', '2018-06-08 16:21:27', NULL),
	(184, 'Ожерелье', 98, 36, '2018-06-04 22:04:11', '2018-06-08 16:21:27', NULL),
	(185, 'Брошка', 97, 36, '2018-06-04 22:06:49', '2018-06-08 16:21:27', NULL),
	(186, 'Шлем', 98, 37, '2018-06-04 22:10:53', '2018-06-08 16:31:40', NULL),
	(187, 'Верхняя часть доспеха', 100, 37, '2018-06-04 22:10:53', '2018-06-08 16:31:40', NULL),
	(188, 'Нижняя часть доспеха', 99, 37, '2018-06-04 22:10:53', '2018-06-08 16:31:40', NULL),
	(189, 'Полный Доспех', 95, 37, '2018-06-04 22:10:53', '2018-06-08 16:31:40', NULL),
	(190, 'Перчатки', 97, 37, '2018-06-04 22:10:53', '2018-06-08 16:31:40', NULL),
	(191, 'Ботинки', 96, 37, '2018-06-04 22:10:53', '2018-06-08 16:31:40', NULL),
	(192, 'Щит/символ', 94, 37, '2018-06-04 22:10:53', '2018-06-08 16:31:40', NULL),
	(193, 'Руна Одала', NULL, 38, '2018-06-05 18:55:59', '2018-06-05 18:57:18', '2018-06-05 18:57:18'),
	(194, 'Руна Сигиля', NULL, 38, '2018-06-05 18:55:59', '2018-06-05 18:57:17', '2018-06-05 18:57:17'),
	(195, 'Руна Эура', NULL, 38, '2018-06-05 18:55:59', '2018-06-05 18:57:16', '2018-06-05 18:57:16'),
	(196, 'Руна Веньое', NULL, 38, '2018-06-05 18:55:59', '2018-06-05 18:57:16', '2018-06-05 18:57:16'),
	(197, 'Руна Сигеля', NULL, 38, '2018-06-05 18:56:53', '2018-06-05 18:57:15', '2018-06-05 18:57:15'),
	(198, 'Руна Сигеля2', NULL, 38, '2018-06-05 18:57:08', '2018-06-05 18:57:14', '2018-06-05 18:57:14'),
	(199, 'Руна Сигеля', NULL, 38, '2018-06-05 18:58:33', '2018-06-05 18:58:33', NULL),
	(200, 'Руна Тира', NULL, 38, '2018-06-05 18:58:33', '2018-06-05 18:58:33', NULL),
	(201, 'Руна Одала', NULL, 38, '2018-06-05 18:58:33', '2018-06-05 18:58:33', NULL),
	(202, 'Руна Эура', NULL, 38, '2018-06-05 18:58:33', '2018-06-05 18:58:33', NULL),
	(203, 'Руна Фео', NULL, 38, '2018-06-05 18:58:33', '2018-06-05 18:58:33', NULL),
	(204, 'Руна Иса', NULL, 38, '2018-06-05 18:58:33', '2018-06-05 18:58:33', NULL),
	(205, 'Руна Веньо', NULL, 38, '2018-06-05 18:58:33', '2018-06-05 18:58:33', NULL),
	(206, 'Руна Альгиза', NULL, 38, '2018-06-05 18:58:33', '2018-06-05 18:58:33', NULL),
	(207, '6 Уровня', 100, 39, '2018-06-05 19:02:40', '2018-06-08 16:29:38', NULL),
	(208, '7 Уровня', 99, 39, '2018-06-05 19:02:40', '2018-06-08 16:29:38', NULL),
	(209, '8 Уровня', 98, 39, '2018-06-05 19:02:40', '2018-06-08 16:29:38', NULL),
	(210, '9 Уровня', 97, 39, '2018-06-05 19:02:40', '2018-06-08 16:29:38', NULL),
	(211, '10 Уровня', 96, 39, '2018-06-05 19:02:40', '2018-06-08 16:29:38', NULL),
	(212, '11 Уровня', 95, 39, '2018-06-05 19:02:40', '2018-06-08 16:29:38', NULL),
	(213, '12 Уровня', 94, 39, '2018-06-05 19:02:40', '2018-06-08 16:29:38', NULL),
	(214, '13 Уровня', 93, 39, '2018-06-05 19:02:40', '2018-06-08 16:29:38', NULL),
	(215, 'Двуручное дробящее', 87, 18, '2018-06-08 16:10:08', '2018-06-08 17:24:08', NULL),
	(216, 'Двуручное маг. дробящее', 98, 18, '2018-06-08 16:10:08', '2018-06-08 17:24:08', NULL),
	(217, 'Другое оружие', 84, 18, '2018-06-08 16:11:17', '2018-06-08 17:24:08', NULL),
	(218, 'Легкие', 100, 25, '2018-06-08 16:22:10', '2018-06-08 16:22:24', NULL),
	(219, 'Магические', 99, 25, '2018-06-08 16:22:10', '2018-06-08 16:22:24', NULL),
	(220, 'Тяжелые', 98, 25, '2018-06-08 16:22:10', '2018-06-08 16:22:24', NULL),
	(221, 'Красный Кошачий Глаз', 99, 29, '2018-06-08 16:26:36', '2018-06-08 16:26:36', NULL),
	(222, 'Синий Кошачий Глаз', 98, 29, '2018-06-08 16:26:36', '2018-06-08 16:26:36', NULL),
	(223, 'Изумруд', 91, 29, '2018-06-08 16:26:36', '2018-06-08 16:26:36', NULL),
	(224, 'Гранат', 90, 29, '2018-06-08 16:26:36', '2018-06-08 16:26:36', NULL),
	(225, 'Танзанит', 89, 29, '2018-06-08 16:26:36', '2018-06-08 16:26:36', NULL),
	(226, 'Кошачий Глаз', 88, 29, '2018-06-08 16:26:36', '2018-06-08 16:26:36', NULL),
	(227, 'Энергии', 87, 29, '2018-06-08 16:26:36', '2018-06-08 16:26:36', NULL),
	(228, 'Аквамарин', 86, 29, '2018-06-08 16:26:36', '2018-06-08 16:26:36', NULL),
	(229, 'Порошок', 85, 29, '2018-06-08 16:26:36', '2018-06-08 16:26:36', NULL),
	(230, '+1-5', 100, 35, '2018-06-08 16:34:52', '2018-06-08 16:34:52', NULL),
	(231, '+7', 98, 35, '2018-06-08 16:34:52', '2018-06-08 16:34:52', NULL),
	(232, '+9', 96, 35, '2018-06-08 16:34:52', '2018-06-08 16:34:52', NULL),
	(233, '+11', 94, 35, '2018-06-08 16:34:52', '2018-06-08 16:34:52', NULL),
	(234, '+13', 92, 35, '2018-06-08 16:34:52', '2018-06-08 16:34:52', NULL),
	(235, '+15', 90, 35, '2018-06-08 16:34:52', '2018-06-08 16:34:52', NULL),
	(236, '+1-5', 100, 30, '2018-06-08 16:36:35', '2018-06-08 17:22:25', NULL),
	(237, '+7', 98, 30, '2018-06-08 16:36:35', '2018-06-08 17:22:25', NULL),
	(238, '+9', 96, 30, '2018-06-08 16:36:35', '2018-06-08 17:22:25', NULL),
	(239, '+11', 94, 30, '2018-06-08 16:36:35', '2018-06-08 17:22:25', NULL),
	(240, '+13', 92, 30, '2018-06-08 16:36:35', '2018-06-08 17:22:25', NULL),
	(241, '+15', 90, 30, '2018-06-08 16:36:35', '2018-06-08 17:22:25', NULL),
	(242, 'Жрец Евы Альгиза', 100, 40, '2018-06-08 16:53:13', '2018-06-08 16:58:37', NULL),
	(243, 'Жрец Шилен Альгиза', 99, 40, '2018-06-08 16:53:13', '2018-06-08 16:58:37', NULL),
	(244, 'Кардинал Альгиза', 98, 40, '2018-06-08 16:53:13', '2018-06-08 16:58:37', NULL),
	(245, 'Глас Судьбы Иса', 97, 40, '2018-06-08 16:53:13', '2018-06-08 16:58:37', NULL),
	(246, 'Деспот Иса', 96, 40, '2018-06-08 16:53:13', '2018-06-08 16:58:37', NULL),
	(247, 'Виртуоз Иса', 95, 40, '2018-06-08 16:53:13', '2018-06-08 16:58:37', NULL),
	(248, 'Призрачный Танцор Иса', 94, 40, '2018-06-08 16:53:13', '2018-06-08 16:58:37', NULL),
	(249, 'Апостол Иса', 93, 40, '2018-06-08 16:53:13', '2018-06-08 16:58:37', NULL),
	(250, 'Инквизитор Фео', 92, 40, '2018-06-08 16:53:13', '2018-06-08 16:58:37', NULL),
	(251, 'Пожиратель Душ Фео', 91, 40, '2018-06-08 16:53:13', '2018-06-08 16:58:37', NULL),
	(252, 'Архимаг Фео', 90, 40, '2018-06-08 16:53:13', '2018-06-08 16:58:37', NULL),
	(253, 'Магистр Магии Фео', 89, 40, '2018-06-08 16:53:13', '2018-06-08 16:58:37', NULL),
	(254, 'Повелитель Бури Фео', 88, 40, '2018-06-08 16:53:13', '2018-06-08 16:58:37', NULL),
	(255, 'Снайпер Эура', 87, 40, '2018-06-08 16:53:13', '2018-06-08 16:58:37', NULL),
	(256, 'Страж Лунного Света Эура', 86, 40, '2018-06-08 16:53:13', '2018-06-08 16:58:37', NULL),
	(257, 'Страж Теней Эура', 85, 40, '2018-06-08 16:53:13', '2018-06-08 16:58:37', NULL),
	(258, 'Диверсант Эура', 84, 40, '2018-06-08 16:53:13', '2018-06-08 16:58:37', NULL),
	(259, 'Призрачный Охотник Одала', 83, 40, '2018-06-08 16:53:13', '2018-06-08 16:58:37', NULL),
	(260, 'Странник Ветра Одала', 82, 40, '2018-06-08 16:53:13', '2018-06-08 16:58:37', NULL),
	(261, 'Авантюрист Одала', 81, 40, '2018-06-08 16:53:13', '2018-06-08 16:58:37', NULL),
	(262, 'Кладоискатель Одала', 80, 40, '2018-06-08 16:53:13', '2018-06-08 16:58:37', NULL),
	(263, 'Полководец Тира', 79, 40, '2018-06-08 16:53:13', '2018-06-08 16:58:37', NULL),
	(264, 'Дуэлист Тира', 78, 40, '2018-06-08 16:53:13', '2018-06-08 16:58:37', NULL),
	(265, 'Аватар Тира', 77, 40, '2018-06-08 16:53:13', '2018-06-08 16:58:37', NULL),
	(266, 'Каратель Тира', 76, 40, '2018-06-08 16:53:13', '2018-06-08 16:58:37', NULL),
	(267, 'Титан Тира', 75, 40, '2018-06-08 16:53:13', '2018-06-08 16:58:37', NULL),
	(268, 'Мастер Тира', 74, 40, '2018-06-08 16:53:13', '2018-06-08 16:58:37', NULL),
	(269, 'Чернокнижник Веньо', 73, 40, '2018-06-08 16:58:37', '2018-06-08 16:58:37', NULL),
	(270, 'Владыка Теней Веньо', 72, 40, '2018-06-08 16:58:37', '2018-06-08 16:58:37', NULL),
	(271, 'Мастер Стихий Веньо', 71, 40, '2018-06-08 16:58:37', '2018-06-08 16:58:37', NULL),
	(272, 'Рыцарь Феникса Сигеля', 70, 40, '2018-06-08 16:58:37', '2018-06-08 16:58:37', NULL),
	(273, 'Храмовник Евы Сигеля', 69, 40, '2018-06-08 16:58:37', '2018-06-08 16:58:37', NULL),
	(274, 'Храмовник Шилен Сигеля', 68, 40, '2018-06-08 16:58:37', '2018-06-08 16:58:37', NULL),
	(275, 'Рыцарь Ада Сигеля', 67, 40, '2018-06-08 16:58:37', '2018-06-08 16:58:37', NULL),
	(276, 'Заступник Сайхи', 66, 40, '2018-06-08 16:58:37', '2018-06-08 16:58:37', NULL),
	(277, 'Громовержец Сайхи', 65, 40, '2018-06-08 16:58:37', '2018-06-08 16:58:37', NULL),
	(278, '85+', 100, 41, '2018-06-08 17:00:56', '2018-06-08 17:00:56', NULL),
	(279, '90+', 99, 41, '2018-06-08 17:00:56', '2018-06-08 17:00:56', NULL),
	(280, '95+', 98, 41, '2018-06-08 17:00:56', '2018-06-08 17:00:56', NULL),
	(281, '99+', 97, 41, '2018-06-08 17:00:56', '2018-06-08 17:00:56', NULL),
	(282, '100+', 96, 41, '2018-06-08 17:00:56', '2018-06-08 17:00:56', NULL),
	(283, '101+', 95, 41, '2018-06-08 17:00:56', '2018-06-08 17:00:56', NULL),
	(284, '102+', 94, 41, '2018-06-08 17:00:56', '2018-06-08 17:00:56', NULL),
	(285, '103+', 93, 41, '2018-06-08 17:00:56', '2018-06-08 17:00:56', NULL),
	(286, '104+', 92, 41, '2018-06-08 17:00:56', '2018-06-08 17:00:56', NULL),
	(287, '105+', 91, 41, '2018-06-08 17:00:56', '2018-06-08 17:00:56', NULL),
	(288, 'Прокачка', 100, 42, '2018-06-08 17:04:13', '2018-06-11 18:44:38', '2018-06-11 18:44:38'),
	(289, 'Драйвер', 99, 42, '2018-06-08 17:04:13', '2018-06-11 18:44:38', '2018-06-11 18:44:38'),
	(290, 'Другое', 98, 42, '2018-06-08 17:04:13', '2018-06-11 18:44:38', '2018-06-11 18:44:38'),
	(291, 'D - ранг', 100, 43, '2018-06-08 17:13:39', '2018-06-08 17:13:39', NULL),
	(292, 'С - ранг', 99, 43, '2018-06-08 17:13:39', '2018-06-08 17:13:39', NULL),
	(293, 'В - ранг', 98, 43, '2018-06-08 17:13:39', '2018-06-08 17:13:39', NULL),
	(294, 'А - ранг', 97, 43, '2018-06-08 17:13:39', '2018-06-08 17:13:39', NULL),
	(295, 'Без ранга', 96, 43, '2018-06-08 17:13:39', '2018-06-08 17:13:39', NULL),
	(296, 'D - ранг', 100, 44, '2018-06-08 17:14:54', '2018-06-08 17:14:54', NULL),
	(297, 'С - ранг', 99, 44, '2018-06-08 17:14:54', '2018-06-08 17:14:54', NULL),
	(298, 'В - ранг', 98, 44, '2018-06-08 17:14:54', '2018-06-08 17:14:54', NULL),
	(299, 'А - ранг', 97, 44, '2018-06-08 17:14:54', '2018-06-08 17:14:54', NULL),
	(300, 'Без ранга', 96, 44, '2018-06-08 17:14:54', '2018-06-08 17:14:54', NULL),
	(301, 'Легкие', 100, 45, '2018-06-08 17:15:53', '2018-06-08 17:38:23', NULL),
	(302, 'Магические', 99, 45, '2018-06-08 17:15:53', '2018-06-08 17:38:23', NULL),
	(303, 'Тяжелые', 98, 45, '2018-06-08 17:15:53', '2018-06-08 17:38:23', NULL),
	(304, 'Одноручный маг. меч', 100, 46, '2018-06-08 17:20:22', '2018-06-08 17:20:22', NULL),
	(305, 'Одноручное маг. дробящее', 99, 46, '2018-06-08 17:20:22', '2018-06-08 17:20:22', NULL),
	(306, 'Двуручное маг. дробящее', 98, 46, '2018-06-08 17:20:22', '2018-06-08 17:20:22', NULL),
	(307, 'Кинжал', 97, 46, '2018-06-08 17:20:22', '2018-06-08 17:20:22', NULL),
	(308, 'Парные кинжалы', 96, 46, '2018-06-08 17:20:22', '2018-06-08 17:20:22', NULL),
	(309, 'Лук', 95, 46, '2018-06-08 17:20:22', '2018-06-08 17:20:22', NULL),
	(310, 'Арбалет', 94, 46, '2018-06-08 17:20:22', '2018-06-08 17:20:22', NULL),
	(311, 'Одноручный меч', 93, 46, '2018-06-08 17:20:22', '2018-06-08 17:20:22', NULL),
	(312, 'Парные мечи', 92, 46, '2018-06-08 17:20:22', '2018-06-08 17:20:22', NULL),
	(313, 'Двуручный меч', 91, 46, '2018-06-08 17:20:22', '2018-06-08 17:20:22', NULL),
	(314, 'Двуручное дробящее', 90, 46, '2018-06-08 17:20:22', '2018-06-08 17:20:22', NULL),
	(315, 'Парное дробящее', 89, 46, '2018-06-08 17:20:22', '2018-06-08 17:20:22', NULL),
	(316, 'Одноручное дробящее', 88, 46, '2018-06-08 17:20:22', '2018-06-08 17:20:22', NULL),
	(317, 'Кастеты', 87, 46, '2018-06-08 17:20:22', '2018-06-08 17:20:22', NULL),
	(318, 'Древкое', 86, 46, '2018-06-08 17:20:22', '2018-06-08 17:20:22', NULL),
	(319, 'Другое оружие', 85, 46, '2018-06-08 17:20:22', '2018-06-08 17:20:22', NULL),
	(320, 'Полный комплект (сет)', 100, 47, '2018-06-08 17:28:46', '2018-06-08 17:37:30', NULL),
	(321, 'Части (Перчатки/Ботинки/Шлем/верх/низ)', 99, 47, '2018-06-08 17:28:46', '2018-06-08 17:37:30', NULL),
	(322, 'Верхняя Часть Доспеха', 100, 48, '2018-06-08 17:31:30', '2018-06-08 17:38:07', NULL),
	(323, 'Нижняя часть доспеха', 99, 48, '2018-06-08 17:31:30', '2018-06-08 17:38:07', NULL),
	(324, 'Шлем', 98, 48, '2018-06-08 17:31:30', '2018-06-08 17:38:07', NULL),
	(325, 'Перчатки', 97, 48, '2018-06-08 17:31:30', '2018-06-08 17:38:07', NULL),
	(326, 'Ботинки', 96, 48, '2018-06-08 17:31:30', '2018-06-08 17:38:07', NULL),
	(327, 'Полный Доспех', 95, 48, '2018-06-08 17:31:30', '2018-06-08 17:38:07', NULL),
	(328, 'Щит/Символ', 94, 48, '2018-06-08 17:31:30', '2018-06-08 17:38:07', NULL),
	(329, '+3', 100, 49, '2018-06-08 17:34:24', '2018-06-08 17:38:40', NULL),
	(330, '+4', 99, 49, '2018-06-08 17:34:24', '2018-06-08 17:38:40', NULL),
	(331, '+5', 98, 49, '2018-06-08 17:34:24', '2018-06-08 17:38:40', NULL),
	(332, '+6', 97, 49, '2018-06-08 17:34:24', '2018-06-08 17:38:40', NULL),
	(333, '+7', 96, 49, '2018-06-08 17:34:24', '2018-06-08 17:38:40', NULL),
	(334, '+8', 95, 49, '2018-06-08 17:34:24', '2018-06-08 17:38:40', NULL),
	(335, '+9', 94, 49, '2018-06-08 17:34:24', '2018-06-08 17:38:40', NULL),
	(336, '+10', 93, 49, '2018-06-08 17:34:24', '2018-06-08 17:38:40', NULL),
	(337, '+3-6', NULL, 50, '2018-06-08 17:35:26', '2018-06-08 17:35:26', NULL),
	(338, '+7-10', NULL, 50, '2018-06-08 17:35:26', '2018-06-08 17:35:26', NULL),
	(339, '+11-15', NULL, 50, '2018-06-08 17:35:26', '2018-06-08 17:35:26', NULL),
	(340, '16+', NULL, 50, '2018-06-08 17:35:26', '2018-06-08 17:35:26', NULL),
	(341, 'Кольцо', 100, 51, '2018-06-08 17:41:25', '2018-06-08 17:42:53', NULL),
	(342, 'Серьга', 99, 51, '2018-06-08 17:41:25', '2018-06-08 17:42:53', NULL),
	(343, 'Ожерьлье', 98, 51, '2018-06-08 17:41:25', '2018-06-08 17:42:51', '2018-06-08 17:42:51'),
	(344, 'Ожерелье', 98, 51, '2018-06-08 17:42:47', '2018-06-08 17:42:53', NULL),
	(345, 'Прокачка', 100, 52, '2018-06-11 18:45:46', '2018-06-11 18:46:02', NULL),
	(346, 'Драйвер', 99, 52, '2018-06-11 18:45:46', '2018-06-11 18:46:02', NULL),
	(347, 'Другое', 98, 52, '2018-06-11 18:45:46', '2018-06-11 18:46:02', NULL),
	(348, 'Оружие', 100, 53, '2018-06-11 18:59:52', '2018-06-11 18:59:52', NULL),
	(349, 'Доспехи', 99, 53, '2018-06-11 18:59:52', '2018-06-11 18:59:52', NULL),
	(350, 'Украшения', 98, 53, '2018-06-11 18:59:52', '2018-06-11 18:59:52', NULL),
	(351, 'Мода', 97, 53, '2018-06-11 18:59:52', '2018-06-11 18:59:52', NULL),
	(352, 'Питомцы', 96, 53, '2018-06-11 18:59:52', '2018-06-11 18:59:52', NULL),
	(353, 'Камни', 95, 53, '2018-06-11 18:59:52', '2018-06-11 18:59:52', NULL),
	(354, 'Зелья', 94, 53, '2018-06-11 18:59:52', '2018-06-11 18:59:52', NULL),
	(355, 'Другое', 93, 53, '2018-06-11 18:59:52', '2018-06-11 18:59:52', NULL),
	(356, 'Убийца', NULL, 54, '2018-06-11 19:07:20', '2018-06-11 19:07:20', NULL),
	(357, 'Стрелок', NULL, 54, '2018-06-11 19:07:20', '2018-06-11 19:07:20', NULL),
	(358, 'Гладиатор', NULL, 54, '2018-06-11 19:07:20', '2018-06-11 19:07:20', NULL),
	(359, 'Страж', NULL, 54, '2018-06-11 19:07:20', '2018-06-11 19:07:20', NULL),
	(360, 'Волшебник', NULL, 54, '2018-06-11 19:07:20', '2018-06-11 19:07:20', NULL),
	(361, 'Заклинатель', NULL, 54, '2018-06-11 19:07:20', '2018-06-11 19:07:20', NULL),
	(362, 'Целитель', NULL, 54, '2018-06-11 19:07:20', '2018-06-11 19:07:20', NULL),
	(363, 'Чародей', NULL, 54, '2018-06-11 19:07:20', '2018-06-11 19:07:20', NULL),
	(364, 'Снайпер', NULL, 54, '2018-06-11 19:07:20', '2018-06-11 19:07:20', NULL),
	(365, 'Бард', NULL, 54, '2018-06-11 19:07:20', '2018-06-11 19:07:20', NULL),
	(366, 'Пилот', NULL, 54, '2018-06-11 19:07:20', '2018-06-11 19:07:20', NULL),
	(367, 'Оружие', 100, 55, '2018-06-11 19:08:44', '2018-06-11 19:08:44', NULL),
	(368, 'Доспехи', 99, 55, '2018-06-11 19:08:44', '2018-06-11 19:08:44', NULL),
	(369, 'Украшения', 98, 55, '2018-06-11 19:08:44', '2018-06-11 19:08:44', NULL),
	(370, 'Другое', 97, 55, '2018-06-11 19:08:44', '2018-06-11 19:08:44', NULL),
	(371, 'Прокачка', 100, 56, '2018-06-25 21:18:18', '2018-06-25 21:18:18', NULL),
	(372, 'Драйвер', 99, 56, '2018-06-25 21:18:18', '2018-06-25 21:18:18', NULL),
	(373, 'Другое', 98, 56, '2018-06-25 21:18:18', '2018-06-25 21:18:18', NULL),
	(374, 'Оружие', 100, 57, '2018-06-25 21:22:07', '2018-06-25 21:22:07', NULL),
	(375, 'Доспехи', 99, 57, '2018-06-25 21:22:07', '2018-06-25 21:22:07', NULL),
	(376, 'Бижутерия', 98, 57, '2018-06-25 21:22:07', '2018-06-25 21:22:07', NULL),
	(377, 'Камни Лавианроз', 97, 57, '2018-06-25 21:22:07', '2018-06-25 21:22:07', NULL),
	(378, 'Другое', 96, 57, '2018-06-25 21:22:07', '2018-06-25 21:22:07', NULL),
	(379, 'Полный комплект (сет)', 100, 58, '2018-06-25 21:25:26', '2018-07-21 20:46:43', NULL),
	(380, 'Части (Перчатки/Ботинки/Шлем/Верх/Низ)', 99, 58, '2018-06-25 21:25:26', '2018-07-21 20:46:43', NULL),
	(381, 'Обычный', 100, 59, '2018-06-25 21:27:17', '2018-07-21 21:04:43', NULL),
	(382, 'Благословенный', 99, 59, '2018-06-25 21:27:17', '2018-07-21 21:04:43', NULL),
	(383, 'ПВЕ', 98, 59, '2018-06-25 21:27:17', '2018-07-21 21:04:43', NULL),
	(384, 'ПВП', 97, 59, '2018-06-25 21:27:17', '2018-07-21 21:04:43', NULL),
	(385, 'Совершенный/Безупречный', 96, 59, '2018-06-25 21:27:17', '2018-07-21 21:04:43', NULL),
	(386, 'Обычное', 100, 60, '2018-06-25 21:29:02', '2018-06-25 21:29:02', NULL),
	(387, 'Благословенное', 99, 60, '2018-06-25 21:29:02', '2018-06-25 21:29:02', NULL),
	(388, 'ПВЕ', 98, 60, '2018-06-25 21:29:02', '2018-06-25 21:29:02', NULL),
	(389, 'ПВП', 97, 60, '2018-06-25 21:29:02', '2018-06-25 21:29:02', NULL),
	(390, 'Жрец Евы Альгиза', 100, 61, '2018-06-25 21:35:35', '2018-06-25 21:35:35', NULL),
	(391, 'Жрец Шилен Альгиза', 99, 61, '2018-06-25 21:35:35', '2018-06-25 21:35:35', NULL),
	(392, 'Кардинал Альгиза', 98, 61, '2018-06-25 21:35:35', '2018-06-25 21:35:35', NULL),
	(393, 'Глас Судьбы Иса', 97, 61, '2018-06-25 21:35:35', '2018-06-25 21:35:35', NULL),
	(394, 'Деспот Иса', 96, 61, '2018-06-25 21:35:35', '2018-06-25 21:35:35', NULL),
	(395, 'Виртуоз Иса', 95, 61, '2018-06-25 21:35:35', '2018-06-25 21:35:35', NULL),
	(396, 'Призрачный Танцор Иса', 94, 61, '2018-06-25 21:35:35', '2018-06-25 21:35:35', NULL),
	(397, 'Апостол Иса', 93, 61, '2018-06-25 21:35:35', '2018-06-25 21:35:35', NULL),
	(398, 'Инквизитор Фео', 92, 61, '2018-06-25 21:35:35', '2018-06-25 21:35:35', NULL),
	(399, 'Пожиратель Душ Фео', 91, 61, '2018-06-25 21:35:35', '2018-06-25 21:35:35', NULL),
	(400, 'Архимаг Фео', 90, 61, '2018-06-25 21:35:35', '2018-06-25 21:35:35', NULL),
	(401, 'Магистр Магии Фео', 89, 61, '2018-06-25 21:35:35', '2018-06-25 21:35:35', NULL),
	(402, 'Повелитель Бури Фео', 88, 61, '2018-06-25 21:35:35', '2018-06-25 21:35:35', NULL),
	(403, 'Снайпер Эура', 87, 61, '2018-06-25 21:35:35', '2018-06-25 21:35:35', NULL),
	(404, 'Страж Лунного Света Эура', 86, 61, '2018-06-25 21:35:35', '2018-06-25 21:35:35', NULL),
	(405, 'Страж Теней Эура', 85, 61, '2018-06-25 21:35:35', '2018-06-25 21:35:35', NULL),
	(406, 'Диверсант Эура', 84, 61, '2018-06-25 21:35:35', '2018-06-25 21:35:35', NULL),
	(407, 'Призрачный Охотник Одала', 83, 61, '2018-06-25 21:35:35', '2018-06-25 21:35:35', NULL),
	(408, 'Странник Ветра Одала', 82, 61, '2018-06-25 21:35:35', '2018-06-25 21:35:35', NULL),
	(409, 'Авантюрист Одала', 81, 61, '2018-06-25 21:35:35', '2018-06-25 21:35:35', NULL),
	(410, 'Кладоискатель Одала', 80, 61, '2018-06-25 21:35:35', '2018-06-25 21:35:35', NULL),
	(411, 'Полководец Тира', 79, 61, '2018-06-25 21:35:35', '2018-06-25 21:35:35', NULL),
	(412, 'Дуэлист Тира', 78, 61, '2018-06-25 21:35:35', '2018-06-25 21:35:35', NULL),
	(413, 'Аватар Тира', 77, 61, '2018-06-25 21:35:35', '2018-06-25 21:35:35', NULL),
	(414, 'Каратель Тира', 76, 61, '2018-06-25 21:35:35', '2018-06-25 21:35:35', NULL),
	(415, 'Титан Тира', 75, 61, '2018-06-25 21:35:35', '2018-06-25 21:35:35', NULL),
	(416, 'Мастер Тира', 74, 61, '2018-06-25 21:35:35', '2018-06-25 21:35:35', NULL),
	(417, 'Чернокнижник Веньо', 73, 61, '2018-06-25 21:35:35', '2018-06-25 21:35:35', NULL),
	(418, 'Владыка Теней Веньо', 72, 61, '2018-06-25 21:35:35', '2018-06-25 21:35:35', NULL),
	(419, 'Мастер Стихий Веньо', 71, 61, '2018-06-25 21:35:35', '2018-06-25 21:35:35', NULL),
	(420, 'Рыцарь Феникса Сигеля', 70, 61, '2018-06-25 21:35:35', '2018-06-25 21:35:35', NULL),
	(421, 'Храмовник Евы Сигеля', 69, 61, '2018-06-25 21:35:35', '2018-06-25 21:35:35', NULL),
	(422, 'Храмовник Шилен Сигеля', 68, 61, '2018-06-25 21:35:35', '2018-06-25 21:35:35', NULL),
	(423, 'Рыцарь Ада Сигеля', 67, 61, '2018-06-25 21:35:35', '2018-06-25 21:35:35', NULL),
	(424, 'Заступник Сайхи', 66, 61, '2018-06-25 21:35:35', '2018-06-25 21:35:35', NULL),
	(425, 'Громовержец Сайхи', 65, 61, '2018-06-25 21:35:35', '2018-06-25 21:35:35', NULL),
	(426, 'Кольцо', 100, 62, '2018-06-25 21:37:46', '2018-06-25 21:37:46', NULL),
	(427, 'Серьга', 99, 62, '2018-06-25 21:37:46', '2018-06-25 21:37:46', NULL),
	(428, 'Ожерелье', 98, 62, '2018-06-25 21:37:46', '2018-06-25 21:37:46', NULL),
	(429, 'Брошка', 97, 62, '2018-06-25 21:37:46', '2018-06-25 21:37:46', NULL),
	(430, 'Легкие', 100, 63, '2018-06-25 21:39:09', '2018-07-21 21:02:26', NULL),
	(431, 'Магические', 99, 63, '2018-06-25 21:39:09', '2018-07-21 21:02:26', NULL),
	(432, 'Тяжелые', 98, 63, '2018-06-25 21:39:09', '2018-07-21 21:02:26', NULL),
	(433, 'Аметист', 100, 64, '2018-06-25 21:42:25', '2018-06-25 21:42:25', NULL),
	(434, 'Красный Кошачий Глаз', 99, 64, '2018-06-25 21:42:25', '2018-06-25 21:42:25', NULL),
	(435, 'Синий Кошачий Глаз', 98, 64, '2018-06-25 21:42:25', '2018-06-25 21:42:25', NULL),
	(436, 'Рубин', 97, 64, '2018-06-25 21:42:25', '2018-06-25 21:42:25', NULL),
	(437, 'Сапфир', 96, 64, '2018-06-25 21:42:25', '2018-06-25 21:42:25', NULL),
	(438, 'Бриллиант', 95, 64, '2018-06-25 21:42:25', '2018-06-25 21:42:25', NULL),
	(439, 'Опал', 94, 64, '2018-06-25 21:42:25', '2018-06-25 21:42:25', NULL),
	(440, 'Жемчуг', 93, 64, '2018-06-25 21:42:25', '2018-06-25 21:42:25', NULL),
	(441, 'Обсидиан', 92, 64, '2018-06-25 21:42:25', '2018-06-25 21:42:25', NULL),
	(442, 'Изумруд', 91, 64, '2018-06-25 21:42:25', '2018-06-25 21:42:25', NULL),
	(443, 'Гранат', 90, 64, '2018-06-25 21:42:25', '2018-06-25 21:42:25', NULL),
	(444, 'Танзанит', 89, 64, '2018-06-25 21:42:25', '2018-06-25 21:42:25', NULL),
	(445, 'Кошачий Глаз', 88, 64, '2018-06-25 21:42:25', '2018-06-25 21:42:25', NULL),
	(446, 'Энергии', 87, 64, '2018-06-25 21:42:25', '2018-06-25 21:42:25', NULL),
	(447, 'Аквамарин', 86, 64, '2018-06-25 21:42:25', '2018-06-25 21:42:25', NULL),
	(448, 'Порошок', 85, 64, '2018-06-25 21:42:25', '2018-06-25 21:42:25', NULL),
	(449, 'Одноручный маг. меч', 100, 65, '2018-06-25 21:45:32', '2018-06-25 21:45:32', NULL),
	(450, 'Одноручное маг. дробящее', 99, 65, '2018-06-25 21:45:32', '2018-06-25 21:45:32', NULL),
	(451, 'Двуручное маг. дробящее', 98, 65, '2018-06-25 21:45:32', '2018-06-25 21:45:32', NULL),
	(452, 'Кинжал', 97, 65, '2018-06-25 21:45:32', '2018-06-25 21:45:32', NULL),
	(453, 'Парные кинжалы', 96, 65, '2018-06-25 21:45:32', '2018-06-25 21:45:32', NULL),
	(454, 'Лук', 95, 65, '2018-06-25 21:45:32', '2018-06-25 21:45:32', NULL),
	(455, 'Арбалет', 94, 65, '2018-06-25 21:45:32', '2018-06-25 21:45:32', NULL),
	(456, 'Кастеты', 93, 65, '2018-06-25 21:45:32', '2018-06-25 21:45:32', NULL),
	(457, 'Одноручное дробящее', 92, 65, '2018-06-25 21:45:32', '2018-06-25 21:45:32', NULL),
	(458, 'Парное дробящее', 91, 65, '2018-06-25 21:45:32', '2018-06-25 21:45:32', NULL),
	(459, 'Одноручный Меч', 90, 65, '2018-06-25 21:45:32', '2018-06-25 21:45:32', NULL),
	(460, 'Парные мечи', 89, 65, '2018-06-25 21:45:32', '2018-06-25 21:45:32', NULL),
	(461, 'Двуручный меч', 88, 65, '2018-06-25 21:45:32', '2018-06-25 21:45:32', NULL),
	(462, 'Двуручное дробящее', 87, 65, '2018-06-25 21:45:32', '2018-06-25 21:45:32', NULL),
	(463, 'Рапира', 86, 65, '2018-06-25 21:45:32', '2018-06-25 21:45:32', NULL),
	(464, 'Древний меч', 85, 65, '2018-06-25 21:45:32', '2018-06-25 21:45:32', NULL),
	(465, 'Другое оружие', 84, 65, '2018-06-25 21:45:32', '2018-06-25 21:45:32', NULL),
	(466, '+1-5', 100, 66, '2018-06-25 21:47:39', '2018-07-21 21:01:56', NULL),
	(467, '+6', 99, 66, '2018-06-25 21:47:39', '2018-07-21 21:01:56', NULL),
	(468, '+7', 98, 66, '2018-06-25 21:47:39', '2018-07-21 21:01:56', NULL),
	(469, '+8', 97, 66, '2018-06-25 21:47:39', '2018-07-21 21:01:56', NULL),
	(470, '+9', 96, 66, '2018-06-25 21:47:39', '2018-07-21 21:01:56', NULL),
	(471, '+10', 95, 66, '2018-06-25 21:47:39', '2018-07-21 21:01:56', NULL),
	(472, '+11', 94, 66, '2018-06-25 21:47:39', '2018-07-21 21:01:56', NULL),
	(473, '+12', 93, 66, '2018-06-25 21:47:39', '2018-07-21 21:01:56', NULL),
	(474, '+13', 92, 66, '2018-06-25 21:47:39', '2018-07-21 21:01:56', NULL),
	(475, '+14', 91, 66, '2018-06-25 21:47:39', '2018-07-21 21:01:56', NULL),
	(476, '+15', 90, 66, '2018-06-25 21:47:39', '2018-07-21 21:01:56', NULL),
	(477, '+16', 89, 66, '2018-06-25 21:47:39', '2018-07-21 21:01:56', NULL),
	(478, '+1-5', 100, 67, '2018-06-25 21:50:32', '2018-06-25 21:50:32', NULL),
	(479, '+6', 99, 67, '2018-06-25 21:50:32', '2018-06-25 21:50:32', NULL),
	(480, '+7', 98, 67, '2018-06-25 21:50:32', '2018-06-25 21:50:32', NULL),
	(481, '+8', 97, 67, '2018-06-25 21:50:32', '2018-06-25 21:50:32', NULL),
	(482, '+9', 96, 67, '2018-06-25 21:50:32', '2018-06-25 21:50:32', NULL),
	(483, '+10', 95, 67, '2018-06-25 21:50:32', '2018-06-25 21:50:32', NULL),
	(484, '+11', 94, 67, '2018-06-25 21:50:32', '2018-06-25 21:50:32', NULL),
	(485, '+12', 93, 67, '2018-06-25 21:50:32', '2018-06-25 21:50:32', NULL),
	(486, '+13', 92, 67, '2018-06-25 21:50:32', '2018-06-25 21:50:32', NULL),
	(487, '+14', 91, 67, '2018-06-25 21:50:32', '2018-06-25 21:50:32', NULL),
	(488, '+15', 90, 67, '2018-06-25 21:50:32', '2018-06-25 21:50:32', NULL),
	(489, '+16', 89, 67, '2018-06-25 21:50:32', '2018-06-25 21:50:32', NULL),
	(490, '85+', 100, 68, '2018-06-25 21:52:27', '2018-06-25 21:52:27', NULL),
	(491, '90+', 99, 68, '2018-06-25 21:52:27', '2018-06-25 21:52:27', NULL),
	(492, '95+', 98, 68, '2018-06-25 21:52:27', '2018-06-25 21:52:27', NULL),
	(493, '99+', 97, 68, '2018-06-25 21:52:27', '2018-06-25 21:52:27', NULL),
	(494, '100+', 96, 68, '2018-06-25 21:52:27', '2018-06-25 21:52:27', NULL),
	(495, '101+', 95, 68, '2018-06-25 21:52:27', '2018-06-25 21:52:27', NULL),
	(496, '102+', 94, 68, '2018-06-25 21:52:27', '2018-06-25 21:52:27', NULL),
	(497, '103+', 93, 68, '2018-06-25 21:52:27', '2018-06-25 21:52:27', NULL),
	(498, '104+', 92, 68, '2018-06-25 21:52:27', '2018-06-25 21:52:27', NULL),
	(499, '105+', 91, 68, '2018-06-25 21:52:27', '2018-06-25 21:52:27', NULL),
	(500, '1-го уровня', 100, 69, '2018-06-25 21:53:46', '2018-06-25 21:53:46', NULL),
	(501, '2-го уровня', 99, 69, '2018-06-25 21:53:46', '2018-06-25 21:53:46', NULL),
	(502, '3-го уровня', 98, 69, '2018-06-25 21:53:46', '2018-06-25 21:53:46', NULL),
	(503, '4-го уровня', 97, 69, '2018-06-25 21:53:46', '2018-06-25 21:53:46', NULL),
	(504, '5-го уровня', 96, 69, '2018-06-25 21:53:46', '2018-06-25 21:53:46', NULL),
	(505, '6-го уровня', 95, 69, '2018-06-25 21:53:46', '2018-06-25 21:53:46', NULL),
	(506, 'Верхняя часть доспеха', 100, 70, '2018-06-25 21:55:52', '2018-07-21 21:03:45', NULL),
	(507, 'Нижняя часть доспеха', 99, 70, '2018-06-25 21:55:52', '2018-07-21 21:03:45', NULL),
	(508, 'Шлем', 98, 70, '2018-06-25 21:55:52', '2018-07-21 21:03:45', NULL),
	(509, 'Перчатки', 97, 70, '2018-06-25 21:55:52', '2018-07-21 21:03:45', NULL),
	(510, 'Ботинки', 96, 70, '2018-06-25 21:55:52', '2018-07-21 21:03:45', NULL),
	(511, 'Полный Доспех', 95, 70, '2018-06-25 21:55:52', '2018-07-21 21:03:45', NULL),
	(512, 'Щит/символ', 94, 70, '2018-06-25 21:55:52', '2018-07-21 21:03:45', NULL),
	(513, 'Легкие', NULL, 71, '2018-07-21 20:49:03', '2018-07-21 20:59:58', '2018-07-21 20:59:58'),
	(514, 'Магические', NULL, 71, '2018-07-21 20:49:03', '2018-07-21 20:59:58', '2018-07-21 20:59:58'),
	(515, 'Тяжелые', NULL, 71, '2018-07-21 20:49:03', '2018-07-21 20:59:58', '2018-07-21 20:59:58'),
	(516, 'Верхняя Часть доспеха', 100, 72, '2018-07-21 20:54:52', '2018-07-21 21:00:22', '2018-07-21 21:00:22'),
	(517, 'Нижняя часть доспеха', 99, 72, '2018-07-21 20:54:52', '2018-07-21 21:00:22', '2018-07-21 21:00:22'),
	(518, 'Шлем', 98, 72, '2018-07-21 20:54:52', '2018-07-21 21:00:22', '2018-07-21 21:00:22'),
	(519, 'Перчатки', 97, 72, '2018-07-21 20:54:52', '2018-07-21 21:00:22', '2018-07-21 21:00:22'),
	(520, 'Без ранга', 96, 72, '2018-07-21 20:54:52', '2018-07-21 21:00:22', '2018-07-21 21:00:22'),
	(521, 'Полный Доспех', 95, 72, '2018-07-21 20:54:52', '2018-07-21 21:00:22', '2018-07-21 21:00:22'),
	(522, 'Щит/Символ', 94, 72, '2018-07-21 20:54:52', '2018-07-21 21:00:22', '2018-07-21 21:00:22'),
	(523, 'Уголь', 1, 73, '2018-07-22 00:24:53', '2018-07-22 01:46:53', '2018-07-22 01:46:53'),
	(524, 'Железо', 2, 73, '2018-07-22 00:26:56', '2018-07-22 01:46:53', '2018-07-22 01:46:53'),
	(525, 'Железо', 100, 74, '2018-07-22 01:47:34', '2018-07-22 01:47:34', NULL),
	(526, 'Уголь', 99, 74, '2018-07-22 01:47:34', '2018-07-22 01:47:34', NULL),
	(527, '1 ур.', NULL, 75, '2018-07-22 01:51:16', '2018-07-22 01:51:16', NULL),
	(528, '2 ур.', NULL, 75, '2018-07-22 01:51:16', '2018-07-22 01:51:16', NULL),
	(529, '3 ур.', NULL, 75, '2018-07-22 01:51:16', '2018-07-22 01:51:16', NULL);
/*!40000 ALTER TABLE `sub_tag_metadatas` ENABLE KEYS */;

-- Дамп структуры для таблица big2.sub_tag_sub_tag_metadata
CREATE TABLE IF NOT EXISTS `sub_tag_sub_tag_metadata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sub_tag_id` int(11) NOT NULL,
  `sub_tag_metadata_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы big2.sub_tag_sub_tag_metadata: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `sub_tag_sub_tag_metadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `sub_tag_sub_tag_metadata` ENABLE KEYS */;

-- Дамп структуры для таблица big2.sub_tag_tag
CREATE TABLE IF NOT EXISTS `sub_tag_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) NOT NULL,
  `sub_tag_id` int(11) NOT NULL,
  `game_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы big2.sub_tag_tag: ~47 rows (приблизительно)
/*!40000 ALTER TABLE `sub_tag_tag` DISABLE KEYS */;
INSERT INTO `sub_tag_tag` (`id`, `tag_id`, `sub_tag_id`, `game_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(13, 2, 17, 1, '2018-05-31 17:52:45', '2018-06-06 19:33:18', NULL),
	(14, 2, 18, 1, '2018-05-31 17:59:31', '2018-06-08 17:24:08', NULL),
	(19, 2, 23, 1, '2018-05-31 19:10:31', '2018-06-08 16:20:13', NULL),
	(21, 2, 25, 1, '2018-05-31 19:28:03', '2018-06-08 16:22:24', NULL),
	(23, 2, 27, 1, '2018-05-31 19:37:31', '2018-06-08 17:24:28', NULL),
	(25, 2, 29, 1, '2018-05-31 22:22:23', '2018-06-08 16:26:36', NULL),
	(26, 2, 30, 1, '2018-05-31 22:24:35', '2018-06-08 17:22:25', NULL),
	(28, 2, 32, 1, '2018-05-31 22:43:56', '2018-06-08 16:20:41', NULL),
	(29, 2, 33, 13, '2018-05-31 22:58:07', '2018-06-08 16:19:53', NULL),
	(30, 2, 34, 1, '2018-06-04 21:52:36', '2018-06-08 16:29:07', NULL),
	(31, 2, 35, 1, '2018-06-04 21:57:18', '2018-06-08 16:34:52', NULL),
	(32, 2, 36, 1, '2018-06-04 22:04:11', '2018-06-08 16:21:27', NULL),
	(33, 2, 37, 1, '2018-06-04 22:08:37', '2018-06-08 16:31:40', NULL),
	(34, 2, 38, 13, '2018-06-05 18:55:59', '2018-06-05 18:58:33', NULL),
	(35, 2, 39, 13, '2018-06-05 19:02:40', '2018-06-08 16:29:38', NULL),
	(36, 1, 40, 1, '2018-06-08 16:53:13', '2018-06-08 16:58:37', NULL),
	(37, 1, 41, 1, '2018-06-08 17:00:56', '2018-06-08 17:00:56', NULL),
	(39, 2, 43, 13, '2018-06-08 17:13:39', '2018-06-08 17:13:39', NULL),
	(40, 2, 44, 13, '2018-06-08 17:14:54', '2018-06-08 17:14:54', NULL),
	(41, 2, 45, 13, '2018-06-08 17:15:53', '2018-06-08 17:38:23', NULL),
	(42, 2, 46, 13, '2018-06-08 17:20:22', '2018-06-08 17:20:22', NULL),
	(43, 2, 47, 13, '2018-06-08 17:28:46', '2018-06-08 17:37:30', NULL),
	(44, 2, 48, 13, '2018-06-08 17:31:30', '2018-06-08 17:38:07', NULL),
	(45, 2, 49, 13, '2018-06-08 17:34:24', '2018-06-08 17:38:40', NULL),
	(46, 2, 50, 13, '2018-06-08 17:35:26', '2018-06-08 17:35:26', NULL),
	(47, 2, 51, 13, '2018-06-08 17:41:25', '2018-06-08 17:42:53', NULL),
	(48, 3, 52, 1, '2018-06-11 18:45:24', '2018-06-11 18:46:02', NULL),
	(49, 2, 53, 24, '2018-06-11 18:59:52', '2018-06-11 18:59:52', NULL),
	(50, 1, 54, 23, '2018-06-11 19:07:20', '2018-06-11 19:07:20', NULL),
	(51, 2, 55, 23, '2018-06-11 19:08:44', '2018-06-11 19:08:44', NULL),
	(52, 3, 56, 26, '2018-06-25 21:18:18', '2018-06-25 21:18:18', NULL),
	(53, 2, 57, 26, '2018-06-25 21:22:07', '2018-06-25 21:22:07', NULL),
	(54, 2, 58, 26, '2018-06-25 21:25:26', '2018-07-21 20:46:43', NULL),
	(55, 2, 59, 26, '2018-06-25 21:27:17', '2018-07-21 21:04:43', NULL),
	(56, 2, 60, 26, '2018-06-25 21:29:02', '2018-06-25 21:29:02', NULL),
	(57, 1, 61, 26, '2018-06-25 21:35:35', '2018-06-25 21:35:35', NULL),
	(58, 2, 62, 26, '2018-06-25 21:37:46', '2018-06-25 21:37:46', NULL),
	(59, 2, 63, 26, '2018-06-25 21:39:09', '2018-07-21 21:02:26', NULL),
	(60, 2, 64, 26, '2018-06-25 21:42:25', '2018-06-25 21:42:25', NULL),
	(61, 2, 65, 26, '2018-06-25 21:45:32', '2018-06-25 21:45:32', NULL),
	(62, 2, 66, 26, '2018-06-25 21:47:39', '2018-07-21 21:01:56', NULL),
	(63, 2, 67, 26, '2018-06-25 21:50:32', '2018-06-25 21:50:32', NULL),
	(64, 1, 68, 26, '2018-06-25 21:52:27', '2018-06-25 21:52:27', NULL),
	(65, 2, 69, 26, '2018-06-25 21:53:46', '2018-06-25 21:53:46', NULL),
	(66, 2, 70, 26, '2018-06-25 21:55:52', '2018-07-21 21:03:45', NULL),
	(70, 2, 74, 28, '2018-07-22 01:47:34', '2018-07-22 01:47:34', NULL),
	(71, 2, 75, 28, '2018-07-22 01:51:16', '2018-07-22 01:51:16', NULL);
/*!40000 ALTER TABLE `sub_tag_tag` ENABLE KEYS */;

-- Дамп структуры для таблица big2.tags
CREATE TABLE IF NOT EXISTS `tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price_per_unit` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tags_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы big2.tags: ~8 rows (приблизительно)
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` (`id`, `name`, `price_per_unit`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Аккаунты', 0, '2017-09-20 09:06:18', '2017-09-20 09:06:18', NULL),
	(2, 'Предметы', 1, '2017-09-20 09:06:29', '2017-09-25 06:55:17', NULL),
	(3, 'Услуги', 0, '2017-09-20 09:06:39', '2017-09-20 09:06:39', NULL),
	(4, 'Кинары', 0, '2017-09-20 09:06:47', '2017-09-21 06:40:23', '2017-09-21 06:40:23'),
	(5, 'RU', 0, '2017-09-20 11:48:58', '2017-09-20 11:50:00', '2017-09-20 11:50:00'),
	(6, 'Новый тег', 0, '2018-07-09 19:47:28', '2018-07-10 15:16:58', '2018-07-10 15:16:58'),
	(7, 'Кристаллы', 0, '2018-07-09 19:49:25', '2018-07-09 19:49:25', NULL),
	(8, 'Серебро', 0, '2018-07-09 22:50:40', '2018-07-09 22:50:40', NULL);
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;

-- Дамп структуры для таблица big2.trades
CREATE TABLE IF NOT EXISTS `trades` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `owner_id` int(10) unsigned DEFAULT NULL,
  `buyer_id` int(10) unsigned DEFAULT NULL,
  `lot_id` int(10) unsigned DEFAULT NULL,
  `payment_id` int(11) NOT NULL,
  `character_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount_clear` double(20,3) DEFAULT NULL,
  `price` double(20,3) NOT NULL,
  `get_availability` double(20,3) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `refuse_moderator_id` int(10) unsigned DEFAULT NULL,
  `refuse_date` datetime DEFAULT NULL,
  `is_payed` int(11) NOT NULL DEFAULT '0',
  `closed_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trades_refuse_moderator_id_foreign` (`refuse_moderator_id`),
  KEY `trades_owner_id_foreign` (`owner_id`),
  KEY `trades_buyer_id_foreign` (`buyer_id`),
  KEY `trades_lot_id_foreign` (`lot_id`),
  CONSTRAINT `trades_buyer_id_foreign` FOREIGN KEY (`buyer_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `trades_lot_id_foreign` FOREIGN KEY (`lot_id`) REFERENCES `lots` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `trades_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `trades_refuse_moderator_id_foreign` FOREIGN KEY (`refuse_moderator_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1085 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы big2.trades: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `trades` DISABLE KEYS */;
/*!40000 ALTER TABLE `trades` ENABLE KEYS */;

-- Дамп структуры для таблица big2.translations
CREATE TABLE IF NOT EXISTS `translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы big2.translations: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;

-- Дамп структуры для таблица big2.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы big2.users: ~7 rows (приблизительно)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `firstname`, `lastname`, `username`, `provider`, `provider_id`, `is_block`, `is_block_payment`, `create_lot`, `buy_lot`, `get_money`, `online`, `password`, `remember_token`, `created_at`, `updated_at`, `ip`, `phone`, `rating`, `balance`, `status`, `confirmed`, `confirmed_rules`, `confirmation_code`, `deleted_at`) VALUES
	(1, 1, 'Bigdrop', 'bigdrop@gmail.com', 'users/default.png', '0', '0', '0', '0', '0', NULL, NULL, 0, 0, 0, 0, '3d4f2bf07dc1be38b20cd6e46949a1071f9d0e3d', '8JToBkABZc9ARsJK83ZxfqrSierEHlGeoGRkxWXidUX3bnClnqAhjBvNWryM', '2018-04-24 17:32:56', '2018-06-15 21:09:23', '1', '0', '0', 1979.998, '0', 1, 1, '0', NULL),
	(2, 1, 'SomeSay', 'badolf2015@gmail.com', 'https://lh5.googleusercontent.com/-AtwACJmBg1s/AAAAAAAAAAI/AAAAAAAAAJY/phU-5Xvc3Hs/photo.jpg?sz=50', '0', '0', '0', 'google', '109195121458633655171', NULL, NULL, 0, 0, 0, 0, '7c4a8d09ca3762af61e59520943dc26494f8941b', 'We9vYvpKX5N0TDTYLtNIjbdjKyE2XeWKAFZYQshIVmy4c7hxxTOHXNTrSthg', '2018-04-24 17:38:07', '2018-07-25 01:56:03', '185.17.127.234', '380968182526', '0', 1848.360, '0', 1, 1, NULL, NULL),
	(3, 1, 'Testo', 'orobey_ruslan90@mail.ru', '/default-avatar.svg', NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, 'fd15969c200ab5829baded6a28487ffe89e3a4d9', '9V2ABrRjkCzjvsV4vxARJhXqUDJULOiaIIIC0iTBIxqL0mDO2fUtDFVhbGIl', '2018-04-24 17:39:59', '2018-07-23 21:49:06', '46.162.13.54', '380672777859', '17', 4324.180, '0', 1, 1, NULL, NULL),
	(4, 1, 'Andriy Pilko', 'pilkoandriy94@gmail.com1', '/users_avatars/1532359547-IMG_274668.jpg', '0', '0', '0', '0', '0', 0, 0, 0, 0, 0, 0, '601f1889667efaebb33b8c12572835da3f027f78', 'Y6EnaP9k17cipwZRpM8bntZW2GYGDET1HIRajiBxr82OHOiyd0IMjwyTz7zH', '2018-04-24 17:43:11', '2018-07-24 13:44:45', '176.125.45.36', '+380631996721', '0', 1724.476, '0', 1, 1, '0', NULL),
	(5, 1, 'Ihor Proshchuk', 'ihorproshchuk@gmail.com', 'https://lh6.googleusercontent.com/-m6l93_rG-fY/AAAAAAAAAAI/AAAAAAAAAMA/4SLgl6wdycA/photo.jpg?sz=50', NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, '601f1889667efaebb33b8c12572835da3f027f78', 'iL0yb5lFEo70uTtIVyrITUBxGpHFYZ51AxsKD12nzmF93Rp8xNHL3EXdMJLN', '2018-04-26 16:50:15', '2018-05-15 19:01:49', '1', '0', '0', 0.000, '0', 1, 0, NULL, NULL),
	(6, 1, 'Максим', 'maks.lineageii@gmail.com', 'https://lh6.googleusercontent.com/-IehRgDIgJzI/AAAAAAAAAAI/AAAAAAAAABM/dCoKy_5nUok/photo.jpg?sz=50', NULL, NULL, NULL, 'google', '103213878212165314561', NULL, NULL, NULL, NULL, NULL, NULL, '847cacb35079dda38676bd1565dcb262e31ca660', 'jLLKVBnwP33Aef5KQ7hFq1Q0YyfRolrXqLLrgrBo36YHxojZ6OBnOCmBP8xc', '2018-04-26 17:27:38', '2018-07-08 15:54:24', '1', '0', '2', 635.056, '0', 1, 1, NULL, NULL),
	(82, 1, 'Seth', 'zagalloxa@yandex.ru', '/default-avatar.svg', '0', '0', '0', '0', '0', NULL, NULL, 0, 0, 0, 0, 'bf1e3df36e625d38732dcca96013811c6680217d', 'GD43QX4Yz7e30rslU6fF92ktlOQ8XW1wtp7FHUNeWGjiO2fc1mrfsHsW5zkJ', '2018-06-25 20:40:03', '2018-07-23 21:07:04', '94.25.233.147', NULL, '0', 89.000, '0', 1, 0, '0', NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Дамп структуры для таблица big2.user_wallets
CREATE TABLE IF NOT EXISTS `user_wallets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `currency_id` int(10) unsigned DEFAULT NULL,
  `wallet_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_wallets_user_id_foreign` (`user_id`),
  KEY `user_wallets_currency_id_foreign` (`currency_id`),
  CONSTRAINT `user_wallets_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `price_commissions` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `user_wallets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы big2.user_wallets: ~16 rows (приблизительно)
/*!40000 ALTER TABLE `user_wallets` DISABLE KEYS */;
INSERT INTO `user_wallets` (`id`, `user_id`, `currency_id`, `wallet_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(32, 1, 6, 'R305371395884', '2018-05-12 18:03:57', '2018-05-12 18:03:57', NULL),
	(33, 1, 3, '123123123123', '2018-05-12 18:03:57', '2018-05-12 18:03:57', NULL),
	(67, 2, 6, 'R428330913902', '2018-06-20 20:16:11', '2018-06-20 20:16:11', NULL),
	(68, 2, 3, '410011580546087', '2018-06-20 20:16:11', '2018-06-20 20:16:11', NULL),
	(69, 2, 4, '+380968182526', '2018-06-20 20:16:11', '2018-06-20 20:16:11', NULL),
	(87, 3, 3, '41001672889783', '2018-07-05 22:41:11', '2018-07-05 22:41:11', NULL),
	(88, 3, 4, '+79522917240', '2018-07-05 22:41:11', '2018-07-05 22:41:11', NULL),
	(97, 82, 3, '41001529754338', '2018-07-23 20:30:27', '2018-07-23 20:30:27', NULL),
	(98, 4, 6, 'R123123212', '2018-07-24 13:25:53', '2018-07-24 13:25:53', NULL),
	(99, 4, 3, '41001672889783', '2018-07-24 13:25:53', '2018-07-24 13:25:53', NULL),
	(100, 4, 6, 'U340484593611', '2018-07-24 13:25:53', '2018-07-24 13:25:53', NULL),
	(101, 4, 6, 'R820253507708', '2018-07-24 13:25:53', '2018-07-24 13:25:53', NULL),
	(102, 4, 6, 'R305371395884', '2018-07-24 13:25:53', '2018-07-24 13:25:53', NULL),
	(103, 4, 4, '+380631996701', '2018-07-24 13:25:53', '2018-07-24 13:25:53', NULL),
	(104, 4, 6, 'R428330913902', '2018-07-24 13:25:53', '2018-07-24 13:25:53', NULL),
	(105, 4, 6, 'E991901919453', '2018-07-24 13:25:53', '2018-07-24 13:25:53', NULL);
/*!40000 ALTER TABLE `user_wallets` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
