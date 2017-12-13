/*
Navicat MySQL Data Transfer

Source Server         : web
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : project

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-12-13 23:00:28
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `account`
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `account_id` int(20) NOT NULL,
  `customer_id` int(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`account_id`),
  KEY `account_ibfk_1` (`customer_id`),
  CONSTRAINT `account_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('1', '1', 'whitesand32@gmail.com', 'ccbSP4oErLDLUMjSCokjDA==');

-- ----------------------------
-- Table structure for `accountauthorization`
-- ----------------------------
DROP TABLE IF EXISTS `accountauthorization`;
CREATE TABLE `accountauthorization` (
  `account_authorization_id` int(20) NOT NULL,
  `authorization_type` int(1) DEFAULT NULL,
  `authorization_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`account_authorization_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of accountauthorization
-- ----------------------------
INSERT INTO `accountauthorization` VALUES ('1', '1', 'customer');
INSERT INTO `accountauthorization` VALUES ('2', '2', 'admin');

-- ----------------------------
-- Table structure for `customer`
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `customer_id` int(20) NOT NULL,
  `account_authorization_id` int(20) DEFAULT NULL,
  `customer_first_name` varchar(255) DEFAULT NULL,
  `customer_last_name` varchar(255) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `registration_date` date DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  KEY `account_authorization_id` (`account_authorization_id`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`account_authorization_id`) REFERENCES `accountauthorization` (`account_authorization_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('1', '1', 'abc', 'abc', '2017-12-12', 'male', 'asd', '123', '2017-12-12');

-- ----------------------------
-- Table structure for `order`
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `order_id` int(20) NOT NULL,
  `customer_id` int(20) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `delivery_address` varchar(255) DEFAULT NULL,
  `payment_status` varchar(10) DEFAULT NULL,
  `delivery_status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of order
-- ----------------------------

-- ----------------------------
-- Table structure for `orderdetail`
-- ----------------------------
DROP TABLE IF EXISTS `orderdetail`;
CREATE TABLE `orderdetail` (
  `order_detail_id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(20) DEFAULT NULL,
  `order_id` int(20) DEFAULT NULL,
  `amount` int(10) DEFAULT NULL,
  `price` double(20,3) DEFAULT NULL,
  PRIMARY KEY (`order_detail_id`),
  KEY `product_id` (`product_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `orderdetail_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `orderdetail_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of orderdetail
-- ----------------------------

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `product_id` int(20) NOT NULL,
  `product_group_id` int(20) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `description` varchar(10000) DEFAULT NULL,
  `origin` varchar(255) DEFAULT NULL,
  `price` double(20,3) DEFAULT NULL,
  `amount` int(10) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `out_of_stock` varchar(10) DEFAULT NULL,
  `battery_type` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `connectors` varchar(255) DEFAULT NULL,
  `screen_resolution` varchar(255) DEFAULT NULL,
  `screen_size` varchar(10) DEFAULT NULL,
  `screen_type` varchar(255) DEFAULT NULL,
  `cpu` varchar(255) DEFAULT NULL,
  `operating_system` varchar(255) DEFAULT NULL,
  `weight` varchar(10) DEFAULT NULL,
  `ram_memory` int(10) DEFAULT NULL,
  `warranty_period` int(10) DEFAULT NULL,
  `capacity` int(10) DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `product_group_id` (`product_group_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`product_group_id`) REFERENCES `productgroup` (`product_group_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '25');
INSERT INTO `product` VALUES ('1', '1', 'Samsung Galaxy J7 Pro', null, 'China', '5680751.000', null, 'hinh/ssgj7pro.jpeg', '', '3600 mAh', 'Yellow', 'MicroUSB, 3.5mm', '1080 x 1920', '5.5', 'Super AMOLED', 'Exynos 7870 8 cores 1.6GHz', 'Android', '1.39', '3', '12', '32');
INSERT INTO `product` VALUES ('2', '1', 'Samsung Galaxy J2 Prime', null, 'Vietnam', '1890000.000', null, 'hinh/ssgj2prime.jpg', null, '2600 mAh', 'Pink', 'Micro USB, 3.5mm', '540 x 960', '5.0', 'PLS TFT LCD', 'Quad-core 1.4 GHz Cortex-A53', 'Android', '0.5', null, '12', '8');
INSERT INTO `product` VALUES ('3', '1', 'Samsung Galaxy S7 Edge', null, 'China & Thailand', '8221000.000', null, 'hinh/ssgs7edge.jpg', null, '3000 - 3999 mAh', null, null, null, '5.5', 'AMOLED', 'Exynos 8890 8 cores 64-bit 4 cores 2.3 GHz & 4 cores 1.6 GHz', 'Android', '0.157', '4', '12', '32');
INSERT INTO `product` VALUES ('4', '2', 'Apple iPhone 8', null, null, '17015000.000', null, 'hinh/ip8.jpg', null, '1000 - 1999 mAh', 'Gold', null, '1334 x 750', '4.7', 'IPS LCD', 'Apple A11 Bionic\r\nApple A11 Bionic\r\nApple A11 Bionic\r\nApple A11 Bionic\r\nApple A11 Bionic\r\nApple A11 Bionic', 'iOS 11', '0.148', '2', '12', '64');
INSERT INTO `product` VALUES ('5', '2', 'Apple iPhone 7 Plus', null, null, '17961000.000', null, 'hinh/iphone7-plus-black-select-2016.jpg', null, '2900 mAh', 'Jet Black', null, '1080 x 1920', '5.5', 'LCD', null, 'iOS 11', '0.188', '3', '12', '128');
INSERT INTO `product` VALUES ('6', '2', 'Apple iPhone 6 ', null, null, '7520000.000', null, 'hinh/ip6.jpg', null, '1810 mAh', null, null, '1334 x 750', '4.7', 'LCD', 'Apple A8 2 cores 64-bit', 'iOS 11', '0.124', '1', '12', '32');
INSERT INTO `product` VALUES ('7', '3', 'OPPO A39', null, 'China, Vietnam', '3290000.000', null, 'hinh/oppo-a39.jpg', null, '2900 mAh ', 'Gold & Pink', null, null, '5.2', 'IPS LCD', ' MT6750', 'Android 5.0 Lollipop', null, '3', '12', '32');
INSERT INTO `product` VALUES ('8', '3', 'OPPO F1 Plus', null, null, '5690000.000', null, 'hinh/oppo-f1plus.jpg', null, null, null, null, null, '5.5', 'AMOLED', 'Helio P10 8 cores 64-bit', 'Android', null, '4', '12', '64');
INSERT INTO `product` VALUES ('9', '3', 'OPPO F5', null, 'Vietnam, China', '6990000.000', null, 'hinh/oppo_f5.jpeg', null, '3200mAh', 'Gold & Black', null, null, '6.0', null, null, 'ColorOS 3.2', null, '4', '12', '64');
INSERT INTO `product` VALUES ('10', '4', 'Xiaomi Mi A1', null, 'China', '4990000.000', null, 'hinh/xiaomi-a1.jpg', null, '3080mAh', null, 'MicroUSB, 3.5mm', '1080 x 1920', '5.5', 'LCD', 'Qualcomm Snapdragon 625', 'Android', '0.3', '4', '12', '32');
INSERT INTO `product` VALUES ('11', '4', 'Xiaomi Mi Max 2', null, null, '5689000.000', null, 'hinh/xiaomi-max2.jpg', null, '5300mAh', 'Black', 'MicroUSB, 3.5mm', '1920 x 1080', '6.44 ', null, 'Snapdragon 625', 'Android', '0.3', '4', '12', '64');
INSERT INTO `product` VALUES ('12', '4', 'Xiaomi Redmi Note 4X', null, 'China', '2677000.000', null, 'hinh/medium-Xiaomi-Redmi-Note-4x.jpg', null, '4100 mAh', null, null, null, '5.5', 'IPS LCD', 'Snapdragon 625 ', 'Android 6.0', '0.4', '3', '12', '16');
INSERT INTO `product` VALUES ('13', '5', 'Huawei GR5', null, 'China', '4490000.000', null, 'hinh/huawei-gr5.jpg', null, '3000 mAh', 'Silver', 'MicroUSB, 3.5mm', '1920 x 1080', '5.5', 'IPS LCD', 'Qualcomm Snapdragon 616, Octa-Core, Quad-core 1.2GHz +Quad-core 1.5GHz', 'Android', '0.16', '2', '12', '16');
INSERT INTO `product` VALUES ('14', '5', 'HUAWEI NOVA 2i', null, null, '5990000.000', null, 'hinh/Huawei-Nova-2i.jpg', null, 'Li-Ion 3340 mAh', 'Black, Blue & Gold', null, null, '5.9', null, ' HiSilicon Kirin 659', 'Android 7.0', null, '4', '12', '64');
INSERT INTO `product` VALUES ('15', '5', 'Huawei Y3II', null, null, '1545000.000', null, 'hinh.huawei_y3ii.jpg', null, '1560 mAh', null, null, '480 x 854', '4.5', null, 'Mediatek MT6735M, 1.3GHz', ' Android OS, v5.1 (Lollipop)', null, '8', '12', '8');
INSERT INTO `product` VALUES ('16', '6', 'LG V10 H960', null, 'Republic of Korea', '5990000.000', null, 'hinh/LGV10-H960.jpg', null, '3000 mAh', null, null, null, '5.7', null, 'Qualcomm Snapdragon 808 6 cores 64-bit', 'Android 5.1 (Lollipop)', null, '4', '12', '64');
INSERT INTO `product` VALUES ('17', '6', 'LG G4', null, 'Republic of Korea', '3690000.000', null, 'hinh/LG-G4.jpg', null, '3000 mAh', null, null, null, '5.5', null, null, 'Android 5.1', null, '3', '12', '32');
INSERT INTO `product` VALUES ('18', '6', 'LG G5 SE', null, null, '5584000.000', null, 'hinh/lg_g5_se.jpg', null, '2800 mAh', null, null, '2560 x 1440', '5.3', 'IPS LCD', 'Qualcomm MSM8976 Snapdragon 652, Quad-core Cortex-A72 & quad-core Cortex-A53', 'Android v7.0', '0.156', '3', '12', '32');
INSERT INTO `product` VALUES ('19', '7', 'Sony Xperia XA1 Plus', null, null, '6212000.000', null, 'hinh/sony_xperia_xa1_plus.jpeg', null, 'Li-Ion 3430 mAh', null, null, '1080 x 1920', '5.5', 'IPS LCD', '4x 2.3 GHz Cortex-A53 & 4x 1.6 GHz Cortex-A53', 'Android 7.0 (Nougat)', '0.19', '4', '12', '32');
INSERT INTO `product` VALUES ('20', '7', 'Sony Xperia XZ Premium', null, null, '14858000.000', null, 'hinh/sony_xperia_xz_premium.jpeg', null, 'Li-Ion 3230 mAh', 'Black', null, '3840 x 2160', '5.5', 'IPS LCD', 'Qualcomm MSM8998 Snapdragon 835', 'Android OS, v7.1 (Nougat)', '0.195', '4', '12', '64');
INSERT INTO `product` VALUES ('21', '7', 'Sony Xperia Z3', null, 'China, Japan', '5190000.000', null, 'hinh/xperia-z3.jpg', null, '3100 mAh', 'White', null, null, '5.2', 'IPS LCD', 'Qualcomm Snapdragon 801 4 cores 32-bit, 2.5 GHz', 'Android 4.4 (KitKat)', '0.15', '3', '12', '16');
INSERT INTO `product` VALUES ('22', '8', 'HTC U11', null, null, '14990000.000', null, 'hinh/u11-5.jpg', null, 'Li-Ion 3000 mAh ', 'Amazing Silver, Sapphire Blue, Brilliant Black, Ice White, Solar Red', null, '1440 x 2560', '5.5', 'LCD', 'Qualcomm MSM8998 Snapdragon 835, GPU: Adreno 540', 'Android 7.1 (Nougat)', '0.17', '6', '12', '128');
INSERT INTO `product` VALUES ('23', '8', 'HTC 10 EVO', null, null, '4990000.000', null, 'hinh/htc-10-evo-4g-black.jpg', null, '3200 mAh ', 'Black', null, null, '5.5', 'LCD', 'Snapdragon 810', 'Android 7.0 Nougat', null, '3', '12', '32');
INSERT INTO `product` VALUES ('24', '8', 'HTC Butterfly 2', null, 'China', '5990000.000', null, 'hinh/htc-butterfly-2.jpg', null, '2700 mAh', 'Blue', null, '1080 x 1920 ', '5.0', null, 'Qualcomm Snapdragon™ 801', 'Android 5.0 ', '0.15', '2', '12', '16');
INSERT INTO `product` VALUES ('25', '9', 'Nokia 3', null, null, '2506000.000', null, 'hinh/nokia-3.jpeg', null, '2630 mAh', 'Tempered Blue', 'MicroUSB, 3.5mm', '720 x 1280', '5.0', 'IPS LCD', 'MT6737 4 cores 1.3 GHz', 'Android 7.0', '0.3', '2', '12', '16');
INSERT INTO `product` VALUES ('26', '9', 'Nokia 6', null, null, '4548000.000', null, 'hinh/Nokia_6.jpeg', null, 'Li-Ion 3000 mAh', 'Silver', null, '1080 x 1920', '5.5', 'IPS LCD', 'Qualcomm MSM8937 Snapdragon 430', 'Android OS, v7.1.1 (Nougat)', '0.169', '3', '12', '32');
INSERT INTO `product` VALUES ('27', '9', 'Nokia 8', null, null, '10760000.000', null, 'hinh/8-blue-satin-back.jpg', null, 'Li-Ion 3090 mAh', 'Blue satin', null, '1440 x 2560', '5.3', 'IPS LCD', 'Qualcomm MSM8998 Snapdragon 835', 'Android 7.1.1 (Nougat)', '0.16', '4', '12', '64');
INSERT INTO `product` VALUES ('28', '10', 'Lenovo K8 Plus', null, 'China', '4490000.000', null, 'hinh/lenovo-k8-plus.jpg', null, 'Li-poly 4.000 mAh', 'Black', 'MicroUSB, 3.5mm', '1920 x 1080', '5.2', null, 'Helio P25 2.6 GHz', 'Android 7.1.1, Nougat', '0.3', '4', '12', '32');
INSERT INTO `product` VALUES ('29', '10', 'Lenovo Vibe K6 Power', null, null, '3711000.000', null, 'hinh/Lenovo-K6-power.jpg', null, 'Lithium Ion 4000mAh', 'Gold', null, '1920 x 1080', '5.0', 'IPS LCD', 'Qualcom Snapdragon 430 - 8 cores 1.4GHz', 'Android', '0.145', '3', '12', '32');
INSERT INTO `product` VALUES ('30', '10', 'Lenovo Vibe Shot', null, null, '7029000.000', null, 'hinh/Lenovo-Vibe-Shot.jpg', null, 'Li-Po 3000 mAh', 'Grey', 'MicroUSB v2.0, 3.5mm', '1920 x 1080', '5.0', 'IPS LCD', 'Qualcomm MSM8939 Snapdragon 615 1,7GHz 8 cores', 'Android 5.0', '0.145', '3', '12', '32');

-- ----------------------------
-- Table structure for `productgroup`
-- ----------------------------
DROP TABLE IF EXISTS `productgroup`;
CREATE TABLE `productgroup` (
  `product_group_id` int(20) NOT NULL,
  `product_group_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`product_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of productgroup
-- ----------------------------
INSERT INTO `productgroup` VALUES ('1', 'Samsung');
INSERT INTO `productgroup` VALUES ('2', 'Apple');
INSERT INTO `productgroup` VALUES ('3', 'Oppo');
INSERT INTO `productgroup` VALUES ('4', 'Xiaomi');
INSERT INTO `productgroup` VALUES ('5', 'Huawei');
INSERT INTO `productgroup` VALUES ('6', 'LG');
INSERT INTO `productgroup` VALUES ('7', 'Sony');
INSERT INTO `productgroup` VALUES ('8', 'HTC');
INSERT INTO `productgroup` VALUES ('9', 'Nokia');
INSERT INTO `productgroup` VALUES ('10', 'Lenovo');
