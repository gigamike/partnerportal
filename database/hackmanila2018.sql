-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 17, 2018 at 09:29 PM
-- Server version: 5.6.38
-- PHP Version: 7.0.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hackmanila2018`
--

-- --------------------------------------------------------

--
-- Table structure for table `blog`
--

CREATE TABLE `blog` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `post` longtext NOT NULL,
  `created_datetime` datetime NOT NULL,
  `created_user_id` bigint(10) UNSIGNED NOT NULL,
  `modified_datetime` datetime DEFAULT NULL,
  `modified_user_id` bigint(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `brand` varchar(255) NOT NULL,
  `description` longtext,
  `logo_name` varchar(255) DEFAULT NULL,
  `created_datetime` datetime NOT NULL,
  `created_user_id` bigint(10) UNSIGNED NOT NULL,
  `modified_datetime` datetime DEFAULT NULL,
  `modified_user_id` bigint(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`id`, `brand`, `description`, `logo_name`, `created_datetime`, `created_user_id`, `modified_datetime`, `modified_user_id`) VALUES
(1, 'Apple', 'Discover the innovative world of Apple and shop everything iPhone, iPad, Apple Watch, Mac, and Apple TV, plus explore accessories, entertainment, and expert device support.', 'logo.jpg', '2018-10-17 12:11:19', 9, '2018-10-19 09:25:24', 9),
(2, 'Samsung', 'Samsung helps you discover a wide range of home electronics with cutting-edge technology including smartphones, tablets, TVs, home appliances and more.', 'logo.jpg', '2018-10-17 12:11:26', 9, '2018-10-19 09:26:17', 9),
(9, 'DJI', NULL, 'logo.jpg', '0000-00-00 00:00:00', 0, NULL, NULL),
(10, 'Tide', NULL, 'logo.jpg', '0000-00-00 00:00:00', 0, NULL, NULL),
(11, 'Ariel', NULL, 'logo.jpg', '0000-00-00 00:00:00', 0, NULL, NULL),
(12, 'Safeguard', NULL, 'logo.jpg', '0000-00-00 00:00:00', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL,
  `created_datetime` datetime NOT NULL,
  `created_user_id` bigint(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category` varchar(255) NOT NULL,
  `photo_name` varchar(255) DEFAULT NULL,
  `created_datetime` datetime NOT NULL,
  `created_user_id` bigint(10) UNSIGNED NOT NULL,
  `modified_datetime` datetime DEFAULT NULL,
  `modified_user_id` bigint(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `category`, `photo_name`, `created_datetime`, `created_user_id`, `modified_datetime`, `modified_user_id`) VALUES
