-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 18, 2024 at 06:09 PM
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
-- Database: `laravel_onlinestore`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(35, 'Samsung', 'samsung', 1, '2024-10-30 13:08:35', '2024-10-30 13:08:35'),
(36, 'Lenovo', 'lenovo', 1, '2024-10-31 13:25:44', '2024-10-31 13:25:44'),
(37, 'HP', 'hp', 1, '2024-10-31 13:31:36', '2024-10-31 13:31:36');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `show_on_home_page` enum('Yes','No') NOT NULL DEFAULT 'No',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `image`, `status`, `show_on_home_page`, `created_at`, `updated_at`) VALUES
(61, 'Electronics', 'electronics', 'images/categories/electronics2024_10_31_05_58_22.jfif', 1, 'Yes', '2024-10-30 13:06:35', '2024-10-31 12:58:23'),
(62, 'Men\'s Fashion', 'mens-fashion', 'images/categories/mens-fashion2024_10_31_05_58_13.jfif', 1, 'Yes', '2024-10-31 12:03:01', '2024-10-31 12:58:13'),
(63, 'Women\'s Fashion', 'womens-fashion', 'images/categories/womens-fashion2024_10_31_05_58_01.jfif', 1, 'Yes', '2024-10-31 12:03:22', '2024-10-31 12:58:01'),
(64, 'Appliances', 'appliances', 'images/categories/appliances2024_10_31_05_57_42.jfif', 1, 'Yes', '2024-10-31 12:03:38', '2024-10-31 12:57:42'),
(65, 'Kid\'s Fashion', 'kids-fashion', '', 1, 'No', '2024-11-01 13:21:56', '2024-11-01 13:34:30');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `code`, `created_at`, `updated_at`) VALUES
(1, 'United States', 'US', NULL, NULL),
(2, 'Canada', 'CA', NULL, NULL),
(3, 'Afghanistan', 'AF', NULL, NULL),
(4, 'Albania', 'AL', NULL, NULL),
(5, 'Algeria', 'DZ', NULL, NULL),
(6, 'American Samoa', 'AS', NULL, NULL),
(7, 'Andorra', 'AD', NULL, NULL),
(8, 'Angola', 'AO', NULL, NULL),
(9, 'Anguilla', 'AI', NULL, NULL),
(10, 'Antarctica', 'AQ', NULL, NULL),
(11, 'Antigua and/or Barbuda', 'AG', NULL, NULL),
(12, 'Argentina', 'AR', NULL, NULL),
(13, 'Armenia', 'AM', NULL, NULL),
(14, 'Aruba', 'AW', NULL, NULL),
(15, 'Australia', 'AU', NULL, NULL),
(16, 'Austria', 'AT', NULL, NULL),
(17, 'Azerbaijan', 'AZ', NULL, NULL),
(18, 'Bahamas', 'BS', NULL, NULL),
(19, 'Bahrain', 'BH', NULL, NULL),
(20, 'Bangladesh', 'BD', NULL, NULL),
(21, 'Barbados', 'BB', NULL, NULL),
(22, 'Belarus', 'BY', NULL, NULL),
(23, 'Belgium', 'BE', NULL, NULL),
(24, 'Belize', 'BZ', NULL, NULL),
(25, 'Benin', 'BJ', NULL, NULL),
(26, 'Bermuda', 'BM', NULL, NULL),
(27, 'Bhutan', 'BT', NULL, NULL),
(28, 'Bolivia', 'BO', NULL, NULL),
(29, 'Bosnia and Herzegovina', 'BA', NULL, NULL),
(30, 'Botswana', 'BW', NULL, NULL),
(31, 'Bouvet Island', 'BV', NULL, NULL),
(32, 'Brazil', 'BR', NULL, NULL),
(33, 'British lndian Ocean Territory', 'IO', NULL, NULL),
(34, 'Brunei Darussalam', 'BN', NULL, NULL),
(35, 'Bulgaria', 'BG', NULL, NULL),
(36, 'Burkina Faso', 'BF', NULL, NULL),
(37, 'Burundi', 'BI', NULL, NULL),
(38, 'Cambodia', 'KH', NULL, NULL),
(39, 'Cameroon', 'CM', NULL, NULL),
(40, 'Cape Verde', 'CV', NULL, NULL),
(41, 'Cayman Islands', 'KY', NULL, NULL),
(42, 'Central African Republic', 'CF', NULL, NULL),
(43, 'Chad', 'TD', NULL, NULL),
(44, 'Chile', 'CL', NULL, NULL),
(45, 'China', 'CN', NULL, NULL),
(46, 'Christmas Island', 'CX', NULL, NULL),
(47, 'Cocos (Keeling) Islands', 'CC', NULL, NULL),
(48, 'Colombia', 'CO', NULL, NULL),
(49, 'Comoros', 'KM', NULL, NULL),
(50, 'Congo', 'CG', NULL, NULL),
(51, 'Cook Islands', 'CK', NULL, NULL),
(52, 'Costa Rica', 'CR', NULL, NULL),
(53, 'Croatia (Hrvatska)', 'HR', NULL, NULL),
(54, 'Cuba', 'CU', NULL, NULL),
(55, 'Cyprus', 'CY', NULL, NULL),
(56, 'Czech Republic', 'CZ', NULL, NULL),
(57, 'Democratic Republic of Congo', 'CD', NULL, NULL),
(58, 'Denmark', 'DK', NULL, NULL),
(59, 'Djibouti', 'DJ', NULL, NULL),
(60, 'Dominica', 'DM', NULL, NULL),
(61, 'Dominican Republic', 'DO', NULL, NULL),
(62, 'East Timor', 'TP', NULL, NULL),
(63, 'Ecudaor', 'EC', NULL, NULL),
(64, 'Egypt', 'EG', NULL, NULL),
(65, 'El Salvador', 'SV', NULL, NULL),
(66, 'Equatorial Guinea', 'GQ', NULL, NULL),
(67, 'Eritrea', 'ER', NULL, NULL),
(68, 'Estonia', 'EE', NULL, NULL),
(69, 'Ethiopia', 'ET', NULL, NULL),
(70, 'Falkland Islands (Malvinas)', 'FK', NULL, NULL),
(71, 'Faroe Islands', 'FO', NULL, NULL),
(72, 'Fiji', 'FJ', NULL, NULL),
(73, 'Finland', 'FI', NULL, NULL),
(74, 'France', 'FR', NULL, NULL),
(75, 'France, Metropolitan', 'FX', NULL, NULL),
(76, 'French Guiana', 'GF', NULL, NULL),
(77, 'French Polynesia', 'PF', NULL, NULL),
(78, 'French Southern Territories', 'TF', NULL, NULL),
(79, 'Gabon', 'GA', NULL, NULL),
(80, 'Gambia', 'GM', NULL, NULL),
(81, 'Georgia', 'GE', NULL, NULL),
(82, 'Germany', 'DE', NULL, NULL),
(83, 'Ghana', 'GH', NULL, NULL),
(84, 'Gibraltar', 'GI', NULL, NULL),
(85, 'Greece', 'GR', NULL, NULL),
(86, 'Greenland', 'GL', NULL, NULL),
(87, 'Grenada', 'GD', NULL, NULL),
(88, 'Guadeloupe', 'GP', NULL, NULL),
(89, 'Guam', 'GU', NULL, NULL),
(90, 'Guatemala', 'GT', NULL, NULL),
(91, 'Guinea', 'GN', NULL, NULL),
(92, 'Guinea-Bissau', 'GW', NULL, NULL),
(93, 'Guyana', 'GY', NULL, NULL),
(94, 'Haiti', 'HT', NULL, NULL),
(95, 'Heard and Mc Donald Islands', 'HM', NULL, NULL),
(96, 'Honduras', 'HN', NULL, NULL),
(97, 'Hong Kong', 'HK', NULL, NULL),
(98, 'Hungary', 'HU', NULL, NULL),
(99, 'Iceland', 'IS', NULL, NULL),
(100, 'India', 'IN', NULL, NULL),
(101, 'Indonesia', 'ID', NULL, NULL),
(102, 'Iran (Islamic Republic of)', 'IR', NULL, NULL),
(103, 'Iraq', 'IQ', NULL, NULL),
(104, 'Ireland', 'IE', NULL, NULL),
(105, 'Israel', 'IL', NULL, NULL),
(106, 'Italy', 'IT', NULL, NULL),
(107, 'Ivory Coast', 'CI', NULL, NULL),
(108, 'Jamaica', 'JM', NULL, NULL),
(109, 'Japan', 'JP', NULL, NULL),
(110, 'Jordan', 'JO', NULL, NULL),
(111, 'Kazakhstan', 'KZ', NULL, NULL),
(112, 'Kenya', 'KE', NULL, NULL),
(113, 'Kiribati', 'KI', NULL, NULL),
(114, 'Korea, Democratic People\'s Republic of', 'KP', NULL, NULL),
(115, 'Korea, Republic of', 'KR', NULL, NULL),
(116, 'Kuwait', 'KW', NULL, NULL),
(117, 'Kyrgyzstan', 'KG', NULL, NULL),
(118, 'Lao People\'s Democratic Republic', 'LA', NULL, NULL),
(119, 'Latvia', 'LV', NULL, NULL),
(120, 'Lebanon', 'LB', NULL, NULL),
(121, 'Lesotho', 'LS', NULL, NULL),
(122, 'Liberia', 'LR', NULL, NULL),
(123, 'Libyan Arab Jamahiriya', 'LY', NULL, NULL),
(124, 'Liechtenstein', 'LI', NULL, NULL),
(125, 'Lithuania', 'LT', NULL, NULL),
(126, 'Luxembourg', 'LU', NULL, NULL),
(127, 'Macau', 'MO', NULL, NULL),
(128, 'Macedonia', 'MK', NULL, NULL),
(129, 'Madagascar', 'MG', NULL, NULL),
(130, 'Malawi', 'MW', NULL, NULL),
(131, 'Malaysia', 'MY', NULL, NULL),
(132, 'Maldives', 'MV', NULL, NULL),
(133, 'Mali', 'ML', NULL, NULL),
(134, 'Malta', 'MT', NULL, NULL),
(135, 'Marshall Islands', 'MH', NULL, NULL),
(136, 'Martinique', 'MQ', NULL, NULL),
(137, 'Mauritania', 'MR', NULL, NULL),
(138, 'Mauritius', 'MU', NULL, NULL),
(139, 'Mayotte', 'TY', NULL, NULL),
(140, 'Mexico', 'MX', NULL, NULL),
(141, 'Micronesia, Federated States of', 'FM', NULL, NULL),
(142, 'Moldova, Republic of', 'MD', NULL, NULL),
(143, 'Monaco', 'MC', NULL, NULL),
(144, 'Mongolia', 'MN', NULL, NULL),
(145, 'Montserrat', 'MS', NULL, NULL),
(146, 'Morocco', 'MA', NULL, NULL),
(147, 'Mozambique', 'MZ', NULL, NULL),
(148, 'Myanmar', 'MM', NULL, NULL),
(149, 'Namibia', 'NA', NULL, NULL),
(150, 'Nauru', 'NR', NULL, NULL),
(151, 'Nepal', 'NP', NULL, NULL),
(152, 'Netherlands', 'NL', NULL, NULL),
(153, 'Netherlands Antilles', 'AN', NULL, NULL),
(154, 'New Caledonia', 'NC', NULL, NULL),
(155, 'New Zealand', 'NZ', NULL, NULL),
(156, 'Nicaragua', 'NI', NULL, NULL),
(157, 'Niger', 'NE', NULL, NULL),
(158, 'Nigeria', 'NG', NULL, NULL),
(159, 'Niue', 'NU', NULL, NULL),
(160, 'Norfork Island', 'NF', NULL, NULL),
(161, 'Northern Mariana Islands', 'MP', NULL, NULL),
(162, 'Norway', 'NO', NULL, NULL),
(163, 'Oman', 'OM', NULL, NULL),
(164, 'Pakistan', 'PK', NULL, NULL),
(165, 'Palau', 'PW', NULL, NULL),
(166, 'Panama', 'PA', NULL, NULL),
(167, 'Papua New Guinea', 'PG', NULL, NULL),
(168, 'Paraguay', 'PY', NULL, NULL),
(169, 'Peru', 'PE', NULL, NULL),
(170, 'Philippines', 'PH', NULL, NULL),
(171, 'Pitcairn', 'PN', NULL, NULL),
(172, 'Poland', 'PL', NULL, NULL),
(173, 'Portugal', 'PT', NULL, NULL),
(174, 'Puerto Rico', 'PR', NULL, NULL),
(175, 'Qatar', 'QA', NULL, NULL),
(176, 'Republic of South Sudan', 'SS', NULL, NULL),
(177, 'Reunion', 'RE', NULL, NULL),
(178, 'Romania', 'RO', NULL, NULL),
(179, 'Russian Federation', 'RU', NULL, NULL),
(180, 'Rwanda', 'RW', NULL, NULL),
(181, 'Saint Kitts and Nevis', 'KN', NULL, NULL),
(182, 'Saint Lucia', 'LC', NULL, NULL),
(183, 'Saint Vincent and the Grenadines', 'VC', NULL, NULL),
(184, 'Samoa', 'WS', NULL, NULL),
(185, 'San Marino', 'SM', NULL, NULL),
(186, 'Sao Tome and Principe', 'ST', NULL, NULL),
(187, 'Saudi Arabia', 'SA', NULL, NULL),
(188, 'Senegal', 'SN', NULL, NULL),
(189, 'Serbia', 'RS', NULL, NULL),
(190, 'Seychelles', 'SC', NULL, NULL),
(191, 'Sierra Leone', 'SL', NULL, NULL),
(192, 'Singapore', 'SG', NULL, NULL),
(193, 'Slovakia', 'SK', NULL, NULL),
(194, 'Slovenia', 'SI', NULL, NULL),
(195, 'Solomon Islands', 'SB', NULL, NULL),
(196, 'Somalia', 'SO', NULL, NULL),
(197, 'South Africa', 'ZA', NULL, NULL),
(198, 'South Georgia South Sandwich Islands', 'GS', NULL, NULL),
(199, 'Spain', 'ES', NULL, NULL),
(200, 'Sri Lanka', 'LK', NULL, NULL),
(201, 'St. Helena', 'SH', NULL, NULL),
(202, 'St. Pierre and Miquelon', 'PM', NULL, NULL),
(203, 'Sudan', 'SD', NULL, NULL),
(204, 'Suriname', 'SR', NULL, NULL),
(205, 'Svalbarn and Jan Mayen Islands', 'SJ', NULL, NULL),
(206, 'Swaziland', 'SZ', NULL, NULL),
(207, 'Sweden', 'SE', NULL, NULL),
(208, 'Switzerland', 'CH', NULL, NULL),
(209, 'Syrian Arab Republic', 'SY', NULL, NULL),
(210, 'Taiwan', 'TW', NULL, NULL),
(211, 'Tajikistan', 'TJ', NULL, NULL),
(212, 'Tanzania, United Republic of', 'TZ', NULL, NULL),
(213, 'Thailand', 'TH', NULL, NULL),
(214, 'Togo', 'TG', NULL, NULL),
(215, 'Tokelau', 'TK', NULL, NULL),
(216, 'Tonga', 'TO', NULL, NULL),
(217, 'Trinidad and Tobago', 'TT', NULL, NULL),
(218, 'Tunisia', 'TN', NULL, NULL),
(219, 'Turkey', 'TR', NULL, NULL),
(220, 'Turkmenistan', 'TM', NULL, NULL),
(221, 'Turks and Caicos Islands', 'TC', NULL, NULL),
(222, 'Tuvalu', 'TV', NULL, NULL),
(223, 'Uganda', 'UG', NULL, NULL),
(224, 'Ukraine', 'UA', NULL, NULL),
(225, 'United Arab Emirates', 'AE', NULL, NULL),
(226, 'United Kingdom', 'GB', NULL, NULL),
(227, 'United States minor outlying islands', 'UM', NULL, NULL),
(228, 'Uruguay', 'UY', NULL, NULL),
(229, 'Uzbekistan', 'UZ', NULL, NULL),
(230, 'Vanuatu', 'VU', NULL, NULL),
(231, 'Vatican City State', 'VA', NULL, NULL),
(232, 'Venezuela', 'VE', NULL, NULL),
(233, 'Vietnam', 'VN', NULL, NULL),
(234, 'Virgin Islands (British)', 'VG', NULL, NULL),
(235, 'Virgin Islands (U.S.)', 'VI', NULL, NULL),
(236, 'Wallis and Futuna Islands', 'WF', NULL, NULL),
(237, 'Western Sahara', 'EH', NULL, NULL),
(238, 'Yemen', 'YE', NULL, NULL),
(239, 'Yugoslavia', 'YU', NULL, NULL),
(240, 'Zaire', 'ZR', NULL, NULL),
(241, 'Zambia', 'ZM', NULL, NULL),
(242, 'Zimbabwe', 'ZW', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_address`
--

CREATE TABLE `customer_address` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `address` varchar(255) NOT NULL,
  `apartment` varchar(255) DEFAULT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` varchar(255) NOT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_address`
--

INSERT INTO `customer_address` (`id`, `user_id`, `first_name`, `last_name`, `email`, `mobile`, `country_id`, `address`, `apartment`, `city`, `state`, `zip`, `notes`, `created_at`, `updated_at`) VALUES
(1, 7, 'test', 'name', 'tayyab1@gmail.com', '12213', 164, 'test address', NULL, 'lahore', 'punjab', '54000', 'tesdt', '2024-11-13 14:33:39', '2024-11-14 14:12:51');

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(11, '2024_10_16_174233_add_user_role', 2),
(12, '2024_10_16_210716_create_categories_table', 2),
(13, '2024_10_21_104713_create_sub_categories_table', 2),
(15, '2024_10_21_154030_create_brand_table', 3),
(18, '2024_10_22_183645_create_products_table', 4),
(19, '2024_10_22_183706_create_product_images_table', 4),
(20, '2024_10_28_185101_create_temp_images_table', 5),
(21, '2024_10_31_102015_change_description_to_text_in_product_table', 6),
(22, '2024_10_31_163626_alter_category_table_add_col_show_on_home_page', 7),
(23, '2024_10_31_164916_alter_sub_categories_add_is_show_on_home_page', 8),
(24, '2024_11_06_182101_alter_product_table_add_short_desc_shpping_return_policy', 9),
(25, '2024_11_07_180126_alter_users_add_phone_number', 10),
(26, '2024_11_12_162723_create_countries_table', 11),
(27, '2024_11_12_165158_create_orders_table', 12),
(29, '2024_11_12_165343_create_customer_address_table', 12),
(30, '2024_11_12_165249_create_order_items_table', 13),
(32, '2024_11_14_175412_alter_orders_table', 14);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `subtotal` double(10,2) NOT NULL,
  `shipping` double(10,2) NOT NULL,
  `coupen_code` varchar(255) DEFAULT NULL,
  `discount` double(10,2) DEFAULT NULL,
  `grand_total` double(10,2) NOT NULL,
  `payment_status` enum('Paid','Not Paid') NOT NULL DEFAULT 'Not Paid',
  `status` enum('Pending','Shipped','Delivered') NOT NULL DEFAULT 'Pending',
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `address` varchar(255) NOT NULL,
  `apartment` varchar(255) DEFAULT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` varchar(255) NOT NULL,
  `notes` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `subtotal`, `shipping`, `coupen_code`, `discount`, `grand_total`, `payment_status`, `status`, `first_name`, `last_name`, `email`, `mobile`, `country_id`, `address`, `apartment`, `city`, `state`, `zip`, `notes`, `created_at`, `updated_at`) VALUES
