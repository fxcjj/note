/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50622
Source Host           : localhost:3306
Source Database       : t2

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2016-09-23 11:32:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_teacher`
-- ----------------------------
DROP TABLE IF EXISTS `t_teacher`;
CREATE TABLE `t_teacher` (
  `teacher_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_teacher
-- ----------------------------
INSERT INTO `t_teacher` VALUES ('1', '吉泽明步');
INSERT INTO `t_teacher` VALUES ('2', '龙泽萝拉');
INSERT INTO `t_teacher` VALUES ('3', '苍井空');
