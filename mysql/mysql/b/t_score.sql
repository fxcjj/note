/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50622
Source Host           : localhost:3306
Source Database       : t2

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2016-09-23 11:32:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_score`
-- ----------------------------
DROP TABLE IF EXISTS `t_score`;
CREATE TABLE `t_score` (
  `stu_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `course_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `score` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`stu_id`,`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_score
-- ----------------------------
INSERT INTO `t_score` VALUES ('1', '1', '84');
INSERT INTO `t_score` VALUES ('1', '2', '79');
INSERT INTO `t_score` VALUES ('1', '3', '32');
INSERT INTO `t_score` VALUES ('2', '1', '59');
INSERT INTO `t_score` VALUES ('2', '2', '74');
INSERT INTO `t_score` VALUES ('2', '3', '74');
INSERT INTO `t_score` VALUES ('3', '1', '60');
INSERT INTO `t_score` VALUES ('3', '2', '50');
INSERT INTO `t_score` VALUES ('3', '3', '40');
INSERT INTO `t_score` VALUES ('4', '1', '26');
INSERT INTO `t_score` VALUES ('4', '2', '83');
INSERT INTO `t_score` VALUES ('4', '3', '38');
INSERT INTO `t_score` VALUES ('5', '1', '35');
INSERT INTO `t_score` VALUES ('5', '2', '32');
INSERT INTO `t_score` VALUES ('5', '3', '95');
INSERT INTO `t_score` VALUES ('6', '1', '27');
INSERT INTO `t_score` VALUES ('6', '2', '92');
INSERT INTO `t_score` VALUES ('6', '3', '44');
INSERT INTO `t_score` VALUES ('7', '1', '62');
INSERT INTO `t_score` VALUES ('7', '2', '85');