(1, 7, 25400.00, 0.00, NULL, 0.00, 25400.00, 'Not Paid', 'Shipped', 'test', 'name', 'test@gmail.com', '022020202', 1, 'test address', NULL, 'lahore', 'punjab', '54000', 'test notes', '2024-11-13 14:44:50', '2024-11-13 14:44:50'),
(2, 7, 25400.00, 0.00, NULL, 0.00, 25400.00, 'Not Paid', 'Pending', 'test', 'name', 'test@gmail.com', '022020202', 1, 'test address', NULL, 'lahore', 'punjab', '54000', 'test notes', '2024-11-13 14:51:23', '2024-11-13 14:51:23'),
(3, 7, 25400.00, 0.00, NULL, 0.00, 25400.00, 'Not Paid', 'Pending', 'test', 'name', 'test@gmail.com', '022020202', 1, 'test address', NULL, 'lahore', 'punjab', '54000', 'test notes', '2024-11-13 14:52:05', '2024-11-13 14:52:05'),
(4, 7, 25400.00, 0.00, NULL, 0.00, 25400.00, 'Not Paid', 'Pending', 'test', 'name', 'test@gmail.com', '022020202', 1, 'test address', NULL, 'lahore', 'punjab', '54000', 'test notes', '2024-11-13 14:55:39', '2024-11-13 14:55:39'),
(5, 7, 40800.00, 0.00, NULL, 0.00, 40800.00, 'Not Paid', 'Pending', 'test', 'name', 'test@gmail.com', '022020202', 1, 'test address', NULL, 'lahore', 'punjab', '54000', 'test notes', '2024-11-13 14:56:50', '2024-11-13 14:56:50'),
(6, 7, 40800.00, 0.00, NULL, 0.00, 40800.00, 'Not Paid', 'Pending', 'test', 'name', 'tayyab1@gmail.com', '12213', 164, 'test', NULL, 'lahore', 'punjab', '54000', 'lkjlkj;kl', '2024-11-13 15:31:17', '2024-11-13 15:31:17'),
(7, 7, 40800.00, 0.00, NULL, 0.00, 40800.00, 'Not Paid', 'Pending', 'test', 'name', 'tayyab1@gmail.com', 'oiuoi', 164, 'uiouoiu', NULL, 'lahore', 'punjab', '54000', 'oipupoi', '2024-11-13 15:32:37', '2024-11-13 15:32:37'),
(8, 7, 60000.00, 0.00, NULL, 0.00, 60000.00, 'Not Paid', 'Pending', 'test', 'name', 'tayyab1@gmail.com', '12213', 164, 'test address', NULL, 'lahore', 'punjab', '54000', 'tesdt', '2024-11-14 14:12:51', '2024-11-14 14:12:51');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `qty` varchar(255) NOT NULL,
  `price` double(10,2) NOT NULL,
  `total` double(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `name`, `qty`, `price`, `total`, `created_at`, `updated_at`) VALUES
(1, 4, 37, 'SNEAKERS 0120332', '1', 15400.00, 15400.00, '2024-11-13 14:55:39', '2024-11-13 14:55:39'),
(2, 4, 36, 'Portable Evaporative Cooler', '1', 10000.00, 10000.00, '2024-11-13 14:55:39', '2024-11-13 14:55:39'),
(3, 5, 37, 'SNEAKERS 0120332', '2', 15400.00, 30800.00, '2024-11-13 14:56:50', '2024-11-13 14:56:50'),
(4, 5, 36, 'Portable Evaporative Cooler', '1', 10000.00, 10000.00, '2024-11-13 14:56:50', '2024-11-13 14:56:50'),
(5, 6, 37, 'SNEAKERS 0120332', '2', 15400.00, 30800.00, '2024-11-13 15:31:17', '2024-11-13 15:31:17'),
(6, 6, 36, 'Portable Evaporative Cooler', '1', 10000.00, 10000.00, '2024-11-13 15:31:17', '2024-11-13 15:31:17'),
(7, 7, 37, 'SNEAKERS 0120332', '2', 15400.00, 30800.00, '2024-11-13 15:32:37', '2024-11-13 15:32:37'),
(8, 7, 36, 'Portable Evaporative Cooler', '1', 10000.00, 10000.00, '2024-11-13 15:32:37', '2024-11-13 15:32:37'),
(9, 8, 34, 'Android Smart Sense HD', '1', 50000.00, 50000.00, '2024-11-14 14:12:51', '2024-11-14 14:12:51'),
(10, 8, 36, 'Portable Evaporative Cooler', '1', 10000.00, 10000.00, '2024-11-14 14:12:51', '2024-11-14 14:12:51');

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
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `short_description` text DEFAULT NULL,
  `shipping_returns` text DEFAULT NULL,
  `related_products` text DEFAULT NULL,
  `price` double(10,2) NOT NULL,
  `compare_price` double(10,2) DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `sub_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_featured` enum('Yes','No') NOT NULL DEFAULT 'No',
  `sku` varchar(255) NOT NULL,
  `barcode` varchar(255) NOT NULL,
  `track_qty` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  `qty` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `slug`, `description`, `short_description`, `shipping_returns`, `related_products`, `price`, `compare_price`, `category_id`, `sub_category_id`, `brand_id`, `is_featured`, `sku`, `barcode`, `track_qty`, `qty`, `status`, `created_at`, `updated_at`) VALUES
