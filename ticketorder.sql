/*
Navicat MySQL Data Transfer

Source Server         : xyf
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : ticketorder

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-01-06 22:10:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `plane`
-- ----------------------------
DROP TABLE IF EXISTS `plane`;
CREATE TABLE `plane` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(50) DEFAULT NULL,
  `splace` varchar(50) DEFAULT NULL,
  `stime` datetime DEFAULT NULL,
  `etime` datetime DEFAULT NULL,
  `company` varchar(50) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `cprice` double DEFAULT NULL,
  `mprice` double DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of plane
-- ----------------------------
INSERT INTO `plane` VALUES ('1', '国内航线', '沈阳-北京', '2008-05-01 00:00:00', '2008-05-20 00:00:00', '北方航空公司', '1233', '1111', '1233', '100', '100');
INSERT INTO `plane` VALUES ('3', '国内航线', '沈阳-上海', '2008-05-07 00:00:00', '2008-05-08 00:00:00', '北方航空公司', '1888', '1088', '1588', '100', '101');
INSERT INTO `plane` VALUES ('4', '国际航线', '上海-阿富汗', '2008-05-08 00:00:00', '2008-05-10 00:00:00', '中国南方航空公司', '5999', '4999', '5888', '100', '102');
INSERT INTO `plane` VALUES ('5', '国内航线', '沈阳-海南岛', '2008-05-15 00:00:00', '2008-05-16 00:00:00', '中国西南航空公司', '999', '888', '955', '100', '103');
INSERT INTO `plane` VALUES ('6', '国际航线', '北京-首尔', '2008-05-09 00:00:00', '2008-05-11 00:00:00', '北方航空公司', '5000', '4999', '5888', '100', '104');
INSERT INTO `plane` VALUES ('7', '国内航线', '沈阳-北京', '2008-05-10 00:00:00', '2008-05-10 00:00:00', '北方航空公司', '755', '655', '700', '100', '105');
INSERT INTO `plane` VALUES ('8', '国际航线', '大连-日本', '2008-05-10 00:00:00', '2008-05-11 00:00:00', '北方航空公司', '5000', '4500', '4800', '100', '106');
INSERT INTO `plane` VALUES ('10', '国际航线', '上海-美国', '2008-05-08 00:00:00', '2008-05-09 00:00:00', '美国波音公司', '8888', '7888', '8588', '100', '107');
INSERT INTO `plane` VALUES ('12', '国内航线', '温州-北京', '2018-01-03 00:00:00', '2018-01-04 00:00:00', '北方航空公司', '5555', '5555', '2444', '100', '108');
INSERT INTO `plane` VALUES ('13', '国际航线', '温州-北京', '2018-01-03 00:00:00', '2018-01-04 00:00:00', '北方航空公司', '1231', '1231', '1231', '100', '109');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `uuid` varchar(255) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('admin', 'admin', '768105318@qq.com', '10000000000', 'f8b7efeed7bf4aa29e1a6e9906e6a3c0');

-- ----------------------------
-- Table structure for `yuding`
-- ----------------------------
DROP TABLE IF EXISTS `yuding`;
CREATE TABLE `yuding` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(50) DEFAULT NULL,
  `splace` varchar(50) DEFAULT NULL,
  `stime` date DEFAULT NULL,
  `etime` date DEFAULT NULL,
  `company` varchar(50) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `cprice` double DEFAULT NULL,
  `mprice` double DEFAULT NULL,
  `buynum` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `buytime` datetime DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aaa` (`username`),
  KEY `bbb` (`pid`),
  CONSTRAINT `aaa` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bbb` FOREIGN KEY (`pid`) REFERENCES `plane` (`pid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yuding
-- ----------------------------
