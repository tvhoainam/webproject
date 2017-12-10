/*
Navicat MySQL Data Transfer

Source Server         : web
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : project

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-12-10 23:18:49
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
  `price` float(20,3) DEFAULT NULL,
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
  `price` float(20,3) DEFAULT NULL,
  `amount` int(10) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `out_of_stock` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `product_group_id` (`product_group_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`product_group_id`) REFERENCES `productgroup` (`product_group_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of product
-- ----------------------------

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
