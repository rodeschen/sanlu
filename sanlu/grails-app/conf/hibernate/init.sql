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
(4, 0, 1, 'rick', '00000', 'M', '2012-03-07 23:47:56', '0', '7dcf9e908f427888228552938f171e44'),
(1, 0, 1, 'nick', '00001', 'M', '2012-03-07 23:47:56', '0', '7dcf9e908f427888228552938f171e44'),
(2, 0, 2, 'emp2', '00002', 'M', '2012-03-07 23:47:56', '0', '81dc9bdb52d04dc20036dbd8313ed055'),
(3, 0, 5, 'emp3', '00003', 'M', '2012-03-07 23:47:56', '0', '81dc9bdb52d04dc20036dbd8313ed055');

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

INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('10',0, 1, NOW(), '助念室(A)');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('11',0, 1, NOW(), '助念室(B)');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('12',0, 1, NOW(), '功德廳');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('13',0, 1, NOW(), '大忠廳');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('14',0, 1, NOW(), '至正廳');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('15',0, 1, NOW(), '協商室');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('16',0, 1, NOW(), '誦經室(一)');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('17',0, 1, NOW(), '誦經室(二)');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('18',0, 1, NOW(), '誦經室(三)');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('19',0, 1, NOW(), '誦經室(五)');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('20',0, 1, NOW(), '誦經至正(A)');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('21',0, 1, NOW(), '誦經至正(B)');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('22',0, 1, NOW(), '停棺室1');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('23',0, 1, NOW(), '停棺室2');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('24',0, 1, NOW(), '停棺室3');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('25',0, 1, NOW(), '停棺室4');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('26',0, 1, NOW(), '停棺室5');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('27',0, 1, NOW(), '停棺室6');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('28',0, 1, NOW(), '停棺室7');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('29',0, 1, NOW(), '停棺室8');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('30',0, 1, NOW(), '停棺室9');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('31',0, 1, NOW(), '停棺室10');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('32',0, 1, NOW(), '停棺室11');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('33',0, 1, NOW(), '停棺室12');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('34',0, 1, NOW(), '牌位1');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('35',0, 1, NOW(), '牌位2');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('36',0, 1, NOW(), '牌位3');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('37',0, 1, NOW(), '牌位4');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('38',0, 1, NOW(), '牌位5');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('39',0, 1, NOW(), '牌位6');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('40',0, 1, NOW(), '牌位7');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('41',0, 1, NOW(), '牌位8');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('42',0, 1, NOW(), '牌位9');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('43',0, 1, NOW(), '牌位10');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('44',0, 1, NOW(), '牌位11');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('45',0, 1, NOW(), '牌位12');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('46',0, 1, NOW(), '牌位13');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('47',0, 1, NOW(), '牌位14');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('48',0, 1, NOW(), '牌位15');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('49',0, 1, NOW(), '牌位16');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('50',0, 1, NOW(), '牌位17');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('51',0, 1, NOW(), '牌位18');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('52',0, 1, NOW(), '牌位19');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('53',0, 1, NOW(), '牌位20');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('54',0, 1, NOW(), '牌位21');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('55',0, 1, NOW(), '牌位22');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('56',0, 1, NOW(), '牌位23');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('57',0, 1, NOW(), '牌位24');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('58',0, 1, NOW(), '牌位25');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('59',0, 1, NOW(), '牌位26');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('60',0, 1, NOW(), '牌位27');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('61',0, 1, NOW(), '牌位28');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('62',0, 1, NOW(), '牌位29');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('63',0, 1, NOW(), '牌位30');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('64',0, 1, NOW(), '牌位31');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('65',0, 1, NOW(), '牌位32');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('66',0, 1, NOW(), '牌位33');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('67',0, 1, NOW(), '牌位34');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('68',0, 1, NOW(), '牌位35');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('69',0, 1, NOW(), '牌位36');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('70',0, 1, NOW(), '牌位37');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('71',0, 1, NOW(), '牌位38');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('72',0, 1, NOW(), '牌位39');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('73',0, 1, NOW(), '牌位40');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('74',0, 1, NOW(), '牌位41');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('75',0, 1, NOW(), '牌位42');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('76',0, 1, NOW(), '牌位43');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('77',0, 1, NOW(), '牌位44');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('78',0, 1, NOW(), '牌位45');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('79',0, 1, NOW(), '牌位46');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('80',0, 1, NOW(), '牌位47');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('81',0, 1, NOW(), '牌位48');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('82',0, 1, NOW(), '牌位49');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('83',0, 1, NOW(), '牌位50');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('84',0, 1, NOW(), '牌位51');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('85',0, 1, NOW(), '牌位52');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('86',0, 1, NOW(), '牌位53');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('87',0, 1, NOW(), '牌位54');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('88',0, 1, NOW(), '牌位55');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('89',0, 1, NOW(), '牌位56');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('90',0, 1, NOW(), '牌位57');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('91',0, 1, NOW(), '骨罐位1');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('92',0, 1, NOW(), '骨罐位2');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('93',0, 1, NOW(), '骨罐位3');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('94',0, 1, NOW(), '骨罐位4');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('95',0, 1, NOW(), '骨罐位5');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('96',0, 1, NOW(), '骨罐位6');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('97',0, 1, NOW(), '骨罐位7');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('98',0, 1, NOW(), '骨罐位8');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('99',0, 1, NOW(), '骨罐位9');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('100',0, 1, NOW(), '骨罐位10');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('101',0, 1, NOW(), '骨罐位11');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('102',0, 1, NOW(), '骨罐位12');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('103',0, 1, NOW(), '骨罐位13');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('104',0, 1, NOW(), '骨罐位14');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('105',0, 1, NOW(), '骨罐位15');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('106',0, 1, NOW(), '骨罐位16');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('107',0, 1, NOW(), '骨罐位17');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('108',0, 1, NOW(), '骨罐位18');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('109',0, 1, NOW(), '骨罐位19');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('110',0, 1, NOW(), '骨罐位20');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('111',0, 1, NOW(), '骨罐位21');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('112',0, 1, NOW(), '骨罐位22');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('113',0, 1, NOW(), '骨罐位23');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('114',0, 1, NOW(), '骨罐位24');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('115',0, 1, NOW(), '骨罐位25');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('116',0, 1, NOW(), '骨罐位26');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('117',0, 1, NOW(), '骨罐位27');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('118',0, 1, NOW(), '骨罐位28');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('119',0, 1, NOW(), '骨罐位29');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('120',0, 1, NOW(), '骨罐位30');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('121',0, 1, NOW(), '骨罐位31');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('122',0, 1, NOW(), '骨罐位32');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('123',0, 1, NOW(), '骨罐位33');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('124',0, 1, NOW(), '骨罐位34');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('125',0, 1, NOW(), '骨罐位35');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('126',0, 1, NOW(), '骨罐位36');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('127',0, 1, NOW(), '固定冰櫃1');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('128',0, 1, NOW(), '固定冰櫃2');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('129',0, 1, NOW(), '固定冰櫃3');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('130',0, 1, NOW(), '固定冰櫃4');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('131',0, 1, NOW(), '固定冰櫃5');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('132',0, 1, NOW(), '固定冰櫃6');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('133',0, 1, NOW(), '固定冰櫃7');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('134',0, 1, NOW(), '固定冰櫃8');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('135',0, 1, NOW(), '固定冰櫃9');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('136',0, 1, NOW(), '固定冰櫃10');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('137',0, 1, NOW(), '固定冰櫃11');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('138',0, 1, NOW(), '固定冰櫃12');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('139',0, 1, NOW(), '固定冰櫃13');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('140',0, 1, NOW(), '移動冰櫃1');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('141',0, 1, NOW(), '移動冰櫃2');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('142',0, 1, NOW(), '移動冰櫃3');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('143',0, 1, NOW(), '移動冰櫃4');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('144',0, 1, NOW(), '移動冰櫃5');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('145',0, 1, NOW(), '移動冰櫃6');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('146',0, 1, NOW(), '移動冰櫃7');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('147',0, 1, NOW(), '移動冰櫃8');
INSERT INTO `place` (`id`,`version`, `last_modify_by_id`, `last_updated`, `place_name`) VALUES ('148',0, 1, NOW(), '庫錢金爐');



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
INSERT INTO product (id,version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(385,0,0, 1,3,1, 3, 1, NOW() ,0, '火葬位停柩','000001',0, Null, '天');
INSERT INTO product (id,version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(386,0,0, 1,4,1, 3, 1, NOW() ,0, '土葬位停柩','000002',0, Null, '天');
INSERT INTO product (id,version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(387,0,0, 1,4,1, 3, 1, NOW() ,0, '固定式冰櫃冰存','000003',0, Null, '天');
INSERT INTO product (id,version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(388,0,0, 1,3,1, 3, 1, NOW() ,0, '移動式冰櫃冰存','000004',0, Null, '天');
INSERT INTO product (id,version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(389,0,0, 1,3,1, 3, 1, NOW() ,0, '靈位寄存','000005',0, Null, '天');
INSERT INTO product (id,version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(390,0,0, 1,3,1, 3, 1, NOW() ,0, '個人靈堂-大','000006',0, Null, '天');
INSERT INTO product (id,version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(391,0,0, 1,3,1, 3, 1, NOW() ,0, '個人靈堂-中','000007',0, Null, '天');
INSERT INTO product (id,version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(392,0,0, 1,3,1, 3, 1, NOW() ,0, '個人靈堂-小','000008',0, Null, '天');
INSERT INTO product (id,version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(393,0,0, 1,3,1, 3, 1, NOW() ,0, '個人靈堂-商','000009',0, Null, '天');
INSERT INTO product (id,version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(394,0,0, 1,3,1, 3, 1, NOW() ,0, '牌位暫存-普通位(天)','000010',0, Null, '天');
INSERT INTO product (id,version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(395,0,0, 1,4,1, 3, 1, NOW() ,0, '牌位暫存-普通位(1月)','000011',0, Null, '月');
INSERT INTO product (id,version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(396,0,0, 3,4,1, 3, 1, NOW() ,0, '牌位暫存-普通位(3月)','000012',0, Null, '月');
INSERT INTO product (id,version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(397,0,0, 6,4,1, 3, 1, NOW() ,0, '牌位暫存-普通位(6月)','000013',0, Null, '月');
INSERT INTO product (id,version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(398,0,0, 12,4,1, 3, 1, NOW() ,0, '牌位暫存-普通位(12月)','000014',0, Null, '月');
INSERT INTO product (id,version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(399,0,0, 1,3,1, 3, 1, NOW() ,0, '骨罐暫存(天)','000015',0, Null, '天');
INSERT INTO product (id,version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(400,0,0, 1,4,1, 3, 1, NOW() ,0, '骨罐暫存(1月)','000016',0, Null, '月');
INSERT INTO product (id,version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(401,0,0, 3,4,1, 3, 1, NOW() ,0, '骨罐暫存(3月)','000017',0, Null, '月');
INSERT INTO product (id,version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(402,0,0, 6,4,1, 3, 1, NOW() ,0, '骨罐暫存(6月)','000018',0, Null, '月');
INSERT INTO product (id,version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(403,0,0, 12,4,1, 3, 1, NOW() ,0, '骨罐暫存(12月)','000019',0, Null, '月');
INSERT INTO product (id,version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(404,0,0, 1,3,1, 3, 1, NOW() ,0, '牌位暫存-豪華位(天)','000020',0, Null, '天');
INSERT INTO product (id,version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(405,0,0, 1,4,1, 3, 1, NOW() ,0, '牌位暫存-豪華位(1月)','000021',0, Null, '月');
INSERT INTO product (id,version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(406,0,0, 3,4,1, 3, 1, NOW() ,0, '牌位暫存-豪華位(3月)','000022',0, Null, '月');
INSERT INTO product (id,version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(407,0,0, 6,4,1, 3, 1, NOW() ,0, '牌位暫存-豪華位(6月)','000023',0, Null, '月');
INSERT INTO product (id,version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(408,0,0, 12,4,1, 3, 1, NOW() ,0, '牌位暫存-豪華位(12月)','000024',0, Null, '月');
INSERT INTO product (id,version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(409,0,0, 1,0,1, 3, 1, NOW() ,0, '淨身場租','000025',0, Null, '次');
INSERT INTO product (id,version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(410,0,0, 1,0,1, 3, 1, NOW() ,0, '隔夜守靈','000026',0, Null, '次');
INSERT INTO product (id,version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(411,0,0, 1,2,1, 3, 1, NOW() ,0, '大忠廳功德場租','000027',0, Null, '時');
INSERT INTO product (id,version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(412,0,0, 1,2,1, 3, 1, NOW() ,0, '至正廳功德場租','000028',0, Null, '時');
INSERT INTO product (id,version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(413,0,0, 1,2,1, 3, 1, NOW() ,0, '大忠廳助念場租','000029',0, Null, '時');
INSERT INTO product (id,version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(414,0,0, 1,2,1, 3, 1, NOW() ,0, '至正廳助念場租','000030',0, Null, '時');
INSERT INTO product (id,version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(415,0,0, 1,2,1, 3, 1, NOW() ,0, '大忠廳入殮場租','000031',0, Null, '時');
INSERT INTO product (id,version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(416,0,0, 1,2,1, 3, 1, NOW() ,0, '至正廳入殮場租','000032',0, Null, '時');
INSERT INTO product (id,version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(417,0,0, 1,2,1, 3, 1, NOW() ,0, '大忠廳誦經場租','000033',0, Null, '時');
INSERT INTO product (id,version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(418,0,0, 1,2,1, 3, 1, NOW() ,0, '至正廳誦經場租','000034',0, Null, '時');
INSERT INTO product (id,version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(419,0,0, 1,2,1, 3, 1, NOW() ,0, '二樓功德場租','000035',0, Null, '時');
INSERT INTO product (id,version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(420,0,0, 1,2,1, 3, 1, NOW() ,0, '二樓誦經場租','000036',0, Null, '時');
INSERT INTO product (id,version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(421,0,0, 1,2,1, 3, 1, NOW() ,0, '一樓誦經場租','000037',0, Null, '時');
INSERT INTO product (id,version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(422,0,0, 1,2,1, 3, 1, NOW() ,0, '助念場租','000038',0, Null, '時');
INSERT INTO product (id,version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(423,0,0, 1,2,1, 3, 1, NOW() ,0, ' 入殮場租','000039',0, Null, '時');
INSERT INTO product (id,version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(424,0,0, 2,2,1, 3, 1, NOW() ,0, 'SPA場租2','000040',0, Null, '場');
INSERT INTO product (id,version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(425,0,0, 3,2,1, 3, 1, NOW() ,0, '告別禮廳-至正廳(上)','000041',0, Null, '場');
INSERT INTO product (id,version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(426,0,0, 3,2,1, 3, 1, NOW() ,0, '告別禮廳-至正廳(中)','000042',0, Null, '場');
INSERT INTO product (id,version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(427,0,0, 3,2,1, 3, 1, NOW() ,0, '告別禮廳-至正廳(下)','000043',0, Null, '場');
INSERT INTO product (id,version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(428,0,0, 3,2,1, 3, 1, NOW() ,0, '告別禮廳-大忠廳(上)','000044',0, Null, '場');
INSERT INTO product (id,version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(429,0,0, 3,2,1, 3, 1, NOW() ,0, '告別禮廳-大忠廳(中)','000045',0, Null, '場');
INSERT INTO product (id,version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(430,0,0, 3,2,1, 3, 1, NOW() ,0, '告別禮廳-大忠廳(下)','000046',0, Null, '場');
INSERT INTO product (id,version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(431,0,0, 3,2,1, 3, 1, NOW() ,0, '告別禮廳-助念室(上)','000047',0, Null, '場');
INSERT INTO product (id,version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(432,0,0, 3,2,1, 3, 1, NOW() ,0, '告別禮廳-助念室(中)','000048',0, Null, '場');
INSERT INTO product (id,version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(433,0,0, 3,2,1, 3, 1, NOW() ,0, '告別禮廳-助念室(下)','000049',0, Null, '場');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,100, 1,0,0, 2, 1, NOW(), 120, '發糕2','000050',120, 0, '組');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,50, 1,3,0, 1, 1, NOW(), 50, '臉盆水逾期','000051',50, Null, '天');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,4, 1,0,0, 0, 1, NOW(), 5, '大銀(散裝)','000052',5, 0, '支');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,4, 1,0,0, 0, 1, NOW(), 5, '小銀(散裝)','000053',5, 0, '支');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,4, 1,0,0, 0, 1, NOW(), 5, '刈金(散裝)','000054',5, 0, '支');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,4, 1,0,0, 0, 1, NOW(), 5, '壽金(散裝)','000055',5, 0, '支');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,4, 1,0,0, 0, 1, NOW(), 5, '福金(散裝)','000056',5, 0, '支');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,60, 1,0,0, 2, 1, NOW(), 80, '捻香粉','000057',80, 0, '斤');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,90, 1,0,0, 0, 1, NOW(), 150, '白雙連','000058',150, 0, '包');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,90, 1,0,0, 0, 1, NOW(), 150, '紅雙連','000059',150, 0, '包');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,15, 1,0,0, 0, 1, NOW(), 30, '白包袋','000060',30, 0, '包');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,15, 1,0,0, 0, 1, NOW(), 30, '紅包袋','000061',30, 0, '包');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,80, 1,0,0, 0, 1, NOW(), 100, '胸花','000062',100, 0, '包');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,55, 1,0,0, 0, 1, NOW(), 65, '往生蓮花紙','000063',65, 0, '包');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,60, 1,0,0, 0, 1, NOW(), 75, '單面彩色蓮花紙','000064',75, 0, '包');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,65, 1,0,0, 0, 1, NOW(), 85, '雙面彩色元寶紙','000065',85, 0, '包');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,8, 1,0,0, 2, 1, NOW(), 10, '香爐粉','000066',10, 0, '包');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,80, 1,0,0, 0, 1, NOW(), 100, '金元寶','000067',100, 0, '包');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,80, 1,0,0, 0, 1, NOW(), 100, '銀元寶','000068',100, 0, '包');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,5, 1,0,0, 0, 1, NOW(), 10, '金炮燭','000069',10, 0, '包');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,25, 1,0,0, 0, 1, NOW(), 35, '禮簿','000070',35, 0, '本');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,25, 1,0,0, 0, 1, NOW(), 35, '題名簿','000071',35, 0, '本');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,25, 1,0,0, 0, 1, NOW(), 35, '謝簿','000072',35, 0, '本');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,45, 1,0,0, 0, 1, NOW(), 80, '貼肉仁','000073',80, 0, '件');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,10, 1,0,0, 0, 1, NOW(), 30, '長袖雨衣','000074',30, 0, '件');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,200, 50,0,0, 0, 1, NOW(), 250, '大銀(50/件)','000075',250, 0, '支');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,200, 63,0,0, 0, 1, NOW(), 250, '小銀(63/件)','000076',250, 0, '支');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,200, 50,0,0, 0, 1, NOW(), 250, '刈金(50/件)','000077',250, 0, '支');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,200, 50,0,0, 0, 1, NOW(), 250, '壽金(50/件)','000078',250, 0, '支');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,200, 50,0,0, 0, 1, NOW(), 250, '福金(50/件)','000079',250, 0, '支');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,190, 1,0,0, 0, 1, NOW(), 250, '麻衣','000080',250, 0, '件');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,90, 1,0,0, 0, 1, NOW(), 100, '苧衣','000081',100, 0, '件');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,30, 1,0,0, 0, 1, NOW(), 50, '女頭罩','000082',50, 0, '件');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,120, 1,0,0, 0, 1, NOW(), 150, '女婿服','000083',150, 0, '件');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,130, 1,0,0, 0, 1, NOW(), 150, '男用白袍','000084',150, 0, '件');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,80, 1,0,0, 0, 1, NOW(), 100, '第三代孝服','000085',100, 0, '件');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,40, 1,0,0, 0, 1, NOW(), 50, '第三代頭罩','000086',50, 0, '件');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,80, 1,0,0, 0, 1, NOW(), 100, '第五代孝服','000087',100, 0, '件');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,40, 1,0,0, 0, 1, NOW(), 50, '第五代頭罩','000088',50, 0, '件');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,600, 1,0,0, 2, 1, NOW(), 750, '素三牲','000089',750, 0, '份');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,600, 1,0,0, 2, 1, NOW(), 750, '葷三牲','000090',750, 0, '份');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,1400, 1,0,0, 2, 1, NOW(), 1500, '素五牲','000091',1500, 0, '份');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,1400, 1,0,0, 2, 1, NOW(), 1600, '五牲-豬頭','000092',1600, 0, '份');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,1500, 1,0,0, 2, 1, NOW(), 1600, '五牲-原蹄','000093',1600, 0, '份');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,1500, 1,0,0, 2, 1, NOW(), 1700, '五牲-全豬頭','000094',1700, 0, '份');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,150, 1,0,0, 2, 1, NOW(), 250, '素小三牲','000095',250, 0, '份');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,150, 1,0,0, 2, 1, NOW(), 250, '葷小三牲','000096',250, 0, '份');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,300, 1,0,0, 2, 1, NOW(), 350, '四果','000097',350, 0, '份');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,100, 1,0,0, 2, 1, NOW(), 200, '綜合果','000098',200, 0, '份');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,300, 1,0,0, 2, 1, NOW(), 350, '十二菜碗','000099',350, 0, '份');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,150, 1,0,0, 2, 1, NOW(), 200, '六菜碗','000100',200, 0, '份');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,9000, 1,0,0, 2, 1, NOW(), 12800, '羽蝶A款','000101',12800, 0, '式');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,10000, 1,0,0, 2, 1, NOW(), 13800, '羽蝶B款','000102',13800, 0, '式');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,10000, 1,0,0, 2, 1, NOW(), 13800, '羽蝶C款','000103',13800, 0, '式');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,17000, 1,0,0, 2, 1, NOW(), 20800, '羽蝶淨化組合A','000104',20800, 0, '式');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,18000, 1,0,0, 2, 1, NOW(), 21800, '羽蝶淨化組合B','000105',21800, 0, '式');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,18000, 1,0,0, 2, 1, NOW(), 21800, '羽蝶淨化組合C','000106',21800, 0, '式');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,3000, 1,0,0, 2, 1, NOW(), 3500, '移動式冰櫃下架費','000107',3500, 0, '趟');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,1500, 1,0,0, 2, 1, NOW(), 3000, '淨身服務(IN)','000108',3000, 0, '次');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,2400, 1,0,0, 2, 1, NOW(), 3000, '淨身服務(O)','000109',3000, 0, '次');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,2500, 1,0,0, 2, 1, NOW(), 3000, '淨身服務(S)','000110',3000, 0, '次');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,1800, 1,0,0, 2, 1, NOW(), 3000, '淨身服務(O)(IN)','000111',3000, 0, '次');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,38, 1,0,0, 0, 1, NOW(), 150, '庫錢','000112',150, 0, '包');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,38, 1,0,0, 0, 1, NOW(), 150, '庫錢(O)','000113',150, 0, '包');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,52, 1,0,0, 0, 1, NOW(), 80, '壽內庫錢','000114',80, 0, '包');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,415, 1,3,0, 2, 1, NOW(), 800, '臉盆水服務','000115',800, 0, '式');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,1200, 1,0,0, 2, 1, NOW(), 1500, 'LED外牌地毯','000116',1500, 0, '次');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,2000, 1,0,0, 2, 1, NOW(), 3000, '全採LED投射燈租用','000117',3000, 0, '次');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,35, 1,0,0, 2, 1, NOW(), 40, '紅龜','000118',40, 0, '個');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,35, 1,0,0, 2, 1, NOW(), 40, '發糕','000119',40, 0, '個');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,10, 1,0,0, 2, 1, NOW(), 12, '水煮蛋','000120',12, 0, '個');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,150, 1,0,0, 2, 1, NOW(), 150, '大發粿','000121',150, 0, '個');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,12, 1,0,0, 2, 1, NOW(), 15, '鹹鴨蛋','000122',15, 0, '個');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,30, 1,0,0, 2, 1, NOW(), 50, '乳頭糕','000123',50, 0, '個');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,60, 1,0,0, 2, 1, NOW(), 80, '筆架糕','000124',80, 0, '個');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,60, 1,0,0, 2, 1, NOW(), 80, '筆架山糕','000125',80, 0, '個');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,50, 1,0,0, 0, 1, NOW(), 80, '竹圈','000126',80, 0, '個');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,50, 1,0,0, 0, 1, NOW(), 80, '香爐','000127',80, 0, '個');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,18, 1,0,0, 0, 1, NOW(), 18, '空冥大箱','000128',18, 0, '個');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,5, 1,0,0, 0, 1, NOW(), 5, '紅百寶袋','000129',5, 0, '個');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,28, 1,0,0, 0, 1, NOW(), 35, '紅皮箱','000130',35, 0, '個');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,45, 1,0,0, 0, 1, NOW(), 100, '牌位(彿)','000131',100, 0, '個');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,45, 1,0,0, 0, 1, NOW(), 100, '牌位(道)','000132',100, 0, '個');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,200, 1,0,0, 0, 1, NOW(), 600, '念彿機','000133',600, 0, '個');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,25, 1,0,0, 0, 1, NOW(), 100, '魂幡布(彿)','000134',100, 0, '個');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,25, 1,0,0, 0, 1, NOW(), 100, '魂幡布(道)','000135',100, 0, '個');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,120, 1,0,0, 0, 1, NOW(), 200, '水被(彿)','000136',200, 0, '個');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,120, 1,0,0, 0, 1, NOW(), 200, '水被(道)','000137',200, 0, '個');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,70, 1,0,0, 0, 1, NOW(), 100, '乞水盆','000138',100, 0, '個');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,120, 1,0,0, 0, 1, NOW(), 180, '木製牌位','000139',180, 0, '個');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,100, 1,0,0, 0, 1, NOW(), 300, '卍字被(黃)','000140',300, 0, '個');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,100, 1,0,0, 0, 1, NOW(), 300, '卍字被(紅)','000141',300, 0, '個');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,40, 1,0,0, 0, 1, NOW(), 100, '往生被','000142',100, 0, '個');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,30, 1,0,0, 0, 1, NOW(), 50, '男麻草圈','000143',50, 0, '個');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,30, 1,0,0, 0, 1, NOW(), 50, '男綁頭','000144',50, 0, '個');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,1000, 1,0,0, 0, 1, NOW(), 1450, '壽衣-男西裝','000145',1450, 0, '套');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,1000, 1,0,0, 0, 1, NOW(), 1450, '壽衣-鳳仙裝','000146',1450, 0, '套');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,1000, 1,0,0, 0, 1, NOW(), 1450, '壽衣-女絲緞','000147',1450, 0, '套');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,30, 1,0,0, 0, 1, NOW(), 30, '紅絲線','000148',30, 0, '捆');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,10, 1,0,0, 0, 1, NOW(), 20, '五色線','000149',20, 0, '捆');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,33, 1,0,0, 0, 1, NOW(), 70, '回禮毛巾','000150',70, 0, '條');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,30, 1,0,0, 0, 1, NOW(), 35, '七呎紅布','000151',35, 0, '條');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,120, 1,0,0, 0, 1, NOW(), 200, '一般清白巾禮盒','000152',200, 0, '盒');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,25, 1,0,0, 0, 1, NOW(), 35, '環香','000153',35, 0, '盒');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,200, 1,0,0, 0, 1, NOW(), 200, '項鍊戒指組','000154',200, 0, '盒');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,50, 1,0,0, 0, 1, NOW(), 300, '冥大','000155',300, 0, '盒');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,200, 1,0,0, 0, 1, NOW(), 600, '財寶盒','000156',600, 0, '盒');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,150, 1,0,0, 0, 1, NOW(), 600, '黃金萬兩','000157',600, 0, '盒');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,650, 1,0,0, 2, 1, NOW(), 650, '代洗燈片','000158',650, 0, '組');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,600, 1,0,0, 2, 1, NOW(), 600, '代洗相片','000159',600, 0, '組');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,58, 1,0,0, 0, 1, NOW(), 150, '藥壺','000160',150, 0, '組');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,80, 1,0,0, 0, 1, NOW(), 120, '童男女','000161',120, 0, '組');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,60, 1,0,0, 0, 1, NOW(), 150, '壽內用品','000162',150, 0, '組');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,300, 1,0,0, 1, 1, NOW(), 600, '靈屋清潔費','000163',600, Null, '棟');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,300, 1,0,0, 1, 1, NOW(), 600, '場地清潔費','000164',600, Null, '棟');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,30, 1,0,0, 1, 1, NOW(), 50, '庫錢清潔費','000165',50, Null, '包');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,250, 1,0,0, 2, 1, NOW(), 600, '元寶船','000166',600, 0, '搜');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,35, 1,0,0, 2, 1, NOW(), 40, '湯圓','000167',40, 0, '碗');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,200, 1,0,0, 2, 1, NOW(), 300, '代換瓶花-小','000168',300, 0, '對');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,150, 1,0,0, 2, 1, NOW(), 300, '代換瓶花-大','000169',300, 0, '對');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,600, 1,0,0, 2, 1, NOW(), 1200, '代換前蘭花','000170',1200, 0, '對');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,800, 1,0,0, 2, 1, NOW(), 1000, '高架花籃','000171',1000, 0, '對');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,1000, 1,0,0, 2, 1, NOW(), 1200, '高架花籃2','000172',1200, 0, '對');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,1200, 1,0,0, 2, 1, NOW(), 1500, '高架花籃3','000173',1500, 0, '對');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,1400, 1,0,0, 2, 1, NOW(), 2000, '罐頭塔-五層(品牌)','000174',2000, 0, '對');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,2200, 1,0,0, 2, 1, NOW(), 3000, '罐頭塔-七層(品牌)','000175',3000, 0, '對');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,1100, 1,0,0, 2, 1, NOW(), 1700, '罐頭塔-五層(果汁)','000176',1700, 0, '對');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,2000, 1,0,0, 2, 1, NOW(), 2700, '罐頭塔-七層(果汁)','000177',2700, 0, '對');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,70, 1,0,0, 0, 1, NOW(), 100, '壽禮燭','000178',100, 0, '對');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,70, 1,0,0, 0, 1, NOW(), 100, '大斗燭','000179',100, 0, '對');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,70, 1,0,0, 0, 1, NOW(), 100, '光神胖胖燭','000180',100, 0, '對');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,35, 1,0,0, 0, 1, NOW(), 100, '寶光洋燭','000181',100, 0, '對');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,25, 1,0,0, 0, 1, NOW(), 60, '彿杯(黃)','000182',60, 0, '對');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,25, 1,0,0, 0, 1, NOW(), 60, '彿杯(紅)','000183',60, 0, '對');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,35, 1,0,0, 0, 1, NOW(), 60, '葫蘆燭(黃)','000184',60, 0, '對');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,35, 1,0,0, 0, 1, NOW(), 60, '葫蘆燭(紅)','000185',60, 0, '對');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,100, 1,0,0, 2, 1, NOW(), 200, '代換水果','000186',200, 0, '盤');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,1500, 1,0,0, 2, 1, NOW(), 1500, '接體車-北部','000187',1500, 0, '趟');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,5, 1,0,0, 0, 1, NOW(), 10, '小酥油粒','000188',10, 0, '顆');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,100, 1,0,0, 2, 1, NOW(), 100, '一般菜盤','000189',100, 0, '籃');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,150, 1,0,0, 2, 1, NOW(), 150, '高級菜盤','000190',150, 0, '籃');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,800, 1,0,0, 2, 1, NOW(), 1000, '水果籃','000191',1000, 0, '籃');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,1000, 1,0,0, 2, 1, NOW(), 1200, '水果籃2','000192',1200, 0, '籃');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,3, 1,0,0, 0, 1, NOW(), 10, '孝誌','000193',10, 0, '疊');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,3, 1,0,0, 0, 1, NOW(), 10, '手尾錢','000194',10, 0, '疊');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,25, 1,0,0, 0, 1, NOW(), 100, '竹子','000195',100, 0, '疊');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,20, 1,0,0, 0, 1, NOW(), 50, '台幣','000196',50, 0, '疊');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,20, 1,0,0, 0, 1, NOW(), 50, '美金','000197',50, 0, '疊');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,20, 1,0,0, 0, 1, NOW(), 50, '佛祖幣','000198',50, 0, '疊');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,20, 1,0,0, 0, 1, NOW(), 50, '人民幣','000199',50, 0, '疊');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,1000, 1,0,0, 1, 1, NOW(), 3000, '投影機租用','000200',3000, Null, '次');
INSERT INTO product (version, cost_price, cost_range, cost_unit, has_place, product_type, last_modify_by_id, last_updated, price, product_name, product_no, salling_price, total_quantity, unit) VALUES(0,1000, 1,0,0, 1, 1, NOW(), 1000, 'SPA場租','000201',1000, Null, '次');


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
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 320,  '1',  NOW(),  '22',  320,  '385',  500);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 320,  '1',  NOW(),  '23',  320,  '385',  500);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 320,  '1',  NOW(),  '24',  320,  '385',  500);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 320,  '1',  NOW(),  '25',  320,  '385',  500);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 320,  '1',  NOW(),  '26',  320,  '385',  500);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 320,  '1',  NOW(),  '27',  320,  '385',  500);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 320,  '1',  NOW(),  '28',  320,  '385',  500);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 320,  '1',  NOW(),  '29',  320,  '385',  500);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 320,  '1',  NOW(),  '30',  320,  '385',  500);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 320,  '1',  NOW(),  '31',  320,  '385',  500);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 400,  '1',  NOW(),  '32',  400,  '386',  500);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 400,  '1',  NOW(),  '33',  400,  '386',  500);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 300,  '1',  NOW(),  '127',  400,  '387',  500);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 300,  '1',  NOW(),  '128',  400,  '387',  500);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 300,  '1',  NOW(),  '129',  400,  '387',  500);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 300,  '1',  NOW(),  '130',  400,  '387',  500);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 300,  '1',  NOW(),  '131',  400,  '387',  500);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 300,  '1',  NOW(),  '132',  400,  '387',  500);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 300,  '1',  NOW(),  '133',  400,  '387',  500);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 300,  '1',  NOW(),  '134',  400,  '387',  500);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 300,  '1',  NOW(),  '135',  400,  '387',  500);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 300,  '1',  NOW(),  '136',  400,  '387',  500);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 300,  '1',  NOW(),  '137',  400,  '387',  500);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 300,  '1',  NOW(),  '138',  400,  '387',  500);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 300,  '1',  NOW(),  '139',  400,  '387',  500);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 250,  '1',  NOW(),  '140',  500,  '388',  550);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 250,  '1',  NOW(),  '141',  500,  '388',  550);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 250,  '1',  NOW(),  '142',  500,  '388',  550);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 250,  '1',  NOW(),  '143',  500,  '388',  550);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 250,  '1',  NOW(),  '144',  500,  '388',  550);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 250,  '1',  NOW(),  '145',  500,  '388',  550);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 250,  '1',  NOW(),  '146',  500,  '388',  550);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 250,  '1',  NOW(),  '147',  500,  '388',  550);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 240,  '1',  NOW(),  '34',  240,  '389',  300);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 240,  '1',  NOW(),  '35',  240,  '389',  300);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 240,  '1',  NOW(),  '36',  240,  '389',  300);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 240,  '1',  NOW(),  '37',  240,  '389',  300);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 240,  '1',  NOW(),  '38',  240,  '389',  300);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 240,  '1',  NOW(),  '39',  240,  '389',  300);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 240,  '1',  NOW(),  '40',  240,  '389',  300);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 240,  '1',  NOW(),  '41',  240,  '389',  300);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 240,  '1',  NOW(),  '42',  240,  '389',  300);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 240,  '1',  NOW(),  '43',  240,  '389',  300);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 240,  '1',  NOW(),  '44',  240,  '389',  300);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 240,  '1',  NOW(),  '45',  240,  '389',  300);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 240,  '1',  NOW(),  '46',  240,  '389',  300);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 240,  '1',  NOW(),  '47',  240,  '389',  300);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 240,  '1',  NOW(),  '48',  240,  '389',  300);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 240,  '1',  NOW(),  '49',  240,  '389',  300);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 240,  '1',  NOW(),  '50',  240,  '389',  300);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 240,  '1',  NOW(),  '51',  240,  '389',  300);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 240,  '1',  NOW(),  '52',  240,  '389',  300);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 240,  '1',  NOW(),  '53',  240,  '389',  300);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 240,  '1',  NOW(),  '54',  240,  '389',  300);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 240,  '1',  NOW(),  '55',  240,  '389',  300);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 240,  '1',  NOW(),  '56',  240,  '389',  300);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 240,  '1',  NOW(),  '57',  240,  '389',  300);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 240,  '1',  NOW(),  '58',  240,  '389',  300);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 240,  '1',  NOW(),  '59',  240,  '389',  300);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 240,  '1',  NOW(),  '60',  240,  '389',  300);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 240,  '1',  NOW(),  '61',  240,  '389',  300);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 240,  '1',  NOW(),  '62',  240,  '389',  300);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 240,  '1',  NOW(),  '63',  240,  '389',  300);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 240,  '1',  NOW(),  '64',  240,  '389',  300);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 240,  '1',  NOW(),  '65',  240,  '389',  300);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 240,  '1',  NOW(),  '66',  240,  '389',  300);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 240,  '1',  NOW(),  '67',  240,  '389',  300);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 240,  '1',  NOW(),  '68',  240,  '389',  300);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 240,  '1',  NOW(),  '69',  240,  '389',  300);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 240,  '1',  NOW(),  '90',  240,  '389',  300);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2500,  '1',  NOW(),  '18',  2400,  '390',  3000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2000,  '1',  NOW(),  '16',  2000,  '391',  2500);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 1500,  '1',  NOW(),  '17',  1600,  '392',  2000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2000,  '1',  NOW(),  '15',  2000,  '393',  2500);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 100,  '1',  NOW(),  '70',  100,  '394',  100);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 100,  '1',  NOW(),  '71',  100,  '394',  100);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 100,  '1',  NOW(),  '72',  100,  '394',  100);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 100,  '1',  NOW(),  '73',  100,  '394',  100);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 100,  '1',  NOW(),  '74',  100,  '394',  100);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 100,  '1',  NOW(),  '75',  100,  '394',  100);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 100,  '1',  NOW(),  '76',  100,  '394',  100);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 100,  '1',  NOW(),  '77',  100,  '394',  100);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 100,  '1',  NOW(),  '78',  100,  '394',  100);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 100,  '1',  NOW(),  '79',  100,  '394',  100);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 100,  '1',  NOW(),  '80',  100,  '394',  100);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 100,  '1',  NOW(),  '81',  100,  '394',  100);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 100,  '1',  NOW(),  '82',  100,  '394',  100);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 100,  '1',  NOW(),  '83',  100,  '394',  100);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 100,  '1',  NOW(),  '84',  100,  '394',  100);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 100,  '1',  NOW(),  '85',  100,  '394',  100);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 100,  '1',  NOW(),  '86',  100,  '394',  100);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 100,  '1',  NOW(),  '87',  100,  '394',  100);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 100,  '1',  NOW(),  '88',  100,  '394',  100);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 100,  '1',  NOW(),  '89',  100,  '394',  100);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 500,  '1',  NOW(),  '70',  1000,  '395',  3000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 500,  '1',  NOW(),  '71',  1000,  '395',  3000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 500,  '1',  NOW(),  '72',  1000,  '395',  3000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 500,  '1',  NOW(),  '73',  1000,  '395',  3000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 500,  '1',  NOW(),  '74',  1000,  '395',  3000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 500,  '1',  NOW(),  '75',  1000,  '395',  3000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 500,  '1',  NOW(),  '76',  1000,  '395',  3000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 500,  '1',  NOW(),  '77',  1000,  '395',  3000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 500,  '1',  NOW(),  '78',  1000,  '395',  3000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 500,  '1',  NOW(),  '79',  1000,  '395',  3000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 500,  '1',  NOW(),  '80',  1000,  '395',  3000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 500,  '1',  NOW(),  '81',  1000,  '395',  3000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 500,  '1',  NOW(),  '82',  1000,  '395',  3000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 500,  '1',  NOW(),  '83',  1000,  '395',  3000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 500,  '1',  NOW(),  '84',  1000,  '395',  3000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 500,  '1',  NOW(),  '85',  1000,  '395',  3000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 500,  '1',  NOW(),  '86',  1000,  '395',  3000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 500,  '1',  NOW(),  '87',  1000,  '395',  3000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 500,  '1',  NOW(),  '88',  1000,  '395',  3000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 500,  '1',  NOW(),  '89',  1000,  '395',  3000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2000,  '1',  NOW(),  '70',  3000,  '396',  7000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2000,  '1',  NOW(),  '71',  3000,  '396',  7000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2000,  '1',  NOW(),  '72',  3000,  '396',  7000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2000,  '1',  NOW(),  '73',  3000,  '396',  7000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2000,  '1',  NOW(),  '74',  3000,  '396',  7000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2000,  '1',  NOW(),  '75',  3000,  '396',  7000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2000,  '1',  NOW(),  '76',  3000,  '396',  7000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2000,  '1',  NOW(),  '77',  3000,  '396',  7000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2000,  '1',  NOW(),  '78',  3000,  '396',  7000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2000,  '1',  NOW(),  '79',  3000,  '396',  7000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2000,  '1',  NOW(),  '80',  3000,  '396',  7000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2000,  '1',  NOW(),  '81',  3000,  '396',  7000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2000,  '1',  NOW(),  '82',  3000,  '396',  7000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2000,  '1',  NOW(),  '83',  3000,  '396',  7000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2000,  '1',  NOW(),  '84',  3000,  '396',  7000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2000,  '1',  NOW(),  '85',  3000,  '396',  7000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2000,  '1',  NOW(),  '86',  3000,  '396',  7000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2000,  '1',  NOW(),  '87',  3000,  '396',  7000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2000,  '1',  NOW(),  '88',  3000,  '396',  7000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2000,  '1',  NOW(),  '89',  3000,  '396',  7000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '70',  6000,  '397',  12000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '71',  6000,  '397',  12000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '72',  6000,  '397',  12000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '73',  6000,  '397',  12000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '74',  6000,  '397',  12000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '75',  6000,  '397',  12000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '76',  6000,  '397',  12000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '77',  6000,  '397',  12000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '78',  6000,  '397',  12000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '79',  6000,  '397',  12000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '80',  6000,  '397',  12000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '81',  6000,  '397',  12000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '82',  6000,  '397',  12000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '83',  6000,  '397',  12000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '84',  6000,  '397',  12000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '85',  6000,  '397',  12000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '86',  6000,  '397',  12000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '87',  6000,  '397',  12000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '88',  6000,  '397',  12000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '89',  6000,  '397',  12000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 19000,  '1',  NOW(),  '70',  19000,  '398',  19000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 19000,  '1',  NOW(),  '71',  19000,  '398',  19000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 19000,  '1',  NOW(),  '72',  19000,  '398',  19000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 19000,  '1',  NOW(),  '73',  19000,  '398',  19000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 19000,  '1',  NOW(),  '74',  19000,  '398',  19000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 19000,  '1',  NOW(),  '75',  19000,  '398',  19000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 19000,  '1',  NOW(),  '76',  19000,  '398',  19000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 19000,  '1',  NOW(),  '77',  19000,  '398',  19000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 19000,  '1',  NOW(),  '78',  19000,  '398',  19000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 19000,  '1',  NOW(),  '79',  19000,  '398',  19000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 19000,  '1',  NOW(),  '80',  19000,  '398',  19000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 19000,  '1',  NOW(),  '81',  19000,  '398',  19000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 19000,  '1',  NOW(),  '82',  19000,  '398',  19000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 19000,  '1',  NOW(),  '83',  19000,  '398',  19000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 19000,  '1',  NOW(),  '84',  19000,  '398',  19000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 19000,  '1',  NOW(),  '85',  19000,  '398',  19000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 19000,  '1',  NOW(),  '86',  19000,  '398',  19000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 19000,  '1',  NOW(),  '87',  19000,  '398',  19000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 19000,  '1',  NOW(),  '88',  19000,  '398',  19000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 19000,  '1',  NOW(),  '89',  19000,  '398',  19000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 100,  '1',  NOW(),  '91',  100,  '399',  100);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 100,  '1',  NOW(),  '92',  100,  '399',  100);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 100,  '1',  NOW(),  '93',  100,  '399',  100);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 100,  '1',  NOW(),  '94',  100,  '399',  100);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 100,  '1',  NOW(),  '95',  100,  '399',  100);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 100,  '1',  NOW(),  '96',  100,  '399',  100);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 100,  '1',  NOW(),  '97',  100,  '399',  100);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 100,  '1',  NOW(),  '98',  100,  '399',  100);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 100,  '1',  NOW(),  '99',  100,  '399',  100);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 100,  '1',  NOW(),  '100',  100,  '399',  100);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 100,  '1',  NOW(),  '101',  100,  '399',  100);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 100,  '1',  NOW(),  '102',  100,  '399',  100);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 100,  '1',  NOW(),  '103',  100,  '399',  100);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 100,  '1',  NOW(),  '104',  100,  '399',  100);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 100,  '1',  NOW(),  '105',  100,  '399',  100);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 100,  '1',  NOW(),  '106',  100,  '399',  100);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 100,  '1',  NOW(),  '107',  100,  '399',  100);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 100,  '1',  NOW(),  '108',  100,  '399',  100);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 100,  '1',  NOW(),  '109',  100,  '399',  100);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 100,  '1',  NOW(),  '110',  100,  '399',  100);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 100,  '1',  NOW(),  '111',  100,  '399',  100);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 100,  '1',  NOW(),  '112',  100,  '399',  100);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 100,  '1',  NOW(),  '113',  100,  '399',  100);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 100,  '1',  NOW(),  '114',  100,  '399',  100);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 100,  '1',  NOW(),  '115',  100,  '399',  100);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 100,  '1',  NOW(),  '116',  100,  '399',  100);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 100,  '1',  NOW(),  '117',  100,  '399',  100);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 100,  '1',  NOW(),  '118',  100,  '399',  100);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 100,  '1',  NOW(),  '119',  100,  '399',  100);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 100,  '1',  NOW(),  '120',  100,  '399',  100);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 100,  '1',  NOW(),  '121',  100,  '399',  100);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 100,  '1',  NOW(),  '122',  100,  '399',  100);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 100,  '1',  NOW(),  '123',  100,  '399',  100);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 100,  '1',  NOW(),  '124',  100,  '399',  100);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 100,  '1',  NOW(),  '125',  100,  '399',  100);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 100,  '1',  NOW(),  '126',  100,  '399',  100);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2500,  '1',  NOW(),  '91',  1000,  '400',  3000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2500,  '1',  NOW(),  '92',  1000,  '400',  3000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2500,  '1',  NOW(),  '93',  1000,  '400',  3000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2500,  '1',  NOW(),  '94',  1000,  '400',  3000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2500,  '1',  NOW(),  '95',  1000,  '400',  3000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2500,  '1',  NOW(),  '96',  1000,  '400',  3000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2500,  '1',  NOW(),  '97',  1000,  '400',  3000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2500,  '1',  NOW(),  '98',  1000,  '400',  3000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2500,  '1',  NOW(),  '99',  1000,  '400',  3000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2500,  '1',  NOW(),  '100',  1000,  '400',  3000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2500,  '1',  NOW(),  '101',  1000,  '400',  3000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2500,  '1',  NOW(),  '102',  1000,  '400',  3000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2500,  '1',  NOW(),  '103',  1000,  '400',  3000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2500,  '1',  NOW(),  '104',  1000,  '400',  3000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2500,  '1',  NOW(),  '105',  1000,  '400',  3000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2500,  '1',  NOW(),  '106',  1000,  '400',  3000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2500,  '1',  NOW(),  '107',  1000,  '400',  3000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2500,  '1',  NOW(),  '108',  1000,  '400',  3000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2500,  '1',  NOW(),  '109',  1000,  '400',  3000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2500,  '1',  NOW(),  '110',  1000,  '400',  3000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2500,  '1',  NOW(),  '111',  1000,  '400',  3000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2500,  '1',  NOW(),  '112',  1000,  '400',  3000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2500,  '1',  NOW(),  '113',  1000,  '400',  3000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2500,  '1',  NOW(),  '114',  1000,  '400',  3000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2500,  '1',  NOW(),  '115',  1000,  '400',  3000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2500,  '1',  NOW(),  '116',  1000,  '400',  3000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2500,  '1',  NOW(),  '117',  1000,  '400',  3000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2500,  '1',  NOW(),  '118',  1000,  '400',  3000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2500,  '1',  NOW(),  '119',  1000,  '400',  3000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2500,  '1',  NOW(),  '120',  1000,  '400',  3000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2500,  '1',  NOW(),  '121',  1000,  '400',  3000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2500,  '1',  NOW(),  '122',  1000,  '400',  3000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2500,  '1',  NOW(),  '123',  1000,  '400',  3000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2500,  '1',  NOW(),  '124',  1000,  '400',  3000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2500,  '1',  NOW(),  '125',  1000,  '400',  3000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2500,  '1',  NOW(),  '126',  1000,  '400',  3000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2000,  '1',  NOW(),  '91',  3000,  '401',  7000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2000,  '1',  NOW(),  '92',  3000,  '401',  7000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2000,  '1',  NOW(),  '93',  3000,  '401',  7000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2000,  '1',  NOW(),  '94',  3000,  '401',  7000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2000,  '1',  NOW(),  '95',  3000,  '401',  7000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2000,  '1',  NOW(),  '96',  3000,  '401',  7000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2000,  '1',  NOW(),  '97',  3000,  '401',  7000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2000,  '1',  NOW(),  '98',  3000,  '401',  7000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2000,  '1',  NOW(),  '99',  3000,  '401',  7000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2000,  '1',  NOW(),  '100',  3000,  '401',  7000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2000,  '1',  NOW(),  '101',  3000,  '401',  7000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2000,  '1',  NOW(),  '102',  3000,  '401',  7000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2000,  '1',  NOW(),  '103',  3000,  '401',  7000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2000,  '1',  NOW(),  '104',  3000,  '401',  7000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2000,  '1',  NOW(),  '105',  3000,  '401',  7000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2000,  '1',  NOW(),  '106',  3000,  '401',  7000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2000,  '1',  NOW(),  '107',  3000,  '401',  7000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2000,  '1',  NOW(),  '108',  3000,  '401',  7000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2000,  '1',  NOW(),  '109',  3000,  '401',  7000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2000,  '1',  NOW(),  '110',  3000,  '401',  7000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2000,  '1',  NOW(),  '111',  3000,  '401',  7000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2000,  '1',  NOW(),  '112',  3000,  '401',  7000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2000,  '1',  NOW(),  '113',  3000,  '401',  7000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2000,  '1',  NOW(),  '114',  3000,  '401',  7000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2000,  '1',  NOW(),  '115',  3000,  '401',  7000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2000,  '1',  NOW(),  '116',  3000,  '401',  7000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2000,  '1',  NOW(),  '117',  3000,  '401',  7000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2000,  '1',  NOW(),  '118',  3000,  '401',  7000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2000,  '1',  NOW(),  '119',  3000,  '401',  7000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2000,  '1',  NOW(),  '120',  3000,  '401',  7000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2000,  '1',  NOW(),  '121',  3000,  '401',  7000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2000,  '1',  NOW(),  '122',  3000,  '401',  7000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2000,  '1',  NOW(),  '123',  3000,  '401',  7000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2000,  '1',  NOW(),  '124',  3000,  '401',  7000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2000,  '1',  NOW(),  '125',  3000,  '401',  7000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2000,  '1',  NOW(),  '126',  3000,  '401',  7000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '91',  6000,  '402',  12000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '92',  6000,  '402',  12000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '93',  6000,  '402',  12000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '94',  6000,  '402',  12000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '95',  6000,  '402',  12000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '96',  6000,  '402',  12000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '97',  6000,  '402',  12000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '98',  6000,  '402',  12000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '99',  6000,  '402',  12000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '100',  6000,  '402',  12000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '101',  6000,  '402',  12000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '102',  6000,  '402',  12000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '103',  6000,  '402',  12000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '104',  6000,  '402',  12000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '105',  6000,  '402',  12000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '106',  6000,  '402',  12000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '107',  6000,  '402',  12000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '108',  6000,  '402',  12000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '109',  6000,  '402',  12000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '110',  6000,  '402',  12000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '111',  6000,  '402',  12000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '112',  6000,  '402',  12000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '113',  6000,  '402',  12000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '114',  6000,  '402',  12000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '115',  6000,  '402',  12000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '116',  6000,  '402',  12000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '117',  6000,  '402',  12000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '118',  6000,  '402',  12000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '119',  6000,  '402',  12000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '120',  6000,  '402',  12000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '121',  6000,  '402',  12000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '122',  6000,  '402',  12000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '123',  6000,  '402',  12000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '124',  6000,  '402',  12000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '125',  6000,  '402',  12000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '126',  6000,  '402',  12000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 10000,  '1',  NOW(),  '91',  12000,  '403',  19000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 10000,  '1',  NOW(),  '92',  12000,  '403',  19000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 10000,  '1',  NOW(),  '93',  12000,  '403',  19000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 10000,  '1',  NOW(),  '94',  12000,  '403',  19000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 10000,  '1',  NOW(),  '95',  12000,  '403',  19000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 10000,  '1',  NOW(),  '96',  12000,  '403',  19000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 10000,  '1',  NOW(),  '97',  12000,  '403',  19000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 10000,  '1',  NOW(),  '98',  12000,  '403',  19000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 10000,  '1',  NOW(),  '99',  12000,  '403',  19000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 10000,  '1',  NOW(),  '100',  12000,  '403',  19000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 10000,  '1',  NOW(),  '101',  12000,  '403',  19000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 10000,  '1',  NOW(),  '102',  12000,  '403',  19000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 10000,  '1',  NOW(),  '103',  12000,  '403',  19000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 10000,  '1',  NOW(),  '104',  12000,  '403',  19000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 10000,  '1',  NOW(),  '105',  12000,  '403',  19000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 10000,  '1',  NOW(),  '106',  12000,  '403',  19000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 10000,  '1',  NOW(),  '107',  12000,  '403',  19000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 10000,  '1',  NOW(),  '108',  12000,  '403',  19000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 10000,  '1',  NOW(),  '109',  12000,  '403',  19000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 10000,  '1',  NOW(),  '110',  12000,  '403',  19000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 10000,  '1',  NOW(),  '111',  12000,  '403',  19000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 10000,  '1',  NOW(),  '112',  12000,  '403',  19000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 10000,  '1',  NOW(),  '113',  12000,  '403',  19000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 10000,  '1',  NOW(),  '114',  12000,  '403',  19000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 10000,  '1',  NOW(),  '115',  12000,  '403',  19000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 10000,  '1',  NOW(),  '116',  12000,  '403',  19000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 10000,  '1',  NOW(),  '117',  12000,  '403',  19000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 10000,  '1',  NOW(),  '118',  12000,  '403',  19000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 10000,  '1',  NOW(),  '119',  12000,  '403',  19000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 10000,  '1',  NOW(),  '120',  12000,  '403',  19000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 10000,  '1',  NOW(),  '121',  12000,  '403',  19000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 10000,  '1',  NOW(),  '122',  12000,  '403',  19000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 10000,  '1',  NOW(),  '123',  12000,  '403',  19000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 10000,  '1',  NOW(),  '124',  12000,  '403',  19000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 10000,  '1',  NOW(),  '125',  12000,  '403',  19000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 10000,  '1',  NOW(),  '126',  12000,  '403',  19000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 200,  '1',  NOW(),  '91',  200,  '404',  200);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 200,  '1',  NOW(),  '92',  200,  '404',  200);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 200,  '1',  NOW(),  '93',  200,  '404',  200);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 200,  '1',  NOW(),  '94',  200,  '404',  200);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 200,  '1',  NOW(),  '95',  200,  '404',  200);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 200,  '1',  NOW(),  '96',  200,  '404',  200);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 200,  '1',  NOW(),  '97',  200,  '404',  200);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 200,  '1',  NOW(),  '98',  200,  '404',  200);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 200,  '1',  NOW(),  '99',  200,  '404',  200);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 200,  '1',  NOW(),  '100',  200,  '404',  200);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 200,  '1',  NOW(),  '101',  200,  '404',  200);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 200,  '1',  NOW(),  '102',  200,  '404',  200);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 200,  '1',  NOW(),  '103',  200,  '404',  200);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 200,  '1',  NOW(),  '104',  200,  '404',  200);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 200,  '1',  NOW(),  '105',  200,  '404',  200);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 200,  '1',  NOW(),  '106',  200,  '404',  200);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 200,  '1',  NOW(),  '107',  200,  '404',  200);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 200,  '1',  NOW(),  '108',  200,  '404',  200);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 200,  '1',  NOW(),  '109',  200,  '404',  200);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 200,  '1',  NOW(),  '110',  200,  '404',  200);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 200,  '1',  NOW(),  '111',  200,  '404',  200);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 200,  '1',  NOW(),  '112',  200,  '404',  200);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 200,  '1',  NOW(),  '113',  200,  '404',  200);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 200,  '1',  NOW(),  '114',  200,  '404',  200);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 200,  '1',  NOW(),  '115',  200,  '404',  200);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 200,  '1',  NOW(),  '116',  200,  '404',  200);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 200,  '1',  NOW(),  '117',  200,  '404',  200);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 200,  '1',  NOW(),  '118',  200,  '404',  200);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 200,  '1',  NOW(),  '119',  200,  '404',  200);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 200,  '1',  NOW(),  '120',  200,  '404',  200);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 200,  '1',  NOW(),  '121',  200,  '404',  200);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 200,  '1',  NOW(),  '122',  200,  '404',  200);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 200,  '1',  NOW(),  '123',  200,  '404',  200);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 200,  '1',  NOW(),  '124',  200,  '404',  200);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 200,  '1',  NOW(),  '125',  200,  '404',  200);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 200,  '1',  NOW(),  '126',  200,  '404',  200);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 1500,  '1',  NOW(),  '91',  2000,  '405',  6000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 1500,  '1',  NOW(),  '92',  2000,  '405',  6000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 1500,  '1',  NOW(),  '93',  2000,  '405',  6000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 1500,  '1',  NOW(),  '94',  2000,  '405',  6000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 1500,  '1',  NOW(),  '95',  2000,  '405',  6000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 1500,  '1',  NOW(),  '96',  2000,  '405',  6000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 1500,  '1',  NOW(),  '97',  2000,  '405',  6000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 1500,  '1',  NOW(),  '98',  2000,  '405',  6000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 1500,  '1',  NOW(),  '99',  2000,  '405',  6000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 1500,  '1',  NOW(),  '100',  2000,  '405',  6000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 1500,  '1',  NOW(),  '101',  2000,  '405',  6000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 1500,  '1',  NOW(),  '102',  2000,  '405',  6000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 1500,  '1',  NOW(),  '103',  2000,  '405',  6000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 1500,  '1',  NOW(),  '104',  2000,  '405',  6000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 1500,  '1',  NOW(),  '105',  2000,  '405',  6000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 1500,  '1',  NOW(),  '106',  2000,  '405',  6000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 1500,  '1',  NOW(),  '107',  2000,  '405',  6000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 1500,  '1',  NOW(),  '108',  2000,  '405',  6000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 1500,  '1',  NOW(),  '109',  2000,  '405',  6000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 1500,  '1',  NOW(),  '110',  2000,  '405',  6000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 1500,  '1',  NOW(),  '111',  2000,  '405',  6000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 1500,  '1',  NOW(),  '112',  2000,  '405',  6000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 1500,  '1',  NOW(),  '113',  2000,  '405',  6000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 1500,  '1',  NOW(),  '114',  2000,  '405',  6000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 1500,  '1',  NOW(),  '115',  2000,  '405',  6000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 1500,  '1',  NOW(),  '116',  2000,  '405',  6000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 1500,  '1',  NOW(),  '117',  2000,  '405',  6000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 1500,  '1',  NOW(),  '118',  2000,  '405',  6000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 1500,  '1',  NOW(),  '119',  2000,  '405',  6000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 1500,  '1',  NOW(),  '120',  2000,  '405',  6000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 1500,  '1',  NOW(),  '121',  2000,  '405',  6000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 1500,  '1',  NOW(),  '122',  2000,  '405',  6000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 1500,  '1',  NOW(),  '123',  2000,  '405',  6000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 1500,  '1',  NOW(),  '124',  2000,  '405',  6000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 1500,  '1',  NOW(),  '125',  2000,  '405',  6000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 1500,  '1',  NOW(),  '126',  2000,  '405',  6000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '91',  6000,  '406',  14000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '92',  6000,  '406',  14000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '93',  6000,  '406',  14000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '94',  6000,  '406',  14000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '95',  6000,  '406',  14000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '96',  6000,  '406',  14000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '97',  6000,  '406',  14000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '98',  6000,  '406',  14000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '99',  6000,  '406',  14000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '100',  6000,  '406',  14000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '101',  6000,  '406',  14000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '102',  6000,  '406',  14000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '103',  6000,  '406',  14000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '104',  6000,  '406',  14000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '105',  6000,  '406',  14000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '106',  6000,  '406',  14000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '107',  6000,  '406',  14000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '108',  6000,  '406',  14000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '109',  6000,  '406',  14000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '110',  6000,  '406',  14000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '111',  6000,  '406',  14000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '112',  6000,  '406',  14000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '113',  6000,  '406',  14000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '114',  6000,  '406',  14000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '115',  6000,  '406',  14000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '116',  6000,  '406',  14000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '117',  6000,  '406',  14000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '118',  6000,  '406',  14000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '119',  6000,  '406',  14000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '120',  6000,  '406',  14000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '121',  6000,  '406',  14000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '122',  6000,  '406',  14000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '123',  6000,  '406',  14000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '124',  6000,  '406',  14000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '125',  6000,  '406',  14000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 5000,  '1',  NOW(),  '126',  6000,  '406',  14000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 24000,  '1',  NOW(),  '91',  12000,  '407',  24000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 24000,  '1',  NOW(),  '92',  12000,  '407',  24000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 24000,  '1',  NOW(),  '93',  12000,  '407',  24000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 24000,  '1',  NOW(),  '94',  12000,  '407',  24000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 24000,  '1',  NOW(),  '95',  12000,  '407',  24000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 24000,  '1',  NOW(),  '96',  12000,  '407',  24000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 24000,  '1',  NOW(),  '97',  12000,  '407',  24000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 24000,  '1',  NOW(),  '98',  12000,  '407',  24000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 24000,  '1',  NOW(),  '99',  12000,  '407',  24000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 24000,  '1',  NOW(),  '100',  12000,  '407',  24000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 24000,  '1',  NOW(),  '101',  12000,  '407',  24000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 24000,  '1',  NOW(),  '102',  12000,  '407',  24000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 24000,  '1',  NOW(),  '103',  12000,  '407',  24000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 24000,  '1',  NOW(),  '104',  12000,  '407',  24000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 24000,  '1',  NOW(),  '105',  12000,  '407',  24000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 24000,  '1',  NOW(),  '106',  12000,  '407',  24000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 24000,  '1',  NOW(),  '107',  12000,  '407',  24000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 24000,  '1',  NOW(),  '108',  12000,  '407',  24000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 24000,  '1',  NOW(),  '109',  12000,  '407',  24000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 24000,  '1',  NOW(),  '110',  12000,  '407',  24000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 24000,  '1',  NOW(),  '111',  12000,  '407',  24000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 24000,  '1',  NOW(),  '112',  12000,  '407',  24000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 24000,  '1',  NOW(),  '113',  12000,  '407',  24000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 24000,  '1',  NOW(),  '114',  12000,  '407',  24000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 24000,  '1',  NOW(),  '115',  12000,  '407',  24000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 24000,  '1',  NOW(),  '116',  12000,  '407',  24000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 24000,  '1',  NOW(),  '117',  12000,  '407',  24000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 24000,  '1',  NOW(),  '118',  12000,  '407',  24000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 24000,  '1',  NOW(),  '119',  12000,  '407',  24000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 24000,  '1',  NOW(),  '120',  12000,  '407',  24000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 24000,  '1',  NOW(),  '121',  12000,  '407',  24000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 24000,  '1',  NOW(),  '122',  12000,  '407',  24000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 24000,  '1',  NOW(),  '123',  12000,  '407',  24000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 24000,  '1',  NOW(),  '124',  12000,  '407',  24000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 24000,  '1',  NOW(),  '125',  12000,  '407',  24000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 24000,  '1',  NOW(),  '126',  12000,  '407',  24000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 22000,  '1',  NOW(),  '91',  24000,  '408',  30000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 22000,  '1',  NOW(),  '92',  24000,  '408',  30000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 22000,  '1',  NOW(),  '93',  24000,  '408',  30000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 22000,  '1',  NOW(),  '94',  24000,  '408',  30000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 22000,  '1',  NOW(),  '95',  24000,  '408',  30000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 22000,  '1',  NOW(),  '96',  24000,  '408',  30000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 22000,  '1',  NOW(),  '97',  24000,  '408',  30000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 22000,  '1',  NOW(),  '98',  24000,  '408',  30000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 22000,  '1',  NOW(),  '99',  24000,  '408',  30000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 22000,  '1',  NOW(),  '100',  24000,  '408',  30000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 22000,  '1',  NOW(),  '101',  24000,  '408',  30000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 22000,  '1',  NOW(),  '102',  24000,  '408',  30000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 22000,  '1',  NOW(),  '103',  24000,  '408',  30000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 22000,  '1',  NOW(),  '104',  24000,  '408',  30000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 22000,  '1',  NOW(),  '105',  24000,  '408',  30000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 22000,  '1',  NOW(),  '106',  24000,  '408',  30000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 22000,  '1',  NOW(),  '107',  24000,  '408',  30000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 22000,  '1',  NOW(),  '108',  24000,  '408',  30000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 22000,  '1',  NOW(),  '109',  24000,  '408',  30000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 22000,  '1',  NOW(),  '110',  24000,  '408',  30000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 22000,  '1',  NOW(),  '111',  24000,  '408',  30000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 22000,  '1',  NOW(),  '112',  24000,  '408',  30000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 22000,  '1',  NOW(),  '113',  24000,  '408',  30000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 22000,  '1',  NOW(),  '114',  24000,  '408',  30000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 22000,  '1',  NOW(),  '115',  24000,  '408',  30000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 22000,  '1',  NOW(),  '116',  24000,  '408',  30000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 22000,  '1',  NOW(),  '117',  24000,  '408',  30000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 22000,  '1',  NOW(),  '118',  24000,  '408',  30000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 22000,  '1',  NOW(),  '119',  24000,  '408',  30000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 22000,  '1',  NOW(),  '120',  24000,  '408',  30000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 22000,  '1',  NOW(),  '121',  24000,  '408',  30000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 22000,  '1',  NOW(),  '122',  24000,  '408',  30000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 22000,  '1',  NOW(),  '123',  24000,  '408',  30000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 22000,  '1',  NOW(),  '124',  24000,  '408',  30000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 22000,  '1',  NOW(),  '125',  24000,  '408',  30000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 22000,  '1',  NOW(),  '126',  24000,  '408',  30000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 800,  '1',  NOW(),  '10',  1000,  '409',  1000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 800,  '1',  NOW(),  '11',  1000,  '409',  1000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 800,  '1',  NOW(),  '20',  1000,  '409',  1000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 2400,  '1',  NOW(),  '21',  2400,  '410',  3000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 600,  '1',  NOW(),  '13',  800,  '411',  1000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 400,  '1',  NOW(),  '14',  560,  '412',  700);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 600,  '1',  NOW(),  '13',  800,  '413',  1000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 400,  '1',  NOW(),  '14',  560,  '414',  700);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 600,  '1',  NOW(),  '13',  800,  '415',  1000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 400,  '1',  NOW(),  '14',  560,  '416',  700);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 600,  '1',  NOW(),  '13',  800,  '417',  1000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 400,  '1',  NOW(),  '14',  560,  '418',  700);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 300,  '1',  NOW(),  '19',  400,  '419',  500);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 300,  '1',  NOW(),  '12',  400,  '419',  500);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 300,  '1',  NOW(),  '16',  400,  '420',  500);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 300,  '1',  NOW(),  '17',  400,  '420',  500);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 300,  '1',  NOW(),  '18',  400,  '420',  500);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 300,  '1',  NOW(),  '19',  400,  '420',  500);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 300,  '1',  NOW(),  '12',  400,  '420',  500);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 300,  '1',  NOW(),  '20',  400,  '421',  500);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 300,  '1',  NOW(),  '21',  400,  '421',  500);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 300,  '1',  NOW(),  '10',  400,  '421',  500);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 300,  '1',  NOW(),  '11',  400,  '421',  500);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 300,  '1',  NOW(),  '10',  400,  '422',  500);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 300,  '1',  NOW(),  '11',  400,  '422',  500);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 300,  '1',  NOW(),  '20',  400,  '422',  500);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 300,  '1',  NOW(),  '21',  400,  '422',  500);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 300,  '1',  NOW(),  '10',  400,  '423',  500);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 300,  '1',  NOW(),  '11',  400,  '423',  500);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 300,  '1',  NOW(),  '20',  400,  '423',  500);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 300,  '1',  NOW(),  '21',  400,  '423',  500);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 800,  '1',  NOW(),  '10',  1000,  '424',  1000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 3200,  '1',  NOW(),  '14',  3200,  '425',  4000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 3200,  '1',  NOW(),  '14',  3200,  '426',  4000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 3200,  '1',  NOW(),  '14',  3200,  '427',  4000);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 6400,  '1',  NOW(),  '13',  8000,  '428',  6400);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 6400,  '1',  NOW(),  '13',  8000,  '429',  6400);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 6400,  '1',  NOW(),  '13',  8000,  '430',  6400);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 1500,  '1',  NOW(),  '10',  1500,  '431',  2500);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 1500,  '1',  NOW(),  '11',  1500,  '431',  2500);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 1500,  '1',  NOW(),  '10',  1500,  '432',  2500);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 1500,  '1',  NOW(),  '11',  1500,  '432',  2500);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 1500,  '1',  NOW(),  '10',  1500,  '433',  2500);
INSERT INTO  `sanlu`.`product_link_place` (`version` ,`cost_price` ,`last_modify_by_id` ,`last_updated` ,`place_id` ,`price` ,`product_id` ,`salling_price`)VALUES ('0', 1500,  '1',  NOW(),  '11',  1500,  '433',  2500);


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
  `deleter` bigint(20),
  PRIMARY KEY (`id`),
  KEY `FKED904B19F1FE910B` (`closer_id`),
  KEY `FKED904B19C4CF7A7D` (`funeraler_id`),
  KEY `FKED904B197EF59148` (`funeral_company_id`),
  KEY `FKED904B19C140FEFD` (`emp_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- 列出以下資料庫的數據： `project`
--
/*
INSERT INTO `project` (`id`, `version`, `closer_id`, `closing_date`, `contact`, `contact_addr`, `contact_addr_area`, `contact_addr_city`, `contact_phone`, `cost_total`, `emp_id`, `funeral_company_id`, `funeraler_id`, `in_date`, `last_updated`, `memo`, `out_date`, `project_name`, `project_no`, `salling_total`, `total`) VALUES
(2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 1, 1, 1, '2012-03-11 00:00:00', '2012-03-13 22:20:31', NULL, NULL, 'ddsd', '0000001', 0.00, 0.00);
*/

--
-- Table structure for table `product_history`
--

DROP TABLE IF EXISTS `product_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `date` datetime NOT NULL,
  `is_purchase` bit(1) NOT NULL,
  `last_modify_by_id` bigint(20) NOT NULL,
  `last_updated` datetime NOT NULL,
  `memo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_id` bigint(20) NOT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `quantity` decimal(19,2) NOT NULL,
  `total_quantity` int(11) NOT NULL,
  `vendor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC8B4F9441B7C2B1D` (`project_id`),
  KEY `FKC8B4F944E623C052` (`last_modify_by_id`),
  KEY `FKC8B4F944F961D35D` (`product_id`),
  CONSTRAINT `FKC8B4F944F961D35D` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `FKC8B4F9441B7C2B1D` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`),
  CONSTRAINT `FKC8B4F944E623C052` FOREIGN KEY (`last_modify_by_id`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
