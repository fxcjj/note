/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50622
Source Host           : localhost:3306
Source Database       : t1

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2016-09-21 17:49:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_student`
-- ----------------------------
DROP TABLE IF EXISTS `t_student`;
CREATE TABLE `t_studentdent` (
  `stu_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `stu_name` varchar(20) DEFAULT NULL,
  `class_id` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`stu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_student
-- ----------------------------
INSERT INTO `t_student` VALUES ('1', '张三', '1');
INSERT INTO `t_student` VALUES ('2', '赵峰', '1');
INSERT INTO `t_student` VALUES ('3', '小祥', '1');
INSERT INTO `t_student` VALUES ('4', '小新', '2');
INSERT INTO `t_student` VALUES ('5', '龙泽罗拉', '2');
INSERT INTO `t_student` VALUES ('6', '赵子龙', '3');
INSERT INTO `t_student` VALUES ('7', '刘备', '3');
INSERT INTO `t_student` VALUES ('8', '诸葛亮', '3');
INSERT INTO `t_student` VALUES ('9', '曹操', '3');
INSERT INTO `t_student` VALUES ('10', '张三丰', '4');
INSERT INTO `t_student` VALUES ('11', '张无忌', '4');
INSERT INTO `t_student` VALUES ('12', '周芷若', '4');
INSERT INTO `t_student` VALUES ('13', '宋青书', '4');
INSERT INTO `t_student` VALUES ('14', '唐僧', '5');
INSERT INTO `t_student` VALUES ('15', '孙悟空', '5');
INSERT INTO `t_student` VALUES ('16', '八戒', '5');
INSERT INTO `t_student` VALUES ('17', '沙僧', '5');
INSERT INTO `t_student` VALUES ('18', '小白龙', '5');
INSERT INTO `t_student` VALUES ('19', '李克强', '6');
INSERT INTO `t_student` VALUES ('20', '小日本', '7');
