-- Adminer 4.8.1 MySQL 10.8.4-MariaDB dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `data_rows`;
CREATE TABLE `data_rows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) unsigned NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1,	1,	'id',	'number',	'ID',	1,	0,	0,	0,	0,	0,	NULL,	1),
(2,	1,	'name',	'text',	'Name',	1,	1,	1,	1,	1,	1,	NULL,	2),
(3,	1,	'email',	'text',	'Email',	1,	1,	1,	1,	1,	1,	NULL,	3),
(4,	1,	'password',	'password',	'Password',	1,	0,	0,	1,	1,	0,	NULL,	4),
(5,	1,	'remember_token',	'text',	'Remember Token',	0,	0,	0,	0,	0,	0,	NULL,	5),
(6,	1,	'created_at',	'timestamp',	'Created At',	0,	1,	1,	0,	0,	0,	NULL,	6),
(7,	1,	'updated_at',	'timestamp',	'Updated At',	0,	0,	0,	0,	0,	0,	NULL,	7),
(8,	1,	'avatar',	'image',	'Avatar',	0,	1,	1,	1,	1,	1,	NULL,	8),
(9,	1,	'user_belongsto_role_relationship',	'relationship',	'Role',	0,	1,	1,	1,	1,	0,	'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}',	10),
(10,	1,	'user_belongstomany_role_relationship',	'relationship',	'Roles',	0,	1,	1,	1,	1,	0,	'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}',	11),
(11,	1,	'settings',	'hidden',	'Settings',	0,	0,	0,	0,	0,	0,	NULL,	12),
(12,	2,	'id',	'number',	'ID',	1,	0,	0,	0,	0,	0,	NULL,	1),
(13,	2,	'name',	'text',	'Name',	1,	1,	1,	1,	1,	1,	NULL,	2),
(14,	2,	'created_at',	'timestamp',	'Created At',	0,	0,	0,	0,	0,	0,	NULL,	3),
(15,	2,	'updated_at',	'timestamp',	'Updated At',	0,	0,	0,	0,	0,	0,	NULL,	4),
(16,	3,	'id',	'number',	'ID',	1,	0,	0,	0,	0,	0,	NULL,	1),
(17,	3,	'name',	'text',	'Name',	1,	1,	1,	1,	1,	1,	NULL,	2),
(18,	3,	'created_at',	'timestamp',	'Created At',	0,	0,	0,	0,	0,	0,	NULL,	3),
(19,	3,	'updated_at',	'timestamp',	'Updated At',	0,	0,	0,	0,	0,	0,	NULL,	4),
(20,	3,	'display_name',	'text',	'Display Name',	1,	1,	1,	1,	1,	1,	NULL,	5),
(21,	1,	'role_id',	'text',	'Role',	1,	1,	1,	1,	1,	1,	NULL,	9),
(22,	4,	'id',	'text',	'Id',	1,	0,	0,	0,	0,	0,	'{}',	1),
(23,	4,	'created_at',	'timestamp',	'Создано',	0,	1,	1,	1,	0,	1,	'{}',	2),
(24,	4,	'updated_at',	'timestamp',	'Обновлено',	0,	0,	0,	0,	0,	0,	'{}',	3),
(25,	4,	'title',	'text',	'Название',	1,	1,	1,	1,	1,	1,	'{}',	4),
(26,	4,	'info',	'text',	'Информация',	0,	1,	1,	1,	1,	1,	'{}',	5),
(27,	4,	'url',	'text',	'Ссылка',	0,	1,	1,	1,	1,	1,	'{}',	6),
(28,	5,	'id',	'text',	'Id',	1,	0,	0,	0,	0,	0,	'{}',	1),
(29,	5,	'created_at',	'timestamp',	'Создано',	0,	1,	1,	1,	0,	1,	'{}',	2),
(30,	5,	'updated_at',	'timestamp',	'Обновлено',	0,	0,	0,	0,	0,	0,	'{}',	3),
(31,	5,	'title',	'text',	'Название',	1,	1,	1,	1,	1,	1,	'{}',	4),
(32,	5,	'info',	'text',	'Информация',	0,	1,	1,	1,	1,	1,	'{}',	5),
(33,	5,	'url',	'text',	'Ссылка',	0,	1,	1,	1,	1,	1,	'{\"view_browse\":\"formfields.url_browse\"}',	6),
(34,	5,	'account',	'text',	'Аккаунт',	0,	1,	1,	1,	1,	1,	'{}',	7),
(35,	5,	'paid_to',	'date',	'Оплачен до',	0,	1,	1,	1,	1,	1,	'{}',	8),
(36,	6,	'id',	'text',	'Id',	1,	0,	0,	0,	0,	0,	'{}',	1),
(37,	6,	'created_at',	'timestamp',	'Создано',	0,	0,	1,	1,	0,	1,	'{}',	2),
(38,	6,	'updated_at',	'timestamp',	'Обновлено',	0,	0,	0,	0,	0,	0,	'{}',	3),
(39,	6,	'title',	'text',	'Название',	1,	1,	1,	1,	1,	1,	'{}',	5),
(40,	6,	'type',	'select_dropdown',	'Тип',	1,	1,	1,	1,	1,	1,	'{\"options\":{\"li\":\"LiveInternet\",\"yandex_xml\":\"Yandex XML\",\"yandex_metrika\":\"Yandex Metrika\",\"yandex_webmaster\":\"Yandex Webmaster\",\"google_analytics\":\"Google Analytics\"}}',	4),
(41,	6,	'account_data',	'text',	'Данные аккаунта',	0,	1,	1,	1,	1,	1,	'{\"view_add\":\"formfields.account_data_edit\",\"view_edit\":\"formfields.account_data_edit\",\"view_browse\":\"formfields.account_data_browse\"}',	6),
(42,	6,	'order',	'number',	'Порядок',	0,	1,	1,	1,	1,	1,	'{}',	7);

DROP TABLE IF EXISTS `data_types`;
CREATE TABLE `data_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1,	'users',	'users',	'User',	'Users',	'voyager-person',	'TCG\\Voyager\\Models\\User',	'TCG\\Voyager\\Policies\\UserPolicy',	'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController',	'',	1,	0,	NULL,	'2023-12-12 16:25:10',	'2023-12-12 16:25:10'),
(2,	'menus',	'menus',	'Menu',	'Menus',	'voyager-list',	'TCG\\Voyager\\Models\\Menu',	NULL,	'',	'',	1,	0,	NULL,	'2023-12-12 16:25:10',	'2023-12-12 16:25:10'),
(3,	'roles',	'roles',	'Role',	'Roles',	'voyager-lock',	'TCG\\Voyager\\Models\\Role',	NULL,	'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController',	'',	1,	0,	NULL,	'2023-12-12 16:25:10',	'2023-12-12 16:25:10'),
(4,	'registrars',	'registrars',	'Регистратор',	'Регистраторы',	NULL,	'App\\Models\\Registrar',	NULL,	NULL,	NULL,	1,	0,	'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}',	'2023-12-13 03:13:15',	'2023-12-13 03:14:47'),
(5,	'hostings',	'hostings',	'Хостинг',	'Хостинги',	NULL,	'App\\Models\\Hosting',	NULL,	NULL,	NULL,	1,	0,	'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}',	'2023-12-13 03:16:07',	'2023-12-13 03:35:03'),
(6,	'accounts',	'accounts',	'Account',	'Accounts',	NULL,	'App\\Models\\Account',	NULL,	NULL,	NULL,	1,	0,	'{\"order_column\":\"order\",\"order_display_column\":\"order\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}',	'2023-12-13 03:45:13',	'2023-12-13 03:45:47');

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `hostings`;
CREATE TABLE `hostings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `info` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_to` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hostings_paid_to_index` (`paid_to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `hostings` (`id`, `created_at`, `updated_at`, `title`, `info`, `url`, `account`, `paid_to`) VALUES
(1,	'2023-12-13 03:35:41',	'2023-12-13 03:35:41',	'Reg.ru',	NULL,	NULL,	'tst_acc',	'2027-11-01'),
(2,	'2023-12-13 03:36:00',	'2023-12-13 03:36:23',	'Reg.ru',	NULL,	'//Reg.ru',	'tst2',	'2028-04-01');

