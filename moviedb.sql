/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50515
Source Host           : localhost:3306
Source Database       : moviedb

Target Server Type    : MYSQL
Target Server Version : 50515
File Encoding         : 65001

Date: 2018-01-10 15:10:28
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `movie`
-- ----------------------------
DROP TABLE IF EXISTS `movie`;
CREATE TABLE `movie` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(10) NOT NULL,
  `duration` varchar(10) DEFAULT NULL,
  `Language` varchar(10) DEFAULT NULL,
  `isSubtitles` tinyint(1) DEFAULT NULL,
  `Director` varchar(30) DEFAULT NULL,
  `Actors` varchar(30) DEFAULT NULL,
  `Agerequired` int(10) DEFAULT NULL,
  `Startdate` varchar(20) DEFAULT NULL,
  `Enddate` varchar(20) DEFAULT NULL,
  `Days` varchar(30) DEFAULT NULL,
  `TheatreID` int(10) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of movie
-- ----------------------------
INSERT INTO `movie` VALUES ('2', 'dd', null, 'ssddddd', '0', 'dd', 'ss', null, '2018-1-9 09:08', '2018-1-9 11:08', '2', null, 'beijing'), ('3', 'dd', null, 'dd', '0', 'dd', 'ss', '1', '2018-1-19 09:08', '2018-1-19 01:08', '1', '2', 'beijing'), ('4', 'ss', 'ss', 'ss', '3', '3', '33', '2', '2018-1-19 09:08', '2018-1-19 09:08', '1', '3', 'shanghai'), ('5', 'ff', null, 'ss', '0', 'ff', 'ff', null, '2018-1-9 09:32', '2018-1-9 09:32', '1', null, 'nanjing'), ('7', 'bb', null, 'bb', '0', 'bb', 'bb', null, '2018-10-1 12:21', '2018-10-1 12:21', '1', null, 'xuchang');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `username` varchar(36) NOT NULL,
  `password` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `address` varchar(64) DEFAULT NULL,
  `tel` varchar(18) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_name` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('0000000010', '张三', '1233', '深圳', '18021336832'), ('0000000011', '李四', '12343', '深圳', '1345556666'), ('0000000012', '王五', '12343', '深圳', '1345556666'), ('0000000014', '张三丰', '23444', '安徽', '138803083883'), ('0000000042', '李武', '1232', ' 广州', '11103432092'), ('0000000046', 'zhangsan', '1233', ' 广州', '18021336832'), ('0000000058', '张三图', '1233', ' 广州', '1232333'), ('0000000060', '春春', '1233', ' 广州', '1232333'), ('0000000101', 'lucus', '1234', '深圳', '123456766'), ('0000000102', 'admin', 'admin', '深圳', '12345676');