(23, 'Samsung Galaxy A13 +', 'samsung-galaxy-a13', '<h2 class=\"Heading1\" style=\"font-family: Arial, Helvetica, sans-serif; font-size: 16px; font-weight: 700; color: rgb(102, 102, 102); padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; display: inline;\">Samsung Galaxy A13 detailed specifications</h2><span style=\"color: rgb(102, 102, 102); font-family: Arial, Helvetica, sans-serif; font-weight: 700;\"></span><table class=\"specs\" width=\"604\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-spacing: 0px; border: 1px solid rgb(171, 196, 232); color: rgb(102, 102, 102); font-family: Arial, Helvetica, sans-serif; font-weight: 700;\"><tbody><tr class=\"RowBG2\" style=\"background-color: rgb(209, 223, 243); font-size: 12px;\"><td rowspan=\"6\" class=\"hdngArial specs-mainheading bottom-border-section\" style=\"padding: 5px 12px 5px 10px; font-size: 13px; border-bottom: 1px solid rgb(171, 196, 232); vertical-align: top;\">Build</td><th align=\"left\" class=\"hdngArial specs-subHeading RowBG1 bottom-border\" style=\"background-color: rgb(235, 241, 250); border-bottom: 1px solid rgb(209, 223, 243); padding: 6px 10px !important;\">OS</th><td colspan=\"2\" class=\"fasla RowBG1 specs-value bottom-border\" style=\"padding: 3px 3px 3px 6px; background-color: white; border-bottom: 1px solid rgb(209, 223, 243); font-weight: 100; border-left: 1px solid rgb(209, 223, 243);\">Android 12 OS &nbsp;</td></tr><tr class=\"RowBG1\" style=\"background-color: rgb(235, 241, 250); font-size: 12px;\"><th align=\"left\" class=\"hdngArial specs-subHeading RowBG1 bottom-border\" style=\"border-bottom: 1px solid rgb(209, 223, 243); padding: 6px 10px !important;\">UI</th><td colspan=\"2\" class=\"fasla specs-value bottom-border\" style=\"padding: 3px 3px 3px 6px; border-bottom: 1px solid rgb(209, 223, 243); background-color: white; font-weight: 100; border-left: 1px solid rgb(209, 223, 243);\">OneUI 4.1 &nbsp;</td></tr><tr class=\"RowBG1\" style=\"background-color: rgb(235, 241, 250); font-size: 12px;\"><th align=\"left\" class=\"hdngArial specs-subHeading RowBG1 bottom-border\" style=\"border-bottom: 1px solid rgb(209, 223, 243); padding: 6px 10px !important;\">Dimensions</th><td colspan=\"2\" class=\"fasla specs-value bottom-border\" style=\"padding: 3px 3px 3px 6px; border-bottom: 1px solid rgb(209, 223, 243); background-color: white; font-weight: 100; border-left: 1px solid rgb(209, 223, 243);\">165.1 x 76.4 x 8.8 mm &nbsp;</td></tr><tr class=\"RowBG1\" style=\"background-color: rgb(235, 241, 250); font-size: 12px;\"><th align=\"left\" class=\"hdngArial specs-subHeading RowBG1 bottom-border\" style=\"border-bottom: 1px solid rgb(209, 223, 243); padding: 6px 10px !important;\">Weight</th><td colspan=\"2\" class=\"fasla specs-value bottom-border\" style=\"padding: 3px 3px 3px 6px; border-bottom: 1px solid rgb(209, 223, 243); background-color: white; font-weight: 100; border-left: 1px solid rgb(209, 223, 243);\">195 g &nbsp;</td></tr><tr class=\"RowBG1\" style=\"background-color: rgb(235, 241, 250); font-size: 12px;\"><th align=\"left\" class=\"hdngArial specs-subHeading RowBG1 bottom-border\" style=\"border-bottom: 1px solid rgb(209, 223, 243); padding: 6px 10px !important;\">SIM</th><td colspan=\"2\" class=\"fasla specs-value bottom-border\" style=\"padding: 3px 3px 3px 6px; border-bottom: 1px solid rgb(209, 223, 243); background-color: white; font-weight: 100; border-left: 1px solid rgb(209, 223, 243);\">Dual Sim, Dual Standby (Nano-SIM) &nbsp;</td></tr><tr class=\"RowBG1\" style=\"background-color: rgb(235, 241, 250); font-size: 12px;\"><th align=\"left\" class=\"hdngArial specs-subHeading RowBG1 bottom-border-section\" style=\"border-bottom: 1px solid rgb(171, 196, 232); padding: 6px 10px !important;\">Colors</th><td colspan=\"2\" class=\"fasla specs-value bottom-border-section\" style=\"padding: 3px 3px 3px 6px; border-bottom: 1px solid rgb(171, 196, 232); background-color: white; font-weight: 100; border-left: 1px solid rgb(209, 223, 243);\">Black, White, Peach, Blue &nbsp;</td></tr><tr class=\"RowBG2\" style=\"background-color: rgb(209, 223, 243); font-size: 12px;\"><td rowspan=\"3\" class=\"hdngArial specs-mainheading bottom-border-section\" style=\"padding: 5px 12px 5px 10px; font-size: 13px; border-bottom: 1px solid rgb(171, 196, 232); vertical-align: top;\">Frequency</td><th align=\"left\" class=\"hdngArial specs-subHeading RowBG1 bottom-border\" style=\"background-color: rgb(235, 241, 250); border-bottom: 1px solid rgb(209, 223, 243); padding: 6px 10px !important;\">2G Band</th><td colspan=\"2\" class=\"fasla RowBG1 specs-value bottom-border\" style=\"padding: 3px 3px 3px 6px; background-color: white; border-bottom: 1px solid rgb(209, 223, 243); font-weight: 100; border-left: 1px solid rgb(209, 223, 243);\"><span style=\"font-weight: 700;\">SIM1:</span>&nbsp;GSM 850 / 900 / 1800 / 1900<br><span style=\"font-weight: 700;\">SIM2:</span>&nbsp;GSM 850 / 900 / 1800 / 1900 &nbsp;</td></tr><tr class=\"RowBG1\" style=\"background-color: rgb(235, 241, 250); font-size: 12px;\"><th align=\"left\" class=\"hdngArial specs-subHeading RowBG1 bottom-border\" style=\"border-bottom: 1px solid rgb(209, 223, 243); padding: 6px 10px !important;\">3G Band</th><td colspan=\"2\" class=\"fasla specs-value bottom-border\" style=\"padding: 3px 3px 3px 6px; border-bottom: 1px solid rgb(209, 223, 243); background-color: white; font-weight: 100; border-left: 1px solid rgb(209, 223, 243);\">HSDPA 850 / 900 / 1900 / 2100 &nbsp;</td></tr><tr class=\"RowBG1\" style=\"background-color: rgb(235, 241, 250); font-size: 12px;\"><th align=\"left\" class=\"hdngArial specs-subHeading RowBG1 bottom-border-section\" style=\"border-bottom: 1px solid rgb(171, 196, 232); padding: 6px 10px !important;\">4G Band</th><td colspan=\"2\" class=\"fasla specs-value bottom-border-section\" style=\"padding: 3px 3px 3px 6px; border-bottom: 1px solid rgb(171, 196, 232); background-color: white; font-weight: 100; border-left: 1px solid rgb(209, 223, 243);\">LTE band 1(2100), 2(1900), 3(1800), 5(850), 7(2600), 8(900), 20(800), 38(2600), 40(2300), 41(2500) &nbsp;</td></tr><tr class=\"RowBG2\" style=\"background-color: rgb(209, 223, 243); font-size: 12px;\"><td rowspan=\"3\" class=\"hdngArial specs-mainheading bottom-border-section\" style=\"padding: 5px 12px 5px 10px; font-size: 13px; border-bottom: 1px solid rgb(171, 196, 232); vertical-align: top;\">Processor</td><th align=\"left\" class=\"hdngArial specs-subHeading RowBG1 bottom-border\" style=\"background-color: rgb(235, 241, 250); border-bottom: 1px solid rgb(209, 223, 243); padding: 6px 10px !important;\">CPU</th><td colspan=\"2\" class=\"fasla RowBG1 specs-value bottom-border\" style=\"padding: 3px 3px 3px 6px; background-color: white; border-bottom: 1px solid rgb(209, 223, 243); font-weight: 100; border-left: 1px solid rgb(209, 223, 243);\">Octa-core (4 x 2.0 GHz Cortex-A55 + 4 x 2.0 GHz Cortex-A55) &nbsp;</td></tr><tr class=\"RowBG1\" style=\"background-color: rgb(235, 241, 250); font-size: 12px;\"><th align=\"left\" class=\"hdngArial specs-subHeading RowBG1 bottom-border\" style=\"border-bottom: 1px solid rgb(209, 223, 243); padding: 6px 10px !important;\">Chipset</th><td colspan=\"2\" class=\"fasla specs-value bottom-border\" style=\"padding: 3px 3px 3px 6px; border-bottom: 1px solid rgb(209, 223, 243); background-color: white; font-weight: 100; border-left: 1px solid rgb(209, 223, 243);\">Exynos 850 (8nm) &nbsp;</td></tr><tr class=\"RowBG1\" style=\"background-color: rgb(235, 241, 250); font-size: 12px;\"><th align=\"left\" class=\"hdngArial specs-subHeading RowBG1 bottom-border-section\" style=\"border-bottom: 1px solid rgb(171, 196, 232); padding: 6px 10px !important;\">GPU</th><td colspan=\"2\" class=\"fasla specs-value bottom-border-section\" style=\"padding: 3px 3px 3px 6px; border-bottom: 1px solid rgb(171, 196, 232); background-color: white; font-weight: 100; border-left: 1px solid rgb(209, 223, 243);\">Mali-G52 MP1 &nbsp;</td></tr><tr class=\"RowBG2\" style=\"background-color: rgb(209, 223, 243); font-size: 12px;\"><td rowspan=\"4\" class=\"hdngArial specs-mainheading bottom-border-section\" style=\"padding: 5px 12px 5px 10px; font-size: 13px; border-bottom: 1px solid rgb(171, 196, 232); vertical-align: top;\">Display</td><th align=\"left\" class=\"hdngArial specs-subHeading RowBG1 bottom-border\" style=\"background-color: rgb(235, 241, 250); border-bottom: 1px solid rgb(209, 223, 243); padding: 6px 10px !important;\">Technology</th><td colspan=\"2\" class=\"fasla RowBG1 specs-value bottom-border\" style=\"padding: 3px 3px 3px 6px; background-color: white; border-bottom: 1px solid rgb(209, 223, 243); font-weight: 100; border-left: 1px solid rgb(209, 223, 243);\">PLS TFT Capacitive touchscreen, 16M Colors, Multitouch &nbsp;</td></tr><tr class=\"RowBG1\" style=\"background-color: rgb(235, 241, 250); font-size: 12px;\"><th align=\"left\" class=\"hdngArial specs-subHeading RowBG1 bottom-border\" style=\"border-bottom: 1px solid rgb(209, 223, 243); padding: 6px 10px !important;\">Size</th><td colspan=\"2\" class=\"fasla specs-value bottom-border\" style=\"padding: 3px 3px 3px 6px; border-bottom: 1px solid rgb(209, 223, 243); background-color: white; font-weight: 100; border-left: 1px solid rgb(209, 223, 243);\">6.6 Inches &nbsp;</td></tr><tr class=\"RowBG1\" style=\"background-color: rgb(235, 241, 250); font-size: 12px;\"><th align=\"left\" class=\"hdngArial specs-subHeading RowBG1 bottom-border\" style=\"border-bottom: 1px solid rgb(209, 223, 243); padding: 6px 10px !important;\">Resolution</th><td colspan=\"2\" class=\"fasla specs-value bottom-border\" style=\"padding: 3px 3px 3px 6px; border-bottom: 1px solid rgb(209, 223, 243); background-color: white; font-weight: 100; border-left: 1px solid rgb(209, 223, 243);\">1080 x 2408 Pixels (~400 PPI) &nbsp;</td></tr><tr class=\"RowBG1\" style=\"background-color: rgb(235, 241, 250); font-size: 12px;\"><th align=\"left\" class=\"hdngArial specs-subHeading RowBG1 bottom-border-section\" style=\"border-bottom: 1px solid rgb(171, 196, 232); padding: 6px 10px !important;\">Protection</th><td colspan=\"2\" class=\"fasla specs-value bottom-border-section\" style=\"padding: 3px 3px 3px 6px; border-bottom: 1px solid rgb(171, 196, 232); background-color: white; font-weight: 100; border-left: 1px solid rgb(209, 223, 243);\">Corning Gorilla Glass 5 &nbsp;</td></tr><tr class=\"RowBG2\" style=\"background-color: rgb(209, 223, 243); font-size: 12px;\"><td rowspan=\"2\" class=\"hdngArial specs-mainheading bottom-border-section\" style=\"padding: 5px 12px 5px 10px; font-size: 13px; border-bottom: 1px solid rgb(171, 196, 232); vertical-align: top;\">Memory</td><th align=\"left\" class=\"hdngArial specs-subHeading RowBG1 bottom-border\" style=\"background-color: rgb(235, 241, 250); border-bottom: 1px solid rgb(209, 223, 243); padding: 6px 10px !important;\">Built-in</th><td colspan=\"2\" class=\"fasla RowBG1 specs-value bottom-border\" style=\"padding: 3px 3px 3px 6px; background-color: white; border-bottom: 1px solid rgb(209, 223, 243); font-weight: 100; border-left: 1px solid rgb(209, 223, 243);\">64GB Built-in, 4GB RAM &nbsp;</td></tr><tr class=\"RowBG1\" style=\"background-color: rgb(235, 241, 250); font-size: 12px;\"><th align=\"left\" class=\"hdngArial specs-subHeading RowBG1 bottom-border-section\" style=\"border-bottom: 1px solid rgb(171, 196, 232); padding: 6px 10px !important;\">Card</th><td colspan=\"2\" class=\"fasla specs-value bottom-border-section\" style=\"padding: 3px 3px 3px 6px; border-bottom: 1px solid rgb(171, 196, 232); background-color: white; font-weight: 100; border-left: 1px solid rgb(209, 223, 243);\">MicroSD Card (support Up to 1TB) &nbsp;</td></tr><tr class=\"RowBG2\" style=\"background-color: rgb(209, 223, 243); font-size: 12px;\"><td rowspan=\"3\" class=\"hdngArial specs-mainheading bottom-border-section\" style=\"padding: 5px 12px 5px 10px; font-size: 13px; border-bottom: 1px solid rgb(171, 196, 232); vertical-align: top;\">Camera</td><th align=\"left\" class=\"hdngArial specs-subHeading RowBG1 bottom-border\" style=\"background-color: rgb(235, 241, 250); border-bottom: 1px solid rgb(209, 223, 243); padding: 6px 10px !important;\">Main</th><td colspan=\"2\" class=\"fasla RowBG1 specs-value bottom-border\" style=\"padding: 3px 3px 3px 6px; background-color: white; border-bottom: 1px solid rgb(209, 223, 243); font-weight: 100; border-left: 1px solid rgb(209, 223, 243);\">Quad Camera: 50 MP, f/1.8, (wide), PDAF + 5 MP, f/2.2, (ultrawide), 1/5\" + 2 MP, f/2.4, (macro) + 2 MP, f/2.4, (depth), LED Flash &nbsp;</td></tr><tr class=\"RowBG1\" style=\"background-color: rgb(235, 241, 250); font-size: 12px;\"><th align=\"left\" class=\"hdngArial specs-subHeading RowBG1 bottom-border\" style=\"border-bottom: 1px solid rgb(209, 223, 243); padding: 6px 10px !important;\">Features</th><td colspan=\"2\" class=\"fasla specs-value bottom-border\" style=\"padding: 3px 3px 3px 6px; border-bottom: 1px solid rgb(209, 223, 243); background-color: white; font-weight: 100; border-left: 1px solid rgb(209, 223, 243);\">Geo-tagging, touch focus, face detection, panorama, HDR, Video (1080p@30fps) &nbsp;</td></tr><tr class=\"RowBG1\" style=\"background-color: rgb(235, 241, 250); font-size: 12px;\"><th align=\"left\" class=\"hdngArial specs-subHeading RowBG1 bottom-border-section\" style=\"border-bottom: 1px solid rgb(171, 196, 232); padding: 6px 10px !important;\">Front</th><td colspan=\"2\" class=\"fasla specs-value bottom-border-section\" style=\"padding: 3px 3px 3px 6px; border-bottom: 1px solid rgb(171, 196, 232); background-color: white; font-weight: 100; border-left: 1px solid rgb(209, 223, 243);\">8 MP, f/2.2, (wide), Video (1080p@30fps) &nbsp;</td></tr><tr class=\"RowBG2\" style=\"background-color: rgb(209, 223, 243); font-size: 12px;\"><td rowspan=\"7\" class=\"hdngArial specs-mainheading bottom-border-section\" style=\"padding: 5px 12px 5px 10px; font-size: 13px; border-bottom: 1px solid rgb(171, 196, 232); vertical-align: top;\">Connectivity</td><th align=\"left\" class=\"hdngArial specs-subHeading RowBG1 bottom-border\" style=\"background-color: rgb(235, 241, 250); border-bottom: 1px solid rgb(209, 223, 243); padding: 6px 10px !important;\">WLAN</th><td colspan=\"2\" class=\"fasla RowBG1 specs-value bottom-border\" style=\"padding: 3px 3px 3px 6px; background-color: white; border-bottom: 1px solid rgb(209, 223, 243); font-weight: 100; border-left: 1px solid rgb(209, 223, 243);\">Wi-Fi 802.11 a/b/g/n/ac, dual-band, Wi-Fi Direct, hotspot &nbsp;</td></tr><tr class=\"RowBG1\" style=\"background-color: rgb(235, 241, 250); font-size: 12px;\"><th align=\"left\" class=\"hdngArial specs-subHeading RowBG1 bottom-border\" style=\"border-bottom: 1px solid rgb(209, 223, 243); padding: 6px 10px !important;\">Bluetooth</th><td colspan=\"2\" class=\"fasla specs-value bottom-border\" style=\"padding: 3px 3px 3px 6px; border-bottom: 1px solid rgb(209, 223, 243); background-color: white; font-weight: 100; border-left: 1px solid rgb(209, 223, 243);\">v5.0 with A2DP, LE &nbsp;</td></tr><tr class=\"RowBG1\" style=\"background-color: rgb(235, 241, 250); font-size: 12px;\"><th align=\"left\" class=\"hdngArial specs-subHeading RowBG1 bottom-border\" style=\"border-bottom: 1px solid rgb(209, 223, 243); padding: 6px 10px !important;\">GPS</th><td colspan=\"2\" class=\"fasla specs-value bottom-border\" style=\"padding: 3px 3px 3px 6px; border-bottom: 1px solid rgb(209, 223, 243); background-color: white; font-weight: 100; border-left: 1px solid rgb(209, 223, 243);\">Yes + A-GPS support &amp; Glonass, BDS, GALILEO, BDS &nbsp;</td></tr><tr class=\"RowBG1\" style=\"background-color: rgb(235, 241, 250); font-size: 12px;\"><th align=\"left\" class=\"hdngArial specs-subHeading RowBG1 bottom-border\" style=\"border-bottom: 1px solid rgb(209, 223, 243); padding: 6px 10px !important;\">Radio</th><td colspan=\"2\" class=\"fasla specs-value bottom-border\" style=\"padding: 3px 3px 3px 6px; border-bottom: 1px solid rgb(209, 223, 243); background-color: white; font-weight: 100; border-left: 1px solid rgb(209, 223, 243);\">FM Radio (Unspecified) &nbsp;</td></tr><tr class=\"RowBG1\" style=\"background-color: rgb(235, 241, 250); font-size: 12px;\"><th align=\"left\" class=\"hdngArial specs-subHeading RowBG1 bottom-border\" style=\"border-bottom: 1px solid rgb(209, 223, 243); padding: 6px 10px !important;\">USB</th><td colspan=\"2\" class=\"fasla specs-value bottom-border\" style=\"padding: 3px 3px 3px 6px; border-bottom: 1px solid rgb(209, 223, 243); background-color: white; font-weight: 100; border-left: 1px solid rgb(209, 223, 243);\">USB Type-C 2.0, USB On-The-Go &nbsp;</td></tr><tr class=\"RowBG1\" style=\"background-color: rgb(235, 241, 250); font-size: 12px;\"><th align=\"left\" class=\"hdngArial specs-subHeading RowBG1 bottom-border\" style=\"border-bottom: 1px solid rgb(209, 223, 243); padding: 6px 10px !important;\">NFC</th><td colspan=\"2\" class=\"fasla specs-value bottom-border\" style=\"padding: 3px 3px 3px 6px; border-bottom: 1px solid rgb(209, 223, 243); background-color: white; font-weight: 100; border-left: 1px solid rgb(209, 223, 243);\">No &nbsp;</td></tr><tr class=\"RowBG1\" style=\"background-color: rgb(235, 241, 250); font-size: 12px;\"><th align=\"left\" class=\"hdngArial specs-subHeading RowBG1 bottom-border-section\" style=\"border-bottom: 1px solid rgb(171, 196, 232); padding: 6px 10px !important;\">Data</th><td colspan=\"2\" class=\"fasla specs-value bottom-border-section\" style=\"padding: 3px 3px 3px 6px; border-bottom: 1px solid rgb(171, 196, 232); background-color: white; font-weight: 100; border-left: 1px solid rgb(209, 223, 243);\"><font color=\"#000077\"><span style=\"font-weight: 700;\">GPRS</span></font>,&nbsp;<font color=\"#000077\"><span style=\"font-weight: 700;\">EDGE</span></font>, 3G (HSPA 42.2/5.76 Mbps), 4G LTE-A &nbsp;</td></tr><tr class=\"RowBG2\" style=\"background-color: rgb(209, 223, 243); font-size: 12px;\"><td rowspan=\"7\" class=\"hdngArial specs-mainheading bottom-border-section\" style=\"padding: 5px 12px 5px 10px; font-size: 13px; border-bottom: 1px solid rgb(171, 196, 232); vertical-align: top;\">Features</td><th align=\"left\" class=\"hdngArial specs-subHeading RowBG1 bottom-border\" style=\"background-color: rgb(235, 241, 250); border-bottom: 1px solid rgb(209, 223, 243); padding: 6px 10px !important;\">Sensors</th><td colspan=\"2\" class=\"fasla RowBG1 specs-value bottom-border\" style=\"padding: 3px 3px 3px 6px; background-color: white; border-bottom: 1px solid rgb(209, 223, 243); font-weight: 100; border-left: 1px solid rgb(209, 223, 243);\">Accelerometer, Compass, Fingerprint (side mounted), Virtual proximity sensing &nbsp;</td></tr><tr class=\"RowBG1\" style=\"background-color: rgb(235, 241, 250); font-size: 12px;\"><th align=\"left\" class=\"hdngArial specs-subHeading RowBG1 bottom-border\" style=\"border-bottom: 1px solid rgb(209, 223, 243); padding: 6px 10px !important;\">Audio</th><td colspan=\"2\" class=\"fasla specs-value bottom-border\" style=\"padding: 3px 3px 3px 6px; border-bottom: 1px solid rgb(209, 223, 243); background-color: white; font-weight: 100; border-left: 1px solid rgb(209, 223, 243);\">3.5mm Audio Jack, MP3/WAV/WMA/eAAC+/FLAC player, MP4/WMV/H.265 player, Speaker&nbsp;<a href=\"https://www.whatmobile.com.pk/Samsung_Galaxy-A13#\" class=\"google-anno\" data-google-vignette=\"false\" data-google-interstitial=\"false\" style=\"border: 0px !important; box-shadow: none !important; display: inline !important; float: none !important; margin: 0px !important; outline: 0px !important; padding: 0px !important; fill: currentcolor !important;\"><svg viewBox=\"100 -1000 840 840\" width=\"calc(12px - 2px)\" height=\"12px\" style=\"color-scheme: initial !important; forced-color-adjust: initial !important; mask: initial !important; math-depth: initial !important; position: initial !important; position-anchor: initial !important; text-size-adjust: initial !important; appearance: initial !important; color: inherit !important; font: initial !important; font-palette: initial !important; font-synthesis: initial !important; inset-area: initial !important; position-area: initial !important; text-orientation: initial !important; text-rendering: initial !important; text-spacing-trim: initial !important; -webkit-font-smoothing: initial !important; -webkit-locale: initial !important; -webkit-text-orientation: initial !important; -webkit-writing-mode: initial !important; writing-mode: initial !important; zoom: initial !important; accent-color: initial !important; place-content: initial !important; place-items: initial !important; place-self: initial !important; alignment-baseline: initial !important; anchor-name: initial !important; animation-composition: initial !important; animation: initial !important; app-region: initial !important; aspect-ratio: initial !important; backdrop-filter: initial !important; backface-visibility: initial !important; background: initial !important; background-blend-mode: initial !important; baseline-shift: initial !important; baseline-source: initial !important; block-size: initial !important; border-block: initial !important; border: 0px !important; border-radius: initial !important; border-collapse: initial !important; border-end-end-radius: initial !important; border-end-start-radius: initial !important; border-inline: initial !important; border-start-end-radius: initial !important; border-start-start-radius: initial !important; inset: initial !important; box-decoration-break: initial !important; box-shadow: none !important; box-sizing: initial !important; break-after: initial !important; break-before: initial !important; break-inside: initial !important; buffered-rendering: initial !important; caption-side: initial !important; caret-color: initial !important; clear: initial !important; clip: initial !important; clip-path: initial !important; clip-rule: initial !important; color-interpolation: initial !important; color-interpolation-filters: initial !important; color-rendering: initial !important; columns: initial !important; column-fill: initial !important; gap: initial !important; column-rule: initial !important; column-span: initial !important; contain: initial !important; contain-intrinsic-block-size: initial !important; contain-intrinsic-size: initial !important; contain-intrinsic-inline-size: initial !important; container: initial !important; content: initial !important; content-visibility: initial !important; counter-increment: initial !important; counter-reset: initial !important; counter-set: initial !important; cursor: inherit !important; cx: initial !important; cy: initial !important; d: initial !important; display: inline !important; dominant-baseline: initial !important; empty-cells: initial !important; field-sizing: initial !important; fill: currentcolor !important; fill-opacity: initial !important; fill-rule: initial !important; filter: initial !important; flex: initial !important; flex-flow: initial !important; float: none !important; flood-color: initial !important; flood-opacity: initial !important; grid: initial !important; grid-area: initial !important; height: initial !important; hyphenate-character: initial !important; hyphenate-limit-chars: initial !important; hyphens: initial !important; image-orientation: initial !important; image-rendering: initial !important; initial-letter: initial !important; inline-size: initial !important; inset-block: initial !important; inset-inline: initial !important; interpolate-size: initial !important; isolation: initial !important; letter-spacing: initial !important; lighting-color: initial !important; line-break: initial !important; list-style: initial !important; margin-block: initial !important; margin: 0px !important; margin-inline: initial !important; marker: initial !important; mask-type: initial !important; math-shift: initial !important; math-style: initial !important; max-block-size: initial !important; max-height: initial !important; max-inline-size: initial !important; max-width: initial !important; min-block-size: initial !important; min-height: initial !important; min-inline-size: initial !important; min-width: initial !important; mix-blend-mode: initial !important; object-fit: initial !important; object-position: initial !important; object-view-box: initial !important; offset: initial !important; opacity: initial !important; order: initial !important; orphans: initial !important; outline: 0px !important; outline-offset: initial !important; overflow-anchor: initial !important; overflow-clip-margin: initial !important; overflow-wrap: initial !important; overflow: initial !important; overlay: initial !important; overscroll-behavior-block: initial !important; overscroll-behavior-inline: initial !important; overscroll-behavior: initial !important; padding-block: initial !important; padding: 0px !important; padding-inline: initial !important; page: initial !important; page-orientation: initial !important; paint-order: initial !important; perspective: initial !important; perspective-origin: initial !important; pointer-events: initial !important; position-try: initial !important; position-visibility: initial !important; quotes: initial !important; r: initial !important; resize: initial !important; rotate: initial !important; ruby-align: initial !important; ruby-position: initial !important; rx: initial !important; ry: initial !important; scale: initial !important; scroll-behavior: initial !important; scroll-margin-block: initial !important; scroll-margin: initial !important; scroll-margin-inline: initial !important; scroll-padding-block: initial !important; scroll-padding: initial !important; scroll-padding-inline: initial !important; scroll-snap-align: initial !important; scroll-snap-stop: initial !important; scroll-snap-type: initial !important; scroll-timeline: initial !important; scrollbar-color: initial !important; scrollbar-gutter: initial !important; scrollbar-width: initial !important; shape-image-threshold: initial !important; shape-margin: initial !important; shape-outside: initial !important; shape-rendering: initial !important; size: initial !important; speak: initial !important; stop-color: initial !important; stop-opacity: initial !important; stroke: initial !important; stroke-dasharray: initial !important; stroke-dashoffset: initial !important; stroke-linecap: initial !important; stroke-linejoin: initial !important; stroke-miterlimit: initial !important; stroke-opacity: initial !important; stroke-width: initial !important; tab-size: initial !important; table-layout: initial !important; text-align: initial !important; text-align-last: initial !important; text-anchor: initial !important; text-combine-upright: initial !important; text-decoration-line: initial !important; text-decoration-skip-ink: initial !important; text-emphasis: initial !important; text-emphasis-position: initial !important; text-indent: initial !important; text-overflow: initial !important; text-shadow: initial !important; text-transform: initial !important; text-underline-offset: initial !important; text-underline-position: initial !important; text-wrap: initial !important; timeline-scope: initial !important; touch-action: initial !important; transform: initial !important; transform-box: initial !important; transform-origin: initial !important; transform-style: initial !important; transition: initial !important; translate: initial !important; user-select: initial !important; vector-effect: initial !important; vertical-align: initial !important; view-timeline: initial !important; view-transition-class: initial !important; view-transition-name: initial !important; visibility: initial !important; border-spacing: initial !important; -webkit-box-align: initial !important; -webkit-box-decoration-break: initial !important; -webkit-box-direction: initial !important; -webkit-box-flex: initial !important; -webkit-box-ordinal-group: initial !important; -webkit-box-orient: initial !important; -webkit-box-pack: initial !important; -webkit-box-reflect: initial !important; -webkit-line-break: initial !important; -webkit-line-clamp: initial !important; -webkit-mask-box-image: initial !important; -webkit-print-color-adjust: initial !important; -webkit-rtl-ordering: initial !important; -webkit-ruby-position: initial !important; -webkit-tap-highlight-color: initial !important; -webkit-text-combine: initial !important; -webkit-text-decorations-in-effect: initial !important; -webkit-text-fill-color: unset !important; -webkit-text-security: initial !important; -webkit-text-stroke: initial !important; -webkit-user-drag: initial !important; white-space-collapse: initial !important; widows: initial !important; width: initial !important; will-change: initial !important; word-break: initial !important; word-spacing: initial !important; x: initial !important; y: initial !important; z-index: initial !important;\"><path d=\"m784-120-252-252q-30 24-69 38t-83 14q-109 0-184.5-75.5t-75.5-184.5q0-109 75.5-184.5t184.5-75.5q109 0 184.5 75.5t75.5 184.5q0 44-14 83t-38 69l252 252-56 56zm-404-280q75 0 127.5-52.5t52.5-127.5q0-75-52.5-127.5t-127.5-52.5q-75 0-127.5 52.5t-52.5 127.5q0 75 52.5 127.5t127.5 52.5z\"></path></svg>&nbsp;<span class=\"google-anno-t\" style=\"border: 0px !important; box-shadow: none !important; display: inline !important; float: none !important; margin: 0px !important; outline: 0px !important; padding: 0px !important; text-decoration-line: underline !important; text-decoration-style: dotted !important; color: inherit !important; font-family: inherit !important; font-size: inherit !important; font-style: inherit !important; font-weight: inherit !important;\">Phone</span></a>&nbsp;&nbsp;</td></tr><tr class=\"RowBG1\" style=\"background-color: rgb(235, 241, 250); font-size: 12px;\"><th align=\"left\" class=\"hdngArial specs-subHeading RowBG1 bottom-border\" style=\"border-bottom: 1px solid rgb(209, 223, 243); padding: 6px 10px !important;\">Browser</th><td colspan=\"2\" class=\"fasla specs-value bottom-border\" style=\"padding: 3px 3px 3px 6px; border-bottom: 1px solid rgb(209, 223, 243); background-color: white; font-weight: 100; border-left: 1px solid rgb(209, 223, 243);\">HTML5 &nbsp;</td></tr><tr class=\"RowBG1\" style=\"background-color: rgb(235, 241, 250); font-size: 12px;\"><th align=\"left\" class=\"hdngArial specs-subHeading RowBG1 bottom-border\" style=\"border-bottom: 1px solid rgb(209, 223, 243); padding: 6px 10px !important;\">Messaging</th><td colspan=\"2\" class=\"fasla specs-value bottom-border\" style=\"padding: 3px 3px 3px 6px; border-bottom: 1px solid rgb(209, 223, 243); background-color: white; font-weight: 100; border-left: 1px solid rgb(209, 223, 243);\">SMS(threaded view), MMS, Email, Push Mail, IM &nbsp;</td></tr><tr class=\"RowBG1\" style=\"background-color: rgb(235, 241, 250); font-size: 12px;\"><th align=\"left\" class=\"hdngArial specs-subHeading RowBG1 bottom-border\" style=\"border-bottom: 1px solid rgb(209, 223, 243); padding: 6px 10px !important;\">Games</th><td colspan=\"2\" class=\"fasla specs-value bottom-border\" style=\"padding: 3px 3px 3px 6px; border-bottom: 1px solid rgb(209, 223, 243); background-color: white; font-weight: 100; border-left: 1px solid rgb(209, 223, 243);\">Built-in + Downloadable &nbsp;</td></tr><tr class=\"RowBG1\" style=\"background-color: rgb(235, 241, 250); font-size: 12px;\"><th align=\"left\" class=\"hdngArial specs-subHeading RowBG1 bottom-border\" style=\"border-bottom: 1px solid rgb(209, 223, 243); padding: 6px 10px !important;\">Torch</th><td colspan=\"2\" class=\"fasla specs-value bottom-border\" style=\"padding: 3px 3px 3px 6px; border-bottom: 1px solid rgb(209, 223, 243); background-color: white; font-weight: 100; border-left: 1px solid rgb(209, 223, 243);\">Yes &nbsp;</td></tr><tr class=\"RowBG1\" style=\"background-color: rgb(235, 241, 250); font-size: 12px;\"><th align=\"left\" class=\"hdngArial specs-subHeading RowBG1 bottom-border-section\" style=\"border-bottom: 1px solid rgb(171, 196, 232); padding: 6px 10px !important;\">Extra</th><td colspan=\"2\" class=\"fasla specs-value bottom-border-section\" style=\"padding: 3px 3px 3px 6px; border-bottom: 1px solid rgb(171, 196, 232); background-color: white; font-weight: 100; border-left: 1px solid rgb(209, 223, 243);\">Glass front + Gorilla Glass 5), Plastic frame, plastic back, Photo/video editor, Document viewer &nbsp;</td></tr><tr class=\"RowBG2\" style=\"background-color: rgb(209, 223, 243); font-size: 12px;\"><td rowspan=\"2\" class=\"hdngArial specs-mainheading bottom-border-section\" style=\"padding: 5px 12px 5px 10px; font-size: 13px; border-bottom: 1px solid rgb(171, 196, 232); vertical-align: top;\">Battery</td><th align=\"left\" class=\"hdngArial specs-subHeading RowBG1 bottom-border\" style=\"background-color: rgb(235, 241, 250); border-bottom: 1px solid rgb(209, 223, 243); padding: 6px 10px !important;\">Capacity</th><td colspan=\"2\" class=\"fasla RowBG1 specs-value bottom-border\" style=\"padding: 3px 3px 3px 6px; background-color: white; border-bottom: 1px solid rgb(209, 223, 243); font-weight: 100; border-left: 1px solid rgb(209, 223, 243);\">(Li-Po Non removable), 5000 mAh &nbsp;</td></tr><tr class=\"RowBG1\" style=\"background-color: rgb(235, 241, 250); font-size: 12px;\"><th align=\"left\" class=\"hdngArial specs-subHeading RowBG1 bottom-border-section\" style=\"border-bottom: 1px solid rgb(171, 196, 232); padding: 6px 10px !important;\"></th><td colspan=\"2\" class=\"fasla specs-value bottom-border-section\" style=\"padding: 3px 3px 3px 6px; border-bottom: 1px solid rgb(171, 196, 232); background-color: white; font-weight: 100; border-left: 1px solid rgb(209, 223, 243);\">- Fast charging 15W &nbsp;</td></tr></tbody></table><table width=\"604\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-spacing: 0px; color: rgb(102, 102, 102); font-family: Arial, Helvetica, sans-serif; font-weight: 700; border-left: 1px solid rgb(171, 196, 232); border-top: none;\"><colgroup span=\"3\"></colgroup><tbody><tr class=\"RowBG2\" style=\"background-color: rgb(209, 223, 243); font-size: 12px;\"><th rowspan=\"1\" align=\"left\" class=\"hdngArial bottom-border-section specs-mainheading\" style=\"padding: 5px 12px 5px 10px; font-size: 13px; border-bottom: 1px solid rgb(171, 196, 232); width: 101px;\"><h2 class=\"hdngArial\" style=\"font-family: Arial, Helvetica, sans-serif; font-size: 13px; color: rgb(102, 102, 102); font-weight: 700; padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; display: inline;\">Price</h2></th><td colspan=\"2\" class=\"fasla RowBG1 bottom-border-section right-border specs-subHeading\" style=\"background-color: rgb(235, 241, 250); border-bottom: 1px solid rgb(171, 196, 232); border-right: 1px solid rgb(171, 196, 232); padding: 6px 10px !important;\">Price in Rs:&nbsp;44,999&nbsp;&nbsp;&nbsp;&nbsp; Price in USD:&nbsp;$138&nbsp;&nbsp;</td></tr><tr class=\"RowBG2\" style=\"background-color: rgb(209, 223, 243); font-size: 12px;\"><th rowspan=\"1\" align=\"left\" class=\"hdngArial bottom-border-section specs-mainheading\" style=\"padding: 5px 12px 5px 10px; font-size: 13px; border-bottom: 1px solid rgb(171, 196, 232); width: 101px;\">Ratings</th><td colspan=\"2\" class=\"fasla RowBG1 bottom-border-section right-border specs-subHeading\" style=\"background-color: rgb(235, 241, 250); border-bottom: 1px solid rgb(171, 196, 232); border-right: 1px solid rgb(171, 196, 232); padding: 6px 10px !important;\">Average Rating is&nbsp;4.2 stars&nbsp;- based on&nbsp;118&nbsp;user reviews.&nbsp;&nbsp;</td></tr></tbody></table>', NULL, NULL, NULL, 50000.00, 20.00, 61, 31, 35, 'Yes', 'Samsung Galaxy A13 +', 'ABC-12345-S-BL', 'Yes', 5, 1, '2024-10-30 13:12:58', '2024-10-31 13:02:21'),
(25, 'Lenovo Tab M11', 'lenovo-tab-m11', '<h3 style=\"color: rgb(85, 85, 85); margin-bottom: 0.5em; text-rendering: optimizespeed; width: 495px; font-size: 1.25em; font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Lenovo Tab M11 Tablet Specifications</span></h3><p style=\"margin-bottom: 1.3em; color: rgb(71, 71, 71); font-family: Montserrat, sans-serif;\"><img draggable=\"false\" role=\"img\" class=\"emoji\" alt=\"✅\" src=\"https://s.w.org/images/core/emoji/15.0.3/svg/2705.svg\" style=\"max-width: 100%; opacity: 1; transition: opacity 1s; border-width: initial !important; border-color: initial !important; border-image: initial !important; display: inline !important; height: 1em !important; vertical-align: -0.1em !important; box-shadow: none !important; width: 1em !important; margin: 0px 0.07em !important; background: none !important; padding: 0px !important;\">&nbsp;Model: Tab M11<br><img draggable=\"false\" role=\"img\" class=\"emoji\" alt=\"✅\" src=\"https://s.w.org/images/core/emoji/15.0.3/svg/2705.svg\" style=\"max-width: 100%; opacity: 1; transition: opacity 1s; border-width: initial !important; border-color: initial !important; border-image: initial !important; display: inline !important; height: 1em !important; vertical-align: -0.1em !important; box-shadow: none !important; width: 1em !important; margin: 0px 0.07em !important; background: none !important; padding: 0px !important;\">&nbsp;11.0 inches Display<br><img draggable=\"false\" role=\"img\" class=\"emoji\" alt=\"✅\" src=\"https://s.w.org/images/core/emoji/15.0.3/svg/2705.svg\" style=\"max-width: 100%; opacity: 1; transition: opacity 1s; border-width: initial !important; border-color: initial !important; border-image: initial !important; display: inline !important; height: 1em !important; vertical-align: -0.1em !important; box-shadow: none !important; width: 1em !important; margin: 0px 0.07em !important; background: none !important; padding: 0px !important;\">&nbsp;8GB Ram<br><img draggable=\"false\" role=\"img\" class=\"emoji\" alt=\"✅\" src=\"https://s.w.org/images/core/emoji/15.0.3/svg/2705.svg\" style=\"max-width: 100%; opacity: 1; transition: opacity 1s; border-width: initial !important; border-color: initial !important; border-image: initial !important; display: inline !important; height: 1em !important; vertical-align: -0.1em !important; box-shadow: none !important; width: 1em !important; margin: 0px 0.07em !important; background: none !important; padding: 0px !important;\">&nbsp;128GB Storage<br><img draggable=\"false\" role=\"img\" class=\"emoji\" alt=\"✅\" src=\"https://s.w.org/images/core/emoji/15.0.3/svg/2705.svg\" style=\"max-width: 100%; opacity: 1; transition: opacity 1s; border-width: initial !important; border-color: initial !important; border-image: initial !important; display: inline !important; height: 1em !important; vertical-align: -0.1em !important; box-shadow: none !important; width: 1em !important; margin: 0px 0.07em !important; background: none !important; padding: 0px !important;\">&nbsp;Android 13<br><img draggable=\"false\" role=\"img\" class=\"emoji\" alt=\"✅\" src=\"https://s.w.org/images/core/emoji/15.0.3/svg/2705.svg\" style=\"max-width: 100%; opacity: 1; transition: opacity 1s; border-width: initial !important; border-color: initial !important; border-image: initial !important; display: inline !important; height: 1em !important; vertical-align: -0.1em !important; box-shadow: none !important; width: 1em !important; margin: 0px 0.07em !important; background: none !important; padding: 0px !important;\">&nbsp;Chipset: Mediatek MT6769H Helio G88<br><img draggable=\"false\" role=\"img\" class=\"emoji\" alt=\"✅\" src=\"https://s.w.org/images/core/emoji/15.0.3/svg/2705.svg\" style=\"max-width: 100%; opacity: 1; transition: opacity 1s; border-width: initial !important; border-color: initial !important; border-image: initial !important; display: inline !important; height: 1em !important; vertical-align: -0.1em !important; box-shadow: none !important; width: 1em !important; margin: 0px 0.07em !important; background: none !important; padding: 0px !important;\">&nbsp;CPU: Octa-core<br><img draggable=\"false\" role=\"img\" class=\"emoji\" alt=\"✅\" src=\"https://s.w.org/images/core/emoji/15.0.3/svg/2705.svg\" style=\"max-width: 100%; opacity: 1; transition: opacity 1s; border-width: initial !important; border-color: initial !important; border-image: initial !important; display: inline !important; height: 1em !important; vertical-align: -0.1em !important; box-shadow: none !important; width: 1em !important; margin: 0px 0.07em !important; background: none !important; padding: 0px !important;\">&nbsp;GPU: Mali-G52 MC2<br><img draggable=\"false\" role=\"img\" class=\"emoji\" alt=\"✅\" src=\"https://s.w.org/images/core/emoji/15.0.3/svg/2705.svg\" style=\"max-width: 100%; opacity: 1; transition: opacity 1s; border-width: initial !important; border-color: initial !important; border-image: initial !important; display: inline !important; height: 1em !important; vertical-align: -0.1em !important; box-shadow: none !important; width: 1em !important; margin: 0px 0.07em !important; background: none !important; padding: 0px !important;\">&nbsp;Li-Po 7040 mAh, non-removable<br><img draggable=\"false\" role=\"img\" class=\"emoji\" alt=\"✅\" src=\"https://s.w.org/images/core/emoji/15.0.3/svg/2705.svg\" style=\"max-width: 100%; opacity: 1; transition: opacity 1s; border-width: initial !important; border-color: initial !important; border-image: initial !important; display: inline !important; height: 1em !important; vertical-align: -0.1em !important; box-shadow: none !important; width: 1em !important; margin: 0px 0.07em !important; background: none !important; padding: 0px !important;\">&nbsp;USB Type-C 2.0<br><img draggable=\"false\" role=\"img\" class=\"emoji\" alt=\"✅\" src=\"https://s.w.org/images/core/emoji/15.0.3/svg/2705.svg\" style=\"max-width: 100%; opacity: 1; transition: opacity 1s; border-width: initial !important; border-color: initial !important; border-image: initial !important; display: inline !important; height: 1em !important; vertical-align: -0.1em !important; box-shadow: none !important; width: 1em !important; margin: 0px 0.07em !important; background: none !important; padding: 0px !important;\">&nbsp;WiFi<br><img draggable=\"false\" role=\"img\" class=\"emoji\" alt=\"✅\" src=\"https://s.w.org/images/core/emoji/15.0.3/svg/2705.svg\" style=\"max-width: 100%; opacity: 1; transition: opacity 1s; border-width: initial !important; border-color: initial !important; border-image: initial !important; display: inline !important; height: 1em !important; vertical-align: -0.1em !important; box-shadow: none !important; width: 1em !important; margin: 0px 0.07em !important; background: none !important; padding: 0px !important;\">&nbsp;Bluetooth<br><img draggable=\"false\" role=\"img\" class=\"emoji\" alt=\"✅\" src=\"https://s.w.org/images/core/emoji/15.0.3/svg/2705.svg\" style=\"max-width: 100%; opacity: 1; transition: opacity 1s; border-width: initial !important; border-color: initial !important; border-image: initial !important; display: inline !important; height: 1em !important; vertical-align: -0.1em !important; box-shadow: none !important; width: 1em !important; margin: 0px 0.07em !important; background: none !important; padding: 0px !important;\">&nbsp;Front Camera: 13MP<br><img draggable=\"false\" role=\"img\" class=\"emoji\" alt=\"✅\" src=\"https://s.w.org/images/core/emoji/15.0.3/svg/2705.svg\" style=\"max-width: 100%; opacity: 1; transition: opacity 1s; border-width: initial !important; border-color: initial !important; border-image: initial !important; display: inline !important; height: 1em !important; vertical-align: -0.1em !important; box-shadow: none !important; width: 1em !important; margin: 0px 0.07em !important; background: none !important; padding: 0px !important;\">&nbsp;Back Camera: 8MP<br><img draggable=\"false\" role=\"img\" class=\"emoji\" alt=\"✅\" src=\"https://s.w.org/images/core/emoji/15.0.3/svg/2705.svg\" style=\"max-width: 100%; opacity: 1; transition: opacity 1s; border-width: initial !important; border-color: initial !important; border-image: initial !important; display: inline !important; height: 1em !important; vertical-align: -0.1em !important; box-shadow: none !important; width: 1em !important; margin: 0px 0.07em !important; background: none !important; padding: 0px !important;\">&nbsp;Video: 1080p@30fps</p>', NULL, NULL, NULL, 44999.00, 50000.00, 61, 32, 36, 'Yes', 'Lenovo Tab M11', 'Lenovo Tab M11', 'Yes', 10, 1, '2024-10-31 13:27:51', '2024-10-31 13:28:09');
INSERT INTO `products` (`id`, `title`, `slug`, `description`, `short_description`, `shipping_returns`, `related_products`, `price`, `compare_price`, `category_id`, `sub_category_id`, `brand_id`, `is_featured`, `sku`, `barcode`, `track_qty`, `qty`, `status`, `created_at`, `updated_at`) VALUES
(26, 'HP EliteBook 840 G5', 'hp-elitebook-840-g5', '<h2 class=\"pdp-mod-section-title outer-title\" data-spm-anchor-id=\"a2a0e.pdp_revamp.0.i0.7b456859p7ntE9\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px 24px; font-family: Roboto-Medium; font-size: 16px; line-height: 52px; color: rgb(33, 33, 33); overflow: hidden; text-overflow: ellipsis; text-wrap-mode: nowrap; height: 52px; background: rgb(250, 250, 250);\">Product details of HP EliteBook 840 G5 - CORE I7 -8TH GENERATION- 16GB RAM - 512GB SSD - Windows® 11 Licensed - FREE LAPTOP BAG - Daraz like new laptops</h2><div class=\"pdp-product-detail\" data-spm=\"product_detail\" style=\"margin: 0px; padding: 0px; position: relative; color: rgb(0, 0, 0); font-family: Roboto, -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, Helvetica, sans-serif; font-size: 12px;\"><div class=\"pdp-product-desc height-limit\" style=\"margin: 0px; padding: 5px 14px 5px 24px; height: 780px; overflow-y: hidden;\"><div class=\"html-content pdp-product-highlights\" style=\"margin: 0px; padding: 11px 0px 16px; word-break: break-word; border-bottom: 1px solid rgb(239, 240, 245); overflow: hidden;\"><ul class=\"\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; list-style: none; overflow: hidden; column-count: 2; column-gap: 32px;\"><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">6 Months Warranty (T&amp;C apply)Warranty Center Location: KarachiDaraz Like New products are in Good Condition. They feel like new.Fully functional with all features working, with minimal scratches, minor usage but no damage.A preinstalled operating systemProduct will be in Daraz Like New Original PackagingWarranty is void in the event of improper use, negligence and forceful damage by the customer.Warranty means repair or replacement warranty.Any issues related to windows/ Operating systems and drivers must be claimed through warranty.Proof of Purchase must be require for warranty claim.Warranty does not cover burned, broken deformed, water damage, sound distortion.No display / screen, touch, Keyboard &amp; buttons warranty.Warranty will be void if security sticker seals are removed.Battery Backup: 1.5 hours (90 minutes) battery backupCharger may not be original but compatible.</li><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">HP EliteBook</li><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">Model Elitebook 840 G5</li><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">OS Version Windows 11 Licenesed</li><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">Pro Processor Core i7 8th Generation</li><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">Processor Speed 8350U Core i5 1.7GHz upto 3.6GHz With Vpro Technology</li><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">Processor Cache 6 MB</li><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">Ram 16GB Ram Type</li><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">DDR4</li><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">Max Ram 32GB</li><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">SSD 512GB NVME</li><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">Screen Size 14 inch Screen</li><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">Resolution 1920*1080 Full HD IPS Display</li><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">Graphics Card Intel Integrated Graphics</li><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">Graphics Card Details Intel® UHD Graphics 620</li><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">Graphics Card Memory System Shared</li><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">Finger Print Reader Yes</li><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">Backlit Keyboard Yes</li><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">Bluetooth Yes</li><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">Lan Yes</li><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">Wifi Yes</li><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">HDMI Yes</li><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">Webcam Yes</li><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">USB 3.12 PortsUSB Type C1 Port (Thunderbolt™ 3)</li><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">WINDOWS 11 LICENSED</li></ul></div></div></div>', NULL, NULL, NULL, 104999.00, 105999.00, 61, 33, 37, 'Yes', 'HP EliteBook 840 G5', 'HP EliteBook 840 G5', 'Yes', 5, 1, '2024-10-31 13:35:03', '2024-10-31 13:35:03'),
(27, 'Tronsmart Bluetooth Speaker', 'tronsmart-bluetooth-speaker', '<h1 class=\"indIKd q23Yce fA1vYb cS4Vcb-pGL6qe-fwJd0c\" jsname=\"\" style=\"font-family: &quot;Google Sans&quot;, Arial, sans-serif; font-size: 18px; font-weight: 400; margin: 0px; padding: 0px; color: var(--uv-styles-color-text-emphasis); line-height: 24px; flex: 1 1 auto; overflow: hidden; text-decoration: none; text-overflow: ellipsis; display: -webkit-box; -webkit-box-orient: vertical; -webkit-line-clamp: var(--uv-title-max-title-lines); --uv-title-max-title-lines: 2;\">Tronsmart Bluetooth Speaker| Portable &amp; Powerful Audio</h1>', NULL, NULL, NULL, 1200.00, 1500.00, 61, 34, NULL, 'No', 'Tronsmart Bluetooth Speaker', 'Tronsmart Bluetooth Speaker', 'Yes', 5, 1, '2024-11-01 12:24:59', '2024-11-01 12:24:59'),
(28, 'Bluetooth and Wireless Speakers', 'bluetooth-and-wireless-speakers', '<h1 class=\"indIKd q23Yce fA1vYb cS4Vcb-pGL6qe-fwJd0c\" jsname=\"\" style=\"font-family: &quot;Google Sans&quot;, Arial, sans-serif; font-size: 18px; font-weight: 400; margin: 0px; padding: 0px; color: var(--uv-styles-color-text-emphasis); line-height: 24px; flex: 1 1 auto; overflow: hidden; text-decoration: none; text-overflow: ellipsis; display: -webkit-box; -webkit-box-orient: vertical; -webkit-line-clamp: var(--uv-title-max-title-lines); --uv-title-max-title-lines: 2;\">The Best Bluetooth and Wireless Speakers<span>&nbsp;</span></h1>', NULL, NULL, NULL, 1400.00, 1600.00, 61, 34, NULL, 'No', 'Bluetooth and Wireless Speakers', 'Bluetooth and Wireless Speakers', 'Yes', 5, 1, '2024-11-01 12:26:09', '2024-11-01 12:26:09'),
(29, 'Rolex Watche', 'rolex-watche', '<h1 class=\"indIKd q23Yce fA1vYb cS4Vcb-pGL6qe-fwJd0c\" jsname=\"\" style=\"font-family: &quot;Google Sans&quot;, Arial, sans-serif; font-size: 18px; font-weight: 400; margin: 0px; padding: 0px; color: var(--uv-styles-color-text-emphasis); line-height: 24px; flex: 1 1 auto; overflow: hidden; text-decoration: none; text-overflow: ellipsis; display: -webkit-box; -webkit-box-orient: vertical; -webkit-line-clamp: var(--uv-title-max-title-lines); --uv-title-max-title-lines: 2;\">10 Most Expensive Rolex Watches Of All Time</h1>', NULL, NULL, NULL, 10000.00, 12000.00, 61, 35, NULL, 'No', 'Rolex Watche', 'Rolex Watche', 'Yes', 5, 1, '2024-11-01 12:28:05', '2024-11-01 12:28:05'),
(30, 'GMT Ice', 'gmt-ice', '<h6 style=\"box-sizing: inherit; margin: 1.19em 0px 32px; line-height: 52px;\" class=\"\"><font color=\"#242424\" face=\"sohne, Helvetica Neue, Helvetica, Arial, sans-serif\"><span style=\"font-size: 42px; letter-spacing: -0.462px;\">The most expensive Timepiece Rolex has ever created</span></font></h6>', NULL, NULL, '29,35,31,26', 120000.00, 150000.00, 61, 35, NULL, 'No', 'GMT Ice', 'gmt-ice', 'Yes', 2, 1, '2024-11-01 12:30:45', '2024-11-06 23:25:30'),
(31, 'T Shirt', 't-shirt', NULL, NULL, NULL, NULL, 400.00, 430.00, 62, 36, NULL, 'No', 'T Shirt', 't-shirt', 'Yes', 10, 1, '2024-11-01 12:32:25', '2024-11-01 12:32:25'),
(32, 'Black T-Shirt', 'black-t-shirt', '<p>black-t-shirt</p>', NULL, NULL, NULL, 1200.00, 1250.00, 62, 36, NULL, 'No', 'Black T-Shirt', 'black-t-shirt', 'Yes', 5, 1, '2024-11-01 12:33:24', '2024-11-01 12:33:24'),
(33, 'Air Conditioner - Techicy', 'air-conditioner-techicy', '<p>Main Factors to Consider Before Buying an Air Conditioner - Techicy</p>', NULL, NULL, NULL, 120000.00, 125000.00, 64, 49, NULL, 'Yes', 'Air Conditioner - Techicy', 'air-conditioner-techicy', 'Yes', 3, 1, '2024-11-01 12:35:56', '2024-11-01 12:36:04'),
(34, 'Android Smart Sense HD', 'android-smart-sense-hd', '<p>Oktra 24″ Android Smart Sense HD LED TV OK 566 Series (K566S) - Daraz Like New | Daraz.pk</p>', NULL, NULL, NULL, 50000.00, 53000.00, 64, 47, NULL, 'Yes', 'Android Smart Sense HD', 'android-smart-sense-hd', 'Yes', 3, 1, '2024-11-01 12:37:32', '2024-11-01 12:37:32'),
(35, 'LG Automatic  Washing Machine', 'lg-automatic-washing-machine', '<p><a data-ved=\"0CBcQjhxqFwoTCMjv7LHWu4kDFQAAAAAdAAAAABAE\" rel=\"noopener\" target=\"_blank\" href=\"https://friendshome.pk/products/wl1369nehtfc\" jsaction=\"focus:trigger.HTIQtd;mousedown:trigger.HTIQtd;touchstart:trigger.HTIQtd;;\" class=\"Hnk30e indIKd\" style=\"color: var(--uv-styles-color-text-emphasis); text-decoration-line: underline; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.1); flex: 1 1 0%; display: flex; overflow: hidden; align-items: center; margin: 0px; min-height: 36px; outline: 0px; font-family: Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\"></a></p><h1 class=\"indIKd q23Yce fA1vYb cS4Vcb-pGL6qe-fwJd0c\" jsname=\"\" style=\"font-family: &quot;Google Sans&quot;, Arial, sans-serif; font-size: 18px; font-weight: 400; margin: 0px; padding: 0px; color: var(--uv-styles-color-text-emphasis); line-height: 24px; flex: 1 1 auto; overflow: hidden; text-decoration: none; text-overflow: ellipsis; display: -webkit-box; -webkit-box-orient: vertical; -webkit-line-clamp: var(--uv-title-max-title-lines); --uv-title-max-title-lines: 2;\">LG 13KG SMART INVERTER MOTOR AUTOMATIC TOP LOAD WASHING MACHINE Model T1369NEHTF</h1>', NULL, NULL, NULL, 16000.00, 17500.00, 64, 48, NULL, 'Yes', 'LG Automatic  Washing Machine', 'lg-automatic-washing-machine', 'Yes', 3, 1, '2024-11-01 12:41:11', '2024-11-01 12:41:11'),
(36, 'Portable Evaporative Cooler', 'portable-evaporative-cooler', '<h1 class=\"indIKd q23Yce fA1vYb cS4Vcb-pGL6qe-fwJd0c\" jsname=\"\" style=\"font-family: &quot;Google Sans&quot;, Arial, sans-serif; font-size: 18px; font-weight: 400; margin: 0px; padding: 0px; color: var(--uv-styles-color-text-emphasis); line-height: 24px; flex: 1 1 auto; overflow: hidden; text-decoration: none; text-overflow: ellipsis; display: -webkit-box; -webkit-box-orient: vertical; -webkit-line-clamp: var(--uv-title-max-title-lines); --uv-title-max-title-lines: 2;\">Hessaire 1,300 CFM 2-Speed Portable Evaporative Cooler (Swamp Cooler) for 500 sq. ft. in Ice Blue MC18MT - The Home Depot</h1>', NULL, NULL, NULL, 10000.00, 12000.00, 64, 52, NULL, 'Yes', 'Portable Evaporative Cooler', 'portable-evaporative-cooler', 'Yes', 6, 1, '2024-11-01 12:43:08', '2024-11-01 12:43:08'),
(37, 'SNEAKERS 0120332', 'sneakers-0120332', '<p><strong style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">Lorem Ipsum</strong><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</span></p>', '<p><strong style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">Lorem Ipsum</strong><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries</span></p>', '<p><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span></p>', '25,26', 15400.00, 16200.00, 62, 38, NULL, 'Yes', 'SNEAKERS 0120332', 'sneakers-0120332', 'Yes', 6, 1, '2024-11-01 12:44:28', '2024-11-07 01:20:59');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 23, '2024_10_30_06_12_54.jfif', NULL, '2024-10-30 13:12:58', '2024-10-30 13:12:58'),
(9, 23, '2024_10_31_12_30_59.jfif', NULL, '2024-10-31 07:30:59', '2024-10-31 07:30:59'),
(13, 25, '2024_10_31_06_28_05.jpg', NULL, '2024-10-31 13:28:06', '2024-10-31 13:28:06'),
(14, 26, '2024_10_31_06_34_58.jpg', NULL, '2024-10-31 13:35:03', '2024-10-31 13:35:03'),
(15, 27, '2024_11_01_05_24_36.jfif', NULL, '2024-11-01 12:24:59', '2024-11-01 12:24:59'),
(16, 28, '2024_11_01_05_25_47.jfif', NULL, '2024-11-01 12:26:09', '2024-11-01 12:26:09'),
(17, 29, '2024_11_01_05_27_44.jfif', NULL, '2024-11-01 12:28:05', '2024-11-01 12:28:05'),
(18, 30, '2024_11_01_05_30_26.jpg', NULL, '2024-11-01 12:30:45', '2024-11-01 12:30:45'),
(19, 31, '2024_11_01_05_32_03.jfif', NULL, '2024-11-01 12:32:25', '2024-11-01 12:32:25'),
(20, 32, '2024_11_01_05_33_08.jfif', NULL, '2024-11-01 12:33:24', '2024-11-01 12:33:24'),
(21, 33, '2024_11_01_05_35_38.jfif', NULL, '2024-11-01 12:35:56', '2024-11-01 12:35:56'),
(22, 34, '2024_11_01_05_37_15.png', NULL, '2024-11-01 12:37:32', '2024-11-01 12:37:32'),
(23, 35, '2024_11_01_05_40_50.jpg', NULL, '2024-11-01 12:41:11', '2024-11-01 12:41:11'),
(24, 36, '2024_11_01_05_42_47.jfif', NULL, '2024-11-01 12:43:08', '2024-11-01 12:43:08'),
(25, 37, '2024_11_01_05_44_10.jfif', NULL, '2024-11-01 12:44:28', '2024-11-01 12:44:28'),
(26, 26, '2024_11_06_06_13_02.jfif', NULL, '2024-11-06 13:13:04', '2024-11-06 13:13:04'),
(27, 26, '2024_11_06_06_15_24.png', NULL, '2024-11-06 13:15:24', '2024-11-06 13:15:24'),
(31, 37, '2024_11_07_06_50_15.jpg', NULL, '2024-11-07 01:50:17', '2024-11-07 01:50:17');

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `show_on_home_page` enum('Yes','No') NOT NULL DEFAULT 'No',
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `name`, `slug`, `status`, `show_on_home_page`, `category_id`, `created_at`, `updated_at`) VALUES
(31, 'Mobile', 'mobile', 1, 'Yes', 61, '2024-10-30 13:07:53', '2024-10-31 11:50:03'),
(32, 'Tablets', 'tablets', 1, 'Yes', 61, '2024-10-31 12:06:07', '2024-10-31 12:06:07'),
(33, 'Laptops', 'laptops', 1, 'Yes', 61, '2024-10-31 12:06:23', '2024-10-31 12:06:23'),
(34, 'Speakers', 'speakers', 1, 'Yes', 61, '2024-10-31 12:06:39', '2024-10-31 12:06:39'),
(35, 'Watches', 'watches', 1, 'Yes', 61, '2024-10-31 12:06:56', '2024-10-31 12:06:56'),
(36, 'Shirts', 'shirts', 1, 'Yes', 62, '2024-10-31 12:07:34', '2024-10-31 12:07:34'),
(37, 'Jeans', 'jeans', 1, 'No', 62, '2024-10-31 12:07:49', '2024-10-31 12:07:49'),
(38, 'Shoes', 'shoes', 1, 'Yes', 62, '2024-10-31 12:08:09', '2024-10-31 12:08:09'),
(39, 'Watches', 'men-watches', 1, 'Yes', 62, '2024-10-31 12:09:22', '2024-10-31 12:09:22'),
(40, 'Perfumes', 'perfumes', 1, 'Yes', 62, '2024-10-31 12:10:42', '2024-10-31 12:10:42'),
(41, 'T-Shirts', 't-shirts', 1, 'Yes', 63, '2024-10-31 12:11:07', '2024-10-31 12:11:07'),
(42, 'Tops', 'tops', 1, 'Yes', 63, '2024-10-31 12:11:23', '2024-10-31 12:11:23'),
(43, 'Jeans', 'women-jeans', 1, 'Yes', 63, '2024-10-31 12:11:41', '2024-10-31 12:11:41'),
(44, 'Shoes', 'women-shoes', 1, 'Yes', 63, '2024-10-31 12:11:59', '2024-10-31 12:11:59'),
(45, 'Watches', 'women-watches', 1, 'Yes', 63, '2024-10-31 12:12:16', '2024-10-31 12:12:16'),
(46, 'Perfumes', 'women-perfumes', 1, 'Yes', 63, '2024-10-31 12:12:36', '2024-10-31 12:12:36'),
(47, 'TV', 'tv', 1, 'Yes', 64, '2024-10-31 12:13:01', '2024-10-31 12:13:01'),
(48, 'Washing Machines', 'washing-machines', 1, 'Yes', 64, '2024-10-31 12:13:24', '2024-10-31 12:13:24'),
(49, 'Air Conditioners', 'air-conditioners', 1, 'Yes', 64, '2024-10-31 12:13:45', '2024-10-31 12:13:45'),
(50, 'Vacuum Cleaner', 'vacuum-cleaner', 1, 'Yes', 64, '2024-10-31 12:14:03', '2024-10-31 12:14:03'),
(51, 'Fans', 'fans', 1, 'Yes', 64, '2024-10-31 12:14:15', '2024-10-31 12:14:15'),
(52, 'Air Coolers', 'air-coolers', 1, 'Yes', 64, '2024-10-31 12:14:29', '2024-10-31 12:14:29'),
(53, 'Tube Lights', 'tube-lights', 1, 'Yes', 64, '2024-10-31 12:34:09', '2024-10-31 12:34:09');

