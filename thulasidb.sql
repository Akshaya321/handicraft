-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 31, 2021 at 09:01 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `thulasidb`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add agency', 7, 'add_agency'),
(26, 'Can change agency', 7, 'change_agency'),
(27, 'Can delete agency', 7, 'delete_agency'),
(28, 'Can view agency', 7, 'view_agency'),
(29, 'Can add category', 8, 'add_category'),
(30, 'Can change category', 8, 'change_category'),
(31, 'Can delete category', 8, 'delete_category'),
(32, 'Can view category', 8, 'view_category'),
(33, 'Can add customer reg', 9, 'add_customerreg'),
(34, 'Can change customer reg', 9, 'change_customerreg'),
(35, 'Can delete customer reg', 9, 'delete_customerreg'),
(36, 'Can view customer reg', 9, 'view_customerreg'),
(37, 'Can add district', 10, 'add_district'),
(38, 'Can change district', 10, 'change_district'),
(39, 'Can delete district', 10, 'delete_district'),
(40, 'Can view district', 10, 'view_district'),
(41, 'Can add handicrafter reg', 11, 'add_handicrafterreg'),
(42, 'Can change handicrafter reg', 11, 'change_handicrafterreg'),
(43, 'Can delete handicrafter reg', 11, 'delete_handicrafterreg'),
(44, 'Can view handicrafter reg', 11, 'view_handicrafterreg'),
(45, 'Can add location', 12, 'add_location'),
(46, 'Can change location', 12, 'change_location'),
(47, 'Can delete location', 12, 'delete_location'),
(48, 'Can view location', 12, 'view_location'),
(49, 'Can add login', 13, 'add_login'),
(50, 'Can change login', 13, 'change_login'),
(51, 'Can delete login', 13, 'delete_login'),
(52, 'Can view login', 13, 'view_login'),
(53, 'Can add product', 14, 'add_product'),
(54, 'Can change product', 14, 'change_product'),
(55, 'Can delete product', 14, 'delete_product'),
(56, 'Can view product', 14, 'view_product'),
(57, 'Can add cart', 15, 'add_cart'),
(58, 'Can change cart', 15, 'change_cart'),
(59, 'Can delete cart', 15, 'delete_cart'),
(60, 'Can view cart', 15, 'view_cart'),
(61, 'Can add bank', 16, 'add_bank'),
(62, 'Can change bank', 16, 'change_bank'),
(63, 'Can delete bank', 16, 'delete_bank'),
(64, 'Can view bank', 16, 'view_bank');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'handi', 'agency'),
(16, 'handi', 'bank'),
(15, 'handi', 'cart'),
(8, 'handi', 'category'),
(9, 'handi', 'customerreg'),
(10, 'handi', 'district'),
(11, 'handi', 'handicrafterreg'),
(12, 'handi', 'location'),
(13, 'handi', 'login'),
(14, 'handi', 'product'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-02-20 09:53:16.694394'),
(2, 'auth', '0001_initial', '2021-02-20 09:53:19.852182'),
(3, 'admin', '0001_initial', '2021-02-20 09:53:30.912977'),
(4, 'admin', '0002_logentry_remove_auto_add', '2021-02-20 09:53:32.819108'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2021-02-20 09:53:32.850357'),
(6, 'contenttypes', '0002_remove_content_type_name', '2021-02-20 09:53:33.475333'),
(7, 'auth', '0002_alter_permission_name_max_length', '2021-02-20 09:53:34.302146'),
(8, 'auth', '0003_alter_user_email_max_length', '2021-02-20 09:53:34.521212'),
(9, 'auth', '0004_alter_user_username_opts', '2021-02-20 09:53:34.572955'),
(10, 'auth', '0005_alter_user_last_login_null', '2021-02-20 09:53:35.276009'),
(11, 'auth', '0006_require_contenttypes_0002', '2021-02-20 09:53:35.338294'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2021-02-20 09:53:35.517717'),
(13, 'auth', '0008_alter_user_username_max_length', '2021-02-20 09:53:36.072507'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2021-02-20 09:53:36.260020'),
(15, 'auth', '0010_alter_group_name_max_length', '2021-02-20 09:53:36.494392'),
(16, 'auth', '0011_update_proxy_permissions', '2021-02-20 09:53:36.650618'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2021-02-20 09:53:37.125132'),
(18, 'handi', '0001_initial', '2021-02-20 09:53:50.846798'),
(19, 'handi', '0002_auto_20200313_0949', '2021-02-20 09:53:57.433040'),
(20, 'handi', '0003_cart', '2021-02-20 09:53:58.028476'),
(21, 'handi', '0004_bank', '2021-02-20 09:54:02.486696'),
(22, 'handi', '0005_auto_20200327_1008', '2021-02-20 09:54:03.869160'),
(23, 'sessions', '0001_initial', '2021-02-20 09:54:04.353223');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('gtfucfz04nwqj1fzcajf673h2o52kker', 'eyJ1bmFtZSI6ImRlZXBhIiwiZ3RvdGFsIjoxMDI0LCJsb2dpbmlkIjo2fQ:1lPn0W:gu8j5VpSUwnX0WC1YQbfZDEwpRS7zGMFJxlYzL34MQQ', '2021-04-09 14:00:12.566681'),
('yo0gbqzb628n7qkwaecme0ssemor7zvq', 'eyJ1bmFtZSI6ImRlZXBhIiwibG9naW5pZCI6Nn0:1lDPJf:L1dA5PHc8db5ubSr4kwsp7AZSgZjFrSUoRq4iIbx_8w', '2021-03-06 10:16:47.237817');

-- --------------------------------------------------------

--
-- Table structure for table `handi_agency`
--

CREATE TABLE `handi_agency` (
  `AgencyId` int(11) NOT NULL,
  `AgencyName` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `pin` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `LicenseNo` varchar(100) NOT NULL,
  `location_id` int(11) NOT NULL,
  `login_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `handi_agency`
--

INSERT INTO `handi_agency` (`AgencyId`, `AgencyName`, `address`, `pin`, `email`, `phone`, `LicenseNo`, `location_id`, `login_id`) VALUES
(1, 'Excel', 'Ktm', '685588', 'excel@gmail.com', '9988665544', '', 2, 2),
(2, 'Syntrio', 'TVM', '685587', 'syntri@gmail.com', '6677554488', '', 3, 3),
(3, 'oneteam', 'dgdfg', '', '867788', '9441127235', '', 3, 7),
(9, 'A&A', 'Moolamattom', '645590', 'a@gmail.com', '9441127235', '', 2, 13);

-- --------------------------------------------------------

--
-- Table structure for table `handi_bank`
--

CREATE TABLE `handi_bank` (
  `BankId` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `cardno` bigint(20) NOT NULL,
  `cvv` int(11) NOT NULL,
  `balance` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `handi_bank`
--

INSERT INTO `handi_bank` (`BankId`, `username`, `cardno`, `cvv`, `balance`) VALUES
(1, 'deepa', 8899, 756, 78976);

-- --------------------------------------------------------

--
-- Table structure for table `handi_cart`
--

CREATE TABLE `handi_cart` (
  `CartId` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `noofqunatity` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `handi_category`
--

CREATE TABLE `handi_category` (
  `CategoryId` int(11) NOT NULL,
  `CategoryName` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `handi_category`
--

INSERT INTO `handi_category` (`CategoryId`, `CategoryName`) VALUES
(1, 'fiber'),
(2, 'plastic'),
(3, 'paper'),
(4, 'fiber');

-- --------------------------------------------------------

--
-- Table structure for table `handi_customerreg`
--

CREATE TABLE `handi_customerreg` (
  `CustomerId` int(11) NOT NULL,
  `CusttomerName` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `dob` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `location_id` int(11) NOT NULL,
  `login_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `handi_customerreg`
--

INSERT INTO `handi_customerreg` (`CustomerId`, `CusttomerName`, `address`, `gender`, `dob`, `email`, `phone`, `location_id`, `login_id`) VALUES
(1, 'deepa', 'ekm', 'Female', '2021-02-09', 'deepa@gmail.com', '8877665599', 3, 6);

-- --------------------------------------------------------

--
-- Table structure for table `handi_district`
--

CREATE TABLE `handi_district` (
  `DistrictId` int(11) NOT NULL,
  `dname` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `handi_district`
--

INSERT INTO `handi_district` (`DistrictId`, `dname`) VALUES
(1, 'Idukki'),
(2, 'Ekm'),
(3, 'TVM');

-- --------------------------------------------------------

--
-- Table structure for table `handi_handicrafterreg`
--

CREATE TABLE `handi_handicrafterreg` (
  `HandicrafterId` int(11) NOT NULL,
  `HandicrafterName` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `dob` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `agency_id` int(11) NOT NULL,
  `login_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `handi_handicrafterreg`
--

INSERT INTO `handi_handicrafterreg` (`HandicrafterId`, `HandicrafterName`, `address`, `dob`, `phone`, `email`, `agency_id`, `login_id`) VALUES
(1, 'Jiya vincent', 'tdpa', '12-12-2012', '7733229988', 'jiya@gmail.com', 1, 4),
(2, 'Suvija', 'thiruvalla', '12-12-2011', '8877995566', 'suvi@gmail.com', 2, 5),
(3, 'adarsh', 'thiruvalla', '12-12-2012', '8877556677', 'adrash@gmail.com', 9, 14);

-- --------------------------------------------------------

--
-- Table structure for table `handi_location`
--

CREATE TABLE `handi_location` (
  `LocationId` int(11) NOT NULL,
  `LocationName` varchar(100) NOT NULL,
  `district_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `handi_location`
--

INSERT INTO `handi_location` (`LocationId`, `LocationName`, `district_id`) VALUES
(1, 'Thodupuzha', 1),
(2, 'Muttom', 1),
(3, 'Tripunihura', 2),
(4, 'Muvattupuzha', 2);

-- --------------------------------------------------------

--
-- Table structure for table `handi_login`
--

CREATE TABLE `handi_login` (
  `LoginId` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role` varchar(50) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `handi_login`
--

INSERT INTO `handi_login` (`LoginId`, `username`, `password`, `role`, `status`) VALUES
(1, 'admin', 'admin', 'admin', 1),
(2, 'excel', '123', 'Agency', 1),
(3, 'syntrio', '123', 'Agency', 1),
(4, 'jiya', '123', 'Handicrafter', 1),
(5, 'suvi', '123', 'Handicrafter', 0),
(6, 'deepa', '123', 'Customer', 1),
(7, 'one', '123', 'Agency', 1),
(13, 'angel', '123', 'Agency', 1),
(14, 'adarsh', '123', 'Handicrafter', 1);

-- --------------------------------------------------------

--
-- Table structure for table `handi_product`
--

CREATE TABLE `handi_product` (
  `ProductId` int(11) NOT NULL,
  `productname` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `agency_id` int(11) NOT NULL,
  `cat_id_id` int(11) NOT NULL,
  `handicarft_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `handi_product`
--

INSERT INTO `handi_product` (`ProductId`, `productname`, `description`, `photo`, `price`, `status`, `agency_id`, `cat_id_id`, `handicarft_id`) VALUES
(1, 'pen', 'testdescription', 'productphoto/img06.jpg', 12, 1, 1, 3, 1),
(2, 'basket', 'testdescription', 'productphoto/Capture.PNG', 500, 1, 1, 2, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `handi_agency`
--
ALTER TABLE `handi_agency`
  ADD PRIMARY KEY (`AgencyId`),
  ADD KEY `handi_agency_location_id_14beb1bb_fk_handi_location_LocationId` (`location_id`),
  ADD KEY `handi_agency_login_id_cd695f6d_fk_handi_login_LoginId` (`login_id`);

--
-- Indexes for table `handi_bank`
--
ALTER TABLE `handi_bank`
  ADD PRIMARY KEY (`BankId`);

--
-- Indexes for table `handi_cart`
--
ALTER TABLE `handi_cart`
  ADD PRIMARY KEY (`CartId`),
  ADD KEY `handi_cart_customer_id_5632f09f_fk_handi_customerreg_CustomerId` (`customer_id`),
  ADD KEY `handi_cart_product_id_8e973d27_fk_handi_product_ProductId` (`product_id`);

--
-- Indexes for table `handi_category`
--
ALTER TABLE `handi_category`
  ADD PRIMARY KEY (`CategoryId`);

--
-- Indexes for table `handi_customerreg`
--
ALTER TABLE `handi_customerreg`
  ADD PRIMARY KEY (`CustomerId`),
  ADD KEY `handi_customerreg_location_id_e4c8c49f_fk_handi_loc` (`location_id`),
  ADD KEY `handi_customerreg_login_id_926350a1_fk_handi_login_LoginId` (`login_id`);

--
-- Indexes for table `handi_district`
--
ALTER TABLE `handi_district`
  ADD PRIMARY KEY (`DistrictId`);

--
-- Indexes for table `handi_handicrafterreg`
--
ALTER TABLE `handi_handicrafterreg`
  ADD PRIMARY KEY (`HandicrafterId`),
  ADD KEY `handi_handicrafterreg_login_id_5301b731_fk_handi_login_LoginId` (`login_id`),
  ADD KEY `handi_handicrafterre_agency_id_7ea8435d_fk_handi_age` (`agency_id`);

--
-- Indexes for table `handi_location`
--
ALTER TABLE `handi_location`
  ADD PRIMARY KEY (`LocationId`),
  ADD KEY `handi_location_district_id_38a1a223_fk_handi_district_DistrictId` (`district_id`);

--
-- Indexes for table `handi_login`
--
ALTER TABLE `handi_login`
  ADD PRIMARY KEY (`LoginId`);

--
-- Indexes for table `handi_product`
--
ALTER TABLE `handi_product`
  ADD PRIMARY KEY (`ProductId`),
  ADD KEY `handi_product_agency_id_868dc87d_fk_handi_agency_AgencyId` (`agency_id`),
  ADD KEY `handi_product_cat_id_id_186661c7_fk_handi_category_CategoryId` (`cat_id_id`),
  ADD KEY `handi_product_handicarft_id_d9eb06fc_fk_handi_han` (`handicarft_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `handi_agency`
--
ALTER TABLE `handi_agency`
  MODIFY `AgencyId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `handi_bank`
--
ALTER TABLE `handi_bank`
  MODIFY `BankId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `handi_cart`
--
ALTER TABLE `handi_cart`
  MODIFY `CartId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `handi_category`
--
ALTER TABLE `handi_category`
  MODIFY `CategoryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `handi_customerreg`
--
ALTER TABLE `handi_customerreg`
  MODIFY `CustomerId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `handi_district`
--
ALTER TABLE `handi_district`
  MODIFY `DistrictId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `handi_handicrafterreg`
--
ALTER TABLE `handi_handicrafterreg`
  MODIFY `HandicrafterId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `handi_location`
--
ALTER TABLE `handi_location`
  MODIFY `LocationId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `handi_login`
--
ALTER TABLE `handi_login`
  MODIFY `LoginId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `handi_product`
--
ALTER TABLE `handi_product`
  MODIFY `ProductId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `handi_agency`
--
ALTER TABLE `handi_agency`
  ADD CONSTRAINT `handi_agency_location_id_14beb1bb_fk_handi_location_LocationId` FOREIGN KEY (`location_id`) REFERENCES `handi_location` (`LocationId`),
  ADD CONSTRAINT `handi_agency_login_id_cd695f6d_fk_handi_login_LoginId` FOREIGN KEY (`login_id`) REFERENCES `handi_login` (`LoginId`);

--
-- Constraints for table `handi_cart`
--
ALTER TABLE `handi_cart`
  ADD CONSTRAINT `handi_cart_customer_id_5632f09f_fk_handi_customerreg_CustomerId` FOREIGN KEY (`customer_id`) REFERENCES `handi_customerreg` (`CustomerId`),
  ADD CONSTRAINT `handi_cart_product_id_8e973d27_fk_handi_product_ProductId` FOREIGN KEY (`product_id`) REFERENCES `handi_product` (`ProductId`);

--
-- Constraints for table `handi_customerreg`
--
ALTER TABLE `handi_customerreg`
  ADD CONSTRAINT `handi_customerreg_location_id_e4c8c49f_fk_handi_loc` FOREIGN KEY (`location_id`) REFERENCES `handi_location` (`LocationId`),
  ADD CONSTRAINT `handi_customerreg_login_id_926350a1_fk_handi_login_LoginId` FOREIGN KEY (`login_id`) REFERENCES `handi_login` (`LoginId`);

--
-- Constraints for table `handi_handicrafterreg`
--
ALTER TABLE `handi_handicrafterreg`
  ADD CONSTRAINT `handi_handicrafterre_agency_id_7ea8435d_fk_handi_age` FOREIGN KEY (`agency_id`) REFERENCES `handi_agency` (`AgencyId`),
  ADD CONSTRAINT `handi_handicrafterreg_login_id_5301b731_fk_handi_login_LoginId` FOREIGN KEY (`login_id`) REFERENCES `handi_login` (`LoginId`);

--
-- Constraints for table `handi_location`
--
ALTER TABLE `handi_location`
  ADD CONSTRAINT `handi_location_district_id_38a1a223_fk_handi_district_DistrictId` FOREIGN KEY (`district_id`) REFERENCES `handi_district` (`DistrictId`);

--
-- Constraints for table `handi_product`
--
ALTER TABLE `handi_product`
  ADD CONSTRAINT `handi_product_agency_id_868dc87d_fk_handi_agency_AgencyId` FOREIGN KEY (`agency_id`) REFERENCES `handi_agency` (`AgencyId`),
  ADD CONSTRAINT `handi_product_cat_id_id_186661c7_fk_handi_category_CategoryId` FOREIGN KEY (`cat_id_id`) REFERENCES `handi_category` (`CategoryId`),
  ADD CONSTRAINT `handi_product_handicarft_id_d9eb06fc_fk_handi_han` FOREIGN KEY (`handicarft_id`) REFERENCES `handi_handicrafterreg` (`HandicrafterId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
