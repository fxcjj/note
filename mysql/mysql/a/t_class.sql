/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50622
Source Host           : localhost:3306
Source Database       : t1

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2016-09-21 17:49:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_class`
-- ----------------------------
DROP TABLE IF EXISTS `t_class`;
CREATE TABLE `t_class` (
  `class_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `class_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_class
-- ----------------------------
INSERT INTO `t_class` VALUES ('1', '高一（1）班');
INSERT INTO `t_class` VALUES ('2', '高一（2）班');
INSERT INTO `t_class` VALUES ('3', '高二（1）班');
INSERT INTO `t_class` VALUES ('4', '高二（2）班');
INSERT INTO `t_class` VALUES ('5', '高三（1）班');
INSERT INTO `t_class` VALUES ('6', '高三（2）班');