-- --------------------------------------------------------

--
-- Table structure for table `temp_images`
--

CREATE TABLE `temp_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `temp_images`
--

INSERT INTO `temp_images` (`id`, `image_name`, `image_url`, `created_at`, `updated_at`) VALUES
(1, '2024_10_28_06_55_28.jpg', 'images/products/2024_10_28_06_55_28.jpg', '2024-10-28 13:55:28', '2024-10-28 13:55:28'),
(2, '2024_10_28_07_05_42.jpg', 'images/products/2024_10_28_07_05_42.jpg', '2024-10-28 14:05:42', '2024-10-28 14:05:42'),
(3, '2024_10_28_07_06_39.jpg', 'images/products/2024_10_28_07_06_39.jpg', '2024-10-28 14:06:39', '2024-10-28 14:06:39'),
(4, '2024_10_28_07_16_42.jfif', 'images/products/2024_10_28_07_16_42.jfif', '2024-10-28 14:16:42', '2024-10-28 14:16:42'),
(5, '2024_10_29_04_52_42.jpg', 'images/products/2024_10_29_04_52_42.jpg', '2024-10-29 11:52:42', '2024-10-29 11:52:42'),
(6, '2024_10_29_04_52_48.jfif', 'images/products/2024_10_29_04_52_48.jfif', '2024-10-29 11:52:48', '2024-10-29 11:52:48'),
(7, '2024_10_29_05_00_19.jpg', 'images/products/2024_10_29_05_00_19.jpg', '2024-10-29 12:00:19', '2024-10-29 12:00:19'),
(8, '2024_10_29_05_04_36.jpg', 'images/products/2024_10_29_05_04_36.jpg', '2024-10-29 12:04:36', '2024-10-29 12:04:36'),
(9, '2024_10_29_05_04_42.jpg', 'images/products/2024_10_29_05_04_42.jpg', '2024-10-29 12:04:42', '2024-10-29 12:04:42'),
(10, '2024_10_29_05_05_58.jpg', 'images/products/2024_10_29_05_05_58.jpg', '2024-10-29 12:05:59', '2024-10-29 12:05:59'),
(11, '2024_10_29_05_06_02.jpg', 'images/products/2024_10_29_05_06_02.jpg', '2024-10-29 12:06:02', '2024-10-29 12:06:02'),
(12, '2024_10_29_05_06_08.jfif', 'images/products/2024_10_29_05_06_08.jfif', '2024-10-29 12:06:08', '2024-10-29 12:06:08'),
(13, '2024_10_29_05_09_20.jpg', 'images/products/2024_10_29_05_09_20.jpg', '2024-10-29 12:09:20', '2024-10-29 12:09:20'),
(14, '2024_10_29_05_09_43.jpg', 'images/products/2024_10_29_05_09_43.jpg', '2024-10-29 12:09:43', '2024-10-29 12:09:43'),
(15, '2024_10_29_05_09_47.jfif', 'images/products/2024_10_29_05_09_47.jfif', '2024-10-29 12:09:47', '2024-10-29 12:09:47'),
(16, '2024_10_29_05_09_51.jpg', 'images/products/2024_10_29_05_09_51.jpg', '2024-10-29 12:09:51', '2024-10-29 12:09:51'),
(17, '2024_10_29_05_21_23.jpg', 'images/products/2024_10_29_05_21_23.jpg', '2024-10-29 12:21:23', '2024-10-29 12:21:23'),
(18, '2024_10_29_05_21_26.jpg', 'images/products/2024_10_29_05_21_26.jpg', '2024-10-29 12:21:26', '2024-10-29 12:21:26'),
(19, '2024_10_29_06_03_08.jfif', 'images/products/2024_10_29_06_03_08.jfif', '2024-10-29 13:03:09', '2024-10-29 13:03:09'),
(20, '2024_10_29_06_09_10.jfif', 'images/products/2024_10_29_06_09_10.jfif', '2024-10-29 13:09:10', '2024-10-29 13:09:10'),
(21, '2024_10_29_06_12_23.jpg', 'images/products/2024_10_29_06_12_23.jpg', '2024-10-29 13:12:23', '2024-10-29 13:12:23'),
(22, '2024_10_29_06_33_22.jpg', 'images/products/2024_10_29_06_33_22.jpg', '2024-10-29 13:33:22', '2024-10-29 13:33:22'),
(23, '2024_10_29_06_35_58.jpg', 'images/products/2024_10_29_06_35_58.jpg', '2024-10-29 13:35:58', '2024-10-29 13:35:58'),
(24, '2024_10_29_06_37_34.jfif', 'images/products/2024_10_29_06_37_34.jfif', '2024-10-29 13:37:34', '2024-10-29 13:37:34'),
(25, '2024_10_30_05_37_11.jfif', 'images/products/temp//2024_10_30_05_37_11.jfif', '2024-10-30 12:37:15', '2024-10-30 12:37:15'),
(26, '2024_10_30_05_37_21.jpg', 'images/products/temp//2024_10_30_05_37_21.jpg', '2024-10-30 12:37:21', '2024-10-30 12:37:21'),
(27, '2024_10_30_06_12_54.jfif', 'images/products/temp//2024_10_30_06_12_54.jfif', '2024-10-30 13:12:55', '2024-10-30 13:12:55'),
(28, '2024_10_31_10_40_14.jfif', 'images/products/temp//2024_10_31_10_40_14.jfif', '2024-10-31 05:40:17', '2024-10-31 05:40:17'),
(29, '2024_10_31_11_53_38.jfif', 'images/products/temp//2024_10_31_11_53_38.jfif', '2024-10-31 06:53:40', '2024-10-31 06:53:40'),
(30, '2024_10_31_11_54_44.jfif', 'images/products/temp//2024_10_31_11_54_44.jfif', '2024-10-31 06:54:44', '2024-10-31 06:54:44'),
(31, '2024_10_31_11_56_30.jfif', 'images/products/temp//2024_10_31_11_56_30.jfif', '2024-10-31 06:56:30', '2024-10-31 06:56:30'),
(32, '2024_10_31_12_03_47.jfif', 'images/products/temp//2024_10_31_12_03_47.jfif', '2024-10-31 07:03:47', '2024-10-31 07:03:47'),
(33, '2024_10_31_12_04_14.jfif', 'images/products/temp//2024_10_31_12_04_14.jfif', '2024-10-31 07:04:14', '2024-10-31 07:04:14'),
(34, '2024_10_31_12_06_13.jfif', 'images/products/temp//2024_10_31_12_06_13.jfif', '2024-10-31 07:06:13', '2024-10-31 07:06:13'),
(35, '2024_10_31_12_06_58.jfif', 'images/products/temp//2024_10_31_12_06_58.jfif', '2024-10-31 07:06:58', '2024-10-31 07:06:58'),
(36, '2024_10_31_12_07_35.jfif', 'images/products/temp//2024_10_31_12_07_35.jfif', '2024-10-31 07:07:35', '2024-10-31 07:07:35'),
(37, '2024_10_31_12_08_10.jfif', 'images/products/temp//2024_10_31_12_08_10.jfif', '2024-10-31 07:08:10', '2024-10-31 07:08:10'),
(38, '2024_10_31_12_08_39.jfif', 'images/products/temp//2024_10_31_12_08_39.jfif', '2024-10-31 07:08:39', '2024-10-31 07:08:39'),
(39, '2024_10_31_12_11_28.jfif', 'images/products/temp//2024_10_31_12_11_28.jfif', '2024-10-31 07:11:28', '2024-10-31 07:11:28'),
(40, '2024_10_31_12_21_51.jfif', 'images/products/temp//2024_10_31_12_21_51.jfif', '2024-10-31 07:21:51', '2024-10-31 07:21:51'),
(41, '2024_10_31_12_22_32.jfif', 'images/products/temp//2024_10_31_12_22_32.jfif', '2024-10-31 07:22:32', '2024-10-31 07:22:32'),
(42, '2024_10_31_12_24_04.jfif', 'images/products/temp//2024_10_31_12_24_04.jfif', '2024-10-31 07:24:04', '2024-10-31 07:24:04'),
(43, '2024_10_31_12_30_59.jfif', 'images/products/temp//2024_10_31_12_30_59.jfif', '2024-10-31 07:30:59', '2024-10-31 07:30:59'),
(44, '2024_10_31_01_44_26.jfif', 'images/products/temp//2024_10_31_01_44_26.jfif', '2024-10-31 08:44:26', '2024-10-31 08:44:26'),
(45, '2024_10_31_04_21_19.jpg', 'images/products/temp//2024_10_31_04_21_19.jpg', '2024-10-31 11:21:19', '2024-10-31 11:21:19'),
(46, '2024_10_31_04_21_33.jfif', 'images/products/temp//2024_10_31_04_21_33.jfif', '2024-10-31 11:21:33', '2024-10-31 11:21:33'),
(47, '2024_10_31_06_28_05.jpg', 'images/products/temp//2024_10_31_06_28_05.jpg', '2024-10-31 13:28:05', '2024-10-31 13:28:05'),
(48, '2024_10_31_06_34_58.jpg', 'images/products/temp//2024_10_31_06_34_58.jpg', '2024-10-31 13:34:58', '2024-10-31 13:34:58'),
(49, '2024_11_01_05_24_36.jfif', 'images/products/temp//2024_11_01_05_24_36.jfif', '2024-11-01 12:24:38', '2024-11-01 12:24:38'),
(50, '2024_11_01_05_25_47.jfif', 'images/products/temp//2024_11_01_05_25_47.jfif', '2024-11-01 12:25:47', '2024-11-01 12:25:47'),
(51, '2024_11_01_05_27_44.jfif', 'images/products/temp//2024_11_01_05_27_44.jfif', '2024-11-01 12:27:44', '2024-11-01 12:27:44'),
(52, '2024_11_01_05_30_26.jpg', 'images/products/temp//2024_11_01_05_30_26.jpg', '2024-11-01 12:30:26', '2024-11-01 12:30:26'),
(53, '2024_11_01_05_32_03.jfif', 'images/products/temp//2024_11_01_05_32_03.jfif', '2024-11-01 12:32:03', '2024-11-01 12:32:03'),
(54, '2024_11_01_05_33_08.jfif', 'images/products/temp//2024_11_01_05_33_08.jfif', '2024-11-01 12:33:08', '2024-11-01 12:33:08'),
(55, '2024_11_01_05_35_38.jfif', 'images/products/temp//2024_11_01_05_35_38.jfif', '2024-11-01 12:35:38', '2024-11-01 12:35:38'),
(56, '2024_11_01_05_37_15.png', 'images/products/temp//2024_11_01_05_37_15.png', '2024-11-01 12:37:15', '2024-11-01 12:37:15'),
(57, '2024_11_01_05_40_50.jpg', 'images/products/temp//2024_11_01_05_40_50.jpg', '2024-11-01 12:40:50', '2024-11-01 12:40:50'),
(58, '2024_11_01_05_42_47.jfif', 'images/products/temp//2024_11_01_05_42_47.jfif', '2024-11-01 12:42:47', '2024-11-01 12:42:47'),
(59, '2024_11_01_05_44_10.jfif', 'images/products/temp//2024_11_01_05_44_10.jfif', '2024-11-01 12:44:10', '2024-11-01 12:44:10'),
(60, '2024_11_06_06_13_02.jfif', 'images/products/temp//2024_11_06_06_13_02.jfif', '2024-11-06 13:13:04', '2024-11-06 13:13:04'),
(61, '2024_11_06_06_15_24.png', 'images/products/temp//2024_11_06_06_15_24.png', '2024-11-06 13:15:24', '2024-11-06 13:15:24'),
(62, '2024_11_07_06_20_56.jpg', 'images/products/temp//2024_11_07_06_20_56.jpg', '2024-11-07 01:20:56', '2024-11-07 01:20:56'),
(63, '2024_11_07_06_25_34.jpg', 'images/products/temp//2024_11_07_06_25_34.jpg', '2024-11-07 01:25:34', '2024-11-07 01:25:34'),
(64, '2024_11_07_06_44_33.jpg', 'images/products/temp//2024_11_07_06_44_33.jpg', '2024-11-07 01:44:33', '2024-11-07 01:44:33'),
(65, '2024_11_07_06_50_15.jpg', 'images/products/temp//2024_11_07_06_50_15.jpg', '2024-11-07 01:50:17', '2024-11-07 01:50:17');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `role` int(11) NOT NULL DEFAULT 1,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `role`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', NULL, 2, NULL, '$2y$10$BshGzg4Bf4vg2GhC.kiX/OJnLwrJTUiRsuK78dWU7M6NmTjZBX1R6', NULL, '2024-10-16 12:50:26', '2024-10-16 12:50:26'),
(2, 'Tayyab', 'tayyab@gmail.com', NULL, 1, NULL, '$2y$10$IEizFTvUP61s1uHpOkkauuMui4K8s7NK2Psq/aK4XRoWUvJEFjLpe', NULL, '2024-10-16 12:52:04', '2024-10-16 12:52:04'),
(7, 'Tayyab', 'tayyab1@gmail.com', NULL, 1, NULL, '$2y$10$akt/1KFFB7bfqxPGJvuHHevtiwbp0PghU8muJIDZ0lsgu8to/AWwm', NULL, '2024-11-08 20:08:48', '2024-11-08 20:08:48');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_address`
--
ALTER TABLE `customer_address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_address_user_id_foreign` (`user_id`),
  ADD KEY `customer_address_country_id_foreign` (`country_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_country_id_foreign` (`country_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_sub_category_id_foreign` (`sub_category_id`),
  ADD KEY `products_brand_id_foreign` (`brand_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_product_id_foreign` (`product_id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_categories_category_id_foreign` (`category_id`);

--
-- Indexes for table `temp_images`
--
ALTER TABLE `temp_images`
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
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=243;

--
-- AUTO_INCREMENT for table `customer_address`
--
ALTER TABLE `customer_address`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `temp_images`
--
ALTER TABLE `temp_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer_address`
--
ALTER TABLE `customer_address`
  ADD CONSTRAINT `customer_address_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `customer_address_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_sub_category_id_foreign` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD CONSTRAINT `sub_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
