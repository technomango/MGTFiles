-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 09-07-2025 a las 09:46:10
-- Versión del servidor: 10.11.13-MariaDB-0ubuntu0.24.04.1
-- Versión de PHP: 8.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `admin_mgtfiles`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `additionals`
--

CREATE TABLE `additionals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `additionals`
--

INSERT INTO `additionals` (`id`, `key`, `value`) VALUES
(4, 'popup_notice_status', '0'),
(5, 'popup_notice_description', '<h2 style=\"text-align:center\"><span style=\"color:#1abc9c\"><strong>What is Lorem Ipsum?</strong></span></h2>\r\n\r\n<p style=\"text-align:center\"><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `addons`
--

CREATE TABLE `addons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `api_key` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `symbol` varchar(255) NOT NULL,
  `version` varchar(50) NOT NULL,
  `action_text` varchar(255) DEFAULT NULL,
  `action_link` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `admins`
--

INSERT INTO `admins` (`id`, `firstname`, `lastname`, `email`, `avatar`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Manuel', 'Solis', 'msolis@mango.com.gt', 'images/avatars/admins/kyjwBedpQx9pwfe_1752046011.png', '$2y$10$7LzMVA96YxoDwWDPMHTUJ.tKSPvw6m1Uxf/p/Y0NUv1LNale2UB2S', NULL, '2025-07-09 09:26:07', '2025-07-09 09:26:51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin_notifications`
--

CREATE TABLE `admin_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 : Unread 1: Read',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin_password_resets`
--

CREATE TABLE `admin_password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `advertisements`
--

CREATE TABLE `advertisements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `position` varchar(255) NOT NULL,
  `size` varchar(255) DEFAULT NULL,
  `symbol` varchar(255) NOT NULL,
  `code` longtext DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `advertisements`
--

INSERT INTO `advertisements` (`id`, `position`, `size`, `symbol`, `code`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Home Page (Top)', 'Responsive', 'home_page_top', NULL, 0, '2022-05-09 21:10:23', '2022-05-11 16:46:12'),
(2, 'Home Page (Bottom)', 'Responsive', 'home_page_bottom', NULL, 0, '2022-05-09 21:10:23', '2022-05-10 10:54:37'),
(3, 'Blog Articles (Center)', 'Responsive', 'blog_articles_center', NULL, 0, '2022-05-10 00:09:41', '2022-05-10 10:56:05'),
(4, 'Blog Articles (Bottom)', 'Responsive', 'blog_articles_bottom', NULL, 0, '2022-05-10 00:09:41', '2022-05-10 10:56:10'),
(5, 'Blog Sidebar', 'Responsive', 'blog_sidebar', NULL, 0, '2022-05-10 00:09:41', '2022-05-10 10:56:15'),
(6, 'Blog Single Article (Top)', 'Responsive', 'blog_single_article_top', NULL, 0, '2022-05-10 00:09:41', '2022-05-10 10:56:20'),
(7, 'Blog Single Article (Bottom)', 'Responsive', 'blog_single_article_bottom', NULL, 0, '2022-05-10 00:09:41', '2022-05-10 10:56:26'),
(8, 'Download Page (Top)', 'Responsive', 'download_page_top', NULL, 0, '2022-05-10 00:09:41', '2022-05-10 10:56:32'),
(9, 'Download Page (Bottom)', 'Responsive', 'download_page_bottom', NULL, 0, '2022-05-10 00:09:41', '2022-05-10 10:56:38'),
(10, 'Download Page (Down Bottom)', 'Responsive', 'download_page_down_bottom', NULL, 0, '2022-05-10 00:09:41', '2022-05-10 10:56:42'),
(11, 'Head Code', NULL, 'head_code', NULL, 0, '2022-05-10 01:09:26', '2022-05-09 20:23:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `blog_articles`
--

CREATE TABLE `blog_articles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lang` varchar(3) NOT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `short_description` varchar(200) NOT NULL,
  `views` bigint(20) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lang` varchar(3) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `views` bigint(20) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `blog_categories`
--

INSERT INTO `blog_categories` (`id`, `lang`, `name`, `slug`, `views`, `created_at`, `updated_at`) VALUES
(1, 'en', 'File Sharing', 'file-sharing', 4, '2022-05-11 16:25:33', '2022-08-01 17:47:40'),
(2, 'en', 'Cloud Storage', 'cloud-storage', 0, '2022-07-31 15:10:13', '2022-07-31 15:10:13'),
(3, 'en', 'Data Transfer', 'data-transfer', 0, '2022-07-31 15:10:25', '2022-07-31 15:10:25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `blog_comments`
--

CREATE TABLE `blog_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `article_id` bigint(20) UNSIGNED NOT NULL,
  `comment` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(3) NOT NULL,
  `name` varchar(100) NOT NULL,
  `capital` varchar(100) DEFAULT NULL,
  `continent` varchar(100) NOT NULL,
  `continent_code` varchar(10) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `currency` varchar(10) NOT NULL,
  `symbol` varchar(10) NOT NULL,
  `alpha_3` varchar(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `countries`
--

INSERT INTO `countries` (`id`, `code`, `name`, `capital`, `continent`, `continent_code`, `phone`, `currency`, `symbol`, `alpha_3`, `created_at`, `updated_at`) VALUES
(1, 'AF', 'Afghanistan', 'Kabul', 'Asia', 'AS', '+93', 'AFN', '؋', 'AFG', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(2, 'AX', 'Aland Islands', 'Mariehamn', 'Europe', 'EU', '+358', 'EUR', '€', 'ALA', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(3, 'AL', 'Albania', 'Tirana', 'Europe', 'EU', '+355', 'ALL', 'Lek', 'ALB', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(4, 'DZ', 'Algeria', 'Algiers', 'Africa', 'AF', '+213', 'DZD', 'دج', 'DZA', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(5, 'AS', 'American Samoa', 'Pago Pago', 'Oceania', 'OC', '+1684', 'USD', '$', 'ASM', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(6, 'AD', 'Andorra', 'Andorra la Vella', 'Europe', 'EU', '+376', 'EUR', '€', 'AND', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(7, 'AO', 'Angola', 'Luanda', 'Africa', 'AF', '+244', 'AOA', 'Kz', 'AGO', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(8, 'AI', 'Anguilla', 'The Valley', 'North America', 'NA', '+1264', 'XCD', '$', 'AIA', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(9, 'AQ', 'Antarctica', 'Antarctica', 'Antarctica', 'AN', '+672', 'AAD', '$', 'ATA', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(10, 'AG', 'Antigua and Barbuda', 'St. John\'s', 'North America', 'NA', '+1268', 'XCD', '$', 'ATG', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(11, 'AR', 'Argentina', 'Buenos Aires', 'South America', 'SA', '+54', 'ARS', '$', 'ARG', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(12, 'AM', 'Armenia', 'Yerevan', 'Asia', 'AS', '+374', 'AMD', '֏', 'ARM', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(13, 'AW', 'Aruba', 'Oranjestad', 'North America', 'NA', '+297', 'AWG', 'ƒ', 'ABW', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(14, 'AU', 'Australia', 'Canberra', 'Oceania', 'OC', '+61', 'AUD', '$', 'AUS', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(15, 'AT', 'Austria', 'Vienna', 'Europe', 'EU', '+43', 'EUR', '€', 'AUT', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(16, 'AZ', 'Azerbaijan', 'Baku', 'Asia', 'AS', '+994', 'AZN', 'm', 'AZE', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(17, 'BS', 'Bahamas', 'Nassau', 'North America', 'NA', '+1242', 'BSD', 'B$', 'BHS', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(18, 'BH', 'Bahrain', 'Manama', 'Asia', 'AS', '+973', 'BHD', '.د.ب', 'BHR', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(19, 'BD', 'Bangladesh', 'Dhaka', 'Asia', 'AS', '+880', 'BDT', '৳', 'BGD', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(20, 'BB', 'Barbados', 'Bridgetown', 'North America', 'NA', '+1246', 'BBD', 'Bds$', 'BRB', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(21, 'BY', 'Belarus', 'Minsk', 'Europe', 'EU', '+375', 'BYN', 'Br', 'BLR', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(22, 'BE', 'Belgium', 'Brussels', 'Europe', 'EU', '+32', 'EUR', '€', 'BEL', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(23, 'BZ', 'Belize', 'Belmopan', 'North America', 'NA', '+501', 'BZD', '$', 'BLZ', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(24, 'BJ', 'Benin', 'Porto-Novo', 'Africa', 'AF', '+229', 'XOF', 'CFA', 'BEN', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(25, 'BM', 'Bermuda', 'Hamilton', 'North America', 'NA', '+1441', 'BMD', '$', 'BMU', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(26, 'BT', 'Bhutan', 'Thimphu', 'Asia', 'AS', '+975', 'BTN', 'Nu.', 'BTN', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(27, 'BO', 'Bolivia', 'Sucre', 'South America', 'SA', '+591', 'BOB', 'Bs.', 'BOL', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(28, 'BQ', 'Bonaire, Sint Eustatius and Saba', 'Kralendijk', 'North America', 'NA', '+599', 'USD', '$', 'BES', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(29, 'BA', 'Bosnia and Herzegovina', 'Sarajevo', 'Europe', 'EU', '+387', 'BAM', 'KM', 'BIH', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(30, 'BW', 'Botswana', 'Gaborone', 'Africa', 'AF', '+267', 'BWP', 'P', 'BWA', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(31, 'BV', 'Bouvet Island', NULL, 'Antarctica', 'AN', '+55', 'NOK', 'kr', 'BVT', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(32, 'BR', 'Brazil', 'Brasilia', 'South America', 'SA', '+55', 'BRL', 'R$', 'BRA', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(33, 'IO', 'British Indian Ocean Territory', 'Diego Garcia', 'Asia', 'AS', '+246', 'USD', '$', 'IOT', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(34, 'BN', 'Brunei Darussalam', 'Bandar Seri Begawan', 'Asia', 'AS', '+673', 'BND', 'B$', 'BRN', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(35, 'BG', 'Bulgaria', 'Sofia', 'Europe', 'EU', '+359', 'BGN', 'Лв.', 'BGR', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(36, 'BF', 'Burkina Faso', 'Ouagadougou', 'Africa', 'AF', '+226', 'XOF', 'CFA', 'BFA', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(37, 'BI', 'Burundi', 'Bujumbura', 'Africa', 'AF', '+257', 'BIF', 'FBu', 'BDI', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(38, 'KH', 'Cambodia', 'Phnom Penh', 'Asia', 'AS', '+855', 'KHR', 'KHR', 'KHM', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(39, 'CM', 'Cameroon', 'Yaounde', 'Africa', 'AF', '+237', 'XAF', 'FCFA', 'CMR', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(40, 'CA', 'Canada', 'Ottawa', 'North America', 'NA', '+1', 'CAD', '$', 'CAN', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(41, 'CV', 'Cape Verde', 'Praia', 'Africa', 'AF', '+238', 'CVE', '$', 'CPV', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(42, 'KY', 'Cayman Islands', 'George Town', 'North America', 'NA', '+1345', 'KYD', '$', 'CYM', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(43, 'CF', 'Central African Republic', 'Bangui', 'Africa', 'AF', '+236', 'XAF', 'FCFA', 'CAF', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(44, 'TD', 'Chad', 'N\'Djamena', 'Africa', 'AF', '+235', 'XAF', 'FCFA', 'TCD', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(45, 'CL', 'Chile', 'Santiago', 'South America', 'SA', '+56', 'CLP', '$', 'CHL', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(46, 'CN', 'China', 'Beijing', 'Asia', 'AS', '+86', 'CNY', '¥', 'CHN', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(47, 'CX', 'Christmas Island', 'Flying Fish Cove', 'Asia', 'AS', '+61', 'AUD', '$', 'CXR', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(48, 'CC', 'Cocos (Keeling) Islands', 'West Island', 'Asia', 'AS', '+672', 'AUD', '$', 'CCK', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(49, 'CO', 'Colombia', 'Bogota', 'South America', 'SA', '+57', 'COP', '$', 'COL', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(50, 'KM', 'Comoros', 'Moroni', 'Africa', 'AF', '+269', 'KMF', 'CF', 'COM', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(51, 'CG', 'Congo', 'Brazzaville', 'Africa', 'AF', '+242', 'XAF', 'FC', 'COG', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(52, 'CD', 'Congo, Democratic Republic of the Congo', 'Kinshasa', 'Africa', 'AF', '+242', 'CDF', 'FC', 'COD', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(53, 'CK', 'Cook Islands', 'Avarua', 'Oceania', 'OC', '+682', 'NZD', '$', 'COK', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(54, 'CR', 'Costa Rica', 'San Jose', 'North America', 'NA', '+506', 'CRC', '₡', 'CRI', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(55, 'CI', 'Cote D\'Ivoire', 'Yamoussoukro', 'Africa', 'AF', '+225', 'XOF', 'CFA', 'CIV', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(56, 'HR', 'Croatia', 'Zagreb', 'Europe', 'EU', '+385', 'HRK', 'kn', 'HRV', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(57, 'CU', 'Cuba', 'Havana', 'North America', 'NA', '+53', 'CUP', '$', 'CUB', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(58, 'CW', 'Curacao', 'Willemstad', 'North America', 'NA', '+599', 'ANG', 'ƒ', 'CUW', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(59, 'CY', 'Cyprus', 'Nicosia', 'Asia', 'AS', '+357', 'EUR', '€', 'CYP', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(60, 'CZ', 'Czech Republic', 'Prague', 'Europe', 'EU', '+420', 'CZK', 'Kč', 'CZE', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(61, 'DK', 'Denmark', 'Copenhagen', 'Europe', 'EU', '+45', 'DKK', 'Kr.', 'DNK', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(62, 'DJ', 'Djibouti', 'Djibouti', 'Africa', 'AF', '+253', 'DJF', 'Fdj', 'DJI', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(63, 'DM', 'Dominica', 'Roseau', 'North America', 'NA', '+1767', 'XCD', '$', 'DMA', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(64, 'DO', 'Dominican Republic', 'Santo Domingo', 'North America', 'NA', '+1809', 'DOP', '$', 'DOM', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(65, 'EC', 'Ecuador', 'Quito', 'South America', 'SA', '+593', 'USD', '$', 'ECU', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(66, 'EG', 'Egypt', 'Cairo', 'Africa', 'AF', '+20', 'EGP', 'ج.م', 'EGY', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(67, 'SV', 'El Salvador', 'San Salvador', 'North America', 'NA', '+503', 'USD', '$', 'SLV', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(68, 'GQ', 'Equatorial Guinea', 'Malabo', 'Africa', 'AF', '+240', 'XAF', 'FCFA', 'GNQ', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(69, 'ER', 'Eritrea', 'Asmara', 'Africa', 'AF', '+291', 'ERN', 'Nfk', 'ERI', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(70, 'EE', 'Estonia', 'Tallinn', 'Europe', 'EU', '+372', 'EUR', '€', 'EST', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(71, 'ET', 'Ethiopia', 'Addis Ababa', 'Africa', 'AF', '+251', 'ETB', 'Nkf', 'ETH', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(72, 'FK', 'Falkland Islands (Malvinas)', 'Stanley', 'South America', 'SA', '+500', 'FKP', '£', 'FLK', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(73, 'FO', 'Faroe Islands', 'Torshavn', 'Europe', 'EU', '+298', 'DKK', 'Kr.', 'FRO', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(74, 'FJ', 'Fiji', 'Suva', 'Oceania', 'OC', '+679', 'FJD', 'FJ$', 'FJI', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(75, 'FI', 'Finland', 'Helsinki', 'Europe', 'EU', '+358', 'EUR', '€', 'FIN', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(76, 'FR', 'France', 'Paris', 'Europe', 'EU', '+33', 'EUR', '€', 'FRA', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(77, 'GF', 'French Guiana', 'Cayenne', 'South America', 'SA', '+594', 'EUR', '€', 'GUF', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(78, 'PF', 'French Polynesia', 'Papeete', 'Oceania', 'OC', '+689', 'XPF', '₣', 'PYF', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(79, 'TF', 'French Southern Territories', 'Port-aux-Francais', 'Antarctica', 'AN', '+262', 'EUR', '€', 'ATF', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(80, 'GA', 'Gabon', 'Libreville', 'Africa', 'AF', '+241', 'XAF', 'FCFA', 'GAB', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(81, 'GM', 'Gambia', 'Banjul', 'Africa', 'AF', '+220', 'GMD', 'D', 'GMB', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(82, 'GE', 'Georgia', 'Tbilisi', 'Asia', 'AS', '+995', 'GEL', 'ლ', 'GEO', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(83, 'DE', 'Germany', 'Berlin', 'Europe', 'EU', '+49', 'EUR', '€', 'DEU', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(84, 'GH', 'Ghana', 'Accra', 'Africa', 'AF', '+233', 'GHS', 'GH₵', 'GHA', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(85, 'GI', 'Gibraltar', 'Gibraltar', 'Europe', 'EU', '+350', 'GIP', '£', 'GIB', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(86, 'GR', 'Greece', 'Athens', 'Europe', 'EU', '+30', 'EUR', '€', 'GRC', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(87, 'GL', 'Greenland', 'Nuuk', 'North America', 'NA', '+299', 'DKK', 'Kr.', 'GRL', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(88, 'GD', 'Grenada', 'St. George\'s', 'North America', 'NA', '+1473', 'XCD', '$', 'GRD', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(89, 'GP', 'Guadeloupe', 'Basse-Terre', 'North America', 'NA', '+590', 'EUR', '€', 'GLP', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(90, 'GU', 'Guam', 'Hagatna', 'Oceania', 'OC', '+1671', 'USD', '$', 'GUM', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(91, 'GT', 'Guatemala', 'Guatemala City', 'North America', 'NA', '+502', 'GTQ', 'Q', 'GTM', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(92, 'GG', 'Guernsey', 'St Peter Port', 'Europe', 'EU', '+44', 'GBP', '£', 'GGY', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(93, 'GN', 'Guinea', 'Conakry', 'Africa', 'AF', '+224', 'GNF', 'FG', 'GIN', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(94, 'GW', 'Guinea-Bissau', 'Bissau', 'Africa', 'AF', '+245', 'XOF', 'CFA', 'GNB', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(95, 'GY', 'Guyana', 'Georgetown', 'South America', 'SA', '+592', 'GYD', '$', 'GUY', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(96, 'HT', 'Haiti', 'Port-au-Prince', 'North America', 'NA', '+509', 'HTG', 'G', 'HTI', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(97, 'HM', 'Heard Island and Mcdonald Islands', '', 'Antarctica', 'AN', '+0', 'AUD', '$', 'HMD', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(98, 'VA', 'Holy See (Vatican City State)', 'Vatican City', 'Europe', 'EU', '+39', 'EUR', '€', 'VAT', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(99, 'HN', 'Honduras', 'Tegucigalpa', 'North America', 'NA', '+504', 'HNL', 'L', 'HND', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(100, 'HK', 'Hong Kong', 'Hong Kong', 'Asia', 'AS', '+852', 'HKD', '$', 'HKG', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(101, 'HU', 'Hungary', 'Budapest', 'Europe', 'EU', '+36', 'HUF', 'Ft', 'HUN', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(102, 'IS', 'Iceland', 'Reykjavik', 'Europe', 'EU', '+354', 'ISK', 'kr', 'ISL', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(103, 'IN', 'India', 'New Delhi', 'Asia', 'AS', '+91', 'INR', '₹', 'IND', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(104, 'ID', 'Indonesia', 'Jakarta', 'Asia', 'AS', '+62', 'IDR', 'Rp', 'IDN', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(105, 'IR', 'Iran, Islamic Republic of', 'Tehran', 'Asia', 'AS', '+98', 'IRR', '﷼', 'IRN', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(106, 'IQ', 'Iraq', 'Baghdad', 'Asia', 'AS', '+964', 'IQD', 'د.ع', 'IRQ', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(107, 'IE', 'Ireland', 'Dublin', 'Europe', 'EU', '+353', 'EUR', '€', 'IRL', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(108, 'IM', 'Isle of Man', 'Douglas, Isle of Man', 'Europe', 'EU', '+44', 'GBP', '£', 'IMN', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(109, 'IL', 'Israel', 'Jerusalem', 'Asia', 'AS', '+972', 'ILS', '₪', 'ISR', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(110, 'IT', 'Italy', 'Rome', 'Europe', 'EU', '+39', 'EUR', '€', 'ITA', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(111, 'JM', 'Jamaica', 'Kingston', 'North America', 'NA', '+1876', 'JMD', 'J$', 'JAM', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(112, 'JP', 'Japan', 'Tokyo', 'Asia', 'AS', '+81', 'JPY', '¥', 'JPN', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(113, 'JE', 'Jersey', 'Saint Helier', 'Europe', 'EU', '+44', 'GBP', '£', 'JEY', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(114, 'JO', 'Jordan', 'Amman', 'Asia', 'AS', '+962', 'JOD', 'ا.د', 'JOR', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(115, 'KZ', 'Kazakhstan', 'Astana', 'Asia', 'AS', '+7', 'KZT', 'лв', 'KAZ', '2021-11-03 22:07:15', '2021-11-04 15:59:30'),
(116, 'KE', 'Kenya', 'Nairobi', 'Africa', 'AF', '+254', 'KES', 'KSh', 'KEN', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(117, 'KI', 'Kiribati', 'Tarawa', 'Oceania', 'OC', '+686', 'AUD', '$', 'KIR', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(118, 'KP', 'Korea, Democratic People\'s Republic of', 'Pyongyang', 'Asia', 'AS', '+850', 'KPW', '₩', 'PRK', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(119, 'KR', 'Korea, Republic of', 'Seoul', 'Asia', 'AS', '+82', 'KRW', '₩', 'KOR', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(120, 'XK', 'Kosovo', 'Pristina', 'Europe', 'EU', '+381', 'EUR', '€', 'XKX', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(121, 'KW', 'Kuwait', 'Kuwait City', 'Asia', 'AS', '+965', 'KWD', 'ك.د', 'KWT', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(122, 'KG', 'Kyrgyzstan', 'Bishkek', 'Asia', 'AS', '+996', 'KGS', 'лв', 'KGZ', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(123, 'LA', 'Lao People\'s Democratic Republic', 'Vientiane', 'Asia', 'AS', '+856', 'LAK', '₭', 'LAO', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(124, 'LV', 'Latvia', 'Riga', 'Europe', 'EU', '+371', 'EUR', '€', 'LVA', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(125, 'LB', 'Lebanon', 'Beirut', 'Asia', 'AS', '+961', 'LBP', '£', 'LBN', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(126, 'LS', 'Lesotho', 'Maseru', 'Africa', 'AF', '+266', 'LSL', 'L', 'LSO', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(127, 'LR', 'Liberia', 'Monrovia', 'Africa', 'AF', '+231', 'LRD', '$', 'LBR', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(128, 'LY', 'Libyan Arab Jamahiriya', 'Tripolis', 'Africa', 'AF', '+218', 'LYD', 'د.ل', 'LBY', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(129, 'LI', 'Liechtenstein', 'Vaduz', 'Europe', 'EU', '+423', 'CHF', 'CHf', 'LIE', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(130, 'LT', 'Lithuania', 'Vilnius', 'Europe', 'EU', '+370', 'EUR', '€', 'LTU', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(131, 'LU', 'Luxembourg', 'Luxembourg', 'Europe', 'EU', '+352', 'EUR', '€', 'LUX', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(132, 'MO', 'Macao', 'Macao', 'Asia', 'AS', '+853', 'MOP', '$', 'MAC', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(133, 'MK', 'Macedonia, the Former Yugoslav Republic of', 'Skopje', 'Europe', 'EU', '+389', 'MKD', 'ден', 'MKD', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(134, 'MG', 'Madagascar', 'Antananarivo', 'Africa', 'AF', '+261', 'MGA', 'Ar', 'MDG', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(135, 'MW', 'Malawi', 'Lilongwe', 'Africa', 'AF', '+265', 'MWK', 'MK', 'MWI', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(136, 'MY', 'Malaysia', 'Kuala Lumpur', 'Asia', 'AS', '+60', 'MYR', 'RM', 'MYS', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(137, 'MV', 'Maldives', 'Male', 'Asia', 'AS', '+960', 'MVR', 'Rf', 'MDV', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(138, 'ML', 'Mali', 'Bamako', 'Africa', 'AF', '+223', 'XOF', 'CFA', 'MLI', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(139, 'MT', 'Malta', 'Valletta', 'Europe', 'EU', '+356', 'EUR', '€', 'MLT', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(140, 'MH', 'Marshall Islands', 'Majuro', 'Oceania', 'OC', '+692', 'USD', '$', 'MHL', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(141, 'MQ', 'Martinique', 'Fort-de-France', 'North America', 'NA', '+596', 'EUR', '€', 'MTQ', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(142, 'MR', 'Mauritania', 'Nouakchott', 'Africa', 'AF', '+222', 'MRO', 'MRU', 'MRT', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(143, 'MU', 'Mauritius', 'Port Louis', 'Africa', 'AF', '+230', 'MUR', '₨', 'MUS', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(144, 'YT', 'Mayotte', 'Mamoudzou', 'Africa', 'AF', '+269', 'EUR', '€', 'MYT', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(145, 'MX', 'Mexico', 'Mexico City', 'North America', 'NA', '+52', 'MXN', '$', 'MEX', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(146, 'FM', 'Micronesia, Federated States of', 'Palikir', 'Oceania', 'OC', '+691', 'USD', '$', 'FSM', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(147, 'MD', 'Moldova, Republic of', 'Chisinau', 'Europe', 'EU', '+373', 'MDL', 'L', 'MDA', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(148, 'MC', 'Monaco', 'Monaco', 'Europe', 'EU', '+377', 'EUR', '€', 'MCO', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(149, 'MN', 'Mongolia', 'Ulan Bator', 'Asia', 'AS', '+976', 'MNT', '₮', 'MNG', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(150, 'ME', 'Montenegro', 'Podgorica', 'Europe', 'EU', '+382', 'EUR', '€', 'MNE', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(151, 'MS', 'Montserrat', 'Plymouth', 'North America', 'NA', '+1664', 'XCD', '$', 'MSR', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(152, 'MA', 'Morocco', 'Rabat', 'Africa', 'AF', '+212', 'MAD', 'DH', 'MAR', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(153, 'MZ', 'Mozambique', 'Maputo', 'Africa', 'AF', '+258', 'MZN', 'MT', 'MOZ', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(154, 'MM', 'Myanmar', 'Nay Pyi Taw', 'Asia', 'AS', '+95', 'MMK', 'K', 'MMR', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(155, 'NA', 'Namibia', 'Windhoek', 'Africa', 'AF', '+264', 'NAD', '$', 'NAM', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(156, 'NR', 'Nauru', 'Yaren', 'Oceania', 'OC', '+674', 'AUD', '$', 'NRU', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(157, 'NP', 'Nepal', 'Kathmandu', 'Asia', 'AS', '+977', 'NPR', '₨', 'NPL', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(158, 'NL', 'Netherlands', 'Amsterdam', 'Europe', 'EU', '+31', 'EUR', '€', 'NLD', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(159, 'AN', 'Netherlands Antilles', 'Willemstad', 'North America', 'NA', '+599', 'ANG', 'NAf', 'ANT', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(160, 'NC', 'New Caledonia', 'Noumea', 'Oceania', 'OC', '+687', 'XPF', '₣', 'NCL', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(161, 'NZ', 'New Zealand', 'Wellington', 'Oceania', 'OC', '+64', 'NZD', '$', 'NZL', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(162, 'NI', 'Nicaragua', 'Managua', 'North America', 'NA', '+505', 'NIO', 'C$', 'NIC', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(163, 'NE', 'Niger', 'Niamey', 'Africa', 'AF', '+227', 'XOF', 'CFA', 'NER', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(164, 'NG', 'Nigeria', 'Abuja', 'Africa', 'AF', '+234', 'NGN', '₦', 'NGA', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(165, 'NU', 'Niue', 'Alofi', 'Oceania', 'OC', '+683', 'NZD', '$', 'NIU', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(166, 'NF', 'Norfolk Island', 'Kingston', 'Oceania', 'OC', '+672', 'AUD', '$', 'NFK', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(167, 'MP', 'Northern Mariana Islands', 'Saipan', 'Oceania', 'OC', '+1670', 'USD', '$', 'MNP', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(168, 'NO', 'Norway', 'Oslo', 'Europe', 'EU', '+47', 'NOK', 'kr', 'NOR', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(169, 'OM', 'Oman', 'Muscat', 'Asia', 'AS', '+968', 'OMR', '.ع.ر', 'OMN', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(170, 'PK', 'Pakistan', 'Islamabad', 'Asia', 'AS', '+92', 'PKR', '₨', 'PAK', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(171, 'PW', 'Palau', 'Melekeok', 'Oceania', 'OC', '+680', 'USD', '$', 'PLW', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(172, 'PS', 'Palestinian Territory, Occupied', 'East Jerusalem', 'Asia', 'AS', '+970', 'ILS', '₪', 'PSE', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(173, 'PA', 'Panama', 'Panama City', 'North America', 'NA', '+507', 'PAB', 'B/.', 'PAN', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(174, 'PG', 'Papua New Guinea', 'Port Moresby', 'Oceania', 'OC', '+675', 'PGK', 'K', 'PNG', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(175, 'PY', 'Paraguay', 'Asuncion', 'South America', 'SA', '+595', 'PYG', '₲', 'PRY', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(176, 'PE', 'Peru', 'Lima', 'South America', 'SA', '+51', 'PEN', 'S/.', 'PER', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(177, 'PH', 'Philippines', 'Manila', 'Asia', 'AS', '+63', 'PHP', '₱', 'PHL', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(178, 'PN', 'Pitcairn', 'Adamstown', 'Oceania', 'OC', '+64', 'NZD', '$', 'PCN', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(179, 'PL', 'Poland', 'Warsaw', 'Europe', 'EU', '+48', 'PLN', 'zł', 'POL', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(180, 'PT', 'Portugal', 'Lisbon', 'Europe', 'EU', '+351', 'EUR', '€', 'PRT', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(181, 'PR', 'Puerto Rico', 'San Juan', 'North America', 'NA', '+1787', 'USD', '$', 'PRI', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(182, 'QA', 'Qatar', 'Doha', 'Asia', 'AS', '+974', 'QAR', 'ق.ر', 'QAT', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(183, 'RE', 'Reunion', 'Saint-Denis', 'Africa', 'AF', '+262', 'EUR', '€', 'REU', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(184, 'RO', 'Romania', 'Bucharest', 'Europe', 'EU', '+40', 'RON', 'lei', 'ROM', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(185, 'RU', 'Russian Federation', 'Moscow', 'Asia', 'AS', '+70', 'RUB', '₽', 'RUS', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(186, 'RW', 'Rwanda', 'Kigali', 'Africa', 'AF', '+250', 'RWF', 'FRw', 'RWA', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(187, 'BL', 'Saint Barthelemy', 'Gustavia', 'North America', 'NA', '+590', 'EUR', '€', 'BLM', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(188, 'SH', 'Saint Helena', 'Jamestown', 'Africa', 'AF', '+290', 'SHP', '£', 'SHN', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(189, 'KN', 'Saint Kitts and Nevis', 'Basseterre', 'North America', 'NA', '+1869', 'XCD', '$', 'KNA', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(190, 'LC', 'Saint Lucia', 'Castries', 'North America', 'NA', '+1758', 'XCD', '$', 'LCA', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(191, 'MF', 'Saint Martin', 'Marigot', 'North America', 'NA', '+590', 'EUR', '€', 'MAF', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(192, 'PM', 'Saint Pierre and Miquelon', 'Saint-Pierre', 'North America', 'NA', '+508', 'EUR', '€', 'SPM', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(193, 'VC', 'Saint Vincent and the Grenadines', 'Kingstown', 'North America', 'NA', '+1784', 'XCD', '$', 'VCT', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(194, 'WS', 'Samoa', 'Apia', 'Oceania', 'OC', '+684', 'WST', 'SAT', 'WSM', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(195, 'SM', 'San Marino', 'San Marino', 'Europe', 'EU', '+378', 'EUR', '€', 'SMR', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(196, 'ST', 'Sao Tome and Principe', 'Sao Tome', 'Africa', 'AF', '+239', 'STD', 'Db', 'STP', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(197, 'SA', 'Saudi Arabia', 'Riyadh', 'Asia', 'AS', '+966', 'SAR', '﷼', 'SAU', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(198, 'SN', 'Senegal', 'Dakar', 'Africa', 'AF', '+221', 'XOF', 'CFA', 'SEN', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(199, 'RS', 'Serbia', 'Belgrade', 'Europe', 'EU', '+381', 'RSD', 'din', 'SRB', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(200, 'CS', 'Serbia and Montenegro', 'Belgrade', 'Europe', 'EU', '+381', 'RSD', 'din', 'SCG', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(201, 'SC', 'Seychelles', 'Victoria', 'Africa', 'AF', '+248', 'SCR', 'SRe', 'SYC', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(202, 'SL', 'Sierra Leone', 'Freetown', 'Africa', 'AF', '+232', 'SLL', 'Le', 'SLE', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(203, 'SG', 'Singapore', 'Singapur', 'Asia', 'AS', '+65', 'SGD', '$', 'SGP', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(204, 'SX', 'Sint Maarten', 'Philipsburg', 'North America', 'NA', '+1', 'ANG', 'ƒ', 'SXM', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(205, 'SK', 'Slovakia', 'Bratislava', 'Europe', 'EU', '+421', 'EUR', '€', 'SVK', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(206, 'SI', 'Slovenia', 'Ljubljana', 'Europe', 'EU', '+386', 'EUR', '€', 'SVN', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(207, 'SB', 'Solomon Islands', 'Honiara', 'Oceania', 'OC', '+677', 'SBD', 'Si$', 'SLB', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(208, 'SO', 'Somalia', 'Mogadishu', 'Africa', 'AF', '+252', 'SOS', 'Sh.so.', 'SOM', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(209, 'ZA', 'South Africa', 'Pretoria', 'Africa', 'AF', '+27', 'ZAR', 'R', 'ZAF', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(210, 'GS', 'South Georgia and the South Sandwich Islands', 'Grytviken', 'Antarctica', 'AN', '+500', 'GBP', '£', 'SGS', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(211, 'SS', 'South Sudan', 'Juba', 'Africa', 'AF', '+211', 'SSP', '£', 'SSD', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(212, 'ES', 'Spain', 'Madrid', 'Europe', 'EU', '+34', 'EUR', '€', 'ESP', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(213, 'LK', 'Sri Lanka', 'Colombo', 'Asia', 'AS', '+94', 'LKR', 'Rs', 'LKA', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(214, 'SD', 'Sudan', 'Khartoum', 'Africa', 'AF', '+249', 'SDG', '.س.ج', 'SDN', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(215, 'SR', 'Suriname', 'Paramaribo', 'South America', 'SA', '+597', 'SRD', '$', 'SUR', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(216, 'SJ', 'Svalbard and Jan Mayen', 'Longyearbyen', 'Europe', 'EU', '+47', 'NOK', 'kr', 'SJM', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(217, 'SZ', 'Swaziland', 'Mbabane', 'Africa', 'AF', '+268', 'SZL', 'E', 'SWZ', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(218, 'SE', 'Sweden', 'Stockholm', 'Europe', 'EU', '+46', 'SEK', 'kr', 'SWE', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(219, 'CH', 'Switzerland', 'Berne', 'Europe', 'EU', '+41', 'CHF', 'CHf', 'CHE', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(220, 'SY', 'Syrian Arab Republic', 'Damascus', 'Asia', 'AS', '+963', 'SYP', 'LS', 'SYR', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(221, 'TW', 'Taiwan, Province of China', 'Taipei', 'Asia', 'AS', '+886', 'TWD', '$', 'TWN', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(222, 'TJ', 'Tajikistan', 'Dushanbe', 'Asia', 'AS', '+992', 'TJS', 'SM', 'TJK', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(223, 'TZ', 'Tanzania, United Republic of', 'Dodoma', 'Africa', 'AF', '+255', 'TZS', 'TSh', 'TZA', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(224, 'TH', 'Thailand', 'Bangkok', 'Asia', 'AS', '+66', 'THB', '฿', 'THA', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(225, 'TL', 'Timor-Leste', 'Dili', 'Asia', 'AS', '+670', 'USD', '$', 'TLS', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(226, 'TG', 'Togo', 'Lome', 'Africa', 'AF', '+228', 'XOF', 'CFA', 'TGO', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(227, 'TK', 'Tokelau', NULL, 'Oceania', 'OC', '+690', 'NZD', '$', 'TKL', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(228, 'TO', 'Tonga', 'Nuku\'alofa', 'Oceania', 'OC', '+676', 'TOP', '$', 'TON', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(229, 'TT', 'Trinidad and Tobago', 'Port of Spain', 'North America', 'NA', '+1868', 'TTD', '$', 'TTO', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(230, 'TN', 'Tunisia', 'Tunis', 'Africa', 'AF', '+216', 'TND', 'ت.د', 'TUN', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(231, 'TR', 'Turkey', 'Ankara', 'Asia', 'AS', '+90', 'TRY', '₺', 'TUR', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(232, 'TM', 'Turkmenistan', 'Ashgabat', 'Asia', 'AS', '+7370', 'TMT', 'T', 'TKM', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(233, 'TC', 'Turks and Caicos Islands', 'Cockburn Town', 'North America', 'NA', '+1649', 'USD', '$', 'TCA', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(234, 'TV', 'Tuvalu', 'Funafuti', 'Oceania', 'OC', '+688', 'AUD', '$', 'TUV', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(235, 'UG', 'Uganda', 'Kampala', 'Africa', 'AF', '+256', 'UGX', 'USh', 'UGA', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(236, 'UA', 'Ukraine', 'Kiev', 'Europe', 'EU', '+380', 'UAH', '₴', 'UKR', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(237, 'AE', 'United Arab Emirates', 'Abu Dhabi', 'Asia', 'AS', '+971', 'AED', 'إ.د', 'ARE', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(238, 'GB', 'United Kingdom', 'London', 'Europe', 'EU', '+44', 'GBP', '£', 'GBR', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(239, 'US', 'United States', 'Washington', 'North America', 'NA', '+1', 'USD', '$', 'USA', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(240, 'UM', 'United States Minor Outlying Islands', NULL, 'North America', 'NA', '+1', 'USD', '$', 'UMI', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(241, 'UY', 'Uruguay', 'Montevideo', 'South America', 'SA', '+598', 'UYU', '$', 'URY', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(242, 'UZ', 'Uzbekistan', 'Tashkent', 'Asia', 'AS', '+998', 'UZS', 'лв', 'UZB', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(243, 'VU', 'Vanuatu', 'Port Vila', 'Oceania', 'OC', '+678', 'VUV', 'VT', 'VUT', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(244, 'VE', 'Venezuela', 'Caracas', 'South America', 'SA', '+58', 'VEF', 'Bs', 'VEN', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(245, 'VN', 'Viet Nam', 'Hanoi', 'Asia', 'AS', '+84', 'VND', '₫', 'VNM', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(246, 'VG', 'Virgin Islands, British', 'Road Town', 'North America', 'NA', '+1284', 'USD', '$', 'VGB', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(247, 'VI', 'Virgin Islands, U.s.', 'Charlotte Amalie', 'North America', 'NA', '+1340', 'USD', '$', 'VIR', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(248, 'WF', 'Wallis and Futuna', 'Mata Utu', 'Oceania', 'OC', '+681', 'XPF', '₣', 'WLF', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(249, 'EH', 'Western Sahara', 'El-Aaiun', 'Africa', 'AF', '+212', 'MAD', 'MAD', 'ESH', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(250, 'YE', 'Yemen', 'Sanaa', 'Asia', 'AS', '+967', 'YER', '﷼', 'YEM', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(251, 'ZM', 'Zambia', 'Lusaka', 'Africa', 'AF', '+260', 'ZMW', 'ZK', 'ZMB', '2021-11-03 22:07:16', '2021-11-04 15:59:30'),
(252, 'ZW', 'Zimbabwe', 'Harare', 'Africa', 'AF', '+263', 'ZWL', '$', 'ZWE', '2021-11-03 22:07:16', '2021-11-04 15:59:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(20) NOT NULL,
  `percentage` bigint(20) NOT NULL DEFAULT 1,
  `plan_id` bigint(20) UNSIGNED DEFAULT NULL,
  `action_type` tinyint(4) NOT NULL,
  `limit` bigint(20) NOT NULL DEFAULT 1,
  `expiry_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `extensions`
--

CREATE TABLE `extensions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `symbol` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `credentials` longtext NOT NULL,
  `instructions` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:Disabled 1:Enabled',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `extensions`
--

INSERT INTO `extensions` (`id`, `name`, `symbol`, `logo`, `credentials`, `instructions`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Google reCAPTCHA', 'google_recaptcha', 'images/extensions/google-recaptcha.png', '{\"site_key\":null,\"secret_key\":null}', NULL, 0, '2022-02-23 20:40:12', '2022-08-06 17:18:44'),
(2, 'Google Analytics', 'google_analytics', 'images/extensions/google-analytics.png', '{\"tracking_id\":null}', NULL, 0, '2022-02-23 20:40:12', '2022-02-23 22:10:57'),
(3, 'Tawk.to', 'tawk_to', 'images/extensions/tawk-to.png', '{\"api_key\":null}', NULL, 0, '2022-02-23 20:40:12', '2022-02-23 22:17:33'),
(4, 'Facebook OAuth', 'facebook_oauth', 'images/extensions/facebook-oauth.png', '{\"client_id\":null,\"client_secret\":null}', '<ul class=\"mb-0\"> \r\n<li><strong>Redirect URL :</strong> [URL]/login/facebook/callback</li> \r\n</ul>', 0, '2022-02-23 20:40:12', '2022-04-11 01:06:57');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
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
-- Estructura de tabla para la tabla `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lang` varchar(3) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `faqs`
--

INSERT INTO `faqs` (`id`, `lang`, `title`, `content`, `created_at`, `updated_at`) VALUES
(1, 'en', 'What is Lorem Ipsum?', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', '2022-07-31 00:12:40', '2022-07-31 00:12:40'),
(2, 'en', 'Why do we use it?', '<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>', '2022-07-31 00:12:58', '2022-07-31 00:12:58'),
(3, 'en', 'Where does it come from?', '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p>\r\n\r\n<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from &quot;de Finibus Bonorum et Malorum&quot; by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', '2022-07-31 00:13:17', '2022-07-31 00:13:17'),
(4, 'en', 'Where can I get some?', '<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#39;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#39;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>', '2022-07-31 00:13:32', '2022-07-31 00:13:32');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `features`
--

CREATE TABLE `features` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lang` varchar(3) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `features`
--

INSERT INTO `features` (`id`, `lang`, `title`, `image`, `content`, `created_at`, `updated_at`) VALUES
(1, 'en', 'Multiple Uploads', 'images/others/features/I0w744R95TQ83ol_1659229620.png', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry lorem Ipsum has been the industry\'s', '2022-07-31 00:07:00', '2022-07-31 00:07:00'),
(2, 'en', 'Transfer by E-Mail', 'images/others/features/cMPo5qzHHy3S6YN_1659229688.png', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry lorem Ipsum has been the industry\'s', '2022-07-31 00:08:08', '2022-07-31 00:08:08'),
(3, 'en', 'Generate Links', 'images/others/features/HxUV3kRZgbemqJU_1659229721.png', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry lorem Ipsum has been the industry\'s', '2022-07-31 00:08:42', '2022-07-31 00:08:42'),
(4, 'en', 'Track Transfers', 'images/others/features/SrSRmiUUK1MkEgH_1659229836.png', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry lorem Ipsum has been the industry\'s', '2022-07-31 00:10:36', '2022-07-31 00:10:36'),
(5, 'en', 'Get Notified', 'images/others/features/SKiYOueF8kH06ds_1659229876.png', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry lorem Ipsum has been the industry\'s', '2022-07-31 00:11:16', '2022-07-31 00:11:16'),
(6, 'en', 'Manage Transfers', 'images/others/features/8RWulqjkFoj2ONW_1659229912.png', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry lorem Ipsum has been the industry\'s', '2022-07-31 00:11:52', '2022-07-31 00:11:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `footer_menu`
--

CREATE TABLE `footer_menu` (
  `id` int(10) UNSIGNED NOT NULL,
  `lang` varchar(3) NOT NULL,
  `name` varchar(100) NOT NULL,
  `link` text NOT NULL,
  `sort_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `footer_menu`
--

INSERT INTO `footer_menu` (`id`, `lang`, `name`, `link`, `sort_id`, `created_at`, `updated_at`) VALUES
(1, 'en', 'Privacy policy', '/privacy-policy', 1, '2024-05-23 10:46:02', '2024-05-23 10:46:02'),
(2, 'en', 'Terms of use', '/terms-of-use', 2, '2024-05-23 10:46:14', '2024-05-23 10:46:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(250) NOT NULL,
  `native` varchar(150) NOT NULL,
  `code` varchar(3) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `languages`
--

INSERT INTO `languages` (`id`, `name`, `native`, `code`, `created_at`, `updated_at`) VALUES
(1, 'English', 'English', 'en', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(3, 'Spanish', 'Spanish', 'es', '2025-07-09 10:38:27', '2025-07-09 11:29:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mail_templates`
--

CREATE TABLE `mail_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lang` varchar(3) NOT NULL,
  `group_name` varchar(255) NOT NULL,
  `key` text NOT NULL,
  `value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `mail_templates`
--

INSERT INTO `mail_templates` (`id`, `lang`, `group_name`, `key`, `value`, `created_at`, `updated_at`) VALUES
(2, 'en', 'reset password notification', 'Reset Password Notification', 'Reset Password Notification', '2022-04-04 02:33:49', '2022-04-05 04:58:29'),
(3, 'en', 'reset password notification', 'Hello!', 'Hello!', '2022-04-04 02:33:49', '2022-04-04 04:58:20'),
(4, 'en', 'reset password notification', 'You are receiving this email because we received a password reset request for your account.', 'You are receiving this email because we received a password reset request for your account.', '2022-04-04 02:33:49', '2022-04-04 02:33:49'),
(5, 'en', 'reset password notification', 'Reset Password', 'Reset Password', '2022-04-04 02:33:49', '2022-04-04 02:33:49'),
(6, 'en', 'reset password notification', 'This password reset link will expire in {time} minutes.', 'This password reset link will expire in {time} minutes.', '2022-04-04 02:33:49', '2022-04-04 02:33:49'),
(7, 'en', 'reset password notification', 'If you did not request a password reset, no further action is required.', 'If you did not request a password reset, no further action is required.', '2022-04-04 02:33:49', '2022-04-04 02:33:49'),
(8, 'en', 'reset password notification', 'Regards', 'Regards', '2022-04-04 02:33:49', '2022-04-04 02:33:49'),
(9, 'en', 'reset password notification', 'If you are having trouble clicking the button, just copy and paste the URL below into your web browser', 'If you are having trouble clicking the button, just copy and paste the URL below into your web browser', '2022-04-04 02:33:49', '2022-04-04 02:33:49'),
(11, 'en', 'email verification notification', 'Verify Email Address', 'Verify Email Address', '2022-04-04 02:36:11', '2022-04-04 02:36:47'),
(12, 'en', 'email verification notification', 'Hello!', 'Hello!', '2022-04-04 02:36:11', '2022-04-04 02:36:11'),
(13, 'en', 'email verification notification', 'Please click the button below to verify your email address.', 'Please click the button below to verify your email address.', '2022-04-04 02:36:11', '2022-04-04 02:36:11'),
(14, 'en', 'email verification notification', 'Verify My Email', 'Verify My Email', '2022-04-04 02:36:11', '2022-04-04 02:36:11'),
(15, 'en', 'email verification notification', 'If you did not create an account, no further action is required.', 'If you did not create an account, no further action is required.', '2022-04-04 02:36:11', '2022-04-04 02:36:11'),
(23, 'en', 'email verification notification', 'If you are having trouble clicking the button, just copy and paste the URL below into your web browser', 'If you are having trouble clicking the button, just copy and paste the URL below into your web browser', '2022-04-04 02:36:11', '2022-04-04 02:36:11'),
(31, 'en', 'new ticket created notification', 'New Ticket Created {ticket_number}', 'New Ticket Created {ticket_number}', '2022-04-04 03:01:51', '2022-04-04 03:01:51'),
(32, 'en', 'new ticket created notification', 'Hello!', 'Hello!', '2022-04-04 03:01:51', '2022-04-04 03:01:51'),
(33, 'en', 'new ticket created notification', 'You are receiving this message because you had a new ticket opened by our support team you can click here to view it directly.', 'You are receiving this message because you had a new ticket opened by our support team you can click here to view it directly.', '2022-04-04 03:01:51', '2022-04-04 03:01:51'),
(34, 'en', 'new ticket created notification', 'View Ticket', 'View Ticket', '2022-04-04 03:01:51', '2022-04-04 03:01:51'),
(35, 'en', 'new ticket created notification', 'You can reply directly on the ticket by going to your account then my tickets.', 'You can reply directly on the ticket by going to your account then my tickets.', '2022-04-04 03:01:51', '2022-04-04 03:01:51'),
(36, 'en', 'new ticket created notification', 'Regards', 'Regards', '2022-04-04 03:01:51', '2022-04-04 03:01:51'),
(37, 'en', 'new ticket created notification', 'If you are having trouble clicking the button, just copy and paste the URL below into your web browser', 'If you are having trouble clicking the button, just copy and paste the URL below into your web browser', '2022-04-04 03:01:51', '2022-04-04 03:01:51'),
(39, 'en', 'ticket reply notification', 'Ticket {ticket_number} New Reply', 'Ticket {ticket_number} New Reply', '2022-04-04 03:02:33', '2022-04-04 03:02:33'),
(40, 'en', 'ticket reply notification', 'Hello!', 'Hello!', '2022-04-04 03:02:33', '2022-04-04 03:02:33'),
(41, 'en', 'ticket reply notification', 'You are receiving this message because you had a ticket open and there is a new reply on it you can click here to view it directly.', 'You are receiving this message because you had a ticket open and there is a new reply on it you can click here to view it directly.', '2022-04-04 03:02:33', '2022-04-04 03:02:33'),
(42, 'en', 'ticket reply notification', 'View Ticket', 'View Ticket', '2022-04-04 03:02:33', '2022-04-04 03:02:33'),
(43, 'en', 'ticket reply notification', 'You can reply directly on the ticket by going to your account then my tickets.', 'You can reply directly on the ticket by going to your account then my tickets.', '2022-04-04 03:02:33', '2022-04-04 03:02:33'),
(44, 'en', 'ticket reply notification', 'Regards', 'Regards', '2022-04-04 03:02:33', '2022-04-04 03:02:33'),
(45, 'en', 'ticket reply notification', 'If you are having trouble clicking the button, just copy and paste the URL below into your web browser', 'If you are having trouble clicking the button, just copy and paste the URL below into your web browser', '2022-04-04 03:02:33', '2022-04-04 03:02:33'),
(47, 'en', 'free subscription renewal notification', 'Your free subscription has been renewed', 'Your free subscription has been renewed', '2022-04-04 03:06:35', '2022-04-04 03:06:35'),
(48, 'en', 'free subscription renewal notification', 'Hi {user_firstname},', 'Hi {user_firstname},', '2022-04-04 03:06:35', '2022-04-04 03:06:35'),
(49, 'en', 'free subscription renewal notification', 'Great news! Your free subscription has officially been renewed. The following email is just to inform you that you can start using your subscription from now.Happy Transfer :)', 'Great news! Your free subscription has officially been renewed. The following email is just to inform you that you can start using your subscription from now.Happy Transfer :)', '2022-04-04 03:06:35', '2022-04-04 03:06:35'),
(50, 'en', 'free subscription renewal notification', 'Start Transferring files', 'Start Transferring files', '2022-04-04 03:06:35', '2022-04-04 03:06:35'),
(51, 'en', 'free subscription renewal notification', 'You are receiving this email because you have an account in {website_name} If you get this email by mistake, no further action is required.', 'You are receiving this email because you have an account in {website_name} If you get this email by mistake, no further action is required.', '2022-04-04 03:06:35', '2022-04-04 03:06:35'),
(52, 'en', 'free subscription renewal notification', 'Regards', 'Regards', '2022-04-04 03:06:35', '2022-04-04 03:06:35'),
(53, 'en', 'free subscription renewal notification', 'If you are having trouble clicking the button, just copy and paste the URL below into your web browser', 'If you are having trouble clicking the button, just copy and paste the URL below into your web browser', '2022-04-04 03:06:35', '2022-04-04 03:06:35'),
(83, 'en', 'subscription renewal reminder notification', 'RENEWAL NOTICE: Your subscription is expiring soon', 'RENEWAL NOTICE: Your subscription is expiring soon', '2022-04-04 03:46:59', '2022-04-04 03:46:59'),
(84, 'en', 'subscription renewal reminder notification', 'Hi {user_firstname},', 'Hi {user_firstname},', '2022-04-04 03:46:59', '2022-04-04 03:46:59'),
(85, 'en', 'subscription renewal reminder notification', 'Your subscription is about to expiry on {expiry_date}, please renew it before it gets expiry to avoid lost your files.', 'Your subscription is about to expiry on {expiry_date}, please renew it before it gets expiry to avoid lost your files.', '2022-04-04 03:46:59', '2022-04-04 03:46:59'),
(86, 'en', 'subscription renewal reminder notification', 'Renew Now', 'Renew Now', '2022-04-04 03:46:59', '2022-04-04 03:46:59'),
(87, 'en', 'subscription renewal reminder notification', 'Your Subscription Details', 'Your Subscription Details', '2022-04-04 03:46:59', '2022-04-04 03:46:59'),
(88, 'en', 'subscription renewal reminder notification', 'Plan name', 'Plan name', '2022-04-04 03:46:59', '2022-04-04 03:46:59'),
(89, 'en', 'subscription renewal reminder notification', 'Interval', 'Interval', '2022-04-04 03:46:59', '2022-04-04 03:46:59'),
(90, 'en', 'subscription renewal reminder notification', 'Price', 'Price', '2022-04-04 03:46:59', '2022-04-04 03:46:59'),
(91, 'en', 'subscription renewal reminder notification', 'Not ready to renew? No problem. We\'ll remind you closer to the expiry date, so you don\'t miss the deadline.', 'Not ready to renew? No problem. We\'ll remind you closer to the expiry date, so you don\'t miss the deadline.', '2022-04-04 03:46:59', '2022-04-04 03:46:59'),
(92, 'en', 'subscription renewal reminder notification', 'Regards', 'Regards', '2022-04-04 03:46:59', '2022-04-04 03:46:59'),
(93, 'en', 'subscription renewal reminder notification', 'If you are having trouble clicking the button, just copy and paste the URL below into your web browser', 'If you are having trouble clicking the button, just copy and paste the URL below into your web browser', '2022-04-04 03:46:59', '2022-04-04 03:46:59'),
(94, 'en', 'subscription expiry notification', 'EXPIRY NOTICE: Your subscription has been expired', 'EXPIRY NOTICE: Your subscription has been expired', '2022-04-04 03:58:44', '2022-04-04 04:55:49'),
(95, 'en', 'subscription expiry notification', 'Hi {user_firstname},', 'Hi {user_firstname},', '2022-04-04 03:58:44', '2022-04-04 03:58:44'),
(96, 'en', 'subscription expiry notification', 'Your subscription has been expired, and we are about deleting your files, if you did not renew the subscription after {delete_interval} from now.', 'Your subscription has been expired, and we are about deleting your files, if you did not renew the subscription after {delete_interval} from now.', '2022-04-04 03:58:44', '2022-04-04 03:58:44'),
(97, 'en', 'subscription expiry notification', 'Renew Now', 'Renew Now', '2022-04-04 03:58:44', '2022-04-04 03:58:44'),
(98, 'en', 'subscription expiry notification', 'Your Subscription Details', 'Your Subscription Details', '2022-04-04 03:58:44', '2022-04-04 03:58:44'),
(99, 'en', 'subscription expiry notification', 'Plan name', 'Plan name', '2022-04-04 03:58:44', '2022-04-04 03:58:44'),
(100, 'en', 'subscription expiry notification', 'Interval', 'Interval', '2022-04-04 03:58:44', '2022-04-04 03:58:44'),
(101, 'en', 'subscription expiry notification', 'Price', 'Price', '2022-04-04 03:58:44', '2022-04-04 03:58:44'),
(102, 'en', 'subscription expiry notification', 'You are receiving this email because you have an account in {website_name} If you get this email by mistake, no further action is required.', 'You are receiving this email because you have an account in {website_name} If you get this email by mistake, no further action is required.', '2022-04-04 03:58:44', '2022-04-04 03:58:44'),
(103, 'en', 'subscription expiry notification', 'Regards', 'Regards', '2022-04-04 03:58:44', '2022-04-04 03:58:44'),
(104, 'en', 'subscription expiry notification', 'If you are having trouble clicking the button, just copy and paste the URL below into your web browser', 'If you are having trouble clicking the button, just copy and paste the URL below into your web browser', '2022-04-04 03:58:44', '2022-04-04 03:58:44'),
(105, 'en', 'transfer files notification', 'You have received some files', 'You have received some files', '2022-04-04 21:15:42', '2022-04-04 21:15:42'),
(106, 'en', 'transfer files notification', 'Hello!', 'Hello!', '2022-04-04 21:15:42', '2022-04-04 21:15:42'),
(107, 'en', 'transfer files notification', 'You just received some files sent to you via {website_name}', 'You just received some files sent to you via {website_name}', '2022-04-04 21:15:42', '2022-04-04 21:15:42'),
(108, 'en', 'transfer files notification', 'Details', 'Details', '2022-04-04 21:15:42', '2022-04-04 21:15:42'),
(109, 'en', 'transfer files notification', 'Sent by', 'Sent by', '2022-04-04 21:15:42', '2022-04-04 21:15:42'),
(110, 'en', 'transfer files notification', 'Password', 'Password', '2022-04-04 21:15:42', '2022-04-04 21:15:42'),
(111, 'en', 'transfer files notification', 'Total files', 'Total files', '2022-04-04 21:15:42', '2022-04-04 21:15:42'),
(112, 'en', 'transfer files notification', 'Total files size', 'Total files size', '2022-04-04 21:15:42', '2022-04-04 21:15:42'),
(113, 'en', 'transfer files notification', 'Files available until', 'Files available until', '2022-04-04 21:15:42', '2022-04-04 21:15:42'),
(114, 'en', 'transfer files notification', 'Download', 'Download', '2022-04-04 21:15:42', '2022-04-04 21:15:42'),
(115, 'en', 'transfer files notification', 'Transferred files', 'Transferred files', '2022-04-04 21:15:42', '2022-04-04 21:15:42'),
(116, 'en', 'transfer files notification', 'These files are sent through our online service, and you can learn more by visiting our website directly {website_name}, Our website does not bear responsibility for your downloading these files or the way you use them.', 'These files are sent through our online service, and you can learn more by visiting our website directly {website_name}, Our website does not bear responsibility for your downloading these files or the way you use them.', '2022-04-04 21:15:42', '2022-04-04 21:15:42'),
(117, 'en', 'transfer files notification', 'Regards', 'Regards', '2022-04-04 21:15:42', '2022-04-04 21:15:42'),
(118, 'en', 'transfer files notification', 'If you\'re having trouble clicking the button, just copy and paste the URL below into your web browser', 'If you\'re having trouble clicking the button, just copy and paste the URL below into your web browser', '2022-04-04 21:15:42', '2022-04-04 21:15:42'),
(119, 'en', 'transfer cancellation notification', 'Your transfer has been canceled {transfer_number}', 'Your transfer has been canceled {transfer_number}', '2022-04-04 21:26:27', '2022-04-04 21:26:27'),
(120, 'en', 'transfer cancellation notification', 'Hello!', 'Hello!', '2022-04-04 21:26:27', '2022-04-04 21:26:27'),
(121, 'en', 'transfer cancellation notification', 'Your transfer on {website_name} has been canceled', 'Your transfer on {website_name} has been canceled', '2022-04-04 21:26:27', '2022-04-04 21:26:27'),
(122, 'en', 'transfer cancellation notification', 'Details', 'Details', '2022-04-04 21:26:27', '2022-04-04 21:26:27'),
(123, 'en', 'transfer cancellation notification', 'Transfer number', 'Transfer number', '2022-04-04 21:26:27', '2022-04-04 21:26:27'),
(124, 'en', 'transfer cancellation notification', 'Subject', 'Subject', '2022-04-04 21:26:27', '2022-04-04 21:26:27'),
(125, 'en', 'transfer cancellation notification', 'Sent by', 'Sent by', '2022-04-04 21:26:27', '2022-04-04 21:26:27'),
(126, 'en', 'transfer cancellation notification', 'Total files', 'Total files', '2022-04-04 21:26:27', '2022-04-04 21:26:27'),
(127, 'en', 'transfer cancellation notification', 'Total files size', 'Total files size', '2022-04-04 21:26:27', '2022-04-04 21:26:27'),
(128, 'en', 'transfer cancellation notification', 'Reason for cancellation', 'Reason for cancellation', '2022-04-04 21:26:27', '2022-04-04 21:26:27'),
(129, 'en', 'transfer cancellation notification', 'View Transfer', 'View Transfer', '2022-04-04 21:26:27', '2022-04-04 21:26:27'),
(130, 'en', 'transfer cancellation notification', 'Transferred files', 'Transferred files', '2022-04-04 21:26:27', '2022-04-04 21:26:27'),
(131, 'en', 'transfer cancellation notification', 'To know more about the reason for canceling your transfer, please contact us with your transfer number {transfer_number}.', 'To know more about the reason for canceling your transfer, please contact us with your transfer number {transfer_number}.', '2022-04-04 21:26:27', '2022-04-04 21:26:27'),
(132, 'en', 'transfer cancellation notification', 'Regards', 'Regards', '2022-04-04 21:26:27', '2022-04-04 21:26:27'),
(158, 'en', 'transferred files downloaded notification', 'Your transferred files has been downloaded {transfer_number}', 'Your transferred files has been downloaded {transfer_number}', '2022-04-04 22:20:53', '2022-04-04 22:20:53'),
(159, 'en', 'transferred files downloaded notification', 'Hello!', 'Hello!', '2022-04-04 22:20:53', '2022-04-04 22:20:53'),
(160, 'en', 'transferred files downloaded notification', 'Your transferred files on {website_name} has been downloaded', 'Your transferred files on {website_name} has been downloaded', '2022-04-04 22:20:53', '2022-04-04 22:20:53'),
(161, 'en', 'transferred files downloaded notification', 'Details', 'Details', '2022-04-04 22:20:53', '2022-04-04 22:20:53'),
(162, 'en', 'transferred files downloaded notification', 'Transfer number', 'Transfer number', '2022-04-04 22:20:53', '2022-04-04 22:20:53'),
(163, 'en', 'transferred files downloaded notification', 'Subject', 'Subject', '2022-04-04 22:20:53', '2022-04-04 22:20:53'),
(164, 'en', 'transferred files downloaded notification', 'Sent by', 'Sent by', '2022-04-04 22:20:53', '2022-04-04 22:20:53'),
(165, 'en', 'transferred files downloaded notification', 'Total files', 'Total files', '2022-04-04 22:20:53', '2022-04-04 22:20:53'),
(166, 'en', 'transferred files downloaded notification', 'Total files size', 'Total files size', '2022-04-04 22:20:53', '2022-04-04 22:20:53'),
(167, 'en', 'transferred files downloaded notification', 'Files downloaded at', 'Files downloaded at', '2022-04-04 22:20:53', '2022-04-04 22:20:53'),
(168, 'en', 'transferred files downloaded notification', 'Files available until', 'Files available until', '2022-04-04 22:20:53', '2022-04-04 22:20:53'),
(169, 'en', 'transferred files downloaded notification', 'View Transfer', 'View Transfer', '2022-04-04 22:20:53', '2022-04-04 22:20:53'),
(170, 'en', 'transferred files downloaded notification', 'Transferred files', 'Transferred files', '2022-04-04 22:20:53', '2022-04-04 22:20:53'),
(171, 'en', 'transferred files downloaded notification', 'Regards', 'Regards', '2022-04-04 22:20:53', '2022-04-04 22:20:53'),
(172, 'en', 'transfer expired notification', 'Your transferred has been expired {transfer_number}', 'Your transferred has been expired {transfer_number}', '2022-04-04 22:42:33', '2022-04-04 22:42:33'),
(173, 'en', 'transfer expired notification', 'Hello!', 'Hello!', '2022-04-04 22:43:37', '2022-04-04 22:43:37'),
(174, 'en', 'transfer expired notification', 'Your transfer on {website_name} has been expired', 'Your transfer on {website_name} has been expired', '2022-04-04 22:43:37', '2022-04-04 22:43:37'),
(175, 'en', 'transfer expired notification', 'Details', 'Details', '2022-04-04 22:43:37', '2022-04-04 22:43:37'),
(176, 'en', 'transfer expired notification', 'Transfer number', 'Transfer number', '2022-04-04 22:43:37', '2022-04-04 22:43:37'),
(177, 'en', 'transfer expired notification', 'Subject', 'Subject', '2022-04-04 22:43:37', '2022-04-04 22:43:37'),
(178, 'en', 'transfer expired notification', 'Sent by', 'Sent by', '2022-04-04 22:43:37', '2022-04-04 22:43:37'),
(179, 'en', 'transfer expired notification', 'Total files', 'Total files', '2022-04-04 22:43:37', '2022-04-04 22:43:37'),
(180, 'en', 'transfer expired notification', 'Total files size', 'Total files size', '2022-04-04 22:43:37', '2022-04-04 22:43:37'),
(181, 'en', 'transfer expired notification', 'Files downloaded at', 'Files downloaded at', '2022-04-04 22:43:37', '2022-04-04 22:43:37'),
(182, 'en', 'transfer expired notification', 'View Transfer', 'View Transfer', '2022-04-04 22:43:37', '2022-04-04 22:43:37'),
(183, 'en', 'transfer expired notification', 'Transferred files', 'Transferred files', '2022-04-04 22:43:37', '2022-04-04 22:43:37'),
(184, 'en', 'transfer expired notification', 'Regards', 'Regards', '2022-04-04 22:43:37', '2022-04-04 22:43:37'),
(297, 'es', 'reset password notification', 'Reset Password Notification', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(298, 'es', 'reset password notification', 'Hello!', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(299, 'es', 'reset password notification', 'You are receiving this email because we received a password reset request for your account.', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(300, 'es', 'reset password notification', 'Reset Password', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(301, 'es', 'reset password notification', 'This password reset link will expire in {time} minutes.', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(302, 'es', 'reset password notification', 'If you did not request a password reset, no further action is required.', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(303, 'es', 'reset password notification', 'Regards', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(304, 'es', 'reset password notification', 'If you are having trouble clicking the button, just copy and paste the URL below into your web browser', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(305, 'es', 'email verification notification', 'Verify Email Address', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(306, 'es', 'email verification notification', 'Hello!', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(307, 'es', 'email verification notification', 'Please click the button below to verify your email address.', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(308, 'es', 'email verification notification', 'Verify My Email', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(309, 'es', 'email verification notification', 'If you did not create an account, no further action is required.', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(310, 'es', 'email verification notification', 'If you are having trouble clicking the button, just copy and paste the URL below into your web browser', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(311, 'es', 'new ticket created notification', 'New Ticket Created {ticket_number}', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(312, 'es', 'new ticket created notification', 'Hello!', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(313, 'es', 'new ticket created notification', 'You are receiving this message because you had a new ticket opened by our support team you can click here to view it directly.', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(314, 'es', 'new ticket created notification', 'View Ticket', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(315, 'es', 'new ticket created notification', 'You can reply directly on the ticket by going to your account then my tickets.', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(316, 'es', 'new ticket created notification', 'Regards', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(317, 'es', 'new ticket created notification', 'If you are having trouble clicking the button, just copy and paste the URL below into your web browser', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(318, 'es', 'ticket reply notification', 'Ticket {ticket_number} New Reply', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(319, 'es', 'ticket reply notification', 'Hello!', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(320, 'es', 'ticket reply notification', 'You are receiving this message because you had a ticket open and there is a new reply on it you can click here to view it directly.', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(321, 'es', 'ticket reply notification', 'View Ticket', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(322, 'es', 'ticket reply notification', 'You can reply directly on the ticket by going to your account then my tickets.', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(323, 'es', 'ticket reply notification', 'Regards', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(324, 'es', 'ticket reply notification', 'If you are having trouble clicking the button, just copy and paste the URL below into your web browser', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(325, 'es', 'free subscription renewal notification', 'Your free subscription has been renewed', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(326, 'es', 'free subscription renewal notification', 'Hi {user_firstname},', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(327, 'es', 'free subscription renewal notification', 'Great news! Your free subscription has officially been renewed. The following email is just to inform you that you can start using your subscription from now.Happy Transfer :)', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(328, 'es', 'free subscription renewal notification', 'Start Transferring files', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(329, 'es', 'free subscription renewal notification', 'You are receiving this email because you have an account in {website_name} If you get this email by mistake, no further action is required.', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(330, 'es', 'free subscription renewal notification', 'Regards', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(331, 'es', 'free subscription renewal notification', 'If you are having trouble clicking the button, just copy and paste the URL below into your web browser', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(332, 'es', 'subscription renewal reminder notification', 'RENEWAL NOTICE: Your subscription is expiring soon', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(333, 'es', 'subscription renewal reminder notification', 'Hi {user_firstname},', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(334, 'es', 'subscription renewal reminder notification', 'Your subscription is about to expiry on {expiry_date}, please renew it before it gets expiry to avoid lost your files.', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(335, 'es', 'subscription renewal reminder notification', 'Renew Now', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(336, 'es', 'subscription renewal reminder notification', 'Your Subscription Details', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(337, 'es', 'subscription renewal reminder notification', 'Plan name', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(338, 'es', 'subscription renewal reminder notification', 'Interval', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(339, 'es', 'subscription renewal reminder notification', 'Price', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(340, 'es', 'subscription renewal reminder notification', 'Not ready to renew? No problem. We\'ll remind you closer to the expiry date, so you don\'t miss the deadline.', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(341, 'es', 'subscription renewal reminder notification', 'Regards', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(342, 'es', 'subscription renewal reminder notification', 'If you are having trouble clicking the button, just copy and paste the URL below into your web browser', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(343, 'es', 'subscription expiry notification', 'EXPIRY NOTICE: Your subscription has been expired', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(344, 'es', 'subscription expiry notification', 'Hi {user_firstname},', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(345, 'es', 'subscription expiry notification', 'Your subscription has been expired, and we are about deleting your files, if you did not renew the subscription after {delete_interval} from now.', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(346, 'es', 'subscription expiry notification', 'Renew Now', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(347, 'es', 'subscription expiry notification', 'Your Subscription Details', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(348, 'es', 'subscription expiry notification', 'Plan name', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(349, 'es', 'subscription expiry notification', 'Interval', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(350, 'es', 'subscription expiry notification', 'Price', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(351, 'es', 'subscription expiry notification', 'You are receiving this email because you have an account in {website_name} If you get this email by mistake, no further action is required.', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(352, 'es', 'subscription expiry notification', 'Regards', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(353, 'es', 'subscription expiry notification', 'If you are having trouble clicking the button, just copy and paste the URL below into your web browser', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(354, 'es', 'transfer files notification', 'You have received some files', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(355, 'es', 'transfer files notification', 'Hello!', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(356, 'es', 'transfer files notification', 'You just received some files sent to you via {website_name}', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(357, 'es', 'transfer files notification', 'Details', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(358, 'es', 'transfer files notification', 'Sent by', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(359, 'es', 'transfer files notification', 'Password', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(360, 'es', 'transfer files notification', 'Total files', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(361, 'es', 'transfer files notification', 'Total files size', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(362, 'es', 'transfer files notification', 'Files available until', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(363, 'es', 'transfer files notification', 'Download', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(364, 'es', 'transfer files notification', 'Transferred files', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(365, 'es', 'transfer files notification', 'These files are sent through our online service, and you can learn more by visiting our website directly {website_name}, Our website does not bear responsibility for your downloading these files or the way you use them.', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(366, 'es', 'transfer files notification', 'Regards', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(367, 'es', 'transfer files notification', 'If you\'re having trouble clicking the button, just copy and paste the URL below into your web browser', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(368, 'es', 'transfer cancellation notification', 'Your transfer has been canceled {transfer_number}', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(369, 'es', 'transfer cancellation notification', 'Hello!', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(370, 'es', 'transfer cancellation notification', 'Your transfer on {website_name} has been canceled', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(371, 'es', 'transfer cancellation notification', 'Details', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(372, 'es', 'transfer cancellation notification', 'Transfer number', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(373, 'es', 'transfer cancellation notification', 'Subject', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(374, 'es', 'transfer cancellation notification', 'Sent by', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(375, 'es', 'transfer cancellation notification', 'Total files', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(376, 'es', 'transfer cancellation notification', 'Total files size', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(377, 'es', 'transfer cancellation notification', 'Reason for cancellation', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(378, 'es', 'transfer cancellation notification', 'View Transfer', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(379, 'es', 'transfer cancellation notification', 'Transferred files', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(380, 'es', 'transfer cancellation notification', 'To know more about the reason for canceling your transfer, please contact us with your transfer number {transfer_number}.', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(381, 'es', 'transfer cancellation notification', 'Regards', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(382, 'es', 'transferred files downloaded notification', 'Your transferred files has been downloaded {transfer_number}', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(383, 'es', 'transferred files downloaded notification', 'Hello!', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(384, 'es', 'transferred files downloaded notification', 'Your transferred files on {website_name} has been downloaded', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(385, 'es', 'transferred files downloaded notification', 'Details', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(386, 'es', 'transferred files downloaded notification', 'Transfer number', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(387, 'es', 'transferred files downloaded notification', 'Subject', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(388, 'es', 'transferred files downloaded notification', 'Sent by', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(389, 'es', 'transferred files downloaded notification', 'Total files', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(390, 'es', 'transferred files downloaded notification', 'Total files size', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(391, 'es', 'transferred files downloaded notification', 'Files downloaded at', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(392, 'es', 'transferred files downloaded notification', 'Files available until', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(393, 'es', 'transferred files downloaded notification', 'View Transfer', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(394, 'es', 'transferred files downloaded notification', 'Transferred files', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(395, 'es', 'transferred files downloaded notification', 'Regards', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(396, 'es', 'transfer expired notification', 'Your transferred has been expired {transfer_number}', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(397, 'es', 'transfer expired notification', 'Hello!', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(398, 'es', 'transfer expired notification', 'Your transfer on {website_name} has been expired', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(399, 'es', 'transfer expired notification', 'Details', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(400, 'es', 'transfer expired notification', 'Transfer number', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(401, 'es', 'transfer expired notification', 'Subject', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(402, 'es', 'transfer expired notification', 'Sent by', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(403, 'es', 'transfer expired notification', 'Total files', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(404, 'es', 'transfer expired notification', 'Total files size', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(405, 'es', 'transfer expired notification', 'Files downloaded at', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(406, 'es', 'transfer expired notification', 'View Transfer', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(407, 'es', 'transfer expired notification', 'Transferred files', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(408, 'es', 'transfer expired notification', 'Regards', NULL, '2025-07-09 10:38:28', '2025-07-09 10:38:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(2, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2021_10_03_223916_create_admins_table', 1),
(6, '2021_10_03_224118_create_admin_password_resets', 1),
(12, '2021_10_07_221832_create_settings_table', 4),
(15, '2021_10_13_195121_create_messages_table', 7),
(26, '2019_08_19_000000_create_failed_jobs_table', 8),
(27, '2021_10_14_230536_create_languages_table', 8),
(29, '2021_10_17_222714_create_additionals_table', 9),
(51, '2021_10_24_215104_create_seo_configurations_table', 11),
(52, '2021_10_15_212511_create_translates_table', 12),
(54, '2021_10_04_213420_create_pages_table', 14),
(55, '2021_10_06_201713_create_blog_categories_table', 14),
(56, '2021_10_06_201752_create_blog_articles_table', 14),
(62, '2021_11_03_225531_create_countries_table', 19),
(64, '2021_11_25_183407_add_columns_to_users_table', 21),
(65, '2014_10_12_000000_create_users_table', 22),
(66, '2021_10_20_204848_create_support_tickets_table', 22),
(67, '2021_10_20_204947_create_support_replies_table', 22),
(68, '2021_10_20_211900_create_support_attachments_table', 22),
(71, '2021_11_01_162229_create_user_logs_table', 23),
(73, '2021_12_01_100425_create_admin_notifications_table', 24),
(74, '2021_12_05_004428_create_user_notifications_table', 25),
(77, '2021_12_05_230539_create_social_providers_table', 26),
(82, '2021_12_28_203912_add_views_to_blog_categories_table', 29),
(83, '2021_12_28_203935_add_views_to_blog_articles_table', 29),
(84, '2021_12_28_204116_add_views_to_pages_table', 30),
(86, '2021_12_15_215308_create_footer_menu_table', 31),
(87, '2022_01_06_180145_create_blog_comments_table', 32),
(89, '2022_01_08_213840_create_payment_gateways_table', 34),
(92, '2021_10_28_191044_create_storage_providers_table', 36),
(93, '2022_02_23_213634_create_extensions_table', 37),
(94, '2022_01_12_214207_create_addons_table', 38),
(95, '2022_02_26_131252_create_faqs_table', 39),
(96, '2021_12_14_233352_create_navbar_menu_table', 40),
(99, '2022_02_28_193538_create_plans_table', 41),
(105, '2022_03_04_202348_create_subscriptions_table', 42),
(109, '2022_03_07_231527_create_taxes_table', 44),
(115, '2022_03_22_210122_create_transfers_table', 49),
(116, '2022_04_03_220038_create_mail_templates_table', 50),
(117, '2022_04_27_210604_create_slideshows_table', 51),
(118, '2022_05_09_170656_create_advertisements_table', 52),
(120, '2022_05_11_175131_create_coupons_table', 53),
(123, '2022_03_04_205910_create_transactions_table', 54),
(124, '2022_01_06_225055_create_features_table', 55),
(127, '2022_03_18_001216_create_uploads_table', 56),
(128, '2022_03_22_210123_create_transfer_files_table', 56);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `navbar_menu`
--

CREATE TABLE `navbar_menu` (
  `id` int(10) UNSIGNED NOT NULL,
  `page` tinyint(4) NOT NULL,
  `lang` varchar(3) NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `link` text NOT NULL,
  `sort_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `navbar_menu`
--

INSERT INTO `navbar_menu` (`id`, `page`, `lang`, `name`, `type`, `link`, `sort_id`, `created_at`, `updated_at`) VALUES
(1, 0, 'en', 'Home', 0, '/', 1, '2022-07-30 23:55:28', '2022-07-30 23:55:28'),
(2, 0, 'en', 'Features', 1, '#features', 2, '2022-07-30 23:55:46', '2022-07-30 23:55:46'),
(3, 0, 'en', 'Pricing', 1, '#prices', 3, '2022-07-30 23:56:04', '2022-07-30 23:56:04'),
(4, 0, 'en', 'Blog', 1, '#blog', 4, '2022-07-30 23:56:17', '2022-07-30 23:56:17'),
(5, 0, 'en', 'FAQ', 1, '#faq', 5, '2022-07-30 23:56:33', '2022-07-30 23:56:33'),
(7, 0, 'en', 'Contact Us', 1, '#contact', 6, '2025-07-09 14:19:15', '2025-07-09 14:19:15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lang` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `short_description` varchar(200) NOT NULL,
  `views` bigint(20) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pages`
--

INSERT INTO `pages` (`id`, `lang`, `title`, `slug`, `content`, `short_description`, `views`, `created_at`, `updated_at`) VALUES
(1, 'en', 'Privacy policy', 'privacy-policy', '<h4><strong>What is Lorem Ipsum?</strong></h4>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h4><strong>Where does it come from?</strong></h4>\r\n\r\n<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p>\r\n\r\n<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from &quot;de Finibus Bonorum et Malorum&quot; by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h4><strong>Why do we use it?</strong></h4>\r\n\r\n<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h4><strong>Where can I get some?</strong></h4>\r\n\r\n<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#39;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#39;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>', 'The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested', 4, '2022-07-31 17:19:22', '2024-05-23 10:46:16'),
(2, 'en', 'Terms of use', 'terms-of-use', '<h4><strong>What is Lorem Ipsum?</strong></h4>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h4><strong>Where does it come from?</strong></h4>\r\n\r\n<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p>\r\n\r\n<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from &quot;de Finibus Bonorum et Malorum&quot; by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h4><strong>Why do we use it?</strong></h4>\r\n\r\n<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h4><strong>Where can I get some?</strong></h4>\r\n\r\n<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#39;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#39;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 0, '2024-05-23 10:45:42', '2024-05-23 10:45:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payment_gateways`
--

CREATE TABLE `payment_gateways` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `symbol` varchar(100) NOT NULL,
  `handler` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `fees` int(11) NOT NULL DEFAULT 0 COMMENT '%',
  `min` double(10,2) NOT NULL,
  `test_mode` tinyint(1) DEFAULT NULL COMMENT 'null 0:Disbaled 1:Enabled',
  `credentials` text NOT NULL,
  `instructions` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0:Disabled 1:Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `payment_gateways`
--

INSERT INTO `payment_gateways` (`id`, `name`, `symbol`, `handler`, `logo`, `fees`, `min`, `test_mode`, `credentials`, `instructions`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Paypal', 'paypal_express', 'App\\Http\\Controllers\\Frontend\\Gateways\\PaypalExpressController', 'images/payments/l6yGIXyP6SbqTrA_1641691269.png', 0, 0.00, 0, '{\"client_id\":null,\"client_secret\":null}', '<ul class=\"mb-0\"> \r\n<li>You can get the Api Keys from : <a target=\"__blank\" href=\"https://developer.paypal.com/developer/applications/create\">https://developer.paypal.com/developer/applications/create</a>&nbsp;</li> \r\n</ul>', 0, '2022-01-08 21:05:29', '2022-08-06 17:21:43'),
(2, 'Stripe', 'stripe_checkout', 'App\\Http\\Controllers\\Frontend\\Gateways\\StripeCheckoutController', 'images/payments/uvoikzLBtydhsIQ_1646689633.png', 0, 0.50, NULL, '{\"publishable_key\":\"pk_test_51QY057H0wV1aqCez4yymfvW0NvI2c2KjKAATROUjLuqkg2AP1vyVnzJaMIltYhVQ82iOJBNXgZsUn32v15f71FLs00mIYcsqXW\",\"secret_key\":\"sk_test_51QY057H0wV1aqCezch7jtQHCsNf9QVDUJvE3MXOLk5iMN8JgmF3EV1SAJcIyNHQgqSGEsd6SAvQ2XMAiDDsW07ro00iKRcwCRT\"}', '<ul class=\"mb-0\"> <li>You can get the API keys from : <a target=\"__blank\" href=\"https://dashboard.stripe.com/apikeys\">https://dashboard.stripe.com/apikeys</a>&nbsp;</li>\r\n</ul>', 1, '2022-01-08 21:05:29', '2025-07-09 14:11:48');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plans`
--

CREATE TABLE `plans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(150) NOT NULL,
  `short_description` varchar(255) NOT NULL,
  `color` varchar(10) NOT NULL,
  `interval` tinyint(1) NOT NULL COMMENT '0:Monthly 1:Yearly 2:Lifetime',
  `price` double(10,2) NOT NULL,
  `auth` tinyint(1) NOT NULL COMMENT '0:Optional 1:Required',
  `storage_space` bigint(20) DEFAULT NULL,
  `transfer_size` bigint(20) DEFAULT NULL,
  `transfer_interval` bigint(20) DEFAULT NULL,
  `transfer_password` tinyint(1) NOT NULL COMMENT '0:No 1:Yes',
  `transfer_notify` tinyint(1) NOT NULL COMMENT '0:No 1:Yes',
  `transfer_expiry` tinyint(1) NOT NULL COMMENT '0:No 1:Yes',
  `transfer_link` tinyint(1) NOT NULL COMMENT '0:No 1:Yes',
  `advertisements` tinyint(1) NOT NULL COMMENT '	0:No 1:Yes',
  `custom_features` longtext DEFAULT NULL,
  `featured_plan` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `plans`
--

INSERT INTO `plans` (`id`, `name`, `short_description`, `color`, `interval`, `price`, `auth`, `storage_space`, `transfer_size`, `transfer_interval`, `transfer_password`, `transfer_notify`, `transfer_expiry`, `transfer_link`, `advertisements`, `custom_features`, `featured_plan`, `created_at`, `updated_at`) VALUES
(1, 'Gratis', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', '#9FAC25', 0, 0.00, 0, 1073741824, 104857600, 1, 1, 0, 0, 1, 1, NULL, 0, '2022-07-31 00:18:18', '2025-07-09 14:13:00'),
(2, 'Básico', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', '#0E5CC4', 0, 9.99, 1, 10737418240, 1073741824, 7, 1, 1, 0, 0, 1, NULL, 0, '2022-07-31 00:18:54', '2025-07-09 14:13:36'),
(3, 'Standard', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', '#F50AA6', 0, 29.99, 1, 53687091200, 10737418240, 30, 1, 1, 1, 0, 1, NULL, 1, '2022-07-31 00:19:54', '2022-07-31 00:19:54'),
(4, 'Premium', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', '#572AE7', 0, 99.99, 1, NULL, NULL, NULL, 1, 1, 1, 1, 0, NULL, 0, '2022-07-31 00:20:29', '2022-08-02 23:06:17'),
(5, 'Starter', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', '#9FAC25', 1, 1.99, 1, 1073741824, 104857600, 1, 1, 0, 0, 0, 1, NULL, 0, '2022-07-31 00:18:18', '2022-07-31 00:22:00'),
(6, 'Basic', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', '#0E5CC4', 1, 9.99, 1, 10737418240, 1073741824, 7, 1, 1, 0, 0, 1, NULL, 0, '2022-07-31 00:18:54', '2022-07-31 00:19:54'),
(7, 'Standard', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', '#F50AA6', 1, 29.99, 1, 53687091200, 10737418240, 30, 1, 1, 1, 0, 1, NULL, 1, '2022-07-31 00:19:54', '2022-07-31 00:19:54'),
(8, 'Premium', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', '#572AE7', 1, 99.99, 1, NULL, NULL, NULL, 1, 1, 1, 1, 0, NULL, 0, '2022-07-31 00:20:29', '2022-07-31 00:20:29'),
(9, 'Starter', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', '#9FAC25', 2, 1.99, 1, 1073741824, 104857600, 1, 1, 0, 0, 0, 1, NULL, 0, '2022-07-31 00:18:18', '2022-07-31 00:22:17'),
(10, 'Basic', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', '#0E5CC4', 2, 9.99, 1, 10737418240, 1073741824, 7, 1, 1, 0, 0, 1, NULL, 0, '2022-07-31 00:18:54', '2022-07-31 00:19:54'),
(11, 'Standard', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', '#F50AA6', 2, 29.99, 1, 53687091200, 10737418240, 30, 1, 1, 1, 0, 1, NULL, 1, '2022-07-31 00:19:54', '2022-07-31 00:19:54'),
(12, 'Premium', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', '#572AE7', 2, 99.99, 1, NULL, NULL, NULL, 1, 1, 1, 1, 0, NULL, 0, '2022-07-31 00:20:29', '2022-07-31 00:20:29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seo_configurations`
--

CREATE TABLE `seo_configurations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lang` varchar(3) NOT NULL,
  `title` varchar(70) NOT NULL,
  `description` varchar(150) NOT NULL,
  `keywords` varchar(255) NOT NULL,
  `robots_index` varchar(50) NOT NULL,
  `robots_follow_links` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`) VALUES
(1, 'website_name', 'Mango Archivos'),
(2, 'website_url', 'https://files.soymanuel.com'),
(3, 'website_dark_logo', 'images/dark-logo.png'),
(4, 'website_light_logo', 'images/light-logo.png'),
(5, 'website_favicon', 'images/favicon.png'),
(6, 'website_social_image', 'images/social-image.jpg'),
(7, 'website_primary_color', '#161C2D'),
(8, 'website_secondary_color', '#4259ED'),
(9, 'website_email_verify_status', '0'),
(10, 'website_registration_status', '1'),
(11, 'mail_status', '1'),
(12, 'mail_mailer', 'smtp'),
(13, 'mail_host', 'mail.smtp2go.com'),
(14, 'mail_port', '8025'),
(15, 'mail_username', 'files@soymanuel.com'),
(16, 'mail_password', 'EVt7Hrr6Egr0zlWx'),
(17, 'mail_encryption', 'tls'),
(18, 'mail_form_email', 'files@soymanuel.com'),
(19, 'mail_from_name', 'MagoArchivos'),
(25, 'contact_email', 'files@soymanuel.com'),
(34, 'terms_of_service_link', NULL),
(36, 'website_cookie', '0'),
(38, 'date_format', '14'),
(39, 'timezone', 'America/Guatemala'),
(40, 'website_force_ssl_status', '1'),
(45, 'website_blog_status', '1'),
(46, 'website_contact_form_status', '1'),
(47, 'website_currency', '5'),
(50, 'expired_subscriptions_data_delete', '30'),
(51, 'unaccepted_file_types', 'exe,php,json,html'),
(55, 'website_tickets_status', '1'),
(56, 'website_mail_logo', 'images/mail-logo.jpg'),
(57, 'website_mail_primary_color', '#5BBC2E'),
(58, 'website_mail_background_color', '#EDF2F7'),
(59, 'website_mail_normal_text_color', '#718096'),
(60, 'website_mail_bold_text_color', '#3D4852'),
(61, 'active_users_counter', '32413'),
(62, 'transferred_files_counter', '4565330'),
(63, 'daily_visitors_couner', '764680'),
(64, 'all_time_downloads_couner', '976432334'),
(65, 'counter_status', '1'),
(66, 'website_faq_status', '1'),
(67, 'website_file_icon_dark_color', '#4259ED'),
(68, 'website_file_icon_medium_color', '#5C6EE7'),
(69, 'website_file_icon_light_color', '#7C8BF1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `slideshows`
--

CREATE TABLE `slideshows` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '1:Image 2:Video',
  `source` tinyint(1) NOT NULL COMMENT '1:Upload 2:URL',
  `file` text NOT NULL,
  `duration` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `slideshows`
--

INSERT INTO `slideshows` (`id`, `type`, `source`, `file`, `duration`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'uploads/slideshow/5VQhme6RKNxc5RE_1752055220.jpg', 1, '2025-07-09 11:54:36', '2025-07-09 12:00:22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `social_providers`
--

CREATE TABLE `social_providers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `facebook` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `storage_providers`
--

CREATE TABLE `storage_providers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `symbol` varchar(255) NOT NULL,
  `handler` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `credentials` longtext NOT NULL,
  `instructions` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:Disabled 1:Enabled',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `storage_providers`
--

INSERT INTO `storage_providers` (`id`, `name`, `symbol`, `handler`, `logo`, `credentials`, `instructions`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Local Storage', 'local', 'App\\Http\\Controllers\\Frontend\\Storage\\LocalController', 'images/storage/local.png', '{}', NULL, 1, '2022-02-20 22:13:06', '2022-02-20 22:44:06'),
(2, 'Amazon S3', 's3', 'App\\Http\\Controllers\\Frontend\\Storage\\AmazonController', 'images/storage/amazon.png', '{\"access_key_id\":\"BPBT7AXZI03G4XZK3WEQ\",\"secret_access_key\":\"kjliDDGerLPB4gGvTVzj1O8LlfCLnFQe2klGsWfc\",\"default_region\":\"us-central-1\",\"bucket\":\"filesmgt\",\"url\":\"https:\\/\\/s3.us-central-1.wasabisys.com\"}', NULL, 0, '2022-02-20 22:12:55', '2025-07-09 16:56:46');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `plan_id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0:Disabled 1:Active',
  `expiry_at` timestamp NULL DEFAULT NULL,
  `read_status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `support_attachments`
--

CREATE TABLE `support_attachments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `support_reply_id` bigint(20) UNSIGNED NOT NULL,
  `attachment` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `support_replies`
--

CREATE TABLE `support_replies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `support_ticket_id` bigint(20) UNSIGNED NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ticket_number` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `subject` varchar(255) NOT NULL,
  `priority` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0: Normal, 1: Low , 2: High, 3: Urgent',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0: Opened, 1: Answered, 2: Replied, 3: Closed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `taxes`
--

CREATE TABLE `taxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_id` bigint(20) UNSIGNED DEFAULT NULL,
  `percentage` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `checkout_id` varchar(255) NOT NULL,
  `transaction_id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `plan_id` bigint(20) UNSIGNED NOT NULL,
  `coupon_id` bigint(20) UNSIGNED DEFAULT NULL,
  `details_before_discount` longtext NOT NULL,
  `details_after_discount` longtext DEFAULT NULL,
  `plan_price` double(10,2) NOT NULL,
  `tax_price` double(10,2) NOT NULL DEFAULT 0.00,
  `fees_price` double(10,2) NOT NULL DEFAULT 0.00,
  `total_price` double(10,2) NOT NULL,
  `payment_gateway_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_id` varchar(255) DEFAULT NULL,
  `payer_id` varchar(255) DEFAULT NULL,
  `payer_email` varchar(255) DEFAULT NULL,
  `type` tinyint(4) NOT NULL COMMENT '0:Subscribe 1:renew 2:Upgrade',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1:Pending 2:Paid 3:Canceled',
  `cancellation_reason` text DEFAULT NULL,
  `read_status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transfers`
--

CREATE TABLE `transfers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip` varchar(255) NOT NULL,
  `storage_provider_id` bigint(20) UNSIGNED NOT NULL,
  `unique_id` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `sender_email` varchar(255) NOT NULL,
  `sender_name` varchar(255) DEFAULT NULL,
  `emails` longtext DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `download_notify` tinyint(1) NOT NULL DEFAULT 0,
  `expiry_notify` tinyint(1) NOT NULL DEFAULT 0,
  `expiry_at` timestamp NULL DEFAULT NULL,
  `type` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `cancellation_reason` varchar(255) DEFAULT NULL,
  `downloaded_at` timestamp NULL DEFAULT NULL,
  `files_deleted_at` timestamp NULL DEFAULT NULL,
  `read_status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `transfers`
--

INSERT INTO `transfers` (`id`, `user_id`, `ip`, `storage_provider_id`, `unique_id`, `link`, `sender_email`, `sender_name`, `emails`, `subject`, `message`, `password`, `download_notify`, `expiry_notify`, `expiry_at`, `type`, `status`, `cancellation_reason`, `downloaded_at`, `files_deleted_at`, `read_status`, `created_at`, `updated_at`) VALUES
(1, NULL, '190.104.125.74', 1, 'A3F3THZPV4XCMBH2', 'q87pdOQUQo1fJE', 'msolis@mango.com.gt', NULL, NULL, NULL, NULL, NULL, 0, 0, '2025-07-10 16:57:28', 2, 1, NULL, NULL, NULL, 0, '2025-07-09 16:57:28', '2025-07-09 16:57:28'),
(2, NULL, '190.104.125.74', 1, '8C3TCF26U6JQ9RYW', 'om1BLYJ9oK2p5e', 'msolis@mango.com.gt', NULL, '{\"0\":\"memitoguate@gmail.com\"}', NULL, NULL, NULL, 0, 0, '2025-07-10 16:58:49', 1, 1, NULL, NULL, NULL, 0, '2025-07-09 16:58:50', '2025-07-09 16:58:50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transfer_files`
--

CREATE TABLE `transfer_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ip` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `transfer_id` bigint(20) UNSIGNED NOT NULL,
  `storage_provider_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `filename` varchar(255) NOT NULL,
  `mime` varchar(255) NOT NULL,
  `extension` varchar(255) NOT NULL,
  `size` varchar(255) NOT NULL,
  `path` text NOT NULL,
  `downloads` bigint(20) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `transfer_files`
--

INSERT INTO `transfer_files` (`id`, `ip`, `user_id`, `transfer_id`, `storage_provider_id`, `name`, `filename`, `mime`, `extension`, `size`, `path`, `downloads`, `created_at`, `updated_at`) VALUES
(1, '190.104.125.74', NULL, 1, 1, 'cloud-storage-background-business-network-design.jpg', 'wppEt7RVwOrhsTc_1752073024.jpg', 'image/jpeg', 'jpg', '3939151', 'anonymous/wppEt7RVwOrhsTc_1752073024.jpg', 0, '2025-07-09 16:57:28', '2025-07-09 16:57:28'),
(2, '190.104.125.74', NULL, 2, 1, 'home_background.jpg', '5ys3AvQYi9uBVhq_1752073101.jpg', 'image/jpeg', 'jpg', '95489', 'anonymous/5ys3AvQYi9uBVhq_1752073101.jpg', 0, '2025-07-09 16:58:50', '2025-07-09 16:58:50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `translates`
--

CREATE TABLE `translates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lang` varchar(3) NOT NULL,
  `group_name` varchar(255) NOT NULL DEFAULT 'general',
  `key` text NOT NULL,
  `value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `translates`
--

INSERT INTO `translates` (`id`, `lang`, `group_name`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1025, 'en', 'general', 'All rights reserved', 'All rights reserved', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1026, 'en', 'validation', 'The :attribute must be accepted.', 'The :attribute must be accepted.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1027, 'en', 'validation', 'The :attribute must be accepted when :other is :value.', 'The :attribute must be accepted when :other is :value.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1028, 'en', 'validation', 'The :attribute is not a valid URL.', 'The :attribute is not a valid URL.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1029, 'en', 'validation', 'The :attribute must be a date after :date.', 'The :attribute must be a date after :date.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1030, 'en', 'validation', 'The :attribute must be a date after or equal to :date.', 'The :attribute must be a date after or equal to :date.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1031, 'en', 'validation', 'The :attribute must only contain letters.', 'The :attribute must only contain letters.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1032, 'en', 'validation', 'The :attribute must only contain letters, numbers, dashes and underscores.', 'The :attribute must only contain letters, numbers, dashes and underscores.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1033, 'en', 'validation', 'The :attribute must only contain letters and numbers.', 'The :attribute must only contain letters and numbers.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1034, 'en', 'validation', 'The :attribute must be an array.', 'The :attribute must be an array.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1035, 'en', 'validation', 'The :attribute must be a date before :date.', 'The :attribute must be a date before :date.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1036, 'en', 'validation', 'The :attribute must be a date before or equal to :date.', 'The :attribute must be a date before or equal to :date.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1037, 'en', 'validation', 'The :attribute must be between :min and :max.', 'The :attribute must be between :min and :max.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1038, 'en', 'validation', 'The :attribute must be between :min and :max kilobytes.', 'The :attribute must be between :min and :max kilobytes.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1039, 'en', 'validation', 'The :attribute must be between :min and :max characters.', 'The :attribute must be between :min and :max characters.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1040, 'en', 'validation', 'The :attribute must have between :min and :max items.', 'The :attribute must have between :min and :max items.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1041, 'en', 'validation', 'The :attribute field must be true or false.', 'The :attribute field must be true or false.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1042, 'en', 'validation', 'The :attribute confirmation does not match.', 'The :attribute confirmation does not match.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1043, 'en', 'validation', 'The password is incorrect.', 'The password is incorrect.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1044, 'en', 'validation', 'The :attribute is not a valid date.', 'The :attribute is not a valid date.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1045, 'en', 'validation', 'The :attribute must be a date equal to :date.', 'The :attribute must be a date equal to :date.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1046, 'en', 'validation', 'The :attribute does not match the format :format.', 'The :attribute does not match the format :format.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1047, 'en', 'validation', 'The :attribute and :other must be different.', 'The :attribute and :other must be different.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1048, 'en', 'validation', 'The :attribute must be :digits digits.', 'The :attribute must be :digits digits.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1049, 'en', 'validation', 'The :attribute must be between :min and :max digits.', 'The :attribute must be between :min and :max digits.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1050, 'en', 'validation', 'The :attribute has invalid image dimensions.', 'The :attribute has invalid image dimensions.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1051, 'en', 'validation', 'The :attribute field has a duplicate value.', 'The :attribute field has a duplicate value.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1052, 'en', 'validation', 'The :attribute must be a valid email address.', 'The :attribute must be a valid email address.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1053, 'en', 'validation', 'The :attribute must end with one of the following: :values.', 'The :attribute must end with one of the following: :values.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1054, 'en', 'validation', 'The selected :attribute is invalid.', 'The selected :attribute is invalid.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1055, 'en', 'validation', 'The :attribute must be a file.', 'The :attribute must be a file.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1056, 'en', 'validation', 'The :attribute field must have a value.', 'The :attribute field must have a value.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1057, 'en', 'validation', 'The :attribute must be greater than :value.', 'The :attribute must be greater than :value.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1058, 'en', 'validation', 'The :attribute must be greater than :value kilobytes.', 'The :attribute must be greater than :value kilobytes.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1059, 'en', 'validation', 'The :attribute must be greater than :value characters.', 'The :attribute must be greater than :value characters.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1060, 'en', 'validation', 'The :attribute must have more than :value items.', 'The :attribute must have more than :value items.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1061, 'en', 'validation', 'The :attribute must be greater than or equal :value.', 'The :attribute must be greater than or equal :value.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1062, 'en', 'validation', 'The :attribute must be greater than or equal :value kilobytes.', 'The :attribute must be greater than or equal :value kilobytes.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1063, 'en', 'validation', 'The :attribute must be greater than or equal :value characters.', 'The :attribute must be greater than or equal :value characters.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1064, 'en', 'validation', 'The :attribute must have :value items or more.', 'The :attribute must have :value items or more.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1065, 'en', 'validation', 'The :attribute must be an image.', 'The :attribute must be an image.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1066, 'en', 'validation', 'The :attribute field does not exist in :other.', 'The :attribute field does not exist in :other.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1067, 'en', 'validation', 'The :attribute must be an integer.', 'The :attribute must be an integer.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1068, 'en', 'validation', 'The :attribute must be a valid IP address.', 'The :attribute must be a valid IP address.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1069, 'en', 'validation', 'The :attribute must be a valid IPv4 address.', 'The :attribute must be a valid IPv4 address.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1070, 'en', 'validation', 'The :attribute must be a valid IPv6 address.', 'The :attribute must be a valid IPv6 address.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1071, 'en', 'validation', 'The :attribute must be a valid JSON string.', 'The :attribute must be a valid JSON string.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1072, 'en', 'validation', 'The :attribute must be less than :value.', 'The :attribute must be less than :value.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1073, 'en', 'validation', 'The :attribute must be less than :value kilobytes.', 'The :attribute must be less than :value kilobytes.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1074, 'en', 'validation', 'The :attribute must be less than :value characters.', 'The :attribute must be less than :value characters.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1075, 'en', 'validation', 'The :attribute must have less than :value items.', 'The :attribute must have less than :value items.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1076, 'en', 'validation', 'The :attribute must be less than or equal :value.', 'The :attribute must be less than or equal :value.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1077, 'en', 'validation', 'The :attribute must be less than or equal :value kilobytes.', 'The :attribute must be less than or equal :value kilobytes.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1078, 'en', 'validation', 'The :attribute must be less than or equal :value characters.', 'The :attribute must be less than or equal :value characters.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1079, 'en', 'validation', 'The :attribute must not have more than :value items.', 'The :attribute must not have more than :value items.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1080, 'en', 'validation', 'The :attribute must not be greater than :max.', 'The :attribute must not be greater than :max.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1081, 'en', 'validation', 'The :attribute must not be greater than :max kilobytes.', 'The :attribute must not be greater than :max kilobytes.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1082, 'en', 'validation', 'The :attribute must not be greater than :max characters.', 'The :attribute must not be greater than :max characters.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1083, 'en', 'validation', 'The :attribute must not have more than :max items.', 'The :attribute must not have more than :max items.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1084, 'en', 'validation', 'The :attribute must be a file of type: :values.', 'The :attribute must be a file of type: :values.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1085, 'en', 'validation', 'The :attribute must be at least :min.', 'The :attribute must be at least :min.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1086, 'en', 'validation', 'The :attribute must be at least :min kilobytes.', 'The :attribute must be at least :min kilobytes.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1087, 'en', 'validation', 'The :attribute must be at least :min characters.', 'The :attribute must be at least :min characters.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1088, 'en', 'validation', 'The :attribute must have at least :min items.', 'The :attribute must have at least :min items.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1089, 'en', 'validation', 'The :attribute must be a multiple of :value.', 'The :attribute must be a multiple of :value.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1090, 'en', 'validation', 'The :attribute format is invalid.', 'The :attribute format is invalid.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1091, 'en', 'validation', 'The :attribute must be a number.', 'The :attribute must be a number.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1092, 'en', 'validation', 'The :attribute field must be present.', 'The :attribute field must be present.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1093, 'en', 'validation', 'The :attribute field is required.', 'The :attribute field is required.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1094, 'en', 'validation', 'The :attribute field is required when :other is :value.', 'The :attribute field is required when :other is :value.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1095, 'en', 'validation', 'The :attribute field is required unless :other is in :values.', 'The :attribute field is required unless :other is in :values.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1096, 'en', 'validation', 'The :attribute field is required when :values is present.', 'The :attribute field is required when :values is present.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1097, 'en', 'validation', 'The :attribute field is required when :values are present.', 'The :attribute field is required when :values are present.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1098, 'en', 'validation', 'The :attribute field is required when :values is not present.', 'The :attribute field is required when :values is not present.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1099, 'en', 'validation', 'The :attribute field is required when none of :values are present.', 'The :attribute field is required when none of :values are present.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1100, 'en', 'validation', 'The :attribute field is prohibited.', 'The :attribute field is prohibited.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1101, 'en', 'validation', 'The :attribute field is prohibited when :other is :value.', 'The :attribute field is prohibited when :other is :value.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1102, 'en', 'validation', 'The :attribute field is prohibited unless :other is in :values.', 'The :attribute field is prohibited unless :other is in :values.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1103, 'en', 'validation', 'The :attribute field prohibits :other from being present.', 'The :attribute field prohibits :other from being present.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1104, 'en', 'validation', 'The :attribute and :other must match.', 'The :attribute and :other must match.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1105, 'en', 'validation', 'The :attribute must be :size.', 'The :attribute must be :size.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1106, 'en', 'validation', 'The :attribute must be :size kilobytes.', 'The :attribute must be :size kilobytes.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1107, 'en', 'validation', 'The :attribute must be :size characters.', 'The :attribute must be :size characters.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1108, 'en', 'validation', 'The :attribute must contain :size items.', 'The :attribute must contain :size items.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1109, 'en', 'validation', 'The :attribute must start with one of the following: :values.', 'The :attribute must start with one of the following: :values.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1110, 'en', 'validation', 'The :attribute must be a string.', 'The :attribute must be a string.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1111, 'en', 'validation', 'The :attribute must be a valid timezone.', 'The :attribute must be a valid timezone.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1112, 'en', 'validation', 'The :attribute has already been taken.', 'The :attribute has already been taken.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1113, 'en', 'validation', 'The :attribute failed to upload.', 'The :attribute failed to upload.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1114, 'en', 'validation', 'The :attribute must be a valid URL.', 'The :attribute must be a valid URL.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1115, 'en', 'validation', 'The :attribute must be a valid UUID.', 'The :attribute must be a valid UUID.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1116, 'en', 'general', 'Previous', 'Previous', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1117, 'en', 'general', 'Next', 'Next', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1118, 'en', 'alerts', 'These credentials do not match our records.', 'These credentials do not match our records.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1119, 'en', 'alerts', 'The provided password is incorrect.', 'The provided password is incorrect.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1120, 'en', 'alerts', 'Too many login attempts. Please try again in :seconds seconds.', 'Too many login attempts. Please try again in :seconds seconds.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1121, 'en', 'alerts', 'Your password has been reset!', 'Your password has been reset!', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1122, 'en', 'alerts', 'We have emailed your password reset link!', 'We have emailed your password reset link!', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1123, 'en', 'alerts', 'Please wait before retrying.', 'Please wait before retrying.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1124, 'en', 'alerts', 'This password reset token is invalid.', 'This password reset token is invalid.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1125, 'en', 'alerts', 'We can\'t find a user with that email address.', 'We can\'t find a user with that email address.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1126, 'en', 'forms', 'captcha', 'captcha', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1127, 'en', 'tickets', 'Opened', 'Opened', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1128, 'en', 'tickets', 'Answered', 'Answered', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1129, 'en', 'tickets', 'Closed', 'Closed', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1130, 'en', 'tickets', 'Replied', 'Replied', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1131, 'en', 'tickets', 'Normal', 'Normal', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1132, 'en', 'tickets', 'Low', 'Low', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1133, 'en', 'tickets', 'Urgent', 'Urgent', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1134, 'en', 'tickets', 'High', 'High', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1135, 'en', 'user', 'Sign In', 'Sign In', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1136, 'en', 'user', 'Sign Up', 'Sign Up', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1137, 'en', 'user', 'Reset Password', 'Reset Password', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1138, 'en', 'user', 'Welcome!', 'Welcome!', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1139, 'en', 'user', 'Login to your account', 'Login to your account', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1140, 'en', 'forms', 'Email address', 'Email address', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1141, 'en', 'forms', 'Password', 'Password', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1142, 'en', 'user', 'Remember Me', 'Remember Me', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1143, 'en', 'user', 'Forgot Your Password?', 'Forgot Your Password?', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1144, 'en', 'user', 'Or', 'Or', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1145, 'en', 'user', 'Sign in With Facebook', 'Sign in With Facebook', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1146, 'en', 'user', 'After submitting a valid email address on this form, you will receive instructions telling you how to reset your password.', 'After submitting a valid email address on this form, you will receive instructions telling you how to reset your password.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1147, 'en', 'user', 'Reset', 'Reset', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1148, 'en', 'user', 'Enter a new password to continue.', 'Enter a new password to continue.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1149, 'en', 'forms', 'Confirm password', 'Confirm password', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1150, 'en', 'user', 'Please confirm your password before continuing.', 'Please confirm your password before continuing.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1151, 'en', 'user', 'Confirm Password', 'Confirm Password', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1152, 'en', 'forms', 'First Name', 'First Name', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1153, 'en', 'forms', 'Last Name', 'Last Name', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1154, 'en', 'forms', 'Username', 'Username', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1155, 'en', 'general', 'Choose', 'Choose', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1156, 'en', 'forms', 'Country', 'Country', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1157, 'en', 'forms', 'Phone Number', 'Phone Number', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1158, 'en', 'user', 'I agree to the', 'I agree to the', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1159, 'en', 'user', 'terms of service', 'terms of service', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1160, 'en', 'user', 'Continue', 'Continue', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1161, 'en', 'user', 'Create account', 'Create account', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1162, 'en', 'user', 'Fill this form to create a new account.', 'Fill this form to create a new account.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1163, 'en', 'alerts', 'Country not exists', 'Country not exists', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1164, 'en', 'alerts', 'Phone code not exsits', 'Phone code not exsits', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1165, 'en', 'alerts', 'Registration is currently disabled.', 'Registration is currently disabled.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1166, 'en', 'alerts', 'Your account has been blocked', 'Your account has been blocked', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1167, 'en', 'user', 'Verify Your Email Address', 'Verify Your Email Address', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1168, 'en', 'user', 'Thanks for getting started with', 'Thanks for getting started with', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1169, 'en', 'user', 'We need a little more information to complete your registration, including a confirmation of your email address.', 'We need a little more information to complete your registration, including a confirmation of your email address.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1170, 'en', 'user', 'Please follow the instruction that we sent to your email, if you didn\'t receive the email click resent to get a new one.', 'Please follow the instruction that we sent to your email, if you didn\'t receive the email click resent to get a new one.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1171, 'en', 'user', 'Resend', 'Resend', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1172, 'en', 'user', 'Change Email', 'Change Email', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1173, 'en', 'alerts', 'Link has been resend Successfully', 'Link has been resend Successfully', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1174, 'en', 'user', 'Save', 'Save', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1175, 'en', 'alerts', 'You must to change the email to make a change', 'You must to change the email to make a change', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1176, 'en', 'alerts', 'Email has been changed successfully', 'Email has been changed successfully', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1177, 'en', 'user', 'Logout', 'Logout', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1178, 'en', 'user', 'Dashboard', 'Dashboard', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1179, 'en', 'user', 'My Tickets', 'My Tickets', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1180, 'en', 'user', 'Settings', 'Settings', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1181, 'en', 'user', 'Account Details', 'Account Details', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1182, 'en', 'user', 'Change Password', 'Change Password', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1183, 'en', 'user', '2FA Authentication', '2FA Authentication', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1184, 'en', 'user', 'No Results Found', 'No Results Found', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1185, 'en', 'user', 'It looks like this section is empty or your search did not return any results, you can start creating a content or search using another word', 'It looks like this section is empty or your search did not return any results, you can start creating a content or search using another word', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1186, 'en', 'user', 'Back', 'Back', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1187, 'en', 'tickets', 'Ticket number', 'Ticket number', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1188, 'en', 'tickets', 'Subject', 'Subject', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1189, 'en', 'tickets', 'Priority', 'Priority', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1190, 'en', 'tickets', 'Status', 'Status', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1191, 'en', 'tickets', 'Opened date', 'Opened date', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1192, 'en', 'tickets', 'Action', 'Action', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1193, 'en', 'tickets', 'Open new ticket', 'Open new ticket', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1194, 'en', 'tickets', 'Message', 'Message', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1195, 'en', 'tickets', 'Files', 'Files', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1196, 'en', 'tickets', 'Supported types', 'Supported types', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1197, 'en', 'tickets', 'Ticket Created Successfully', 'Ticket Created Successfully', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1198, 'en', 'tickets', 'Send', 'Send', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1199, 'en', 'tickets', 'Max 5 files can be uploaded', 'Max 5 files can be uploaded', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1200, 'en', 'tickets', 'Max file size is 2MB', 'Max file size is 2MB', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1201, 'en', 'tickets', 'cannot be uploaded', 'cannot be uploaded', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1202, 'en', 'tickets', 'Reply message', 'Reply message', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1203, 'en', 'tickets', 'Reply Sent Successfully', 'Reply Sent Successfully', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1204, 'en', 'tickets', 'Attachment', 'Attachment', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1205, 'en', 'tickets', 'Note', 'Note', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1206, 'en', 'tickets', 'Ticket has been closed you can sent a reply to reopen it', 'Ticket has been closed you can sent a reply to reopen it', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1207, 'en', 'tickets', 'Ticket', 'Ticket', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1208, 'en', 'user', 'Type to search...', 'Type to search...', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1209, 'en', 'user', 'Notifications', 'Notifications', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1210, 'en', 'user', 'Make All as Read', 'Make All as Read', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1211, 'en', 'user', 'View All', 'View All', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1212, 'en', 'user', 'All notifications has been read successfully', 'All notifications has been read successfully', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1213, 'en', 'user', 'User', 'User', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1214, 'en', 'user', 'No notifications found', 'No notifications found', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1215, 'en', 'alerts', 'Connection error please try again', 'Connection error please try again', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1216, 'en', 'alerts', 'Upload error', 'Upload error', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1217, 'en', 'user', 'Complete registration', 'Complete registration', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1218, 'en', 'user', 'We need a little more information to complete your registration.', 'We need a little more information to complete your registration.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1219, 'en', 'alerts', 'Unauthorized or expired token', 'Unauthorized or expired token', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1220, 'en', 'user', 'Are you sure?', 'Are you sure?', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1221, 'en', 'user', 'Confirm that you want do this action', 'Confirm that you want do this action', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1222, 'en', 'user', 'Confirm', 'Confirm', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1223, 'en', 'user', 'Cancel', 'Cancel', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1236, 'en', 'user', 'Change', 'Change', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1237, 'en', 'forms', 'Address line 1', 'Address line 1', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1238, 'en', 'forms', 'Address line 2', 'Address line 2', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1239, 'en', 'forms', 'Apartment, suite, etc. (optional)', 'Apartment, suite, etc. (optional)', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1240, 'en', 'forms', 'City', 'City', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1241, 'en', 'forms', 'State', 'State', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1242, 'en', 'forms', 'Postal code', 'Postal code', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1243, 'en', 'user', 'Save Changes', 'Save Changes', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1244, 'en', 'alerts', 'Phone number already exist', 'Phone number already exist', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1245, 'en', 'alerts', 'You must to change the phone number to make a change', 'You must to change the phone number to make a change', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1246, 'en', 'alerts', 'Phone number has been changed successfully', 'Phone number has been changed successfully', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1247, 'en', 'alerts', 'Phone number must be in the same country where you located', 'Phone number must be in the same country where you located', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1248, 'en', 'alerts', 'Account details has been updated successfully', 'Account details has been updated successfully', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1249, 'en', 'user', 'Verify Your New Email Address', 'Verify Your New Email Address', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1250, 'en', 'user', 'Since you have changed your email address, we need to verify that it is really your email', 'Since you have changed your email address, we need to verify that it is really your email', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1251, 'en', 'forms', 'New Password', 'New Password', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1252, 'en', 'forms', 'Confirm New Password', 'Confirm New Password', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1253, 'en', 'alerts', 'Your current password does not matches with the password you provided', 'Your current password does not matches with the password you provided', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1254, 'en', 'alerts', 'New Password cannot be same as your current password. Please choose a different password', 'New Password cannot be same as your current password. Please choose a different password', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1255, 'en', 'alerts', 'Account password has been changed successfully', 'Account password has been changed successfully', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1256, 'en', 'user', 'Two-factor authentication (2FA) strengthens access security by requiring two methods (also referred to as factors) to verify your identity. Two-factor authentication protects against phishing, social engineering, and password brute force attacks and secures your logins from attackers exploiting weak or stolen credentials.', 'Two-factor authentication (2FA) strengthens access security by requiring two methods (also referred to as factors) to verify your identity. Two-factor authentication protects against phishing, social engineering, and password brute force attacks and secures your logins from attackers exploiting weak or stolen credentials.', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1257, 'en', 'user', 'To use the two factor authentication, you have to install a Google Authenticator compatible app. Here are some that are currently available', 'To use the two factor authentication, you have to install a Google Authenticator compatible app. Here are some that are currently available', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1258, 'en', 'user', 'Google Authenticator for iOS', 'Google Authenticator for iOS', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1259, 'en', 'user', 'Google Authenticator for Android', 'Google Authenticator for Android', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1260, 'en', 'user', 'Microsoft Authenticator for iOS', 'Microsoft Authenticator for iOS', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1261, 'en', 'user', 'Microsoft Authenticator for Android', 'Microsoft Authenticator for Android', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1262, 'en', 'user', 'Enable', 'Enable', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1263, 'en', 'user', 'Enable 2FA Authentication', 'Enable 2FA Authentication', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1264, 'en', 'alerts', 'Invalid OTP code', 'Invalid OTP code', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1265, 'en', 'alerts', '2FA Authentication has been enabled successfully', '2FA Authentication has been enabled successfully', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1266, 'en', 'user', 'Disable 2FA Authentication', 'Disable 2FA Authentication', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1267, 'en', 'user', 'Disable', 'Disable', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1268, 'en', 'alerts', '2FA Authentication has been disabled successfully', '2FA Authentication has been disabled successfully', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1269, 'en', 'forms', 'OTP Code', 'OTP Code', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1270, 'en', 'user', '2Fa Verification', '2Fa Verification', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1271, 'en', 'user', 'Please enter the OTP code to continue', 'Please enter the OTP code to continue', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1272, 'en', 'error pages', 'Page Not Found', 'Page Not Found', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1273, 'en', 'error pages', 'Unauthorized', 'Unauthorized', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1274, 'en', 'error pages', 'Server Error', 'Server Error', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1275, 'en', 'error pages', 'Service Unavailable', 'Service Unavailable', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1276, 'en', 'error pages', 'Too Many Requests', 'Too Many Requests', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1277, 'en', 'error pages', 'Forbidden', 'Forbidden', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1278, 'en', 'error pages', 'Page Expired', 'Page Expired', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1279, 'en', 'error pages', 'You can’t always get what you want. It’s true in life, and it’s true on the web — sometimes, what you’re looking for just isn’t there', 'You can’t always get what you want. It’s true in life, and it’s true on the web — sometimes, what you’re looking for just isn’t there', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1280, 'en', 'error pages', 'Back to home', 'Back to home', '2021-12-11 14:35:51', '2021-12-11 14:35:51'),
(1281, 'en', 'general', 'We use cookies to personalize your experience. By continuing to visit this website you agree to our use of cookies', 'We use cookies to personalize your experience. By continuing to visit this website you agree to our use of cookies', '2021-12-11 17:50:17', '2021-12-11 17:50:17'),
(1282, 'en', 'general', 'Got it', 'Got it', '2021-12-11 17:50:17', '2021-12-11 17:50:17'),
(1283, 'en', 'general', 'More', 'More', '2021-12-11 17:50:17', '2021-12-11 17:50:17'),
(1284, 'en', 'alerts', 'Cookie accepted successfully', 'Cookie accepted successfully', '2021-12-11 18:19:44', '2021-12-11 18:19:44'),
(1285, 'en', 'general', 'Close', 'Close', '2021-12-14 19:26:32', '2021-12-14 19:26:32'),
(1838, 'en', 'tickets', 'All', 'All', '2021-12-28 19:06:02', '2021-12-28 19:06:02'),
(3967, 'en', 'forms', 'Name', 'Name', '2022-02-26 22:20:01', '2022-02-26 22:20:01'),
(3968, 'en', 'forms', 'Subject', 'Subject', '2022-02-26 22:20:54', '2022-02-26 22:20:54'),
(3969, 'en', 'forms', 'Message', 'Message', '2022-02-26 22:20:54', '2022-02-26 22:20:54'),
(3974, 'en', 'blog', 'Read More', 'Read More', '2022-02-26 23:16:32', '2022-02-26 23:16:32'),
(3977, 'en', 'general', 'Faq', 'Faq', '2022-02-27 20:57:51', '2022-02-27 20:57:51'),
(3978, 'en', 'blog', 'Blog', 'Blog', '2022-02-27 21:13:25', '2022-02-27 21:13:25'),
(3979, 'en', 'blog', 'Categories', 'Categories', '2022-02-27 21:31:09', '2022-02-27 21:31:09'),
(3980, 'en', 'blog', 'Popular articles', 'Popular articles', '2022-02-27 21:39:16', '2022-02-27 21:39:16'),
(3981, 'en', 'blog', 'Search..', 'Search..', '2022-02-27 21:46:51', '2022-02-27 21:46:51'),
(3982, 'en', 'blog', 'No data found', 'No data found', '2022-02-27 22:17:44', '2022-02-27 22:17:44'),
(3983, 'en', 'blog', 'It looks like there is no articles or your search did not return any results', 'It looks like there is no articles or your search did not return any results', '2022-02-27 22:17:44', '2022-02-27 22:17:44'),
(4273, 'en', 'blog', 'Leave a comment', 'Leave a comment', '2022-02-27 23:19:29', '2022-02-27 23:19:29'),
(4274, 'en', 'blog', 'Your comment', 'Your comment', '2022-02-27 23:19:29', '2022-02-27 23:19:29'),
(4275, 'en', 'blog', 'Publish', 'Publish', '2022-02-27 23:21:56', '2022-02-27 23:21:56'),
(4276, 'en', 'alerts', 'Login is required to post comments', 'Login is required to post comments', '2022-02-27 23:28:57', '2022-02-27 23:28:57'),
(4277, 'en', 'alerts', 'Article not exists', 'Article not exists', '2022-02-27 23:30:00', '2022-02-27 23:30:00'),
(4278, 'en', 'alerts', 'Your comment is under review it will be published soon', 'Your comment is under review it will be published soon', '2022-02-27 23:34:31', '2022-02-27 23:34:31'),
(4279, 'en', 'blog', 'Comments', 'Comments', '2022-02-27 23:45:58', '2022-02-27 23:45:58'),
(4280, 'en', 'blog', 'No comments available', 'No comments available', '2022-02-27 23:47:04', '2022-02-27 23:47:04'),
(4281, 'en', 'blog', 'Login or create account to leave comments', 'Login or create account to leave comments', '2022-02-27 23:49:43', '2022-02-27 23:49:43'),
(4583, 'en', 'plans', 'Monthly', 'Monthly', '2022-03-03 23:18:40', '2022-03-03 23:18:40'),
(4584, 'en', 'plans', 'Yearly', 'Yearly', '2022-03-03 23:18:40', '2022-03-03 23:18:40'),
(4585, 'en', 'plans', 'month', 'month', '2022-03-03 23:18:40', '2022-03-03 23:18:40'),
(4586, 'en', 'plans', 'year', 'year', '2022-03-03 23:18:49', '2022-03-03 23:18:49'),
(4590, 'en', 'plans', 'Storage Space', 'Storage Space', '2022-03-03 23:28:14', '2022-03-03 23:28:14'),
(4592, 'en', 'plans', 'Unlimited', 'Unlimited', '2022-03-03 23:29:22', '2022-03-03 23:29:22'),
(4593, 'en', 'plans', 'Size per transfer', 'Size per transfer', '2022-03-03 23:36:23', '2022-03-03 23:36:23'),
(4594, 'en', 'general', 'free', 'Free', '2022-03-03 23:39:22', '2022-03-03 23:39:39'),
(4595, 'en', 'plans', 'Files available for', 'Files available for', '2022-03-03 23:43:49', '2022-03-03 23:43:49'),
(4597, 'en', 'plans', 'Unlimited time', 'Unlimited time', '2022-03-03 23:43:49', '2022-03-03 23:43:49'),
(4599, 'en', 'plans', 'Password protection', 'Password protection', '2022-03-03 23:47:24', '2022-03-03 23:47:24'),
(4600, 'en', 'plans', 'Email notification', 'Email notification', '2022-03-03 23:49:36', '2022-03-03 23:49:36'),
(4601, 'en', 'plans', 'Expiry time control', 'Expiry time control', '2022-03-03 23:50:19', '2022-03-03 23:50:19'),
(4602, 'en', 'plans', 'Generate transfer links', 'Generate transfer links', '2022-03-03 23:51:09', '2022-03-03 23:51:09'),
(4603, 'en', 'plans', 'Choose Plan', 'Choose Plan', '2022-03-04 00:02:51', '2022-03-04 00:02:51'),
(4604, 'en', 'plans', 'No monthly plans available', 'No monthly plans available', '2022-03-04 00:11:28', '2022-03-04 00:11:28'),
(4605, 'en', 'plans', 'No yearly plans available', 'No yearly plans available', '2022-03-04 00:11:38', '2022-03-04 00:11:38'),
(4927, 'en', 'checkout', 'Checkout', 'Checkout', '2022-03-04 22:19:41', '2022-03-04 22:19:41'),
(4928, 'en', 'checkout', 'Billing address', 'Billing address', '2022-03-04 22:19:41', '2022-03-04 22:19:41'),
(4929, 'en', 'checkout', 'Payment Methods', 'Payment Methods', '2022-03-04 22:19:41', '2022-03-04 22:19:41'),
(4930, 'en', 'checkout', 'SSL Secure Payment', 'SSL Secure Payment', '2022-03-04 22:21:56', '2022-03-04 22:21:56'),
(4931, 'en', 'checkout', 'Your information is protected by 256-bit SSL encryption', 'Your information is protected by 256-bit SSL encryption', '2022-03-04 22:21:56', '2022-03-04 22:21:56'),
(4932, 'en', 'checkout', 'Pay Now', 'Pay Now', '2022-03-04 22:34:00', '2022-03-04 22:34:00'),
(4933, 'en', 'checkout', 'Order Summary', 'Order Summary', '2022-03-04 22:43:08', '2022-03-04 22:43:08'),
(4935, 'en', 'checkout', 'No payment methods available right now please try again later.', 'No payment methods available right now please try again later.', '2022-03-05 17:30:47', '2022-03-05 17:30:47'),
(4940, 'en', 'alerts', 'Please login or create an account to choose a plan', 'Please login or create an account to choose a plan', '2022-03-05 23:06:35', '2022-03-05 23:06:35'),
(4942, 'en', 'alerts', 'You already subscribed but you can upgrade by clicking on the upgrade button.', 'You already subscribed but you can upgrade by clicking on the upgrade button.', '2022-03-06 21:46:28', '2022-03-06 21:46:28'),
(4943, 'en', 'alerts', 'Choosed plan is not exists', 'Choosed plan is not exists', '2022-03-06 21:57:33', '2022-03-06 21:57:33'),
(4945, 'en', 'checkout', 'Tax', 'Tax', '2022-03-06 22:32:07', '2022-03-06 22:32:07'),
(4947, 'en', 'checkout', 'Total', 'Total', '2022-03-06 22:32:07', '2022-03-06 22:32:07'),
(4948, 'en', 'checkout', 'Plan', 'Plan', '2022-03-06 22:39:18', '2022-03-06 22:39:18'),
(4949, 'en', 'checkout', 'Selected payment method is not active ', 'Selected payment method is not active ', '2022-03-06 23:59:07', '2022-03-06 23:59:07'),
(4950, 'en', 'checkout', 'Invalid or expired transaction', 'Invalid or expired transaction', '2022-03-07 00:18:22', '2022-03-07 00:18:22'),
(4952, 'en', 'checkout', 'Payment failed', 'Payment failed', '2022-03-07 18:22:59', '2022-03-07 18:22:59'),
(4954, 'en', 'checkout', 'Process payment failed', 'Process payment failed', '2022-03-07 18:24:25', '2022-03-07 18:24:25'),
(4955, 'en', 'checkout', 'Payment gateways may charge extra fees', 'Payment gateways may charge extra fees', '2022-03-07 18:35:04', '2022-03-07 18:35:04'),
(4956, 'en', 'plans', 'Featured', 'Featured', '2022-03-07 23:54:41', '2022-03-07 23:54:41'),
(4957, 'en', 'checkout', 'Payment made successfully', 'Payment made successfully', '2022-03-08 17:20:07', '2022-03-08 17:20:07'),
(4958, 'en', 'checkout', 'Incomplete payment please open a ticket or contact us', 'Incomplete payment please open a ticket or contact us', '2022-03-08 21:16:32', '2022-03-08 21:16:32'),
(4959, 'en', 'plans', 'Upgrade plan', 'Upgrade plan', '2022-03-08 21:44:40', '2022-03-08 21:44:40'),
(4960, 'en', 'plans', 'Renew plan', 'Renew plan', '2022-03-08 21:45:01', '2022-03-08 21:45:01'),
(4961, 'en', 'plans', 'Your plan', 'Your plan', '2022-03-08 22:07:01', '2022-03-08 22:07:01'),
(4962, 'en', 'alerts', 'You can only renew your current plan or upgrade to new plan', 'You can only renew your current plan or upgrade to new plan', '2022-03-08 22:56:26', '2022-03-08 22:56:26'),
(4964, 'en', 'alerts', 'You need to subscribe before you can renew the plan', 'You need to subscribe before you can renew the plan', '2022-03-08 22:57:35', '2022-03-08 22:57:35'),
(4966, 'en', 'user', 'My Subscription', 'My Subscription', '2022-03-09 16:40:20', '2022-03-09 16:40:20'),
(4967, 'en', 'user', 'Storage space', 'Storage Space', '2022-03-09 16:56:08', '2022-03-09 17:03:43'),
(4968, 'en', 'user', 'Subscription Expiry', 'Subscription Expiry', '2022-03-09 17:04:05', '2022-03-09 17:04:05'),
(4975, 'en', 'user', 'Day left', 'Day left', '2022-03-09 17:53:08', '2022-03-09 17:53:08'),
(4976, 'en', 'user', 'Renew Subscription', 'Renew Subscription', '2022-03-09 17:53:08', '2022-03-09 17:53:08'),
(4977, 'en', 'user', 'Days left', 'Days left', '2022-03-09 17:53:37', '2022-03-09 17:53:37'),
(4978, 'en', 'user', 'Expired', 'Expired', '2022-03-09 17:53:51', '2022-03-09 17:53:51'),
(4979, 'en', 'user', 'Today', 'Today', '2022-03-09 17:53:58', '2022-03-09 17:53:58'),
(4980, 'en', 'user', 'Less than one day left', 'Less than one day left', '2022-03-09 17:55:07', '2022-03-09 17:55:07'),
(4981, 'en', 'user', 'of', 'of', '2022-03-09 18:18:26', '2022-03-09 18:18:26'),
(4982, 'en', 'user', 'Transactions', 'Transactions', '2022-03-09 18:37:36', '2022-03-09 18:37:36'),
(4983, 'en', 'user', 'Transaction Number', 'Transaction Number', '2022-03-09 18:38:39', '2022-03-09 18:38:39'),
(4993, 'en', 'user', 'Plan Price', 'Plan Price', '2022-03-09 19:07:45', '2022-03-09 19:07:45'),
(4994, 'en', 'user', 'Total', 'Total', '2022-03-09 19:07:45', '2022-03-09 19:07:45'),
(4995, 'en', 'user', 'Status', 'Status', '2022-03-09 19:07:45', '2022-03-09 19:07:45'),
(4996, 'en', 'user', 'Action', 'Action', '2022-03-09 19:07:45', '2022-03-09 19:07:45'),
(4997, 'en', 'user', 'Paid', 'Paid', '2022-03-09 19:07:45', '2022-03-09 19:07:45'),
(4999, 'en', 'user', 'Transaction date', 'Transaction date', '2022-03-09 19:11:14', '2022-03-09 19:11:14'),
(5000, 'en', 'user', 'Type', 'Type', '2022-03-09 22:29:15', '2022-03-09 22:29:15'),
(5001, 'en', 'user', 'Renew', 'Renew', '2022-03-09 22:29:15', '2022-03-09 22:29:15'),
(5002, 'en', 'user', 'Subscribe', 'Subscribe', '2022-03-09 22:29:20', '2022-03-09 22:29:20'),
(5003, 'en', 'user', 'Plan (Interval)', 'Plan (Interval)', '2022-03-09 22:32:03', '2022-03-09 22:32:03'),
(5004, 'en', 'alerts', 'Subscribed Successfully', 'Subscribed Successfully', '2022-03-09 22:50:46', '2022-03-09 22:50:46'),
(5005, 'en', 'user', 'Upgrade', 'Upgrade', '2022-03-09 22:57:40', '2022-03-09 22:57:40'),
(5006, 'en', 'general', 'Pricing plans', 'Pricing plans', '2022-03-09 23:06:05', '2022-03-09 23:06:05'),
(5010, 'en', 'user', 'Choose your plan to complete the subscription', 'Choose your plan to complete the subscription', '2022-03-10 16:41:58', '2022-03-10 16:41:58'),
(5011, 'en', 'checkout', 'No payment method needed.', 'No payment method needed.', '2022-03-10 17:14:55', '2022-03-10 17:14:55'),
(5012, 'en', 'checkout', 'Continue', 'Continue', '2022-03-10 17:20:35', '2022-03-10 17:20:35'),
(5013, 'en', 'user', 'Unlimited', 'Unlimited', '2022-03-10 17:45:43', '2022-03-10 17:45:43'),
(5014, 'en', 'alerts', 'You subscribed in free plan it will renew automatically after it gets expiry', 'You subscribed in free plan it will renew automatically after it gets expiry', '2022-03-10 18:27:24', '2022-03-10 18:27:24'),
(5015, 'en', 'user', 'Unlimited time', 'Unlimited time', '2022-03-10 18:54:21', '2022-03-10 18:54:21'),
(5016, 'en', 'user', 'Subscription details', 'Subscription details', '2022-03-10 19:12:47', '2022-03-10 19:12:47'),
(5017, 'en', 'user', 'Plan Name', 'Plan Name', '2022-03-10 19:12:47', '2022-03-10 19:12:47'),
(5018, 'en', 'user', 'Plan Interval', 'Plan Interval', '2022-03-10 19:12:47', '2022-03-10 19:12:47'),
(5019, 'en', 'user', 'Size Per Transfer', 'Size Per Transfer', '2022-03-10 19:12:47', '2022-03-10 19:12:47'),
(5020, 'en', 'user', 'Files duration', 'Files duration', '2022-03-10 19:12:47', '2022-03-10 19:12:47'),
(5021, 'en', 'user', 'Password protection', 'Password protection', '2022-03-10 19:12:47', '2022-03-10 19:12:47'),
(5022, 'en', 'user', 'Email notification', 'Email notification', '2022-03-10 19:12:47', '2022-03-10 19:12:47'),
(5023, 'en', 'user', 'Expiry time control', 'Expiry time control', '2022-03-10 19:12:47', '2022-03-10 19:12:47'),
(5024, 'en', 'user', 'Generate transfer links', 'Generate transfer links', '2022-03-10 19:12:47', '2022-03-10 19:12:47'),
(5025, 'en', 'user', 'Your storage space', 'Your storage space', '2022-03-10 19:19:53', '2022-03-10 19:19:53'),
(5026, 'en', 'user', 'Total transfers', 'Total transfers', '2022-03-10 20:17:55', '2022-03-10 20:17:55'),
(5027, 'en', 'user', 'Transaction details', 'Transaction details', '2022-03-10 22:18:37', '2022-03-10 22:18:37'),
(5030, 'en', 'user', 'Taxes', 'Taxes', '2022-03-10 22:33:28', '2022-03-10 22:33:28'),
(5031, 'en', 'user', 'Gateway Fees', 'Gateway Fees', '2022-03-10 22:33:28', '2022-03-10 22:33:28'),
(5032, 'en', 'user', 'Transaction Type', 'Transaction Type', '2022-03-10 22:34:44', '2022-03-10 22:34:44'),
(5033, 'en', 'user', 'Transaction Status', 'Transaction Status', '2022-03-10 22:35:35', '2022-03-10 22:35:35'),
(5034, 'en', 'user', 'Cancellation Reason', 'Cancellation Reason', '2022-03-10 22:40:15', '2022-03-10 22:40:15'),
(5035, 'en', 'user', 'Payment Gateway', 'Payment Gateway', '2022-03-10 22:46:42', '2022-03-10 22:46:42'),
(5049, 'en', 'notifications', 'Your subscription will expiry soon', 'Your subscription will expiry soon', '2022-03-12 21:11:51', '2022-03-12 21:11:51'),
(5050, 'en', 'notifications', 'Your free subscription has been renewed', 'Your free subscription has been renewed', '2022-03-12 21:12:53', '2022-03-12 21:12:53'),
(5877, 'en', 'notifications', 'New Ticket Created {ticket_number}', 'New Ticket Created {ticket_number}', '2022-03-12 22:14:51', '2022-03-12 22:14:51'),
(5878, 'en', 'notifications', 'Ticket {ticket_number} New Reply', 'Ticket {ticket_number} New Reply', '2022-03-12 22:18:16', '2022-03-12 22:18:16'),
(5879, 'en', 'notifications', 'Ticket Closed {ticket_number}', 'Ticket Closed {ticket_number}', '2022-03-12 22:18:37', '2022-03-12 22:18:37'),
(5880, 'en', 'notifications', 'Thanks for joining us {user_firstname}!', 'Thanks for joining us {user_firstname}!', '2022-03-12 22:22:07', '2022-03-12 22:22:07'),
(7156, 'en', 'notifications', 'Your subscription has been expired', 'Your subscription has been expired', '2022-03-13 00:11:08', '2022-03-13 00:11:08');
INSERT INTO `translates` (`id`, `lang`, `group_name`, `key`, `value`, `created_at`, `updated_at`) VALUES
(7157, 'en', 'notifications', 'Your files will be deleted after {delete_interval}', 'Your files will be deleted after {delete_interval}', '2022-03-13 00:11:08', '2022-03-13 00:11:08'),
(7160, 'en', 'general', 'day', 'day', '2022-03-13 00:42:34', '2022-03-13 00:42:34'),
(7162, 'en', 'general', 'days', 'days', '2022-03-13 00:44:39', '2022-03-13 00:44:39'),
(7164, 'en', 'user', 'Your subscription has been expired, Please renew it to continue using the service.', 'Your subscription has been expired, Please renew it to continue using the service.', '2022-03-14 21:56:04', '2022-03-14 21:56:04'),
(7165, 'en', 'user', 'Your subscription is about expired, Renew it to avoid deleting your files.', 'Your subscription is about expired, Renew it to avoid deleting your files.', '2022-03-14 22:10:40', '2022-03-14 22:10:40'),
(7199, 'en', 'alerts', 'You have no subscription or your subscription has been expired', 'You have no subscription or your subscription has been expired', '2022-03-17 00:47:36', '2022-03-17 00:47:36'),
(7207, 'en', 'alerts', 'Login or create account to start transferring files', 'Login or create account to start transferring files', '2022-03-21 19:58:16', '2022-03-21 19:58:16'),
(7730, 'en', 'alerts', 'Your subscription has been canceled, please contact us for more information', 'Your subscription has been canceled, please contact us for more information', '2022-03-22 15:29:12', '2022-03-22 15:29:12'),
(8227, 'en', 'user', 'Start Transfer', 'Start Transfer', '2022-03-24 23:09:11', '2022-03-24 23:09:11'),
(8228, 'en', 'alerts', 'Insufficient storage space, please check your space or upgrade your plan', 'Insufficient storage space, please check your space or upgrade your plan', '2022-03-24 23:29:51', '2022-03-24 23:29:51'),
(8229, 'en', 'user', 'Remaining', 'Remaining', '2022-03-25 02:14:17', '2022-03-25 02:14:17'),
(8230, 'en', 'alerts', 'You need to subscribe before you can upgrade the plan', 'You need to subscribe before you can upgrade the plan', '2022-03-25 17:44:58', '2022-03-25 17:44:58'),
(8231, 'en', 'alerts', 'You cannot upgrade to this plan, storage space not enough', 'You cannot upgrade to this plan, storage space not enough', '2022-03-25 17:54:33', '2022-03-25 17:54:33'),
(8234, 'en', 'user', 'Copied to clipboard', 'Copied to clipboard', '2022-03-26 00:55:43', '2022-03-26 00:55:43'),
(8255, 'en', 'user', 'Your transfers', 'Your transfers', '2022-03-28 18:06:24', '2022-03-28 18:06:24'),
(8256, 'en', 'user', 'Transfer number', 'Transfer number', '2022-03-28 18:08:05', '2022-03-28 18:08:05'),
(8261, 'en', 'user', 'Transferred at', 'Transferred at', '2022-03-28 18:12:29', '2022-03-28 18:12:29'),
(8262, 'en', 'user', 'Expiring at', 'Expiring at', '2022-03-28 18:12:29', '2022-03-28 18:12:29'),
(8263, 'en', 'user', 'Transfer method', 'Transfer method', '2022-03-28 18:12:29', '2022-03-28 18:12:29'),
(8264, 'en', 'user', 'Transferred by link', 'Transferred by link', '2022-03-28 18:21:32', '2022-03-28 18:21:32'),
(8265, 'en', 'user', 'Transferred by email', 'Transferred by email', '2022-03-28 18:23:46', '2022-03-28 18:23:46'),
(8266, 'en', 'user', 'Transferred', 'Transferred', '2022-03-28 18:28:28', '2022-03-28 18:28:28'),
(8267, 'en', 'user', 'Canceled', 'Canceled', '2022-03-28 18:31:25', '2022-03-28 18:31:25'),
(8269, 'en', 'user', 'Downloaded', 'Downloaded', '2022-03-28 18:44:47', '2022-03-28 18:44:47'),
(8270, 'en', 'user', 'No', 'No', '2022-03-28 18:44:47', '2022-03-28 18:44:47'),
(8271, 'en', 'user', 'Yes', 'Yes', '2022-03-28 18:45:35', '2022-03-28 18:45:35'),
(8272, 'en', 'user', 'Transfer details', 'Transfer details', '2022-03-28 19:01:35', '2022-03-28 19:01:35'),
(8273, 'en', 'user', 'Transfer link', 'Transfer link', '2022-03-28 19:04:23', '2022-03-28 19:04:23'),
(8274, 'en', 'user', 'Copy', 'Copy', '2022-03-28 19:08:01', '2022-03-28 19:08:01'),
(8275, 'en', 'user', 'Emails', 'Emails', '2022-03-28 19:40:23', '2022-03-28 19:40:23'),
(8276, 'en', 'user', 'Transferred files', 'Transferred files', '2022-03-28 20:25:14', '2022-03-28 20:25:14'),
(8277, 'en', 'user', 'Transfer not exists or expired', 'Transfer not exists or expired', '2022-03-28 20:42:22', '2022-03-28 20:42:22'),
(8278, 'en', 'user', 'Transfer must have one file at least', 'Transfer must have one file at least', '2022-03-28 20:45:21', '2022-03-28 20:45:21'),
(8280, 'en', 'user', 'Transfer file not exists', 'Transfer file not exists', '2022-03-28 20:58:49', '2022-03-28 20:58:49'),
(8281, 'en', 'user', 'File deleted successfully', 'File deleted successfully', '2022-03-28 21:00:57', '2022-03-28 21:00:57'),
(8282, 'en', 'user', 'Downloaded at', 'Downloaded at', '2022-03-28 21:22:16', '2022-03-28 21:22:16'),
(8284, 'en', 'user', 'Last update', 'Last update', '2022-03-28 21:24:45', '2022-03-28 21:24:45'),
(8285, 'en', 'user', 'Sender email', 'Sender email', '2022-03-28 21:26:22', '2022-03-28 21:26:22'),
(8286, 'en', 'user', 'Sender name', 'Sender name', '2022-03-28 21:27:00', '2022-03-28 21:27:00'),
(8289, 'en', 'user', 'Transfer settings', 'Transfer settings', '2022-03-28 22:37:52', '2022-03-28 22:37:52'),
(8290, 'en', 'user', 'Transfer password', 'Transfer password', '2022-03-28 22:52:07', '2022-03-28 22:52:07'),
(8292, 'en', 'user', 'Transfer has been expired', 'Transfer has been expired', '2022-03-28 23:23:53', '2022-03-28 23:23:53'),
(8293, 'en', 'user', 'Transfer has been canceled', 'Transfer has been canceled', '2022-03-28 23:25:33', '2022-03-28 23:25:33'),
(8294, 'en', 'user', 'Leave it empty to remove password', 'Leave it empty to remove password', '2022-03-28 23:55:20', '2022-03-28 23:55:20'),
(8295, 'en', 'user', 'Transfer updated successfully', 'Transfer updated successfully', '2022-03-28 23:59:23', '2022-03-28 23:59:23'),
(8296, 'en', 'user', 'My Transfers', 'My Transfers', '2022-03-29 00:50:05', '2022-03-29 00:50:05'),
(8297, 'en', 'user', 'Active transfers', 'Active transfers', '2022-03-29 00:59:33', '2022-03-29 00:59:33'),
(8298, 'en', 'user', 'Expired transfers', 'Expired transfers', '2022-03-29 00:59:33', '2022-03-29 00:59:33'),
(8299, 'en', 'user', 'Canceled transfers', 'Canceled transfers', '2022-03-29 00:59:33', '2022-03-29 00:59:33'),
(8375, 'en', 'checkout', 'Important Notice !', 'Important Notice !', '2022-03-31 21:03:19', '2022-03-31 21:03:19'),
(8376, 'en', 'checkout', 'When you upgrade the plan before your current plan expires, you will lose all the features in your current plan and move to the new plan, and the new plan period will be calculated and the old period removed.', 'When you upgrade the plan before your current plan expires, you will lose all the features in your current plan and move to the new plan, and the new plan period will be calculated and the old period removed.', '2022-03-31 21:03:19', '2022-03-31 21:03:19'),
(8379, 'en', 'notifications', 'Transfer {transfer_number} has expired', 'Transfer {transfer_number} has expired', '2022-03-31 23:57:50', '2022-03-31 23:57:50'),
(8389, 'en', 'user', 'View Transfer', 'View Transfer', '2022-04-01 01:01:47', '2022-04-01 01:01:47'),
(8394, 'en', 'user', 'Done', 'Done', '2022-04-02 00:13:54', '2022-04-02 00:13:54'),
(8395, 'en', 'user', 'Transaction has been canceled', 'Transaction has been canceled', '2022-04-02 00:15:58', '2022-04-02 00:15:58'),
(8428, 'en', 'notifications', 'Transfer canceled {transfer_number}', 'Transfer canceled {transfer_number}', '2022-04-03 16:50:12', '2022-04-03 16:50:12'),
(8429, 'en', 'notifications', 'Transaction canceled {transaction_number}', 'Transaction canceled {transaction_number}', '2022-04-03 17:00:19', '2022-04-03 17:00:19'),
(10042, 'en', 'user', 'On', 'On', '2022-04-06 02:33:46', '2022-04-06 02:33:46'),
(10043, 'en', 'user', 'Off', 'Off', '2022-04-06 02:33:56', '2022-04-06 02:33:56'),
(10044, 'en', 'general', 'GB', 'GB', '2022-04-06 02:53:07', '2022-04-06 02:53:07'),
(10045, 'en', 'general', 'MB', 'MB', '2022-04-06 02:53:07', '2022-04-06 02:53:07'),
(10046, 'en', 'general', 'bytes', 'B', '2022-04-06 02:53:52', '2022-07-31 13:32:27'),
(10047, 'en', 'general', 'KB', 'KB', '2022-04-06 02:54:11', '2022-04-06 02:54:11'),
(10048, 'en', 'general', 'byte', 'byte', '2022-04-06 02:54:34', '2022-04-06 02:54:34'),
(10052, 'en', 'plans', 'No Advertisements', 'No Advertisements', '2022-05-14 01:08:26', '2022-05-14 01:08:26'),
(10062, 'en', 'checkout', 'Coupon Code', 'Coupon Code', '2022-05-15 22:24:20', '2022-05-15 22:24:20'),
(10063, 'en', 'checkout', 'Enter coupon code', 'Enter coupon code', '2022-05-15 22:24:20', '2022-05-15 22:24:20'),
(10064, 'en', 'checkout', 'Apply', 'Apply', '2022-05-15 22:24:20', '2022-05-15 22:24:20'),
(10065, 'en', 'checkout', 'Invalid or expired coupon code', 'Invalid or expired coupon code', '2022-05-15 22:25:03', '2022-05-15 22:25:03'),
(10066, 'en', 'checkout', 'Coupon has been applied successfully', 'Coupon has been applied successfully', '2022-05-15 22:50:15', '2022-05-15 22:50:15'),
(10067, 'en', 'checkout', 'Subtotal', 'Subtotal', '2022-05-15 22:50:16', '2022-05-15 22:50:16'),
(10068, 'en', 'checkout', 'Discount', 'Discount', '2022-05-15 22:50:16', '2022-05-15 22:50:16'),
(10069, 'en', 'checkout', 'You have exceeded the usage limit for this coupon', 'You have exceeded the usage limit for this coupon', '2022-05-15 22:59:06', '2022-05-15 22:59:06'),
(10078, 'en', 'user', 'Subtotal', 'Subtotal', '2022-05-16 19:58:02', '2022-05-16 19:58:02'),
(10079, 'en', 'user', 'Discount', 'Discount', '2022-05-16 19:58:02', '2022-05-16 19:58:02'),
(10080, 'en', 'user', 'Coupon Code', 'Coupon Code', '2022-05-16 20:22:11', '2022-05-16 20:22:11'),
(10082, 'en', 'plans', 'lifetime', 'Lifetime', '2022-05-17 13:50:03', '2022-05-17 13:50:03'),
(10083, 'en', 'plans', 'No lifetime plans available', 'No lifetime plans available', '2022-05-17 14:25:09', '2022-05-17 14:25:09'),
(10084, 'en', 'alerts', 'Your plan is not renewable', 'Your plan is not renewable', '2022-05-17 16:07:57', '2022-05-17 16:07:57'),
(10085, 'en', 'user', 'Lifetime Subscription', 'Lifetime Subscription', '2022-05-17 16:10:29', '2022-05-17 16:10:29'),
(10086, 'en', 'user', 'Advertisements', 'Advertisements', '2022-05-17 20:45:02', '2022-05-17 20:45:02'),
(10087, 'en', 'general', 'TB', 'TB', '2022-05-19 23:53:27', '2022-05-19 23:53:27'),
(10089, 'en', 'user', 'Payment method', 'Payment method', '2022-05-30 00:01:16', '2022-05-30 00:01:16'),
(10651, 'en', 'home page', 'Transfer your files, easy and secure', 'Transfer your files, easy and secure', '2022-07-31 14:15:11', '2022-07-31 14:15:11'),
(10652, 'en', 'home page', 'Transfer your files Up to 20GB* per transfer and have them travel around the world for free, easily and securely.', 'Transfer your files Up to 20GB* per transfer and have them travel around the world for free, easily and securely.', '2022-07-31 14:15:11', '2022-07-31 14:15:11'),
(10653, 'en', 'home page', 'Start Transfer', 'Start Transfer', '2022-07-31 14:15:11', '2022-07-31 14:15:11'),
(10654, 'en', 'home page', 'Get Started', 'Get Started', '2022-07-31 14:15:11', '2022-07-31 14:15:11'),
(10655, 'en', 'home page', 'Active Users', 'Active Users', '2022-07-31 15:10:14', '2022-07-31 15:10:14'),
(10656, 'en', 'home page', 'Transferred files', 'Transferred files', '2022-07-31 15:10:14', '2022-07-31 15:10:14'),
(10657, 'en', 'home page', 'Daily visitors', 'Daily visitors', '2022-07-31 15:10:14', '2022-07-31 15:10:14'),
(10658, 'en', 'home page', 'All-Time Downloads', 'All-Time Downloads', '2022-07-31 15:10:14', '2022-07-31 15:10:14'),
(10659, 'en', 'home page', 'Features', 'Features', '2022-07-31 15:11:57', '2022-07-31 15:11:57'),
(10660, 'en', 'home page', 'Features description', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s.', '2022-07-31 15:11:57', '2022-07-31 15:12:15'),
(10661, 'en', 'home page', 'Pricing', 'Pricing', '2022-07-31 15:29:05', '2022-07-31 15:29:05'),
(10662, 'en', 'home page', 'Pricing description', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s.', '2022-07-31 15:29:05', '2022-07-31 15:29:13'),
(10663, 'en', 'home page', 'Blog', 'Blog', '2022-07-31 15:30:25', '2022-07-31 15:30:25'),
(10664, 'en', 'home page', 'Blog description', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s.', '2022-07-31 15:30:25', '2022-07-31 15:30:37'),
(10665, 'en', 'home page', 'View More', 'View More', '2022-07-31 15:30:25', '2022-07-31 15:30:25'),
(10666, 'en', 'home page', 'FAQ', 'FAQ', '2022-07-31 16:57:35', '2022-07-31 16:57:35'),
(10667, 'en', 'home page', 'FAQ description', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s.', '2022-07-31 16:57:35', '2022-07-31 16:57:49'),
(10668, 'en', 'home page', 'Find out more answers on our FAQ', 'Find out more answers on our FAQ', '2022-07-31 17:07:48', '2022-07-31 17:07:48'),
(10669, 'en', 'home page', 'Contact Us', 'Contact Us', '2022-07-31 17:10:29', '2022-07-31 17:10:29'),
(10670, 'en', 'home page', 'Contact Us description', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s.', '2022-07-31 17:10:29', '2022-07-31 17:11:22'),
(10671, 'en', 'contact us', 'Contact Us', 'Contact Us', '2022-07-31 17:13:59', '2022-07-31 17:13:59'),
(10672, 'en', 'contact us', 'Name', 'Name', '2022-07-31 17:13:59', '2022-07-31 17:13:59'),
(10673, 'en', 'contact us', 'Email address', 'Email address', '2022-07-31 17:13:59', '2022-07-31 17:13:59'),
(10674, 'en', 'contact us', 'Subject', 'Subject', '2022-07-31 17:13:59', '2022-07-31 17:13:59'),
(10675, 'en', 'contact us', 'Message', 'Message', '2022-07-31 17:13:59', '2022-07-31 17:13:59'),
(10676, 'en', 'contact us', 'Send', 'Send', '2022-07-31 17:13:59', '2022-07-31 17:13:59'),
(10677, 'en', 'contact us', 'Sending emails is not available right now', 'Sending emails is not available right now', '2022-07-31 17:16:43', '2022-07-31 17:16:43'),
(10678, 'en', 'contact us', 'Error on sending', 'Error on sending', '2022-07-31 17:16:58', '2022-07-31 17:16:58'),
(10679, 'en', 'contact us', 'Your message has been sent successfully', 'Your message has been sent successfully', '2022-07-31 17:19:01', '2022-07-31 17:19:01'),
(10680, 'en', 'blog', 'Share On', 'Share On', '2022-08-01 23:42:56', '2022-08-01 23:42:56'),
(10681, 'en', 'upload zone', 'Drag and Drop Your Files to Start Transfer', 'Drag and Drop Your Files to Start Transfer', '2022-08-03 20:03:19', '2022-08-03 20:03:19'),
(10682, 'en', 'upload zone', 'Or click here', 'Or click here', '2022-08-03 20:05:06', '2022-08-03 20:05:06'),
(10683, 'en', 'upload zone', 'Drop File Here', 'Drop File Here', '2022-08-03 20:05:06', '2022-08-03 20:05:06'),
(10684, 'en', 'upload zone', 'Upload your files by drag-and-dropping them on this window', 'Upload your files by drag-and-dropping them on this window', '2022-08-03 20:05:06', '2022-08-03 20:05:06'),
(10685, 'en', 'upload zone', 'Add More', 'Add More', '2022-08-03 20:07:06', '2022-08-03 20:07:06'),
(10686, 'en', 'upload zone', 'Total Files', 'Total Files', '2022-08-03 20:07:06', '2022-08-03 20:07:06'),
(10687, 'en', 'upload zone', 'Reset', 'Reset', '2022-08-03 20:07:06', '2022-08-03 20:07:06'),
(10688, 'en', 'upload zone', 'file is too big max file size: {maxFilesize}MiB.', 'file is too big max file size: {maxFilesize}MiB.', '2022-08-04 14:55:17', '2022-08-04 14:55:17'),
(10689, 'en', 'upload zone', 'Server responded with {statusCode} code.', 'Server responded with {statusCode} code.', '2022-08-04 14:55:17', '2022-08-04 14:55:17'),
(10690, 'en', 'upload zone', 'Drop files here to upload', 'Drop files here to upload', '2022-08-04 14:55:17', '2022-08-04 14:55:17'),
(10691, 'en', 'upload zone', 'Your browser does not support drag and drop file uploads.', 'Your browser does not support drag and drop file uploads.', '2022-08-04 14:55:17', '2022-08-04 14:55:17'),
(10692, 'en', 'upload zone', 'Please use the fallback form below to upload your files like in the olden days.', 'Please use the fallback form below to upload your files like in the olden days.', '2022-08-04 14:55:17', '2022-08-04 14:55:17'),
(10693, 'en', 'upload zone', 'You cannot upload files of this type.', 'You cannot upload files of this type.', '2022-08-04 14:55:17', '2022-08-04 14:55:17'),
(10694, 'en', 'upload zone', 'Cancel upload', 'Cancel upload', '2022-08-04 14:55:17', '2022-08-04 14:55:17'),
(10695, 'en', 'upload zone', 'Are you sure you want to cancel this upload?', 'Are you sure you want to cancel this upload?', '2022-08-04 14:55:17', '2022-08-04 14:55:17'),
(10696, 'en', 'upload zone', 'Remove file', 'Remove file', '2022-08-04 14:55:17', '2022-08-04 14:55:17'),
(10697, 'en', 'upload zone', 'You can not upload any more files.', 'You can not upload any more files.', '2022-08-04 14:55:17', '2022-08-04 14:55:17'),
(10698, 'en', 'upload zone', 'Max size per transfer : {maxTransferSize}.', 'Max size per transfer : {maxTransferSize}.', '2022-08-04 16:56:34', '2022-08-04 16:56:34'),
(10699, 'en', 'upload zone', 'Send to', 'Send to', '2022-08-04 16:56:34', '2022-08-05 17:31:57'),
(10705, 'en', 'upload zone', 'Link', 'Link', '2022-08-04 22:35:40', '2022-08-04 22:35:40'),
(10706, 'en', 'upload zone', 'Password', 'Password', '2022-08-04 22:35:40', '2022-08-04 22:35:40'),
(10707, 'en', 'upload zone', 'Notifications', 'Notifications', '2022-08-04 22:35:40', '2022-08-04 22:35:40'),
(10708, 'en', 'upload zone', 'Expiry Date', 'Expiry Date', '2022-08-04 22:35:40', '2022-08-04 22:35:40'),
(10709, 'en', 'upload zone', 'Your Email Address', 'Your Email Address', '2022-08-04 22:35:40', '2022-08-04 22:35:40'),
(10710, 'en', 'upload zone', 'Subject (optional)', 'Subject (optional)', '2022-08-04 22:39:11', '2022-08-04 22:39:11'),
(10711, 'en', 'upload zone', 'Custom link (optional)', 'Custom link (optional)', '2022-08-04 22:39:11', '2022-08-04 22:39:11'),
(10712, 'en', 'upload zone', 'Notify me when downloaded', 'Notify me when downloaded', '2022-08-04 22:49:03', '2022-08-04 22:49:03'),
(10713, 'en', 'upload zone', 'Notify me when expired', 'Notify me when expired', '2022-08-04 22:49:03', '2022-08-04 22:49:03'),
(10714, 'en', 'upload zone', 'Set expiry date', 'Set expiry date', '2022-08-04 22:49:03', '2022-08-04 22:49:03'),
(10715, 'en', 'upload zone', 'Email', 'Email', '2022-08-04 23:08:09', '2022-08-04 23:08:09'),
(10716, 'en', 'upload zone', 'Sender name (optional)', 'Sender name (optional)', '2022-08-04 23:08:09', '2022-08-04 23:08:09'),
(10717, 'en', 'upload zone', 'Transfer', 'Transfer', '2022-08-04 23:08:09', '2022-08-04 23:08:09'),
(10718, 'en', 'upload zone', 'Cancel', 'Cancel', '2022-08-04 23:08:09', '2022-08-04 23:08:09'),
(10719, 'en', 'upload zone', 'Submit', 'Submit', '2022-08-04 23:08:09', '2022-08-04 23:08:09'),
(10720, 'en', 'upload zone', 'Custom link can only contain Letters or Numbers or Dashes', 'Custom link can only contain Letters or Numbers or Dashes', '2022-08-05 17:29:01', '2022-08-05 17:29:01'),
(10721, 'en', 'upload zone', 'Create a link feature not available for your subscription', 'Create a link feature not available for your subscription', '2022-08-05 17:29:01', '2022-08-05 17:29:01'),
(10722, 'en', 'upload zone', 'File error', 'File error', '2022-08-05 17:29:01', '2022-08-05 17:29:01'),
(10723, 'en', 'upload zone', 'Expiry date is invalid', 'Expiry date is invalid', '2022-08-05 17:29:01', '2022-08-05 17:29:01'),
(10724, 'en', 'upload zone', 'Expiry date must be equal or less than {files_duration}', 'Expiry date must be equal or less than {files_duration}', '2022-08-05 17:29:01', '2022-08-05 17:29:01'),
(10725, 'en', 'upload zone', 'Expiry date must be 10 minutes minimum', 'Expiry date must be 10 minutes minimum', '2022-08-05 17:29:01', '2022-08-05 17:29:01'),
(10726, 'en', 'upload zone', 'You cannot use notify when expiry when transfer expiry time is unlimited', 'You cannot use notify when expiry when transfer expiry time is unlimited', '2022-08-05 17:29:01', '2022-08-05 17:29:01'),
(10727, 'en', 'upload zone', 'Unavailable storage provider', 'Unavailable storage provider', '2022-08-05 17:29:01', '2022-08-05 17:29:01'),
(10728, 'en', 'upload zone', 'Transfer error', 'Transfer error', '2022-08-05 17:29:01', '2022-08-05 17:29:01'),
(10729, 'en', 'upload zone', 'File not exists', 'File not exists', '2022-08-05 17:37:21', '2022-08-05 17:37:21'),
(10730, 'en', 'upload zone', 'No files uploaded', 'No files uploaded', '2022-08-05 17:44:50', '2022-08-05 17:44:50'),
(10731, 'en', 'upload zone', 'Send to field is invalid', 'Send to field is invalid', '2022-08-05 17:44:50', '2022-08-05 17:44:50'),
(10732, 'en', 'upload zone', 'Transfer Completed', 'Transfer Completed', '2022-08-05 19:48:34', '2022-08-05 19:48:34'),
(10735, 'en', 'upload zone', 'Your files have been transferred successfully, here is your download link', 'Your files have been transferred successfully, here is your download link', '2022-08-05 20:10:53', '2022-08-05 20:10:53'),
(10736, 'en', 'upload zone', 'New Transfer', 'New Transfer', '2022-08-05 20:10:53', '2022-08-05 20:10:53'),
(10737, 'en', 'upload zone', 'View Transfer', 'View Transfer', '2022-08-05 20:32:17', '2022-08-05 20:32:17'),
(10738, 'en', 'upload zone', 'Failed to upload', 'Failed to upload', '2022-08-05 20:34:45', '2022-08-05 20:34:45'),
(10739, 'en', 'upload zone', 'Your message (optional)', 'Your message (optional)', '2022-08-05 20:38:09', '2022-08-05 20:38:09'),
(10740, 'en', 'download page', 'Download', 'Download', '2022-08-05 21:58:00', '2022-08-05 21:58:00'),
(10741, 'en', 'password page', 'Password Protection', 'Password Protection', '2022-08-05 21:58:00', '2022-08-05 21:58:00'),
(10742, 'en', 'password page', 'Enter the Password to Unlock the Files', 'Enter the Password to Unlock the Files', '2022-08-05 21:58:00', '2022-08-05 21:58:00'),
(10743, 'en', 'password page', 'Unlock Files', 'Unlock Files', '2022-08-05 21:58:00', '2022-08-05 21:58:00'),
(10744, 'en', 'password page', 'Transfer not found', 'Transfer not found', '2022-08-05 21:58:49', '2022-08-05 21:58:49'),
(10745, 'en', 'password page', 'Incorrect password', 'Incorrect password', '2022-08-05 21:58:59', '2022-08-05 21:58:59'),
(10747, 'en', 'download page', 'Transferred files are ready for download', 'Transferred files are ready for download', '2022-08-05 22:05:44', '2022-08-05 22:05:44'),
(10748, 'en', 'download page', 'Expires on', 'Expires on', '2022-08-05 22:06:11', '2022-08-05 22:06:11'),
(10750, 'en', 'upload zone', 'Storage provider error', 'Storage provider error', '2022-08-05 22:33:44', '2022-08-05 22:33:44'),
(10751, 'en', 'download page', 'Download file', 'Download file', '2022-08-05 23:58:26', '2022-08-05 23:58:26'),
(10752, 'en', 'download page', 'Download all', 'Download all', '2022-08-05 23:58:51', '2022-08-05 23:58:51'),
(10753, 'en', 'download page', 'Transfer not found', 'Transfer not found', '2022-08-06 00:07:07', '2022-08-06 00:07:07'),
(10754, 'en', 'download page', 'Unauthorized access', 'Unauthorized access', '2022-08-06 00:07:17', '2022-08-06 00:07:17'),
(10755, 'en', 'download page', 'Requested file not exists', 'Requested file not exists', '2022-08-06 00:07:29', '2022-08-06 00:07:29'),
(10756, 'en', 'download page', 'There was a problem while trying to download the file', 'There was a problem while trying to download the file', '2022-08-06 00:08:18', '2022-08-06 00:08:18'),
(10757, 'es', 'general', 'All rights reserved', 'Todos los derechos reservados', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10758, 'es', 'validation', 'The :attribute must be accepted.', 'El campo :attribute debe ser aceptado.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10759, 'es', 'validation', 'The :attribute must be accepted when :other is :value.', 'El campo :attribute debe ser aceptado cuando :other es :value.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10760, 'es', 'validation', 'The :attribute is not a valid URL.', 'El campo :attribute no es una URL válida.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10761, 'es', 'validation', 'The :attribute must be a date after :date.', 'El campo :attribute debe ser una fecha posterior a :date.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10762, 'es', 'validation', 'The :attribute must be a date after or equal to :date.', 'El campo :attribute debe ser una fecha posterior o igual a :date.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10763, 'es', 'validation', 'The :attribute must only contain letters.', 'El campo :attribute solo debe contener letras.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10764, 'es', 'validation', 'The :attribute must only contain letters, numbers, dashes and underscores.', 'El campo :attribute solo debe contener letras, números, guiones y guiones bajos.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10765, 'es', 'validation', 'The :attribute must only contain letters and numbers.', 'El campo :attribute solo debe contener letras y números.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10766, 'es', 'validation', 'The :attribute must be an array.', 'El campo :attribute debe ser un arreglo.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10767, 'es', 'validation', 'The :attribute must be a date before :date.', 'El campo :attribute debe ser una fecha anterior a :date.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10768, 'es', 'validation', 'The :attribute must be a date before or equal to :date.', 'El campo :attribute debe ser una fecha anterior o igual a :date.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10769, 'es', 'validation', 'The :attribute must be between :min and :max.', 'El campo :attribute debe estar entre :min y :max.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10770, 'es', 'validation', 'The :attribute must be between :min and :max kilobytes.', 'El campo :attribute debe estar entre :min y :max kilobytes.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10771, 'es', 'validation', 'The :attribute must be between :min and :max characters.', 'El campo :attribute debe tener entre :min y :max caracteres.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10772, 'es', 'validation', 'The :attribute must have between :min and :max items.', 'El campo :attribute debe tener entre :min y :max elementos.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10773, 'es', 'validation', 'The :attribute field must be true or false.', 'El campo :attribute debe ser verdadero o falso.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10774, 'es', 'validation', 'The :attribute confirmation does not match.', 'La confirmación de :attribute no coincide.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10775, 'es', 'validation', 'The password is incorrect.', 'La contraseña es incorrecta.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10776, 'es', 'validation', 'The :attribute is not a valid date.', 'El campo :attribute no es una fecha válida.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10777, 'es', 'validation', 'The :attribute must be a date equal to :date.', 'El campo :attribute debe ser una fecha igual a :date.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10778, 'es', 'validation', 'The :attribute does not match the format :format.', 'El campo :attribute no coincide con el formato :format.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10779, 'es', 'validation', 'The :attribute and :other must be different.', 'El campo :attribute y :other deben ser diferentes.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10780, 'es', 'validation', 'The :attribute must be :digits digits.', 'El campo :attribute debe tener :digits dígitos.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10781, 'es', 'validation', 'The :attribute must be between :min and :max digits.', 'El campo :attribute debe tener entre :min y :max dígitos.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10782, 'es', 'validation', 'The :attribute has invalid image dimensions.', 'El campo :attribute tiene dimensiones de imagen no válidas.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10783, 'es', 'validation', 'The :attribute field has a duplicate value.', 'El campo :attribute tiene un valor duplicado.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10784, 'es', 'validation', 'The :attribute must be a valid email address.', 'El campo :attribute debe ser un correo electrónico válido.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10785, 'es', 'validation', 'The :attribute must end with one of the following: :values.', 'El campo :attribute debe terminar con uno de los siguientes valores: :values.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10786, 'es', 'validation', 'The selected :attribute is invalid.', 'El campo :attribute seleccionado no es válido.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10787, 'es', 'validation', 'The :attribute must be a file.', 'El campo :attribute debe ser un archivo.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10788, 'es', 'validation', 'The :attribute field must have a value.', 'El campo :attribute debe tener un valor.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10789, 'es', 'validation', 'The :attribute must be greater than :value.', 'El campo :attribute debe ser mayor que :value.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10790, 'es', 'validation', 'The :attribute must be greater than :value kilobytes.', 'El campo :attribute debe ser mayor que :value kilobytes.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10791, 'es', 'validation', 'The :attribute must be greater than :value characters.', 'El campo :attribute debe tener más de :value caracteres.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10792, 'es', 'validation', 'The :attribute must have more than :value items.', 'El campo :attribute debe tener más de :value elementos.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10793, 'es', 'validation', 'The :attribute must be greater than or equal :value.', 'El campo :attribute debe ser mayor o igual a :value.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10794, 'es', 'validation', 'The :attribute must be greater than or equal :value kilobytes.', 'El campo :attribute debe ser mayor o igual a :value kilobytes.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10795, 'es', 'validation', 'The :attribute must be greater than or equal :value characters.', 'El campo :attribute debe tener más de o igual a :value caracteres.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10796, 'es', 'validation', 'The :attribute must have :value items or more.', 'El campo :attribute debe tener :value elementos o más.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10797, 'es', 'validation', 'The :attribute must be an image.', 'El campo :attribute debe ser una imagen.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10798, 'es', 'validation', 'The :attribute field does not exist in :other.', 'El campo :attribute no existe en :other.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10799, 'es', 'validation', 'The :attribute must be an integer.', 'El campo :attribute debe ser un número entero.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10800, 'es', 'validation', 'The :attribute must be a valid IP address.', 'El campo :attribute debe ser una dirección IP válida.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10801, 'es', 'validation', 'The :attribute must be a valid IPv4 address.', 'El campo :attribute debe ser una dirección IPv4 válida.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10802, 'es', 'validation', 'The :attribute must be a valid IPv6 address.', 'El campo :attribute debe ser una dirección IPv6 válida.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10803, 'es', 'validation', 'The :attribute must be a valid JSON string.', 'El campo :attribute debe ser una cadena JSON válida.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10804, 'es', 'validation', 'The :attribute must be less than :value.', 'El campo :attribute debe ser menor que :value.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10805, 'es', 'validation', 'The :attribute must be less than :value kilobytes.', 'El campo :attribute debe ser menor que :value kilobytes.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10806, 'es', 'validation', 'The :attribute must be less than :value characters.', 'El campo :attribute debe tener menos de :value caracteres.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10807, 'es', 'validation', 'The :attribute must have less than :value items.', 'El campo :attribute debe tener menos de :value elementos.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10808, 'es', 'validation', 'The :attribute must be less than or equal :value.', 'El campo :attribute debe ser menor o igual a :value.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10809, 'es', 'validation', 'The :attribute must be less than or equal :value kilobytes.', 'El campo :attribute debe ser menor o igual a :value kilobytes.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10810, 'es', 'validation', 'The :attribute must be less than or equal :value characters.', 'El campo :attribute debe tener como máximo :value caracteres.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10811, 'es', 'validation', 'The :attribute must not have more than :value items.', 'El campo :attribute no debe tener más de :value elementos.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10812, 'es', 'validation', 'The :attribute must not be greater than :max.', 'El campo :attribute no debe ser mayor que :max.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10813, 'es', 'validation', 'The :attribute must not be greater than :max kilobytes.', 'El campo :attribute no debe ser mayor que :max kilobytes.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10814, 'es', 'validation', 'The :attribute must not be greater than :max characters.', 'El campo :attribute no debe tener más de :max caracteres.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10815, 'es', 'validation', 'The :attribute must not have more than :max items.', 'El campo :attribute no debe tener más de :max elementos.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10816, 'es', 'validation', 'The :attribute must be a file of type: :values.', 'El campo :attribute debe ser un archivo de tipo: :values.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10817, 'es', 'validation', 'The :attribute must be at least :min.', 'El campo :attribute debe tener al menos :min.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10818, 'es', 'validation', 'The :attribute must be at least :min kilobytes.', 'El campo :attribute debe tener al menos :min kilobytes.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10819, 'es', 'validation', 'The :attribute must be at least :min characters.', 'El campo :attribute debe tener al menos :min caracteres.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10820, 'es', 'validation', 'The :attribute must have at least :min items.', 'El campo :attribute debe tener al menos :min elementos.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10821, 'es', 'validation', 'The :attribute must be a multiple of :value.', 'El campo :attribute debe ser un múltiplo de :value.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10822, 'es', 'validation', 'The :attribute format is invalid.', 'El formato de :attribute no es válido.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10823, 'es', 'validation', 'The :attribute must be a number.', 'El campo :attribute debe ser un número.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10824, 'es', 'validation', 'The :attribute field must be present.', 'El campo :attribute debe estar presente.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10825, 'es', 'validation', 'The :attribute field is required.', 'El campo :attribute es obligatorio.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10826, 'es', 'validation', 'The :attribute field is required when :other is :value.', 'El campo :attribute es obligatorio cuando :other es :value.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10827, 'es', 'validation', 'The :attribute field is required unless :other is in :values.', 'El campo :attribute es obligatorio a menos que :other esté en :values.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10828, 'es', 'validation', 'The :attribute field is required when :values is present.', 'El campo :attribute es obligatorio cuando :values está presente.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10829, 'es', 'validation', 'The :attribute field is required when :values are present.', 'El campo :attribute es obligatorio cuando :values están presentes.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10830, 'es', 'validation', 'The :attribute field is required when :values is not present.', 'El campo :attribute es obligatorio cuando :values no está presente.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10831, 'es', 'validation', 'The :attribute field is required when none of :values are present.', 'El campo :attribute es obligatorio cuando ninguno de :values está presente.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10832, 'es', 'validation', 'The :attribute field is prohibited.', 'El campo :attribute está prohibido.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10833, 'es', 'validation', 'The :attribute field is prohibited when :other is :value.', 'El campo :attribute está prohibido cuando :other es :value.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10834, 'es', 'validation', 'The :attribute field is prohibited unless :other is in :values.', 'El campo :attribute está prohibido a menos que :other esté en :values.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10835, 'es', 'validation', 'The :attribute field prohibits :other from being present.', 'El campo :attribute prohíbe que :other esté presente.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10836, 'es', 'validation', 'The :attribute and :other must match.', 'El campo :attribute y :other deben coincidir.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10837, 'es', 'validation', 'The :attribute must be :size.', 'El campo :attribute debe ser :size.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10838, 'es', 'validation', 'The :attribute must be :size kilobytes.', 'El campo :attribute debe ser de :size kilobytes.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10839, 'es', 'validation', 'The :attribute must be :size characters.', 'El campo :attribute debe tener :size caracteres.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10840, 'es', 'validation', 'The :attribute must contain :size items.', 'El campo :attribute debe contener :size elementos.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10841, 'es', 'validation', 'The :attribute must start with one of the following: :values.', 'El campo :attribute debe comenzar con uno de los siguientes valores: :values.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10842, 'es', 'validation', 'The :attribute must be a string.', 'El campo :attribute debe ser una cadena de texto.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10843, 'es', 'validation', 'The :attribute must be a valid timezone.', 'El campo :attribute debe ser una zona horaria válida.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10844, 'es', 'validation', 'The :attribute has already been taken.', 'El campo :attribute ya ha sido tomado.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10845, 'es', 'validation', 'The :attribute failed to upload.', 'El campo :attribute falló al subir.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10846, 'es', 'validation', 'The :attribute must be a valid URL.', 'El campo :attribute debe ser una URL válida.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10847, 'es', 'validation', 'The :attribute must be a valid UUID.', 'El campo :attribute debe ser un UUID válido.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10848, 'es', 'general', 'Previous', 'Anterior', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10849, 'es', 'general', 'Next', 'Siguiente', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10850, 'es', 'alerts', 'These credentials do not match our records.', 'Estas credenciales no coinciden con nuestros registros.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10851, 'es', 'alerts', 'The provided password is incorrect.', 'La contraseña proporcionada es incorrecta.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10852, 'es', 'alerts', 'Too many login attempts. Please try again in :seconds seconds.', 'Demasiados intentos de inicio de sesión. Por favor, inténtalo de nuevo en :seconds segundos.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10853, 'es', 'alerts', 'Your password has been reset!', '¡Tu contraseña ha sido restablecida!', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10854, 'es', 'alerts', 'We have emailed your password reset link!', '¡Te hemos enviado el enlace para restablecer tu contraseña!', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10855, 'es', 'alerts', 'Please wait before retrying.', 'Por favor, espera antes de intentar de nuevo.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10856, 'es', 'alerts', 'This password reset token is invalid.', 'Este token para restablecer contraseña no es válido.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10857, 'es', 'alerts', 'We can\'t find a user with that email address.', 'No podemos encontrar un usuario con esa dirección de correo electrónico.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10858, 'es', 'forms', 'captcha', 'captcha', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10859, 'es', 'tickets', 'Opened', 'Abierto', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10860, 'es', 'tickets', 'Answered', 'Respondido', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10861, 'es', 'tickets', 'Closed', 'Cerrado', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10862, 'es', 'tickets', 'Replied', 'Respondido', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10863, 'es', 'tickets', 'Normal', 'Normal', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10864, 'es', 'tickets', 'Low', 'Baja', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10865, 'es', 'tickets', 'Urgent', 'Urgente', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10866, 'es', 'tickets', 'High', 'Alta', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10867, 'es', 'user', 'Sign In', 'Iniciar Sesión', '2025-07-09 10:38:27', '2025-07-09 12:35:18'),
(10868, 'es', 'user', 'Sign Up', 'Registrarse', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10869, 'es', 'user', 'Reset Password', 'Restablecer Contraseña', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10870, 'es', 'user', 'Welcome!', '¡Bienvenido!', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10871, 'es', 'user', 'Login to your account', 'Inicia sesión en tu cuenta', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10872, 'es', 'forms', 'Email address', 'Correo electrónico', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10873, 'es', 'forms', 'Password', 'Contraseña', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10874, 'es', 'user', 'Remember Me', 'Recuérdame', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10875, 'es', 'user', 'Forgot Your Password?', '¿Olvidaste tu Contraseña?', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10876, 'es', 'user', 'Or', 'O', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10877, 'es', 'user', 'Sign in With Facebook', 'Inicia Sesión con Facebook', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10878, 'es', 'user', 'After submitting a valid email address on this form, you will receive instructions telling you how to reset your password.', 'Después de enviar una dirección de correo válida en este formulario, recibirás instrucciones para restablecer tu contraseña.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10879, 'es', 'user', 'Reset', 'Restablecer', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10880, 'es', 'user', 'Enter a new password to continue.', 'Ingresa una nueva contraseña para continuar.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10881, 'es', 'forms', 'Confirm password', 'Confirmar contraseña', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10882, 'es', 'user', 'Please confirm your password before continuing.', 'Por favor, confirma tu contraseña antes de continuar.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10883, 'es', 'user', 'Confirm Password', 'Confirmar Contraseña', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10884, 'es', 'forms', 'First Name', 'Nombre', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10885, 'es', 'forms', 'Last Name', 'Apellido', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10886, 'es', 'forms', 'Username', 'Usuario', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10887, 'es', 'general', 'Choose', 'Elegir', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10888, 'es', 'forms', 'Country', 'País', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10889, 'es', 'forms', 'Phone Number', 'Número de Teléfono', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10890, 'es', 'user', 'I agree to the', 'Acepto los', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10891, 'es', 'user', 'terms of service', 'términos de servicio', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10892, 'es', 'user', 'Continue', 'Continuar', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10893, 'es', 'user', 'Create account', 'Crear Cuenta', '2025-07-09 10:38:27', '2025-07-09 12:35:18'),
(10894, 'es', 'user', 'Fill this form to create a new account.', 'Llena este formulario para crear una nueva cuenta.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10895, 'es', 'alerts', 'Country not exists', 'El país no existe', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10896, 'es', 'alerts', 'Phone code not exsits', 'El código de país no existe', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10897, 'es', 'alerts', 'Registration is currently disabled.', 'El registro está actualmente deshabilitado.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10898, 'es', 'alerts', 'Your account has been blocked', 'Tu cuenta ha sido bloqueada', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10899, 'es', 'user', 'Verify Your Email Address', 'Verifica tu dirección de correo electrónico', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10900, 'es', 'user', 'Thanks for getting started with', 'Gracias por comenzar con', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10901, 'es', 'user', 'We need a little more information to complete your registration, including a confirmation of your email address.', 'Necesitamos un poco más de información para completar tu registro, incluyendo la confirmación de tu correo electrónico.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10902, 'es', 'user', 'Please follow the instruction that we sent to your email, if you didn\'t receive the email click resent to get a new one.', 'Por favor, sigue las instrucciones que enviamos a tu correo, si no recibiste el correo haz clic en reenviar para obtener uno nuevo.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10903, 'es', 'user', 'Resend', 'Reenviar', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10904, 'es', 'user', 'Change Email', 'Cambiar Correo', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10905, 'es', 'alerts', 'Link has been resend Successfully', 'El enlace ha sido reenviado exitosamente', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10906, 'es', 'user', 'Save', 'Guardar', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10907, 'es', 'alerts', 'You must to change the email to make a change', 'Debes cambiar el correo para hacer un cambio', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10908, 'es', 'alerts', 'Email has been changed successfully', 'El correo ha sido cambiado exitosamente', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10909, 'es', 'user', 'Logout', 'Cerrar Sesión', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10910, 'es', 'user', 'Dashboard', 'Escritorio', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10911, 'es', 'user', 'My Tickets', 'Mis Tickets', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10912, 'es', 'user', 'Settings', 'Configuraciones', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10913, 'es', 'user', 'Account Details', 'Detalles de la Cuenta', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10914, 'es', 'user', 'Change Password', 'Cambiar Contraseña', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10915, 'es', 'user', '2FA Authentication', 'Autenticación 2FA', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10916, 'es', 'user', 'No Results Found', 'No se encontraron resultados', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10917, 'es', 'user', 'It looks like this section is empty or your search did not return any results, you can start creating a content or search using another word', 'Parece que esta sección está vacía o tu búsqueda no arrojó resultados, puedes empezar a crear un contenido o buscar usando otra palabra', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10918, 'es', 'user', 'Back', 'Atrás', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10919, 'es', 'tickets', 'Ticket number', 'Número de Ticket', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10920, 'es', 'tickets', 'Subject', 'Asunto', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10921, 'es', 'tickets', 'Priority', 'Prioridad', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10922, 'es', 'tickets', 'Status', 'Estado', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10923, 'es', 'tickets', 'Opened date', 'Fecha de Apertura', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10924, 'es', 'tickets', 'Action', 'Acción', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10925, 'es', 'tickets', 'Open new ticket', 'Abrir nuevo ticket', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10926, 'es', 'tickets', 'Message', 'Mensaje', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10927, 'es', 'tickets', 'Files', 'Archivos', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10928, 'es', 'tickets', 'Supported types', 'Tipos soportados', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10929, 'es', 'tickets', 'Ticket Created Successfully', 'Ticket Creado Exitosamente', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10930, 'es', 'tickets', 'Send', 'Enviar', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10931, 'es', 'tickets', 'Max 5 files can be uploaded', 'Se pueden subir máximo 5 archivos', '2025-07-09 10:38:27', '2025-07-09 10:38:27');
INSERT INTO `translates` (`id`, `lang`, `group_name`, `key`, `value`, `created_at`, `updated_at`) VALUES
(10932, 'es', 'tickets', 'Max file size is 2MB', 'El tamaño máximo de archivo es 2MB', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10933, 'es', 'tickets', 'cannot be uploaded', 'no se puede subir', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10934, 'es', 'tickets', 'Reply message', 'Mensaje de respuesta', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10935, 'es', 'tickets', 'Reply Sent Successfully', 'Respuesta Enviada Exitosamente', '2025-07-09 10:38:27', '2025-07-09 11:31:47'),
(10936, 'es', 'tickets', 'Attachment', 'Adjunto', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10937, 'es', 'tickets', 'Note', 'Nota', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10938, 'es', 'tickets', 'Ticket has been closed you can sent a reply to reopen it', 'El ticket ha sido cerrado, puedes enviar una respuesta para reabrirlo', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10939, 'es', 'tickets', 'Ticket', 'Ticket', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10940, 'es', 'user', 'Type to search...', 'Escribe para buscar...', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10941, 'es', 'user', 'Notifications', 'Notificaciones', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10942, 'es', 'user', 'Make All as Read', 'Marcar todo como leído', '2025-07-09 10:38:27', '2025-07-09 12:35:18'),
(10943, 'es', 'user', 'View All', 'Ver Todo', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10944, 'es', 'user', 'All notifications has been read successfully', 'Todas las notificaciones han sido leídas exitosamente', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10945, 'es', 'user', 'User', 'Usuario', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10946, 'es', 'user', 'No notifications found', 'No se encontraron notificaciones', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10947, 'es', 'alerts', 'Connection error please try again', 'Error de conexión, por favor intenta de nuevo', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10948, 'es', 'alerts', 'Upload error', 'Error de carga', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10949, 'es', 'user', 'Complete registration', 'Completar Registro', '2025-07-09 10:38:27', '2025-07-09 12:35:18'),
(10950, 'es', 'user', 'We need a little more information to complete your registration.', 'Necesitamos un poco más de información para completar tu registro.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10951, 'es', 'alerts', 'Unauthorized or expired token', 'Token no autorizado o expirado', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10952, 'es', 'user', 'Are you sure?', '¿Estás Seguro?', '2025-07-09 10:38:27', '2025-07-09 12:35:18'),
(10953, 'es', 'user', 'Confirm that you want do this action', 'Confirma que quieres realizar esta acción', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10954, 'es', 'user', 'Confirm', 'Confirmar', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10955, 'es', 'user', 'Cancel', 'Cancelar', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10956, 'es', 'user', 'Change', 'Cambiar', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10957, 'es', 'forms', 'Address line 1', 'Dirección línea 1', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10958, 'es', 'forms', 'Address line 2', 'Dirección línea 2', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10959, 'es', 'forms', 'Apartment, suite, etc. (optional)', 'Apartamento, suite, etc. (opcional)', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10960, 'es', 'forms', 'City', 'Ciudad', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10961, 'es', 'forms', 'State', 'Estado', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10962, 'es', 'forms', 'Postal code', 'Código postal', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10963, 'es', 'user', 'Save Changes', 'Guardar Cambios', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10964, 'es', 'alerts', 'Phone number already exist', 'El número de teléfono ya existe', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10965, 'es', 'alerts', 'You must to change the phone number to make a change', 'Debes cambiar el número de teléfono para hacer un cambio', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10966, 'es', 'alerts', 'Phone number has been changed successfully', 'El número de teléfono se ha cambiado correctamente', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10967, 'es', 'alerts', 'Phone number must be in the same country where you located', 'El número de teléfono debe estar en el mismo país donde te encuentras', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10968, 'es', 'alerts', 'Account details has been updated successfully', 'Los detalles de la cuenta se han actualizado correctamente', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10969, 'es', 'user', 'Verify Your New Email Address', 'Verifica tu nueva dirección de correo electrónico', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10970, 'es', 'user', 'Since you have changed your email address, we need to verify that it is really your email', 'Como has cambiado tu dirección de correo electrónico, necesitamos verificar que realmente sea tuya', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10971, 'es', 'forms', 'New Password', 'Nueva Contraseña', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10972, 'es', 'forms', 'Confirm New Password', 'Confirmar Nueva Contraseña', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10973, 'es', 'alerts', 'Your current password does not matches with the password you provided', 'Tu contraseña actual no coincide con la que proporcionaste', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10974, 'es', 'alerts', 'New Password cannot be same as your current password. Please choose a different password', 'La nueva contraseña no puede ser igual a tu contraseña actual. Por favor elige una contraseña diferente', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10975, 'es', 'alerts', 'Account password has been changed successfully', 'La contraseña de la cuenta se ha cambiado correctamente', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10976, 'es', 'user', 'Two-factor authentication (2FA) strengthens access security by requiring two methods (also referred to as factors) to verify your identity. Two-factor authentication protects against phishing, social engineering, and password brute force attacks and secures your logins from attackers exploiting weak or stolen credentials.', 'La autenticación de dos factores (2FA) fortalece la seguridad de acceso al requerir dos métodos (también llamados factores) para verificar tu identidad. La autenticación de dos factores protege contra phishing, ingeniería social y ataques de fuerza bruta de contraseñas, y asegura tus inicios de sesión contra atacantes que exploten credenciales débiles o robadas.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10977, 'es', 'user', 'To use the two factor authentication, you have to install a Google Authenticator compatible app. Here are some that are currently available', 'Para usar la autenticación de dos factores, tienes que instalar una app compatible con Google Authenticator. Aquí tienes algunas que están disponibles actualmente', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10978, 'es', 'user', 'Google Authenticator for iOS', 'Google Authenticator para iOS', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10979, 'es', 'user', 'Google Authenticator for Android', 'Google Authenticator para Android', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10980, 'es', 'user', 'Microsoft Authenticator for iOS', 'Microsoft Authenticator para iOS', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10981, 'es', 'user', 'Microsoft Authenticator for Android', 'Microsoft Authenticator para Android', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10982, 'es', 'user', 'Enable', 'Habilitar', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10983, 'es', 'user', 'Enable 2FA Authentication', 'Habilitar Autenticación 2FA', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10984, 'es', 'alerts', 'Invalid OTP code', 'Código OTP no válido', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10985, 'es', 'alerts', '2FA Authentication has been enabled successfully', 'La Autenticación 2FA se ha habilitado correctamente', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10986, 'es', 'user', 'Disable 2FA Authentication', 'Deshabilitar Autenticación 2FA', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10987, 'es', 'user', 'Disable', 'Deshabilitar', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10988, 'es', 'alerts', '2FA Authentication has been disabled successfully', 'La Autenticación 2FA se ha deshabilitado correctamente', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10989, 'es', 'forms', 'OTP Code', 'Código OTP', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10990, 'es', 'user', '2Fa Verification', 'Verificación 2Fa', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10991, 'es', 'user', 'Please enter the OTP code to continue', 'Por favor ingresa el código OTP para continuar', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10992, 'es', 'error pages', 'Page Not Found', 'Página No Encontrada', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10993, 'es', 'error pages', 'Unauthorized', 'No Autorizado', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10994, 'es', 'error pages', 'Server Error', 'Error del Servidor', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10995, 'es', 'error pages', 'Service Unavailable', 'Servicio No Disponible', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10996, 'es', 'error pages', 'Too Many Requests', 'Demasiadas Solicitudes', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10997, 'es', 'error pages', 'Forbidden', 'Prohibido', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10998, 'es', 'error pages', 'Page Expired', 'Página Expirada', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(10999, 'es', 'error pages', 'You can’t always get what you want. It’s true in life, and it’s true on the web — sometimes, what you’re looking for just isn’t there', 'No siempre puedes obtener lo que quieres. Es cierto en la vida, y es cierto en la web: a veces, lo que buscas simplemente no está allí', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11000, 'es', 'error pages', 'Back to home', 'Volver al inicio', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11001, 'es', 'general', 'We use cookies to personalize your experience. By continuing to visit this website you agree to our use of cookies', 'Usamos cookies para personalizar tu experiencia. Al continuar visitando este sitio web, aceptas el uso de cookies', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11002, 'es', 'general', 'Got it', 'Entendido', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11003, 'es', 'general', 'More', 'Más', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11004, 'es', 'alerts', 'Cookie accepted successfully', 'Cookie aceptada correctamente', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11005, 'es', 'general', 'Close', 'Cerrar', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11006, 'es', 'tickets', 'All', 'Todos', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11007, 'es', 'forms', 'Name', 'Nombre', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11008, 'es', 'forms', 'Subject', 'Asunto', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11009, 'es', 'forms', 'Message', 'Mensaje', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11010, 'es', 'blog', 'Read More', 'Leer Más', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11011, 'es', 'general', 'Faq', 'Preguntas Frecuentes', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11012, 'es', 'blog', 'Blog', 'Blog', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11013, 'es', 'blog', 'Categories', 'Categorías', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11014, 'es', 'blog', 'Popular articles', 'Artículos populares', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11015, 'es', 'blog', 'Search..', 'Buscar..', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11016, 'es', 'blog', 'No data found', 'No se encontraron datos', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11017, 'es', 'blog', 'It looks like there is no articles or your search did not return any results', 'Parece que no hay artículos o tu búsqueda no arrojó ningún resultado', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11018, 'es', 'blog', 'Leave a comment', 'Dejar un comentario', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11019, 'es', 'blog', 'Your comment', 'Tu comentario', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11020, 'es', 'blog', 'Publish', 'Publicar', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11021, 'es', 'alerts', 'Login is required to post comments', 'Debes iniciar sesión para publicar comentarios', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11022, 'es', 'alerts', 'Article not exists', 'El artículo no existe', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11023, 'es', 'alerts', 'Your comment is under review it will be published soon', 'Tu comentario está en revisión, será publicado pronto', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11024, 'es', 'blog', 'Comments', 'Comentarios', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11025, 'es', 'blog', 'No comments available', 'No hay comentarios disponibles', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11026, 'es', 'blog', 'Login or create account to leave comments', 'Inicia sesión o crea una cuenta para dejar comentarios', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11027, 'es', 'plans', 'Monthly', 'Mensual', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11028, 'es', 'plans', 'Yearly', 'Anual', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11029, 'es', 'plans', 'month', 'mes', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11030, 'es', 'plans', 'year', 'año', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11031, 'es', 'plans', 'Storage Space', 'Espacio de Almacenamiento', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11032, 'es', 'plans', 'Unlimited', 'Ilimitado', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11033, 'es', 'plans', 'Size per transfer', 'Tamaño por transferencia', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11034, 'es', 'general', 'free', 'gratis', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11035, 'es', 'plans', 'Files available for', 'Archivos disponibles por', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11036, 'es', 'plans', 'Unlimited time', 'Tiempo ilimitado', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11037, 'es', 'plans', 'Password protection', 'Protección con contraseña', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11038, 'es', 'plans', 'Email notification', 'Notificación por correo', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11039, 'es', 'plans', 'Expiry time control', 'Control de tiempo de expiración', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11040, 'es', 'plans', 'Generate transfer links', 'Generar enlaces de transferencia', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11041, 'es', 'plans', 'Choose Plan', 'Elegir Plan', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11042, 'es', 'plans', 'No monthly plans available', 'No hay planes mensuales disponibles', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11043, 'es', 'plans', 'No yearly plans available', 'No hay planes anuales disponibles', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11044, 'es', 'checkout', 'Checkout', 'Pagar', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11045, 'es', 'checkout', 'Billing address', 'Dirección de facturación', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11046, 'es', 'checkout', 'Payment Methods', 'Métodos de Pago', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11047, 'es', 'checkout', 'SSL Secure Payment', 'Pago SSL Seguro', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11048, 'es', 'checkout', 'Your information is protected by 256-bit SSL encryption', 'Tu información está protegida con cifrado SSL de 256 bits', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11049, 'es', 'checkout', 'Pay Now', 'Pagar Ahora', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11050, 'es', 'checkout', 'Order Summary', 'Resumen del Pedido', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11051, 'es', 'checkout', 'No payment methods available right now please try again later.', 'No hay métodos de pago disponibles en este momento, por favor intenta más tarde.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11052, 'es', 'alerts', 'Please login or create an account to choose a plan', 'Por favor inicia sesión o crea una cuenta para elegir un plan', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11053, 'es', 'alerts', 'You already subscribed but you can upgrade by clicking on the upgrade button.', 'Ya tienes una suscripción, pero puedes actualizarla haciendo clic en el botón de actualizar.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11054, 'es', 'alerts', 'Choosed plan is not exists', 'El plan elegido no existe', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11055, 'es', 'checkout', 'Tax', 'Impuesto', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11056, 'es', 'checkout', 'Total', 'Total', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11057, 'es', 'checkout', 'Plan', 'Plan', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11058, 'es', 'checkout', 'Selected payment method is not active ', 'El método de pago seleccionado no está activo', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11059, 'es', 'checkout', 'Invalid or expired transaction', 'Transacción inválida o expirada', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11060, 'es', 'checkout', 'Payment failed', 'El pago ha fallado', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11061, 'es', 'checkout', 'Process payment failed', 'El proceso de pago ha fallado', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11062, 'es', 'checkout', 'Payment gateways may charge extra fees', 'Los gateways de pago pueden cobrar tarifas extra', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11063, 'es', 'plans', 'Featured', 'Destacado', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11064, 'es', 'checkout', 'Payment made successfully', 'Pago realizado correctamente', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11065, 'es', 'checkout', 'Incomplete payment please open a ticket or contact us', 'Pago incompleto, por favor abre un ticket o contáctanos', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11066, 'es', 'plans', 'Upgrade plan', 'Actualizar plan', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11067, 'es', 'plans', 'Renew plan', 'Renovar plan', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11068, 'es', 'plans', 'Your plan', 'Tu plan', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11069, 'es', 'alerts', 'You can only renew your current plan or upgrade to new plan', 'Solo puedes renovar tu plan actual o actualizar a un nuevo plan', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11070, 'es', 'alerts', 'You need to subscribe before you can renew the plan', 'Debes suscribirte antes de poder renovar el plan', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11071, 'es', 'user', 'My Subscription', 'Mi Suscripción', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11072, 'es', 'user', 'Storage space', 'Espacio de almacenamiento', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11073, 'es', 'user', 'Subscription Expiry', 'Expiración de la suscripción', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11074, 'es', 'user', 'Day left', 'Día restante', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11075, 'es', 'user', 'Renew Subscription', 'Renovar Suscripción', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11076, 'es', 'user', 'Days left', 'Días restantes', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11077, 'es', 'user', 'Expired', 'Expirado', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11078, 'es', 'user', 'Today', 'Hoy', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11079, 'es', 'user', 'Less than one day left', 'Menos de un día restante', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11080, 'es', 'user', 'of', 'de', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11081, 'es', 'user', 'Transactions', 'Transacciones', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11082, 'es', 'user', 'Transaction Number', 'Número de Transacción', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11083, 'es', 'user', 'Plan Price', 'Precio del Plan', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11084, 'es', 'user', 'Total', 'Total', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11085, 'es', 'user', 'Status', 'Estado', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11086, 'es', 'user', 'Action', 'Acción', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11087, 'es', 'user', 'Paid', 'Pagado', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11088, 'es', 'user', 'Transaction date', 'Fecha de la transacción', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11089, 'es', 'user', 'Type', 'Tipo', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11090, 'es', 'user', 'Renew', 'Renovar', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11091, 'es', 'user', 'Subscribe', 'Suscribirse', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11092, 'es', 'user', 'Plan (Interval)', 'Plan (Intervalo)', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11093, 'es', 'alerts', 'Subscribed Successfully', 'Suscrito Correctamente', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11094, 'es', 'user', 'Upgrade', 'Actualizar', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11095, 'es', 'general', 'Pricing plans', 'Planes de precios', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11096, 'es', 'user', 'Choose your plan to complete the subscription', 'Elige tu plan para completar la suscripción', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11097, 'es', 'checkout', 'No payment method needed.', 'No se necesita método de pago.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11098, 'es', 'checkout', 'Continue', 'Continuar', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11099, 'es', 'user', 'Unlimited', 'Ilimitado', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11100, 'es', 'alerts', 'You subscribed in free plan it will renew automatically after it gets expiry', 'Te suscribiste al plan gratuito, se renovará automáticamente después de que expire', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11101, 'es', 'user', 'Unlimited time', 'Tiempo ilimitado', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11102, 'es', 'user', 'Subscription details', 'Detalles de la suscripción', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11103, 'es', 'user', 'Plan Name', 'Nombre del Plan', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11104, 'es', 'user', 'Plan Interval', 'Intervalo del Plan', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11105, 'es', 'user', 'Size Per Transfer', 'Tamaño Por Transferencia', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11106, 'es', 'user', 'Files duration', 'Duración de archivos', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11107, 'es', 'user', 'Password protection', 'Protección con contraseña', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11108, 'es', 'user', 'Email notification', 'Notificación por correo', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11109, 'es', 'user', 'Expiry time control', 'Control de tiempo de expiración', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11110, 'es', 'user', 'Generate transfer links', 'Generar enlaces de transferencia', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11111, 'es', 'user', 'Your storage space', 'Tu espacio de almacenamiento', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11112, 'es', 'user', 'Total transfers', 'Total de transferencias', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11113, 'es', 'user', 'Transaction details', 'Detalles de la transacción', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11114, 'es', 'user', 'Taxes', 'Impuestos', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11115, 'es', 'user', 'Gateway Fees', 'Tarifas del Gateway', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11116, 'es', 'user', 'Transaction Type', 'Tipo de transacción', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11117, 'es', 'user', 'Transaction Status', 'Estado de la transacción', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11118, 'es', 'user', 'Cancellation Reason', 'Motivo de cancelación', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11119, 'es', 'user', 'Payment Gateway', 'Gateway de Pago', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11120, 'es', 'notifications', 'Your subscription will expiry soon', 'Tu suscripción expirará pronto', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11121, 'es', 'notifications', 'Your free subscription has been renewed', 'Tu suscripción gratuita ha sido renovada', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11122, 'es', 'notifications', 'New Ticket Created {ticket_number}', 'Nuevo Ticket Creado {ticket_number}', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11123, 'es', 'notifications', 'Ticket {ticket_number} New Reply', 'Nuevo Mensaje en el Ticket {ticket_number}', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11124, 'es', 'notifications', 'Ticket Closed {ticket_number}', 'Ticket Cerrado {ticket_number}', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11125, 'es', 'notifications', 'Thanks for joining us {user_firstname}!', '¡Gracias por unirte a nosotros {user_firstname}!', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11126, 'es', 'notifications', 'Your subscription has been expired', 'Tu suscripción ha expirado', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11127, 'es', 'notifications', 'Your files will be deleted after {delete_interval}', 'Tus archivos serán eliminados después de {delete_interval}', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11128, 'es', 'general', 'day', 'día', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11129, 'es', 'general', 'days', 'días', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11130, 'es', 'user', 'Your subscription has been expired, Please renew it to continue using the service.', 'Tu suscripción ha expirado, por favor renuévala para continuar usando el servicio.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11131, 'es', 'user', 'Your subscription is about expired, Renew it to avoid deleting your files.', 'Tu suscripción está a punto de expirar, renuévala para evitar que tus archivos se eliminen.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11132, 'es', 'alerts', 'You have no subscription or your subscription has been expired', 'No tienes suscripción o tu suscripción ha expirado', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11133, 'es', 'alerts', 'Login or create account to start transferring files', 'Inicia sesión o crea una cuenta para empezar a transferir archivos', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11134, 'es', 'alerts', 'Your subscription has been canceled, please contact us for more information', 'Tu suscripción ha sido cancelada, por favor contáctanos para más información', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11135, 'es', 'user', 'Start Transfer', 'Iniciar Transferencia', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11136, 'es', 'alerts', 'Insufficient storage space, please check your space or upgrade your plan', 'Espacio de almacenamiento insuficiente, revisa tu espacio o actualiza tu plan', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11137, 'es', 'user', 'Remaining', 'Restante', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11138, 'es', 'alerts', 'You need to subscribe before you can upgrade the plan', 'Debes suscribirte antes de poder actualizar el plan', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11139, 'es', 'alerts', 'You cannot upgrade to this plan, storage space not enough', 'No puedes actualizar a este plan, el espacio de almacenamiento no es suficiente', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11140, 'es', 'user', 'Copied to clipboard', 'Copiado al portapapeles', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11141, 'es', 'user', 'Your transfers', 'Tus transferencias', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11142, 'es', 'user', 'Transfer number', 'Número de transferencia', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11143, 'es', 'user', 'Transferred at', 'Transferido en', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11144, 'es', 'user', 'Expiring at', 'Expira en', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11145, 'es', 'user', 'Transfer method', 'Método de transferencia', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11146, 'es', 'user', 'Transferred by link', 'Transferido por enlace', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11147, 'es', 'user', 'Transferred by email', 'Transferido por correo', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11148, 'es', 'user', 'Transferred', 'Transferido', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11149, 'es', 'user', 'Canceled', 'Cancelado', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11150, 'es', 'user', 'Downloaded', 'Descargado', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11151, 'es', 'user', 'No', 'No', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11152, 'es', 'user', 'Yes', 'Sí', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11153, 'es', 'user', 'Transfer details', 'Detalles de la transferencia', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11154, 'es', 'user', 'Transfer link', 'Enlace de transferencia', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11155, 'es', 'user', 'Copy', 'Copiar', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11156, 'es', 'user', 'Emails', 'Correos', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11157, 'es', 'user', 'Transferred files', 'Archivos transferidos', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11158, 'es', 'user', 'Transfer not exists or expired', 'La transferencia no existe o ha expirado', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11159, 'es', 'user', 'Transfer must have one file at least', 'La transferencia debe tener al menos un archivo', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11160, 'es', 'user', 'Transfer file not exists', 'El archivo de la transferencia no existe', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11161, 'es', 'user', 'File deleted successfully', 'Archivo eliminado correctamente', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11162, 'es', 'user', 'Downloaded at', 'Descargado en', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11163, 'es', 'user', 'Last update', 'Última actualización', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11164, 'es', 'user', 'Sender email', 'Correo del remitente', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11165, 'es', 'user', 'Sender name', 'Nombre del remitente', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11166, 'es', 'user', 'Transfer settings', 'Configuración de la transferencia', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11167, 'es', 'user', 'Transfer password', 'Contraseña de la transferencia', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11168, 'es', 'user', 'Transfer has been expired', 'La transferencia ha expirado', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11169, 'es', 'user', 'Transfer has been canceled', 'La transferencia ha sido cancelada', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11170, 'es', 'user', 'Leave it empty to remove password', 'Déjalo vacío para eliminar la contraseña', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11171, 'es', 'user', 'Transfer updated successfully', 'Transferencia actualizada correctamente', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11172, 'es', 'user', 'My Transfers', 'Mis Transferencias', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11173, 'es', 'user', 'Active transfers', 'Transferencias activas', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11174, 'es', 'user', 'Expired transfers', 'Transferencias expiradas', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11175, 'es', 'user', 'Canceled transfers', 'Transferencias canceladas', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11176, 'es', 'checkout', 'Important Notice !', '¡Aviso Importante!', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11177, 'es', 'checkout', 'When you upgrade the plan before your current plan expires, you will lose all the features in your current plan and move to the new plan, and the new plan period will be calculated and the old period removed.', 'Cuando actualices el plan antes de que tu plan actual expire, perderás todas las funciones de tu plan actual y pasarás al nuevo plan, el nuevo periodo se calculará y el periodo anterior se eliminará.', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11178, 'es', 'notifications', 'Transfer {transfer_number} has expired', 'La transferencia {transfer_number} ha expirado', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11179, 'es', 'user', 'View Transfer', 'Ver Transferencia', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11180, 'es', 'user', 'Done', 'Hecho', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11181, 'es', 'user', 'Transaction has been canceled', 'La transacción ha sido cancelada', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11182, 'es', 'notifications', 'Transfer canceled {transfer_number}', 'Transferencia cancelada {transfer_number}', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11183, 'es', 'notifications', 'Transaction canceled {transaction_number}', 'Transacción cancelada {transaction_number}', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11184, 'es', 'user', 'On', 'Encendido', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11185, 'es', 'user', 'Off', 'Apagado', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11186, 'es', 'general', 'GB', 'GB', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11187, 'es', 'general', 'MB', 'MB', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11188, 'es', 'general', 'bytes', 'bytes', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11189, 'es', 'general', 'KB', 'KB', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11190, 'es', 'general', 'byte', 'byte', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11191, 'es', 'plans', 'No Advertisements', 'Sin Publicidad', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11192, 'es', 'checkout', 'Coupon Code', 'Código de Cupón', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11193, 'es', 'checkout', 'Enter coupon code', 'Ingresa el código de cupón', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11194, 'es', 'checkout', 'Apply', 'Aplicar', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11195, 'es', 'checkout', 'Invalid or expired coupon code', 'Código de cupón inválido o expirado', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11196, 'es', 'checkout', 'Coupon has been applied successfully', 'El cupón ha sido aplicado correctamente', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11197, 'es', 'checkout', 'Subtotal', 'Subtotal', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11198, 'es', 'checkout', 'Discount', 'Descuento', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11199, 'es', 'checkout', 'You have exceeded the usage limit for this coupon', 'Has excedido el límite de uso para este cupón', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11200, 'es', 'user', 'Subtotal', 'Subtotal', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11201, 'es', 'user', 'Discount', 'Descuento', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11202, 'es', 'user', 'Coupon Code', 'Código de Cupón', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11203, 'es', 'plans', 'lifetime', 'de por vida', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11204, 'es', 'plans', 'No lifetime plans available', 'No hay planes de por vida disponibles', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11205, 'es', 'alerts', 'Your plan is not renewable', 'Tu plan no es renovable', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11206, 'es', 'user', 'Lifetime Subscription', 'Suscripción de por vida', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11207, 'es', 'user', 'Advertisements', 'Publicidad', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11208, 'es', 'general', 'TB', 'TB', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11209, 'es', 'user', 'Payment method', 'Método de pago', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11210, 'es', 'home page', 'Transfer your files, easy and secure', 'Transfiere tus archivos, fácil y seguro', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11211, 'es', 'home page', 'Transfer your files Up to 20GB* per transfer and have them travel around the world for free, easily and securely.', 'Transfiere tus archivos hasta 5GB* GRATIS por transferencia y haz que viajen por el mundo gratis, fácil y seguro.', '2025-07-09 10:38:27', '2025-07-09 12:33:32'),
(11212, 'es', 'home page', 'Start Transfer', 'Iniciar Transferencia', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11213, 'es', 'home page', 'Get Started', 'Comenzar', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11214, 'es', 'home page', 'Active Users', 'Usuarios Activos', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11215, 'es', 'home page', 'Transferred files', 'Archivos Transferidos', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11216, 'es', 'home page', 'Daily visitors', 'Visitantes diarios', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11217, 'es', 'home page', 'All-Time Downloads', 'Descargas totales', '2025-07-09 10:38:27', '2025-07-09 10:38:27'),
(11218, 'es', 'home page', 'Features', 'Características', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11219, 'es', 'home page', 'Features description', 'Descripción de características', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11220, 'es', 'home page', 'Pricing', 'Precios', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11221, 'es', 'home page', 'Pricing description', 'Descripción de precios', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11222, 'es', 'home page', 'Blog', 'Blog', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11223, 'es', 'home page', 'Blog description', 'Descripción del blog', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11224, 'es', 'home page', 'View More', 'Ver Más', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11225, 'es', 'home page', 'FAQ', 'Preguntas Frecuentes', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11226, 'es', 'home page', 'FAQ description', 'Descripción de Preguntas Frecuentes', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11227, 'es', 'home page', 'Find out more answers on our FAQ', 'Descubre más respuestas en nuestras Preguntas Frecuentes', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11228, 'es', 'home page', 'Contact Us', 'Contáctanos', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11229, 'es', 'home page', 'Contact Us description', 'Descripción de Contáctanos', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11230, 'es', 'contact us', 'Contact Us', 'Contáctanos', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11231, 'es', 'contact us', 'Name', 'Nombre', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11232, 'es', 'contact us', 'Email address', 'Correo electrónico', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11233, 'es', 'contact us', 'Subject', 'Asunto', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11234, 'es', 'contact us', 'Message', 'Mensaje', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11235, 'es', 'contact us', 'Send', 'Enviar', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11236, 'es', 'contact us', 'Sending emails is not available right now', 'El envío de correos no está disponible en este momento', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11237, 'es', 'contact us', 'Error on sending', 'Error al enviar', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11238, 'es', 'contact us', 'Your message has been sent successfully', 'Tu mensaje ha sido enviado correctamente', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11239, 'es', 'blog', 'Share On', 'Compartir en', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11240, 'es', 'upload zone', 'Drag and Drop Your Files to Start Transfer', 'Arrastra y suelta tus archivos para iniciar la transferencia', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11241, 'es', 'upload zone', 'Or click here', 'O haz clic aquí', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11242, 'es', 'upload zone', 'Drop File Here', 'Suelta el archivo aquí', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11243, 'es', 'upload zone', 'Upload your files by drag-and-dropping them on this window', 'Sube tus archivos arrastrándolos a esta ventana', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11244, 'es', 'upload zone', 'Add More', 'Agregar más', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11245, 'es', 'upload zone', 'Total Files', 'Total de archivos', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11246, 'es', 'upload zone', 'Reset', 'Restablecer', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11247, 'es', 'upload zone', 'file is too big max file size: {maxFilesize}MiB.', 'el archivo es demasiado grande, tamaño máximo por archivo: {maxFilesize}MiB.', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11248, 'es', 'upload zone', 'Server responded with {statusCode} code.', 'El servidor respondió con el código {statusCode}.', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11249, 'es', 'upload zone', 'Drop files here to upload', 'Suelta los archivos aquí para subir', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11250, 'es', 'upload zone', 'Your browser does not support drag and drop file uploads.', 'Tu navegador no soporta la carga de archivos por arrastrar y soltar.', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11251, 'es', 'upload zone', 'Please use the fallback form below to upload your files like in the olden days.', 'Por favor usa el formulario alternativo abajo para subir tus archivos como en los viejos tiempos.', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11252, 'es', 'upload zone', 'You cannot upload files of this type.', 'No puedes subir archivos de este tipo.', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11253, 'es', 'upload zone', 'Cancel upload', 'Cancelar carga', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11254, 'es', 'upload zone', 'Are you sure you want to cancel this upload?', '¿Estás seguro que deseas cancelar esta carga?', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11255, 'es', 'upload zone', 'Remove file', 'Eliminar archivo', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11256, 'es', 'upload zone', 'You can not upload any more files.', 'No puedes subir más archivos.', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11257, 'es', 'upload zone', 'Max size per transfer : {maxTransferSize}.', 'Tamaño máximo por transferencia: {maxTransferSize}.', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11258, 'es', 'upload zone', 'Send to', 'Enviar a', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11259, 'es', 'upload zone', 'Link', 'Enlace', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11260, 'es', 'upload zone', 'Password', 'Contraseña', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11261, 'es', 'upload zone', 'Notifications', 'Notificaciones', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11262, 'es', 'upload zone', 'Expiry Date', 'Fecha de expiración', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11263, 'es', 'upload zone', 'Your Email Address', 'Tu correo electrónico', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11264, 'es', 'upload zone', 'Subject (optional)', 'Asunto (opcional)', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11265, 'es', 'upload zone', 'Custom link (optional)', 'Enlace personalizado (opcional)', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11266, 'es', 'upload zone', 'Notify me when downloaded', 'Notifícame cuando se descargue', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11267, 'es', 'upload zone', 'Notify me when expired', 'Notifícame cuando expire', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11268, 'es', 'upload zone', 'Set expiry date', 'Establecer fecha de expiración', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11269, 'es', 'upload zone', 'Email', 'Correo electrónico', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11270, 'es', 'upload zone', 'Sender name (optional)', 'Nombre del remitente (opcional)', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11271, 'es', 'upload zone', 'Transfer', 'Transferencia', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11272, 'es', 'upload zone', 'Cancel', 'Cancelar', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11273, 'es', 'upload zone', 'Submit', 'Enviar', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11274, 'es', 'upload zone', 'Custom link can only contain Letters or Numbers or Dashes', 'El enlace personalizado solo puede contener Letras, Números o Guiones', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11275, 'es', 'upload zone', 'Create a link feature not available for your subscription', 'La función de crear enlace no está disponible para tu suscripción', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11276, 'es', 'upload zone', 'File error', 'Error de archivo', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11277, 'es', 'upload zone', 'Expiry date is invalid', 'La fecha de expiración no es válida', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11278, 'es', 'upload zone', 'Expiry date must be equal or less than {files_duration}', 'La fecha de expiración debe ser igual o menor a {files_duration}', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11279, 'es', 'upload zone', 'Expiry date must be 10 minutes minimum', 'La fecha de expiración debe ser mínimo de 10 minutos', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11280, 'es', 'upload zone', 'You cannot use notify when expiry when transfer expiry time is unlimited', 'No puedes usar notificación al expirar cuando el tiempo de expiración de la transferencia es ilimitado', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11281, 'es', 'upload zone', 'Unavailable storage provider', 'Proveedor de almacenamiento no disponible', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11282, 'es', 'upload zone', 'Transfer error', 'Error de transferencia', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11283, 'es', 'upload zone', 'File not exists', 'El archivo no existe', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11284, 'es', 'upload zone', 'No files uploaded', 'No se han subido archivos', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11285, 'es', 'upload zone', 'Send to field is invalid', 'El campo de destinatario no es válido', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11286, 'es', 'upload zone', 'Transfer Completed', 'Transferencia Completada', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11287, 'es', 'upload zone', 'Your files have been transferred successfully, here is your download link', 'Tus archivos se han transferido correctamente, aquí está tu enlace de descarga', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11288, 'es', 'upload zone', 'New Transfer', 'Nueva Transferencia', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11289, 'es', 'upload zone', 'View Transfer', 'Ver Transferencia', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11290, 'es', 'upload zone', 'Failed to upload', 'Error al subir', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11291, 'es', 'upload zone', 'Your message (optional)', 'Tu mensaje (opcional)', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11292, 'es', 'download page', 'Download', 'Descargar', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11293, 'es', 'password page', 'Password Protection', 'Protección con Contraseña', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11294, 'es', 'password page', 'Enter the Password to Unlock the Files', 'Ingresa la contraseña para desbloquear los archivos', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11295, 'es', 'password page', 'Unlock Files', 'Desbloquear Archivos', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11296, 'es', 'password page', 'Transfer not found', 'Transferencia no encontrada', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11297, 'es', 'password page', 'Incorrect password', 'Contraseña incorrecta', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11298, 'es', 'download page', 'Transferred files are ready for download', 'Los archivos transferidos están listos para descargar', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11299, 'es', 'download page', 'Expires on', 'Expira el', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11300, 'es', 'upload zone', 'Storage provider error', 'Error del proveedor de almacenamiento', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11301, 'es', 'download page', 'Download file', 'Descargar archivo', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11302, 'es', 'download page', 'Download all', 'Descargar todo', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11303, 'es', 'download page', 'Transfer not found', 'Transferencia no encontrada', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11304, 'es', 'download page', 'Unauthorized access', 'Acceso no autorizado', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11305, 'es', 'download page', 'Requested file not exists', 'El archivo solicitado no existe', '2025-07-09 10:38:28', '2025-07-09 10:38:28'),
(11306, 'es', 'download page', 'There was a problem while trying to download the file', 'Hubo un problema al intentar descargar el archivo', '2025-07-09 10:38:28', '2025-07-09 10:38:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uploads`
--

CREATE TABLE `uploads` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ip` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `storage_provider_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `filename` varchar(255) NOT NULL,
  `mime` varchar(255) NOT NULL,
  `extension` varchar(255) NOT NULL,
  `size` varchar(255) NOT NULL,
  `path` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `google2fa_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: Disabled, 1: Active',
  `google2fa_secret` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0: Banned, 1: Active',
  `read_status` tinyint(1) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_logs`
--

CREATE TABLE `user_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `country_code` varchar(100) DEFAULT NULL,
  `timezone` varchar(150) DEFAULT NULL,
  `location` varchar(60) DEFAULT NULL,
  `latitude` varchar(60) DEFAULT NULL,
  `longitude` varchar(60) DEFAULT NULL,
  `browser` varchar(60) DEFAULT NULL,
  `os` varchar(60) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_notifications`
--

CREATE TABLE `user_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 : Unread 1: Read',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `additionals`
--
ALTER TABLE `additionals`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `addons`
--
ALTER TABLE `addons`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indices de la tabla `admin_notifications`
--
ALTER TABLE `admin_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  ADD KEY `admin_password_resets_email_index` (`email`);

--
-- Indices de la tabla `advertisements`
--
ALTER TABLE `advertisements`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `blog_articles`
--
ALTER TABLE `blog_articles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blog_articles_slug_unique` (`slug`),
  ADD KEY `blog_articles_category_id_foreign` (`category_id`),
  ADD KEY `blog_articles_admin_id_foreign` (`admin_id`),
  ADD KEY `blog_articles_lang_foreign` (`lang`);

--
-- Indices de la tabla `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blog_categories_slug_unique` (`slug`),
  ADD KEY `blog_categories_lang_foreign` (`lang`);

--
-- Indices de la tabla `blog_comments`
--
ALTER TABLE `blog_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_comments_user_id_foreign` (`user_id`),
  ADD KEY `blog_comments_article_id_foreign` (`article_id`);

--
-- Indices de la tabla `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`),
  ADD KEY `coupons_plan_id_foreign` (`plan_id`);

--
-- Indices de la tabla `extensions`
--
ALTER TABLE `extensions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `faqs_lang_foreign` (`lang`);

--
-- Indices de la tabla `features`
--
ALTER TABLE `features`
  ADD PRIMARY KEY (`id`),
  ADD KEY `features_lang_foreign` (`lang`);

--
-- Indices de la tabla `footer_menu`
--
ALTER TABLE `footer_menu`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `footer_menu_name_unique` (`name`),
  ADD KEY `footer_menu_lang_foreign` (`lang`);

--
-- Indices de la tabla `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `languages_code_unique` (`code`);

--
-- Indices de la tabla `mail_templates`
--
ALTER TABLE `mail_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mail_templates_lang_foreign` (`lang`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `navbar_menu`
--
ALTER TABLE `navbar_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `navbar_menu_lang_foreign` (`lang`);

--
-- Indices de la tabla `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_page_slug_unique` (`slug`),
  ADD KEY `pages_lang_foreign` (`lang`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `payment_gateways`
--
ALTER TABLE `payment_gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `seo_configurations`
--
ALTER TABLE `seo_configurations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `seo_configurations_lang_unique` (`lang`);

--
-- Indices de la tabla `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `slideshows`
--
ALTER TABLE `slideshows`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `social_providers`
--
ALTER TABLE `social_providers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `social_providers_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `storage_providers`
--
ALTER TABLE `storage_providers`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subscriptions_user_id_foreign` (`user_id`),
  ADD KEY `subscriptions_plan_id_foreign` (`plan_id`);

--
-- Indices de la tabla `support_attachments`
--
ALTER TABLE `support_attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `support_attachments_support_reply_id_foreign` (`support_reply_id`);

--
-- Indices de la tabla `support_replies`
--
ALTER TABLE `support_replies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `support_replies_support_ticket_id_foreign` (`support_ticket_id`),
  ADD KEY `support_replies_admin_id_foreign` (`admin_id`);

--
-- Indices de la tabla `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `support_tickets_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `taxes_country_id_unique` (`country_id`);

--
-- Indices de la tabla `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transactions_checkout_id_unique` (`checkout_id`),
  ADD UNIQUE KEY `transactions_transaction_id_unique` (`transaction_id`),
  ADD KEY `transactions_user_id_foreign` (`user_id`),
  ADD KEY `transactions_plan_id_foreign` (`plan_id`),
  ADD KEY `transactions_coupon_id_foreign` (`coupon_id`),
  ADD KEY `transactions_payment_gateway_id_foreign` (`payment_gateway_id`);

--
-- Indices de la tabla `transfers`
--
ALTER TABLE `transfers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transfers_unique_id_unique` (`unique_id`),
  ADD UNIQUE KEY `transfers_link_unique` (`link`),
  ADD KEY `transfers_user_id_foreign` (`user_id`),
  ADD KEY `transfers_storage_provider_id_foreign` (`storage_provider_id`);

--
-- Indices de la tabla `transfer_files`
--
ALTER TABLE `transfer_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transfer_files_user_id_foreign` (`user_id`),
  ADD KEY `transfer_files_transfer_id_foreign` (`transfer_id`),
  ADD KEY `transfer_files_storage_provider_id_foreign` (`storage_provider_id`);

--
-- Indices de la tabla `translates`
--
ALTER TABLE `translates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translates_lang_foreign` (`lang`);

--
-- Indices de la tabla `uploads`
--
ALTER TABLE `uploads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uploads_user_id_foreign` (`user_id`),
  ADD KEY `uploads_storage_provider_id_foreign` (`storage_provider_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_mobile_unique` (`mobile`);

--
-- Indices de la tabla `user_logs`
--
ALTER TABLE `user_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_logs_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `user_notifications`
--
ALTER TABLE `user_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_notifications_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `additionals`
--
ALTER TABLE `additionals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `addons`
--
ALTER TABLE `addons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `admin_notifications`
--
ALTER TABLE `admin_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `advertisements`
--
ALTER TABLE `advertisements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `blog_articles`
--
ALTER TABLE `blog_articles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `blog_comments`
--
ALTER TABLE `blog_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=253;

--
-- AUTO_INCREMENT de la tabla `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `extensions`
--
ALTER TABLE `extensions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `features`
--
ALTER TABLE `features`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `footer_menu`
--
ALTER TABLE `footer_menu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `mail_templates`
--
ALTER TABLE `mail_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=409;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT de la tabla `navbar_menu`
--
ALTER TABLE `navbar_menu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `payment_gateways`
--
ALTER TABLE `payment_gateways`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `plans`
--
ALTER TABLE `plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `seo_configurations`
--
ALTER TABLE `seo_configurations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT de la tabla `slideshows`
--
ALTER TABLE `slideshows`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `social_providers`
--
ALTER TABLE `social_providers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `storage_providers`
--
ALTER TABLE `storage_providers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `support_attachments`
--
ALTER TABLE `support_attachments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `support_replies`
--
ALTER TABLE `support_replies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `transfers`
--
ALTER TABLE `transfers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `transfer_files`
--
ALTER TABLE `transfer_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `translates`
--
ALTER TABLE `translates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11307;

--
-- AUTO_INCREMENT de la tabla `uploads`
--
ALTER TABLE `uploads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `user_logs`
--
ALTER TABLE `user_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `user_notifications`
--
ALTER TABLE `user_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `blog_articles`
--
ALTER TABLE `blog_articles`
  ADD CONSTRAINT `blog_articles_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `blog_articles_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `blog_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `blog_articles_lang_foreign` FOREIGN KEY (`lang`) REFERENCES `languages` (`code`) ON DELETE CASCADE;

--
-- Filtros para la tabla `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD CONSTRAINT `blog_categories_lang_foreign` FOREIGN KEY (`lang`) REFERENCES `languages` (`code`) ON DELETE CASCADE;

--
-- Filtros para la tabla `blog_comments`
--
ALTER TABLE `blog_comments`
  ADD CONSTRAINT `blog_comments_article_id_foreign` FOREIGN KEY (`article_id`) REFERENCES `blog_articles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `blog_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `coupons`
--
ALTER TABLE `coupons`
  ADD CONSTRAINT `coupons_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `faqs`
--
ALTER TABLE `faqs`
  ADD CONSTRAINT `faqs_lang_foreign` FOREIGN KEY (`lang`) REFERENCES `languages` (`code`) ON DELETE CASCADE;

--
-- Filtros para la tabla `features`
--
ALTER TABLE `features`
  ADD CONSTRAINT `features_lang_foreign` FOREIGN KEY (`lang`) REFERENCES `languages` (`code`) ON DELETE CASCADE;

--
-- Filtros para la tabla `footer_menu`
--
ALTER TABLE `footer_menu`
  ADD CONSTRAINT `footer_menu_lang_foreign` FOREIGN KEY (`lang`) REFERENCES `languages` (`code`) ON DELETE CASCADE;

--
-- Filtros para la tabla `mail_templates`
--
ALTER TABLE `mail_templates`
  ADD CONSTRAINT `mail_templates_lang_foreign` FOREIGN KEY (`lang`) REFERENCES `languages` (`code`) ON DELETE CASCADE;

--
-- Filtros para la tabla `navbar_menu`
--
ALTER TABLE `navbar_menu`
  ADD CONSTRAINT `navbar_menu_lang_foreign` FOREIGN KEY (`lang`) REFERENCES `languages` (`code`) ON DELETE CASCADE;

--
-- Filtros para la tabla `pages`
--
ALTER TABLE `pages`
  ADD CONSTRAINT `pages_lang_foreign` FOREIGN KEY (`lang`) REFERENCES `languages` (`code`) ON DELETE CASCADE;

--
-- Filtros para la tabla `seo_configurations`
--
ALTER TABLE `seo_configurations`
  ADD CONSTRAINT `seo_configurations_lang_foreign` FOREIGN KEY (`lang`) REFERENCES `languages` (`code`) ON DELETE CASCADE;

--
-- Filtros para la tabla `social_providers`
--
ALTER TABLE `social_providers`
  ADD CONSTRAINT `social_providers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD CONSTRAINT `subscriptions_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subscriptions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `support_attachments`
--
ALTER TABLE `support_attachments`
  ADD CONSTRAINT `support_attachments_support_reply_id_foreign` FOREIGN KEY (`support_reply_id`) REFERENCES `support_replies` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `support_replies`
--
ALTER TABLE `support_replies`
  ADD CONSTRAINT `support_replies_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `support_replies_support_ticket_id_foreign` FOREIGN KEY (`support_ticket_id`) REFERENCES `support_tickets` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD CONSTRAINT `support_tickets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `taxes`
--
ALTER TABLE `taxes`
  ADD CONSTRAINT `taxes_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_payment_gateway_id_foreign` FOREIGN KEY (`payment_gateway_id`) REFERENCES `payment_gateways` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `transfers`
--
ALTER TABLE `transfers`
  ADD CONSTRAINT `transfers_storage_provider_id_foreign` FOREIGN KEY (`storage_provider_id`) REFERENCES `storage_providers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transfers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `transfer_files`
--
ALTER TABLE `transfer_files`
  ADD CONSTRAINT `transfer_files_storage_provider_id_foreign` FOREIGN KEY (`storage_provider_id`) REFERENCES `storage_providers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transfer_files_transfer_id_foreign` FOREIGN KEY (`transfer_id`) REFERENCES `transfers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transfer_files_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `translates`
--
ALTER TABLE `translates`
  ADD CONSTRAINT `translates_lang_foreign` FOREIGN KEY (`lang`) REFERENCES `languages` (`code`) ON DELETE CASCADE;

--
-- Filtros para la tabla `uploads`
--
ALTER TABLE `uploads`
  ADD CONSTRAINT `uploads_storage_provider_id_foreign` FOREIGN KEY (`storage_provider_id`) REFERENCES `storage_providers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `uploads_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `user_logs`
--
ALTER TABLE `user_logs`
  ADD CONSTRAINT `user_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `user_notifications`
--
ALTER TABLE `user_notifications`
  ADD CONSTRAINT `user_notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
