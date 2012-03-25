-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- 主機: localhost
-- 建立日期: Mar 25, 2012, 06:56 �U��
-- 伺服器版本: 5.5.8
-- PHP 版本: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 資料庫: `sanlu`
--

-- --------------------------------------------------------

--
-- 資料表格式： `bill_detail`
--

DROP TABLE IF EXISTS `bill_detail`;
CREATE TABLE IF NOT EXISTS `bill_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `end_time` datetime NOT NULL,
  `internal_price` decimal(19,0) NOT NULL,
  `last_modify_by_id` bigint(20) NOT NULL,
  `last_updated` datetime NOT NULL,
  `modified_internal_price` decimal(19,0) NOT NULL,
  `modified_price` decimal(19,0) NOT NULL,
  `place_id` bigint(20) DEFAULT NULL,
  `price` decimal(19,0) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `project_id` bigint(20) NOT NULL,
  `quantity` decimal(19,0) NOT NULL,
  `show_bill` bit(1) NOT NULL,
  `start_time` datetime NOT NULL,
  `vendor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKE363AB89A216611D` (`place_id`),
  KEY `FKE363AB891B7C2B1D` (`project_id`),
  KEY `FKE363AB89E623C052` (`last_modify_by_id`),
  KEY `FKE363AB89F961D35D` (`product_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- 列出以下資料庫的數據： `bill_detail`
--

INSERT INTO `bill_detail` (`id`, `version`, `color`, `end_time`, `internal_price`, `last_modify_by_id`, `last_updated`, `modified_internal_price`, `modified_price`, `place_id`, `price`, `product_id`, `project_id`, `quantity`, `show_bill`, `start_time`, `vendor`) VALUES
(4, 0, '2', '2012-03-13 02:30:00', 1500, 1, '2012-03-13 21:32:06', 1500, 1500, NULL, 1500, 280, 2, 1, '1', '2012-03-13 00:00:00', ''),
(5, 1, '2', '2012-03-13 00:00:00', 120, 1, '2012-03-14 00:41:45', 120, 120, NULL, 120, 192, 2, 1, '1', '2012-03-13 00:00:00', '3333'),
(6, 0, '2', '2012-03-13 00:00:00', 120, 1, '2012-03-13 22:07:10', 120, 120, NULL, 120, 192, 2, 2, '1', '2012-03-13 00:00:00', '3333'),
(7, 0, '2', '2012-03-07 00:00:00', 600, 1, '2012-03-13 22:07:53', 600, 600, NULL, 600, 347, 2, 1, '1', '2012-03-07 00:00:00', ''),
(8, 0, '2', '2012-03-14 04:00:00', 600, 1, '2012-03-13 22:08:07', 600, 600, NULL, 600, 347, 2, 1, '1', '2012-03-14 04:00:00', '');

-- --------------------------------------------------------

--
-- 資料表格式： `calendar_data`
--