DROP TABLE IF EXISTS `ltm_translations`;
CREATE TABLE `ltm_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `status` int(11) NOT NULL DEFAULT 0,
  `locale` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `group` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `key` text COLLATE utf8mb4_bin NOT NULL,
  `value` text COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;


DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1,	'admin',	'2023-12-12 16:25:10',	'2023-12-12 16:25:10');

DROP TABLE IF EXISTS `menu_items`;
CREATE TABLE `menu_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1,	1,	'Dashboard',	'',	'_self',	'voyager-boat',	NULL,	NULL,	1,	'2023-12-12 16:25:10',	'2023-12-12 16:25:10',	'voyager.dashboard',	NULL),
(2,	1,	'Медиа',	'',	'_self',	'voyager-images',	'#000000',	5,	7,	'2023-12-12 16:25:10',	'2023-12-13 03:28:27',	'voyager.media.index',	'null'),
(3,	1,	'Пользователи',	'',	'_self',	'voyager-person',	'#000000',	5,	1,	'2023-12-12 16:25:10',	'2023-12-13 03:28:05',	'voyager.users.index',	'null'),
(4,	1,	'Роли',	'',	'_self',	'voyager-lock',	'#000000',	5,	2,	'2023-12-12 16:25:10',	'2023-12-13 03:28:15',	'voyager.roles.index',	'null'),
(5,	1,	'Инструменты',	'',	'_self',	'voyager-tools',	'#000000',	NULL,	5,	'2023-12-12 16:25:10',	'2023-12-13 03:58:59',	NULL,	''),
(6,	1,	'Меню',	'',	'_self',	'voyager-list',	'#000000',	5,	3,	'2023-12-12 16:25:10',	'2023-12-13 03:28:38',	'voyager.menus.index',	'null'),
(7,	1,	'БД',	'',	'_self',	'voyager-data',	'#000000',	5,	4,	'2023-12-12 16:25:10',	'2023-12-13 03:28:52',	'voyager.database.index',	'null'),
(8,	1,	'Compass',	'',	'_self',	'voyager-compass',	NULL,	5,	5,	'2023-12-12 16:25:10',	'2023-12-13 03:25:46',	'voyager.compass.index',	NULL),
(9,	1,	'BREAD',	'',	'_self',	'voyager-bread',	NULL,	5,	6,	'2023-12-12 16:25:10',	'2023-12-13 03:25:46',	'voyager.bread.index',	NULL),
(10,	1,	'Настройки',	'',	'_self',	'voyager-settings',	'#000000',	5,	8,	'2023-12-12 16:25:10',	'2023-12-13 03:29:05',	'voyager.settings.index',	'null'),
(11,	1,	'Регистраторы',	'',	'_self',	NULL,	'#000000',	NULL,	2,	'2023-12-13 03:13:15',	'2023-12-13 03:27:10',	'voyager.registrars.index',	'null'),
(12,	1,	'Хостинги',	'',	'_self',	NULL,	'#000000',	NULL,	3,	'2023-12-13 03:16:07',	'2023-12-13 03:27:28',	'voyager.hostings.index',	'null'),
(13,	1,	'Переводы',	'/translations',	'_blank',	'voyager-lightbulb',	'#000000',	5,	9,	'2023-12-13 03:29:37',	'2023-12-13 03:29:43',	NULL,	''),
(14,	1,	'Аккаунты',	'',	'_self',	NULL,	'#000000',	NULL,	4,	'2023-12-13 03:45:13',	'2023-12-13 03:59:29',	'voyager.accounts.index',	'null');

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1,	'2014_10_12_000000_create_users_table',	1),
(2,	'2014_10_12_100000_create_password_resets_table',	1),
(3,	'2016_01_01_000000_add_voyager_user_fields',	1),
(4,	'2016_01_01_000000_create_data_types_table',	1),
(5,	'2016_05_19_173453_create_menu_table',	1),
(6,	'2016_10_21_190000_create_roles_table',	1),
(7,	'2016_10_21_190000_create_settings_table',	1),
(8,	'2016_11_30_135954_create_permission_table',	1),
(9,	'2016_11_30_141208_create_permission_role_table',	1),
(10,	'2016_12_26_201236_data_types__add__server_side',	1),
(11,	'2017_01_13_000000_add_route_to_menu_items_table',	1),
(12,	'2017_01_14_005015_create_translations_table',	1),
(13,	'2017_01_15_000000_make_table_name_nullable_in_permissions_table',	1),
(14,	'2017_03_06_000000_add_controller_to_data_types_table',	1),
(15,	'2017_04_21_000000_add_order_to_data_rows_table',	1),
(16,	'2017_07_05_210000_add_policyname_to_data_types_table',	1),
(17,	'2017_08_05_000000_add_group_to_settings_table',	1),
(18,	'2017_11_26_013050_add_user_role_relationship',	1),
(19,	'2017_11_26_015000_create_user_roles_table',	1),
(20,	'2018_03_11_000000_add_user_settings',	1),
(21,	'2018_03_14_000000_add_details_to_data_types_table',	1),
(22,	'2018_03_16_000000_make_settings_value_nullable',	1),
(23,	'2019_08_19_000000_create_failed_jobs_table',	1),
(24,	'2019_12_14_000001_create_personal_access_tokens_table',	1),
(25,	'2014_04_02_193005_create_translations_table',	2),
(26,	'2023_12_13_055709_create_registrars_table',	3),
(27,	'2023_12_13_060005_create_hostings_table',	4),
(28,	'2023_12_13_063941_create_accounts_table',	5);

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1,	'browse_admin',	NULL,	'2023-12-12 16:25:10',	'2023-12-12 16:25:10'),
(2,	'browse_bread',	NULL,	'2023-12-12 16:25:10',	'2023-12-12 16:25:10'),
(3,	'browse_database',	NULL,	'2023-12-12 16:25:10',	'2023-12-12 16:25:10'),
(4,	'browse_media',	NULL,	'2023-12-12 16:25:10',	'2023-12-12 16:25:10'),
(5,	'browse_compass',	NULL,	'2023-12-12 16:25:10',	'2023-12-12 16:25:10'),
(6,	'browse_menus',	'menus',	'2023-12-12 16:25:10',	'2023-12-12 16:25:10'),
(7,	'read_menus',	'menus',	'2023-12-12 16:25:10',	'2023-12-12 16:25:10'),
(8,	'edit_menus',	'menus',	'2023-12-12 16:25:10',	'2023-12-12 16:25:10'),
(9,	'add_menus',	'menus',	'2023-12-12 16:25:11',	'2023-12-12 16:25:11'),
(10,	'delete_menus',	'menus',	'2023-12-12 16:25:11',	'2023-12-12 16:25:11'),
(11,	'browse_roles',	'roles',	'2023-12-12 16:25:11',	'2023-12-12 16:25:11'),
(12,	'read_roles',	'roles',	'2023-12-12 16:25:11',	'2023-12-12 16:25:11'),
(13,	'edit_roles',	'roles',	'2023-12-12 16:25:11',	'2023-12-12 16:25:11'),
(14,	'add_roles',	'roles',	'2023-12-12 16:25:11',	'2023-12-12 16:25:11'),
(15,	'delete_roles',	'roles',	'2023-12-12 16:25:11',	'2023-12-12 16:25:11'),
(16,	'browse_users',	'users',	'2023-12-12 16:25:11',	'2023-12-12 16:25:11'),
(17,	'read_users',	'users',	'2023-12-12 16:25:11',	'2023-12-12 16:25:11'),
(18,	'edit_users',	'users',	'2023-12-12 16:25:11',	'2023-12-12 16:25:11'),
(19,	'add_users',	'users',	'2023-12-12 16:25:11',	'2023-12-12 16:25:11'),
(20,	'delete_users',	'users',	'2023-12-12 16:25:11',	'2023-12-12 16:25:11'),
(21,	'browse_settings',	'settings',	'2023-12-12 16:25:11',	'2023-12-12 16:25:11'),
(22,	'read_settings',	'settings',	'2023-12-12 16:25:11',	'2023-12-12 16:25:11'),
(23,	'edit_settings',	'settings',	'2023-12-12 16:25:11',	'2023-12-12 16:25:11'),
(24,	'add_settings',	'settings',	'2023-12-12 16:25:11',	'2023-12-12 16:25:11'),
(25,	'delete_settings',	'settings',	'2023-12-12 16:25:11',	'2023-12-12 16:25:11'),
(26,	'browse_registrars',	'registrars',	'2023-12-13 03:13:15',	'2023-12-13 03:13:15'),
(27,	'read_registrars',	'registrars',	'2023-12-13 03:13:15',	'2023-12-13 03:13:15'),
(28,	'edit_registrars',	'registrars',	'2023-12-13 03:13:15',	'2023-12-13 03:13:15'),
(29,	'add_registrars',	'registrars',	'2023-12-13 03:13:15',	'2023-12-13 03:13:15'),
(30,	'delete_registrars',	'registrars',	'2023-12-13 03:13:15',	'2023-12-13 03:13:15'),
(31,	'browse_hostings',	'hostings',	'2023-12-13 03:16:07',	'2023-12-13 03:16:07'),
(32,	'read_hostings',	'hostings',	'2023-12-13 03:16:07',	'2023-12-13 03:16:07'),
(33,	'edit_hostings',	'hostings',	'2023-12-13 03:16:07',	'2023-12-13 03:16:07'),
(34,	'add_hostings',	'hostings',	'2023-12-13 03:16:07',	'2023-12-13 03:16:07'),
(35,	'delete_hostings',	'hostings',	'2023-12-13 03:16:07',	'2023-12-13 03:16:07'),
(36,	'browse_accounts',	'accounts',	'2023-12-13 03:45:13',	'2023-12-13 03:45:13'),
(37,	'read_accounts',	'accounts',	'2023-12-13 03:45:13',	'2023-12-13 03:45:13'),
(38,	'edit_accounts',	'accounts',	'2023-12-13 03:45:13',	'2023-12-13 03:45:13'),
(39,	'add_accounts',	'accounts',	'2023-12-13 03:45:13',	'2023-12-13 03:45:13'),
(40,	'delete_accounts',	'accounts',	'2023-12-13 03:45:13',	'2023-12-13 03:45:13');

DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE `permission_role` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1,	1),
(2,	1),
(3,	1),
(4,	1),
(5,	1),
(6,	1),
(7,	1),
(8,	1),
(9,	1),
(10,	1),
(11,	1),
(12,	1),
(13,	1),
(14,	1),
(15,	1),
(16,	1),
(17,	1),
(18,	1),
(19,	1),
(20,	1),
(21,	1),
(22,	1),
(23,	1),
(24,	1),
(25,	1),
(26,	1),
(27,	1),
(28,	1),
(29,	1),
(30,	1),
(31,	1),
(32,	1),
(33,	1),
(34,	1),
(35,	1),
(36,	1),
(37,	1),
(38,	1),
(39,	1),
(40,	1);

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `registrars`;
CREATE TABLE `registrars` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `info` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `registrars` (`id`, `created_at`, `updated_at`, `title`, `info`, `url`) VALUES
(1,	'2023-12-13 03:33:23',	'2023-12-13 03:33:23',	'reg.ru',	NULL,	'https://www.reg.ru/');

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1,	'admin',	'Administrator',	'2023-12-12 16:25:10',	'2023-12-12 16:25:10'),
(2,	'user',	'Normal User',	'2023-12-12 16:25:10',	'2023-12-12 16:25:10');

DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(5,	'admin.bg_image',	'Admin Background Image',	'',	'',	'image',	5,	'Admin'),
(6,	'admin.title',	'Admin Title',	'SitePanel',	'',	'text',	1,	'Admin'),
(7,	'admin.description',	'Admin Description',	'Welcome to SitePanel',	'',	'text',	2,	'Admin'),
(8,	'admin.loader',	'Admin Loader',	'',	'',	'image',	3,	'Admin'),
(9,	'admin.icon_image',	'Admin Icon Image',	'',	'',	'image',	4,	'Admin');

