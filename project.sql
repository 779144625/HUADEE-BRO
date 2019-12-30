/*
Navicat MySQL Data Transfer

Source Server         : LaiXin
Source Server Version : 50559
Source Host           : localhost:3306
Source Database       : hwadee-project

Target Server Type    : MYSQL
Target Server Version : 50559
File Encoding         : 65001

Date: 2019-08-09 09:04:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for commentlist
-- ----------------------------
DROP TABLE IF EXISTS `commentlist`;
CREATE TABLE `commentlist` (
  `commentID` int(5) NOT NULL AUTO_INCREMENT COMMENT '用户评论维修',
  `userID` char(13) NOT NULL,
  `commentContent` varchar(255) NOT NULL COMMENT '评论内容',
  `commentTime` varchar(20) NOT NULL DEFAULT '',
  `ifSatisfied` int(5) NOT NULL COMMENT '是否满意',
  PRIMARY KEY (`commentID`) USING BTREE,
  KEY `comment_fk1` (`userID`) USING BTREE,
  CONSTRAINT `comment_fk1` FOREIGN KEY (`userID`) REFERENCES `userlist` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of commentlist
-- ----------------------------
INSERT INTO `commentlist` VALUES ('12', '2', 'test comment', '2019-08-07 23:22:10', '3');

-- ----------------------------
-- Table structure for missionlist
-- ----------------------------
DROP TABLE IF EXISTS `missionlist`;
CREATE TABLE `missionlist` (
  `missionID` int(3) NOT NULL AUTO_INCREMENT COMMENT '维修任务表',
  `userID` char(13) NOT NULL,
  `staffID` int(3) DEFAULT NULL,
  `missionStatus` varchar(35) NOT NULL COMMENT '已完成、未完成、拒绝维修',
  `missionTime` varchar(20) NOT NULL,
  `missionType` varchar(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `staffCost` varchar(20) DEFAULT '0',
  `address` varchar(255) DEFAULT NULL,
  `finishTime` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`missionID`) USING BTREE,
  KEY `mission_fk2` (`userID`) USING BTREE,
  KEY `mission_fk3` (`staffID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of missionlist
-- ----------------------------
INSERT INTO `missionlist` VALUES ('36', '2', '1', 'finish', '2019-08-08 09:49:00', '停电', '', '128', '11栋5单元252', '2019-08-09 08:41:38');
INSERT INTO `missionlist` VALUES ('37', '1', '2', 'Deliveried', '2019-08-08 14:07:33', '窗帘', '坏了', '0', '11栋5单元252', 'unfinish');
INSERT INTO `missionlist` VALUES ('38', '1', '1', 'Deliveried', '2019-08-08 14:30:47', '椅子', '椅子坏了', '0', '11栋3单元207', 'unfinish');
INSERT INTO `missionlist` VALUES ('39', '1', '2', 'Deliveried', '2019-08-08 14:31:40', '停电', '2', '0', '11栋3单元207', 'unfinish');

-- ----------------------------
-- Table structure for newslist
-- ----------------------------
DROP TABLE IF EXISTS `newslist`;
CREATE TABLE `newslist` (
  `newsID` int(5) NOT NULL AUTO_INCREMENT COMMENT '后勤新闻表',
  `newsType` varchar(20) DEFAULT NULL,
  `newsContent` varchar(1000) NOT NULL,
  `newsTime` varchar(20) NOT NULL,
  PRIMARY KEY (`newsID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of newslist
-- ----------------------------
INSERT INTO `newslist` VALUES ('5', '后勤保障部召开支部工会研讨会', '       7月21日晚，后勤保障部在夹金山干部学院召开支部工作研讨会，加强和改进基层党建工作，全面推进支部标准化规范化建设。后勤保障部党委中心组成员、党支部委员参加会议。\r\n       后勤保障部党委书记柳运西以《认真学习贯彻新版<中国共产党支部工作条例（试行）>》为题，为党委中心组成员、新任支部委员讲授了一堂精彩的党课。柳运西从党支部职责定位和工作原则、组织设置、基本任务、工作机制、组织生活、委员会建设等方面展开解读，帮助参会人员进一步读懂弄通《条例》精神实质。他要求，要把学习宣传贯彻《条例》作为当前加强党的基层组织建设的重要内容和基本任务，中心组带头学习，各支部辅导解读，确保把《条例》精神传达到每一名党员。\r\n        各党支部分别就上半年工作开展情况、下半年工作安排部署进行了发言，将取得的成绩、总结的经验、遇到的问题在会上进行了分享。与会人员积极发言、交流经验，共同探讨如何解决支部建设过程中遇到的不足。\r\n         此次研讨会是后勤保障部党支部和支委调整后的第一次集体会议，全体支部委员表示，将继续发挥党建引领作用，加强思想政治建设，促进业务与党建融合发展，做好后勤保障工作，打造服务育人阵地。\r\n', '2019-08-08 13:33:59');

-- ----------------------------
-- Table structure for stafflist
-- ----------------------------
DROP TABLE IF EXISTS `stafflist`;
CREATE TABLE `stafflist` (
  `staffID` int(3) NOT NULL AUTO_INCREMENT COMMENT '维修员工表',
  `staffName` varchar(20) NOT NULL,
  `workStatus` varchar(3) NOT NULL COMMENT '空闲、工作中、不在职',
  PRIMARY KEY (`staffID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of stafflist
-- ----------------------------
INSERT INTO `stafflist` VALUES ('1', '关傲', '1');
INSERT INTO `stafflist` VALUES ('2', '赖鑫', '2');

-- ----------------------------
-- Table structure for userlist
-- ----------------------------
DROP TABLE IF EXISTS `userlist`;
CREATE TABLE `userlist` (
  `userID` char(13) NOT NULL COMMENT '用户表、注册、登录功能',
  `name` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `picUrl` varchar(100) DEFAULT '/image/green.png',
  `userType` varchar(20) NOT NULL COMMENT '学术、维修人员、后勤教工、管理员',
  `phoneNum` char(11) DEFAULT NULL,
  `address` varchar(20) DEFAULT NULL COMMENT '学生宿舍地址、其它人员可不填写',
  PRIMARY KEY (`userID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of userlist
-- ----------------------------
INSERT INTO `userlist` VALUES ('1', '杨仕明', '1', '/image/d56a8e24a07a48e99a507ec4cc3a34c6.jpeg', '管理人员', '13584269221', '11栋3单元207');
INSERT INTO `userlist` VALUES ('2', '宾翊轲', '2', '/image/7b46e3a9b0b64ce9a8160c8b322bf4c8.png', '维修人员', '1216878184', '11栋5单元252');
INSERT INTO `userlist` VALUES ('2017220304004', '关傲', '123456', '/image/green.png', '学生', '1596943341', '11栋7单元380');
INSERT INTO `userlist` VALUES ('201722030401', '李丙涛', '123456', '/image/green.png', '学生', '1358115251', '11栋3单元125');
INSERT INTO `userlist` VALUES ('2017220304014', '赖鑫', '123456', '/image/green.png', '管理人员', '1235466519', '11栋5单元252');
INSERT INTO `userlist` VALUES ('201722030407', 'PDD', '123123', null, '学生', '45689', '11栋3单元206');
INSERT INTO `userlist` VALUES ('201722030408', '周淑仪', '123456', '/image/green.png', '学生', '16454621649', '11栋3单元207');
INSERT INTO `userlist` VALUES ('3', '关傲', '3', '/image/green.png', '学生', '644555', '11栋3单元207');