(4, 'Tablet', 'photo.jpg', '2018-10-17 11:37:31', 9, NULL, NULL),
(5, 'Mobile Phone', 'photo.jpg', '2018-10-17 11:37:44', 9, '2018-10-17 11:40:57', 9),
(6, 'Laptop', 'photo.jpg', '2018-10-17 11:41:05', 9, NULL, NULL),
(7, 'Watch', 'photo.jpg', '2018-10-17 11:41:36', 9, NULL, NULL),
(8, 'Cars', 'photo.jpg', '2018-10-17 11:41:36', 9, NULL, NULL),
(9, 'Appliances', 'photo.jpg', '2018-10-17 11:41:36', 9, NULL, NULL),
(11, 'Drone', 'photo.jpg', '2018-10-17 11:41:36', 9, NULL, NULL),
(12, 'Household', 'photo.jpg', '2018-10-17 11:41:36', 9, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `id` int(10) UNSIGNED NOT NULL,
  `country_code` char(2) NOT NULL,
  `country_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `country_code`, `country_name`) VALUES
(1, 'A1', 'Anonymous Proxy'),
(2, 'A2', 'Satellite Provider'),
(3, 'O1', 'Other Country'),
(4, 'AD', 'Andorra'),
(5, 'AE', 'United Arab Emirates'),
(6, 'AF', 'Afghanistan'),
(7, 'AG', 'Antigua and Barbuda'),
(8, 'AI', 'Anguilla'),
(9, 'AL', 'Albania'),
(10, 'AM', 'Armenia'),
(11, 'AO', 'Angola'),
(12, 'AP', 'Asia/Pacific Region'),
(13, 'AQ', 'Antarctica'),
(14, 'AR', 'Argentina'),
(15, 'AS', 'American Samoa'),
(16, 'AT', 'Austria'),
(17, 'AU', 'Australia'),
(18, 'AW', 'Aruba'),
(19, 'AX', 'Aland Islands'),
(20, 'AZ', 'Azerbaijan'),
(21, 'BA', 'Bosnia and Herzegovina'),
(22, 'BB', 'Barbados'),
(23, 'BD', 'Bangladesh'),
(24, 'BE', 'Belgium'),
(25, 'BF', 'Burkina Faso'),
(26, 'BG', 'Bulgaria'),
(27, 'BH', 'Bahrain'),
(28, 'BI', 'Burundi'),
(29, 'BJ', 'Benin'),
(30, 'BL', 'Saint Bartelemey'),
(31, 'BM', 'Bermuda'),
(32, 'BN', 'Brunei Darussalam'),
(33, 'BO', 'Bolivia'),
(34, 'BQ', 'Bonaire, Saint Eustatius and Saba'),
(35, 'BR', 'Brazil'),
(36, 'BS', 'Bahamas'),
(37, 'BT', 'Bhutan'),
(38, 'BV', 'Bouvet Island'),
(39, 'BW', 'Botswana'),
(40, 'BY', 'Belarus'),
(41, 'BZ', 'Belize'),
(42, 'CA', 'Canada'),
(43, 'CC', 'Cocos (Keeling) Islands'),
(44, 'CD', 'Congo, The Democratic Republic of the'),
(45, 'CF', 'Central African Republic'),
(46, 'CG', 'Congo'),
(47, 'CH', 'Switzerland'),
(48, 'CI', 'Cote d\'Ivoire'),
(49, 'CK', 'Cook Islands'),
(50, 'CL', 'Chile'),
(51, 'CM', 'Cameroon'),
(52, 'CN', 'China'),
(53, 'CO', 'Colombia'),
(54, 'CR', 'Costa Rica'),
(55, 'CU', 'Cuba'),
(56, 'CV', 'Cape Verde'),
(57, 'CW', 'Curacao'),
(58, 'CX', 'Christmas Island'),
(59, 'CY', 'Cyprus'),
(60, 'CZ', 'Czech Republic'),
(61, 'DE', 'Germany'),
(62, 'DJ', 'Djibouti'),
(63, 'DK', 'Denmark'),
(64, 'DM', 'Dominica'),
(65, 'DO', 'Dominican Republic'),
(66, 'DZ', 'Algeria'),
(67, 'EC', 'Ecuador'),
(68, 'EE', 'Estonia'),
(69, 'EG', 'Egypt'),
(70, 'EH', 'Western Sahara'),
(71, 'ER', 'Eritrea'),
(72, 'ES', 'Spain'),
(73, 'ET', 'Ethiopia'),
(74, 'EU', 'Europe'),
(75, 'FI', 'Finland'),
(76, 'FJ', 'Fiji'),
(77, 'FK', 'Falkland Islands (Malvinas)'),
(78, 'FM', 'Micronesia, Federated States of'),
(79, 'FO', 'Faroe Islands'),
(80, 'FR', 'France'),
(81, 'GA', 'Gabon'),
(82, 'GB', 'United Kingdom'),
(83, 'GD', 'Grenada'),
(84, 'GE', 'Georgia'),
(85, 'GF', 'French Guiana'),
(86, 'GG', 'Guernsey'),
(87, 'GH', 'Ghana'),
(88, 'GI', 'Gibraltar'),
(89, 'GL', 'Greenland'),
(90, 'GM', 'Gambia'),
(91, 'GN', 'Guinea'),
(92, 'GP', 'Guadeloupe'),
(93, 'GQ', 'Equatorial Guinea'),
(94, 'GR', 'Greece'),
(95, 'GS', 'South Georgia and the South Sandwich Islands'),
(96, 'GT', 'Guatemala'),
(97, 'GU', 'Guam'),
(98, 'GW', 'Guinea-Bissau'),
(99, 'GY', 'Guyana'),
(100, 'HK', 'Hong Kong'),
(101, 'HM', 'Heard Island and McDonald Islands'),
(102, 'HN', 'Honduras'),
(103, 'HR', 'Croatia'),
(104, 'HT', 'Haiti'),
(105, 'HU', 'Hungary'),
(106, 'ID', 'Indonesia'),
(107, 'IE', 'Ireland'),
(108, 'IL', 'Israel'),
(109, 'IM', 'Isle of Man'),
(110, 'IN', 'India'),
(111, 'IO', 'British Indian Ocean Territory'),
(112, 'IQ', 'Iraq'),
(113, 'IR', 'Iran, Islamic Republic of'),
(114, 'IS', 'Iceland'),
(115, 'IT', 'Italy'),
(116, 'JE', 'Jersey'),
(117, 'JM', 'Jamaica'),
(118, 'JO', 'Jordan'),
(119, 'JP', 'Japan'),
(120, 'KE', 'Kenya'),
(121, 'KG', 'Kyrgyzstan'),
(122, 'KH', 'Cambodia'),
(123, 'KI', 'Kiribati'),
(124, 'KM', 'Comoros'),
(125, 'KN', 'Saint Kitts and Nevis'),
(126, 'KP', 'Korea, Democratic People\'s Republic of'),
(127, 'KR', 'Korea, Republic of'),
(128, 'KW', 'Kuwait'),
(129, 'KY', 'Cayman Islands'),
(130, 'KZ', 'Kazakhstan'),
(131, 'LA', 'Lao People\'s Democratic Republic'),
(132, 'LB', 'Lebanon'),
(133, 'LC', 'Saint Lucia'),
(134, 'LI', 'Liechtenstein'),
(135, 'LK', 'Sri Lanka'),
(136, 'LR', 'Liberia'),
(137, 'LS', 'Lesotho'),
(138, 'LT', 'Lithuania'),
(139, 'LU', 'Luxembourg'),
(140, 'LV', 'Latvia'),
(141, 'LY', 'Libyan Arab Jamahiriya'),
(142, 'MA', 'Morocco'),
(143, 'MC', 'Monaco'),
(144, 'MD', 'Moldova, Republic of'),
(145, 'ME', 'Montenegro'),
(146, 'MF', 'Saint Martin'),
(147, 'MG', 'Madagascar'),
(148, 'MH', 'Marshall Islands'),
(149, 'MK', 'Macedonia'),
(150, 'ML', 'Mali'),
(151, 'MM', 'Myanmar'),
(152, 'MN', 'Mongolia'),
(153, 'MO', 'Macao'),
(154, 'MP', 'Northern Mariana Islands'),
(155, 'MQ', 'Martinique'),
(156, 'MR', 'Mauritania'),
(157, 'MS', 'Montserrat'),
(158, 'MT', 'Malta'),
(159, 'MU', 'Mauritius'),
(160, 'MV', 'Maldives'),
(161, 'MW', 'Malawi'),
(162, 'MX', 'Mexico'),
(163, 'MY', 'Malaysia'),
(164, 'MZ', 'Mozambique'),
(165, 'NA', 'Namibia'),
(166, 'NC', 'New Caledonia'),
(167, 'NE', 'Niger'),
(168, 'NF', 'Norfolk Island'),
(169, 'NG', 'Nigeria'),
(170, 'NI', 'Nicaragua'),
(171, 'NL', 'Netherlands'),
(172, 'NO', 'Norway'),
(173, 'NP', 'Nepal'),
(174, 'NR', 'Nauru'),
(175, 'NU', 'Niue'),
(176, 'NZ', 'New Zealand'),
(177, 'OM', 'Oman'),
(178, 'PA', 'Panama'),
(179, 'PE', 'Peru'),
(180, 'PF', 'French Polynesia'),
(181, 'PG', 'Papua New Guinea'),
(182, 'PH', 'Philippines'),
(183, 'PK', 'Pakistan'),
(184, 'PL', 'Poland'),
(185, 'PM', 'Saint Pierre and Miquelon'),
(186, 'PN', 'Pitcairn'),
(187, 'PR', 'Puerto Rico'),
(188, 'PS', 'Palestinian Territory'),
(189, 'PT', 'Portugal'),
(190, 'PW', 'Palau'),
(191, 'PY', 'Paraguay'),
(192, 'QA', 'Qatar'),
(193, 'RE', 'Reunion'),
(194, 'RO', 'Romania'),
(195, 'RS', 'Serbia'),
(196, 'RU', 'Russian Federation'),
(197, 'RW', 'Rwanda'),
(198, 'SA', 'Saudi Arabia'),
(199, 'SB', 'Solomon Islands'),
(200, 'SC', 'Seychelles'),
(201, 'SD', 'Sudan'),
(202, 'SE', 'Sweden'),
(203, 'SG', 'Singapore'),
(204, 'SH', 'Saint Helena'),
(205, 'SI', 'Slovenia'),
(206, 'SJ', 'Svalbard and Jan Mayen'),
(207, 'SK', 'Slovakia'),
(208, 'SL', 'Sierra Leone'),
(209, 'SM', 'San Marino'),
(210, 'SN', 'Senegal'),
(211, 'SO', 'Somalia'),
(212, 'SR', 'Suriname'),
(213, 'SS', 'South Sudan'),
(214, 'ST', 'Sao Tome and Principe'),
(215, 'SV', 'El Salvador'),
(216, 'SX', 'Sint Maarten'),
(217, 'SY', 'Syrian Arab Republic'),
(218, 'SZ', 'Swaziland'),
(219, 'TC', 'Turks and Caicos Islands'),
(220, 'TD', 'Chad'),
(221, 'TF', 'French Southern Territories'),
(222, 'TG', 'Togo'),
(223, 'TH', 'Thailand'),
(224, 'TJ', 'Tajikistan'),
(225, 'TK', 'Tokelau'),
(226, 'TL', 'Timor-Leste'),
(227, 'TM', 'Turkmenistan'),
(228, 'TN', 'Tunisia'),
(229, 'TO', 'Tonga'),
(230, 'TR', 'Turkey'),
(231, 'TT', 'Trinidad and Tobago'),
(232, 'TV', 'Tuvalu'),
(233, 'TW', 'Taiwan'),
(234, 'TZ', 'Tanzania, United Republic of'),
(235, 'UA', 'Ukraine'),
(236, 'UG', 'Uganda'),
(237, 'UM', 'United States Minor Outlying Islands'),
(238, 'US', 'United States'),
(239, 'UY', 'Uruguay'),
(240, 'UZ', 'Uzbekistan'),
(241, 'VA', 'Holy See (Vatican City State)'),
(242, 'VC', 'Saint Vincent and the Grenadines'),
(243, 'VE', 'Venezuela'),
(244, 'VG', 'Virgin Islands, British'),
(245, 'VI', 'Virgin Islands, U.S.'),
(246, 'VN', 'Vietnam'),
(247, 'VU', 'Vanuatu'),
(248, 'WF', 'Wallis and Futuna'),
(249, 'WS', 'Samoa'),
(250, 'YE', 'Yemen'),
(251, 'YT', 'Mayotte'),
(252, 'ZA', 'South Africa'),
(253, 'ZM', 'Zambia'),
(254, 'ZW', 'Zimbabwe');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext,
  `photo_name1` varchar(255) DEFAULT NULL,
  `photo_name2` varchar(255) DEFAULT NULL,
  `photo_name3` varchar(255) DEFAULT NULL,
  `panorama` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int(10) UNSIGNED NOT NULL,
  `discount_type` enum('amount','percentage') DEFAULT NULL,
  `discount` decimal(10,2) DEFAULT NULL,
  `created_datetime` datetime NOT NULL,
  `created_user_id` bigint(10) UNSIGNED NOT NULL,
  `modified_datetime` datetime DEFAULT NULL,
  `modified_user_id` bigint(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `brand_id`, `name`, `description`, `photo_name1`, `photo_name2`, `photo_name3`, `panorama`, `price`, `stock`, `discount_type`, `discount`, `created_datetime`, `created_user_id`, `modified_datetime`, `modified_user_id`) VALUES
(15, 1, 'iPad Mini', 'The iPad Mini family (branded and marketed as iPad mini) is a line of mini tablet computers designed, developed, and marketed by Apple Inc. It is a sub-series of the iPad line of tablets, with a reduced screen size of 7.9 inches, in contrast to the standard 9.7 inches.', 'ipad-mini1.jpg', 'ipad-mini2.jpg', 'ipad-mini3.jpg', NULL, '24000.00', 1, 'amount', '5.00', '2018-11-15 13:41:15', 11, NULL, NULL),
(16, 1, 'iPad Pro', 'The iPad Pro family is a line of iPad tablet computers designed, developed, and marketed by Apple Inc., that runs the iOS mobile operating system. It is currently available in two screen sizes, 10.5-inch (27 cm) and 12.9-inch (33 cm),[9] each with three options for internal storage capacities: 64, 256, or 512 GB.', 'ipad-pro1.jpg', 'ipad-pro2.jpg', 'ipad-pro3.jpg', NULL, '50000.00', 5, 'percentage', '3.00', '2018-11-16 07:02:16', 11, NULL, NULL),
(17, 1, 'iPad Watch Series 3', 'Apple Watch is the ultimate device for a healthy life. Choose from models including the all-new Apple Watch Series 4 and and Series 3.', 'ipad-watch-series31.jpg', 'ipad-watch-series32.jpg', 'ipad-watch-series33.jpg', NULL, '48000.00', 5, 'amount', '5.00', '2018-11-16 07:28:15', 11, NULL, NULL),
(18, 1, 'iPad Watch Series 4', 'Apple Watch is the ultimate device for a healthy life. Choose from models including the all-new Apple Watch Series 4 and and Series 3.', 'ipad-watch-series41.jpg', 'ipad-watch-series42.jpg', 'ipad-watch-series43.jpg', NULL, '48000.00', 1, 'percentage', '2.00', '2018-11-16 07:37:50', 11, NULL, NULL),
(19, 1, 'iPhone XR', 'iPhone XR has an all-screen design. The new Liquid Retina — the most advanced LCD in the industry. TrueDepth camera. Face ID. And the A12 Bionic chip.', 'iphone-xr1.jpg', 'iphone-xr2.jpg', 'iphone-xr3.jpg', NULL, '48000.00', 5, '', '0.00', '2018-11-16 07:46:21', 11, NULL, NULL),
(20, 1, 'iPhone XS', 'iPhone XR has an all-screen design. The new Liquid Retina — the most advanced LCD in the industry. TrueDepth camera. Face ID. And the A12 Bionic chip.', 'iphone-xs1.jpg', 'iphone-xs2.jpg', 'iphone-xs3.jpg', NULL, '48000.00', 10, '', '0.00', '2018-11-16 07:54:11', 11, NULL, NULL),
(21, 1, 'Macbook', 'The incredibly thin and light MacBook features new seventh-generation processors, faster SSD storage, and up to 10 hours of battery life.', 'macbook-1.jpg', 'macbook-2.jpg', 'macbook-3.jpg', NULL, '100000.00', 5, '', '0.00', '2018-11-16 08:00:24', 11, NULL, NULL),
(22, 1, 'Macbook Air', 'The new thinner and lighter MacBook Air features a Retina display, Touch ID, and the latest-generation butterfly keyboard with Force Touch trackpad.', 'macbook-air1.jpg', 'macbook-air2.jpg', 'macbook-air3.jpg', NULL, '50000.00', 5, 'amount', '5.00', '2018-11-16 08:07:22', 11, NULL, NULL),
(23, 1, 'Macbook Pro', 'With top-of-the-line Intel processors, HD graphics, and ultrafast Thunderbolt ports, MacBook Pro does more than ever. Faster than ever.', 'macbook-pro1.jpg', 'macbook-pro2.jpg', 'macbook-pro3.jpg', NULL, '120000.00', 12, '', '0.00', '2018-11-16 08:12:38', 11, NULL, NULL),
(25, 9, 'DJI Phantom 4', 'Equipped with a 1-inch sensor, the Phantom 4 Pro camera shoots 4K 60fps video and 20MP stills. It has a max flight time of 30 minutes, and a max transmission range of 4.1 mi (7 km). The Phantom 4 Pro V2.0 has been redesigned with a new controller, ESCs, propellers, and OcuSync transmission technology. Learn more at DJI.com.', 'dji-phantom-41.jpg', 'dji-phantom-42.jpg', 'dji-phantom-43.jpg', 'panorama.jpg', '30000.00', 10, 'amount', '5.00', '2018-11-16 09:53:59', 11, NULL, NULL),
(26, 10, 'Tide Liquid Detergent', 'If you’re looking for an effective liquid laundry detergent, then Tide has got you covered. Whether you need stain removal, want to whiten your loads or want a liquid detergent with the scent of Febreze, take a look through our Tide liquid detergents to find the right one for you. See our product information and reviews to know more.', 'tide1.jpg', 'tide2.jpg', 'tide3.jpg', NULL, '300.00', 20, 'percentage', '1.00', '2018-11-16 16:45:55', 11, NULL, NULL),
(27, 11, 'Ariel Liquid Detergent', 'Ariel laundry detergent delivers a noticeable cleanness that will help your business provide outstanding results and get great reviews. Try it now!', 'ariel1.jpg', 'ariel2.jpg', 'ariel3.jpg', NULL, '300.00', 30, '', '0.00', '2018-11-16 16:52:05', 11, NULL, NULL),
(28, 12, 'Safeguard Soap', 'Safeguard Soap, a reliable and respected Proctor & Gamble product, is an antibacterial and deodorant soap that is recommended for normal skin types. ... Safeguard Bar Soap is effective for preventing body odor and fighting bacteria and germs.', 'safeguard1.jpg', 'safeguard2.jpg', 'safeguard3.jpg', NULL, '250.00', 50, 'amount', '2.00', '2018-11-16 16:59:47', 11, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_category`
--

CREATE TABLE `product_category` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_category`
--

INSERT INTO `product_category` (`id`, `product_id`, `category_id`) VALUES
(13, 14, 9),
(14, 15, 4),
(24, 16, 4),
(16, 17, 7),
(17, 18, 7),
(25, 19, 5),
(19, 20, 5),
(20, 21, 6),
(21, 22, 6),
(22, 23, 6),
(26, 25, 11),
(27, 26, 12),
(28, 27, 12),
(29, 28, 12);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `modified_datetime` datetime DEFAULT NULL,
  `modified_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role` enum('admin','supplier','member') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `salt` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` enum('N','Y') NOT NULL,
  `mobile_no` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `country_id` int(10) UNSIGNED NOT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `credits` decimal(10,2) DEFAULT NULL,
  `created_datetime` datetime NOT NULL,
  `created_user_id` bigint(10) UNSIGNED NOT NULL,
  `modified_datetime` datetime DEFAULT NULL,
  `modified_user_id` bigint(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `role`, `email`, `password`, `first_name`, `last_name`, `salt`, `active`, `mobile_no`, `telephone`, `country_id`, `company_name`, `latitude`, `longitude`, `address`, `city`, `zip`, `credits`, `created_datetime`, `created_user_id`, `modified_datetime`, `modified_user_id`) VALUES
(1, 'admin', 'admin@gigamike.net', 'e698b4a0b08532cdff8443a4dd615588', 'Mik', 'Galon', 'kJ(26<$y>u01=1Su6V[t,GuDxMS=TCcAmkR%(V}FL/Wh?+_T`;', 'Y', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014-12-30 11:40:44', 1, '2018-09-29 13:34:08', 0),
(10, 'member', 'member@gigamike.net', 'f4198c36bc89c8809a82f7b53c3bb8cb', 'Michael', 'Galon', '\\TF7K~7z?F3G2F1>\'MkRn)mY+W4=YoK6DpLoobj/*}V<DfYK4E', 'Y', '639086087306', NULL, 182, NULL, NULL, NULL, '290 Joseph St., Annex 41, Sun Valley', 'Pasay', '1700', '947110.00', '2018-10-17 08:08:10', 0, NULL, NULL),
(11, 'supplier', 'supplier@gigamike.net', '3dc63898f07898c047cf21ab021eb0e1', 'Michael', 'Galon', 'T-PeBza@]pLB&N3\\!R54~sZc`JhAzuPP#\"6E{wdYh2{m_/K```', 'Y', '639086087306', '635523474', 182, 'Gigamike.net', NULL, NULL, NULL, NULL, NULL, NULL, '2018-11-15 11:24:28', 0, NULL, NULL),
(12, 'supplier', 'supplier2@gigamike.net', 'f6ec215220e45250eade3d32990a3e21', 'Michael', 'Galon', 'i6pq~GKDA\'J<!<JrX_2qw+.\'-v4b]|\"H3r:3:eVZk\"uk=A_t\"p', 'Y', '3312312312', '1212313213', 182, 'Gigamike.net', NULL, NULL, '290 Joseph St., Annex 41', 'Pasay', '1234', NULL, '2018-11-16 07:19:45', 0, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `title` (`title`);

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brand` (`brand`),
  ADD KEY `created_user_id` (`created_user_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `created_user_id` (`created_user_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category` (`category`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_code` (`country_code`),
  ADD KEY `country_name` (`country_name`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_user_id` (`created_user_id`),
  ADD KEY `brand_id` (`brand_id`),
  ADD KEY `price` (`price`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_id_2` (`product_id`,`category_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email` (`email`),
  ADD KEY `role` (`role`),
  ADD KEY `country_id` (`country_id`),
  ADD KEY `latitude` (`latitude`),
  ADD KEY `longitude` (`longitude`),
  ADD KEY `city` (`city`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blog`
--
ALTER TABLE `blog`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=255;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `product_category`
--
ALTER TABLE `product_category`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
