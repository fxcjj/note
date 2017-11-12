/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50622
Source Host           : localhost:3306
Source Database       : t1

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2016-09-21 17:49:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_score`
-- ----------------------------
DROP TABLE IF EXISTS `t_score`;
CREATE TABLE `t_score` (
  `score_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `course` varchar(20) DEFAULT NULL,
  `score` tinyint(3) unsigned DEFAULT NULL,
  `stu_id` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`score_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_score
-- ----------------------------
INSERT INTO `t_score` VALUES ('1', '语文', '68', '1');
INSERT INTO `t_score` VALUES ('2', '数学', '95', '1');
INSERT INTO `t_score` VALUES ('3', '英语', '80', '1');
INSERT INTO `t_score` VALUES ('4', '语文', '48', '2');
INSERT INTO `t_score` VALUES ('5', '数学', '2', '2');
INSERT INTO `t_score` VALUES ('6', '英语', '76', '2');
INSERT INTO `t_score` VALUES ('7', '语文', '27', '3');
INSERT INTO `t_score` VALUES ('8', '数学', '91', '3');
INSERT INTO `t_score` VALUES ('9', '英语', '37', '3');
INSERT INTO `t_score` VALUES ('10', '语文', '5', '4');
INSERT INTO `t_score` VALUES ('11', '数学', '80', '4');
INSERT INTO `t_score` VALUES ('12', '英语', '26', '4');
INSERT INTO `t_score` VALUES ('13', '语文', '86', '5');
INSERT INTO `t_score` VALUES ('14', '数学', '9', '5');
INSERT INTO `t_score` VALUES ('15', '英语', '78', '5');
INSERT INTO `t_score` VALUES ('16', '语文', '45', '6');
INSERT INTO `t_score` VALUES ('17', '数学', '30', '6');
INSERT INTO `t_score` VALUES ('18', '英语', '50', '6');
INSERT INTO `t_score` VALUES ('19', '语文', '65', '7');
INSERT INTO `t_score` VALUES ('20', '数学', '61', '7');
INSERT INTO `t_score` VALUES ('21', '英语', '32', '7');
INSERT INTO `t_score` VALUES ('22', '语文', '32', '8');
INSERT INTO `t_score` VALUES ('23', '数学', '52', '8');
INSERT INTO `t_score` VALUES ('24', '英语', '79', '8');
INSERT INTO `t_score` VALUES ('25', '语文', '60', '9');
INSERT INTO `t_score` VALUES ('26', '数学', '45', '9');
INSERT INTO `t_score` VALUES ('27', '英语', '16', '9');
INSERT INTO `t_score` VALUES ('28', '语文', '66', '10');
INSERT INTO `t_score` VALUES ('29', '数学', '19', '10');
INSERT INTO `t_score` VALUES ('30', '英语', '84', '10');
INSERT INTO `t_score` VALUES ('31', '语文', '24', '11');
INSERT INTO `t_score` VALUES ('32', '数学', '10', '11');
INSERT INTO `t_score` VALUES ('33', '英语', '52', '11');
INSERT INTO `t_score` VALUES ('34', '语文', '27', '12');
INSERT INTO `t_score` VALUES ('35', '数学', '89', '12');
INSERT INTO `t_score` VALUES ('36', '英语', '97', '12');
INSERT INTO `t_score` VALUES ('37', '语文', '81', '13');
INSERT INTO `t_score` VALUES ('38', '数学', '24', '13');
INSERT INTO `t_score` VALUES ('39', '英语', '69', '13');
INSERT INTO `t_score` VALUES ('40', '语文', '78', '14');
INSERT INTO `t_score` VALUES ('41', '数学', '48', '14');
INSERT INTO `t_score` VALUES ('42', '英语', '53', '14');
INSERT INTO `t_score` VALUES ('43', '语文', '23', '15');
INSERT INTO `t_score` VALUES ('44', '数学', '45', '15');
INSERT INTO `t_score` VALUES ('45', '英语', '47', '15');
INSERT INTO `t_score` VALUES ('46', '语文', '48', '16');
INSERT INTO `t_score` VALUES ('47', '数学', '82', '16');
INSERT INTO `t_score` VALUES ('48', '英语', '2', '16');
INSERT INTO `t_score` VALUES ('49', '语文', '54', '17');
INSERT INTO `t_score` VALUES ('50', '数学', '34', '17');
INSERT INTO `t_score` VALUES ('51', '英语', '74', '17');
INSERT INTO `t_score` VALUES ('52', '语文', '64', '18');
INSERT INTO `t_score` VALUES ('53', '数学', '36', '18');
INSERT INTO `t_score` VALUES ('54', '英语', '46', '18');
INSERT INTO `t_score` VALUES ('55', '语文', '70', '19');
INSERT INTO `t_score` VALUES ('56', '数学', '14', '19');
INSERT INTO `t_score` VALUES ('57', '英语', '20', '19');
INSERT INTO `t_score` VALUES ('58', '语文', '3', '20');
INSERT INTO `t_score` VALUES ('59', '数学', '72', '20');