DROP TABLE IF EXISTS `translations`;
CREATE TABLE `translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1,	'data_rows',	'display_name',	22,	'en',	'Id',	'2023-12-13 03:13:57',	'2023-12-13 03:13:57'),
(2,	'data_rows',	'display_name',	23,	'en',	'Created At',	'2023-12-13 03:13:57',	'2023-12-13 03:13:57'),
(3,	'data_rows',	'display_name',	24,	'en',	'Updated At',	'2023-12-13 03:13:57',	'2023-12-13 03:13:57'),
(4,	'data_rows',	'display_name',	25,	'en',	'Title',	'2023-12-13 03:13:57',	'2023-12-13 03:13:57'),
(5,	'data_rows',	'display_name',	26,	'en',	'Info',	'2023-12-13 03:13:57',	'2023-12-13 03:13:57'),
(6,	'data_rows',	'display_name',	27,	'en',	'Url',	'2023-12-13 03:13:57',	'2023-12-13 03:13:57'),
(7,	'data_types',	'display_name_singular',	4,	'en',	'Registrar',	'2023-12-13 03:13:57',	'2023-12-13 03:13:57'),
(8,	'data_types',	'display_name_plural',	4,	'en',	'Registrars',	'2023-12-13 03:13:57',	'2023-12-13 03:13:57'),
(9,	'data_rows',	'display_name',	28,	'en',	'Id',	'2023-12-13 03:17:03',	'2023-12-13 03:17:03'),
(10,	'data_rows',	'display_name',	29,	'en',	'Created At',	'2023-12-13 03:17:03',	'2023-12-13 03:17:03'),
(11,	'data_rows',	'display_name',	30,	'en',	'Updated At',	'2023-12-13 03:17:03',	'2023-12-13 03:17:03'),
(12,	'data_rows',	'display_name',	31,	'en',	'Title',	'2023-12-13 03:17:03',	'2023-12-13 03:17:03'),
(13,	'data_rows',	'display_name',	32,	'en',	'Info',	'2023-12-13 03:17:03',	'2023-12-13 03:17:03'),
(14,	'data_rows',	'display_name',	33,	'en',	'Url',	'2023-12-13 03:17:03',	'2023-12-13 03:17:03'),
(15,	'data_rows',	'display_name',	34,	'en',	'Account',	'2023-12-13 03:17:03',	'2023-12-13 03:17:03'),
(16,	'data_rows',	'display_name',	35,	'en',	'Paid To',	'2023-12-13 03:17:03',	'2023-12-13 03:17:03'),
(17,	'data_types',	'display_name_singular',	5,	'en',	'Hosting',	'2023-12-13 03:17:03',	'2023-12-13 03:17:03'),
(18,	'data_types',	'display_name_plural',	5,	'en',	'Hostings',	'2023-12-13 03:17:03',	'2023-12-13 03:17:03'),
(19,	'menu_items',	'title',	11,	'en',	'Registrars',	'2023-12-13 03:27:10',	'2023-12-13 03:27:10'),
(20,	'menu_items',	'title',	12,	'en',	'Hostings',	'2023-12-13 03:27:28',	'2023-12-13 03:27:28'),
(21,	'menu_items',	'title',	5,	'en',	'Tools',	'2023-12-13 03:27:48',	'2023-12-13 03:27:48'),
(22,	'menu_items',	'title',	3,	'en',	'Users',	'2023-12-13 03:28:05',	'2023-12-13 03:28:05'),
(23,	'menu_items',	'title',	4,	'en',	'Roles',	'2023-12-13 03:28:15',	'2023-12-13 03:28:15'),
(24,	'menu_items',	'title',	2,	'en',	'Media',	'2023-12-13 03:28:26',	'2023-12-13 03:28:26'),
(25,	'menu_items',	'title',	6,	'en',	'Menu Builder',	'2023-12-13 03:28:38',	'2023-12-13 03:28:38'),
(26,	'menu_items',	'title',	7,	'en',	'Database',	'2023-12-13 03:28:52',	'2023-12-13 03:28:52'),
(27,	'menu_items',	'title',	10,	'en',	'Settings',	'2023-12-13 03:29:05',	'2023-12-13 03:29:05'),
(28,	'menu_items',	'title',	13,	'en',	'Translations',	'2023-12-13 03:29:37',	'2023-12-13 03:29:37'),
(29,	'data_rows',	'display_name',	36,	'en',	'Id',	'2023-12-13 03:45:47',	'2023-12-13 03:45:47'),
(30,	'data_rows',	'display_name',	37,	'en',	'Created At',	'2023-12-13 03:45:47',	'2023-12-13 03:45:47'),
(31,	'data_rows',	'display_name',	38,	'en',	'Updated At',	'2023-12-13 03:45:47',	'2023-12-13 03:45:47'),
(32,	'data_rows',	'display_name',	39,	'en',	'Title',	'2023-12-13 03:45:47',	'2023-12-13 03:45:47'),
(33,	'data_rows',	'display_name',	40,	'en',	'Type',	'2023-12-13 03:45:47',	'2023-12-13 03:45:47'),
(34,	'data_rows',	'display_name',	41,	'en',	'Account Data',	'2023-12-13 03:45:47',	'2023-12-13 03:45:47'),
(35,	'data_rows',	'display_name',	42,	'en',	'Order',	'2023-12-13 03:45:47',	'2023-12-13 03:45:47'),
(36,	'data_types',	'display_name_singular',	6,	'en',	'Account',	'2023-12-13 03:45:47',	'2023-12-13 03:45:47'),
(37,	'data_types',	'display_name_plural',	6,	'en',	'Accounts',	'2023-12-13 03:45:47',	'2023-12-13 03:45:47'),
(38,	'menu_items',	'title',	14,	'en',	'Accounts',	'2023-12-13 03:59:29',	'2023-12-13 03:59:29');

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1,	1,	'admin',	'admin@test.com',	'users/default.png',	NULL,	'$2y$10$JrDyrpbwtMEDtpKHY.NWneullCFix91S92lVZPHaBxJCa3FZWW59C',	NULL,	'{\"locale\":\"ru\"}',	'2023-12-12 16:26:04',	'2023-12-13 03:07:12');

DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `user_roles` (
  `user_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`),
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- 2023-12-13 07:04:55