DROP TABLE IF EXISTS `calendar_data`;
CREATE TABLE IF NOT EXISTS `calendar_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `end_time` datetime NOT NULL,
  `last_modify_by_id` bigint(20) NOT NULL,
  `last_updated` datetime NOT NULL,
  `start_time` datetime NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK74FC040BE623C052` (`last_modify_by_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- 列出以下資料庫的數據： `calendar_data`
--

INSERT INTO `calendar_data` (`id`, `version`, `description`, `end_time`, `last_modify_by_id`, `last_updated`, `start_time`, `type`) VALUES
(1, 0, 'ojrk ', '2012-03-28 00:00:00', 1, '2012-03-26 00:02:59', '2012-03-26 00:00:00', '1'),
(2, 0, 'qwqqqqq', '2012-03-29 00:00:00', 1, '2012-03-26 00:03:09', '2012-03-19 00:00:00', '1'),
(4, 0, 'bbbb', '2012-03-27 00:00:00', 1, '2012-03-26 00:31:20', '2012-03-19 02:00:00', '1'),
(5, 0, 'ss', '2012-03-29 17:00:00', 1, '2012-03-26 00:53:03', '2012-03-26 04:00:00', '1');

-- --------------------------------------------------------

--
-- 資料表格式： `chinese_date_status`
--

DROP TABLE IF EXISTS `chinese_date_status`;
CREATE TABLE IF NOT EXISTS `chinese_date_status` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `date` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `date_status` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- 列出以下資料庫的數據： `chinese_date_status`
--


-- --------------------------------------------------------

--
-- 資料表格式： `document`
--

DROP TABLE IF EXISTS `document`;
CREATE TABLE IF NOT EXISTS `document` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `file_data` tinyblob NOT NULL,
  `file_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `size` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- 列出以下資料庫的數據： `document`
--


-- --------------------------------------------------------

--
-- 資料表格式： `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE IF NOT EXISTS `employee` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `emp_level` int(11) NOT NULL,
  `emp_name` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `emp_no` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `hire_date` datetime NOT NULL,
  `is_left` bit(1) NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `emp_no` (`emp_no`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- 列出以下資料庫的數據： `employee`
--

INSERT INTO `employee` (`id`, `version`, `emp_level`, `emp_name`, `emp_no`, `gender`, `hire_date`, `is_left`, `password`) VALUES
(1, 0, 1, 'nick', '00001', 'M', '2012-03-07 23:47:56', '1', '81dc9bdb52d04dc20036dbd8313ed055'),
(2, 0, 2, 'emp2', '00002', 'M', '2012-03-07 23:47:56', '1', '81dc9bdb52d04dc20036dbd8313ed055'),
(3, 0, 5, 'emp3', '00003', 'M', '2012-03-07 23:47:56', '1', '81dc9bdb52d04dc20036dbd8313ed055');

-- --------------------------------------------------------

--
-- 資料表格式： `funeraler`
--

DROP TABLE IF EXISTS `funeraler`;
CREATE TABLE IF NOT EXISTS `funeraler` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `funeral_commpany_id` bigint(20) NOT NULL,
  `funeraler_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `last_modify_by_id` bigint(20) NOT NULL,
  `last_updated` datetime NOT NULL,
  `phone1` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `phone2` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `funeraler_name` (`funeraler_name`),
  KEY `FKFAE8DA84E623C052` (`last_modify_by_id`),
  KEY `FKFAE8DA84DD20030D` (`funeral_commpany_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- 列出以下資料庫的數據： `funeraler`
--

INSERT INTO `funeraler` (`id`, `version`, `funeral_commpany_id`, `funeraler_name`, `last_modify_by_id`, `last_updated`, `phone1`, `phone2`) VALUES
(1, 0, 1, '李XX', 1, '2012-03-07 23:47:56', '0988765241', NULL),
(2, 0, 2, '林XX', 1, '2012-03-07 23:47:56', '0988765241', NULL);

-- --------------------------------------------------------

--
-- 資料表格式： `funeral_company`
--

DROP TABLE IF EXISTS `funeral_company`;
CREATE TABLE IF NOT EXISTS `funeral_company` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `contact_addr` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_addr_area` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_addr_city` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `funeral_company_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `last_modify_by_id` bigint(20) NOT NULL,
  `last_updated` datetime NOT NULL,
  `phone1` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `phone2` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `funeral_company_name` (`funeral_company_name`),
  KEY `FKBCEDB3D5E623C052` (`last_modify_by_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- 列出以下資料庫的數據： `funeral_company`
--

INSERT INTO `funeral_company` (`id`, `version`, `contact_addr`, `contact_addr_area`, `contact_addr_city`, `funeral_company_name`, `last_modify_by_id`, `last_updated`, `phone1`, `phone2`) VALUES
(1, 0, 'XX路', '三重區', '新北市', '祥安禮儀', 1, '2012-03-07 23:47:56', '091234567', NULL),
(2, 0, NULL, NULL, NULL, '祥安禮儀2', 1, '2012-03-07 23:47:56', '091234567', NULL);

-- --------------------------------------------------------

--
-- 資料表格式： `package`
--

DROP TABLE IF EXISTS `package`;
CREATE TABLE IF NOT EXISTS `package` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `last_modify_by_id` bigint(20) NOT NULL,
  `last_updated` datetime NOT NULL,
  `package_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `package_price` decimal(19,2) NOT NULL,
  `salling_package_price` decimal(19,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKCFE53446E623C052` (`last_modify_by_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- 列出以下資料庫的數據： `package`
--


-- --------------------------------------------------------

--
-- 資料表格式： `package_link_product`
--

DROP TABLE IF EXISTS `package_link_product`;
CREATE TABLE IF NOT EXISTS `package_link_product` (
  `prod_id` bigint(20) NOT NULL,
  `pack_id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `last_modify_by_id` bigint(20) NOT NULL,
  `last_updated` datetime NOT NULL,
  PRIMARY KEY (`prod_id`,`pack_id`),
  KEY `FKF97961037E7283F5` (`prod_id`),
  KEY `FKF9796103E623C052` (`last_modify_by_id`),
  KEY `FKF979610343219D4A` (`pack_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 列出以下資料庫的數據： `package_link_product`
--


-- --------------------------------------------------------

--
-- 資料表格式： `parameters`
--

DROP TABLE IF EXISTS `parameters`;
CREATE TABLE IF NOT EXISTS `parameters` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_modify_by_id` bigint(20) NOT NULL,
  `last_updated` datetime NOT NULL,
  `memo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1B57C1EAE623C052` (`last_modify_by_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- 列出以下資料庫的數據： `parameters`
--

INSERT INTO `parameters` (`id`, `version`, `description`, `last_modify_by_id`, `last_updated`, `memo`, `type`, `value`) VALUES
(1, 0, 'Excel Password', 1, '2012-03-07 23:47:57', 'Excel Password', 'excelPassword', 'ssanlu');

-- --------------------------------------------------------

--
-- 資料表格式： `place`
--

DROP TABLE IF EXISTS `place`;
CREATE TABLE IF NOT EXISTS `place` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `last_modify_by_id` bigint(20) NOT NULL,
  `last_updated` datetime NOT NULL,
  `place_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK65CD907E623C052` (`last_modify_by_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

--
-- 列出以下資料庫的數據： `place`
--

INSERT INTO `place` (`id`, `version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES
(1, 0, 1, '2012-03-07 23:47:57', '助念室'),
(2, 0, 1, '2012-03-07 23:47:57', '功德廳'),
(3, 0, 1, '2012-03-07 23:47:57', '大忠廳'),
(4, 0, 1, '2012-03-07 23:47:57', '靈位區'),
(5, 0, 1, '2012-03-07 23:47:57', '至正廳'),
(6, 0, 1, '2012-03-07 23:47:57', '誦經室(一)'),
(7, 0, 1, '2012-03-07 23:47:57', '誦經室(二)'),
(8, 0, 1, '2012-03-07 23:47:57', '誦經室(三)'),
(9, 0, 1, '2012-03-07 23:47:57', '誦經室(五)');

-- --------------------------------------------------------

--
-- 資料表格式： `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `cost_price` decimal(19,0) DEFAULT NULL,
  `cost_range` decimal(19,1) DEFAULT NULL,
  `cost_unit` int(11) NOT NULL,
  `has_place` bit(1) NOT NULL,
  `last_modify_by_id` bigint(20) NOT NULL,
  `last_updated` datetime NOT NULL,
  `price` decimal(19,0) DEFAULT NULL,
  `product_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `product_no` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `salling_price` decimal(19,0) DEFAULT NULL,
  `total_quantity` int(11) DEFAULT NULL,
  `unit` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `product_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_name` (`product_name`),
  KEY `FKED8DCCEFE623C052` (`last_modify_by_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=385 ;

--
-- 列出以下資料庫的數據： `product`
--

INSERT INTO `product` (`id`, `version`, `cost_price`, `cost_range`, `cost_unit`, `has_place`, `last_modify_by_id`, `last_updated`, `price`, `product_name`, `product_no`, `salling_price`, `total_quantity`, `unit`, `product_type`) VALUES
(192, 0, 100, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 120, '發糕2', '000001', 120, NULL, '組', 2),
(193, 0, 50, 1.0, 3, '0', 1, '2012-03-03 22:26:49', 50, '臉盆水逾期', '000002', 50, NULL, '天', 2),
(194, 0, 320, 1.0, 3, '1', 1, '2012-03-03 22:26:49', 500, '火葬位停柩', '000003', 500, NULL, '天', 3),
(195, 0, 400, 1.0, 3, '1', 1, '2012-03-03 22:26:49', 500, '土葬位停柩', '000004', 500, NULL, '天', 3),
(196, 0, 400, 1.0, 3, '1', 1, '2012-03-03 22:26:49', 500, '固定式冰櫃冰存', '000005', 500, NULL, '天', 3),
(197, 0, 500, 1.0, 3, '1', 1, '2012-03-03 22:26:49', 550, '移動式冰櫃冰存', '000006', 550, NULL, '天', 3),
(198, 0, 240, 1.0, 3, '1', 1, '2012-03-03 22:26:49', 300, '靈位寄存', '000007', 300, NULL, '天', 3),
(199, 0, 2500, 1.0, 3, '1', 1, '2012-03-03 22:26:49', 3000, '個人靈堂-大', '000008', 3000, NULL, '天', 3),
(200, 0, 2000, 1.0, 3, '1', 1, '2012-03-03 22:26:49', 2500, '個人靈堂-中', '000009', 2500, NULL, '天', 3),
(201, 0, 1500, 1.0, 3, '1', 1, '2012-03-03 22:26:49', 2000, '個人靈堂-小', '000010', 2000, NULL, '天', 3),
(202, 0, 2000, 1.0, 3, '1', 1, '2012-03-03 22:26:49', 2500, '個人靈堂-商', '000011', 2500, NULL, '天', 3),
(203, 0, 100, 1.0, 3, '1', 1, '2012-03-03 22:26:49', 100, '牌位暫存-普通位(天)', '000012', 100, NULL, '天', 3),
(204, 0, 3000, 1.0, 4, '1', 1, '2012-03-03 22:26:49', 3000, '牌位暫存-普通位(1月)', '000013', 3000, NULL, '月', 3),
(205, 0, 7000, 3.0, 4, '1', 1, '2012-03-03 22:26:49', 7000, '牌位暫存-普通位(3月)', '000014', 7000, NULL, '月', 3),
(206, 0, 12000, 6.0, 4, '1', 1, '2012-03-03 22:26:49', 12000, '牌位暫存-普通位(6月)', '000015', 12000, NULL, '月', 3),
(207, 0, 19000, 12.0, 4, '1', 1, '2012-03-03 22:26:49', 19000, '牌位暫存-普通位(12月)', '000016', 19000, NULL, '月', 3),
(208, 0, 100, 1.0, 3, '1', 1, '2012-03-03 22:26:49', 100, '骨罐暫存(天)', '000017', 100, NULL, '天', 3),
(209, 0, 3000, 1.0, 4, '1', 1, '2012-03-03 22:26:49', 3000, '骨罐暫存(1月)', '000018', 3000, NULL, '月', 3),
(210, 0, 7000, 3.0, 4, '1', 1, '2012-03-03 22:26:49', 7000, '骨罐暫存(3月)', '000019', 7000, NULL, '月', 3),
(211, 0, 12000, 6.0, 4, '1', 1, '2012-03-03 22:26:49', 12000, '骨罐暫存(6月)', '000020', 12000, NULL, '月', 3),
(212, 0, 19000, 12.0, 4, '1', 1, '2012-03-03 22:26:49', 19000, '骨罐暫存(12月)', '000021', 19000, NULL, '月', 3),
(213, 0, 200, 1.0, 3, '1', 1, '2012-03-03 22:26:49', 200, '牌位暫存-豪華位(天)', '000022', 200, NULL, '天', 3),
(214, 0, 6000, 1.0, 4, '1', 1, '2012-03-03 22:26:49', 6000, '牌位暫存-豪華位(1月)', '000023', 6000, NULL, '月', 3),
(215, 0, 14000, 3.0, 4, '1', 1, '2012-03-03 22:26:49', 14000, '牌位暫存-豪華位(3月)', '000024', 14000, NULL, '月', 3),
(216, 0, 24000, 6.0, 4, '1', 1, '2012-03-03 22:26:49', 24000, '牌位暫存-豪華位(6月)', '000025', 24000, NULL, '月', 3),
(217, 0, 38000, 12.0, 4, '1', 1, '2012-03-03 22:26:49', 38000, '牌位暫存-豪華位(12月)', '000026', 38000, NULL, '月', 3),
(218, 0, 4, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 5, '大銀(散裝)', '000027', 5, NULL, '支', 2),
(219, 0, 4, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 5, '小銀(散裝)', '000028', 5, NULL, '支', 2),
(220, 0, 4, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 5, '刈金(散裝)', '000029', 5, NULL, '支', 2),
(221, 0, 4, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 5, '壽金(散裝)', '000030', 5, NULL, '支', 2),
(222, 0, 4, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 5, '福金(散裝)', '000031', 5, NULL, '支', 2),
(223, 0, 60, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 80, '捻香粉', '000032', 80, NULL, '斤', 2),
(224, 0, 90, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 150, '白雙連', '000033', 150, NULL, '包', 2),
(225, 0, 90, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 150, '紅雙連', '000034', 150, NULL, '包', 2),
(226, 0, 15, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 30, '白包袋', '000035', 30, NULL, '包', 2),
(227, 0, 15, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 30, '紅包袋', '000036', 30, NULL, '包', 2),
(228, 0, 80, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 100, '胸花', '000037', 100, NULL, '包', 2),
(229, 0, 55, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 65, '往生蓮花紙', '000038', 65, NULL, '包', 2),
(230, 0, 60, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 75, '單面彩色蓮花紙', '000039', 75, NULL, '包', 2),
(231, 0, 65, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 85, '雙面彩色元寶紙', '000040', 85, NULL, '包', 2),
(232, 0, 8, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 10, '香爐粉', '000041', 10, NULL, '包', 2),
(233, 0, 80, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 100, '金元寶', '000042', 100, NULL, '包', 2),
(234, 0, 80, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 100, '銀元寶', '000043', 100, NULL, '包', 2),
(235, 0, 5, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 10, '金炮燭', '000044', 10, NULL, '包', 2),
(236, 0, 25, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 35, '禮簿', '000045', 35, NULL, '本', 2),
(237, 0, 25, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 35, '題名簿', '000046', 35, NULL, '本', 2),
(238, 0, 25, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 35, '謝簿', '000047', 35, NULL, '本', 2),
(239, 0, 45, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 80, '貼肉仁', '000048', 80, NULL, '件', 2),
(240, 0, 10, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 30, '長袖雨衣', '000049', 30, NULL, '件', 2),
(241, 0, 200, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 250, '大銀(50/件)', '000050', 250, NULL, '件', 2),
(242, 0, 200, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 250, '小銀(63/件)', '000051', 250, NULL, '件', 2),
(243, 0, 200, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 250, '刈金(50/件)', '000052', 250, NULL, '件', 2),
(244, 0, 200, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 250, '壽金(50/件)', '000053', 250, NULL, '件', 2),
(245, 0, 200, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 250, '福金(50/件)', '000054', 250, NULL, '件', 2),
(246, 0, 190, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 250, '麻衣', '000055', 250, NULL, '件', 2),
(247, 0, 90, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 100, '苧衣', '000056', 100, NULL, '件', 2),
(248, 0, 30, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 50, '女頭罩', '000057', 50, NULL, '件', 2),
(249, 0, 120, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 150, '女婿服', '000058', 150, NULL, '件', 2),
(250, 0, 130, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 150, '男用白袍', '000059', 150, NULL, '件', 2),
(251, 0, 80, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 100, '第三代孝服', '000060', 100, NULL, '件', 2),
(252, 0, 40, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 50, '第三代頭罩', '000061', 50, NULL, '件', 2),
(253, 0, 80, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 100, '第五代孝服', '000062', 100, NULL, '件', 2),
(254, 0, 40, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 50, '第五代頭罩', '000063', 50, NULL, '件', 2),
(255, 0, 600, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 750, '素三牲', '000064', 750, NULL, '份', 2),
(256, 0, 600, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 750, '葷三牲', '000065', 750, NULL, '份', 2),
(257, 0, 1400, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 1500, '素五牲', '000066', 1500, NULL, '份', 2),
(258, 0, 1400, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 1600, '五牲-豬頭', '000067', 1600, NULL, '份', 2),
(259, 0, 1500, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 1600, '五牲-原蹄', '000068', 1600, NULL, '份', 2),
(260, 0, 1500, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 1700, '五牲-全豬頭', '000069', 1700, NULL, '份', 2),
(261, 0, 250, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 250, '素小三牲', '000070', 250, NULL, '份', 2),
(262, 0, 150, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 250, '葷小三牲', '000071', 250, NULL, '份', 2),
(263, 0, 300, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 350, '四果', '000072', 350, NULL, '份', 2),
(264, 0, 100, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 200, '綜合果', '000073', 200, NULL, '份', 2),
(265, 0, 300, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 350, '十二菜碗', '000074', 350, NULL, '份', 2),
(266, 0, 150, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 200, '六菜碗', '000075', 200, NULL, '份', 2),
(267, 0, 12800, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 12800, '羽蝶A款', '000076', 12800, NULL, '式', 2),
(268, 0, 13800, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 13800, '羽蝶B款', '000077', 13800, NULL, '式', 2),
(269, 0, 13800, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 13800, '羽蝶C款', '000078', 13800, NULL, '式', 2),
(270, 0, 15000, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 15000, '羽蝶彩妝組合', '000079', 15000, NULL, '式', 2),
(271, 0, 17800, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 17800, '羽蝶超值組合', '000080', 17800, NULL, '式', 2),
(272, 0, 19800, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 19800, '羽蝶淨化組合', '000081', 19800, NULL, '式', 2),
(273, 0, 24800, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 24800, '羽蝶尊貴組合', '000082', 24800, NULL, '式', 2),
(274, 0, 3000, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 3500, '移動式冰櫃下架費', '000083', 3500, NULL, '趟', 2),
(275, 0, 1300, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 3000, '淨身服務', '000084', 3000, NULL, '次', 2),
(276, 0, 38, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 150, '庫錢', '000085', 150, NULL, '包', 2),
(277, 0, 38, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 150, '庫錢2', '000086', 150, NULL, '包', 2),
(278, 0, 52, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 80, '壽內庫錢', '000087', 80, NULL, '包', 2),
(279, 0, 415, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 800, '臉盆水服務', '000088', 800, NULL, '式', 2),
(280, 3, 1500, 2.5, 2, '0', 1, '2012-03-23 22:27:17', 1500, 'LED外牌地毯', '000089', 1500, NULL, '次', 1),
(281, 0, 2000, 2.5, 2, '0', 1, '2012-03-03 22:26:49', 3000, '全採LED投射燈租用', '000090', 3000, NULL, '次', 1),
(282, 0, 1000, 2.5, 2, '1', 1, '2012-03-03 22:26:49', 3000, '投影機租用', '000091', 3000, NULL, '次', 3),
(283, 0, 1000, 2.0, 2, '1', 1, '2012-03-03 22:26:49', 1000, 'SPA場租', '000092', 1000, NULL, '次', 3),
(284, 0, 800, 1.0, 0, '1', 1, '2012-03-03 22:26:49', 1000, '淨身場租', '000093', 1000, NULL, '次', 3),
(285, 0, 2400, 1.0, 0, '1', 1, '2012-03-03 22:26:49', 3000, '隔夜守靈', '000094', 3000, NULL, '次', 3),
(286, 0, 35, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 40, '紅龜', '000095', 40, NULL, '個', 2),
(287, 0, 35, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 40, '發糕', '000096', 40, NULL, '個', 2),
(288, 0, 10, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 12, '水煮蛋', '000097', 12, NULL, '個', 2),
(289, 0, 150, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 150, '大發粿', '000098', 150, NULL, '個', 2),
(290, 0, 12, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 15, '鹹鴨蛋', '000099', 15, NULL, '個', 2),
(291, 0, 30, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 50, '乳頭糕', '000100', 50, NULL, '個', 2),
(292, 0, 60, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 80, '筆架糕', '000101', 80, NULL, '個', 2),
(293, 0, 60, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 80, '筆架山糕', '000102', 80, NULL, '個', 2),
(294, 0, 50, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 80, '竹圈', '000103', 80, NULL, '個', 2),
(295, 0, 50, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 80, '香爐', '000104', 80, NULL, '個', 2),
(296, 0, 18, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 18, '空冥大箱', '000105', 18, NULL, '個', 2),
(297, 0, 5, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 5, '紅百寶袋', '000106', 5, NULL, '個', 2),
(298, 0, 28, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 35, '紅皮箱', '000107', 35, NULL, '個', 2),
(299, 0, 45, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 100, '牌位(彿)', '000108', 100, NULL, '個', 2),
(300, 0, 45, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 100, '牌位(道)', '000109', 100, NULL, '個', 2),
(301, 0, 200, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 600, '念彿機', '000110', 600, NULL, '個', 2),
(302, 0, 25, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 100, '魂幡布(彿)', '000111', 100, NULL, '個', 2),
(303, 0, 25, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 100, '魂幡布(道)', '000112', 100, NULL, '個', 2),
(304, 0, 120, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 200, '水被(彿)', '000113', 200, NULL, '個', 2),
(305, 0, 120, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 200, '水被(道)', '000114', 200, NULL, '個', 2),
(306, 0, 70, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 100, '乞水盆', '000115', 100, NULL, '個', 2),
(307, 0, 120, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 180, '木製牌位', '000116', 180, NULL, '個', 2),
(308, 0, 100, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 300, '卍字被(黃)', '000117', 300, NULL, '個', 2),
(309, 0, 100, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 300, '卍字被(紅)', '000118', 300, NULL, '個', 2),
(310, 0, 40, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 100, '往生被', '000119', 100, NULL, '個', 2),
(311, 0, 30, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 50, '男麻草圈', '000120', 50, NULL, '個', 2),
(312, 0, 30, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 50, '男綁頭', '000121', 50, NULL, '個', 2),
(313, 0, 1000, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 1450, '壽衣-男西裝', '000122', 1450, NULL, '套', 2),
(314, 0, 1000, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 1450, '壽衣-鳳仙裝', '000123', 1450, NULL, '套', 2),
(315, 0, 1000, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 1450, '壽衣-女絲緞', '000124', 1450, NULL, '套', 2),
(316, 0, 30, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 30, '紅絲線', '000125', 30, NULL, '捆', 2),
(317, 0, 10, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 20, '五色線', '000126', 20, NULL, '捆', 2),
(318, 0, 800, 1.0, 2, '1', 1, '2012-03-03 22:26:49', 1000, '大忠廳功德場租', '000127', 1000, NULL, '時', 3),
(319, 0, 560, 1.0, 2, '1', 1, '2012-03-03 22:26:49', 700, '至正廳功德場租', '000128', 700, NULL, '時', 3),
(320, 0, 800, 1.0, 2, '1', 1, '2012-03-03 22:26:49', 1000, '大忠廳助念場租', '000129', 1000, NULL, '時', 3),
(321, 0, 560, 1.0, 2, '1', 1, '2012-03-03 22:26:49', 700, '至正廳助念場租', '000130', 700, NULL, '時', 3),
(322, 0, 800, 1.0, 2, '1', 1, '2012-03-03 22:26:49', 1000, '大忠廳入殮場租', '000131', 1000, NULL, '時', 3),
(323, 0, 560, 1.0, 2, '1', 1, '2012-03-03 22:26:49', 700, '至正廳入殮場租', '000132', 700, NULL, '時', 3),
(324, 0, 800, 1.0, 2, '1', 1, '2012-03-03 22:26:49', 1000, '大忠廳誦經場租', '000133', 1000, NULL, '時', 3),
(325, 0, 560, 1.0, 2, '1', 1, '2012-03-03 22:26:49', 700, '至正廳誦經場租', '000134', 700, NULL, '時', 3),
(326, 0, 400, 1.0, 2, '1', 1, '2012-03-03 22:26:49', 500, '二樓功德場租', '000135', 500, NULL, '時', 3),
(327, 0, 400, 1.0, 2, '1', 1, '2012-03-03 22:26:49', 500, '二樓誦經場租', '000136', 500, NULL, '時', 3),
(328, 0, 400, 1.0, 2, '1', 1, '2012-03-03 22:26:49', 500, '助念室', '000137', 500, NULL, '時', 3),
(329, 0, 400, 1.0, 2, '1', 1, '2012-03-03 22:26:49', 500, ' 入殮', '000138', 500, NULL, '時', 3),
(330, 0, 33, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 70, '回禮毛巾', '000139', 70, NULL, '條', 2),
(331, 0, 30, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 35, '七呎紅布', '000140', 35, NULL, '條', 2),
(332, 0, 120, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 200, '一般清白巾禮盒', '000141', 200, NULL, '盒', 2),
(333, 0, 25, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 35, '環香', '000142', 35, NULL, '盒', 2),
(334, 0, 200, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 200, '項鍊戒指組', '000143', 200, NULL, '盒', 2),
(335, 0, 50, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 300, '冥大', '000144', 300, NULL, '盒', 2),
(336, 0, 200, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 600, '財寶盒', '000145', 600, NULL, '盒', 2),
(337, 0, 150, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 600, '黃金萬兩', '000146', 600, NULL, '盒', 2),
(338, 0, 650, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 650, '代洗燈片', '000147', 650, NULL, '組', 2),
(339, 0, 600, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 600, '代洗相片', '000148', 600, NULL, '組', 2),
(340, 0, 58, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 150, '藥壺', '000149', 150, NULL, '組', 2),
(341, 0, 80, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 120, '童男女', '000150', 120, NULL, '組', 2),
(342, 0, 60, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 150, '壽內用品', '000151', 150, NULL, '組', 2),
(343, 0, 6400, 2.5, 2, '1', 1, '2012-03-03 22:26:49', 8000, 'SPA場租2', '000152', 8000, NULL, '場', 3),
(344, 0, 3200, 2.5, 2, '1', 1, '2012-03-03 22:26:49', 4000, '告別禮廳-至正廳', '000153', 4000, NULL, '場', 3),
(345, 0, 1500, 2.5, 2, '1', 1, '2012-03-03 22:26:49', 2500, '告別禮廳-助念室', '000154', 2500, NULL, '場', 3),
(346, 0, 600, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 600, '靈屋清潔費', '000155', 600, NULL, '棟', 1),
(347, 0, 600, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 600, '場地清潔費', '000156', 600, NULL, '棟', 1),
(348, 1, 600, 1.0, 0, '0', 1, '2012-03-23 22:16:48', 600, '庫錢清潔費', '000157', 600, NULL, '棟', 49),
(349, 0, 250, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 600, '元寶船', '000158', 600, NULL, '搜', 2),
(350, 0, 35, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 40, '湯圓', '000159', 40, NULL, '碗', 2),
(351, 0, 200, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 300, '代換瓶花-小', '000160', 300, NULL, '對', 2),
(352, 0, 150, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 300, '代換瓶花-大', '000161', 300, NULL, '對', 2),
(353, 0, 600, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 1200, '代換前蘭花', '000162', 1200, NULL, '對', 2),
(354, 0, 800, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 1000, '高架花籃', '000163', 1000, NULL, '對', 2),
(355, 0, 1000, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 1200, '高架花籃2', '000164', 1200, NULL, '對', 2),
(356, 0, 1200, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 1500, '高架花籃3', '000165', 1500, NULL, '對', 2),
(357, 0, 1400, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 2000, '罐頭塔-五層(品牌)', '000166', 2000, NULL, '對', 2),
(358, 0, 2200, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 3000, '罐頭塔-七層(品牌)', '000167', 3000, NULL, '對', 2),
(359, 0, 1100, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 1700, '罐頭塔-五層(果汁)', '000168', 1700, NULL, '對', 2),
(360, 0, 2000, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 2700, '罐頭塔-七層(果汁)', '000169', 2700, NULL, '對', 2),
(361, 0, 70, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 100, '壽禮燭', '000170', 100, NULL, '對', 2),
(362, 0, 70, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 100, '大斗燭', '000171', 100, NULL, '對', 2),
(363, 0, 70, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 100, '光神胖胖燭', '000172', 100, NULL, '對', 2),
(364, 0, 35, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 100, '寶光洋燭', '000173', 100, NULL, '對', 2),
(365, 0, 25, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 60, '彿杯(黃)', '000174', 60, NULL, '對', 2),
(366, 0, 25, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 60, '彿杯(紅)', '000175', 60, NULL, '對', 2),
(367, 0, 35, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 60, '葫蘆燭(黃)', '000176', 60, NULL, '對', 2),
(368, 0, 35, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 60, '葫蘆燭(紅)', '000177', 60, NULL, '對', 2),
(369, 0, 100, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 200, '代換水果', '000178', 200, NULL, '盤', 2),
(370, 0, 1500, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 1500, '接體車-北部', '000179', 1500, NULL, '趟', 2),
(371, 0, 5, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 10, '小酥油粒', '000180', 10, NULL, '顆', 2),
(372, 0, 100, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 100, '一般菜盤', '000181', 100, NULL, '籃', 2),
(373, 0, 150, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 150, '高級菜盤', '000182', 150, NULL, '籃', 2),
(374, 0, 800, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 1000, '水果籃', '000183', 1000, NULL, '籃', 2),
(375, 0, 1000, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 1200, '水果籃2', '000184', 1200, NULL, '籃', 2),
(376, 0, 3, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 10, '孝誌', '000185', 10, NULL, '疊', 2),
(377, 0, 3, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 10, '手尾錢', '000186', 10, NULL, '疊', 2),
(378, 0, 25, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 100, '竹子', '000187', 100, NULL, '疊', 2),
(379, 0, 20, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 50, '台幣', '000188', 50, NULL, '疊', 2),
(380, 0, 20, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 50, '美金', '000189', 50, NULL, '疊', 2),
(381, 0, 20, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 50, '佛祖幣', '000190', 50, NULL, '疊', 2),
(382, 0, 20, 1.0, 0, '0', 1, '2012-03-03 22:26:49', 50, '人民幣', '000191', 50, NULL, '疊', 2),
(384, 1, 111, 1.0, 0, '0', 1, '2012-03-23 22:37:14', 12, 'nomal', '000192', 13, 11, 'unit', 0);

-- --------------------------------------------------------

--
-- 資料表格式： `product_history`
--

DROP TABLE IF EXISTS `product_history`;
CREATE TABLE IF NOT EXISTS `product_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `date` datetime NOT NULL,
  `is_purchase` bit(1) NOT NULL,
  `last_modify_by_id` bigint(20) NOT NULL,
  `last_updated` datetime NOT NULL,
  `memo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_id` bigint(20) NOT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `quantity` decimal(19,0) NOT NULL,
  `total_quantity` int(11) NOT NULL,
  `vendor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC8B4F9441B7C2B1D` (`project_id`),
  KEY `FKC8B4F944E623C052` (`last_modify_by_id`),
  KEY `FKC8B4F944F961D35D` (`product_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=21 ;

--
-- 列出以下資料庫的數據： `product_history`
--

INSERT INTO `product_history` (`id`, `version`, `date`, `is_purchase`, `last_modify_by_id`, `last_updated`, `memo`, `product_id`, `project_id`, `quantity`, `total_quantity`, `vendor`) VALUES
(1, 0, '2012-03-13 00:00:00', '0', 1, '2012-03-13 20:58:48', NULL, 280, 2, 1, 0, NULL),
(2, 0, '2012-03-13 21:17:48', '0', 1, '2012-03-13 21:17:48', NULL, 280, 2, -1, 0, NULL),
(3, 0, '2012-03-13 00:00:00', '0', 1, '2012-03-13 21:27:49', NULL, 280, 2, 1, 0, NULL),
(4, 0, '2012-03-13 21:28:17', '0', 1, '2012-03-13 21:28:17', NULL, 280, 2, -1, 0, NULL),
(5, 0, '2012-03-13 00:00:00', '0', 1, '2012-03-13 21:28:25', NULL, 280, 2, 1, 0, NULL),
(6, 0, '2012-03-13 21:31:51', '0', 1, '2012-03-13 21:31:51', NULL, 280, 2, -1, 0, NULL),
(7, 0, '2012-03-13 00:00:00', '0', 1, '2012-03-13 21:32:06', NULL, 280, 2, 1, 0, NULL),
(8, 0, '2012-03-13 00:00:00', '0', 1, '2012-03-13 22:06:11', NULL, 192, 2, 1, 0, '1'),
(9, 0, '2012-03-13 00:00:00', '0', 1, '2012-03-13 22:07:10', NULL, 192, 2, 2, 0, '3333'),
(10, 0, '2012-03-07 00:00:00', '0', 1, '2012-03-13 22:07:53', NULL, 347, 2, 1, 0, NULL),
(11, 0, '2012-03-14 04:00:00', '0', 1, '2012-03-13 22:08:07', NULL, 347, 2, 1, 0, NULL),
(12, 0, '2012-03-14 00:27:58', '0', 1, '2012-03-14 00:27:58', NULL, 192, 2, -1, 0, '1'),
(13, 0, '2012-03-14 00:28:25', '0', 1, '2012-03-14 00:28:25', NULL, 192, 2, -1, 0, '1'),
(14, 0, '2012-03-14 00:32:12', '0', 1, '2012-03-14 00:32:12', NULL, 192, 2, -1, 0, '1'),
(15, 0, '2012-03-14 00:32:28', '0', 1, '2012-03-14 00:32:28', NULL, 192, 2, -1, 0, '1'),
(16, 0, '2012-03-14 00:38:08', '0', 1, '2012-03-14 00:38:08', NULL, 192, 2, -1, 0, '1'),
(17, 0, '2012-03-14 00:39:15', '0', 1, '2012-03-14 00:39:15', NULL, 192, 2, -1, 0, '1'),
(18, 0, '2012-03-14 00:41:45', '0', 1, '2012-03-14 00:41:45', NULL, 192, 2, -1, 0, '1'),
(19, 0, '2012-03-13 00:00:00', '0', 1, '2012-03-14 00:41:45', NULL, 192, 2, 1, 0, '3333'),
(20, 0, '2012-03-24 00:00:00', '1', 1, '2012-03-23 22:37:14', NULL, 384, 2, 11, 11, '11');

-- --------------------------------------------------------

--
-- 資料表格式： `product_link_place`
--

DROP TABLE IF EXISTS `product_link_place`;
CREATE TABLE IF NOT EXISTS `product_link_place` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `cost_price` decimal(19,0) NOT NULL,
  `last_modify_by_id` bigint(20) NOT NULL,
  `last_updated` datetime NOT NULL,
  `place_id` bigint(20) NOT NULL,
  `price` decimal(19,0) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `salling_price` decimal(19,0) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4E54F5D2A216611D` (`place_id`),
  KEY `FK4E54F5D2E623C052` (`last_modify_by_id`),
  KEY `FK4E54F5D2F961D35D` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- 列出以下資料庫的數據： `product_link_place`
--


-- --------------------------------------------------------

--
-- 資料表格式： `project`
--

DROP TABLE IF EXISTS `project`;
CREATE TABLE IF NOT EXISTS `project` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `closer_id` bigint(20) DEFAULT NULL,
  `closing_date` datetime DEFAULT NULL,
  `contact` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_addr` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_addr_area` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_addr_city` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cost_total` decimal(19,2) NOT NULL,
  `emp_id` bigint(20) NOT NULL,
  `funeral_company_id` bigint(20) NOT NULL,
  `funeraler_id` bigint(20) NOT NULL,
  `in_date` datetime NOT NULL,
  `last_updated` datetime NOT NULL,
  `memo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `out_date` datetime DEFAULT NULL,
  `project_name` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `project_no` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  `salling_total` decimal(19,2) NOT NULL,
  `total` decimal(19,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKED904B19F1FE910B` (`closer_id`),
  KEY `FKED904B19C4CF7A7D` (`funeraler_id`),
  KEY `FKED904B197EF59148` (`funeral_company_id`),
  KEY `FKED904B19C140FEFD` (`emp_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- 列出以下資料庫的數據： `project`
--

INSERT INTO `project` (`id`, `version`, `closer_id`, `closing_date`, `contact`, `contact_addr`, `contact_addr_area`, `contact_addr_city`, `contact_phone`, `cost_total`, `emp_id`, `funeral_company_id`, `funeraler_id`, `in_date`, `last_updated`, `memo`, `out_date`, `project_name`, `project_no`, `salling_total`, `total`) VALUES
(2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 1, 1, 1, '2012-03-11 00:00:00', '2012-03-13 22:20:31', NULL, NULL, 'ddsd', '0000001', 0.00, 0.00);

--
-- 備份資料表限制
--

--
-- 資料表限制 `bill_detail`
--
ALTER TABLE `bill_detail`
  ADD CONSTRAINT `FKE363AB891B7C2B1D` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`),
  ADD CONSTRAINT `FKE363AB89A216611D` FOREIGN KEY (`place_id`) REFERENCES `place` (`id`),
  ADD CONSTRAINT `FKE363AB89E623C052` FOREIGN KEY (`last_modify_by_id`) REFERENCES `employee` (`id`),
  ADD CONSTRAINT `FKE363AB89F961D35D` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- 資料表限制 `calendar_data`
--
ALTER TABLE `calendar_data`
  ADD CONSTRAINT `FK74FC040BE623C052` FOREIGN KEY (`last_modify_by_id`) REFERENCES `employee` (`id`);

--
-- 資料表限制 `funeraler`
--
ALTER TABLE `funeraler`
  ADD CONSTRAINT `FKFAE8DA84DD20030D` FOREIGN KEY (`funeral_commpany_id`) REFERENCES `funeral_company` (`id`),
  ADD CONSTRAINT `FKFAE8DA84E623C052` FOREIGN KEY (`last_modify_by_id`) REFERENCES `employee` (`id`);

--
-- 資料表限制 `funeral_company`
--
ALTER TABLE `funeral_company`
  ADD CONSTRAINT `FKBCEDB3D5E623C052` FOREIGN KEY (`last_modify_by_id`) REFERENCES `employee` (`id`);

--
-- 資料表限制 `package`
--
ALTER TABLE `package`
  ADD CONSTRAINT `FKCFE53446E623C052` FOREIGN KEY (`last_modify_by_id`) REFERENCES `employee` (`id`);

--
-- 資料表限制 `package_link_product`
--
ALTER TABLE `package_link_product`
  ADD CONSTRAINT `FKF979610343219D4A` FOREIGN KEY (`pack_id`) REFERENCES `package` (`id`),
  ADD CONSTRAINT `FKF97961037E7283F5` FOREIGN KEY (`prod_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FKF9796103E623C052` FOREIGN KEY (`last_modify_by_id`) REFERENCES `employee` (`id`);

--
-- 資料表限制 `parameters`
--
ALTER TABLE `parameters`
  ADD CONSTRAINT `FK1B57C1EAE623C052` FOREIGN KEY (`last_modify_by_id`) REFERENCES `employee` (`id`);

--
-- 資料表限制 `place`
--
ALTER TABLE `place`
  ADD CONSTRAINT `FK65CD907E623C052` FOREIGN KEY (`last_modify_by_id`) REFERENCES `employee` (`id`);

--
-- 資料表限制 `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FKED8DCCEFE623C052` FOREIGN KEY (`last_modify_by_id`) REFERENCES `employee` (`id`);

--
-- 資料表限制 `product_history`
--
ALTER TABLE `product_history`
  ADD CONSTRAINT `FKC8B4F9441B7C2B1D` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`),
  ADD CONSTRAINT `FKC8B4F944E623C052` FOREIGN KEY (`last_modify_by_id`) REFERENCES `employee` (`id`),
  ADD CONSTRAINT `FKC8B4F944F961D35D` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- 資料表限制 `product_link_place`
--
ALTER TABLE `product_link_place`
  ADD CONSTRAINT `FK4E54F5D2A216611D` FOREIGN KEY (`place_id`) REFERENCES `place` (`id`),
  ADD CONSTRAINT `FK4E54F5D2E623C052` FOREIGN KEY (`last_modify_by_id`) REFERENCES `employee` (`id`),
  ADD CONSTRAINT `FK4E54F5D2F961D35D` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- 資料表限制 `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `FKED904B197EF59148` FOREIGN KEY (`funeral_company_id`) REFERENCES `funeral_company` (`id`),
  ADD CONSTRAINT `FKED904B19C140FEFD` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`id`),
  ADD CONSTRAINT `FKED904B19C4CF7A7D` FOREIGN KEY (`funeraler_id`) REFERENCES `funeraler` (`id`),
  ADD CONSTRAINT `FKED904B19F1FE910B` FOREIGN KEY (`closer_id`) REFERENCES `employee` (`id`);
