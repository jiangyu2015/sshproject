/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50616
Source Host           : localhost:3306
Source Database       : eju

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2016-01-26 16:49:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for activity
-- ----------------------------
DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `event_id` int(4) NOT NULL,
  `hd_type` enum('其他','同城会','一元购','社区特卖','社区礼包','定时开','老虎机','摇一摇') DEFAULT NULL,
  `hd_date` date NOT NULL,
  `peisong_cost` int(6) DEFAULT '0',
  `xiaoma_cost` int(6) DEFAULT '0',
  `hd_state` enum('已结束','未结束') DEFAULT NULL,
  `yt_id` int(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activity
-- ----------------------------
INSERT INTO `activity` VALUES ('1', '1', '老虎机', '2015-11-07', '10', '0', null, '0');
INSERT INTO `activity` VALUES ('2', '1', '老虎机', '2015-11-10', '5', '0', null, '0');
INSERT INTO `activity` VALUES ('3', '1', '老虎机', '2015-11-20', '25', '0', null, '0');
INSERT INTO `activity` VALUES ('4', '1', '老虎机', '2015-11-30', '10', '0', null, '0');
INSERT INTO `activity` VALUES ('5', '2', '摇一摇', '2015-11-19', '20', '0', null, '0');
INSERT INTO `activity` VALUES ('6', '2', '摇一摇', '2015-11-20', '30', '0', null, '0');
INSERT INTO `activity` VALUES ('7', '2', '摇一摇', '2015-11-21', '5', '0', null, '0');
INSERT INTO `activity` VALUES ('8', '2', '摇一摇', '2015-11-24', '16', '0', null, '0');
INSERT INTO `activity` VALUES ('9', '3', '一元购', '2015-11-10', '3', '0', null, '0');
INSERT INTO `activity` VALUES ('10', '3', '一元购', '2015-11-11', '10', '0', null, '0');
INSERT INTO `activity` VALUES ('11', '3', '一元购', '2015-12-01', '7', '0', null, '0');

-- ----------------------------
-- Table structure for ck_detail
-- ----------------------------
DROP TABLE IF EXISTS `ck_detail`;
CREATE TABLE `ck_detail` (
  `ck_id` int(4) NOT NULL AUTO_INCREMENT,
  `sp_id` int(4) NOT NULL,
  `sh_id` int(4) DEFAULT NULL,
  `ck_time` date DEFAULT NULL,
  `ck_number` int(10) DEFAULT NULL,
  `ck_place_id` int(10) DEFAULT NULL,
  `ck_place` varchar(30) DEFAULT NULL,
  `yf_number` int(10) DEFAULT NULL,
  `ck_type` enum('任意配置','一元购','社区特卖','物业礼包','其他','福利') DEFAULT '任意配置',
  `category` enum('正常转库','正常调拨','借领','正常出库') DEFAULT '正常出库',
  `remark` varchar(30) DEFAULT NULL,
  `yt_id` int(4) DEFAULT NULL,
  `adduser` varchar(30) DEFAULT NULL,
  `state` enum('ok','no') DEFAULT 'no',
  `checkuser` varchar(30) DEFAULT NULL,
  `expect_ck_time` date DEFAULT NULL,
  PRIMARY KEY (`ck_id`),
  KEY `出库商品id` (`sp_id`),
  KEY `出库库存地点id` (`ck_place_id`),
  CONSTRAINT `出库商品id` FOREIGN KEY (`sp_id`) REFERENCES `sp_info` (`sp_id`),
  CONSTRAINT `出库库存地点id` FOREIGN KEY (`ck_place_id`) REFERENCES `kc_place` (`kc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ck_detail
-- ----------------------------
INSERT INTO `ck_detail` VALUES ('62', '1101', '1', '2015-11-03', '75', '2', '一楼仓库', null, '社区特卖', '正常出库', '调至昆山', '3', null, 'ok', null, null);
INSERT INTO `ck_detail` VALUES ('63', '1102', '2', '2015-11-03', '52', '2', '一楼仓库', null, '一元购', '正常出库', '调至昆山', '3', null, 'ok', null, null);
INSERT INTO `ck_detail` VALUES ('91', '1', '2', '2015-12-01', '50', '2', '一楼仓库', null, '一元购', '正常出库', '悲伤', '3', null, 'ok', null, null);
INSERT INTO `ck_detail` VALUES ('92', '3', '3', '2015-12-30', '20', '7', '373号领奖处', null, '一元购', '正常出库', '啦啦22', '3', null, 'ok', null, null);
INSERT INTO `ck_detail` VALUES ('93', '1', '4', '2015-12-03', '10', '2', '一楼仓库', null, '一元购', '正常出库', null, '3', null, 'ok', null, null);
INSERT INTO `ck_detail` VALUES ('94', '1', '1', '2015-12-21', '30', '2', '一楼仓库', null, '一元购', '正常出库', null, '3', null, 'ok', null, null);
INSERT INTO `ck_detail` VALUES ('95', '4', '2', '2015-12-01', '40', '5', '一楼仓库/虚拟入库', null, '一元购', '正常出库', null, '3', null, 'ok', null, null);
INSERT INTO `ck_detail` VALUES ('96', '1234', '3', '2015-11-06', '888', '2', '一楼仓库', null, '一元购', '正常出库', null, '3', null, 'ok', null, null);
INSERT INTO `ck_detail` VALUES ('97', '1', '4', '2015-11-30', '20', '1', null, null, '一元购', '正常出库', null, '3', null, 'ok', null, null);
INSERT INTO `ck_detail` VALUES ('98', '4', '1', '2015-11-30', '1000', '4', null, '1000', '一元购', '正常出库', '', '3', null, 'ok', null, null);
INSERT INTO `ck_detail` VALUES ('99', '3', '2', '2015-12-10', '20', '7', null, '20', '一元购', '正常出库', null, '1', null, 'ok', null, null);
INSERT INTO `ck_detail` VALUES ('100', '3', '3', '2015-12-10', '30', '7', null, '30', '一元购', '正常出库', null, '1', null, 'ok', null, null);
INSERT INTO `ck_detail` VALUES ('101', '1234', '1', '2015-12-10', '30', '2', null, '30', '一元购', '正常出库', null, '1', null, 'ok', null, null);
INSERT INTO `ck_detail` VALUES ('102', '7', '1', '2015-12-10', '10', '1', null, '10', '一元购', '正常出库', null, '9', null, 'ok', null, null);
INSERT INTO `ck_detail` VALUES ('103', '3', '1', '2015-12-11', '2', '7', null, '2', '社区特卖', '正常出库', null, '8', null, 'ok', null, null);
INSERT INTO `ck_detail` VALUES ('104', '3', '1', '2015-12-11', '5', '7', null, '5', '社区特卖', '正常出库', null, '8', null, 'ok', null, null);
INSERT INTO `ck_detail` VALUES ('111', '3', '1', '2015-12-17', '10', '7', null, null, '社区特卖', '正常出库', null, '8', null, 'ok', null, null);
INSERT INTO `ck_detail` VALUES ('112', '3', '1', '2015-12-17', '10', '7', null, null, '社区特卖', '正常出库', null, '8', null, 'ok', null, null);
INSERT INTO `ck_detail` VALUES ('113', '3', '1', '2015-12-17', '30', '7', null, null, '社区特卖', '正常出库', null, '8', null, 'ok', null, null);
INSERT INTO `ck_detail` VALUES ('114', '3', '1', '2015-12-17', '10', '7', null, null, '社区特卖', '正常出库', null, '8', null, 'ok', null, null);
INSERT INTO `ck_detail` VALUES ('115', '3', '1', '2015-12-17', '2', '7', null, null, '社区特卖', '正常出库', null, '8', null, 'ok', null, null);
INSERT INTO `ck_detail` VALUES ('116', '3', '1', '2015-12-17', '2', '7', null, null, '社区特卖', '正常出库', null, '8', null, 'ok', null, null);
INSERT INTO `ck_detail` VALUES ('117', '3', '1', '2015-12-17', '2', '7', null, null, '社区特卖', '正常出库', null, '8', null, 'ok', null, null);
INSERT INTO `ck_detail` VALUES ('118', '3', '1', '2015-12-17', '2', '7', null, null, '社区特卖', '正常出库', null, '8', null, 'ok', null, null);
INSERT INTO `ck_detail` VALUES ('119', '3', '1', '2015-12-17', '10', '7', null, null, '社区特卖', '正常出库', null, '8', null, 'ok', null, null);
INSERT INTO `ck_detail` VALUES ('120', '3', '1', '2015-12-19', '12', '7', null, '12', '社区特卖', '正常出库', null, '8', null, 'ok', null, null);
INSERT INTO `ck_detail` VALUES ('121', '1254', '28', '2015-12-30', '30', '1', null, '30', '福利', '正常出库', null, '53', '王瑜佳', 'ok', null, null);
INSERT INTO `ck_detail` VALUES ('122', '1234', '1', '2015-12-31', '10', '2', null, '10', '一元购', '正常出库', null, '1', '王瑜佳', 'ok', null, null);
INSERT INTO `ck_detail` VALUES ('123', '3', '1', '2015-12-31', '1', '7', null, null, '社区特卖', '正常出库', null, '8', '王瑜佳', 'ok', null, null);
INSERT INTO `ck_detail` VALUES ('124', '3', '1', '2015-12-31', '1', '7', null, '1', '社区特卖', '正常出库', null, '8', '王瑜佳', 'ok', null, null);
INSERT INTO `ck_detail` VALUES ('125', '1254', '28', '2015-12-31', '30', '1', null, '30', '福利', '正常出库', null, '53', '王瑜佳', 'ok', null, null);
INSERT INTO `ck_detail` VALUES ('126', '1254', '28', '2015-12-31', '10', '1', null, '10', '福利', '正常出库', null, '53', '王瑜佳', 'ok', null, null);
INSERT INTO `ck_detail` VALUES ('127', '10', '26', '2016-01-25', '20', '2', null, null, '任意配置', '正常调拨', null, null, '王瑜佳', 'ok', '王瑜佳', null);
INSERT INTO `ck_detail` VALUES ('128', '3', '5', null, '100', '7', null, null, '社区特卖', '正常调拨', null, null, '诶', 'no', null, null);
INSERT INTO `ck_detail` VALUES ('129', '10', '26', '2016-01-18', '19', '2', null, '20', '任意配置', '正常调拨', null, null, '王瑜佳', 'ok', '王瑜佳', null);
INSERT INTO `ck_detail` VALUES ('130', '10', '26', null, null, '2', null, '20', '任意配置', '正常调拨', null, null, '王瑜佳', 'no', null, null);
INSERT INTO `ck_detail` VALUES ('131', '4', '3', '2016-01-25', '20', '4', null, '20', '一元购', '正常调拨', null, null, '王瑜佳', 'ok', '王瑜佳', null);
INSERT INTO `ck_detail` VALUES ('132', '3', '5', null, null, '7', null, '100', '社区特卖', '正常调拨', null, null, '诶', 'no', null, null);
INSERT INTO `ck_detail` VALUES ('133', '4', '5', null, '30', '2', null, null, '福利', '正常转库', null, null, '王瑜佳', 'ok', null, null);
INSERT INTO `ck_detail` VALUES ('134', '3', '1', null, '50', '3', null, null, '一元购', '正常转库', null, null, '王瑜佳', 'ok', null, null);
INSERT INTO `ck_detail` VALUES ('135', '3', '1', '2016-01-08', '100', '3', null, '100', '一元购', '正常调拨', null, null, null, 'ok', '王瑜佳', null);
INSERT INTO `ck_detail` VALUES ('136', '4', '3', '2016-01-06', null, '4', null, '23', '一元购', '正常调拨', null, null, null, 'ok', '王瑜佳', null);
INSERT INTO `ck_detail` VALUES ('137', '1', '1', null, '20', '1', null, null, '一元购', '正常转库', null, null, null, 'ok', null, null);
INSERT INTO `ck_detail` VALUES ('138', '3', '2', '2015-12-31', '5', '7', null, null, '一元购', '正常出库', null, '16', '诶', 'ok', null, null);
INSERT INTO `ck_detail` VALUES ('139', '1269', '32', '2016-01-06', '10', '1', null, '10', '社区特卖', '正常调拨', null, null, '王瑜佳', 'ok', '王瑜佳', null);
INSERT INTO `ck_detail` VALUES ('140', '1269', '32', '2016-01-06', '30', '1', null, null, '社区特卖', '正常出库', null, '63', '王瑜佳', 'ok', null, null);
INSERT INTO `ck_detail` VALUES ('141', '1269', '32', '2016-01-06', '5', '1', null, null, '社区特卖', '正常出库', null, '63', '王瑜佳', 'ok', null, null);
INSERT INTO `ck_detail` VALUES ('142', '1271', '35', '2016-01-06', '30', '2', null, null, '一元购', '正常出库', null, '67', '王瑜佳', 'ok', null, null);
INSERT INTO `ck_detail` VALUES ('143', '1271', '35', '2016-01-06', '4', '2', null, null, '一元购', '正常出库', null, '67', '王瑜佳', 'ok', null, null);
INSERT INTO `ck_detail` VALUES ('144', '10', '26', null, null, '2', null, '20', '任意配置', '正常调拨', null, null, '诶', 'no', null, null);
INSERT INTO `ck_detail` VALUES ('145', '1271', '35', '2016-01-08', '10', '2', null, null, '一元购', '正常出库', null, '67', '王瑜佳', 'ok', null, null);
INSERT INTO `ck_detail` VALUES ('146', '10', '26', null, null, '2', null, '10', '任意配置', '正常调拨', null, null, '王瑜佳', 'no', null, null);
INSERT INTO `ck_detail` VALUES ('147', '10', '26', null, null, '2', null, '20', '任意配置', '正常调拨', null, null, '诶', 'no', null, null);
INSERT INTO `ck_detail` VALUES ('148', '4', '3', '2016-01-25', '499', '4', null, '500', '一元购', '正常调拨', null, null, null, 'ok', '王瑜佳', null);
INSERT INTO `ck_detail` VALUES ('149', '1241', '4', null, null, '1', null, '20', '一元购', '正常调拨', null, null, '诶', 'no', null, null);
INSERT INTO `ck_detail` VALUES ('150', '4', '3', null, null, '4', null, '200', '一元购', '正常调拨', null, null, null, 'no', null, null);
INSERT INTO `ck_detail` VALUES ('151', '4', '3', null, null, '4', null, '20', '一元购', '正常调拨', null, null, '诶', 'no', null, null);
INSERT INTO `ck_detail` VALUES ('152', '1234', '1', null, null, '2', null, '200', '任意配置', '正常调拨', null, null, '诶', 'no', null, null);
INSERT INTO `ck_detail` VALUES ('153', '4', '5', null, null, '2', null, '20', '福利', '正常调拨', null, null, '诶', 'no', null, null);
INSERT INTO `ck_detail` VALUES ('154', '3', '1', null, null, '2', null, '200', '一元购', '正常调拨', null, null, '诶', 'no', null, null);
INSERT INTO `ck_detail` VALUES ('155', '4', '3', null, null, '4', null, '200', '一元购', '正常调拨', null, null, '诶', 'no', null, null);
INSERT INTO `ck_detail` VALUES ('156', '1271', '35', null, null, '2', null, '40', '一元购', '正常调拨', null, null, '王瑜佳', 'no', null, null);
INSERT INTO `ck_detail` VALUES ('157', '3', '5', null, null, '5', null, '50', '社区特卖', '正常调拨', null, null, '王瑜佳', 'no', null, null);
INSERT INTO `ck_detail` VALUES ('158', '4', '3', null, null, '4', null, '200', '一元购', '正常调拨', null, null, null, 'no', null, null);
INSERT INTO `ck_detail` VALUES ('159', '1269', '32', null, null, '1', null, '20', '社区特卖', '正常调拨', null, null, '王瑜佳', 'no', null, null);
INSERT INTO `ck_detail` VALUES ('160', '10', '26', null, null, '2', null, '30', '任意配置', '正常调拨', null, null, '王瑜佳', 'no', null, null);
INSERT INTO `ck_detail` VALUES ('161', '3', '1', null, null, '2', null, null, '一元购', '正常转库', null, null, '王瑜佳', 'ok', null, null);
INSERT INTO `ck_detail` VALUES ('162', '1', '6', null, null, '1', null, '201', '一元购', '正常调拨', null, null, '王瑜佳', 'no', null, null);
INSERT INTO `ck_detail` VALUES ('163', '1', '1', '2016-01-14', '2', '1', null, null, '一元购', '正常出库', null, '43', '王瑜佳', 'ok', null, null);

-- ----------------------------
-- Table structure for db_application
-- ----------------------------
DROP TABLE IF EXISTS `db_application`;
CREATE TABLE `db_application` (
  `db_application_id` int(8) NOT NULL AUTO_INCREMENT,
  `db_in` int(4) NOT NULL,
  `db_out` int(4) NOT NULL,
  `sp_id` int(8) NOT NULL,
  `sh_id` int(8) NOT NULL,
  `db_number` int(8) NOT NULL,
  `expectDate` date DEFAULT NULL,
  `rk_type` enum('福利','物业礼包','社区特卖','一元购','任意配置') DEFAULT '任意配置',
  `adduser` varchar(30) DEFAULT NULL,
  `edituser` varchar(30) DEFAULT NULL,
  `checkuser` varchar(30) DEFAULT NULL,
  `auditTime` datetime DEFAULT NULL,
  `applicationDate` datetime DEFAULT NULL,
  `state` enum('yesno','yesok','no') DEFAULT 'no',
  PRIMARY KEY (`db_application_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of db_application
-- ----------------------------
INSERT INTO `db_application` VALUES ('1', '1', '4', '4', '3', '23', null, '一元购', '王瑜佳', '王瑜佳', '王瑜佳', '2015-12-29 13:58:15', '2015-12-29 13:31:44', 'no');
INSERT INTO `db_application` VALUES ('2', '5', '1', '1', '6', '201', '2016-01-27', '一元购', '王瑜佳', '王瑜佳', '王瑜佳', '2016-01-25 14:27:32', '2015-12-29 15:16:06', 'yesok');
INSERT INTO `db_application` VALUES ('3', '4', '2', '10', '26', '20', '2016-01-31', '任意配置', '王瑜佳', null, '王瑜佳', '2015-12-30 15:09:38', '2015-12-29 15:17:03', 'no');
INSERT INTO `db_application` VALUES ('4', '5', '7', '3', '5', '100', '2016-01-27', '社区特卖', '诶', null, '王瑜佳', '2015-12-30 15:56:25', '2015-12-29 17:13:16', 'no');
INSERT INTO `db_application` VALUES ('5', '2', '3', '3', '1', '100', '2016-01-28', '一元购', null, '王瑜佳', '王瑜佳', '2015-12-31 10:58:13', '2015-12-30 15:04:26', 'yesok');
INSERT INTO `db_application` VALUES ('6', '3', '4', '4', '3', '23', '2015-12-31', '一元购', null, null, '王瑜佳', '2015-12-31 10:58:17', '2015-12-30 15:04:45', 'yesok');
INSERT INTO `db_application` VALUES ('7', '5', '2', '10', '26', '20', '2016-01-21', '任意配置', '王瑜佳', null, '王瑜佳', '2015-12-30 15:11:06', '2015-12-30 15:07:22', 'no');
INSERT INTO `db_application` VALUES ('8', '3', '4', '4', '3', '20', '2016-02-02', '一元购', '王瑜佳', null, '王瑜佳', '2015-12-30 15:28:54', '2015-12-30 15:23:56', 'no');
INSERT INTO `db_application` VALUES ('9', '4', '2', '10', '26', '10', '2016-01-28', '任意配置', '王瑜佳', '王瑜佳', '王瑜佳', '2016-01-21 15:19:31', '2015-12-31 11:46:42', 'yesok');
INSERT INTO `db_application` VALUES ('10', '3', '2', '10', '26', '20', '2016-01-21', '任意配置', '诶', '王瑜佳', '王瑜佳', '2016-01-21 15:19:34', '2015-12-31 16:08:05', 'yesok');
INSERT INTO `db_application` VALUES ('11', '5', '2', '10', '26', '20', '2015-12-28', '任意配置', '诶', null, '王瑜佳', '2016-01-07 16:51:51', '2015-12-31 16:11:42', 'no');
INSERT INTO `db_application` VALUES ('12', '2', '1', '1241', '4', '20', '2015-12-30', '一元购', '诶', null, '王瑜佳', '2016-01-21 15:19:39', '2015-12-31 16:15:56', 'no');
INSERT INTO `db_application` VALUES ('13', '4', '4', '4', '3', '20', '2015-12-30', '一元购', '诶', '王瑜佳', '王瑜佳', '2016-01-21 15:20:38', '2015-12-31 16:19:37', 'yesok');
INSERT INTO `db_application` VALUES ('14', '5', '2', '1234', '1', '200', '2016-01-21', '任意配置', '诶', '王瑜佳', '王瑜佳', '2016-01-21 15:20:40', '2015-12-31 16:22:05', 'no');
INSERT INTO `db_application` VALUES ('15', '3', '2', '4', '5', '20', '2015-12-21', '福利', '诶', null, '王瑜佳', '2016-01-21 15:20:43', '2015-12-31 16:25:22', 'no');
INSERT INTO `db_application` VALUES ('16', '6', '4', '4', '3', '200', '2015-12-29', '一元购', null, '王瑜佳', '王瑜佳', '2016-01-21 15:19:42', '2015-12-31 16:27:04', 'yesok');
INSERT INTO `db_application` VALUES ('17', '2', '4', '4', '3', '500', '2016-01-26', '一元购', null, '王瑜佳', '王瑜佳', '2016-01-21 15:19:36', '2015-12-31 16:27:33', 'no');
INSERT INTO `db_application` VALUES ('18', '2', '2', '3', '1', '200', '2015-12-29', '一元购', '诶', '王瑜佳', '王瑜佳', '2016-01-21 15:20:46', '2015-12-31 16:34:33', 'yesok');
INSERT INTO `db_application` VALUES ('19', '1', '4', '4', '3', '200', '2016-01-29', '一元购', '诶', null, '王瑜佳', '2016-01-21 15:20:48', '2015-12-31 16:37:22', 'yesok');
INSERT INTO `db_application` VALUES ('20', '2', '1', '1269', '32', '10', '2016-01-08', '社区特卖', '王瑜佳', null, '王瑜佳', '2016-01-06 14:31:51', '2016-01-06 14:30:52', 'no');
INSERT INTO `db_application` VALUES ('21', '2', '2', '1271', '35', '40', '2016-01-08', '一元购', '王瑜佳', '王瑜佳', '王瑜佳', '2016-01-21 15:20:50', '2016-01-07 15:28:36', 'yesno');
INSERT INTO `db_application` VALUES ('22', '1', '5', '3', '5', '50', '2016-01-15', '社区特卖', '王瑜佳', null, '王瑜佳', '2016-01-21 15:20:53', '2016-01-07 16:49:29', 'yesok');
INSERT INTO `db_application` VALUES ('23', '4', '4', '4', '3', '200', '2016-01-09', '一元购', null, '王瑜佳', '王瑜佳', '2016-01-21 15:20:56', '2016-01-08 13:17:51', 'no');
INSERT INTO `db_application` VALUES ('24', '2', '1', '1269', '32', '20', '2016-01-08', '社区特卖', '王瑜佳', null, '王瑜佳', '2016-01-21 15:20:59', '2016-01-08 13:24:55', 'no');
INSERT INTO `db_application` VALUES ('25', '3', '2', '3', '1', '1000', '2016-11-30', '一元购', '王瑜佳', null, '王瑜佳', '2016-01-11 16:08:36', '2016-01-11 16:07:53', 'yesno');
INSERT INTO `db_application` VALUES ('26', '5', '2', '10', '26', '30', '2016-02-11', '任意配置', '王瑜佳', null, '王瑜佳', '2016-01-21 15:21:02', '2016-01-21 14:49:21', 'yesok');

-- ----------------------------
-- Table structure for events
-- ----------------------------
DROP TABLE IF EXISTS `events`;
CREATE TABLE `events` (
  `event_id` int(10) NOT NULL AUTO_INCREMENT,
  `event_name` varchar(30) DEFAULT NULL,
  `hd_id` varchar(10) DEFAULT NULL,
  `remark` varchar(50) DEFAULT NULL,
  `userName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of events
-- ----------------------------

-- ----------------------------
-- Table structure for hd_info
-- ----------------------------
DROP TABLE IF EXISTS `hd_info`;
CREATE TABLE `hd_info` (
  `hd_id` int(4) NOT NULL,
  `hd_info` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`hd_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hd_info
-- ----------------------------

-- ----------------------------
-- Table structure for ht_info
-- ----------------------------
DROP TABLE IF EXISTS `ht_info`;
CREATE TABLE `ht_info` (
  `ht_id` int(4) NOT NULL,
  `sld_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ht_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ht_info
-- ----------------------------

-- ----------------------------
-- Table structure for inventory_flow_chart
-- ----------------------------
DROP TABLE IF EXISTS `inventory_flow_chart`;
CREATE TABLE `inventory_flow_chart` (
  `kcld_id` int(4) NOT NULL AUTO_INCREMENT,
  `sp_id` int(4) NOT NULL,
  `sp_name` varchar(30) DEFAULT NULL,
  `sh_id` int(4) NOT NULL,
  `cf_place` varchar(30) DEFAULT NULL,
  `sp_type` varchar(10) DEFAULT NULL,
  `ccrk_time` datetime NOT NULL,
  `ccrk_number` int(5) DEFAULT NULL,
  `unit` varchar(5) DEFAULT NULL,
  `expiration_date` datetime DEFAULT NULL,
  `zm_excess_stock` int(5) DEFAULT NULL,
  `syyt_number` int(5) NOT NULL,
  `after_yt_available_number` int(5) DEFAULT NULL,
  `yt_total_number` int(5) DEFAULT NULL,
  PRIMARY KEY (`kcld_id`),
  KEY `inventory_flow_sp_id` (`sp_id`) USING BTREE,
  KEY `inventory_flow_sh_id` (`sh_id`) USING BTREE,
  CONSTRAINT `inventory_flow_sh_id` FOREIGN KEY (`sh_id`) REFERENCES `sh_info` (`sh_id`),
  CONSTRAINT `inventory_flow_sp_id` FOREIGN KEY (`sp_id`) REFERENCES `sp_info` (`sp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of inventory_flow_chart
-- ----------------------------

-- ----------------------------
-- Table structure for kc_place
-- ----------------------------
DROP TABLE IF EXISTS `kc_place`;
CREATE TABLE `kc_place` (
  `kc_id` int(4) NOT NULL AUTO_INCREMENT,
  `place` varchar(30) NOT NULL,
  `state` varchar(30) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `receiver` varchar(30) DEFAULT NULL,
  `tel` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`kc_id`),
  KEY `place` (`place`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kc_place
-- ----------------------------
INSERT INTO `kc_place` VALUES ('1', '昆山仓库', null, 'A', 'a', '11');
INSERT INTO `kc_place` VALUES ('2', '一楼仓库', null, 'B', 'b', '22');
INSERT INTO `kc_place` VALUES ('3', '宝山仓库', null, 'C', 'c', '33');
INSERT INTO `kc_place` VALUES ('4', '四楼财务室进门抽屉', null, 'D', 'd', '44');
INSERT INTO `kc_place` VALUES ('5', '一楼仓库/虚拟入库', null, 'E', 'e', '55');
INSERT INTO `kc_place` VALUES ('6', '四楼403', null, 'F', 'f', '66');
INSERT INTO `kc_place` VALUES ('7', '373号领奖处', null, 'G', 'g', '77');
INSERT INTO `kc_place` VALUES ('8', '四楼行政办公室', null, 'H', 'h', '88');
INSERT INTO `kc_place` VALUES ('9', '四楼财务室保险箱', null, 'I', 'i', '99');
INSERT INTO `kc_place` VALUES ('10', '四楼财务室箱子', null, 'J', 'j', '00');

-- ----------------------------
-- Table structure for rk_application
-- ----------------------------
DROP TABLE IF EXISTS `rk_application`;
CREATE TABLE `rk_application` (
  `rk_application_id` int(4) NOT NULL AUTO_INCREMENT,
  `sh_id` int(4) DEFAULT NULL,
  `sh_name` varchar(30) DEFAULT NULL,
  `sp_id` int(4) DEFAULT NULL,
  `sp_name` varchar(30) DEFAULT NULL,
  `expect_rk_time` date DEFAULT NULL,
  `expect_rk_number` int(10) DEFAULT NULL,
  `commodity_rating` varchar(10) DEFAULT NULL,
  `sld_id` varchar(10) DEFAULT NULL,
  `rk_place_id` int(4) DEFAULT NULL,
  `rk_place_add` varchar(30) DEFAULT NULL,
  `rk_type` enum('任意配置','一元购','社区特卖','物业礼包','福利') DEFAULT '任意配置',
  `state` enum('yesok','yesno','no') DEFAULT 'no',
  `applicationDate` date DEFAULT NULL,
  `auditTime` datetime DEFAULT NULL,
  `adduser` varchar(30) DEFAULT NULL,
  `edituser` varchar(30) DEFAULT NULL,
  `checkuser` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`rk_application_id`),
  KEY `spid` (`sp_id`) USING BTREE,
  KEY `shmc` (`sh_name`) USING BTREE,
  KEY `rk_place_add` (`rk_place_add`),
  KEY `sp_name` (`sp_name`),
  CONSTRAINT `rk_place_add` FOREIGN KEY (`rk_place_add`) REFERENCES `kc_place` (`place`),
  CONSTRAINT `sh_name` FOREIGN KEY (`sh_name`) REFERENCES `sh_info` (`sh_name`),
  CONSTRAINT `sp_name` FOREIGN KEY (`sp_name`) REFERENCES `sp_info` (`sp_name`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rk_application
-- ----------------------------
INSERT INTO `rk_application` VALUES ('1', '9', '首道养生', '1', '松江原生态大米（2斤装）', '2015-11-05', '200', null, null, '6', '一楼仓库', '一元购', 'yesok', null, null, '笔', null, null);
INSERT INTO `rk_application` VALUES ('2', '9', '斯锐凯博（上海）健身服务有限公司', '7', '南瓜庄园天然南瓜籽', null, '200', null, null, '6', '373号领奖处', '社区特卖', 'no', null, null, '笔', '诶', null);
INSERT INTO `rk_application` VALUES ('3', '1', '首道养生', '1', '松江原生态大米（2斤装）', '2015-11-06', '50', null, null, '7', '373号领奖处', '一元购', 'yesno', null, null, '笔', '诶', null);
INSERT INTO `rk_application` VALUES ('4', '1', '首道养生', '1', '查理氏果汁饮料', '2015-11-20', '40', null, null, '2', '一楼仓库', '一元购', 'yesok', null, '2016-01-21 17:26:24', '笔', '诶', '王瑜佳');
INSERT INTO `rk_application` VALUES ('5', '1', '首道养生', '3', '下午茶饼干', '2015-11-03', '20', null, null, '7', '373号领奖处', '物业礼包', 'yesok', null, '2015-12-16 16:16:28', '笔', null, null);
INSERT INTO `rk_application` VALUES ('6', '8', '鞋博士皮具修护中心', '4', '实惠早餐蛋糕', '2015-11-10', '30', null, null, '5', '一楼仓库/虚拟入库', '一元购', 'yesno', null, '2015-12-16 16:16:32', '笔', null, null);
INSERT INTO `rk_application` VALUES ('7', '4', '波奇宠物', '5', '查理氏果汁饮料', '2015-11-27', '300', null, null, '2', '一楼仓库', '一元购', 'no', null, null, '笔', null, null);
INSERT INTO `rk_application` VALUES ('10', '1', '首道养生', '3', '下午茶饼干', '2015-12-19', '100', 'A', '123', '2', '一楼仓库', '一元购', 'no', null, '2015-12-16 16:31:28', '笔', null, null);
INSERT INTO `rk_application` VALUES ('11', '4', '波奇宠物', '1241', '我是商品1', '2015-11-30', '1000', 'A', '123', '1', '昆山仓库', '一元购', 'yesok', null, null, '笔', '诶', null);
INSERT INTO `rk_application` VALUES ('12', '3', '大地黑牛清真火锅', '1', '松江原生态大米（2斤装）', '2015-12-03', '1000', 'A', '123', '2', '一楼仓库', '一元购', 'no', '2015-12-03', null, '笔', null, null);
INSERT INTO `rk_application` VALUES ('13', '3', '大地黑牛清真火锅', '4', '实惠早餐蛋糕', '2015-12-03', '1000', 'A', '12', '4', '四楼财务室进门抽屉', '一元购', 'yesok', '2015-12-03', '2015-12-16 16:31:31', '笔', null, null);
INSERT INTO `rk_application` VALUES ('14', '2', '斯锐凯博（上海）健身服务有限公司', '1', '松江原生态大米（2斤装）', '2015-12-04', '100', 'A', '100', '2', '一楼仓库', '一元购', 'yesok', '2015-12-04', '2016-01-21 16:34:59', '笔', null, '王瑜佳');
INSERT INTO `rk_application` VALUES ('15', '27', '商户A', '1252', '测试商品1', '2015-11-02', '100', 'A', '', '1', '昆山仓库', '一元购', 'yesno', '2015-12-09', null, '笔', null, null);
INSERT INTO `rk_application` VALUES ('16', '17', '一果人生', '7', '南瓜庄园天然南瓜籽', '2015-12-12', '100', '', '1', '1', '昆山仓库', '一元购', 'yesno', '2015-12-11', null, '笔', null, null);
INSERT INTO `rk_application` VALUES ('17', '1', '首道养生', '1', '松江原生态大米（2斤装）', '2015-12-14', '200', 'AAA', '12', '2', '一楼仓库', '一元购', 'no', '2015-12-14', '2015-12-31 11:00:56', '笔', null, '王瑜佳');
INSERT INTO `rk_application` VALUES ('18', '1', '首道养生', '1253', '商品AA', '2015-12-15', '200', 'AAA', '123', '2', '一楼仓库', '一元购', 'no', '2015-12-15', '2015-12-18 16:31:26', '笔', null, null);
INSERT INTO `rk_application` VALUES ('19', '1', '首道养生', '1', '松江原生态大米（2斤装）', '2016-01-14', '888', 'A', '12', '1', '昆山仓库', '一元购', 'yesok', '2015-12-16', '2016-01-14 18:03:01', '笔', '王瑜佳', '王瑜佳');
INSERT INTO `rk_application` VALUES ('20', '26', '小地方', '4', '实惠早餐蛋糕', '2015-12-31', '1000', 'AAA', '123', '1', '昆山仓库', '社区特卖', 'yesok', '2015-12-16', null, '笔', '诶', null);
INSERT INTO `rk_application` VALUES ('21', '26', '小地方', '3', '下午茶饼干', '2015-12-16', '1000', 'A', '12', '1', '昆山仓库', '一元购', 'no', '2015-12-16', null, '笔', null, null);
INSERT INTO `rk_application` VALUES ('22', '9', '波奇宠物', '7', '南瓜庄园天然南瓜籽', '2015-12-26', '1000', 'AAA', '1213', '6', '一楼仓库', '社区特卖', 'yesok', '2015-12-16', null, '笔', null, null);
INSERT INTO `rk_application` VALUES ('23', '26', '小地方', '4', '实惠早餐蛋糕', '2015-12-31', '100', 'AAA', '123', '2', '一楼仓库', '一元购', 'no', '2015-12-16', null, '笔', null, null);
INSERT INTO `rk_application` VALUES ('24', '1', '首道养生', '1', '松江原生态大米（2斤装）', '2015-12-31', '200', 'AAA', '123', '2', '一楼仓库', '任意配置', 'no', '2015-12-16', null, '笔', null, null);
INSERT INTO `rk_application` VALUES ('25', '26', '小地方', '4', '实惠早餐蛋糕', '2015-12-16', '200', 'B+', '123', '2', '一楼仓库', '任意配置', 'yesok', '2015-12-16', '2016-01-21 15:18:04', '笔', null, '王瑜佳');
INSERT INTO `rk_application` VALUES ('26', '9', '卡拉丁(上海)汽车技术服务有限公司', '4', '实惠早餐蛋糕', '2016-01-20', '200', 'AAA', '123', '2', '一楼仓库', '一元购', 'yesok', '2015-12-16', '2016-01-21 15:18:07', '笔', '王瑜佳', '王瑜佳');
INSERT INTO `rk_application` VALUES ('27', '26', '小地方', '5', '查理氏果汁饮料', '2015-12-16', '1000', 'AAAA', '120', '3', '宝山仓库', '福利', 'no', '2015-12-16', '2016-01-21 15:18:11', '笔', null, '王瑜佳');
INSERT INTO `rk_application` VALUES ('28', '4', '波奇宠物', '2', '松江原生态大米（2斤装）', '2016-01-20', '200', 'AAAA', '123', '3', '宝山仓库', '任意配置', 'yesok', '2015-12-16', '2016-01-21 15:18:13', '笔', '王瑜佳', '王瑜佳');
INSERT INTO `rk_application` VALUES ('29', '2', '斯锐凯博（上海）健身服务有限公司', '3', '下午茶饼干', '2015-12-16', '200', 'AAA', '123555', '2', '一楼仓库', '任意配置', 'yesok', '2015-12-16', '2015-12-21 17:21:20', '笔', '王瑜佳', '王瑜佳');
INSERT INTO `rk_application` VALUES ('30', '14', '摩之家健康咨询(上海)有限公司', '3', '下午茶饼干', '2016-01-20', '100', 'AAA', '1213', '2', '一楼仓库', '任意配置', 'yesok', '2015-12-16', '2016-01-21 15:18:16', '笔', '王瑜佳', '王瑜佳');
INSERT INTO `rk_application` VALUES ('31', '1', '首道养生', '6', '卡依之黑莓葡萄汁', '2015-12-17', '100', 'AAA', '123', '2', '一楼仓库', '任意配置', 'yesno', '2015-12-16', '2015-12-18 16:31:04', '笔', null, null);
INSERT INTO `rk_application` VALUES ('32', '28', '大陆大葱培育有限公司', '1254', '我是一根葱', '2015-12-18', '10000000', 'A++', '0058888', '1', '昆山仓库', '福利', 'yesok', '2015-12-18', '2015-12-18 16:30:53', '笔', null, null);
INSERT INTO `rk_application` VALUES ('33', '30', '悲伤的商户2', '1254', '我是一根葱', '2015-12-31', '100', 'BBB', '1234', '1', '昆山仓库', '一元购', 'yesok', '2015-12-21', '2015-12-21 17:17:55', '王瑜佳', '王瑜佳', '王瑜佳');
INSERT INTO `rk_application` VALUES ('34', '26', '小地方', '10', '荷高全脂牛奶', '2015-12-31', '100', 'A+', '123', '2', '一楼仓库', '任意配置', 'yesok', '2015-12-24', '2015-12-24 16:39:02', '笔', null, null);
INSERT INTO `rk_application` VALUES ('35', '2', '波奇宠物', '13', '非非水', '2016-01-21', '100', 'AAA', '1213', '3', '一楼仓库/虚拟入库', '社区特卖', 'yesok', '2015-12-31', '2016-01-21 15:17:52', '王瑜佳', '王瑜佳', '王瑜佳');
INSERT INTO `rk_application` VALUES ('36', '2', '斯锐凯博（上海）健身服务有限公司', '2', '松江原生态大米（2斤装）', '2016-01-07', '1000', 'A', '12', '3', '宝山仓库', '社区特卖', 'yesok', '2016-01-06', '2016-01-21 15:18:01', '王瑜佳', '诶', '王瑜佳');
INSERT INTO `rk_application` VALUES ('37', '32', '黄土高坡', '1269', '一抔土', '2016-01-07', '100', 'AAAA', '', '1', '昆山仓库', '社区特卖', 'yesok', '2016-01-06', '2016-01-06 13:29:11', '王瑜佳', '王瑜佳', '王瑜佳');
INSERT INTO `rk_application` VALUES ('38', '7', '实惠上海', '9', '妇菌洁女士内裤消毒泡腾片.33g*10片', '2016-01-31', '1000', 'A+', '', '4', '四楼财务室进门抽屉', '社区特卖', 'yesok', '2016-01-07', '2016-01-21 15:18:19', '诶', '王瑜佳', '王瑜佳');
INSERT INTO `rk_application` VALUES ('39', '35', '山上', '1271', '小白兔', '2016-01-09', '100', 'A', '', '2', '一楼仓库', '一元购', 'yesok', '2016-01-07', '2016-01-07 15:13:35', '王瑜佳', null, '王瑜佳');
INSERT INTO `rk_application` VALUES ('40', '34', '大金', '13', '非非水', '2016-01-31', '40', '', '', '7', '373号领奖处', '一元购', 'yesok', '2016-01-07', '2016-01-21 15:18:22', '王瑜佳', null, '王瑜佳');
INSERT INTO `rk_application` VALUES ('41', '34', '大金', '13', '非非水', '2016-01-31', '40', '', '', '7', '373号领奖处', '一元购', 'yesok', '2016-01-07', '2016-01-21 15:18:27', '王瑜佳', null, '王瑜佳');
INSERT INTO `rk_application` VALUES ('42', '8', '鞋博士皮具修护中心', '5', '查理氏果汁饮料', '2016-01-31', '100', '', '', '5', '一楼仓库/虚拟入库', '一元购', 'yesok', '2016-01-07', '2016-01-21 15:18:24', '王瑜佳', null, '王瑜佳');
INSERT INTO `rk_application` VALUES ('43', '8', '鞋博士皮具修护中心', '4', '实惠早餐蛋糕', '2016-01-31', '100', '', '', '5', '一楼仓库/虚拟入库', '一元购', 'yesok', '2016-01-07', '2016-01-21 15:18:30', '王瑜佳', null, '王瑜佳');
INSERT INTO `rk_application` VALUES ('44', '13', '海码头', '13', '非非水', '2016-01-20', '400', null, '', '2', '一楼仓库', '社区特卖', 'yesok', '2016-01-14', '2016-01-21 15:18:33', '王瑜佳', '王瑜佳', '王瑜佳');
INSERT INTO `rk_application` VALUES ('45', '8', '鞋博士皮具修护中心', '6', '卡依之黑莓葡萄汁', '2016-01-14', '100', null, '', '3', '宝山仓库', '社区特卖', 'yesok', '2016-01-14', '2016-01-21 15:18:35', '王瑜佳', null, '王瑜佳');
INSERT INTO `rk_application` VALUES ('46', '7', '实惠上海', '5', '查理氏果汁饮料', '2016-01-31', '1000', null, '', '5', '一楼仓库/虚拟入库', '社区特卖', 'yesok', '2016-01-14', '2016-01-18 17:00:11', '王瑜佳', null, null);
INSERT INTO `rk_application` VALUES ('47', '35', '山上', '1273', '测试星期一', '2016-01-28', '1005', null, '', '3', '一楼仓库', '物业礼包', 'yesok', '2016-01-18', '2016-01-18 17:00:03', '王瑜佳', '王瑜佳', null);
INSERT INTO `rk_application` VALUES ('48', '4', '波奇宠物', '1263', '我试试空格', '2016-03-04', '2000', null, '', '1', '昆山仓库', '一元购', 'yesok', '2016-01-20', '2016-01-21 15:18:38', '诶', '王瑜佳', '王瑜佳');
INSERT INTO `rk_application` VALUES ('49', '17', '一果人生', '13', '非非水', '2016-01-20', '200', null, '', '1', '昆山仓库', '一元购', 'yesok', '2016-01-20', '2016-01-21 15:18:41', '王瑜佳', null, '王瑜佳');

-- ----------------------------
-- Table structure for rk_detail
-- ----------------------------
DROP TABLE IF EXISTS `rk_detail`;
CREATE TABLE `rk_detail` (
  `rk_id` int(4) NOT NULL AUTO_INCREMENT,
  `sp_id` int(4) DEFAULT NULL,
  `sh_id` int(4) DEFAULT NULL,
  `expect_rk_time` date DEFAULT NULL,
  `sj_stock_date` date DEFAULT NULL,
  `rk_place_id` int(4) DEFAULT NULL,
  `expect_rk_number` int(10) DEFAULT NULL,
  `ss_number` int(10) DEFAULT NULL,
  `remark` varchar(30) DEFAULT NULL,
  `rk_type` enum('一元购','社区特卖','物业礼包','任意配置','福利') DEFAULT '任意配置',
  `category` enum('正常转库','正常调拨','正常入库') DEFAULT '正常入库',
  `state` enum('no','ok') DEFAULT 'no',
  `checkuser` varchar(30) DEFAULT NULL,
  `adduser` varchar(30) DEFAULT NULL,
  `rkapplicationId` int(4) DEFAULT NULL,
  PRIMARY KEY (`rk_id`),
  KEY `rksp_id` (`sp_id`) USING BTREE,
  KEY `rk_plcae_id` (`rk_place_id`),
  CONSTRAINT `rksp_id` FOREIGN KEY (`sp_id`) REFERENCES `sp_info` (`sp_id`),
  CONSTRAINT `rk_plcae_id` FOREIGN KEY (`rk_place_id`) REFERENCES `kc_place` (`kc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rk_detail
-- ----------------------------
INSERT INTO `rk_detail` VALUES ('1', '1234', '1', null, '2015-10-02', '2', null, '1000', null, '任意配置', '正常入库', 'ok', null, null, null);
INSERT INTO `rk_detail` VALUES ('2', '1235', '2', null, '2015-10-05', '1', null, '500', '', '任意配置', '正常入库', 'ok', null, null, null);
INSERT INTO `rk_detail` VALUES ('3', '1237', '3', null, '2015-10-06', '2', null, '2000', '', '社区特卖', '正常入库', 'ok', null, null, null);
INSERT INTO `rk_detail` VALUES ('4', '1', '4', null, '2015-11-05', '2', null, '200', null, '一元购', '正常入库', 'ok', null, null, null);
INSERT INTO `rk_detail` VALUES ('5', '3', '5', null, '2015-12-01', '7', null, '200', null, '社区特卖', '正常入库', 'ok', null, null, null);
INSERT INTO `rk_detail` VALUES ('6', '1', '6', null, '2015-11-06', '7', null, '50', null, '一元购', '正常入库', 'ok', null, null, null);
INSERT INTO `rk_detail` VALUES ('7', '1', '1', null, '2015-11-20', '2', null, '40', null, '一元购', '正常入库', 'ok', null, null, null);
INSERT INTO `rk_detail` VALUES ('8', '3', '2', null, '2015-11-03', '7', null, '20', null, '一元购', '正常入库', 'ok', null, null, null);
INSERT INTO `rk_detail` VALUES ('9', '4', '3', null, '2015-11-10', '5', null, '30', null, '一元购', '正常入库', 'ok', null, null, null);
INSERT INTO `rk_detail` VALUES ('10', '1234', '4', null, '2015-11-06', '3', null, '888', null, '一元购', '正常入库', 'ok', null, null, null);
INSERT INTO `rk_detail` VALUES ('11', '4', '5', null, '2015-12-16', '2', null, '40', null, '福利', '正常入库', 'ok', null, null, null);
INSERT INTO `rk_detail` VALUES ('12', '1', '6', null, '2015-11-30', '1', null, '1000', null, '一元购', '正常入库', 'ok', null, null, null);
INSERT INTO `rk_detail` VALUES ('13', '1', '1', null, '2015-12-04', '1', null, '1000', null, '一元购', '正常入库', 'ok', '王瑜佳', null, null);
INSERT INTO `rk_detail` VALUES ('14', '2', '2', null, '2015-11-30', '2', null, '1000', null, '一元购', '正常入库', 'ok', null, null, null);
INSERT INTO `rk_detail` VALUES ('15', '3', '1', null, '2015-11-27', '3', null, '1000', '', '一元购', '正常入库', 'ok', null, null, null);
INSERT INTO `rk_detail` VALUES ('16', '4', '2', null, '2015-11-04', '4', null, '1000', '', '物业礼包', '正常入库', 'ok', '王瑜佳', null, null);
INSERT INTO `rk_detail` VALUES ('17', '1', '1', null, '2015-12-01', '4', null, '1000', '', '一元购', '正常入库', 'ok', null, null, null);
INSERT INTO `rk_detail` VALUES ('18', '1127', '3', null, '2015-12-01', null, null, '1000', '', '一元购', '正常入库', 'ok', '王瑜佳', null, null);
INSERT INTO `rk_detail` VALUES ('19', '1', '5', null, '2015-12-04', '7', null, '100', null, '一元购', '正常入库', 'ok', '王瑜佳', null, null);
INSERT INTO `rk_detail` VALUES ('20', '1', '27', null, '2015-12-04', '2', null, '1000', null, '一元购', '正常入库', 'ok', '王瑜佳', null, null);
INSERT INTO `rk_detail` VALUES ('21', '1', '2', '2015-12-04', '2015-12-05', '2', '100', '1000', null, '一元购', '正常入库', 'ok', null, null, null);
INSERT INTO `rk_detail` VALUES ('22', '1252', '27', '2015-11-02', '2015-12-09', '1', '100', '100', null, '一元购', '正常入库', 'ok', null, null, null);
INSERT INTO `rk_detail` VALUES ('23', '7', '17', '2015-12-12', '2015-12-13', '1', '100', '100', null, '一元购', '正常入库', 'ok', null, null, null);
INSERT INTO `rk_detail` VALUES ('24', '1253', '1', '2015-12-15', '2015-12-15', '2', '200', '200', null, '一元购', '正常入库', 'ok', null, null, null);
INSERT INTO `rk_detail` VALUES ('25', '1', '1', '2015-11-20', '2015-12-19', '2', '40', '40', null, '一元购', '正常入库', 'ok', null, null, null);
INSERT INTO `rk_detail` VALUES ('26', '3', '1', '2015-11-30', '2015-12-21', '2', '100', '100', null, '一元购', '正常入库', 'ok', '王瑜佳', null, null);
INSERT INTO `rk_detail` VALUES ('27', '1241', '4', '2015-11-30', '2015-12-05', '1', '1000', '1000', null, '一元购', '正常入库', 'ok', '王瑜佳', null, null);
INSERT INTO `rk_detail` VALUES ('28', '1241', '4', '2015-11-30', '2015-12-01', '1', '1000', '998', null, '一元购', '正常入库', 'ok', '王瑜佳', null, null);
INSERT INTO `rk_detail` VALUES ('29', '1', '3', '2015-12-03', null, '2', '1000', null, null, '一元购', '正常入库', 'no', null, null, null);
INSERT INTO `rk_detail` VALUES ('30', '1', '1', '2015-12-16', '2015-12-16', '1', '1000', '1000', null, '一元购', '正常入库', 'ok', null, null, null);
INSERT INTO `rk_detail` VALUES ('31', '3', '26', '2015-12-16', '2015-12-16', '1', '1000', '1000', null, '一元购', '正常入库', 'ok', null, null, null);
INSERT INTO `rk_detail` VALUES ('32', '1', '4', '2015-12-26', '2015-12-16', '2', '1000', '1000', null, '社区特卖', '正常入库', 'ok', null, null, null);
INSERT INTO `rk_detail` VALUES ('33', '4', '26', '2015-12-31', null, '2', '100', null, null, '一元购', '正常入库', 'no', null, null, null);
INSERT INTO `rk_detail` VALUES ('34', '4', '26', '2015-12-31', null, '1', '1000', null, null, '社区特卖', '正常入库', 'no', null, null, null);
INSERT INTO `rk_detail` VALUES ('35', '3', '1', '2015-11-03', '2016-01-22', '7', '20', '40', null, '物业礼包', '正常入库', 'ok', '王瑜佳', null, null);
INSERT INTO `rk_detail` VALUES ('36', '3', '1', '2015-12-19', '2015-12-16', '2', '100', '1000', null, '一元购', '正常入库', 'ok', null, null, null);
INSERT INTO `rk_detail` VALUES ('37', '4', '3', '2015-12-03', null, '4', '1000', '1000', 'no', '一元购', '正常入库', 'ok', null, null, null);
INSERT INTO `rk_detail` VALUES ('38', '1254', '28', '2015-12-18', '2015-12-19', '1', '10000000', '9999999', null, '福利', '正常入库', 'ok', null, null, null);
INSERT INTO `rk_detail` VALUES ('39', '1254', '30', '2015-12-31', null, '1', '100', null, null, '一元购', '正常入库', 'no', null, '王瑜佳', null);
INSERT INTO `rk_detail` VALUES ('40', '3', '2', '2015-12-16', null, '2', '200', null, null, '任意配置', '正常入库', 'no', null, null, null);
INSERT INTO `rk_detail` VALUES ('41', '10', '26', '2015-12-31', '2015-12-24', '2', '100', '100', null, '任意配置', '正常入库', 'ok', null, null, null);
INSERT INTO `rk_detail` VALUES ('42', '10', '26', '2016-01-31', null, '4', null, '20', null, '任意配置', '正常调拨', 'ok', null, '王瑜佳', null);
INSERT INTO `rk_detail` VALUES ('43', '3', '5', '2016-01-27', null, '5', null, '100', null, '社区特卖', '正常调拨', 'ok', null, '诶', null);
INSERT INTO `rk_detail` VALUES ('44', '10', '26', '2016-01-31', null, '4', '20', null, null, '任意配置', '正常调拨', 'no', null, '王瑜佳', null);
INSERT INTO `rk_detail` VALUES ('45', '10', '26', '2016-01-21', null, '5', '20', null, null, '任意配置', '正常调拨', 'no', null, '王瑜佳', null);
INSERT INTO `rk_detail` VALUES ('46', '4', '3', '2016-02-02', null, '3', '20', null, null, '一元购', '正常调拨', 'no', null, '王瑜佳', null);
INSERT INTO `rk_detail` VALUES ('47', '3', '5', '2016-01-27', null, '5', '100', null, null, '社区特卖', '正常调拨', 'no', null, '诶', null);
INSERT INTO `rk_detail` VALUES ('48', '4', '5', '2015-12-31', null, '2', null, '30', null, '物业礼包', '正常转库', 'ok', null, '王瑜佳', null);
INSERT INTO `rk_detail` VALUES ('49', '3', '1', '2016-02-25', null, '3', null, '50', null, '任意配置', '正常转库', 'ok', null, '王瑜佳', null);
INSERT INTO `rk_detail` VALUES ('50', '3', '1', '2016-01-28', '2016-01-22', '2', '100', '100', null, '一元购', '正常调拨', 'ok', '王瑜佳', null, null);
INSERT INTO `rk_detail` VALUES ('51', '4', '3', '2015-12-31', null, '3', '23', null, null, '一元购', '正常调拨', 'no', null, null, null);
INSERT INTO `rk_detail` VALUES ('52', '1', '1', '2015-12-29', null, '1', null, '20', null, '任意配置', '正常转库', 'ok', null, null, null);
INSERT INTO `rk_detail` VALUES ('53', '1', '1', '2015-12-14', '2016-01-06', '2', '200', '180', null, '一元购', '正常入库', 'ok', '王瑜佳', null, null);
INSERT INTO `rk_detail` VALUES ('54', '1269', '32', '2016-01-07', '2016-01-07', '1', '100', '100', null, '社区特卖', '正常入库', 'ok', '王瑜佳', '王瑜佳', null);
INSERT INTO `rk_detail` VALUES ('55', '1269', '32', '2016-01-08', '2016-01-06', '2', '10', '10', null, '社区特卖', '正常调拨', 'ok', '王瑜佳', '王瑜佳', null);
INSERT INTO `rk_detail` VALUES ('56', '1271', '35', '2016-01-09', '2016-01-06', '2', '100', '100', null, '一元购', '正常入库', 'ok', '王瑜佳', '王瑜佳', null);
INSERT INTO `rk_detail` VALUES ('57', '10', '26', '2015-12-28', null, '5', '20', null, null, '任意配置', '正常调拨', 'no', null, '诶', null);
INSERT INTO `rk_detail` VALUES ('58', '1', '1', '2016-01-14', null, '1', '888', null, null, '一元购', '正常入库', 'no', null, '笔', '19');
INSERT INTO `rk_detail` VALUES ('59', '1273', '35', '2016-01-28', '2016-01-07', '2', '1005', '1000', null, '物业礼包', '正常入库', 'ok', '王瑜佳', '王瑜佳', '47');
INSERT INTO `rk_detail` VALUES ('60', '5', '7', '2016-01-31', '2016-01-18', '5', '1000', '998', null, '社区特卖', '正常入库', 'ok', '王瑜佳', '王瑜佳', '46');
INSERT INTO `rk_detail` VALUES ('61', '13', '4', '2016-01-21', null, '5', '100', null, null, '社区特卖', '正常入库', 'no', null, '王瑜佳', '35');
INSERT INTO `rk_detail` VALUES ('62', '2', '2', '2016-01-07', null, '3', '1000', null, null, '社区特卖', '正常入库', 'no', null, '王瑜佳', '36');
INSERT INTO `rk_detail` VALUES ('63', '4', '26', '2015-12-16', null, '2', '200', null, null, '任意配置', '正常入库', 'no', null, '笔', '25');
INSERT INTO `rk_detail` VALUES ('64', '4', '9', '2016-01-20', null, '2', '200', null, null, '一元购', '正常入库', 'no', null, '笔', '26');
INSERT INTO `rk_detail` VALUES ('65', '5', '26', '2015-12-16', null, '3', '1000', null, null, '福利', '正常入库', 'no', null, '笔', '27');
INSERT INTO `rk_detail` VALUES ('66', '2', '4', '2016-01-20', null, '3', '200', null, null, '任意配置', '正常入库', 'no', null, '笔', '28');
INSERT INTO `rk_detail` VALUES ('67', '3', '14', '2016-01-20', null, '2', '100', null, null, '任意配置', '正常入库', 'no', null, '笔', '30');
INSERT INTO `rk_detail` VALUES ('68', '9', '7', '2016-01-31', null, '4', '1000', null, null, '社区特卖', '正常入库', 'no', null, '诶', '38');
INSERT INTO `rk_detail` VALUES ('69', '13', '34', '2016-01-31', null, '7', '40', null, null, '一元购', '正常入库', 'no', null, '王瑜佳', '40');
INSERT INTO `rk_detail` VALUES ('70', '5', '8', '2016-01-31', null, '5', '100', null, null, '一元购', '正常入库', 'no', null, '王瑜佳', '42');
INSERT INTO `rk_detail` VALUES ('71', '13', '34', '2016-01-31', null, '7', '40', null, null, '一元购', '正常入库', 'no', null, '王瑜佳', '41');
INSERT INTO `rk_detail` VALUES ('72', '4', '8', '2016-01-31', null, '5', '100', null, null, '一元购', '正常入库', 'no', null, '王瑜佳', '43');
INSERT INTO `rk_detail` VALUES ('73', '13', '13', '2016-01-20', null, '2', '400', null, null, '社区特卖', '正常入库', 'no', null, '王瑜佳', '44');
INSERT INTO `rk_detail` VALUES ('74', '6', '8', '2016-01-14', null, '3', '100', null, null, '社区特卖', '正常入库', 'no', null, '王瑜佳', '45');
INSERT INTO `rk_detail` VALUES ('75', '1263', '4', '2016-03-04', null, '1', '2000', null, null, '一元购', '正常入库', 'no', null, '诶', '48');
INSERT INTO `rk_detail` VALUES ('76', '13', '17', '2016-01-20', null, '1', '200', null, null, '一元购', '正常入库', 'no', null, '王瑜佳', '49');
INSERT INTO `rk_detail` VALUES ('77', '10', '26', '2016-01-28', null, '4', '10', null, null, '任意配置', '正常调拨', 'no', null, '王瑜佳', null);
INSERT INTO `rk_detail` VALUES ('78', '10', '26', '2016-01-21', null, '3', '20', null, null, '任意配置', '正常调拨', 'no', null, '诶', null);
INSERT INTO `rk_detail` VALUES ('79', '4', '3', '2016-01-26', null, '2', '500', null, null, '一元购', '正常调拨', 'no', null, null, null);
INSERT INTO `rk_detail` VALUES ('80', '1241', '4', '2015-12-30', null, '2', '20', null, null, '一元购', '正常调拨', 'no', null, '诶', null);
INSERT INTO `rk_detail` VALUES ('81', '4', '3', '2015-12-29', null, '6', '200', null, null, '一元购', '正常调拨', 'no', null, null, null);
INSERT INTO `rk_detail` VALUES ('82', '4', '3', '2015-12-30', null, '4', '20', null, null, '一元购', '正常调拨', 'no', null, '诶', null);
INSERT INTO `rk_detail` VALUES ('83', '1234', '1', '2016-01-21', null, '5', '200', null, null, '任意配置', '正常调拨', 'no', null, '诶', null);
INSERT INTO `rk_detail` VALUES ('84', '4', '5', '2015-12-21', null, '3', '20', null, null, '福利', '正常调拨', 'no', null, '诶', null);
INSERT INTO `rk_detail` VALUES ('85', '3', '1', '2015-12-29', null, '2', '200', null, null, '一元购', '正常调拨', 'no', null, '诶', null);
INSERT INTO `rk_detail` VALUES ('86', '4', '3', '2016-01-29', null, '1', '200', null, null, '一元购', '正常调拨', 'no', null, '诶', null);
INSERT INTO `rk_detail` VALUES ('87', '1271', '35', '2016-01-08', null, '2', '40', null, null, '一元购', '正常调拨', 'no', null, '王瑜佳', null);
INSERT INTO `rk_detail` VALUES ('88', '3', '5', '2016-01-15', null, '1', '50', null, null, '社区特卖', '正常调拨', 'no', null, '王瑜佳', null);
INSERT INTO `rk_detail` VALUES ('89', '4', '3', '2016-01-09', null, '4', '200', null, null, '一元购', '正常调拨', 'no', null, null, null);
INSERT INTO `rk_detail` VALUES ('90', '1269', '32', '2016-01-08', null, '2', '20', null, null, '社区特卖', '正常调拨', 'no', null, '王瑜佳', null);
INSERT INTO `rk_detail` VALUES ('91', '10', '26', '2016-02-11', null, '5', '30', null, null, '任意配置', '正常调拨', 'no', null, '王瑜佳', null);
INSERT INTO `rk_detail` VALUES ('92', '1', '2', '2015-12-04', null, '2', '100', null, null, '一元购', '正常入库', 'no', null, '笔', '14');
INSERT INTO `rk_detail` VALUES ('93', '1', '1', '2015-11-20', null, '2', '40', null, null, '一元购', '正常入库', 'no', null, '笔', '4');
INSERT INTO `rk_detail` VALUES ('94', '3', '1', null, null, '2', null, null, null, '任意配置', '正常转库', 'ok', null, '王瑜佳', null);
INSERT INTO `rk_detail` VALUES ('95', '1', '6', '2016-01-27', null, '5', '201', null, null, '一元购', '正常调拨', 'no', null, '王瑜佳', null);

-- ----------------------------
-- Table structure for sh_info
-- ----------------------------
DROP TABLE IF EXISTS `sh_info`;
CREATE TABLE `sh_info` (
  `sh_id` int(4) NOT NULL AUTO_INCREMENT,
  `sh_name` varchar(30) NOT NULL,
  `sh_add` varchar(50) DEFAULT NULL,
  `linkman` varchar(5) DEFAULT NULL,
  `link_tel1` varchar(15) DEFAULT NULL,
  `link_tel2` varchar(15) DEFAULT NULL,
  `state` enum('no','yesno','yesok') NOT NULL DEFAULT 'no',
  `auditTime` datetime DEFAULT NULL,
  `adduser` varchar(30) DEFAULT NULL,
  `edituser` varchar(30) DEFAULT NULL,
  `checkuser` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`sh_id`,`sh_name`),
  KEY `商户名称` (`sh_name`),
  KEY `sh_id` (`sh_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sh_info
-- ----------------------------
INSERT INTO `sh_info` VALUES ('1', '首道养生', '试试', '试试', '1312412', '132412412', 'yesok', '2016-01-22 13:38:54', null, null, '王瑜佳');
INSERT INTO `sh_info` VALUES ('2', '斯锐凯博（上海）健身服务有限公司', '试试3', '试试3', '121231413', '1241242315', 'no', null, null, null, null);
INSERT INTO `sh_info` VALUES ('3', '大地黑牛清真火锅', '希希', '哈哈', '1224343535', '12313214', 'yesno', null, null, null, null);
INSERT INTO `sh_info` VALUES ('4', '波奇宠物', '试试', '试试', '132143214314', null, 'yesok', null, null, null, null);
INSERT INTO `sh_info` VALUES ('5', '诗灵菲', 'beiju', 'lala', '121312321', null, 'no', null, null, null, null);
INSERT INTO `sh_info` VALUES ('6', '好慷在线', '', '', '', '', 'yesno', '2015-12-16 15:52:47', null, null, null);
INSERT INTO `sh_info` VALUES ('7', '实惠上海', '', '', '', '', 'no', '2015-12-16 15:52:43', null, null, null);
INSERT INTO `sh_info` VALUES ('8', '鞋博士皮具修护中心', '', '', '', '', 'yesok', '2015-12-16 15:52:50', null, null, null);
INSERT INTO `sh_info` VALUES ('9', '卡拉丁(上海)汽车技术服务有限公司', '破地方', '破人', '12124135', '747474', 'yesok', '2016-01-18 16:11:37', null, '王瑜佳', '王瑜佳');
INSERT INTO `sh_info` VALUES ('10', '金生烘培DIY生活馆', '', '', '', '', 'yesok', '2015-12-21 16:00:39', null, '王瑜佳', null);
INSERT INTO `sh_info` VALUES ('11', '上海臻缘茶叶经营部', '', '', '', '', 'no', '2015-12-16 16:09:02', null, null, null);
INSERT INTO `sh_info` VALUES ('12', '大匠火锅', '', '', '', '', 'no', '2015-12-21 16:35:02', null, null, '王瑜佳');
INSERT INTO `sh_info` VALUES ('13', '海码头', 'Aa', 'aa', 'aa', 'aa', 'yesok', '2015-12-16 16:09:07', null, null, null);
INSERT INTO `sh_info` VALUES ('14', '摩之家健康咨询(上海)有限公司', '', '', '', '', 'yesok', '2016-01-18 15:58:44', null, '王瑜佳', '王瑜佳');
INSERT INTO `sh_info` VALUES ('15', '夏末摄影', '', '', '', '', 'yesok', '2015-12-16 16:09:49', null, null, null);
INSERT INTO `sh_info` VALUES ('16', 'RIZAP莱札谱', 'Aa', 'aa', '1213', '1213', 'no', '2016-01-18 16:04:33', null, null, '王瑜佳');
INSERT INTO `sh_info` VALUES ('17', '一果人生', '虹口区恒业路啦啦啦', '哈哈', '123456', '', 'yesok', '2016-01-18 16:04:17', null, '王瑜佳', '王瑜佳');
INSERT INTO `sh_info` VALUES ('18', '宜信卓越财富投资管理（北京）有限公司', '', '', '', '', 'yesok', '2016-01-18 16:04:20', null, '王瑜佳', '王瑜佳');
INSERT INTO `sh_info` VALUES ('19', '陶桃龙虾馆烧烤', '', '', '', '', 'yesok', '2016-01-18 16:04:23', null, null, '王瑜佳');
INSERT INTO `sh_info` VALUES ('20', '皓谷实业（上海）有限公司', '', '', '', '', 'no', '2016-01-18 16:07:33', null, '王瑜佳', '王瑜佳');
INSERT INTO `sh_info` VALUES ('22', '泰壹商贸有限公司', '', '', '', '', 'yesno', '2016-01-18 16:04:26', null, null, '王瑜佳');
INSERT INTO `sh_info` VALUES ('23', '上海纯K量贩KTV', '', '', '', '', 'yesok', '2016-01-18 16:04:14', null, null, '王瑜佳');
INSERT INTO `sh_info` VALUES ('24', '上海中优智慧医疗科技有限公司', '', '', '', '', 'no', '2016-01-18 16:04:29', null, null, '王瑜佳');
INSERT INTO `sh_info` VALUES ('25', '浦屹投资管理(上海)有限公司', '', '', '', '', 'yesno', '2015-12-21 16:05:28', null, null, '王瑜佳');
INSERT INTO `sh_info` VALUES ('26', '小地方', '虹口区恒业路啦啦啦', '我', '15221550239', '18768105782', 'yesok', null, null, null, null);
INSERT INTO `sh_info` VALUES ('27', '商户A', 'AA', 'joey', '1213', '057585152114', 'yesok', null, null, null, null);
INSERT INTO `sh_info` VALUES ('28', '大陆大葱培育有限公司', '上海市浦东新区浦东南路2000号', '陆先生', '1111111111', '', 'yesok', '2015-12-18 16:26:45', null, null, null);
INSERT INTO `sh_info` VALUES ('29', '悲伤的商户', '我在测试新增人', '哈哈', '12312412431', '132143124121', 'yesno', '2015-12-21 16:01:57', null, '王瑜佳', '王瑜佳');
INSERT INTO `sh_info` VALUES ('30', '悲伤的商户2', '试试', 'aa', '1213124', '18768105782', 'yesok', '2015-12-21 16:02:01', '王瑜佳', null, '王瑜佳');
INSERT INTO `sh_info` VALUES ('31', '必胜客', '虹口足球场', 'bb', '13004605064', '', 'yesok', '2016-01-18 16:04:10', '王瑜佳', null, '王瑜佳');
INSERT INTO `sh_info` VALUES ('32', '黄土高坡', '萨哈林', '你试试', '12345667', '', 'yesok', '2016-01-06 13:06:21', '王瑜佳', null, '王瑜佳');
INSERT INTO `sh_info` VALUES ('33', '小青', '心脏高原', 'bb', '1213124', '', 'yesok', '2016-01-18 16:00:34', '王瑜佳', null, '王瑜佳');
INSERT INTO `sh_info` VALUES ('34', '大金', '静安寺', '和尚', '121324234', '', 'yesok', '2016-01-06 11:17:35', '王瑜佳', '王瑜佳', '王瑜佳');
INSERT INTO `sh_info` VALUES ('35', '山上', '试试', 'yy', '12134234', '', 'yesok', '2016-01-07 15:09:27', '王瑜佳', null, '王瑜佳');

-- ----------------------------
-- Table structure for sp_info
-- ----------------------------
DROP TABLE IF EXISTS `sp_info`;
CREATE TABLE `sp_info` (
  `sp_id` int(4) NOT NULL AUTO_INCREMENT,
  `sp_name` varchar(30) NOT NULL,
  `back_name` varchar(30) DEFAULT NULL,
  `value` float(15,2) DEFAULT NULL,
  `price` float(15,2) DEFAULT NULL,
  `length` float(10,2) DEFAULT NULL,
  `wide` float(10,2) DEFAULT NULL,
  `tall` float(10,2) DEFAULT NULL,
  `mweight` float(10,2) DEFAULT NULL,
  `volume` float(10,2) DEFAULT NULL,
  `vweight` float(10,2) DEFAULT NULL,
  `standard` varchar(30) DEFAULT NULL,
  `unit` varchar(10) DEFAULT NULL,
  `service` enum('服务','实物') DEFAULT NULL,
  `creation_date` date DEFAULT NULL,
  `baozhiqi` int(10) DEFAULT NULL,
  `expiration_date` date DEFAULT NULL,
  `state` enum('no','yesno','yesok') NOT NULL DEFAULT 'no',
  `auditTime` datetime DEFAULT NULL,
  `adduser` varchar(30) DEFAULT NULL,
  `edituser` varchar(30) DEFAULT NULL,
  `checkuser` varchar(30) DEFAULT NULL,
  `commodity_rating` enum('C','B','B+','A','A+') DEFAULT NULL,
  PRIMARY KEY (`sp_id`),
  KEY `商品名称` (`sp_name`)
) ENGINE=InnoDB AUTO_INCREMENT=1274 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_info
-- ----------------------------
INSERT INTO `sp_info` VALUES ('1', '松江原生态大米（2斤装）', '松江原生态大米1袋（2斤装）', '19.80', '15.00', '4.00', '3.00', '1.00', '1000.00', null, null, '试试1213', '包', '实物', '2015-11-03', null, '2016-01-27', 'yesok', null, '诶', null, null, 'A+');
INSERT INTO `sp_info` VALUES ('2', '松江原生态大米（2斤装）', '松江原生态大米1袋（2斤装）', '19.80', '15.00', '4.00', '3.00', '1.00', '8.00', '2.00', '4.00', null, '包', '实物', '2015-12-03', '6', null, 'yesok', null, '诶', null, null, 'A+');
INSERT INTO `sp_info` VALUES ('3', '下午茶饼干', '阳光下午茶大礼包', '3.00', '3.00', null, null, null, null, null, null, 'no time', '包', '实物', '2015-11-20', null, '2015-11-26', 'yesok', null, '诶', null, null, 'A+');
INSERT INTO `sp_info` VALUES ('4', '实惠早餐蛋糕', '爱心早餐', '25.20', '25.20', null, null, null, null, null, null, '', '盒', '实物', null, null, null, 'yesok', null, '诶', null, null, 'A+');
INSERT INTO `sp_info` VALUES ('5', '查理氏果汁饮料', '', '34.90', '34.90', null, null, null, null, null, null, '', '瓶', '实物', null, null, null, 'yesok', null, '诶', null, null, 'A+');
INSERT INTO `sp_info` VALUES ('6', '卡依之黑莓葡萄汁', '', '5.00', '5.00', null, null, null, null, null, null, '', '盒', '实物', null, null, null, 'yesok', null, '诶', null, null, 'A+');
INSERT INTO `sp_info` VALUES ('7', '南瓜庄园天然南瓜籽', '南瓜庄园天然无壳南瓜籽', '30.00', '30.00', null, null, null, null, null, null, '', '包', '实物', null, null, null, 'yesok', null, '诶', null, null, 'A+');
INSERT INTO `sp_info` VALUES ('8', '同灿牛轧糖', '同灿牛轧糖', '39.00', '39.00', null, null, null, null, null, null, '', '袋', '实物', null, null, null, 'yesno', null, '诶', null, null, 'A+');
INSERT INTO `sp_info` VALUES ('9', '妇菌洁女士内裤消毒泡腾片.33g*10片', '妇菌洁消毒泡腾片一盒', '38.00', '38.00', null, null, null, null, null, null, '试试1213', '盒', '实物', null, null, null, 'yesok', null, '诶', null, null, 'A+');
INSERT INTO `sp_info` VALUES ('10', '荷高全脂牛奶', '荷高全脂牛奶', '65.00', '65.00', null, null, null, null, null, null, '', '份', '实物', null, null, null, 'yesok', '2015-12-16 15:23:48', '诶', null, null, 'A+');
INSERT INTO `sp_info` VALUES ('11', '安怡金装高钙低脂奶粉', '安怡低脂高钙奶粉一袋', '45.00', '45.00', null, null, null, null, null, null, null, '包', '实物', '2014-12-01', null, null, 'yesno', '2015-12-16 15:23:53', '诶', null, null, 'A');
INSERT INTO `sp_info` VALUES ('12', '安怡™金装高钙低脂配方奶粉300g', '高钙低脂配方奶粉300g', '45.00', '45.00', null, null, null, null, null, null, '', '包', '实物', null, null, null, 'yesok', '2015-12-16 15:30:49', '诶', null, null, 'A');
INSERT INTO `sp_info` VALUES ('13', '非非水', null, '3.00', '3.00', '1.00', '2.00', '3.00', '4.00', '5.00', '11.00', '上山', '瓶', '实物', '2015-12-16', '20', null, 'yesok', '2015-12-17 15:47:36', '诶', null, null, 'A');
INSERT INTO `sp_info` VALUES ('14', '派米盐焗开心果', '爱芬乐希腊进口年货', '20.00', '20.00', null, null, null, null, null, null, '', '包', '实物', null, null, null, 'yesno', '2015-12-21 16:39:09', '诶', null, '王瑜佳', 'A');
INSERT INTO `sp_info` VALUES ('15', '上海国际车展门票', '', '100.00', '100.00', null, null, null, null, null, null, '', '张', '实物', null, null, null, 'yesok', '2015-12-21 16:39:29', '诶', null, '王瑜佳', 'A');
INSERT INTO `sp_info` VALUES ('16', 'wills健身周卡', '', '468.00', '468.00', null, null, null, null, null, null, '', '张', '服务', null, null, null, 'yesno', '2015-12-29 16:33:47', '诶', null, '诶', 'A');
INSERT INTO `sp_info` VALUES ('17', '咔萨哇牌木薯片40g', '', '8.90', '8.90', null, null, null, null, null, null, '', '包\n', '实物', null, null, null, 'yesok', '2015-12-29 16:33:53', '诶', null, '诶', 'A');
INSERT INTO `sp_info` VALUES ('18', '咔萨哇牌木薯片120g', '咔萨哇木薯片', '24.00', '24.00', null, null, null, null, null, null, '', '包', '实物', '2016-01-05', '26', '2016-01-31', 'yesok', '2016-01-14 15:50:03', '诶', '王瑜佳', '王瑜佳', 'A');
INSERT INTO `sp_info` VALUES ('19', '吃吃看鱼松', '吃吃看三文鱼松', '39.90', '39.90', null, null, null, null, null, null, '', '袋', '实物', null, null, null, 'yesok', '2016-01-14 15:50:08', '诶', null, '王瑜佳', 'A');
INSERT INTO `sp_info` VALUES ('20', '拜尔口腔家庭卡（价值8580元）', '拜尔口腔家庭卡', '8580.00', '8580.00', null, null, null, null, null, null, '', '张', '服务', null, null, null, 'yesok', '2015-12-29 16:33:59', '诶', null, '诶', 'A');
INSERT INTO `sp_info` VALUES ('21', '加多宝凉茶（500ml）', null, '5.00', '5.00', null, null, null, null, null, null, null, '瓶', '实物', null, null, null, 'yesok', '2016-01-14 15:50:43', '诶', null, '王瑜佳', 'A');
INSERT INTO `sp_info` VALUES ('1101', '新版梦5辣味', '', null, '10.00', null, null, null, null, null, null, '', '', '实物', null, null, null, 'yesno', '2016-01-14 10:50:27', '诶', null, '王瑜佳', 'B+');
INSERT INTO `sp_info` VALUES ('1102', '新版梦5原味', '', null, '15.00', null, null, null, null, null, null, '', '', '实物', null, null, null, 'yesok', '2016-01-14 10:50:33', '诶', null, '王瑜佳', 'B+');
INSERT INTO `sp_info` VALUES ('1103', '蓝氏鸡肉芝士全价成猫粮', '', null, '20.00', null, null, null, null, null, null, '', '', '实物', null, null, null, 'yesok', '2016-01-14 15:50:18', '诶', null, '王瑜佳', 'B+');
INSERT INTO `sp_info` VALUES ('1104', '它时代宠物期刊杂志', '', null, '25.00', null, null, null, null, null, null, '', '', '实物', null, null, null, 'yesno', '2016-01-06 11:16:48', '诶', null, '王瑜佳', 'B+');
INSERT INTO `sp_info` VALUES ('1105', '好慷七彩布（7条/包）', '', null, '30.00', null, null, null, null, null, null, '', '', '实物', null, null, null, 'yesok', '2016-01-14 15:50:23', '诶', null, '王瑜佳', 'B+');
INSERT INTO `sp_info` VALUES ('1106', '易存网紫水晶手链2A，8mm，2串/份', '', null, '35.00', null, null, null, null, null, null, '', '', '实物', null, null, null, 'yesok', '2016-01-14 15:50:13', '诶', null, '王瑜佳', 'B+');
INSERT INTO `sp_info` VALUES ('1107', '乐扣乐扣Ye Dr.Fresh Fine600ml漱口水', '', null, '40.00', null, null, null, null, null, null, '', '', '实物', null, null, null, 'yesok', '2015-12-21 16:39:23', '诶', null, '王瑜佳', 'B+');
INSERT INTO `sp_info` VALUES ('1108', '瑞砂汉方足浴', '', null, '45.00', null, null, null, null, null, null, '', '', '实物', null, null, null, 'yesok', '2016-01-14 15:51:10', '诶', null, '王瑜佳', 'B+');
INSERT INTO `sp_info` VALUES ('1109', '仁爱医院早早孕检测试纸（好运测试纸/笔型）', '', null, '50.00', null, null, null, null, null, null, '', '', '实物', null, null, null, 'yesok', '2016-01-14 15:50:27', '诶', null, '王瑜佳', 'B+');
INSERT INTO `sp_info` VALUES ('1110', '米仔玉米儿童餐具', '', null, '55.00', null, null, null, null, null, null, '', '', '实物', null, null, null, 'yesok', '2016-01-14 15:50:52', '诶', null, '王瑜佳', 'B+');
INSERT INTO `sp_info` VALUES ('1111', '防蓝光护眼LED灯泡，5W，电压220V-50Hz', '', null, '60.00', null, null, null, null, null, null, '', '', '实物', null, null, null, 'yesok', '2016-01-14 15:50:32', '诶', null, '王瑜佳', 'B+');
INSERT INTO `sp_info` VALUES ('1112', '玉堂号素牛排或素牛筋一包（22g)', '', null, '65.00', null, null, null, null, null, null, '', '', '实物', null, null, null, 'yesok', '2016-01-14 15:50:38', '诶', null, '王瑜佳', 'B+');
INSERT INTO `sp_info` VALUES ('1113', '菇盐固态复合调味料①', '', null, '70.00', null, null, null, null, null, null, '', '', '实物', null, null, null, 'yesok', '2016-01-14 15:52:02', '诶', null, '王瑜佳', 'B+');
INSERT INTO `sp_info` VALUES ('1114', '蓝牙智能体温帖*1片', '', null, '75.00', null, null, null, null, null, null, '', '', '实物', null, null, null, 'yesok', '2016-01-14 15:50:56', '诶', null, '王瑜佳', 'B+');
INSERT INTO `sp_info` VALUES ('1115', '纽卡姿环保健康指甲油10ml/瓶', '', null, '80.00', null, null, null, null, null, null, '', '', '实物', null, null, null, 'yesok', '2016-01-14 15:50:48', '诶', null, '王瑜佳', 'B+');
INSERT INTO `sp_info` VALUES ('1116', '太太乐爱的礼物', '', null, '85.00', null, null, null, null, null, null, '', '', '实物', null, null, null, 'yesok', '2016-01-14 15:51:00', '诶', null, '王瑜佳', 'B+');
INSERT INTO `sp_info` VALUES ('1117', '52度丰谷福酒', '', null, '90.00', null, null, null, null, null, null, '', '', '实物', null, null, null, 'yesok', '2016-01-14 15:51:19', '诶', null, '王瑜佳', 'B+');
INSERT INTO `sp_info` VALUES ('1118', 'Silk植朴磨坊植物蛋白饮料', '', null, '95.00', null, null, null, null, null, null, '', '', '实物', null, null, null, 'yesok', '2016-01-14 15:51:23', '诶', null, '王瑜佳', 'B+');
INSERT INTO `sp_info` VALUES ('1119', '瑞典蛋清洁面皂，净含量300g（50g六块装）', '', null, '100.00', null, null, null, null, null, null, '', '', '实物', null, null, null, 'yesok', '2016-01-14 15:51:14', '诶', null, '王瑜佳', 'B+');
INSERT INTO `sp_info` VALUES ('1120', '“乐”牌乐口福30克/条', '', null, '105.00', null, null, null, null, null, null, '', '条', '实物', '2016-01-22', '125', '2016-05-26', 'no', null, '诶', '王瑜佳', null, 'B+');
INSERT INTO `sp_info` VALUES ('1121', '新雪肌系列-茶树净油保湿乳液100ml/瓶', '', null, '110.00', null, null, null, null, null, null, '', '', '实物', null, null, null, 'yesok', '2016-01-14 15:51:31', '诶', null, '王瑜佳', 'B+');
INSERT INTO `sp_info` VALUES ('1122', '泰椰椰牌椰子饮料（原味）300ml', '', null, '115.00', null, null, null, null, null, null, '', '', '实物', null, null, null, 'yesok', '2016-01-14 15:51:27', '诶', null, '王瑜佳', 'B+');
INSERT INTO `sp_info` VALUES ('1123', '心居客全新强力去污乳②', '', null, '120.00', null, null, null, null, null, null, '', '', '实物', null, null, null, 'yesok', '2016-01-14 15:51:36', '诶', null, '王瑜佳', 'B+');
INSERT INTO `sp_info` VALUES ('1124', '滁州贡菊', '', null, '125.00', null, null, null, null, null, null, '', '', '实物', null, null, null, 'yesok', '2016-01-14 15:51:39', '诶', null, '王瑜佳', 'B+');
INSERT INTO `sp_info` VALUES ('1125', '现代牧业纯牛奶', '', null, '130.00', null, null, null, null, null, null, '', '', '实物', null, null, null, 'yesok', '2016-01-14 15:51:44', '诶', null, '王瑜佳', 'B+');
INSERT INTO `sp_info` VALUES ('1126', '百家益腕表式激光治疗仪，HA-02旗舰款', '', null, '135.00', null, null, null, null, null, null, '', '', '实物', null, null, null, 'yesok', '2016-01-14 15:51:53', '诶', null, '王瑜佳', 'B+');
INSERT INTO `sp_info` VALUES ('1127', '水果味棒棒糖（4种口味）①', '', null, '140.00', null, null, null, null, null, null, '', '', '实物', null, null, null, 'yesok', '2016-01-14 15:51:48', '诶', null, '王瑜佳', 'B+');
INSERT INTO `sp_info` VALUES ('1128', '降雪儿南瓜酒（每瓶450ml）', '', null, '145.00', null, null, null, null, null, null, '', '', '实物', null, null, null, 'yesok', '2016-01-14 15:52:06', '诶', null, '王瑜佳', 'B+');
INSERT INTO `sp_info` VALUES ('1129', '俪兰水母变色唇霜（15g）', '', null, '150.00', null, null, null, null, null, null, '', '', '实物', null, null, null, 'yesok', '2016-01-14 15:52:15', '诶', null, '王瑜佳', 'B+');
INSERT INTO `sp_info` VALUES ('1234', '太太乐五福临门礼盒', '太太乐五福临门礼盒', '29.00', '30.00', '40.00', '30.00', '20.00', '0.80', '0.02', '4.00', '', '', '实物', '2015-10-07', '40', null, 'yesok', '2015-12-29 15:15:37', '诶', null, '王瑜佳', 'B+');
INSERT INTO `sp_info` VALUES ('1235', '滁州贡菊', '滁州贡菊', '25.00', '25.00', '30.00', '20.00', '10.00', '0.50', '0.01', '1.00', '60*40*30', '盒', '实物', '2015-11-03', '180', null, 'yesok', '2016-01-14 15:51:57', '诶', null, '王瑜佳', 'B+');
INSERT INTO `sp_info` VALUES ('1237', '现代牧业纯牛奶', '现代牧业纯牛奶', '5.50', '5.50', '20.00', '10.00', '10.00', '0.40', '0.00', '0.33', '40*30*20', '盒', '实物', null, '90', '2015-12-25', 'no', null, '诶', null, null, 'B+');
INSERT INTO `sp_info` VALUES ('1239', '啦啦啦', null, '12.00', '12.00', '12.00', '12.30', '978.30', '123.22', '12.00', '344.00', '123*1323*12', '包', '实物', '2015-11-20', '12', null, 'no', null, '诶', null, null, 'B+');
INSERT INTO `sp_info` VALUES ('1241', '我是商品1', null, null, null, null, null, null, null, null, null, '', '', '实物', null, null, '2015-12-30', 'yesok', '2015-12-21 17:35:44', '诶', null, '王瑜佳', 'B+');
INSERT INTO `sp_info` VALUES ('1242', '我是商品2', null, null, null, null, null, null, null, null, null, '', '', '实物', null, null, '2015-12-30', 'yesok', '2016-01-14 15:52:11', '诶', null, '王瑜佳', 'B+');
INSERT INTO `sp_info` VALUES ('1245', '商品444', '', null, null, null, null, null, null, null, null, '', '', '服务', null, null, null, 'yesok', '2016-01-14 15:52:26', '诶', null, '王瑜佳', 'B+');
INSERT INTO `sp_info` VALUES ('1247', '商品777', '商品777', null, null, null, null, null, null, null, null, '', '', '实物', null, null, null, 'no', null, '诶', null, null, 'B+');
INSERT INTO `sp_info` VALUES ('1248', '我是一个小商品2', '我是试试', '20000.00', '30.00', '30.00', '20000.00', '10.00', '100.00', '300.00', '200.00', '比比', '个', '实物', '2015-11-25', '365', '2016-11-25', 'no', null, '诶', null, null, 'B+');
INSERT INTO `sp_info` VALUES ('1249', '我是商品n', 'aaaaa', '10000.00', '10000.00', '10000.00', '100.30', '30000.00', '10000.00', '100000.00', '100000.00', '20******啦啦啦00000', '个', '实物', null, null, null, 'yesok', '2016-01-14 11:39:19', '诶', null, '王瑜佳', 'B+');
INSERT INTO `sp_info` VALUES ('1250', '商品A', 'A', '10.00', '10.00', '10.00', '10.00', '10.00', '10.00', '10.00', '1000.00', '1312321', '个', '实物', '2015-11-18', null, '2015-12-03', 'yesok', '2015-12-21 17:39:28', '诶', null, '王瑜佳', 'A+');
INSERT INTO `sp_info` VALUES ('1251', '杯具', 'AAA', '12.00', '123.00', '12.00', '11.00', '978.30', '123.22', '100.00', null, '', '个', '实物', '2015-12-03', null, null, 'no', null, '诶', null, null, 'A+');
INSERT INTO `sp_info` VALUES ('1252', '测试商品1', '测试商品1', '100.00', '30.00', '10.00', '11.00', '11.00', '11.00', '11.00', '11.00', '11', '个', '实物', '2015-11-01', null, '2015-12-09', 'yesok', '2015-12-21 15:37:04', '诶', null, '王瑜佳', 'A+');
INSERT INTO `sp_info` VALUES ('1253', '商品AA', 'a', '10.00', '10.00', '10.00', '11.00', '978.30', '10.00', '12.00', '11.00', '试试1213', '只', '实物', '2015-12-15', null, '2015-12-18', 'yesok', null, '诶', null, null, 'A+');
INSERT INTO `sp_info` VALUES ('1254', '我是一根葱', '', '10.00', null, null, null, null, null, null, null, '', '根', '实物', '2015-12-18', '10', '2015-12-27', 'yesok', '2015-12-18 16:25:47', '诶', null, null, 'A+');
INSERT INTO `sp_info` VALUES ('1255', '我可以增加人', '我可以增加人', '10.00', '10.00', '1.00', '2.00', '4.00', '123.00', '121312.00', '222.00', '试试1213', '个', '实物', '2015-12-21', '12', '2016-01-03', 'yesno', '2015-12-21 15:36:48', '王瑜佳', '王瑜佳', '王瑜佳', 'A+');
INSERT INTO `sp_info` VALUES ('1256', '我要试试回车', '', null, null, null, null, null, null, null, null, '', '', '实物', null, null, null, 'no', null, '诶', '诶', null, 'A+');
INSERT INTO `sp_info` VALUES ('1257', '我是悲剧2', '北风吹吹吹', '12.00', '12.00', null, null, null, null, null, null, '', '个', '实物', '2016-01-31', '120', '2016-05-30', 'yesok', '2016-01-14 15:52:21', '王瑜佳', null, '王瑜佳', 'A+');
INSERT INTO `sp_info` VALUES ('1258', '空调', 'DAIKIN', '20000.00', '20000.00', '4000.00', '3000.00', '1000.00', '50.00', null, null, '', '个', '实物', '2015-12-06', '56', '2016-01-31', 'no', null, '诶', null, null, 'A+');
INSERT INTO `sp_info` VALUES ('1259', '空调', '', null, '30.00', null, null, null, null, null, null, '', '个', '实物', '2016-01-05', '26', '2016-01-31', 'no', null, '诶', null, null, 'A+');
INSERT INTO `sp_info` VALUES ('1260', '你是风儿我是傻100kg一罐', '', null, '123.00', null, null, null, null, null, null, '', '包', '实物', '2016-01-01', '30', '2016-01-31', 'no', null, '王瑜佳', '王瑜佳', null, 'C');
INSERT INTO `sp_info` VALUES ('1261', '我试试空格', '', null, '123.00', null, null, null, null, null, null, '', '包', '实物', '2016-01-05', '26', '2016-01-31', 'yesok', '2016-01-14 15:49:59', '诶', null, '王瑜佳', 'C');
INSERT INTO `sp_info` VALUES ('1262', '我试试空格', '', null, '123.00', null, null, null, null, null, null, '', '包', '实物', '2016-01-05', '26', '2016-01-31', 'yesok', '2016-01-14 11:40:22', '诶', null, '王瑜佳', 'C');
INSERT INTO `sp_info` VALUES ('1263', '我试试空格', '', null, '123.00', null, null, null, null, null, null, '', '包', '实物', '2016-01-05', '26', '2016-01-31', 'yesok', '2016-01-14 11:39:27', '诶', null, '王瑜佳', 'C');
INSERT INTO `sp_info` VALUES ('1264', '我试试空格', '', null, '123.00', null, null, null, null, null, null, '', '包', '实物', '2016-01-05', '26', '2016-01-31', 'no', null, '诶', null, null, 'C');
INSERT INTO `sp_info` VALUES ('1265', '不说你东东', '我可以增加人', '12.60', '10.00', '10000.00', '100.00', '10.97', '10.22', null, '344.00', '', '个', '实物', '2016-01-05', '40', '2016-02-14', 'yesok', '2016-01-14 11:39:11', '王瑜佳', null, '王瑜佳', 'C');
INSERT INTO `sp_info` VALUES ('1266', '我在测试名字', '', null, '10.00', null, null, null, null, null, null, '', '个', '实物', '2016-01-31', '0', '2016-01-31', 'yesok', '2016-01-14 11:40:12', '王瑜佳', null, '王瑜佳', 'C');
INSERT INTO `sp_info` VALUES ('1267', 'love', '', null, '10.00', null, null, null, null, null, null, '', '包', '实物', '2016-01-05', '26', '2016-01-31', 'no', null, '王瑜佳', null, null, 'C');
INSERT INTO `sp_info` VALUES ('1268', '小黄人', '', null, '30.00', null, null, null, null, null, null, '', '只', '实物', '2016-01-01', '30', '2016-01-31', 'no', null, '王瑜佳', '王瑜佳', null, 'C');
INSERT INTO `sp_info` VALUES ('1269', '一抔土', '', null, '10.00', null, null, null, null, null, null, '', '包', '实物', '2016-01-26', '300', '2016-11-21', 'yesok', '2016-01-06 13:06:06', '王瑜佳', null, '王瑜佳', 'C');
INSERT INTO `sp_info` VALUES ('1270', '小兔', '', null, '10.00', null, null, null, null, null, null, '', '个', '实物', '2016-01-14', '300', '2016-11-09', 'no', null, '王瑜佳', null, null, 'C');
INSERT INTO `sp_info` VALUES ('1271', '小白兔', '', '12.00', '12.00', null, null, null, null, null, null, '', '个', '实物', '2016-01-07', '316', '2016-11-18', 'yesok', '2016-01-07 15:10:57', '王瑜佳', null, '王瑜佳', 'B+');
INSERT INTO `sp_info` VALUES ('1272', '素牛筋', '', null, '2.00', null, null, null, null, null, null, '', '包', '实物', '2016-01-11', '30', '2016-02-10', 'yesok', '2016-01-18 15:58:17', '王瑜佳', null, '王瑜佳', 'B+');
INSERT INTO `sp_info` VALUES ('1273', '测试星期一', '星期一脆脆面', null, '200.00', null, null, null, null, null, null, '', '包', '实物', '2016-01-06', '50', '2016-02-25', 'yesok', '2016-01-18 15:57:14', '王瑜佳', '王瑜佳', '王瑜佳', 'B');

-- ----------------------------
-- Table structure for sp_kind
-- ----------------------------
DROP TABLE IF EXISTS `sp_kind`;
CREATE TABLE `sp_kind` (
  `sp_kind_id` int(4) NOT NULL AUTO_INCREMENT,
  `explain` varchar(30) DEFAULT NULL,
  `first_kind` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`sp_kind_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_kind
-- ----------------------------

-- ----------------------------
-- Table structure for sp_sh
-- ----------------------------
DROP TABLE IF EXISTS `sp_sh`;
CREATE TABLE `sp_sh` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `sp_id` int(4) NOT NULL,
  `sh_id` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `spid` (`sp_id`),
  KEY `shid` (`sh_id`),
  CONSTRAINT `shid` FOREIGN KEY (`sh_id`) REFERENCES `sh_info` (`sh_id`),
  CONSTRAINT `spid` FOREIGN KEY (`sp_id`) REFERENCES `sp_info` (`sp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_sh
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(4) NOT NULL AUTO_INCREMENT,
  `uname` varchar(20) NOT NULL,
  `upwd` varchar(10) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `roleId` int(4) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'a', '123', '诶', '2');
INSERT INTO `user` VALUES ('2', 'b', '123', '笔', '2');
INSERT INTO `user` VALUES ('3', 'wangyujia', '1234', '王瑜佳', '1');
INSERT INTO `user` VALUES ('5', 'zhijie', '1234', '支捷', '1');
INSERT INTO `user` VALUES ('8', 'lushifeng', '111', '陆世峰', '1');
INSERT INTO `user` VALUES ('11', 'do123', '123', '读', '1');
INSERT INTO `user` VALUES ('12', 'do123', '1234', '百', '1');
INSERT INTO `user` VALUES ('13', 'ai', 'ai', '爱╮(╯▽╰)╭', '2');
INSERT INTO `user` VALUES ('14', 'liyiyin', '123456', '李奕寅', '1');
INSERT INTO `user` VALUES ('15', 'liangji', '1234', '梁吉', '1');

-- ----------------------------
-- Table structure for yt_application
-- ----------------------------
DROP TABLE IF EXISTS `yt_application`;
CREATE TABLE `yt_application` (
  `yt_id` int(4) NOT NULL AUTO_INCREMENT,
  `sp_id` int(4) NOT NULL,
  `sh_id` int(4) NOT NULL,
  `sp_name` varchar(30) DEFAULT NULL,
  `place_id` int(4) NOT NULL,
  `place` varchar(30) DEFAULT NULL,
  `unit` varchar(10) DEFAULT NULL,
  `expiration_date` date DEFAULT NULL,
  `event_id` int(4) DEFAULT NULL,
  `events` varchar(50) DEFAULT NULL,
  `hd_id` varchar(10) DEFAULT NULL,
  `yt_number` int(5) DEFAULT NULL,
  `yt_time` date DEFAULT NULL,
  `dateline` date DEFAULT NULL,
  `use_type` varchar(30) DEFAULT NULL,
  `yt_user` varchar(30) DEFAULT NULL,
  `adduser` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`yt_id`),
  KEY `预提商品id` (`sp_id`) USING BTREE,
  KEY `place_id` (`place_id`),
  CONSTRAINT `place_id` FOREIGN KEY (`place_id`) REFERENCES `kc_place` (`kc_id`),
  CONSTRAINT `yt_sp_id` FOREIGN KEY (`sp_id`) REFERENCES `sp_info` (`sp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yt_application
-- ----------------------------
INSERT INTO `yt_application` VALUES ('1', '1234', '1', '', '2', '一楼仓库', '盒', '2016-11-01', '105478', null, null, '200', '2015-11-03', '2016-03-09', '福利', '', null);
INSERT INTO `yt_application` VALUES ('2', '1235', '1', '', '1', '昆山仓库', '盒', '2017-12-01', '205478', null, null, '150', '2015-11-03', '2016-03-09', '福利', '', null);
INSERT INTO `yt_application` VALUES ('3', '1237', '2', '', '2', '一楼仓库', '盒', '2016-08-08', '268745', null, null, '2000', '2015-10-15', '2016-04-06', '福利', '', null);
INSERT INTO `yt_application` VALUES ('4', '1', '3', '', '7', '373号领奖处', '包', '2015-12-03', '1', null, '2', '50', '2015-11-06', '2016-01-21', '福利', '', null);
INSERT INTO `yt_application` VALUES ('5', '1', '4', null, '2', '一楼仓库', '包', '2015-12-01', '2', null, null, '100', '2015-11-06', '2016-01-25', '福利', '', null);
INSERT INTO `yt_application` VALUES ('6', '3', '5', null, '7', '373号领奖处', '包', '2016-01-01', '3', null, '3', '30', '2015-11-09', '2016-01-22', '一元购', '', null);
INSERT INTO `yt_application` VALUES ('7', '3', '6', null, '7', '373号领奖处', '包', '2016-01-15', '4', null, null, '50', '2015-11-10', '2015-12-26', '一元购', '', null);
INSERT INTO `yt_application` VALUES ('8', '3', '1', null, '7', null, '包', null, null, '社区特卖', '1', '100', '2015-12-10', '2016-01-25', '社区特卖', null, null);
INSERT INTO `yt_application` VALUES ('9', '7', '1', null, '1', null, '包', null, null, '我在测试1', '1', '50', '2015-12-11', '2016-01-31', '一元购', null, null);
INSERT INTO `yt_application` VALUES ('10', '1', '1', null, '2', null, '个', null, null, '我在测试2', '4', '100', '2015-12-14', '2016-01-20', '一元购', null, null);
INSERT INTO `yt_application` VALUES ('11', '1', '1', null, '2', null, '只', null, null, null, null, '10', '2015-12-16', '2016-01-25', '一元购', null, null);
INSERT INTO `yt_application` VALUES ('12', '1', '1', null, '1', null, '只', null, null, null, null, '10', '2015-12-16', '2016-01-18', '一元购', null, null);
INSERT INTO `yt_application` VALUES ('13', '1', '1', null, '1', null, '只', null, null, null, null, '2', '2015-12-16', '2015-12-31', '一元购', null, null);
INSERT INTO `yt_application` VALUES ('14', '1', '1', null, '1', null, '只', null, null, null, null, '10', '2015-12-16', '2015-12-31', '一元购', null, null);
INSERT INTO `yt_application` VALUES ('15', '1', '1', null, '1', null, '只', null, null, null, null, '2', '2015-12-16', '2016-08-23', '一元购', null, null);
INSERT INTO `yt_application` VALUES ('16', '3', '2', null, '7', null, '包', null, null, '社区特卖', '121', '20', '2015-12-16', '2016-02-26', '一元购', null, null);
INSERT INTO `yt_application` VALUES ('17', '1', '1', null, '2', null, '只', null, null, '啦啦', '1', '100', '2015-12-16', '2015-12-31', '一元购', null, null);
INSERT INTO `yt_application` VALUES ('18', '1', '6', null, '7', null, '只', null, null, '我在测试1', '1', '30', '2015-12-16', '2015-12-31', '一元购', null, null);
INSERT INTO `yt_application` VALUES ('23', '1', '1', null, '1', null, '只', null, null, null, null, '2', '2015-12-16', '2016-02-28', '一元购', null, null);
INSERT INTO `yt_application` VALUES ('24', '1', '1', null, '1', null, '只', null, null, null, null, '2', '2015-12-16', '2016-02-28', '一元购', null, null);
INSERT INTO `yt_application` VALUES ('25', '1', '1', null, '1', null, '只', null, null, null, null, '20', '2015-12-16', '2016-02-28', '一元购', null, null);
INSERT INTO `yt_application` VALUES ('26', '1', '1', null, '1', null, '只', null, null, null, '121', '20', '2015-12-16', '2016-01-15', '一元购', null, null);
INSERT INTO `yt_application` VALUES ('27', '1', '1', null, '1', null, '只', null, null, null, '121', '2', '2015-12-16', '2016-02-05', '一元购', null, null);
INSERT INTO `yt_application` VALUES ('28', '1', '1', null, '1', null, '只', null, null, '一元购', '1', '100', '2015-12-16', '2016-02-28', '一元购', null, null);
INSERT INTO `yt_application` VALUES ('29', '1', '1', null, '1', null, '只', null, null, '一元购', '1', '100', '2015-12-16', '2016-02-28', '一元购', null, null);
INSERT INTO `yt_application` VALUES ('30', '1', '1', null, '1', null, '只', null, null, null, null, '2', '2015-12-16', '2016-02-28', '一元购', null, null);
INSERT INTO `yt_application` VALUES ('31', '1', '1', null, '1', null, '只', null, null, null, null, '2', '2015-12-16', '2016-02-28', '一元购', null, null);
INSERT INTO `yt_application` VALUES ('32', '1', '1', null, '1', null, '只', null, null, null, null, '100', '2015-12-16', '2016-02-28', '一元购', null, null);
INSERT INTO `yt_application` VALUES ('33', '1', '1', null, '1', null, '只', null, null, null, null, '2', '2015-12-16', '2016-02-28', '一元购', null, null);
INSERT INTO `yt_application` VALUES ('34', '1', '1', null, '1', null, '只', null, null, null, null, '2', '2015-12-16', '2016-02-28', '一元购', null, null);
INSERT INTO `yt_application` VALUES ('35', '1', '1', null, '1', null, '只', null, null, null, null, '2', '2015-12-16', '2016-02-28', '一元购', null, null);
INSERT INTO `yt_application` VALUES ('36', '1', '1', null, '1', null, '只', null, null, null, null, '100', '2015-12-16', '2016-02-28', '一元购', null, null);
INSERT INTO `yt_application` VALUES ('37', '1', '1', null, '1', null, '只', null, null, null, null, '100', '2015-12-16', '2016-02-28', '一元购', null, null);
INSERT INTO `yt_application` VALUES ('38', '1', '1', null, '1', null, '只', null, null, null, null, '2', '2015-12-16', '2016-02-28', '一元购', null, null);
INSERT INTO `yt_application` VALUES ('39', '1', '1', null, '1', null, '只', null, null, null, null, '2', '2015-12-16', '2016-01-16', '一元购', null, null);
INSERT INTO `yt_application` VALUES ('40', '1', '1', null, '1', null, '只', null, null, null, null, '100', '2015-12-16', '2016-01-18', '一元购', null, null);
INSERT INTO `yt_application` VALUES ('41', '1', '1', null, '1', null, '只', null, null, null, '1', '2', '2015-12-16', '2016-02-28', '一元购', null, null);
INSERT INTO `yt_application` VALUES ('42', '1', '1', null, '1', null, '只', null, null, null, '1', '2', '2015-12-16', '2016-02-28', '一元购', null, null);
INSERT INTO `yt_application` VALUES ('43', '1', '1', null, '1', null, '只', null, null, null, '121', '2', '2015-12-16', '2016-01-25', '一元购', null, null);
INSERT INTO `yt_application` VALUES ('44', '1', '1', null, '1', null, '包', null, null, null, '121', '2', '2015-12-16', '2016-02-28', '一元购', null, null);
INSERT INTO `yt_application` VALUES ('45', '1', '1', null, '1', null, '包', null, null, null, '333', '2', '2015-12-16', '2016-02-28', '一元购', null, null);
INSERT INTO `yt_application` VALUES ('46', '1', '1', null, '1', null, '包', null, null, null, null, '30', '2015-12-16', '2015-12-31', '一元购', null, null);
INSERT INTO `yt_application` VALUES ('47', '1', '1', null, '1', null, '包', null, null, null, '333', '500', '2015-12-16', '2016-02-28', '一元购', null, null);
INSERT INTO `yt_application` VALUES ('48', '1', '1', null, '2', null, '包', null, null, null, '2', '3', '2015-12-16', '2016-02-28', '一元购', null, null);
INSERT INTO `yt_application` VALUES ('49', '1', '1', null, '2', null, '包', null, null, null, '2', '3', '2015-12-16', '2016-02-28', '一元购', null, null);
INSERT INTO `yt_application` VALUES ('50', '3', '5', null, '7', null, '包', null, null, null, null, '70', '2015-12-16', '2016-02-28', '社区特卖', null, null);
INSERT INTO `yt_application` VALUES ('51', '3', '5', null, '7', null, '包', null, null, null, null, '28', '2015-12-16', '2016-02-28', '社区特卖', null, null);
INSERT INTO `yt_application` VALUES ('52', '1', '1', null, '1', null, '包', null, null, null, '3', '2', '2015-12-17', '2016-01-23', '一元购', null, null);
INSERT INTO `yt_application` VALUES ('53', '1254', '28', null, '1', null, '根', null, null, null, '11223344', '1000', '2015-12-18', '2016-01-25', '福利', null, null);
INSERT INTO `yt_application` VALUES ('54', '10', '26', null, '2', null, '份', null, null, null, null, '40', '2015-12-24', '2015-12-31', '任意配置', null, null);
INSERT INTO `yt_application` VALUES ('55', '10', '26', null, '2', null, '份', null, null, null, null, '10', '2015-12-24', '2015-12-31', '任意配置', null, null);
INSERT INTO `yt_application` VALUES ('56', '10', '26', null, '2', null, '份', null, null, null, null, '4', '2015-12-24', '2016-01-18', '任意配置', null, '王瑜佳');
INSERT INTO `yt_application` VALUES ('57', '10', '26', null, '2', null, '份', null, null, null, null, '4', '2015-12-24', '2015-12-31', '任意配置', null, '王瑜佳');
INSERT INTO `yt_application` VALUES ('58', '4', '3', null, '5', null, '盒', null, null, null, null, '30', '2015-12-26', '2016-01-11', '一元购', null, '诶');
INSERT INTO `yt_application` VALUES ('59', '1', '1', null, '1', null, '包', null, null, 'i want to do it', '100', '100', '2015-12-31', '2016-01-11', '一元购', null, '王瑜佳');
INSERT INTO `yt_application` VALUES ('60', '3', '26', null, '1', null, '包', null, null, null, null, '100', '2015-12-31', '2016-01-24', '一元购', null, '王瑜佳');
INSERT INTO `yt_application` VALUES ('63', '1269', '32', null, '1', null, '包', null, null, null, null, '50', '2016-01-06', '2016-01-24', '社区特卖', null, '王瑜佳');
INSERT INTO `yt_application` VALUES ('66', '1269', '32', null, '1', null, '包', null, null, null, null, '10', '2016-01-06', '2016-01-24', '社区特卖', null, '王瑜佳');
INSERT INTO `yt_application` VALUES ('67', '1271', '35', null, '2', null, '个', null, null, null, '777', '50', '2016-01-07', '2016-01-17', '一元购', null, '王瑜佳');
INSERT INTO `yt_application` VALUES ('68', '3', '5', null, '7', null, '包', null, null, null, null, '2', '2016-01-08', '2016-01-24', '社区特卖', null, '王瑜佳');
INSERT INTO `yt_application` VALUES ('69', '1254', '28', null, '1', null, '根', null, null, null, null, '500', '2016-01-08', '2016-01-31', '福利', null, '王瑜佳');
INSERT INTO `yt_application` VALUES ('70', '1273', '35', null, '2', null, '包', null, null, null, null, '500', '2016-01-18', '2016-01-21', '物业礼包', null, '王瑜佳');

-- ----------------------------
-- Table structure for zk_application
-- ----------------------------
DROP TABLE IF EXISTS `zk_application`;
CREATE TABLE `zk_application` (
  `zk_application_id` int(8) NOT NULL AUTO_INCREMENT,
  `ck_id` int(8) DEFAULT NULL,
  `sp_id` int(8) DEFAULT NULL,
  `sh_id` int(8) DEFAULT NULL,
  `type_in` enum('福利','物业礼包','社区特卖','一元购','任意配置') DEFAULT NULL,
  `type_out` enum('福利','物业礼包','社区特卖','一元购','任意配置') DEFAULT NULL,
  `zk_number` int(8) DEFAULT NULL,
  `expectDate` date DEFAULT NULL,
  `auditTime` datetime DEFAULT NULL,
  `adduser` varchar(30) DEFAULT NULL,
  `edituser` varchar(30) DEFAULT NULL,
  `checkuser` varchar(30) DEFAULT NULL,
  `applicationDate` datetime DEFAULT NULL,
  `state` enum('yesno','yesok','no') DEFAULT 'no',
  PRIMARY KEY (`zk_application_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zk_application
-- ----------------------------
INSERT INTO `zk_application` VALUES ('1', '4', '4', '3', '任意配置', '一元购', '20', '2016-01-19', '2015-12-30 15:42:54', '王瑜佳', '王瑜佳', '王瑜佳', '2015-12-29 15:44:27', 'yesno');
INSERT INTO `zk_application` VALUES ('2', '2', '4', '5', '物业礼包', '福利', '30', '2015-12-31', '2015-12-30 16:13:15', '王瑜佳', '王瑜佳', '王瑜佳', '2015-12-29 15:46:31', 'yesok');
INSERT INTO `zk_application` VALUES ('3', '3', '3', '1', '任意配置', '一元购', '50', '2016-02-25', '2015-12-31 10:58:01', '王瑜佳', '诶', '王瑜佳', '2015-12-29 15:47:40', 'yesok');
INSERT INTO `zk_application` VALUES ('4', '2', '1234', '1', '社区特卖', '任意配置', '50', '2015-12-31', '2015-12-31 10:58:09', '王瑜佳', '诶', '王瑜佳', '2015-12-29 15:48:52', 'yesno');
INSERT INTO `zk_application` VALUES ('5', '1', '1', '1', '任意配置', '一元购', '20', '2015-12-29', '2015-12-31 10:59:01', null, null, '王瑜佳', '2015-12-29 15:55:37', 'yesok');
INSERT INTO `zk_application` VALUES ('6', '5', '3', '5', '任意配置', '社区特卖', '20', '2016-01-28', '2015-12-31 10:59:04', '王瑜佳', null, '王瑜佳', '2015-12-30 15:45:51', 'yesno');
INSERT INTO `zk_application` VALUES ('7', '2', '10', '26', '一元购', '任意配置', '20', '2016-01-21', null, '王瑜佳', '王瑜佳', null, '2015-12-31 11:18:15', 'no');
INSERT INTO `zk_application` VALUES ('8', '4', '4', '3', '任意配置', '一元购', '100', '2015-12-31', '2016-01-22 10:51:46', '诶', null, '王瑜佳', '2015-12-31 16:41:27', 'yesno');
INSERT INTO `zk_application` VALUES ('9', '3', '3', '1', '任意配置', '一元购', null, null, null, '王瑜佳', null, null, '2016-01-08 15:43:07', 'no');
INSERT INTO `zk_application` VALUES ('10', '4', '4', '3', '任意配置', '一元购', null, null, null, '王瑜佳', null, null, '2016-01-08 15:43:54', 'no');
INSERT INTO `zk_application` VALUES ('11', '4', '4', '3', '任意配置', '一元购', null, null, null, '王瑜佳', null, null, '2016-01-08 15:44:32', 'no');
INSERT INTO `zk_application` VALUES ('12', '2', '10', '26', '任意配置', '任意配置', null, null, null, '王瑜佳', null, null, '2016-01-08 15:47:14', 'no');
INSERT INTO `zk_application` VALUES ('13', '2', '3', '1', '任意配置', '一元购', null, null, '2016-01-22 10:51:37', '王瑜佳', null, '王瑜佳', '2016-01-08 15:49:37', 'yesok');
INSERT INTO `zk_application` VALUES ('14', '1', '1241', '4', '任意配置', '一元购', null, null, null, '王瑜佳', null, null, '2016-01-08 15:56:34', 'no');
INSERT INTO `zk_application` VALUES ('15', '1', '1241', '4', '福利', '一元购', '200', '2016-01-21', null, '王瑜佳', '王瑜佳', null, '2016-01-08 16:03:10', 'no');
INSERT INTO `zk_application` VALUES ('16', '1', '1241', '4', '任意配置', '一元购', null, null, null, '王瑜佳', null, null, '2016-01-08 16:06:46', 'no');
INSERT INTO `zk_application` VALUES ('17', '2', '1', '2', '任意配置', '一元购', '200', '2016-01-21', null, '王瑜佳', '王瑜佳', null, '2016-01-08 16:08:39', 'no');
INSERT INTO `zk_application` VALUES ('18', '2', '1', '2', '任意配置', '一元购', null, null, null, '王瑜佳', null, null, '2016-01-08 16:11:24', 'no');
INSERT INTO `zk_application` VALUES ('19', '2', '1', '2', '任意配置', '一元购', null, null, null, '王瑜佳', null, null, '2016-01-08 16:13:17', 'no');
INSERT INTO `zk_application` VALUES ('20', '2', '1', '2', '任意配置', '一元购', null, null, null, '王瑜佳', null, null, '2016-01-08 16:14:11', 'no');
INSERT INTO `zk_application` VALUES ('21', '3', '3', '1', '任意配置', '一元购', '200', '2016-01-26', null, '王瑜佳', null, null, '2016-01-08 16:16:45', 'no');
