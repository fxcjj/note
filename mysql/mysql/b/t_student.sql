/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50622
Source Host           : localhost:3306
Source Database       : t2

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2016-09-23 11:32:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_student`
-- ----------------------------
DROP TABLE IF EXISTS `t_student`;
CREATE TABLE `t_student` (
  `stu_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(20) DEFAULT NULL,
  `gender` varchar(5) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  PRIMARY KEY (`stu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_student
-- ----------------------------
INSERT INTO `t_student` VALUES ('1', '张三', 'f', '1994-06-14');
INSERT INTO `t_student` VALUES ('2', '赵峰', 'f', '1995-04-19');
INSERT INTO `t_student` VALUES ('3', '小祥', 'f', '1994-12-15');
INSERT INTO `t_student` VALUES ('4', '小新', 'f', '1999-03-02');
INSERT INTO `t_student` VALUES ('5', '龙泽罗拉', 'f', '1995-06-16');
INSERT INTO `t_student` VALUES ('6', '赵子龙', 'm', '1990-06-06');
INSERT INTO `t_student` VALUES ('7', '刘备', 'm', '1994-11-13');
INSERT INTO `t_student` VALUES ('8', '诸葛亮', 'm', '1998-02-11');
INSERT INTO `t_student` VALUES ('9', '曹操', 'm', '1992-06-09');
INSERT INTO `t_student` VALUES ('10', '张三丰', 'm', '1990-07-05');
INSERT INTO `t_student` VALUES ('11', '张无忌', 'f', '1999-05-28');
INSERT INTO `t_student` VALUES ('12', '周芷若', 'f', '1997-02-13');
INSERT INTO `t_student` VALUES ('13', '宋青书', 'f', '1999-09-23');
INSERT INTO `t_student` VALUES ('14', '唐僧', 'f', '1999-12-17');
INSERT INTO `t_student` VALUES ('15', '孙悟空', 'f', '1990-07-19');
INSERT INTO `t_student` VALUES ('16', '八戒', 'm', '1991-07-13');
INSERT INTO `t_student` VALUES ('17', '沙僧', 'm', '1993-04-18');
INSERT INTO `t_student` VALUES ('18', '小白龙', 'm', '1993-08-01');
INSERT INTO `t_student` VALUES ('19', '李克强', 'm', '1996-05-25');
INSERT INTO `t_student` VALUES ('20', '小日本', 'm', '1993-04-15');
