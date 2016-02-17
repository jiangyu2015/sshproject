/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50616
Source Host           : localhost:3306
Source Database       : eju

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2016-02-17 17:40:59
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activity
-- ----------------------------

-- ----------------------------
-- Table structure for ck_detail
-- ----------------------------
DROP TABLE IF EXISTS `ck_detail`;
CREATE TABLE `ck_detail` (
  `ck_id` int(8) NOT NULL AUTO_INCREMENT,
  `sp_id` int(8) DEFAULT NULL,
  `sh_id` int(8) DEFAULT NULL,
  `ck_time` date DEFAULT NULL,
  `ck_number` int(10) DEFAULT NULL,
  `ck_place_id` int(5) DEFAULT NULL,
  `yf_number` int(10) DEFAULT NULL,
  `ck_type` enum('任意配置','一元购','社区特卖','物业礼包','福利（其他）','福利') DEFAULT '任意配置',
  `category` enum('正常转库','正常调拨','借领','其他出库','正常出库') DEFAULT '正常出库',
  `remark` varchar(30) DEFAULT NULL,
  `yt_id` int(4) DEFAULT NULL,
  `adduser` varchar(30) DEFAULT NULL,
  `state` enum('ok','no') DEFAULT 'no',
  `checkuser` varchar(30) DEFAULT NULL,
  `expect_ck_time` date DEFAULT NULL,
  PRIMARY KEY (`ck_id`),
  KEY `出库商品id` (`sp_id`),
  KEY `出库库存地点id` (`ck_place_id`)
) ENGINE=InnoDB AUTO_INCREMENT=90000272 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ck_detail
-- ----------------------------
INSERT INTO `ck_detail` VALUES ('90000002', '10000541', '20000007', '2016-02-17', '52', '30003', null, '福利', '正常出库', '', '80000002', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000003', '10000722', '20000007', '2016-02-17', '96', '30001', null, '福利', '正常出库', '', '80000003', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000005', '10000509', '20000007', '2016-02-17', '77', '30003', null, '福利', '正常出库', '', '80000005', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000007', '10000489', '20000007', '2016-02-17', '6', '30003', null, '任意配置', '正常出库', '', '80000007', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000008', '10000690', '20000007', '2016-02-17', '90', '30001', null, '任意配置', '正常出库', '', '80000008', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000012', '10000302', '20000007', '2016-02-17', '59', '30003', null, '福利', '正常出库', '', '80000012', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000014', '10000010', '20000007', '2016-02-17', '4', '30002', null, '福利', '正常出库', '', '80000014', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000019', '10000730', '20000208', '2016-02-17', '2', '30001', null, '福利', '正常出库', '', '80000019', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000020', '10000646', '20000007', '2016-02-17', '1', '30003', null, '福利', '正常出库', '', '80000020', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000021', '10000606', '20000182', '2016-02-17', '1206', '30001', null, '福利', '正常出库', '', '80000021', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000022', '10000786', '20000214', '2016-02-17', '5', '30001', null, '福利', '正常出库', '', '80000022', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000024', '10000729', '20000007', '2016-02-17', '92', '30003', null, '福利（其他）', '正常出库', '', '80000024', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000028', '10000166', '20000063', '2016-02-17', '5', '30001', null, '福利', '正常出库', '', '80000028', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000030', '10000168', '20000063', '2016-02-17', '12', '30001', null, '福利', '正常出库', '', '80000030', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000031', '10000178', '20000063', '2016-02-17', '13', '30001', null, '福利', '正常出库', '', '80000031', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000036', '10000285', '20000106', '2016-02-17', '121', '30001', null, '福利', '正常出库', '', '80000036', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000039', '10000618', '20000063', '2016-02-17', '48', '30003', null, '福利', '正常出库', '', '80000039', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000043', '10000651', '20000007', '2016-02-17', '95', '30003', null, '福利', '正常出库', '', '80000043', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000044', '10000634', '20000007', '2016-02-17', '95', '30003', null, '福利', '正常出库', '', '80000044', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000050', '10000142', '20000024', '2016-02-17', '62', '30001', null, '社区特卖', '正常出库', '', '80000050', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000055', '10000024', '20000013', '2016-02-17', '98', '30001', null, '福利', '正常出库', '', '80000055', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000057', '10000320', '20000117', '2016-02-17', '2261', '30001', null, '社区特卖', '正常出库', '', '80000057', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000059', '10000322', '20000007', '2016-02-17', '545', '30001', null, '福利', '正常出库', '', '80000059', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000063', '10000848', '20000263', '2016-02-17', '12', '30003', null, '社区特卖', '正常出库', '', '80000063', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000064', '10000849', '20000263', '2016-02-17', '12', '30003', null, '社区特卖', '正常出库', '', '80000064', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000065', '10000850', '20000263', '2016-02-17', '6', '30003', null, '社区特卖', '正常出库', '', '80000065', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000066', '10000851', '20000263', '2016-02-17', '6', '30003', null, '社区特卖', '正常出库', '', '80000066', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000072', '10000204', '20000082', '2016-02-17', '20', '30001', null, '社区特卖', '正常出库', '', '80000072', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000075', '10000247', '20000097', '2016-02-17', '156', '30001', null, '社区特卖', '正常出库', '', '80000075', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000076', '10000248', '20000097', '2016-02-17', '157', '30001', null, '社区特卖', '正常出库', '', '80000076', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000077', '10000064', '20000005', '2016-02-17', '3660', '30001', null, '社区特卖', '正常出库', '', '80000077', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000081', '10000547', '20000010', '2016-02-17', '1634', '30001', null, '社区特卖', '正常出库', '', '80000081', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000082', '10000521', '20000164', '2016-02-17', '8', '30003', null, '福利', '正常出库', '', '80000082', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000083', '10000515', '20000158', '2016-02-17', '1', '30003', null, '福利', '正常出库', '', '80000083', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000086', '10000588', '20000152', '2016-02-17', '1180', '30001', null, '社区特卖', '正常出库', '', '80000086', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000087', '10000594', '20000111', '2016-02-17', '7', '30003', null, '社区特卖', '正常出库', '', '80000087', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000088', '10000088', '20000045', '2016-02-17', '82', '30001', null, '社区特卖', '正常出库', '', '80000088', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000091', '10000172', '20000027', '2016-02-17', '23', '30001', null, '社区特卖', '正常出库', '', '80000091', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000092', '10000109', '20000027', '2016-02-17', '20', '30001', null, '社区特卖', '正常出库', '', '80000092', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000093', '10000110', '20000027', '2016-02-17', '20', '30001', null, '社区特卖', '正常出库', '', '80000093', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000094', '10000130', '20000024', '2016-02-17', '86', '30001', null, '社区特卖', '正常出库', '', '80000094', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000096', '10000858', '20000264', '2016-02-17', '50', '30001', null, '社区特卖', '正常出库', '', '80000096', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000097', '10000542', '20000111', '2016-02-17', '10', '30003', null, '社区特卖', '正常出库', '', '80000097', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000098', '10000595', '20000111', '2016-02-17', '3', '30003', null, '社区特卖', '正常出库', '', '80000098', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000100', '10000502', '20000026', '2016-02-17', '38', '30001', null, '社区特卖', '正常出库', '', '80000100', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000105', '10000228', '20000074', '2016-02-17', '9', '30003', null, '社区特卖', '正常出库', '', '80000105', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000106', '10000196', '20000074', '2016-02-17', '9', '30003', null, '社区特卖', '正常出库', '', '80000106', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000107', '10000622', '20000028', '2016-02-17', '96', '30001', null, '社区特卖', '正常出库', '', '80000107', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000110', '10000626', '20000061', '2016-02-17', '65', '30001', null, '社区特卖', '正常出库', '', '80000110', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000111', '10000628', '20000061', '2016-02-17', '50', '30001', null, '社区特卖', '正常出库', '', '80000111', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000112', '10000629', '20000061', '2016-02-17', '41', '30001', null, '社区特卖', '正常出库', '', '80000112', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000113', '10000630', '20000061', '2016-02-17', '50', '30001', null, '社区特卖', '正常出库', '', '80000113', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000114', '10000242', '20000094', '2016-02-17', '20', '30001', null, '社区特卖', '正常出库', '', '80000114', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000116', '10000325', '20000094', '2016-02-17', '164', '30001', null, '社区特卖', '正常出库', '', '80000116', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000117', '10000324', '20000094', '2016-02-17', '144', '30001', null, '社区特卖', '正常出库', '', '80000117', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000118', '10000243', '20000094', '2016-02-17', '289', '30001', null, '社区特卖', '正常出库', '', '80000118', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000124', '10000152', '20000014', '2016-02-17', '160', '30001', null, '社区特卖', '正常出库', '', '80000124', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000125', '10000074', '20000014', '2016-02-17', '160', '30001', null, '社区特卖', '正常出库', '', '80000125', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000126', '10000439', '20000141', '2016-02-17', '9', '30003', null, '福利', '正常出库', '', '80000126', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000127', '10000604', '20000181', '2016-02-17', '36', '30001', null, '社区特卖', '正常出库', '', '80000127', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000128', '10000605', '20000181', '2016-02-17', '36', '30001', null, '社区特卖', '正常出库', '', '80000128', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000129', '10000101', '20000048', '2016-02-17', '190', '30001', null, '社区特卖', '正常出库', '', '80000129', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000130', '10000860', '20000267', '2016-02-17', '160', '30001', null, '社区特卖', '正常出库', '', '80000130', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000131', '10000049', '20000030', '2016-02-17', '29', '30003', null, '福利', '正常出库', '', '80000131', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000133', '10000548', '20000170', '2016-02-17', '10', '30003', null, '社区特卖', '正常出库', '', '80000133', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000134', '10000249', '20000097', '2016-02-17', '40', '30003', null, '社区特卖', '正常出库', '', '80000134', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000135', '10000072', '20000038', '2016-02-17', '130', '30001', null, '社区特卖', '正常出库', '', '80000135', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000137', '10000266', '20000030', '2016-02-17', '136', '30003', null, '福利', '正常出库', '', '80000137', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000138', '10000540', '20000111', '2016-02-17', '6', '30003', null, '社区特卖', '正常出库', '', '80000138', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000141', '10000704', '20000198', '2016-02-17', '180', '30001', null, '社区特卖', '正常出库', '', '80000141', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000142', '10000078', '20000002', '2016-02-17', '70', '30001', null, '社区特卖', '正常出库', '', '80000142', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000143', '10000198', '20000080', '2016-02-17', '300', '30001', null, '社区特卖', '正常出库', '', '80000143', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000145', '10000234', '20000090', '2016-02-17', '372', '30001', null, '社区特卖', '正常出库', '', '80000145', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000147', '10000536', '20000167', '2016-02-17', '22560', '30001', null, '社区特卖', '正常出库', '', '80000147', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000148', '10000342', '20000098', '2016-02-17', '4', '30001', null, '社区特卖', '正常出库', '', '80000148', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000149', '10000403', '20000130', '2016-02-17', '1000', '30001', null, '社区特卖', '正常出库', '', '80000149', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000151', '10000113', '20000024', '2016-02-17', '200', '30001', null, '社区特卖', '正常出库', '', '80000151', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000152', '10000114', '20000024', '2016-02-17', '200', '30001', null, '社区特卖', '正常出库', '', '80000152', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000155', '10000031', '20000022', '2016-02-17', '80', '30001', null, '社区特卖', '正常出库', '', '80000155', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000156', '10000032', '20000022', '2016-02-17', '80', '30001', null, '社区特卖', '正常出库', '', '80000156', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000157', '10000033', '20000022', '2016-02-17', '80', '30001', null, '社区特卖', '正常出库', '', '80000157', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000158', '10000139', '20000060', '2016-02-17', '70', '30001', null, '社区特卖', '正常出库', '', '80000158', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000159', '10000328', '20000094', '2016-02-17', '38', '30001', null, '社区特卖', '正常出库', '', '80000159', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000162', '10000351', '20000076', '2016-02-17', '920', '30001', null, '社区特卖', '正常出库', '', '80000162', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000163', '10000352', '20000076', '2016-02-17', '920', '30001', null, '社区特卖', '正常出库', '', '80000163', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000164', '10000116', '20000029', '2016-02-17', '543', '30001', null, '社区特卖', '正常出库', '', '80000164', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000167', '10000018', '20000012', '2016-02-17', '4', '30001', null, '福利', '正常出库', '', '80000167', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000169', '10000257', '20000100', '2016-02-17', '720', '30001', null, '物业礼包', '正常出库', '', '80000169', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000171', '10000023', '20000013', '2016-02-17', '24', '30001', null, '福利', '正常出库', '', '80000171', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000174', '10000041', '20000028', '2016-02-17', '760', '30001', null, '社区特卖', '正常出库', '', '80000174', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000175', '10000042', '20000028', '2016-02-17', '348', '30001', null, '社区特卖', '正常出库', '', '80000175', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000176', '10000296', '20000100', '2016-02-17', '200', '30001', null, '社区特卖', '正常出库', '', '80000176', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000177', '10000297', '20000100', '2016-02-17', '200', '30001', null, '社区特卖', '正常出库', '', '80000177', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000180', '10000482', '20000145', '2016-02-17', '91', '30003', null, '福利', '正常出库', '', '80000180', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000181', '10000014', '20000011', '2016-02-17', '15', '30001', null, '社区特卖', '正常出库', '', '80000181', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000182', '10000015', '20000011', '2016-02-17', '15', '30001', null, '社区特卖', '正常出库', '', '80000182', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000183', '10000016', '20000011', '2016-02-17', '15', '30001', null, '社区特卖', '正常出库', '', '80000183', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000184', '10000391', '20000011', '2016-02-17', '25', '30001', null, '社区特卖', '正常出库', '', '80000184', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000185', '10000262', '20000046', '2016-02-17', '720', '30001', null, '社区特卖', '正常出库', '', '80000185', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000186', '10000229', '20000046', '2016-02-17', '984', '30001', null, '社区特卖', '正常出库', '', '80000186', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000187', '10000094', '20000046', '2016-02-17', '936', '30001', null, '社区特卖', '正常出库', '', '80000187', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000188', '10000700', '20000195', '2016-02-17', '64', '30001', null, '一元购', '正常出库', '', '80000188', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000189', '10000701', '20000195', '2016-02-17', '64', '30001', null, '一元购', '正常出库', '', '80000189', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000190', '10000492', '20000154', '2016-02-17', '984', '30001', null, '社区特卖', '正常出库', '', '80000190', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000191', '10000645', '20000180', '2016-02-17', '11', '30001', null, '福利', '正常出库', '', '80000191', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000192', '10000459', '20000148', '2016-02-17', '1', '30003', null, '社区特卖', '正常出库', '', '80000192', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000196', '10000259', '20000100', '2016-02-17', '990', '30001', null, '一元购', '正常出库', '', '80000196', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000197', '10000321', '20000007', '2016-02-17', '130', '30001', null, '福利', '正常出库', '', '80000197', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000200', '10000318', '20000115', '2016-02-17', '2', '30003', null, '社区特卖', '正常出库', '', '80000200', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000203', '10000189', '20000077', '2016-02-17', '64', '30001', null, '社区特卖', '正常出库', '', '80000203', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000204', '10000194', '20000077', '2016-02-17', '64', '30001', null, '社区特卖', '正常出库', '', '80000204', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000207', '10000263', '20000077', '2016-02-17', '160', '30001', null, '社区特卖', '正常出库', '', '80000207', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000208', '10000689', '20000007', '2016-02-17', '163', '30003', null, '福利', '正常出库', '', '80000208', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000209', '10000400', '20000007', '2016-02-17', '14', '30001', null, '福利', '正常出库', '', '80000209', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000211', '10000054', '20000034', '2016-02-17', '9', '30003', null, '福利', '正常出库', '', '80000211', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000212', '10000056', '20000034', '2016-02-17', '18', '30003', null, '福利', '正常出库', '', '80000212', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000214', '10000350', '20000121', '2016-02-17', '80', '30001', null, '社区特卖', '正常出库', '', '80000214', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000215', '10000483', '20000121', '2016-02-17', '80', '30001', null, '社区特卖', '正常出库', '', '80000215', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000216', '10000550', '20000171', '2016-02-17', '160', '30001', null, '社区特卖', '正常出库', '', '80000216', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000218', '10000411', '20000019', '2016-02-17', '90', '30001', null, '物业礼包', '正常出库', '', '80000218', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000219', '10000412', '20000019', '2016-02-17', '36', '30001', null, '物业礼包', '正常出库', '', '80000219', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000220', '10000413', '20000019', '2016-02-17', '90', '30001', null, '物业礼包', '正常出库', '', '80000220', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000230', '10000376', '20000052', '2016-02-17', '6', '30001', null, '福利', '正常出库', '', '80000230', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000231', '10000083', '20000029', '2016-02-17', '113', '30001', null, '社区特卖', '正常出库', '', '80000231', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000232', '10000084', '20000029', '2016-02-17', '113', '30001', null, '社区特卖', '正常出库', '', '80000232', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000233', '10000085', '20000029', '2016-02-17', '113', '30001', null, '社区特卖', '正常出库', '', '80000233', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000234', '10000086', '20000029', '2016-02-17', '113', '30001', null, '社区特卖', '正常出库', '', '80000234', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000235', '10000053', '20000033', '2016-02-17', '723', '30001', null, '任意配置', '正常出库', '', '80000235', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000236', '10000162', '20000066', '2016-02-17', '671', '30001', null, '任意配置', '正常出库', '', '80000236', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000241', '10000264', '20000102', '2016-02-17', '5', '30001', null, '任意配置', '正常出库', '', '80000241', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000243', '10000315', '20000075', '2016-02-17', '774', '30001', null, '福利', '正常出库', '', '80000243', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000244', '10000174', '20000037', '2016-02-17', '362', '30001', null, '任意配置', '正常出库', '', '80000244', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000248', '10000258', '20000101', '2016-02-17', '48', '30001', null, '社区特卖', '正常出库', '', '80000248', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000249', '10000546', '20000101', '2016-02-17', '48', '30001', null, '社区特卖', '正常出库', '', '80000249', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000255', '10000689', '20000007', '2016-02-17', '100', '30003', null, '福利', '正常出库', '', '80000255', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000256', '10000193', '20000063', '2016-02-17', '13', '30001', null, '福利', '正常出库', '', '80000256', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000257', '10000145', '20000046', '2016-02-17', '48', '30001', null, '社区特卖', '正常出库', '', '80000257', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000258', '10000053', '20000033', '2016-02-17', '16', '30001', null, '任意配置', '正常出库', '', '80000258', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000259', '10000692', '20000007', '2016-02-17', '285', '30003', null, '福利', '正常出库', '', '80000259', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000260', '10000347', '20000059', '2016-02-17', '40', '30001', null, '福利', '正常出库', '', '80000260', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000261', '10000051', '20000031', '2016-02-17', '19110', '30003', null, '福利', '正常出库', '', '80000261', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000262', '10000057', '20000034', '2016-02-17', '2', '30001', null, '福利', '正常出库', '', '80000262', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000263', '10000582', '20000176', '2016-02-17', '66', '30003', null, '福利', '正常出库', '', '80000263', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000264', '10000676', '20000036', '2016-02-17', '11', '30001', null, '任意配置', '正常出库', '', '80000264', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000266', '10000405', '20000019', '2016-02-17', '12', '30001', null, '福利', '正常出库', '', '80000266', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000268', '10000760', '20000007', '2016-02-17', '3', '30001', null, '任意配置', '正常出库', '', '80000268', '梁吉', 'ok', '', null);
INSERT INTO `ck_detail` VALUES ('90000271', '10000003', '20000003', '2016-02-17', '3', '30001', null, '福利', '正常出库', '', '80000271', '梁吉', 'ok', '', null);

-- ----------------------------
-- Table structure for db_application
-- ----------------------------
DROP TABLE IF EXISTS `db_application`;
CREATE TABLE `db_application` (
  `db_application_id` int(8) NOT NULL AUTO_INCREMENT,
  `db_in` int(5) NOT NULL,
  `db_out` int(5) NOT NULL,
  `sp_id` int(8) NOT NULL,
  `sh_id` int(8) NOT NULL,
  `db_number` int(8) NOT NULL,
  `expectDate` date DEFAULT NULL,
  `rk_type` enum('福利','物业礼包','社区特卖','一元购','福利（其他）','任意配置') DEFAULT '任意配置',
  `adduser` varchar(30) DEFAULT NULL,
  `edituser` varchar(30) DEFAULT NULL,
  `checkuser` varchar(30) DEFAULT NULL,
  `auditTime` datetime DEFAULT NULL,
  `applicationDate` datetime DEFAULT NULL,
  `state` enum('yesno','yesok','no') DEFAULT 'no',
  PRIMARY KEY (`db_application_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of db_application
-- ----------------------------

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
  KEY `inventory_flow_sh_id` (`sh_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of inventory_flow_chart
-- ----------------------------

-- ----------------------------
-- Table structure for kc_place
-- ----------------------------
DROP TABLE IF EXISTS `kc_place`;
CREATE TABLE `kc_place` (
  `kc_id` int(5) NOT NULL AUTO_INCREMENT,
  `place` varchar(30) NOT NULL,
  `state` varchar(30) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `receiver` varchar(30) DEFAULT NULL,
  `tel` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`kc_id`),
  KEY `place` (`place`)
) ENGINE=InnoDB AUTO_INCREMENT=30008 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kc_place
-- ----------------------------
INSERT INTO `kc_place` VALUES ('30001', '一楼仓库', '开放', '', '', '');
INSERT INTO `kc_place` VALUES ('30002', '四楼403', '开放', '', '', '');
INSERT INTO `kc_place` VALUES ('30003', '昆山仓库', '开放', '', '', '');
INSERT INTO `kc_place` VALUES ('30004', '四楼财务室进门抽屉', '开放', '', '', '');
INSERT INTO `kc_place` VALUES ('30005', '四楼行政办公室', '开放', '', '', '');
INSERT INTO `kc_place` VALUES ('30006', '四楼财务室保险箱', '开放', '', '', '');
INSERT INTO `kc_place` VALUES ('30007', '四楼财务室箱子', '开放', '', '', '');

-- ----------------------------
-- Table structure for rk_application
-- ----------------------------
DROP TABLE IF EXISTS `rk_application`;
CREATE TABLE `rk_application` (
  `rk_application_id` int(8) NOT NULL AUTO_INCREMENT,
  `sh_id` int(8) DEFAULT NULL,
  `sh_name` varchar(30) DEFAULT NULL,
  `sp_id` int(8) DEFAULT NULL,
  `sp_name` varchar(30) DEFAULT NULL,
  `expect_rk_time` date DEFAULT NULL,
  `expect_rk_number` int(10) DEFAULT NULL,
  `commodity_rating` varchar(10) DEFAULT NULL,
  `sld_id` varchar(10) DEFAULT NULL,
  `rk_place_id` int(5) DEFAULT NULL,
  `rk_place_add` varchar(30) DEFAULT NULL,
  `rk_type` enum('任意配置','一元购','社区特卖','物业礼包','福利（其他）','福利') DEFAULT '任意配置',
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
  KEY `sp_name` (`sp_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rk_application
-- ----------------------------

-- ----------------------------
-- Table structure for rk_detail
-- ----------------------------
DROP TABLE IF EXISTS `rk_detail`;
CREATE TABLE `rk_detail` (
  `rk_id` int(8) NOT NULL AUTO_INCREMENT,
  `sp_id` int(8) DEFAULT NULL,
  `sh_id` int(8) DEFAULT NULL,
  `expect_rk_time` date DEFAULT NULL,
  `sj_stock_date` date DEFAULT NULL,
  `rk_place_id` int(5) DEFAULT NULL,
  `expect_rk_number` int(10) DEFAULT NULL,
  `ss_number` int(10) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `rk_type` enum('一元购','社区特卖','物业礼包','任意配置','福利（其他）','福利') DEFAULT '任意配置',
  `category` enum('正常转库','正常调拨','正常入库') DEFAULT '正常入库',
  `state` enum('no','ok') DEFAULT 'no',
  `checkuser` varchar(30) DEFAULT NULL,
  `adduser` varchar(30) DEFAULT NULL,
  `rkapplicationId` int(4) DEFAULT NULL,
  `over` int(1) DEFAULT NULL,
  PRIMARY KEY (`rk_id`),
  KEY `rksp_id` (`sp_id`) USING BTREE,
  KEY `rk_plcae_id` (`rk_place_id`)
) ENGINE=InnoDB AUTO_INCREMENT=70000913 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rk_detail
-- ----------------------------
INSERT INTO `rk_detail` VALUES ('70000001', '10000001', '20000001', null, '2016-01-27', '30001', null, '73', 'SHSQ20150002108', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000002', '10000002', '20000002', null, '2015-11-30', '30001', null, '1106', '0055146', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000003', '10000003', '20000003', null, '2016-02-01', '30001', null, '65', '0057414', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000004', '10000004', '20000004', null, '2016-02-16', '30001', null, '50', '0057759', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000005', '10000005', '20000005', null, '2015-10-12', '30001', null, '23', 'SHSQ20150001810', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000006', '10000006', '20000006', null, '2015-11-13', '30001', null, '7', 'SHSQ20150000314', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000007', '10000007', '20000007', null, '2015-11-13', '30001', null, '10', '', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000008', '10000008', '20000006', null, '2015-11-13', '30001', null, '19', 'SHSQ20150000314', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000009', '10000009', '20000008', null, '2015-12-07', '30001', null, '276', 'SHSQ20150001973，0057356', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000010', '10000010', '20000007', null, '2015-01-20', '30002', null, '362', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000011', '10000011', '20000009', null, '2015-11-18', '30001', null, '397', 'SHSQ20150002053', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000012', '10000012', '20000010', null, '2015-11-23', '30001', null, '610', 'SHSQ20150000599', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000013', '10000013', '20000009', null, '2015-12-03', '30001', null, '1387', 'SHSQ20150002084', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000014', '10000014', '20000011', null, '2015-12-16', '30001', null, '5', 'SHSQ20150003401', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000015', '10000015', '20000011', null, '2015-12-16', '30001', null, '59', 'SHSQ20150003401', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000016', '10000016', '20000011', null, '2015-12-16', '30001', null, '35', 'SHSQ20150003401', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000017', '10000017', '20000012', null, '2015-12-08', '30001', null, '1600', '0055714', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000018', '10000018', '20000012', null, '2015-12-08', '30001', null, '105', '0055713', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000019', '10000019', '20000013', null, '2015-03-30', '30001', null, '949', '0048745', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000020', '10000020', '20000014', null, '2015-11-26', '30001', null, '495', 'SHSQ20150001122', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000021', '10000021', '20000015', null, '2016-01-06', '30001', null, '13', '0057775', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000022', '10000022', '20000016', null, '2015-10-09', '30001', null, '38', 'SHSQ20150000308', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000023', '10000023', '20000013', null, '2015-10-30', '30001', null, '1336', '0055185', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000024', '10000024', '20000013', null, '2015-10-30', '30001', null, '56', '0055185', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000025', '10000025', '20000017', null, '2015-09-07', '30001', null, '20', '0049780', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000026', '10000026', '20000018', null, '2015-10-26', '30003', null, '63', '0052730', '任意配置', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000027', '10000027', '20000019', null, '2015-12-15', '30003', null, '14', '0057401，0052047', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000028', '10000028', '20000017', null, '2015-09-07', '30001', null, '221', '0049781', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000029', '10000028', '20000017', null, '2015-09-07', '30003', null, '762', '0049781', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000030', '10000029', '20000020', null, '2015-11-03', '30001', null, '20', '0050750', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000031', '10000030', '20000021', null, '2015-09-10', '30001', null, '9258', '0051569，0057206，0057387，0057462，0057423', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000032', '10000031', '20000022', null, '2015-12-07', '30001', null, '218', 'SHSQ20150000713', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000033', '10000032', '20000022', null, '2015-12-07', '30001', null, '219', 'SHSQ20150000713', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000034', '10000033', '20000022', null, '2015-12-07', '30001', null, '221', 'SHSQ20150000713', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000035', '10000034', '20000023', null, '2015-12-11', '30001', null, '40', '0057359', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000036', '10000035', '20000024', null, '2015-12-24', '30001', null, '650', '0057386', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000037', '10000036', '20000024', null, '2016-01-14', '30001', null, '70', 'SHSQ20150003124', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000038', '10000037', '20000024', null, '2016-01-14', '30001', null, '30', 'SHSQ20150003124', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000039', '10000038', '20000025', null, '2015-09-15', '30001', null, '9', '0049104', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000040', '10000039', '20000026', null, '2015-11-18', '30001', null, '30', '0057208', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000041', '10000040', '20000027', null, '2015-12-07', '30001', null, '115', 'SHSQ20150001974', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000042', '10000041', '20000028', null, '2015-12-09', '30001', null, '1040', 'SHSQ20150001385', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000043', '10000042', '20000028', null, '2015-12-09', '30001', null, '852', 'SHSQ20150001385', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000044', '10000043', '20000027', null, '2015-12-07', '30001', null, '118', 'SHSQ20150001974', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000045', '10000044', '20000027', null, '2015-12-07', '30001', null, '116', 'SHSQ20150001974', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000046', '10000045', '20000020', null, '2015-11-04', '30003', null, '792', 'SHSQ20150000576', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000047', '10000046', '20000029', null, '2015-11-09', '30001', null, '60', '', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000048', '10000047', '20000027', null, '2015-12-07', '30001', null, '117', 'SHSQ20150001974', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000049', '10000048', '20000010', null, '2015-11-19', '30001', null, '47', 'SHSQ20150001353', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000050', '10000049', '20000030', null, '2015-09-28', '30003', null, '5', '0050607', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000051', '10000050', '20000031', null, '2016-01-07', '30001', null, '6424', '0055857', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000052', '10000051', '20000031', null, '2016-01-07', '30001', null, '61760', '0055887', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000053', '10000051', '20000031', null, '2016-01-20', '30003', null, '8475', '0055887', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000054', '10000052', '20000032', null, '2015-12-22', '30001', null, '7500', '0057389', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000055', '10000053', '20000033', null, '2015-12-28', '30001', null, '1033', '0055858', '任意配置', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000056', '10000054', '20000034', null, '2015-12-31', '30003', null, '20', '0057753/0057754/0057755/0057776/0057777/0057778', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000057', '10000055', '20000035', null, '2015-09-10', '30001', null, '342', '0054951', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000058', '10000056', '20000034', null, '2015-12-31', '30003', null, '20', '0057753/0057754/0057755/0057776/0057777/0057778', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000059', '10000054', '20000034', null, '2016-01-21', '30001', null, '3', '0057776/0057777/0057778', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000060', '10000056', '20000034', null, '2016-01-21', '30001', null, '7', '0057776/0057777/0057778', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000061', '10000057', '20000034', null, '2016-01-21', '30001', null, '34', '0057776/0057777/0057778', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000062', '10000057', '20000034', null, '2015-12-31', '30003', null, '40', '0057753/0057754/0057755/0057776/0057777/0057778', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000063', '10000058', '20000030', null, '2015-09-28', '30001', null, '19', '0050615', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000064', '10000059', '20000007', null, '2015-06-08', '30001', null, '236', '', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000065', '10000060', '20000030', null, '2015-11-30', '30001', null, '220', '0055151', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000066', '10000061', '20000036', null, '2015-12-10', '30001', null, '40', '0055861', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000067', '10000062', '20000018', null, '2015-10-26', '30001', null, '4', '0052730', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000068', '10000063', '20000005', null, '2015-11-09', '30003', null, '25', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000069', '10000064', '20000005', null, '2015-11-09', '30001', null, '1876', 'SHSQ20150001810', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000070', '10000065', '20000030', null, '2015-09-28', '30001', null, '19', '0050615', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000071', '10000066', '20000030', null, '2015-11-30', '30001', null, '940', '0055151', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000072', '10000067', '20000007', null, '2015-07-09', '30003', null, '56', '', '福利（其他）', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000073', '10000067', '20000007', null, '2015-06-19', '30001', null, '220', '', '福利（其他）', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000074', '10000068', '20000007', null, '2015-10-20', '30001', null, '8', '', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000075', '10000069', '20000007', null, '2015-10-20', '30001', null, '8', '', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000076', '10000070', '20000037', null, '2015-11-09', '30001', null, '35', '0052732', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000077', '10000071', '20000037', null, '2015-11-09', '30001', null, '216', '0052732', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000078', '10000072', '20000038', null, '2015-11-26', '30001', null, '478', 'SHSQ20150000697', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000079', '10000073', '20000038', null, '2015-11-26', '30001', null, '450', '0053567', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000080', '10000074', '20000014', null, '2015-11-26', '30001', null, '130', 'SHSQ20150001122', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000081', '10000072', '20000038', null, '2016-01-04', '30003', null, '6000', 'SHSQ20150000697', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000082', '10000075', '20000039', null, '2015-12-18', '30001', null, '1407', '0057394', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000083', '10000076', '20000007', null, '2015-11-12', '30001', null, '47', '', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000084', '10000077', '20000040', null, '2015-11-12', '30001', null, '50', '0049925', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000085', '10000078', '20000002', null, '2015-11-30', '30001', null, '586', 'SHSQ20150002174', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000086', '10000079', '20000041', null, '2015-12-25', '30001', null, '192', 'SHSQ20150000915 SHSQ20150000916', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000087', '10000080', '20000042', null, '2016-01-20', '30001', null, '42', '0056101', '一元购', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000088', '10000081', '20000042', null, '2016-01-20', '30001', null, '143', 'SHSQ20150002467', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000089', '10000082', '20000043', null, '2015-11-11', '30001', null, '12', '0048350', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000090', '10000083', '20000029', null, '2016-01-07', '30001', null, '152', 'SHSQ20150003303', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000091', '10000084', '20000029', null, '2016-01-07', '30001', null, '188', 'SHSQ20150003303', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000092', '10000085', '20000029', null, '2016-01-07', '30001', null, '185', 'SHSQ20150003303', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000093', '10000086', '20000029', null, '2016-01-07', '30001', null, '189', 'SHSQ20150003303', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000094', '10000087', '20000044', null, '2015-11-17', '30001', null, '6', 'SHSQ20150001802', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000095', '10000088', '20000045', null, '2015-11-17', '30001', null, '108', '0057204', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000096', '10000089', '20000012', null, '2015-12-08', '30001', null, '150', 'SHSQ20150002366 SHSQ20150002367 SHSQ20150002368 SHSQ20150002369', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000097', '10000090', '20000042', null, '2016-01-20', '30001', null, '143', 'SHSQ20150002467', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000098', '10000091', '20000030', null, '2015-10-16', '30001', null, '1', '0050628', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000099', '10000092', '20000007', null, '2015-04-16', '30001', null, '21', '408瓶有效期为2016/4/29', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000100', '10000093', '20000046', null, '2015-11-18', '30001', null, '100', 'SHSQ20150001651', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000101', '10000094', '20000046', null, '2015-12-14', '30001', null, '864', 'SHSQ20150001665', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000102', '10000095', '20000038', null, '2015-11-27', '30001', null, '108', 'SHSQ20150000417', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000103', '10000096', '20000038', null, '2015-11-27', '30001', null, '108', 'SHSQ20150000417', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000104', '10000097', '20000038', null, '2015-11-27', '30001', null, '108', 'SHSQ20150000417', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000105', '10000098', '20000047', null, '2016-01-06', '30001', null, '16', '0055873', '任意配置', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000106', '10000099', '20000047', null, '2016-01-06', '30001', null, '35', 'SHSQ20150002455', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000107', '10000100', '20000047', null, '2016-01-06', '30001', null, '35', 'SHSQ20150002455', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000108', '10000101', '20000048', null, '2015-11-26', '30001', null, '281', 'SHSQ20150000533', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000109', '10000102', '20000007', null, '2015-05-27', '30001', null, '5', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000110', '10000103', '20000049', null, '2016-01-29', '30001', null, '1', '0057262', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000111', '10000104', '20000050', null, '2015-07-21', '30001', null, '31', '0047781', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000112', '10000105', '20000027', null, '2015-11-13', '30001', null, '185', 'SHSQ20150001974', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000113', '10000106', '20000027', null, '2015-11-13', '30001', null, '189', 'SHSQ20150001974', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000114', '10000107', '20000027', null, '2015-11-13', '30001', null, '283', 'SHSQ20150001974', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000115', '10000108', '20000027', null, '2015-11-13', '30001', null, '284', 'SHSQ20150001974', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000116', '10000109', '20000027', null, '2015-11-13', '30001', null, '145', 'SHSQ20150001801', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000117', '10000110', '20000027', null, '2015-11-13', '30001', null, '143', 'SHSQ20150001801', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000118', '10000111', '20000027', null, '2015-11-13', '30001', null, '10', '', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000119', '10000112', '20000027', null, '2015-11-13', '30001', null, '10', '', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000120', '10000113', '20000024', null, '2015-12-07', '30001', null, '188', 'SHSQ20150001973', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000121', '10000114', '20000024', null, '2015-12-07', '30001', null, '200', 'SHSQ20150001973', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000122', '10000115', '20000026', null, '2015-12-07', '30001', null, '6', 'SHSQ20150001809', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000123', '10000116', '20000029', null, '2015-12-10', '30001', null, '149', 'SHSQ20150001994，SHSQ20150003303', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000124', '10000117', '20000051', null, '2015-12-30', '30001', null, '50', 'SHSQ20150002458', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000125', '10000118', '20000052', null, '2016-01-11', '30001', null, '4382', 'SHSQ20150000909，SHSQ20150002381', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000126', '10000119', '20000052', null, '2016-01-11', '30001', null, '5083', 'SHSQ20150000909，SHSQ20150002381', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000127', '10000120', '20000052', null, '2016-01-11', '30001', null, '4357', 'SHSQ20150000909，SHSQ20150002381', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000128', '10000121', '20000052', null, '2016-01-18', '30001', null, '5000', 'SHSQ20150000909，SHSQ20150002381', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000129', '10000122', '20000052', null, '2016-01-18', '30001', null, '5000', 'SHSQ20150000909，SHSQ20150002381', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000130', '10000123', '20000052', null, '2016-01-18', '30001', null, '5000', 'SHSQ20150000909，SHSQ20150002381', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000131', '10000124', '20000052', null, '2016-02-01', '30001', null, '5000', 'SHSQ20150000909，SHSQ20150002381', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000132', '10000125', '20000053', null, '2015-12-24', '30001', null, '560', '0055194', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000133', '10000126', '20000053', null, '2015-12-25', '30001', null, '109', 'SHSQ20150000933', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000134', '10000127', '20000054', null, '2016-01-06', '30001', null, '240', '0057707', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000135', '10000128', '20000054', null, '2016-01-06', '30001', null, '20', '0057707', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000136', '10000129', '20000053', null, '2016-01-06', '30001', null, '440', '0055194', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000137', '10000130', '20000024', null, '2015-10-21', '30001', null, '149', 'SHSQ20150001973', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000138', '10000131', '20000055', null, '2015-05-14', '30001', null, '1244', '', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000139', '10000132', '20000056', null, '2015-12-31', '30001', null, '4585', '0057395', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000140', '10000133', '20000057', null, '2015-08-27', '30001', null, '125', '0052271，0052297', '福利（其他）', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000141', '10000134', '20000058', null, '2015-11-25', '30001', null, '2640', '0052738', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000142', '10000135', '20000059', null, '2015-12-24', '30001', null, '78', 'SHSQ20150000912', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000143', '10000136', '20000059', null, '2015-12-24', '30001', null, '316', '0055715', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000144', '10000137', '20000058', null, '2015-11-25', '30001', null, '172', '0051304', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000145', '10000138', '20000041', null, '2015-12-25', '30001', null, '180', 'SHSQ20150000915 SHSQ20150000916', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000146', '10000139', '20000060', null, '2015-10-28', '30001', null, '78', 'SHSQ20150000577', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000147', '10000140', '20000061', null, '2015-11-26', '30001', null, '927', '0057311', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000148', '10000141', '20000061', null, '2015-11-26', '30001', null, '1107', '0057311', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000149', '10000142', '20000024', null, '2015-10-14', '30001', null, '177', 'SHSQ20150000106', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000150', '10000143', '20000011', null, '2015-12-16', '30001', null, '35', 'SHSQ20150003402', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000151', '10000144', '20000007', null, '2015-05-10', '30001', null, '5', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000152', '10000145', '20000046', null, '2015-11-18', '30001', null, '52', 'SHSQ20150001651', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000153', '10000146', '20000062', null, '2016-01-11', '30001', null, '50', 'SHSQ20150003549', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000154', '10000147', '20000063', null, '2015-08-31', '30001', null, '24', '0052383', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000155', '10000148', '20000063', null, '2015-08-31', '30001', null, '22', '0052383', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000156', '10000149', '20000063', null, '2015-08-31', '30001', null, '42', '0052383', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000157', '10000150', '20000005', null, '2015-10-12', '30001', null, '7', 'SHSQ20150000301', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000158', '10000151', '20000063', null, '2015-08-31', '30001', null, '119', '0052383', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000159', '10000152', '20000014', null, '2015-11-26', '30001', null, '201', 'SHSQ20150001122', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000160', '10000153', '20000056', null, '2016-01-18', '30001', null, '5208', '0057494', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000161', '10000154', '20000063', null, '2015-08-31', '30001', null, '25', '0052383', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000162', '10000155', '20000063', null, '2015-08-31', '30001', null, '54', '0052383', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000163', '10000156', '20000064', null, '2016-01-11', '30001', null, '50', '0057488', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000164', '10000157', '20000063', null, '2015-08-31', '30001', null, '14', '0052383', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000165', '10000158', '20000065', null, '2015-12-07', '30001', null, '14', 'SHSQ20150001975，SHSQ20150001995', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000166', '10000159', '20000065', null, '2015-12-07', '30001', null, '20', 'SHSQ20150001975，SHSQ20150001995', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000167', '10000160', '20000065', null, '2015-12-07', '30001', null, '20', 'SHSQ20150001975，SHSQ20150001995', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000168', '10000161', '20000066', null, '2016-01-05', '30001', null, '269', 'SHSQ20150002957', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000169', '10000162', '20000066', null, '2016-01-05', '30001', null, '96', '0055888', '任意配置', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000170', '10000163', '20000067', null, '2016-01-15', '30001', null, '10', 'SHSQ20150002520', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000171', '10000164', '20000063', null, '2015-08-31', '30001', null, '40', '0052383', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000172', '10000165', '20000063', null, '2015-08-31', '30001', null, '39', '0052383', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000173', '10000166', '20000063', null, '2015-08-31', '30001', null, '72', '0052383', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000174', '10000167', '20000063', null, '2015-08-31', '30001', null, '47', '0052383', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000175', '10000168', '20000063', null, '2015-08-31', '30001', null, '373', '0052383', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000176', '10000169', '20000068', null, '2015-07-16', '30001', null, '49', '0048325', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000177', '10000170', '20000024', null, '2015-10-14', '30001', null, '51', 'SHSQ20150001973', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000178', '10000171', '20000069', null, '2015-09-10', '30001', null, '1923', '0051570', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000179', '10000172', '20000027', null, '2015-11-13', '30001', null, '178', 'SHSQ20150001974', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000180', '10000173', '20000070', null, '2015-11-19', '30001', null, '32', '0057202', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000181', '10000174', '20000037', null, '2015-12-24', '30001', null, '1979', '0055871', '任意配置', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000182', '10000175', '20000037', null, '2015-12-24', '30001', null, '2853', 'SHSQ20150000651', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000183', '10000176', '20000026', null, '2015-12-07', '30001', null, '6', 'SHSQ20150001809', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000184', '10000177', '20000063', null, '2015-08-31', '30001', null, '21', '0052383', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000185', '10000178', '20000063', null, '2015-08-31', '30001', null, '198', '0052383', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000186', '10000179', '20000071', null, '2015-08-31', '30001', null, '81', '0052399', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000187', '10000180', '20000072', null, '2015-10-13', '30001', null, '1066', '0050851', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000188', '10000181', '20000026', null, '2015-12-07', '30001', null, '9', 'SHSQ20150001809', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000189', '10000182', '20000067', null, '2016-01-15', '30001', null, '100', 'SHSQ20150002520', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000190', '10000183', '20000067', null, '2016-01-15', '30001', null, '18', 'SHSQ20150002520', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000191', '10000184', '20000073', null, '2015-10-12', '30001', null, '12', 'SHSQ20150000302', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000192', '10000185', '20000074', null, '2015-10-11', '30003', null, '24', 'SHSQ20150000304', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000193', '10000185', '20000074', null, '2015-10-11', '30001', null, '5', 'SHSQ20150000304', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000194', '10000186', '20000075', null, '2016-01-13', '30001', null, '6400', '0057897', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000195', '10000187', '20000063', null, '2015-08-31', '30001', null, '80', '0052383', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000196', '10000188', '20000076', null, '2015-12-10', '30001', null, '214', 'SHSQ20150003530', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000197', '10000189', '20000077', null, '2015-12-24', '30003', null, '23', '0053702', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000198', '10000190', '20000063', null, '2015-08-31', '30001', null, '45', '0052383', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000199', '10000191', '20000078', null, '2015-08-10', '30001', null, '1201', '0054188', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000200', '10000192', '20000062', null, '2016-01-11', '30001', null, '100', 'SHSQ20150003548', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000201', '10000193', '20000063', null, '2015-08-31', '30001', null, '172', '0052383', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000202', '10000194', '20000077', null, '2015-12-24', '30003', null, '23', '0053702', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000203', '10000195', '20000079', null, '2016-01-20', '30001', null, '780', '0055894', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000204', '10000196', '20000074', null, '2015-10-11', '30003', null, '15', '', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000205', '10000197', '20000009', null, '2015-11-18', '30001', null, '40', 'SHSQ20150002053', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000206', '10000196', '20000074', null, '2015-10-11', '30001', null, '14', 'SHSQ20150000304', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000207', '10000198', '20000080', null, null, '30001', null, '1310', '0055645，SHSQ20150002279', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000208', '10000199', '20000081', null, '2016-01-20', '30001', null, '300', 'SHSQ20150002464', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000209', '10000200', '20000081', null, '2016-01-20', '30001', null, '100', 'SHSQ20150002464', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000210', '10000201', '20000044', null, '2015-11-17', '30001', null, '111', 'SHSQ20150001802', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000211', '10000202', '20000081', null, '2016-01-20', '30001', null, '300', 'SHSQ20150002464', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000212', '10000203', '20000082', null, '2015-10-21', '30001', null, '604', 'SHSQ20150000037', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000213', '10000204', '20000082', null, '2015-10-21', '30001', null, '220', '', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000214', '10000205', '20000082', null, '2015-10-21', '30001', null, '79', '0052678', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000215', '10000206', '20000083', null, '2015-11-27', '30001', null, '1000', '0055737', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000216', '10000207', '20000083', null, '2015-11-27', '30001', null, '13005', '0055737', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000217', '10000208', '20000083', null, '2016-01-14', '30001', null, '457', '0055737', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000218', '10000209', '20000083', null, '2016-01-14', '30001', null, '457', '0055737', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000219', '10000210', '20000041', null, '2015-12-25', '30001', null, '1400', '0055716', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000220', '10000211', '20000041', null, '2015-12-25', '30001', null, '494', 'SHSQ20150000915 SHSQ20150000916', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000221', '10000212', '20000084', null, '2016-01-28', '30001', null, '950', '0057425', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000222', '10000213', '20000007', null, '2015-06-12', '30001', null, '23', '', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000223', '10000214', '20000041', null, '2015-12-25', '30001', null, '173', 'SHSQ20150000915 SHSQ20150000916', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000224', '10000215', '20000007', null, '2015-10-09', '30001', null, '18', '', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000225', '10000216', '20000007', null, '2015-10-09', '30001', null, '7', '', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000226', '10000217', '20000055', null, '2016-01-04', '30001', null, '3', '0057745 0057746', '一元购', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000227', '10000218', '20000055', null, '2016-01-04', '30001', null, '9', '0057745 0057746', '一元购', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000228', '10000219', '20000085', null, '2015-08-18', '30001', null, '10000', '0053155', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000229', '10000220', '20000069', null, '2015-10-09', '30001', null, '32', 'SHSQ20150000105', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000230', '10000221', '20000007', null, '2015-01-20', '30004', null, '10', '预约电话：021-50213999，原卡上400电话无法使用', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000231', '10000222', '20000086', null, '2015-11-26', '30001', null, '200', 'SHSQ20150002156', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000232', '10000223', '20000086', null, '2015-11-26', '30001', null, '110', 'SHSQ20150002156', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000233', '10000224', '20000086', null, '2015-11-26', '30001', null, '240', 'SHSQ20150002156', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000234', '10000225', '20000087', null, '2015-12-30', '30001', null, '105', 'SHSQ20150002096', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000235', '10000226', '20000012', null, '2015-12-08', '30001', null, '420', 'SHSQ20150002366 SHSQ20150002367 SHSQ20150002368 SHSQ20150002369', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000236', '10000189', '20000077', null, '2015-12-24', '30001', null, '84', '0053702', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000237', '10000227', '20000062', null, '2016-01-11', '30001', null, '22', 'SHSQ20150003548', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000238', '10000228', '20000074', null, '2015-10-11', '30003', null, '15', '', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000239', '10000228', '20000074', null, '2015-10-11', '30001', null, '12', 'SHSQ20150000304', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000240', '10000229', '20000046', null, '2015-12-14', '30001', null, '816', 'SHSQ20150001665', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000241', '10000230', '20000088', null, '2015-08-18', '30001', null, '1966', '0048097', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000242', '10000231', '20000026', null, '2015-11-17', '30001', null, '20', 'SHSQ20150001352', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000243', '10000232', '20000089', null, '2015-08-24', '30001', null, '500', '0053943', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000244', '10000233', '20000069', null, '2015-10-09', '30001', null, '7', 'SHSQ20150000105', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000245', '10000234', '20000090', null, '2015-12-03', '30001', null, '425', 'SHSQ20150002082', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000246', '10000235', '20000090', null, '2016-02-16', '30001', null, '100', '0053434', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000247', '10000236', '20000091', null, '2015-11-09', '30001', null, '195', '0049233', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000248', '10000237', '20000091', null, '2015-11-09', '30001', null, '100', '0049233', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000249', '10000194', '20000077', null, '2015-12-24', '30001', null, '212', '0053702', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000250', '10000238', '20000092', null, '2015-11-23', '30001', null, '221', 'SHSQ20150001814', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000251', '10000239', '20000069', null, '2015-10-09', '30001', null, '12', 'SHSQ20150000105', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000252', '10000240', '20000093', null, '2015-11-30', '30001', null, '51', '0055644', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000253', '10000241', '20000069', null, '2015-10-09', '30001', null, '15', 'SHSQ20150000105', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000254', '10000242', '20000094', null, '2015-11-20', '30001', null, '229', 'SHSQ20150000315', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000255', '10000243', '20000094', null, '2015-11-20', '30001', null, '183', 'SHSQ20150000315', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000256', '10000244', '20000094', null, '2015-12-08', '30001', null, '395', 'SHSQ20150000315', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000257', '10000245', '20000095', null, '2016-01-21', '30001', null, '10000', '0057470', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000258', '10000246', '20000096', null, '2015-08-28', '30001', null, '399', '0052435', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000259', '10000247', '20000097', null, '2015-11-12', '30001', null, '326', 'SHSQ20150000311', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000260', '10000248', '20000097', null, '2015-11-12', '30001', null, '326', 'SHSQ20150000311', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000261', '10000249', '20000097', null, '2015-11-12', '30001', null, '1728', 'SHSQ20150000311', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000262', '10000250', '20000098', null, '2015-11-17', '30001', null, '27', 'SHSQ20150001805', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000263', '10000249', '20000097', null, '2015-11-12', '30003', null, '628', '', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000264', '10000251', '20000022', null, '2015-12-07', '30001', null, '50', 'SHSQ20150000713', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000265', '10000252', '20000099', null, '2015-12-10', '30001', null, '23', 'SHSQ20150001832', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000266', '10000253', '20000099', null, '2015-12-10', '30001', null, '23', 'SHSQ20150001832', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000267', '10000254', '20000099', null, '2015-12-10', '30001', null, '24', 'SHSQ20150001832', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000268', '10000255', '20000099', null, '2015-12-10', '30001', null, '21', 'SHSQ20150001832', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000269', '10000256', '20000099', null, '2015-12-10', '30001', null, '31', 'SHSQ20150001832', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000270', '10000257', '20000100', null, '2015-12-14', '30001', null, '1741', '0057328', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000271', '10000258', '20000101', null, '2015-12-22', '30001', null, '312', 'SHSQ20150001670', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000272', '10000259', '20000100', null, '2015-12-14', '30001', null, '2578', '0057328', '一元购', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000273', '10000260', '20000084', null, '2015-12-28', '30001', null, '104', 'SHSQ20150001969', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000274', '10000261', '20000084', null, '2015-12-28', '30001', null, '100', 'SHSQ20150001969', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000275', '10000262', '20000046', null, '2015-12-16', '30001', null, '90', 'SHSQ20150003451', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000276', '10000263', '20000077', null, '2015-12-24', '30001', null, '232', '0002601,0002602', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000277', '10000264', '20000102', null, '2015-12-25', '30001', null, '299', '0057706', '任意配置', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000278', '10000265', '20000102', null, '2015-12-25', '30001', null, '810', 'SHSQ20150000927', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000279', '10000266', '20000030', null, '2015-10-16', '30001', null, '16', '0050629', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000280', '10000267', '20000030', null, '2015-10-16', '30001', null, '254', '0050628', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000281', '10000268', '20000030', null, '2015-10-16', '30001', null, '100', '0050629', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000282', '10000266', '20000030', null, '2015-10-16', '30003', null, '382', '0050629', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000283', '10000269', '20000069', null, '2015-10-09', '30001', null, '24', 'SHSQ20150000105', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000284', '10000270', '20000009', null, '2015-12-09', '30001', null, '71', 'SHSQ20150002089', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000285', '10000271', '20000103', null, '2016-02-01', '30001', null, '48', 'SHSQ20150001408、SHSQ20150001409、SHSQ20150002465', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000286', '10000272', '20000103', null, '2016-02-01', '30001', null, '12', 'SHSQ20150001408、SHSQ20150001409、SHSQ20150002465', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000287', '10000273', '20000103', null, '2016-02-01', '30001', null, '24', 'SHSQ20150001408、SHSQ20150001409、SHSQ20150002465', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000288', '10000274', '20000103', null, '2016-02-01', '30001', null, '36', 'SHSQ20150001408、SHSQ20150001409、SHSQ20150002465', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000289', '10000275', '20000103', null, '2016-02-01', '30001', null, '18', 'SHSQ20150001408、SHSQ20150001409、SHSQ20150002465', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000290', '10000276', '20000103', null, '2016-02-01', '30001', null, '20', 'SHSQ20150001408、SHSQ20150001409、SHSQ20150002465', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000291', '10000277', '20000104', null, '2015-11-18', '30001', null, '10', '0057207', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000292', '10000278', '20000009', null, '2015-12-14', '30001', null, '149', 'SHSQ20150002092，SHSQ20150002099', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000293', '10000279', '20000105', null, '2015-10-15', '30001', null, '1245', '0050631', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000294', '10000280', '20000087', null, '2015-12-30', '30001', null, '105', 'SHSQ20150002096', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000295', '10000281', '20000103', null, '2016-02-01', '30001', null, '72', 'SHSQ20150001408、SHSQ20150001409、SHSQ20150002465', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000296', '10000282', '20000103', null, '2016-02-01', '30001', null, '48', 'SHSQ20150001408、SHSQ20150001409、SHSQ20150002465', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000297', '10000283', '20000009', null, '2015-12-14', '30001', null, '149', 'SHSQ20150002092，SHSQ20150002099', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000298', '10000284', '20000016', null, '2015-10-09', '30001', null, '62', 'SHSQ20150000308', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000299', '10000285', '20000106', null, '2015-10-13', '30001', null, '59', '0049502', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000300', '10000286', '20000009', null, '2015-12-14', '30001', null, '149', 'SHSQ20150002092，SHSQ20150002099', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000301', '10000287', '20000007', null, '2015-10-20', '30001', null, '32', '', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000302', '10000288', '20000007', null, '2015-06-04', '30001', null, '430', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000303', '10000289', '20000007', null, '2015-12-14', '30001', null, '400', '', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000304', '10000290', '20000107', null, '2015-11-03', '30001', null, '178', '0049234', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000305', '10000291', '20000107', null, '2015-11-03', '30001', null, '52', '0049234', '任意配置', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000306', '10000292', '20000012', null, '2015-12-08', '30001', null, '204', 'SHSQ20150002366 SHSQ20150002367 SHSQ20150002368 SHSQ20150002369', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000307', '10000293', '20000015', null, '2016-01-06', '30001', null, '23', '0057774', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000308', '10000294', '20000108', null, '2015-08-17', '30001', null, '3484', '0054802', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000309', '10000295', '20000065', null, '2015-12-07', '30001', null, '20', 'SHSQ20150001975', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000310', '10000296', '20000100', null, '2015-12-14', '30001', null, '501', 'SHSQ20150001993', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000311', '10000297', '20000100', null, '2015-12-14', '30001', null, '1449', 'SHSQ20150001993', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000312', '10000298', '20000109', null, '2015-12-28', '30001', null, '130', '0055874', '一元购', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000313', '10000299', '20000109', null, '2015-12-28', '30001', null, '470', 'SHSQ20150002952', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000314', '10000300', '20000110', null, '2016-01-11', '30001', null, '16', 'SHSQ20150003456', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000315', '10000301', '20000007', null, '2015-06-08', '30001', null, '297', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000316', '10000302', '20000007', null, '2015-06-04', '30003', null, '41', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000317', '10000303', '20000055', null, '2015-09-29', '30001', null, '2', '0049532', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000318', '10000304', '20000111', null, '2015-09-01', '30001', null, '382', '0051068', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000319', '10000305', '20000068', null, '2015-07-16', '30001', null, '41', '0048325', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000320', '10000306', '20000112', null, '2015-12-10', '30001', null, '15', 'SHSQ20150001992', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000321', '10000307', '20000112', null, '2015-12-10', '30001', null, '15', 'SHSQ20150001992', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000322', '10000308', '20000112', null, '2015-12-10', '30001', null, '12', 'SHSQ20150001992', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000323', '10000309', '20000112', null, '2015-12-10', '30001', null, '17', 'SHSQ20150001992', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000324', '10000310', '20000112', null, '2015-12-10', '30001', null, '66', 'SHSQ20150001992', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000325', '10000311', '20000112', null, '2015-12-10', '30001', null, '6', 'SHSQ20150001992', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000326', '10000312', '20000113', null, '2015-12-09', '30001', null, '194', 'SHSQ20150001001', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000327', '10000313', '20000113', null, '2015-12-09', '30001', null, '287', 'SHSQ20150001003', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000328', '10000314', '20000007', null, '2015-01-20', '30001', null, '60', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000329', '10000315', '20000075', null, '2016-01-12', '30001', null, '1026', '0057898', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000330', '10000316', '20000073', null, '2015-10-12', '30003', null, '5', 'SHSQ20150000302', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000331', '10000316', '20000073', null, '2015-10-12', '30001', null, '1', 'SHSQ20150000302', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000332', '10000317', '20000114', null, '2015-09-18', '30001', null, '44', '0052931', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000333', '10000318', '20000115', null, '2015-12-22', '30003', null, '98', 'SHSQ20150000540', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000334', '10000319', '20000116', null, '2015-07-08', '30001', null, '227', '0048206', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000335', '10000320', '20000117', null, '2015-09-23', '30001', null, '156', '0051575', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000336', '10000321', '20000007', null, '2015-11-04', '30001', null, '45', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000337', '10000322', '20000007', null, '2015-11-04', '30001', null, '717', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000338', '10000323', '20000026', null, '2015-12-07', '30001', null, '12', 'SHSQ20150001809', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000339', '10000324', '20000094', null, '2015-11-20', '30001', null, '350', 'SHSQ20150000315', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000340', '10000325', '20000094', null, '2015-11-20', '30001', null, '268', 'SHSQ20150000315', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000341', '10000326', '20000094', null, '2015-12-08', '30001', null, '591', 'SHSQ20150000315', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000342', '10000327', '20000094', null, '2015-12-08', '30001', null, '150', 'SHSQ20150000315', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000343', '10000328', '20000094', null, '2015-12-08', '30001', null, '37', '0057215', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000344', '10000329', '20000118', null, '2015-12-31', '30001', null, '3759', '0057401', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000345', '10000330', '20000066', null, '2016-01-05', '30001', null, '153', 'SHSQ20150002963', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000346', '10000331', '20000066', null, '2016-01-05', '30001', null, '30', 'SHSQ20150002962', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000347', '10000332', '20000066', null, '2016-01-05', '30001', null, '77', 'SHSQ20150002962', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000348', '10000333', '20000066', null, '2016-01-05', '30001', null, '205', 'SHSQ20150002960', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000349', '10000334', '20000066', null, '2016-01-05', '30001', null, '20', 'SHSQ20150002958', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000350', '10000335', '20000066', null, '2016-01-05', '30001', null, '9', 'SHSQ20150002958', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000351', '10000336', '20000066', null, '2016-01-05', '30001', null, '28', 'SHSQ20150002958', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000352', '10000337', '20000066', null, '2016-01-05', '30001', null, '860', 'SHSQ20150002957', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000353', '10000338', '20000033', null, '2016-01-21', '30001', null, '24000', '0057428', '任意配置', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000354', '10000339', '20000033', null, '2016-01-21', '30001', null, '23400', 'SHSQ20150002964', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000355', '10000340', '20000119', null, '2015-09-03', '30001', null, '6', '0048348', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000356', '10000341', '20000119', null, '2015-09-03', '30001', null, '71', '0057011', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000357', '10000342', '20000098', null, '2015-11-17', '30001', null, '4', 'SHSQ20150001805', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000358', '10000343', '20000120', null, '2016-01-18', '30001', null, '3300', '0057486', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000359', '10000344', '20000081', null, '2016-01-20', '30001', null, '461', '0057412', '任意配置', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000360', '10000345', '20000059', null, '2015-12-24', '30001', null, '74', 'SHSQ20150000912', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000361', '10000346', '20000059', null, '2015-12-24', '30001', null, '69', 'SHSQ20150000912', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000362', '10000347', '20000059', null, '2015-12-24', '30001', null, '430', '0055715', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000363', '10000348', '20000059', null, '2015-12-24', '30001', null, '640', '0055715', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000364', '10000349', '20000036', null, '2015-12-14', '30001', null, '700', '0055859', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000365', '10000350', '20000121', null, '2016-01-04', '30001', null, '155', 'SHSQ20150000896', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000366', '10000351', '20000076', null, '2015-12-10', '30001', null, '1202', 'SHSQ20150003530', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000367', '10000352', '20000076', null, '2015-12-10', '30001', null, '1185', 'SHSQ20150003531', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000368', '10000353', '20000087', null, '2015-12-30', '30001', null, '480', 'SHSQ20150002096', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000369', '10000354', '20000047', null, '2016-01-12', '30001', null, '26', '0055872', '任意配置', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000370', '10000355', '20000062', null, '2016-01-11', '30001', null, '53', 'SHSQ20150003549', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000371', '10000356', '20000122', null, '2016-02-01', '30001', null, '10', '0057013', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000372', '10000357', '20000122', null, '2016-02-01', '30001', null, '10', '0057014', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000373', '10000358', '20000122', null, '2016-02-01', '30001', null, '10', '0057015', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000374', '10000359', '20000123', null, '2015-12-09', '30001', null, '15', 'SHSQ20150002088', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000375', '10000360', '20000124', null, '2015-10-26', '30001', null, '9', '0052674', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000376', '10000361', '20000076', null, '2015-12-10', '30001', null, '237', 'SHSQ20150003530', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000377', '10000362', '20000007', null, '2015-01-20', '30001', null, '4', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000378', '10000363', '20000125', null, '2016-01-21', '30001', null, '10000', '0055720', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000379', '10000364', '20000007', null, '2015-11-13', '30001', null, '75', '', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000380', '10000365', '20000022', null, '2015-12-07', '30001', null, '50', 'SHSQ20150000713', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000381', '10000366', '20000022', null, '2015-12-07', '30001', null, '50', 'SHSQ20150000713', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000382', '10000367', '20000052', null, '2015-12-22', '30001', null, '3175', 'SHSQ20150000908 SHSQ20150002380', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000383', '10000368', '20000052', null, '2015-12-22', '30001', null, '2912', 'SHSQ20150000908 SHSQ20150002380', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000384', '10000369', '20000052', null, '2015-12-22', '30001', null, '2505', 'SHSQ20150000908 SHSQ20150002380', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000385', '10000370', '20000052', null, '2015-12-22', '30001', null, '2810', 'SHSQ20150000908 SHSQ20150002380', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000386', '10000371', '20000052', null, '2015-12-22', '30001', null, '2910', 'SHSQ20150000908 SHSQ20150002380', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000387', '10000372', '20000052', null, '2015-12-22', '30001', null, '2720', 'SHSQ20150000908 SHSQ20150002380', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000388', '10000373', '20000052', null, '2015-12-22', '30001', null, '2669', 'SHSQ20150000908 SHSQ20150002380', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000389', '10000374', '20000052', null, '2015-12-22', '30001', null, '12', '0057732,0057733,0057734，0057735,0057736，0057737,0057738', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000390', '10000375', '20000052', null, '2015-12-22', '30001', null, '98', '0057732,0057733,0057734，0057735,0057736，0057737,0057738', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000391', '10000376', '20000052', null, '2015-12-22', '30001', null, '81', '0057732,0057733,0057734，0057735,0057736，0057737,0057738', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000392', '10000377', '20000052', null, '2015-12-22', '30001', null, '9', '0057732,0057733,0057734，0057735,0057736，0057737,0057738', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000393', '10000378', '20000052', null, '2015-12-22', '30001', null, '19', '0057732,0057733,0057734，0057735,0057736，0057737,0057738', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000394', '10000379', '20000052', null, '2015-12-22', '30001', null, '8', '0057732,0057733,0057734，0057735,0057736，0057737,0057738', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000395', '10000380', '20000052', null, '2015-12-22', '30001', null, '700', '0057732,0057733,0057734，0057735,0057736，0057737,0057738', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000396', '10000381', '20000052', null, '2015-12-22', '30001', null, '800', '0057732,0057733,0057734，0057735,0057736，0057737,0057738', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000397', '10000382', '20000052', null, '2015-12-22', '30001', null, '800', '0057732,0057733,0057734，0057735,0057736，0057737,0057738', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000398', '10000383', '20000052', null, '2015-12-22', '30001', null, '800', '0057732,0057733,0057734，0057735,0057736，0057737,0057738', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000399', '10000384', '20000052', null, '2015-12-22', '30001', null, '800', '0057732,0057733,0057734，0057735,0057736，0057737,0057738', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000400', '10000385', '20000052', null, '2015-12-22', '30001', null, '700', '0057732,0057733,0057734，0057735,0057736，0057737,0057738', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000401', '10000386', '20000052', null, '2015-12-22', '30001', null, '800', '0057732,0057733,0057734，0057735,0057736，0057737,0057738', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000402', '10000387', '20000126', null, '2016-01-11', '30001', null, '2880', 'SHSQ20150001996', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000403', '10000388', '20000126', null, '2016-01-11', '30001', null, '480', '0057363', '一元购', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000404', '10000389', '20000079', null, '2016-01-08', '30001', null, '46', '0055855', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000405', '10000390', '20000007', null, '2015-12-14', '30001', null, '400', '', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000406', '10000391', '20000011', null, '2015-12-16', '30001', null, '76', 'SHSQ20150003402', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000407', '10000392', '20000007', null, '2015-04-21', '30001', null, '5', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000408', '10000393', '20000123', null, '2015-12-09', '30001', null, '79', 'SHSQ20150002085', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000409', '10000394', '20000123', null, '2015-12-09', '30001', null, '5', 'SHSQ20150002085', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000410', '10000395', '20000123', null, '2015-12-09', '30001', null, '15', 'SHSQ20150002085', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000411', '10000396', '20000079', null, '2016-01-08', '30001', null, '52', '0055891', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000412', '10000397', '20000110', null, '2016-01-11', '30001', null, '32', 'SHSQ20150003454', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000413', '10000398', '20000127', null, '2016-02-02', '30001', null, '200', 'SHSQ20150003132', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000414', '10000399', '20000128', null, '2015-09-30', '30001', null, '9', '0049140', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000415', '10000400', '20000007', null, '2015-12-25', '30001', null, '1190', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000416', '10000401', '20000129', null, '2016-01-13', '30001', null, '1052', 'SHSQ20150002287', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000417', '10000402', '20000130', null, '2015-12-02', '30001', null, '1000', '0055851', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000418', '10000403', '20000130', null, '2015-12-02', '30001', null, '3397', 'SHSQ20150000653', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000419', '10000404', '20000131', null, '2015-11-04', '30001', null, '440', '0050058', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000420', '10000402', '20000130', null, '2016-01-04', '30003', null, '2000', '0055851', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000421', '10000403', '20000130', null, '2016-01-04', '30003', null, '5488', 'SHSQ20150000653', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000422', '10000405', '20000019', null, '2016-01-28', '30001', null, '93', '0057409', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000423', '10000406', '20000132', null, '2015-08-25', '30001', null, '11598', '0049801', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000424', '10000407', '20000007', null, '2015-03-26', '30003', null, '15', '', '任意配置', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000425', '10000408', '20000055', null, '2015-09-29', '30001', null, '1', '0048710', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000426', '10000409', '20000133', null, '2015-07-15', '30001', null, '6', '0048317', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000427', '10000410', '20000006', null, '2015-11-13', '30001', null, '2', 'SHSQ20150000314', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000428', '10000411', '20000019', null, '2015-12-31', '30001', null, '1034', '0057397', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000429', '10000412', '20000019', null, '2015-12-31', '30001', null, '36', '0057397', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000430', '10000413', '20000019', null, '2015-12-31', '30001', null, '1226', '0057397', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000431', '10000414', '20000019', null, '2015-12-31', '30001', null, '720', '0057397', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000432', '10000415', '20000067', null, '2016-01-11', '30001', null, '450', '0053403', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000433', '10000416', '20000134', null, '2016-01-28', '30001', null, '6800', '0057432', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000434', '10000417', '20000134', null, '2016-01-28', '30001', null, '6800', '0057431', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000435', '10000418', '20000007', null, '2015-07-15', '30001', null, '92', '', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000436', '10000419', '20000007', null, '2015-04-15', '30001', null, '21', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000437', '10000420', '20000127', null, '2016-02-01', '30001', null, '1400', '0057461', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000438', '10000421', '20000127', null, '2016-02-02', '30001', null, '1400', 'SHSQ20150003132', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000439', '10000422', '20000135', null, '2016-02-01', '30001', null, '500', '0057497', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000440', '10000423', '20000055', null, '2015-09-29', '30001', null, '7', '0050299', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000441', '10000424', '20000136', null, '2015-08-25', '30001', null, '508', '0052526', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000442', '10000425', '20000137', null, '2015-07-16', '30001', null, '9', '0048311', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000443', '10000426', '20000007', null, '2015-11-13', '30001', null, '8', '', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000444', '10000427', '20000087', null, '2015-12-30', '30001', null, '300', 'SHSQ20150002096', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000445', '10000428', '20000007', null, '2015-06-22', '30001', null, '1', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000446', '10000429', '20000007', null, '2015-11-12', '30003', null, '100', '', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000447', '10000430', '20000138', null, '2015-12-30', '30001', null, '150', 'SHSQ20150003520', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000448', '10000431', '20000138', null, '2015-12-30', '30001', null, '150', 'SHSQ20150003520', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000449', '10000432', '20000138', null, '2015-12-30', '30001', null, '150', 'SHSQ20150003520', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000450', '10000433', '20000138', null, '2015-12-30', '30001', null, '150', 'SHSQ20150003521', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000451', '10000434', '20000138', null, '2015-12-30', '30001', null, '150', 'SHSQ20150003521', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000452', '10000435', '20000138', null, '2015-12-30', '30001', null, '150', 'SHSQ20150003521', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000453', '10000436', '20000138', null, '2015-12-30', '30001', null, '50', 'SHSQ20150003521', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000454', '10000437', '20000139', null, '2015-10-09', '30001', null, '8', '0052022', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000455', '10000438', '20000140', null, '2015-07-14', '30001', null, '124', '0031467', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000456', '10000439', '20000141', null, '2015-11-23', '30003', null, '10', '0052034', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000457', '10000440', '20000026', null, '2015-11-17', '30001', null, '26', 'SHSQ20150001351', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000458', '10000441', '20000006', null, '2015-11-13', '30001', null, '1', 'SHSQ20150000314', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000459', '10000442', '20000006', null, '2015-11-13', '30001', null, '9', 'SHSQ20150000314', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000460', '10000443', '20000024', null, '2015-12-07', '30001', null, '49', 'SHSQ20150001973', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000461', '10000444', '20000022', null, '2015-12-07', '30001', null, '33', 'SHSQ20150000713', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000462', '10000445', '20000022', null, '2015-12-07', '30001', null, '48', 'SHSQ20150000713', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000463', '10000446', '20000142', null, '2015-11-05', '30001', null, '8', '0055166', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000464', '10000447', '20000142', null, '2015-11-05', '30001', null, '102', '0055166', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000465', '10000448', '20000142', null, '2015-11-05', '30001', null, '215', '0055166', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000466', '10000449', '20000143', null, '2015-06-24', '30001', null, '18', '0053976', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000467', '10000450', '20000144', null, '2015-09-25', '30001', null, '20000', '0050403', '任意配置', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000468', '10000451', '20000111', null, '2015-10-29', '30001', null, '224', '0050480', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000469', '10000452', '20000111', null, '2015-10-29', '30001', null, '72', '0050487', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000470', '10000452', '20000111', null, '2015-10-29', '30003', null, '480', '0050487', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000471', '10000453', '20000069', null, '2015-05-14', '30003', null, '9', '', '任意配置', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000472', '10000454', '20000145', null, '2015-12-16', '30001', null, '180', 'SHSQ20150002401', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000473', '10000455', '20000145', null, '2015-12-16', '30001', null, '2000', '0053509', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000474', '10000456', '20000146', null, '2015-11-13', '30001', null, '436', 'SHSQ20150000102，SHSQ20150003311', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000475', '10000457', '20000098', null, '2015-11-17', '30001', null, '8', 'SHSQ20150001805', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000476', '10000458', '20000147', null, '2015-10-13', '30001', null, '8', '0052656', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000477', '10000459', '20000148', null, '2015-12-11', '30003', null, '199', 'SHSQ20150001208', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000478', '10000460', '20000087', null, '2015-12-30', '30001', null, '40', 'SHSQ20150002096', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000479', '10000461', '20000087', null, '2015-12-30', '30001', null, '105', 'SHSQ20150002096', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000480', '10000462', '20000007', null, '2015-07-02', '30001', null, '33', '', '福利（其他）', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000481', '10000463', '20000149', null, '2015-11-20', '30003', null, '1200', 'SHSQ20150000537', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000482', '10000464', '20000069', null, '2015-05-14', '30003', null, '10', '', '任意配置', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000483', '10000465', '20000019', null, '2016-01-28', '30001', null, '292', '0057410', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000484', '10000466', '20000051', null, '2016-01-28', '30001', null, '100', '0057411', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000485', '10000467', '20000081', null, '2016-01-28', '30001', null, '100', '0057412', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000486', '10000468', '20000019', null, '2016-01-28', '30001', null, '299', '0057413', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000487', '10000469', '20000066', null, '2016-01-05', '30001', null, '53', 'SHSQ20150002962', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000488', '10000470', '20000066', null, '2016-01-05', '30001', null, '18', 'SHSQ20150002960', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000489', '10000471', '20000066', null, '2016-01-05', '30001', null, '335', 'SHSQ20150002960', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000490', '10000472', '20000066', null, '2016-01-05', '30001', null, '93', 'SHSQ20150002961', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000491', '10000473', '20000066', null, '2016-01-05', '30001', null, '167', 'SHSQ20150002961', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000492', '10000474', '20000066', null, '2016-01-05', '30001', null, '33', 'SHSQ20150002961', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000493', '10000475', '20000150', null, '2016-01-13', '30001', null, '25', 'SHSQ20150002394', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000494', '10000476', '20000150', null, '2016-01-13', '30001', null, '25', 'SHSQ20150002394', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000495', '10000477', '20000150', null, '2016-01-13', '30001', null, '25', 'SHSQ20150002394', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000496', '10000478', '20000150', null, '2016-01-13', '30001', null, '25', 'SHSQ20150002394', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000497', '10000479', '20000007', null, '2015-11-13', '30001', null, '15', '', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000498', '10000480', '20000037', null, '2015-09-22', '30001', null, '88', '0052016', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000499', '10000481', '20000037', null, '2015-09-22', '30001', null, '126', '0052018', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000500', '10000482', '20000145', null, '2015-12-15', '30003', null, '8', '0053508', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000501', '10000483', '20000121', null, '2016-01-04', '30001', null, '60', 'SHSQ20150000896', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000502', '10000484', '20000151', null, '2016-01-20', '30001', null, '2000', '0031484', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000503', '10000485', '20000152', null, '2015-10-23', '30001', null, '318', '0052134', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000504', '10000486', '20000007', null, '2015-10-15', '30001', null, '2', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000505', '10000487', '20000007', null, '2015-11-23', '30001', null, '29', '', '任意配置', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000506', '10000488', '20000153', null, '2015-11-03', '30001', null, '23', '0050203', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000507', '10000482', '20000145', null, '2015-12-16', '30001', null, '180', 'SHSQ20150002401', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000508', '10000489', '20000007', null, '2015-05-15', '30003', null, '13', '', '任意配置', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000509', '10000490', '20000154', null, '2015-12-15', '30001', null, '285', 'SHSQ20150001342', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000510', '10000491', '20000155', null, '2016-01-27', '30001', null, '5', 'SHSQ20150001376', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000511', '10000492', '20000154', null, '2015-12-17', '30001', null, '506', 'SHSQ20150001342', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000512', '10000493', '20000028', null, '2015-11-23', '30001', null, '9', '0055545', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000513', '10000494', '20000156', null, '2016-01-06', '30001', null, '100', '0057751', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000514', '10000495', '20000007', null, '2015-10-29', '30003', null, '72', '', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000515', '10000496', '20000026', null, '2015-12-07', '30001', null, '10', 'SHSQ20150001809', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000516', '10000497', '20000142', null, '2015-11-05', '30001', null, '40', '0055183', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000517', '10000498', '20000142', null, '2015-11-05', '30001', null, '102', '0055183', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000518', '10000499', '20000142', null, '2015-11-05', '30001', null, '20', '0055181', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000519', '10000500', '20000142', null, '2015-11-05', '30001', null, '92', '0055181', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000520', '10000501', '20000157', null, '2015-10-29', '30001', null, '1363', '0050922', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000521', '10000502', '20000026', null, '2015-11-17', '30001', null, '61', 'SHSQ20150001351', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000522', '10000503', '20000157', null, '2015-10-29', '30001', null, '200', '0050922', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000523', '10000504', '20000026', null, '2015-12-07', '30001', null, '10', 'SHSQ20150001809', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000524', '10000505', '20000066', null, '2016-01-05', '30001', null, '140', '0055889', '任意配置', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000525', '10000506', '20000142', null, '2015-11-05', '30001', null, '29', '0055182', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000526', '10000507', '20000142', null, '2015-11-05', '30001', null, '12', '0055182', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000527', '10000508', '20000158', null, '2015-11-09', '30001', null, '104', '0050740', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000528', '10000509', '20000007', null, '2015-01-20', '30003', null, '191', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000529', '10000510', '20000064', null, '2016-01-18', '30001', null, '3640', '0057488', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000530', '10000511', '20000159', null, '2016-01-18', '30001', null, '3172', '0057487', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000531', '10000512', '20000160', null, '2016-01-18', '30001', null, '6800', '0057485', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000532', '10000513', '20000160', null, '2016-01-18', '30001', null, '6940', '0057484', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000533', '10000514', '20000036', null, '2015-12-10', '30001', null, '500', '0055862', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000534', '10000515', '20000158', null, '2015-11-10', '30003', null, '1', '0050740', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000535', '10000516', '20000161', null, '2015-10-13', '30001', null, '8', '0051302', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000536', '10000517', '20000162', null, '2015-11-17', '30001', null, '3', 'SHSQ20150001274', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000537', '10000518', '20000003', null, '2015-11-25', '30001', null, '1057', 'SHSQ20150001833，0057352，SHSQ20150001980，SHSQ20150001981，0057406，0057414', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000538', '10000519', '20000003', null, '2015-11-25', '30001', null, '240', '0057302，0057353', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000539', '10000520', '20000163', null, '2015-08-11', '30001', null, '533', '0043681', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000540', '10000521', '20000164', null, '2015-11-10', '30001', null, '200', '0055197', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000541', '10000522', '20000007', null, '2015-10-29', '30003', null, '48', '', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000542', '10000522', '20000007', null, '2016-02-01', '30001', null, '3', '', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000543', '10000523', '20000165', null, '2015-12-03', '30001', null, '5', '0057862', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000544', '10000524', '20000151', null, '2016-01-20', '30001', null, '36', 'SHSQ20150001402', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000545', '10000525', '20000052', null, '2015-12-23', '30001', null, '5', '0057702', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000546', '10000526', '20000052', null, '2015-12-23', '30001', null, '1160', 'SHSQ20150000910 SHSQ20150000911', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000547', '10000527', '20000052', null, '2015-12-23', '30001', null, '14', '0057702', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000548', '10000528', '20000026', null, '2015-11-17', '30001', null, '1', 'SHSQ20150001351', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000549', '10000529', '20000026', null, '2015-11-17', '30001', null, '35', 'SHSQ20150001351', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000550', '10000530', '20000162', null, '2015-11-17', '30001', null, '12', 'SHSQ20150001274', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000551', '10000531', '20000024', null, '2015-12-07', '30001', null, '58', 'SHSQ20150000106', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000552', '10000532', '20000166', null, '2016-01-13', '30001', null, '187', 'SHSQ20150003301', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000553', '10000533', '20000166', null, '2016-01-13', '30001', null, '187', 'SHSQ20150003301', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000554', '10000534', '20000166', null, '2016-01-28', '30001', null, '24', '0057407', '一元购', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000555', '10000535', '20000166', null, '2016-01-28', '30001', null, '24', '0057407', '一元购', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000556', '10000536', '20000167', null, '2015-12-04', '30001', null, '3798', 'SHSQ20150002086', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000557', '10000537', '20000167', null, '2015-12-25', '30001', null, '30', '0055711', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000558', '10000538', '20000168', null, '2015-10-29', '30003', null, '39', 'SHSQ20150000303', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000559', '10000539', '20000169', null, '2015-09-10', '30001', null, '1', '0030724', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000560', '10000540', '20000111', null, '2015-11-12', '30003', null, '54', '', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000561', '10000541', '20000007', null, '2015-03-14', '30003', null, '5', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000562', '10000542', '20000111', null, '2015-11-12', '30003', null, '50', '', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000563', '10000543', '20000007', null, '2015-03-12', '30001', null, '64', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000564', '10000543', '20000007', null, '2015-01-20', '30003', null, '110', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000565', '10000544', '20000007', null, '2015-03-12', '30001', null, '6', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000566', '10000545', '20000007', null, '2015-10-15', '30001', null, '6', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000567', '10000521', '20000164', null, '2015-11-10', '30003', null, '5', '0050920', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000568', '10000546', '20000101', null, '2015-12-25', '30001', null, '672', 'SHSQ20150001670', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000569', '10000547', '20000010', null, '2015-11-12', '30001', null, '396', 'SHSQ20150001356', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000570', '10000548', '20000170', null, '2015-11-13', '30001', null, '294', 'SHSQ20150000313', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000571', '10000548', '20000170', null, '2015-11-13', '30003', null, '100', '', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000572', '10000549', '20000171', null, '2015-12-29', '30001', null, '48', 'SHSQ20150002603', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000573', '10000550', '20000171', null, '2015-12-29', '30001', null, '24', 'SHSQ20150002603', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000574', '10000551', '20000077', null, '2015-12-29', '30001', null, '19', '0053702', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000575', '10000552', '20000007', null, '2015-04-27', '30001', null, '7', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000576', '10000553', '20000158', null, '2015-11-06', '30003', null, '176', 'SHSQ20150000536', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000577', '10000554', '20000158', null, '2015-11-06', '30003', null, '147', 'SHSQ20150000536', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000578', '10000555', '20000158', null, '2015-11-06', '30003', null, '132', 'SHSQ20150000536', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000579', '10000553', '20000158', null, '2015-11-06', '30001', null, '70', 'SHSQ20150000536', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000580', '10000554', '20000158', null, '2015-11-06', '30001', null, '40', 'SHSQ20150000536', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000581', '10000555', '20000158', null, '2015-11-06', '30001', null, '52', 'SHSQ20150000536', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000582', '10000556', '20000007', null, '2015-03-10', '30003', null, '55', '', '任意配置', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000583', '10000557', '20000172', null, '2015-09-18', '30001', null, '164', '0052608', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000584', '10000558', '20000172', null, '2015-10-15', '30001', null, '69', '0052601', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000585', '10000559', '20000052', null, '2015-12-23', '30001', null, '166', '0057702', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000586', '10000560', '20000052', null, '2015-12-23', '30001', null, '1310', 'SHSQ20150000910 SHSQ20150000911', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000587', '10000561', '20000052', null, '2015-12-23', '30001', null, '33', '0057702', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000588', '10000562', '20000052', null, '2015-12-23', '30001', null, '166', '0057702', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000589', '10000563', '20000052', null, '2015-12-23', '30001', null, '1310', 'SHSQ20150000910 SHSQ20150000911', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000590', '10000564', '20000052', null, '2015-12-23', '30001', null, '24', '0057702', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000591', '10000565', '20000007', null, '2015-12-07', '30001', null, '4', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000592', '10000566', '20000052', null, '2015-12-23', '30001', null, '161', '0057702', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000593', '10000567', '20000052', null, '2015-12-23', '30001', null, '1310', 'SHSQ20150000910 SHSQ20150000911', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000594', '10000568', '20000052', null, '2015-12-23', '30001', null, '24', '0057702', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000595', '10000569', '20000052', null, '2015-12-23', '30001', null, '23', '0057702', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000596', '10000570', '20000052', null, '2015-12-23', '30001', null, '1158', 'SHSQ20150000910 SHSQ20150000911', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000597', '10000571', '20000052', null, '2015-12-23', '30001', null, '29', '0057702', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000598', '10000572', '20000007', null, '2015-10-15', '30001', null, '6', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000599', '10000573', '20000151', null, '2016-01-20', '30001', null, '150', 'SHSQ20150001402', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000600', '10000574', '20000173', null, '2015-09-21', '30001', null, '76', '0031479', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000601', '10000575', '20000007', null, '2015-05-27', '30001', null, '7', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000602', '10000576', '20000170', null, '2015-11-13', '30001', null, '331', 'SHSQ20150000313', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000603', '10000576', '20000170', null, '2015-11-13', '30003', null, '70', 'SHSQ20150000313', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000604', '10000577', '20000007', null, '2015-05-27', '30001', null, '1', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000605', '10000578', '20000007', null, '2015-03-23', '30005', null, '17', '', '任意配置', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000606', '10000579', '20000021', null, '2015-09-18', '30001', null, '500', '0051569', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000607', '10000580', '20000174', null, '2015-08-07', '30001', null, '8', '0054058', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000608', '10000581', '20000175', null, '2015-11-09', '30001', null, '270', '0049162', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000609', '10000582', '20000176', null, '2016-01-27', '30003', null, '14', '0057782', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000610', '10000583', '20000007', null, '2015-10-15', '30003', null, '40', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000611', '10000584', '20000158', null, '2015-09-03', '30003', null, '11', '0038305', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000612', '10000585', '20000007', null, '2015-05-07', '30001', null, '12', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000613', '10000586', '20000007', null, '2015-05-07', '30001', null, '22', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000614', '10000587', '20000152', null, '2015-10-23', '30001', null, '1852', '0052134', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000615', '10000588', '20000152', null, '2015-10-23', '30001', null, '320', '0052134', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000616', '10000589', '20000007', null, '2015-10-15', '30001', null, '4', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000617', '10000590', '20000177', null, '2015-08-18', '30001', null, '156', '0053154，0049931', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000618', '10000591', '20000178', null, '2015-12-17', '30001', null, '8', 'SHSQ20150001732', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000619', '10000592', '20000179', null, '2015-09-10', '30001', null, '21', '0046233', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000620', '10000593', '20000180', null, '2015-08-24', '30001', null, '25000', '0054152', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000621', '10000594', '20000111', null, '2015-11-12', '30003', null, '53', 'SHSQ20150000512', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000622', '10000595', '20000111', null, '2015-11-12', '30003', null, '57', 'SHSQ20150000512', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000623', '10000596', '20000066', null, '2016-01-05', '30001', null, '73', 'SHSQ20150002957', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000624', '10000597', '20000167', null, '2015-12-14', '30001', null, '128', 'SHSQ20150002086', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000625', '10000598', '20000007', null, '2015-10-15', '30001', null, '3', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000626', '10000599', '20000167', null, '2015-12-04', '30001', null, '69', 'SHSQ20150001681', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000627', '10000600', '20000167', null, '2015-12-04', '30001', null, '312', 'SHSQ20150002086', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000628', '10000601', '20000167', null, '2015-12-25', '30001', null, '32', '0055710', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000629', '10000602', '20000115', null, '2015-12-22', '30003', null, '50', 'SHSQ20150000540', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000630', '10000603', '20000115', null, '2015-12-22', '30003', null, '50', 'SHSQ20150000540', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000631', '10000604', '20000181', null, '2015-11-26', '30001', null, '44', 'SHSQ20150002124，SHSQ20150002128', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000632', '10000605', '20000181', null, '2015-11-26', '30001', null, '51', 'SHSQ20150002124，SHSQ20150002128', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000633', '10000606', '20000182', null, '2015-08-17', '30001', null, '205', '0030864', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000634', '10000607', '20000178', null, '2015-12-17', '30001', null, '28', 'SHSQ20150001734', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000635', '10000608', '20000170', null, '2015-11-13', '30001', null, '118', 'SHSQ20150000313', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000636', '10000609', '20000006', null, '2015-11-13', '30001', null, '12', 'SHSQ20150000314', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000637', '10000610', '20000183', null, '2015-08-13', '30001', null, '6', '0048341', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000638', '10000611', '20000007', null, '2015-06-15', '30003', null, '49', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000639', '10000612', '20000184', null, '2015-10-15', '30001', null, '821', '0050634', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000640', '10000613', '20000184', null, '2015-10-15', '30001', null, '26', '0050632', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000641', '10000613', '20000184', null, '2015-10-15', '30003', null, '382', '0050632', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000642', '10000614', '20000007', null, '2015-06-16', '30001', null, '67', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000643', '10000615', '20000063', null, '2015-08-31', '30001', null, '8', '0052383', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000644', '10000616', '20000063', null, '2015-08-31', '30001', null, '8', '0052383', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000645', '10000617', '20000063', null, '2015-08-31', '30001', null, '15', '0052383', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000646', '10000618', '20000063', null, '2015-08-31', '30003', null, '35', '0052383', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000647', '10000619', '20000063', null, '2015-08-31', '30001', null, '220', '0052383', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000648', '10000620', '20000063', null, '2015-08-31', '30001', null, '59', '0052383', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000649', '10000621', '20000185', null, '2015-07-29', '30001', null, '20', '0044429', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000650', '10000622', '20000028', null, '2015-11-19', '30001', null, '1381', 'SHSQ20150002071', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000651', '10000623', '20000063', null, '2015-08-31', '30001', null, '9', '0052383', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000652', '10000624', '20000061', null, '2015-11-24', '30001', null, '54', 'SHSQ20150001815', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000653', '10000625', '20000061', null, '2015-11-24', '30001', null, '61', 'SHSQ20150001815', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000654', '10000626', '20000061', null, '2015-11-24', '30001', null, '78', 'SHSQ20150001815', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000655', '10000627', '20000061', null, '2015-11-24', '30001', null, '71', 'SHSQ20150001815', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000656', '10000628', '20000061', null, '2015-11-24', '30001', null, '55', 'SHSQ20150001815', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000657', '10000629', '20000061', null, '2015-11-24', '30001', null, '40', 'SHSQ20150001815', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000658', '10000630', '20000061', null, '2015-11-24', '30001', null, '53', 'SHSQ20150001815', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000659', '10000631', '20000007', null, '2015-01-20', '30003', null, '29', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000660', '10000632', '20000173', null, '2015-09-21', '30001', null, '32', '0031481', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000661', '10000633', '20000184', null, '2015-10-15', '30001', null, '239', 'SHSQ20150000413', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000662', '10000634', '20000007', null, '2015-10-20', '30003', null, '224', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000663', '10000635', '20000007', null, '2015-10-20', '30003', null, '550', '', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000664', '10000636', '20000186', null, '2015-09-23', '30001', null, '11', '0052936', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000665', '10000637', '20000187', null, '2015-11-04', '30001', null, '8', '0052865', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000666', '10000638', '20000187', null, '2015-11-12', '30001', null, '42', '0052898', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000667', '10000639', '20000007', null, '2015-10-20', '30001', null, '5', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000668', '10000640', '20000188', null, '2016-01-18', '30001', null, '48', 'SHSQ20150003323', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000669', '10000641', '20000188', null, '2016-01-18', '30001', null, '48', 'SHSQ20150003322', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000670', '10000642', '20000007', null, '2015-08-18', '30001', null, '1', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000671', '10000643', '20000188', null, '2016-01-18', '30001', null, '48', 'SHSQ20150003322', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000672', '10000644', '20000178', null, '2015-12-17', '30001', null, '44', 'SHSQ20150001732', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000673', '10000645', '20000180', null, '2015-08-24', '30001', null, '19093', '0054152', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000674', '10000646', '20000007', null, '2015-08-17', '30003', null, '1', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000675', '10000647', '20000189', null, '2015-12-08', '30001', null, '132', 'SHSQ20150001079', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000676', '10000648', '20000178', null, '2015-12-17', '30001', null, '104', 'SHSQ20150001733', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000677', '10000649', '20000190', null, '2015-12-07', '30001', null, '1', '0050870', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000678', '10000650', '20000188', null, '2016-01-18', '30001', null, '72', 'SHSQ20150003322', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000679', '10000651', '20000007', null, '2015-10-20', '30003', null, '75', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000680', '10000652', '20000188', null, '2016-01-18', '30001', null, '72', 'SHSQ20150003323', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000681', '10000653', '20000188', null, '2016-01-18', '30001', null, '72', 'SHSQ20150003322', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000682', '10000654', '20000188', null, '2016-01-18', '30001', null, '72', 'SHSQ20150003322', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000683', '10000655', '20000188', null, '2016-01-18', '30001', null, '48', 'SHSQ20150003322', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000684', '10000656', '20000188', null, '2016-01-18', '30001', null, '48', 'SHSQ20150003323', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000685', '10000657', '20000188', null, '2016-01-18', '30001', null, '48', 'SHSQ20150003322', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000686', '10000658', '20000188', null, '2016-01-18', '30001', null, '48', 'SHSQ20150003322', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000687', '10000659', '20000188', null, '2016-01-18', '30001', null, '48', 'SHSQ20150003322', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000688', '10000660', '20000007', null, '2015-04-21', '30001', null, '6', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000689', '10000661', '20000115', null, '2015-12-22', '30001', null, '86', '0050864', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000690', '10000662', '20000170', null, '2015-11-13', '30001', null, '116', 'SHSQ20150000313', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000691', '10000663', '20000191', null, '2015-12-14', '30001', null, '1404', 'SHSQ20150002087', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000692', '10000664', '20000007', null, '2015-10-20', '30003', null, '3', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000693', '10000665', '20000189', null, '2015-12-08', '30001', null, '352', 'SHSQ20150001079', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000694', '10000666', '20000007', null, '2015-10-20', '30003', null, '600', '', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000695', '10000667', '20000016', null, '2015-10-10', '30001', null, '7812', 'SHSQ20150000308', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000696', '10000668', '20000061', null, '2015-12-08', '30001', null, '120', 'SHSQ20150001952', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000697', '10000669', '20000061', null, '2015-12-08', '30001', null, '120', 'SHSQ20150001952', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000698', '10000670', '20000188', null, '2016-01-18', '30001', null, '48', 'SHSQ20150003323', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000699', '10000671', '20000192', null, '2015-10-15', '30003', null, '21', '0052021', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000700', '10000672', '20000188', null, '2016-01-18', '30001', null, '72', 'SHSQ20150003323', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000701', '10000673', '20000167', null, '2015-12-04', '30001', null, '320', 'SHSQ20150001681', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000702', '10000674', '20000167', null, '2015-12-14', '30001', null, '6240', 'SHSQ20150001681', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000703', '10000675', '20000193', null, '2015-11-09', '30001', null, '1', '0052033', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000704', '10000676', '20000036', null, '2016-01-27', '30001', null, '189', '0055890', '任意配置', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000705', '10000677', '20000007', null, '2015-07-23', '30003', null, '30', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000706', '10000678', '20000194', null, '2015-11-12', '30001', null, '90', '0057201', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000707', '10000679', '20000007', null, '2015-10-22', '30001', null, '497', '', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000708', '10000680', '20000007', null, '2015-10-22', '30001', null, '3', '', '任意配置', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000709', '10000679', '20000007', null, '2015-10-22', '30003', null, '380', '', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000710', '10000681', '20000003', null, '2015-11-25', '30001', null, '4', 'SHSQ20150001833，SHSQ20150001980，SHSQ20150001981', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000711', '10000682', '20000003', null, '2015-11-25', '30001', null, '4', 'SHSQ20150001833，SHSQ20150001980，SHSQ20150001981', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000712', '10000683', '20000003', null, '2015-11-25', '30001', null, '4', 'SHSQ20150001833，SHSQ20150001980，SHSQ20150001981', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000713', '10000684', '20000003', null, '2015-11-25', '30001', null, '3', 'SHSQ20150001833，SHSQ20150001980，SHSQ20150001981', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000714', '10000685', '20000003', null, '2015-11-25', '30001', null, '3', 'SHSQ20150001833，SHSQ20150001980，SHSQ20150001981', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000715', '10000686', '20000003', null, '2015-11-25', '30001', null, '4', 'SHSQ20150001833，SHSQ20150001980，SHSQ20150001981', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000716', '10000687', '20000003', null, '2015-11-25', '30001', null, '4', 'SHSQ20150001833，SHSQ20150001980，SHSQ20150001981', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000717', '10000688', '20000003', null, '2015-11-25', '30001', null, '2', 'SHSQ20150001833，SHSQ20150001980，SHSQ20150001981', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000718', '10000689', '20000007', null, '2015-12-10', '30003', null, '12106', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000719', '10000690', '20000007', null, '2015-05-27', '30001', null, '103', '', '任意配置', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000720', '10000691', '20000007', null, '2015-06-22', '30003', null, '57', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000721', '10000692', '20000007', null, '2015-06-22', '30003', null, '489', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000722', '10000693', '20000195', null, '2015-12-03', '30001', null, '356', 'SHSQ20150001972', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000723', '10000694', '20000196', null, '2015-09-21', '30001', null, '28', '0052902', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000724', '10000695', '20000195', null, '2015-12-03', '30001', null, '69', 'SHSQ20150001972', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000725', '10000696', '20000195', null, '2015-12-03', '30001', null, '48', 'SHSQ20150001972，0057361', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000726', '10000697', '20000195', null, '2015-12-03', '30001', null, '56', 'SHSQ20150001972', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000727', '10000698', '20000195', null, '2015-12-14', '30001', null, '112', '0057305', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000728', '10000699', '20000195', null, '2015-12-14', '30001', null, '128', '0057361', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000729', '10000700', '20000195', null, '2015-12-14', '30001', null, '32', '0057305', '一元购', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000730', '10000701', '20000195', null, '2015-12-14', '30001', null, '32', '0057361', '一元购', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000731', '10000702', '20000197', null, '2015-12-15', '30001', null, '30', 'SHSQ20150001998', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000732', '10000703', '20000197', null, '2015-12-15', '30001', null, '30', '0057304', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000733', '10000704', '20000198', null, '2015-11-27', '30001', null, '114', 'SHSQ20150002404', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000734', '10000705', '20000198', null, '2015-11-27', '30001', null, '2370', '0049788', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000735', '10000706', '20000199', null, '2016-01-06', '30001', null, '2571', '0057460', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000736', '10000707', '20000199', null, '2016-01-06', '30001', null, '6512', '0057460', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000737', '10000708', '20000199', null, '2016-01-06', '30001', null, '1520', '0057460', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000738', '10000709', '20000199', null, '2016-01-06', '30001', null, '2807', '0057460', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000739', '10000710', '20000200', null, '2016-01-06', '30001', null, '12570', '0057463', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000740', '10000711', '20000200', null, '2016-01-06', '30001', null, '2070', '0057463', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000741', '10000712', '20000007', null, '2015-01-20', '30002', null, '4', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000742', '10000713', '20000053', null, '2015-12-25', '30001', null, '45', 'SHSQ20150000933', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000743', '10000714', '20000007', null, '2015-01-20', '30002', null, '1', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000744', '10000715', '20000201', null, '2015-11-18', '30001', null, '30', 'SHSQ20150000532', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000745', '10000716', '20000053', null, '2015-12-25', '30001', null, '57', 'SHSQ20150000933', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000746', '10000717', '20000202', null, '2016-01-18', '30001', null, '48', '0057384', '一元购', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000747', '10000718', '20000201', null, '2015-11-18', '30001', null, '30', 'SHSQ20150000532', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000748', '10000719', '20000202', null, '2016-01-18', '30001', null, '30', 'SHSQ20150003315', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000749', '10000720', '20000202', null, '2016-01-18', '30001', null, '60', 'SHSQ20150003315', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000750', '10000721', '20000202', null, '2016-01-18', '30001', null, '60', 'SHSQ20150003315', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000751', '10000722', '20000007', null, '2015-03-12', '30001', null, '3', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000752', '10000723', '20000203', null, '2015-07-13', '30001', null, '490', '0047647', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000753', '10000724', '20000203', null, '2015-07-09', '30001', null, '450', '0047645', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000754', '10000725', '20000204', null, '2015-07-14', '30001', null, '31', '0048538', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000755', '10000726', '20000205', null, '2015-08-20', '30001', null, '3672', '0053888', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000756', '10000727', '20000206', null, '2015-09-02', '30001', null, '30', '0053931', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000757', '10000728', '20000207', null, '2015-08-26', '30001', null, '2', '0054725', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000758', '10000729', '20000007', null, '2015-08-26', '30003', null, '993', '', '福利（其他）', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000759', '10000730', '20000208', null, '2015-08-11', '30001', null, '19', '0046003', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000760', '10000731', '20000007', null, '2015-08-01', '30003', null, '4986', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000761', '10000732', '20000209', null, '2015-07-30', '30001', null, '8', '0051870', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000762', '10000733', '20000210', null, '2015-07-29', '30001', null, '66', '0053982', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000763', '10000734', '20000211', null, '2015-07-14', '30001', null, '73', '0048029', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000764', '10000735', '20000212', null, '2015-07-10', '30001', null, '34', '0038783', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000765', '10000736', '20000212', null, '2015-07-10', '30001', null, '284', '0038783', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000766', '10000737', '20000007', null, '2015-06-19', '30001', null, '2056', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000767', '10000738', '20000007', null, '2015-06-09', '30001', null, '100', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000768', '10000739', '20000007', null, '2015-07-30', '30001', null, '7', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000769', '10000740', '20000007', null, '2015-06-08', '30003', null, '21', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000770', '10000741', '20000007', null, '2015-05-29', '30003', null, '7049', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000771', '10000742', '20000007', null, '2015-05-29', '30003', null, '9738', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000772', '10000743', '20000007', null, '2015-05-29', '30003', null, '10', '', '任意配置', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000773', '10000744', '20000007', null, '2015-05-29', '30003', null, '49', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000774', '10000745', '20000007', null, '2015-05-27', '30001', null, '4800', '', '福利（其他）', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000775', '10000746', '20000007', null, '2015-05-27', '30001', null, '1200', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000776', '10000742', '20000007', null, '2015-05-27', '30001', null, '1590', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000777', '10000741', '20000007', null, '2015-05-27', '30001', null, '40', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000778', '10000747', '20000007', null, '2015-05-27', '30001', null, '13', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000779', '10000748', '20000007', null, '2015-05-27', '30001', null, '1', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000780', '10000749', '20000007', null, '2015-05-27', '30001', null, '3', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000781', '10000750', '20000007', null, '2015-05-24', '30001', null, '7', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000782', '10000751', '20000007', null, '2015-05-24', '30001', null, '2', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000783', '10000752', '20000007', null, '2015-05-21', '30001', null, '120', '', '福利（其他）', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000784', '10000753', '20000007', null, '2015-04-10', '30001', null, '5', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000785', '10000754', '20000007', null, '2015-04-10', '30001', null, '9', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000786', '10000755', '20000007', null, '2015-03-31', '30001', null, '3', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000787', '10000756', '20000007', null, '2015-03-31', '30001', null, '3', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000788', '10000757', '20000007', null, '2015-03-27', '30001', null, '4', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000789', '10000758', '20000007', null, '2015-03-27', '30001', null, '2', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000790', '10000759', '20000007', null, '2015-03-27', '30001', null, '1', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000791', '10000760', '20000007', null, '2015-03-25', '30001', null, '35', '', '任意配置', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000792', '10000761', '20000213', null, '2015-03-18', '30002', null, '3', '0046033  0054850', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000793', '10000762', '20000007', null, '2015-03-18', '30001', null, '54', '', '福利（其他）', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000794', '10000763', '20000007', null, '2015-03-17', '30001', null, '33', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000795', '10000764', '20000007', null, '2015-02-11', '30001', null, '41', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000796', '10000765', '20000007', null, '2015-02-01', '30001', null, '140', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000797', '10000766', '20000007', null, '2015-01-20', '30003', null, '16', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000798', '10000767', '20000007', null, '2015-01-20', '30003', null, '64', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000799', '10000768', '20000007', null, '2015-01-20', '30002', null, '2', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000800', '10000769', '20000007', null, '2015-01-20', '30002', null, '5', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000801', '10000770', '20000007', null, '2015-01-20', '30002', null, '2', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000802', '10000771', '20000007', null, '2015-01-20', '30002', null, '1', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000803', '10000772', '20000007', null, '2015-01-20', '30002', null, '2', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000804', '10000773', '20000007', null, '2015-01-20', '30002', null, '9', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000805', '10000774', '20000007', null, '2015-01-20', '30002', null, '6', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000806', '10000775', '20000007', null, '2015-01-20', '30006', null, '1', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000807', '10000776', '20000007', null, '2015-01-20', '30004', null, '6', '限上海使用', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000808', '10000777', '20000007', null, '2015-01-20', '30004', null, '10', '限上海使用', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000809', '10000778', '20000007', null, '2015-01-20', '30004', null, '5', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000810', '10000779', '20000007', null, '2015-01-20', '30007', null, '1', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000811', '10000780', '20000007', null, '2015-01-20', '30007', null, '1', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000812', '10000781', '20000007', null, '2015-01-20', '30007', null, '1', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000813', '10000782', '20000007', null, '2015-01-20', '30007', null, '4', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000814', '10000783', '20000007', null, '2015-01-20', '30007', null, '4', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000815', '10000784', '20000007', null, '2015-01-20', '30001', null, '2', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000816', '10000785', '20000007', null, '2015-01-20', '30001', null, '2', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000817', '10000786', '20000214', null, '2015-09-07', '30001', null, '86', '0052082', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000818', '10000787', '20000114', null, '2015-09-18', '30001', null, '44', '0052931', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000819', '10000788', '20000201', null, '2015-09-23', '30001', null, '30', '0052002，0031482', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000820', '10000789', '20000215', null, '2015-09-30', '30001', null, '3', '0032957', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000821', '10000790', '20000007', null, '2015-09-30', '30001', null, '12', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000822', '10000791', '20000216', null, '2015-09-30', '30001', null, '8', '0049578', '任意配置', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000823', '10000792', '20000206', null, '2015-09-07', '30001', null, '250', '0043682', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000824', '10000793', '20000217', null, '2015-08-27', '30001', null, '4000', '0038773', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000825', '10000794', '20000218', null, '2015-08-26', '30001', null, '3500', '0048522', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000826', '10000795', '20000219', null, '2015-08-26', '30001', null, '6263', '0052277', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000827', '10000796', '20000220', null, '2015-08-25', '30001', null, '3000', '0051155', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000828', '10000797', '20000221', null, '2015-08-20', '30001', null, '1690', '0051112', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000829', '10000798', '20000222', null, '2015-08-20', '30001', null, '1150', '0053898', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000830', '10000799', '20000223', null, '2015-08-13', '30001', null, '544', '0051109', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000831', '10000800', '20000224', null, '2015-08-13', '30001', null, '650', '0054258', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000832', '10000801', '20000225', null, '2015-08-11', '30001', null, '360', '0047094', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000833', '10000802', '20000226', null, '2015-08-11', '30001', null, '1646', '0035642', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000834', '10000803', '20000227', null, '2015-08-11', '30001', null, '5105', '0048346', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000835', '10000804', '20000228', null, '2015-08-11', '30001', null, '474', '0051723', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000836', '10000805', '20000229', null, '2015-08-10', '30001', null, '5000', '0054129，0053813', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000837', '10000806', '20000230', null, '2015-08-10', '30001', null, '90', '0051281', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000838', '10000807', '20000231', null, '2015-08-10', '30001', null, '173', '0051523', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000839', '10000808', '20000232', null, '2015-08-06', '30001', null, '1119', '0048208', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000840', '10000809', '20000233', null, '2015-08-05', '30001', null, '2306', '0054157', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000841', '10000810', '20000234', null, '2015-08-03', '30001', null, '2017', '0054355', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000842', '10000811', '20000235', null, '2015-07-30', '30001', null, '187', '0049703', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000843', '10000812', '20000236', null, '2015-07-30', '30001', null, '535', '0054170', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000844', '10000813', '20000237', null, '2015-07-30', '30001', null, '1657', '0030552', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000845', '10000814', '20000238', null, '2015-07-29', '30001', null, '26', '0048322', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000846', '10000815', '20000239', null, '2015-07-28', '30001', null, '4878', '0045720', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000847', '10000816', '20000240', null, '2015-07-22', '30001', null, '13772', '0046377', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000848', '10000817', '20000227', null, '2015-07-21', '30001', null, '8498', '0048316', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000849', '10000818', '20000241', null, '2015-07-21', '30001', null, '9000', '0048541', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000850', '10000819', '20000242', null, '2015-07-20', '30001', null, '833', '0048361', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000851', '10000820', '20000243', null, '2015-07-17', '30001', null, '7', '0046187', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000852', '10000821', '20000007', null, '2015-07-14', '30001', null, '35', '0054083', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000853', '10000822', '20000244', null, '2015-07-13', '30001', null, '1800', '0045510', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000854', '10000823', '20000245', null, '2015-07-09', '30001', null, '3851', '0046902', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000855', '10000824', '20000246', null, '2015-06-30', '30001', null, '1192', '0038655', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000856', '10000825', '20000007', null, '2015-06-26', '30001', null, '58', '0047222', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000857', '10000826', '20000007', null, '2015-06-09', '30001', null, '3072', '0046343、0047224', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000858', '10000827', '20000247', null, '2015-09-09', '30001', null, '295', '0052198', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000859', '10000828', '20000248', null, '2015-09-14', '30001', null, '1257', '0054603', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000860', '10000829', '20000249', null, '2015-09-14', '30001', null, '1423', '0053042', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000861', '10000830', '20000250', null, '2015-09-18', '30001', null, '3000', '0051188', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000862', '10000831', '20000251', null, '2015-09-21', '30001', null, '53', '0053184', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000863', '10000832', '20000252', null, '2015-07-17', '30001', null, '1', '0038677', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000864', '10000833', '20000253', null, '2015-09-29', '30001', null, '4', '0052053', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000865', '10000834', '20000254', null, '2015-09-21', '30001', null, '8', '0031469', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000866', '10000835', '20000255', null, '2015-10-16', '30001', null, '10', '0049257，0049298', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000867', '10000836', '20000256', null, '2015-10-19', '30001', null, '8', '0050739', '任意配置', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000868', '10000837', '20000256', null, '2015-10-19', '30001', null, '31', '0050737', '任意配置', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000869', '10000838', '20000256', null, '2015-10-19', '30001', null, '43', '0050736', '任意配置', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000870', '10000839', '20000257', null, '2015-10-21', '30001', null, '20', '0048762', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000871', '10000840', '20000258', null, '2015-10-21', '30001', null, '30', '0048349', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000872', '10000841', '20000259', null, '2015-10-22', '30001', null, '1000', '0050459', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000873', '10000842', '20000260', null, '2015-10-27', '30001', null, '712', '0049580', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000874', '10000843', '20000018', null, '2015-10-26', '30001', null, '100', '0052730', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000875', '10000844', '20000261', null, '2015-10-27', '30001', null, '67', '0050535', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000876', '10000845', '20000261', null, '2015-10-27', '30001', null, '67', '0050535', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000877', '10000846', '20000261', null, '2015-10-27', '30001', null, '622', '0050526', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000878', '10000847', '20000262', null, '2015-10-28', '30001', null, '120', '0052448', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000879', '10000848', '20000263', null, '2015-11-05', '30003', null, '144', 'SHSQ20150000553', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000880', '10000849', '20000263', null, '2015-11-05', '30003', null, '108', 'SHSQ20150000553', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000881', '10000850', '20000263', null, '2015-11-05', '30003', null, '114', 'SHSQ20150000553', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000882', '10000851', '20000263', null, '2015-11-05', '30003', null, '114', 'SHSQ20150000554', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000883', '10000852', '20000263', null, '2015-11-05', '30003', null, '276', 'SHSQ20150000554', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000884', '10000853', '20000263', null, '2015-11-05', '30003', null, '288', 'SHSQ20150000554', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000885', '10000854', '20000264', null, '2015-09-22', '30001', null, '7', '0051118', '任意配置', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000886', '10000855', '20000265', null, '2015-11-09', '30001', null, '10', '0048570', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000887', '10000856', '20000007', null, '2015-05-27', '30001', null, '54', '', '任意配置', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000888', '10000857', '20000043', null, '2015-11-11', '30001', null, '40', '0048350', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000889', '10000858', '20000264', null, '2015-09-22', '30001', null, '28', '0051118', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000890', '10000846', '20000261', null, '2015-10-27', '30003', null, '382', '0050526', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000891', '10000859', '20000266', null, '2015-11-19', '30001', null, '780', '0049651', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000892', '10000860', '20000267', null, '2015-11-24', '30001', null, '175', 'SHSQ20150001911', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000893', '10000848', '20000263', null, '2015-11-05', '30001', null, '36', 'SHSQ20150000553', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000894', '10000849', '20000263', null, '2015-11-05', '30001', null, '34', 'SHSQ20150000553', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000895', '10000850', '20000263', null, '2015-11-05', '30001', null, '66', 'SHSQ20150000553', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000896', '10000851', '20000263', null, '2015-11-05', '30001', null, '60', 'SHSQ20150000554', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000897', '10000852', '20000263', null, '2015-11-05', '30001', null, '108', 'SHSQ20150000554', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000898', '10000853', '20000263', null, '2015-11-05', '30001', null, '120', 'SHSQ20150000554', '社区特卖', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000899', '10000861', '20000007', null, '2015-01-20', '30001', null, '255', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000900', '10000862', '20000268', null, '2016-01-18', '30001', null, '297', '0057464', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000901', '10000863', '20000269', null, '2016-01-26', '30001', null, '100', '0053703', '任意配置', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000902', '10000864', '20000007', null, '2015-05-22', '30001', null, '7', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000903', '10000865', '20000007', null, '2015-01-20', '30001', null, '6', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000904', '10000866', '20000007', null, '2015-01-20', '30001', null, '1', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000905', '10000867', '20000270', null, '2016-01-28', '30001', null, '1000', '0052123', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000906', '10000868', '20000270', null, '2016-01-28', '30001', null, '1000', '0052123', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000907', '10000869', '20000271', null, '2015-06-23', '30001', null, '362', '0045411', '福利（其他）', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000908', '10000870', '20000007', null, '2015-03-01', '30001', null, '2', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000909', '10000871', '20000007', null, '2015-05-27', '30001', null, '18', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000910', '10000872', '20000272', null, '2015-08-24', '30001', null, '613', '0053884', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000911', '10000873', '20000273', null, '2015-07-23', '30001', null, '310', '0048502', '物业礼包', '正常入库', 'ok', '', '梁吉', null, '1');
INSERT INTO `rk_detail` VALUES ('70000912', '10000874', '20000007', null, '2015-05-21', '30001', null, '3', '', '福利', '正常入库', 'ok', '', '梁吉', null, '1');

-- ----------------------------
-- Table structure for sh_info
-- ----------------------------
DROP TABLE IF EXISTS `sh_info`;
CREATE TABLE `sh_info` (
  `sh_id` int(8) NOT NULL AUTO_INCREMENT,
  `sh_name` varchar(70) NOT NULL,
  `sh_add` varchar(50) DEFAULT NULL,
  `linkman` varchar(5) DEFAULT NULL,
  `link_tel1` varchar(15) DEFAULT NULL,
  `link_tel2` varchar(15) DEFAULT NULL,
  `state` enum('no','yesno','yesok') DEFAULT 'no',
  `auditTime` datetime DEFAULT NULL,
  `adduser` varchar(30) DEFAULT NULL,
  `edituser` varchar(30) DEFAULT NULL,
  `checkuser` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`sh_id`),
  KEY `商户名称` (`sh_name`),
  KEY `sh_id` (`sh_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20000274 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sh_info
-- ----------------------------
INSERT INTO `sh_info` VALUES ('20000001', '上海卓典工贸有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000002', '上海亚旗贸易有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000003', '兰维乐（上海）食品有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000004', '上海上象文化发展有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000005', '上海川田锦农业科技发展有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000006', '上海厨易配菜有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000007', '实惠上海', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000008', '上海四季百果园有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000009', '北京市精物堂食品有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000010', '上海拓力广告有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000011', '上海久侬信息科技有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000012', '上海魁春实业有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000013', '上海丝味食品有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000014', '上海宏擘贸易有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000015', '上海稀好电子商务有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000016', '上海来伊份食品连锁经营有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000017', '北京每日优鲜电子商务有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000018', '宝和嘉力（上海）商业投资管理有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000019', '上海有悠实业有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000020', '上海敦化实业有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000021', '日加满饮品（上海）有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000022', '上海市雪中王有机食品有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000023', '上海雪中王有机食品有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000024', '上海市杨浦区双若食品经营部', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000025', '大湖一网鱼', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000026', '上海钦维商贸有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000027', '上海欧昕贸易有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000028', '上海艺平食品有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000029', '上海森鲜蔬菜专业合作社', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000030', '上海勇盈贸易有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000031', '上海旺旺食品集团有限公司冰品营业部', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000032', '上海梁源食品有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000033', '上海置换广告有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000034', '纽睿佳婴儿配方奶粉', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000035', '宇娜纤美', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000036', '上海钧钛电子商务有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000037', '泰壹商贸有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000038', '快乐送', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000039', '上海德沪文化传播有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000040', '千亩园林', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000041', '沈师傅鸡蛋干', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000042', '上海钜杰国际贸易有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000043', '上海甫田贸易有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000044', '上海涛腾实业有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000045', '杨浦艾灸养生中心', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000046', '进口食品·88折扣店', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000047', '上海云臻荟食品有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000048', '上海崇康农产品有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000049', '上海市嘉定工业区瑞丰杂货店', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000050', '上海普瑞眼科医院有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000051', '上海黑域电子商务有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000052', '国药（延边）电子商务股份有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000053', '上海懋质贸易有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000054', '上海新方向化妆品有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000055', '天津金康宝动物医药保健品有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000056', '纽瑞滋（上海）食品有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000057', '上海太太乐食品有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000058', '湖南省华文食品有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000059', '四川王家渡食品有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000060', '山西维之王食品有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000061', '雅格斯丹集团有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000062', '上海枣开心商贸有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000063', '新方向生物科技有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000064', '好想你枣', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000065', '上海舶欧贸易有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000066', '上海唐门实业有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000067', '上海鼎优农业科技有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000068', '上海交大昂立股份有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000069', '上海大塚食品有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000070', '上海密纯饮料食品有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000071', '上海新方向生物科技有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000072', '上海聆心文化传播有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000073', '上海利男居食品总厂有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000074', '贝因美', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000075', '上海蜀鑫实业有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000076', '喀什神恋有机食品有限责任有限公司上海分公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000077', '洽洽食品', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000078', '宬昊实业', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000079', '贝因美婴童食品股份有限公司上海分公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000080', '常州市三新园艺有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000081', '上海爱芬乐贸易有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000082', '上海罗棉贸易有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000083', '统一企业（中国）投资有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000084', '上海艾兰得电子商务有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000085', '晶粮实业', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000086', '上海美利美环保科技有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000087', '上海纽赉富国际贸易有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000088', '爱满庭SPA', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000089', '飞宇专属艺术儿童摄影', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000090', '上海苏鸿食品有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000091', '森蜂园', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000092', '保定妙士乳业有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000093', '南京绿仙子生物技术有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000094', '上海鸿羿商贸有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000095', '上海通路快捷网络服务外包有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000096', '上海市浦东新区周浦镇美伊堂美容院', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000097', '上海南浦食品公司浦东分公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000098', '上海\n林林粮油食品有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000099', '上海极舒行贸易有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000100', '上海永年商贸有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000101', '上海迅发食品销售部', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000102', '冬葵（上海）企业发展有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000103', '上海寿益实业有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000104', '东川跆拳道馆', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000105', '微装', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000106', '珲春旭农业开发集团有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000107', '大漠野宝', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000108', '叶青视觉艺术', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000109', '上海凯赟贸易有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000110', '上海阿咪儿童食品有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000111', '上海怡科经贸有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000112', '北京甘先生电子商务有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000113', '上海巧罗食品有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000114', 'E宠商城', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000115', '上海美晏贸易有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000116', '魅力惠', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000117', '上海齐家网信息科技股份有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000118', '成龙电影艺术馆', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000119', '均瑶集团上海食品有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000120', '马利来企业发展（上海）有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000121', '云南特产', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000122', '北京怡宝乐佳商贸有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000123', '上海梓瑶贸易有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000124', '北京奇乐果信息科技有限公司上海分公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000125', '上海通路快建网络服务外包有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000126', '青岛中青立信食品有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000127', '上海蹦月实业有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000128', '福福生物', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000129', '上海亦伦食品销售有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000130', '上海青葵电子商务有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000131', '活力鳄', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000132', '中国人民解放军第四五五医院', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000133', '上海磊臣投资管理有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000134', '丽江明石药业开发有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000135', '青海文秦粮油科技有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000136', '农夫山泉', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000137', '上海通则久投资管理有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000138', '上海北伟生态农业科技发展有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000139', '惠氏（上海）贸易有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000140', '西藏大昭圣泉实业有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000141', '地球小卖部', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000142', '上海艺燕食品有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000143', '旗帜婴儿乳品股份有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000144', '上海真美妇科医院', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000145', '上海生新树莓种植专业合作社', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000146', '金叠源电子商务（上海）有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000147', '上海布如需贸易有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000148', '策隆网络技术（上海）有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000149', '上海翡翠乾丰实业投资有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000150', '吃货一族', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000151', '新疆济康蜂业科技有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000152', '美丽加芬（上海）化妆品有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000153', '上海丽人丽妆化妆品有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000154', '上海达农实业有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000155', '威海灿都粮油经销有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000156', '上海炜鎏贸易有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000157', '本草丝元', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000158', '上海艾柔商贸有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000159', '太空鼠净水机', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000160', '康保县光明粮油有限责任公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000161', '贝佳斯（北京）化妆品有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000162', '上海三锐食品有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000163', '兰溪市鸿香生物科技有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000164', '上海杭达医疗器械有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000165', '兰陵银坊蜂业有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000166', '上海灏昶升贸易有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000167', '上海相连实业有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000168', '杭州加多宝饮料有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000169', '北京太火鸟科技有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000170', '上海新世纪日用化学品有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000171', '上海金黔品实业有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000172', '上海川谷食品科技有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000173', '上海典雅美容化妆品有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000174', '牛家帮', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000175', 'A衣购工厂店', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000176', '立兴悦宴佛跳墙', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000177', '上海欧烨美容有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000178', '上海华唯贸易有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000179', '上海欣锚实业有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000180', '仁爱医院', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000181', '上海晶杰日化有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000182', '上海希黛化妆品有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000183', '上海艾卿美网络科技有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000184', '上海显雷日用品有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000185', '上海中优智慧医疗科技有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000186', '俪兰', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000187', '上海卓滋堂化妆品', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000188', '上海品益贸易有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000189', '上海赤承实业有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000190', '上海以勤贸易有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000191', '闸北区付平食品店', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000192', '上海美昔贸易有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000193', '上海悠居网络科技有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000194', '上海新市商行', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000195', '上海名喆酒业股份有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000196', '爱之湾', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000197', '上海绍兴饭店管理有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000198', '上海士度客实业有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000199', '家研装饰', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000200', '上海卓典食品香料有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000201', '上海融时商务咨询有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000202', '衢州聚讯邦财商贸有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000203', '上海康美健身会所', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000204', '异美园水果店', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000205', '爱情湾', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000206', '成裕灯具旗舰店', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000207', '家政在线', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000208', '好慷在线', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000209', '达良优品', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000210', '远鼎信息科技（上海）有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000211', '米仔', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000212', '上海悠哉国际旅行社有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000213', '上海百家益医疗器械有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000214', '绿脸1号', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000215', '维灵（杭州）信息技术有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000216', '上海TCL电器销售有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000217', '上海铭纳食品有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000218', '优艾贝国际月子会所', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000219', '上海昱琳信息科技有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000220', '美妍汉方美容', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000221', '兰的养生SPA美容馆', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000222', '无限极', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000223', '艾薇丽生态农庄', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000224', '小小机器人', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000225', '上海兆资投资管理咨询有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000226', '沃旭电子商务（上海）有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000227', '上海逸骑网络科技有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000228', '乐博士创意科技中心', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000229', '人民金行', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000230', '飞皇生态园', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000231', '韩城跆拳道', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000232', '玛利娅蒙特梭利早教世家', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000233', '依霖美丽定制', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000234', '启德考培', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000235', '景梵瑜伽', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000236', '联合货币(长宁路店)', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000237', '上海坤拓网络科技发展有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000238', '上海臻普国际贸易有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000239', '洗洗', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000240', '佳美口腔', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000241', '脑立方全脑应用训练中心奉贤中心', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000242', '尚屹功夫馆', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000243', '邦宁（上海）护理服务有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000244', '素写形象', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000245', '上海陶瓷科技艺术馆', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000246', '碧然国际贸易（上海）有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000247', '美丽直达', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000248', '日置名媛', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000249', '三致教育（虹口店）', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000250', '精锐1对1长宁天山校店', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000251', '上海进念建筑设计装饰有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000252', '广州现代资讯传播有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000253', '温镜阁', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000254', '上海昕纯信息技术服务有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000255', '上海丽王商贸发展有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000256', '上海巴拉巴拉服饰有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000257', '西双版纳雅居乐旅游置业有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000258', '上海洞恬贸易有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000259', '硅布袜业', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000260', '上海九嘉食品销售有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000261', '上海澳琳达健康食品有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000262', '上海朴爱贸易有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000263', '跬步袜商', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000264', 'NITORI家具&家居', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000265', '上海亚缶商务咨询有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000266', '雪梨专业脱毛', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000267', '上海观庭家用纺织品有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000268', '卓典食品香料（江苏）有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000269', '上海壹嫂网络科技有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000270', '伊莱美医疗美容有限公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000271', '四川省绵阳市丰谷酒业有限责任公司', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000272', '安格斯潮流影像', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');
INSERT INTO `sh_info` VALUES ('20000273', '摩尔齿科', '', '', '', '', 'yesok', null, '梁吉', '', '梁吉');

-- ----------------------------
-- Table structure for sp_info
-- ----------------------------
DROP TABLE IF EXISTS `sp_info`;
CREATE TABLE `sp_info` (
  `sp_id` int(8) NOT NULL AUTO_INCREMENT,
  `sp_name` varchar(70) NOT NULL,
  `back_name` varchar(70) DEFAULT NULL,
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
  `commodity_rating` enum('C','B','B+','A','','A+') DEFAULT NULL,
  PRIMARY KEY (`sp_id`),
  KEY `商品名称` (`sp_name`)
) ENGINE=InnoDB AUTO_INCREMENT=10000875 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_info
-- ----------------------------
INSERT INTO `sp_info` VALUES ('10000001', '卓典麻辣香锅调味料180g', '', null, '9.60', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-02-22', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000002', '碱法柠檬味苏打盐汽水（500ml一瓶）', '', null, '4.50', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-02-23', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000003', '惬琵妲果酱1瓶，380g/瓶', '', null, '39.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-02-28', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000004', '《天才达芬奇》单人平日票', '', null, '130.00', null, null, null, null, null, null, '', '张', '服务', null, null, '2016-02-29', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000005', '白鹭小町大米5KG', '', null, '43.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-03-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000006', '光明米业晶润香大米5KG', '', null, '36.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-03-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000007', '光明米业崇明农场大米10KG', '', null, '52.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-03-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000008', '康师傅珍品红烧牛肉面100g*5/袋', '', null, '11.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-03-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000009', '娃哈哈AD钙奶220g', '', null, '2.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-03-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000010', '比乐狗粮体验装（小型犬成犬粮）', '', null, '0.00', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-03-03', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000011', '精物堂花生芝麻酥158g（椒香味、绿茶味、黑糖味、原味）四种口味', '', null, '15.00', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-03-06', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000012', '57℃方便海鲜粥 26g/盒', '', null, '4.50', null, null, null, null, null, null, '', '盒', '实物', null, null, '2016-03-06', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000013', '巧罗北纬10度松露巧克力50g', '', null, '2.70', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-03-08', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000014', '大地久久 开心果 200g', '', null, '22.90', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-03-08', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000015', '大地久久 黑加仑葡萄干/250g', '', null, '11.90', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-03-08', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000016', '大地久久 绿葡萄干 250g', '', null, '10.90', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-03-08', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000017', '谷优迷你奶油夹心饼干100g①', '', null, '9.00', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-03-12', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000018', '谷优迷你奶油夹心饼干100g②', '', null, '9.00', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-03-12', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000019', '7棵麦黑麦汁', '', null, '5.80', null, null, null, null, null, null, '', '罐', '实物', null, null, '2016-03-14', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000020', '本草智慧黑糖姜母风味固体饮料168g/盒（24g*7）', '', null, '22.00', null, null, null, null, null, null, '', '盒', '实物', null, null, '2016-03-16', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000021', '好运牌风味方便面60g/包*2', '', null, '13.00', null, null, null, null, null, null, '', '份', '实物', null, null, '2016-03-16', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000022', '风琴鱿鱼片60g', '', null, '10.80', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-03-19', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000023', '7棵麦黑麦汁①', '', null, '5.80', null, null, null, null, null, null, '', '罐', '实物', null, null, '2016-03-19', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000024', '7棵麦黑麦汁②', '', null, '5.80', null, null, null, null, null, null, '', '罐', '实物', null, null, '2016-03-19', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000025', '德国爱氏晨曦牛奶1L装②', '', null, '29.90', null, null, null, null, null, null, '', '盒', '实物', null, null, '2016-03-21', 'yesok', null, '梁吉', '', '梁吉', 'A+');
INSERT INTO `sp_info` VALUES ('10000026', '康师傅冰红茶550ml', '', null, '3.50', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-03-28', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000027', '成龙艺术馆门票', '', null, '158.00', null, null, null, null, null, null, '', '张', '服务', null, null, '2016-03-29', 'yesok', null, '梁吉', '', '梁吉', 'A+');
INSERT INTO `sp_info` VALUES ('10000028', '德国爱氏晨曦牛奶200ml装', '', null, '24.90', null, null, null, null, null, null, '', '盒', '实物', null, null, '2016-03-31', 'yesok', null, '梁吉', '', '梁吉', 'A+');
INSERT INTO `sp_info` VALUES ('10000029', '德娅玛低糖雪菊饮品①', '', null, '5.00', null, null, null, null, null, null, '', '罐', '实物', null, null, '2016-04-01', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000030', '日加满维他维生', '', null, '10.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-04-01', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000031', '即食木耳（原味）45g', '', null, '3.00', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-04-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000032', '即食木耳（微辣）45g', '', null, '3.00', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-04-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000033', '即食木耳（泡椒）45g', '', null, '3.00', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-04-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000034', '雪中王即食黑木耳45g', '', null, '3.00', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-04-01', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000035', '娃哈哈奶酪酸奶125ml', '', null, '3.30', null, null, null, null, null, null, '', '盒', '实物', null, null, '2016-04-01', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000036', '娃哈哈奶酪酸奶125ml①', '', null, '3.30', null, null, null, null, null, null, '', '盒', '实物', null, null, '2016-04-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000037', '娃哈哈奶酪酸奶200ml', '', null, '5.40', null, null, null, null, null, null, '', '盒', '实物', null, null, '2016-04-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000038', '大湖鱼乐食客（真空鲫鱼）+小阿刁（鱼干）', '', null, '25.00', null, null, null, null, null, null, '', '份', '实物', null, null, '2016-04-10', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000039', '西麦燕麦片', '', null, '15.80', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-04-10', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000040', '琦格乐柠檬味威化饼干100g', '', null, '12.80', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-04-10', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000041', '艺平小元零食爆米花118g', '', null, '12.00', null, null, null, null, null, null, '', '筒', '实物', null, null, '2016-04-11', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000042', '艺平小元零食爆米花160g', '', null, '15.00', null, null, null, null, null, null, '', '筒', '实物', null, null, '2016-04-11', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000043', '琦格乐香浓可可威化脆饼150g', '', null, '19.80', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-04-13', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000044', '琦格乐可可威化饼干100g', '', null, '12.80', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-04-13', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000045', '德娅玛低糖雪菊饮品②', '', null, '5.00', null, null, null, null, null, null, '', '罐', '实物', null, null, '2016-04-15', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000046', '森鲜馆新米体验装400g', '', null, '8.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-04-15', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000047', '琦格乐牛奶巧克力威化脆饼150g', '', null, '19.80', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-04-15', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000048', '黑珍珠面膜一片', '', null, '6.00', null, null, null, null, null, null, '', '片', '实物', null, null, '2016-04-16', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000049', '精典泰迪抹茶味曲奇饼干（圆盒）', '', null, '25.00', null, null, null, null, null, null, '', '盒', '实物', null, null, '2016-04-16', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000050', '旺旺含乳饮料吸吸冰，80ml', '', null, '3.50', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-04-16', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000051', '旺旺冰沙吸吸冰，80ml', '', null, '3.50', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-04-16', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000052', '百事维动力600ml', '', null, '4.50', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-04-17', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000053', '奇派饮品朗柠水含汽苏打水饮料，468ml', '', null, '5.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-04-17', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000054', '纽睿佳婴儿配方奶粉一段 900g', '', null, '358.00', null, null, null, null, null, null, '', '罐', '实物', null, null, '2016-04-18', 'yesok', null, '梁吉', '', '梁吉', 'A+');
INSERT INTO `sp_info` VALUES ('10000055', '康师傅优悦矿泉水', '', null, '2.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-04-19', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000056', '纽睿佳婴儿配方奶粉二段 900g', '', null, '338.00', null, null, null, null, null, null, '', '罐', '实物', null, null, '2016-04-20', 'yesok', null, '梁吉', '', '梁吉', 'A+');
INSERT INTO `sp_info` VALUES ('10000057', '纽睿佳婴儿配方奶粉三段 900g', '', null, '318.00', null, null, null, null, null, null, '', '罐', '实物', null, null, '2016-04-20', 'yesok', null, '梁吉', '', '梁吉', 'A+');
INSERT INTO `sp_info` VALUES ('10000058', 'Classic Teddy巧克力脆果', '', null, '12.50', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-04-23', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000059', '圆培1对1导学（888元）', '', null, '888.00', null, null, null, null, null, null, '', '张', '服务', null, null, '2016-04-23', 'yesok', null, '梁吉', '', '梁吉', 'C');
INSERT INTO `sp_info` VALUES ('10000060', '经典泰迪巧克力脆片40g/包②', '', null, '9.30', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-04-23', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000061', '卫龙亲嘴烧，22克', '', null, '1.00', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-04-24', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000062', '冰露矿泉水550ml①', '', null, '1.20', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-04-26', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000063', '小竹篮乳酸菌饮品250ml①', '', null, '6.00', null, null, null, null, null, null, '', '盒', '实物', null, null, '2016-04-26', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000064', '小竹篮乳酸菌饮品250ml②', '', null, '6.00', null, null, null, null, null, null, '', '盒', '实物', null, null, '2016-04-26', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000065', 'Classic Teddy巧克力脆片①', '', null, '12.50', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-04-27', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000066', '经典泰迪巧克力脆果40g/包', '', null, '9.30', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-04-27', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000067', '冰露矿泉水', '', null, '2.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-04-30', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000068', '哎呦米面精炖排骨酥味（净含量：106g）', '', null, '5.50', null, null, null, null, null, null, '', '盒', '实物', null, null, '2016-05-01', 'yesok', null, '梁吉', '', '梁吉', 'A+');
INSERT INTO `sp_info` VALUES ('10000069', '哎呦米面酱烧牛肉味（净含量：110g）', '', null, '5.50', null, null, null, null, null, null, '', '盒', '实物', null, null, '2016-05-01', 'yesok', null, '梁吉', '', '梁吉', 'A+');
INSERT INTO `sp_info` VALUES ('10000070', '泰椰椰果粒椰奶300ml③', '', null, '11.80', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-05-01', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000071', '泰椰椰果粒椰奶300ml①', '', null, '11.80', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-05-01', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000072', '康美药业菊皇露 500ml/瓶①', '', null, '3.50', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-05-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000073', '康美药业菊皇露 500ml/瓶②', '', null, '3.50', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-05-01', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000074', '统一番茄汁335ml', '', null, '8.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-05-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000075', '童记三利和灌汁鱼30g', '', null, '3.00', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-05-03', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000076', '京贡国香长粒香大米①', '', null, '16.80', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-05-06', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000077', '京贡国香长粒香大米②', '', null, '16.80', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-05-06', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000078', '中绿粗粮王谷物浓浆一箱（250ml*16盒）', '', null, '40.00', null, null, null, null, null, null, '', '箱', '实物', null, null, '2016-05-06', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000079', '沈师傅原味香肠夹心蛋36g', '', null, '2.50', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-05-06', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000080', '百乐牌爽脆牛奶巧克力，75g①', '', null, '28.00', null, null, null, null, null, null, '', '盒', '实物', null, null, '2016-05-06', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000081', '百乐牌爽脆牛奶巧克力，75g②', '', null, '28.00', null, null, null, null, null, null, '', '盒', '实物', null, null, '2016-05-06', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000082', '伟图矿泉水500ml', '', null, '8.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-05-07', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000083', '黄小米350g', '', null, '14.80', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-05-10', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000084', '黑豆320g', '', null, '10.80', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-05-10', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000085', '红豆350g', '', null, '15.80', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-05-10', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000086', '绿豆350g', '', null, '15.80', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-05-10', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000087', '曼都100％果汁1L②', '', null, '19.80', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-05-12', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000088', '曼都100％果汁1L①', '', null, '19.80', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-05-12', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000089', '谷优高纤维燕麦饼干（经典口味）280g', '', null, '15.00', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-05-14', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000090', '百乐卡普奇诺夹心巧克力，75g', '', null, '28.00', null, null, null, null, null, null, '', '盒', '实物', null, null, '2016-05-14', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000091', '大哥的故事鲜虾饼（香辣口味）②', '', null, '9.30', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-05-17', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000092', '宝矿力水特', '', null, '6.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-05-18', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000093', '布鲁斯堡黑啤酒', '', null, '8.50', null, null, null, null, null, null, '', '听', '实物', null, null, '2016-05-19', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000094', '布鲁斯堡黑啤酒 500ml/听', '', null, '8.50', null, null, null, null, null, null, '', '听', '实物', null, null, '2016-05-19', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000095', '焙朗早餐饼牛奶谷物味300g', '', null, '22.00', null, null, null, null, null, null, '', '盒', '实物', null, null, '2016-05-23', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000096', '焙朗早餐饼坚果蜂蜜味300g', '', null, '22.00', null, null, null, null, null, null, '', '盒', '实物', null, null, '2016-05-23', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000097', '焙朗早餐饼混合莓果味300g', '', null, '22.00', null, null, null, null, null, null, '', '盒', '实物', null, null, '2016-05-23', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000098', '云上野牧红烧羊肉450g①', '', null, '78.00', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-05-23', 'yesok', null, '梁吉', '', '梁吉', 'A+');
INSERT INTO `sp_info` VALUES ('10000099', '云上野牧红烧羊肉450g②', '', null, '78.00', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-05-23', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000100', '云上野牧羊蝎子汤950g', '', null, '98.00', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-05-23', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000101', '御赐良田稻花香大米 5KG', '', null, '80.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-05-24', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000102', '康瑞特玛咖饮料', '', null, '388.00', null, null, null, null, null, null, '', '盒', '实物', null, null, '2016-05-28', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000103', '浩明系列米浩明香大米5kg', '', null, '59.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-05-29', 'yesok', null, '梁吉', '', '梁吉', 'A+');
INSERT INTO `sp_info` VALUES ('10000104', '平和体质茶', '', null, '5.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-06-01', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000105', '琦格乐芝士薄脆片100g', '', null, '14.80', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-06-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000106', '琦格乐辣味芝士薄脆片100g', '', null, '14.80', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-06-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000107', '琦格乐飞碟可可威化饼干150g①', '', null, '19.80', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-06-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000108', '琦格乐飞碟榛仁威化饼干150g①', '', null, '19.80', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-06-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000109', '诺比利斯乔纳森苹果片40g', '', null, '15.80', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-06-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000110', '诺比利斯黄蕉苹果片40g', '', null, '15.80', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-06-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000111', '琦格乐飞碟可可威化饼干150g②', '', null, '19.80', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-06-01', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000112', '琦格乐飞碟榛仁威化饼干150g②', '', null, '19.80', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-06-01', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000113', '营养快线雪梨味500g', '', null, '4.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-06-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000114', '营养快线果汁牛奶原味500ml', '', null, '4.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-06-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000115', '西麦简装纯燕麦片（即食）桶装1000g', '', null, '27.00', null, null, null, null, null, null, '', '桶', '实物', null, null, '2016-06-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000116', '森鲜馆忻米体验装400g', '', null, '12.80', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-06-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000117', '葡韵手信俄罗斯曲奇饼,180克', '', null, '42.00', null, null, null, null, null, null, '', '盒', '实物', null, null, '2016-06-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000118', '豆制火腿200g', '', null, '7.63', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-06-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000119', '原味豆干150g', '', null, '4.95', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-06-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000120', '素鸡豆腐200g', '', null, '11.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-06-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000121', '香薰豆干150g', '', null, '5.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-06-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000122', '鸡汁香菇150g', '', null, '8.30', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-06-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000123', '香薰素肠100g', '', null, '4.10', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-06-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000124', '孜然豆卷150g', '', null, '7.63', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-06-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000125', '月兰达预制香脆粉100g', '', null, '10.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-06-04', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000126', '月兰达香脆炸粉（煎炸粉）500g', '', null, '25.90', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-06-04', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000127', '极致活肤修护面霜60ml', '', null, '260.00', null, null, null, null, null, null, '', '盒', '实物', null, null, '2016-06-04', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000128', '镇颜美白精华霜60ml', '', null, '260.00', null, null, null, null, null, null, '', '盒', '实物', null, null, '2016-06-04', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000129', '月兰达预制香脆粉（经济装）100g', '', null, '10.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-06-04', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000130', '营养快线果汁雪梨风味一瓶', '', null, '3.50', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-06-05', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000131', '珍宝宠物食品试用装40克/包', '', null, '15.00', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-06-11', 'yesok', null, '梁吉', '', '梁吉', 'B');
INSERT INTO `sp_info` VALUES ('10000132', '兰奇全脂纯牛奶250ml', '', null, '8.90', null, null, null, null, null, null, '', '盒', '实物', null, null, '2016-06-11', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000133', '太太乐爱的礼物', '', null, '38.80', null, null, null, null, null, null, '', '盒', '实物', null, null, '2016-06-12', 'yesok', null, '梁吉', '', '梁吉', 'A+');
INSERT INTO `sp_info` VALUES ('10000134', '劲仔豆干 25克', '', null, '1.50', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-06-12', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000135', '王家渡豉香拌料80g②', '', null, '6.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-06-12', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000136', '王家渡豉香拌料80g①', '', null, '6.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-06-12', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000137', '劲仔鱼干 15克', '', null, '1.50', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-06-13', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000138', '沈师傅香菇肉丸夹心蛋36g', '', null, '2.50', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-06-13', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000139', '山楂凉果 318g/袋', '', null, '22.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-06-17', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000140', '铂金美肌保湿沐浴露50ml', '', null, '5.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-06-20', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000141', '铂金柔顺祛屑洗发水50ml', '', null, '5.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-06-20', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000142', '娃哈哈 爽歪歪一瓶', '', null, '1.60', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-06-21', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000143', '华统火腿-自然块 268g', '', null, '48.00', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-06-22', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000144', '芒果汁饮料 330ml', '', null, '5.05', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-06-24', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000145', '凯撒雪之韵黑啤酒', '', null, '7.50', null, null, null, null, null, null, '', '听', '实物', null, null, '2016-06-25', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000146', '好想你-精品红枣（一级）去核红枣30g', '', null, '5.90', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-06-25', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000147', '新雪肌系列-金盏花舒缓眼胶15ml/瓶', '', null, '190.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-06-26', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000148', '新雪肌系列-镇颜美白精华霜60ml/瓶', '', null, '320.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-06-26', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000149', '新雪肌系列-甘菊金缕梅眼霜15ml/瓶', '', null, '200.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-06-26', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000150', '十谷杂粮粥', '', null, '19.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-06-26', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000151', '新雪肌系列-茶树净油保湿乳液100ml/瓶', '', null, '150.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-06-27', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000152', '统一番茄汁180ml', '', null, '5.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-06-27', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000153', '纽麦福全脂纯牛奶250ml', '', null, '8.00', null, null, null, null, null, null, '', '盒', '实物', null, null, '2016-06-27', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000154', '新雪肌系列-茶树去油脂收敛水100ml/瓶', '', null, '130.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-06-28', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000155', '新雪肌系列-焕采醒肤保湿乳液30ml/瓶', '', null, '160.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-06-28', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000156', '好想你枣-即食枣精选一级（无核）20g', '', null, '3.92', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-06-28', 'yesok', null, '梁吉', '', '梁吉', 'B');
INSERT INTO `sp_info` VALUES ('10000157', '新雪肌系列-果酸洗面奶150ml/瓶', '', null, '110.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-06-29', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000158', '界界乐美国Jelley Brown乳酸菌（原味）4*100ml', '', null, '12.80', null, null, null, null, null, null, '', '组合装', '实物', null, null, '2016-06-30', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000159', '界界乐美国Jelley Brown乳酸菌（草莓味）4*100ml', '', null, '12.80', null, null, null, null, null, null, '', '组合装', '实物', null, null, '2016-06-30', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000160', '界界乐美国Jelley Brown乳酸菌（芒果味）4*100ml', '', null, '12.80', null, null, null, null, null, null, '', '组合装', '实物', null, null, '2016-06-30', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000161', '宝鼎上海白醋2L', '', null, '10.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-06-30', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000162', '宝鼎上海黄酒料酒王，500ml', '', null, '4.80', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-06-30', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000163', '鼎优米礼盒装5kg', '', null, '128.00', null, null, null, null, null, null, '', '盒', '实物', null, null, '2016-06-30', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000164', '新雪肌系列-温和洁面凝胶150ml/瓶', '', null, '120.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-07-01', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000165', '新雪肌系列-白金汰美白面膜5片/盒', '', null, '220.00', null, null, null, null, null, null, '', '盒', '实物', null, null, '2016-07-01', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000166', '新雪肌系列-新雪肌保湿面膜5片/盒', '', null, '180.00', null, null, null, null, null, null, '', '盒', '实物', null, null, '2016-07-01', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000167', '新雪肌系列-拉提弹力紧实面膜5片/盒', '', null, '180.00', null, null, null, null, null, null, '', '盒', '实物', null, null, '2016-07-01', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000168', '新雪肌系列-草本焕采修护面膜5片/盒', '', null, '180.00', null, null, null, null, null, null, '', '盒', '实物', null, null, '2016-07-01', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000169', '天然元辅酶Q10', '', null, '189.00', null, null, null, null, null, null, '', '罐', '实物', null, null, '2016-07-01', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000170', '营养快线果汁牛奶原味一瓶', '', null, '3.10', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-07-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000171', '梦咖喱粉', '', null, '15.00', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-07-01', 'yesok', null, '梁吉', '', '梁吉', 'A+');
INSERT INTO `sp_info` VALUES ('10000172', '琦格乐蒜蓉味芝士薄脆片100g', '', null, '14.80', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-07-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000173', '密顺4.5升矿物质水', '', null, '15.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-07-01', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000174', '泰椰椰牌椰汁饮料330ml①', '', null, '7.80', null, null, null, null, null, null, '', '罐', '实物', null, null, '2016-07-01', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000175', '泰椰椰牌椰汁饮料330ml②', '', null, '7.80', null, null, null, null, null, null, '', '罐', '实物', null, null, '2016-07-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000176', '西麦纯燕麦片1500g', '', null, '27.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-07-02', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000177', '新雪肌系列-深海胶原嫩白面膜5片/盒', '', null, '180.00', null, null, null, null, null, null, '', '盒', '实物', null, null, '2016-07-03', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000178', '新雪肌系列-顶级保湿深层面膜5片/盒', '', null, '220.00', null, null, null, null, null, null, '', '盒', '实物', null, null, '2016-07-03', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000179', '芳疗按摩笔', '', null, '68.00', null, null, null, null, null, null, '', '盒', '实物', null, null, '2016-07-04', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000180', '黄飞红麻辣花生', '', null, '1.00', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-07-05', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000181', '西麦简装纯燕麦片（即食）700g', '', null, '14.90', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-07-05', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000182', '鼎优米450g', '', null, '16.80', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-07-07', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000183', '鼎优米超市装5kg', '', null, '78.00', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-07-07', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000184', '利男居八盒装糕点礼盒', '', null, '78.00', null, null, null, null, null, null, '', '盒', '实物', null, null, '2016-07-08', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000185', '800克贝因美有机爱+婴儿配方奶粉 1段', '', null, '79.00', null, null, null, null, null, null, '', '盒', '实物', null, null, '2016-07-09', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000186', '饭扫光新生代下饭菜爆炒菌片20g', '', null, '2.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-07-09', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000187', '新雪肌系列-金缕梅清新眼胶15ml/瓶', '', null, '180.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-07-10', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000188', '喀什红枣-神恋有机骏枣500g', '', null, '60.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-07-10', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000189', '洽洽焦糖瓜子+108g', '', null, '6.50', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-07-10', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000190', '新雪肌系列-极致活肤修颜面霜60ml/瓶', '', null, '300.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-07-11', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000191', '宬昊实业银瓶圣水480ml', '', null, '4.90', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-07-11', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000192', '好想你-干脆点多好红枣脆片20g', '', null, '3.60', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-07-11', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000193', '新雪肌系列-茉莉檀香保湿水100ml/瓶', '', null, '160.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-07-12', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000194', '洽洽山核桃味瓜子+108g', '', null, '6.50', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-07-13', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000195', '成功妈咪孕妇奶粉，189g/盒（27g*7）', '', null, '63.00', null, null, null, null, null, null, '', '盒', '实物', null, null, '2016-07-13', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000196', '800克贝因美有机爱+较大婴儿配方奶粉2段', '', null, '79.00', null, null, null, null, null, null, '', '盒', '实物', null, null, '2016-07-17', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000197', '精物堂牛轧糖138g', '', null, '8.80', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-07-17', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000198', '三新常州特产五香萝卜干75g', '', null, '1.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-07-18', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000199', '派米混合坚果（葡萄干，花生，腰果），150g', '', null, '35.00', null, null, null, null, null, null, '', '罐', '实物', null, null, '2016-07-21', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000200', '派米混合坚果（葡萄干，花生，腰果）,350g', '', null, '82.00', null, null, null, null, null, null, '', '罐', '实物', null, null, '2016-07-21', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000201', '阿歌兹果汁250ml', '', null, '4.90', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-07-22', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000202', '派米混合坚果（葡萄干，腰果，扁桃仁）,150g', '', null, '35.00', null, null, null, null, null, null, '', '罐', '实物', null, null, '2016-07-22', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000203', '马来西亚咖喱面110g', '', null, '8.45', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-07-24', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000204', '马来西亚咖喱面110g*4', '', null, '33.80', null, null, null, null, null, null, '', '份', '实物', null, null, '2016-07-24', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000205', '马来西亚咖喱面110g②', '', null, '8.45', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-07-24', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000206', '统一如饮 梨想万岁（雪梨+罗汉果）梨汁饮料500ml', '', null, '5.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-07-24', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000207', '统一如饮 冬瓜小荞(冬瓜+苦芥麦）风味饮料500ml', '', null, '5.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-07-24', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000208', '统一如饮 梨想万岁（雪梨+罗汉果）梨汁饮料500ml①', '', null, '5.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-07-24', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000209', '统一如饮 冬瓜小荞(冬瓜+苦芥麦）风味饮料500ml①', '', null, '5.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-07-24', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000210', '沈师傅鸡蛋干100g①', '', null, '4.50', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-07-25', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000211', '沈师傅鸡蛋干100g', '', null, '4.50', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-07-25', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000212', '艾兰得维生素C含片6.5g', '', null, '6.60', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-07-27', 'yesok', null, '梁吉', '', '梁吉', 'B');
INSERT INTO `sp_info` VALUES ('10000213', '逊克高滩圆粒真空大米（500g)', '', null, '8.30', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-07-28', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000214', '沈师傅广味香肠夹心蛋36g', '', null, '2.50', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-07-28', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000215', '牛肉咖喱炒饭230g', '', null, '9.60', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-07-31', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000216', '茄汁鲔鱼饭230g', '', null, '8.90', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-07-31', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000217', '珍宝鸡肉布丁狗粮350g', '', null, '18.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-08-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000218', '珍爱多育猫专业猫粮350g', '', null, '25.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-08-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000219', '晶粮实业20元现金券', '', null, '20.00', null, null, null, null, null, null, '', '张', '服务', null, null, '2016-08-04', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000220', '新版梦咖喱蘑菇牛肉', '', null, '16.80', null, null, null, null, null, null, '', '盒', '实物', null, null, '2016-08-04', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000221', '圣贝牙科尊享贵宾卡（黑色）', '', null, '3000.00', null, null, null, null, null, null, '', '张', '服务', null, null, '2016-08-08', 'yesok', null, '梁吉', '', '梁吉', 'B');
INSERT INTO `sp_info` VALUES ('10000222', '百鸥飞达乳酸菌除味剂（宠物装100ml）', '', null, '49.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-08-08', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000223', '百鸥飞达乳酸菌除味剂（汽车专用装100ml）', '', null, '49.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-08-08', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000224', '百鸥飞达乳酸菌除味剂（汽车专用装300ml）', '', null, '78.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-08-08', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000225', '好味佳广澳梅132g', '', null, '9.50', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-08-09', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000226', '谷优拾一拾咸趣饼干350g', '', null, '25.00', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-08-11', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000227', '好想你-即食无核枣（3颗品享装12袋）90g', '', null, '12.90', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-08-11', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000228', '800克贝因美有机爱+幼儿配方奶粉3段', '', null, '79.00', null, null, null, null, null, null, '', '盒', '实物', null, null, '2016-08-13', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000229', '凯撒雪之韵黑啤酒 500ml/听', '', null, '7.50', null, null, null, null, null, null, '', '听', '实物', null, null, '2016-08-14', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000230', '爱满庭美容现金券1000元', '', null, '1000.00', null, null, null, null, null, null, '', '张', '服务', null, null, '2016-08-15', 'yesok', null, '梁吉', '', '梁吉', 'C');
INSERT INTO `sp_info` VALUES ('10000231', '波斯贡枣（五星）500克', '', null, '59.80', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-08-18', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000232', '飞宇专属艺术儿童摄影券', '', null, '198.00', null, null, null, null, null, null, '', '张', '服务', null, null, '2016-08-19', 'yesok', null, '梁吉', '', '梁吉', 'B');
INSERT INTO `sp_info` VALUES ('10000233', '浓香培根饭230g', '', null, '8.90', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-08-19', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000234', '加拿世家芥花籽油946ml', '', null, '68.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-08-19', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000235', '加拿世家芥花籽油946ml①', '', null, '68.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-08-19', 'yesok', null, '梁吉', '', '梁吉', 'A+');
INSERT INTO `sp_info` VALUES ('10000236', '森蜂园野菊花蜂蜜 250ml/瓶①', '', null, '38.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-08-20', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000237', '森蜂园野菊花蜂蜜 250ml/瓶②', '', null, '38.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-08-20', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000238', '红色恋人枣汁饮料310ML①', '', null, '5.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-08-24', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000239', '新版梦咖喱草菇鸡肉', '', null, '16.80', null, null, null, null, null, null, '', '盒', '实物', null, null, '2016-08-27', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000240', '超日标大米2.5kg', '', null, '75.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-08-27', 'yesok', null, '梁吉', '', '梁吉', 'A+');
INSERT INTO `sp_info` VALUES ('10000241', '韩式泡菜饭230g', '', null, '8.90', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-08-27', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000242', '俏江南宫保鸡丁精品酱汁60g*2①', '', null, '9.90', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-08-30', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000243', '俏江南鱼香肉丝精品酱汁60g*2', '', null, '9.90', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-08-30', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000244', '俏江南麻婆豆腐精品酱汁60g*2', '', null, '9.90', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-08-30', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000245', '魏米500g', '', null, '12.90', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-08-30', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000246', '美伊堂现金卡1000元', '', null, '1000.00', null, null, null, null, null, null, '', '张', '服务', null, null, '2016-08-31', 'yesok', null, '梁吉', '', '梁吉', 'C');
INSERT INTO `sp_info` VALUES ('10000247', '雀巢谷物早餐蛋奶星星', '', null, '26.50', null, null, null, null, null, null, '', '盒', '实物', null, null, '2016-09-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000248', '雀巢可可味滋谷物早餐', '', null, '26.50', null, null, null, null, null, null, '', '盒', '实物', null, null, '2016-09-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000249', '雀巢谷物早餐迷你装', '', null, '11.60', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-09-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000250', '恒大兴安2KG绿色大米', '', null, '50.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-09-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000251', '猴头蘑50g', '', null, '19.00', null, null, null, null, null, null, '', '盒', '实物', null, null, '2016-09-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000252', '德芙丝滑牛奶巧克力252g', '', null, '39.90', null, null, null, null, null, null, '', '盒', '实物', null, null, '2016-09-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000253', '德芙浓黑牛奶巧克力252g', '', null, '39.90', null, null, null, null, null, null, '', '盒', '实物', null, null, '2016-09-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000254', '德芙什锦牛奶巧克力249g', '', null, '39.90', null, null, null, null, null, null, '', '盒', '实物', null, null, '2016-09-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000255', '德芙醇黑巧克力（66%可可）252g', '', null, '45.90', null, null, null, null, null, null, '', '盒', '实物', null, null, '2016-09-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000256', 'M&M促销装200g', '', null, '32.00', null, null, null, null, null, null, '', '组合装', '实物', null, null, '2016-09-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000257', '永和豆浆利乐包250ml', '', null, '5.00', null, null, null, null, null, null, '', '盒', '实物', null, null, '2016-09-01', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000258', '青岛啤酒 逸品纯生 450ml', '', null, '15.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-09-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000259', '永和豆浆利乐包250ml①', '', null, '5.00', null, null, null, null, null, null, '', '盒', '实物', null, null, '2016-09-01', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000260', '维生素C含片-桔子味30片', '', null, '19.90', null, null, null, null, null, null, '', '管', '实物', null, null, '2016-09-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000261', '维生素C含片-草莓味30片', '', null, '19.90', null, null, null, null, null, null, '', '管', '实物', null, null, '2016-09-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000262', '杰克牌方形威化饼干 100g', '', null, '11.80', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-09-04', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000263', '喀吱脆薯脆+35g', '', null, '2.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-09-05', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000264', '吕贝克葵花籽油2L装①', '', null, '55.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-09-06', 'yesok', null, '梁吉', '', '梁吉', 'A+');
INSERT INTO `sp_info` VALUES ('10000265', '吕贝克葵花籽油2L装②', '', null, '55.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-09-06', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000266', '水果味棒棒糖（4种口味）①', '', null, '18.00', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-09-07', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000267', '水果味棒棒糖（4种口味）②', '', null, '18.00', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-09-07', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000268', '水果味棒棒糖（4种口味）③', '', null, '18.00', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-09-07', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000269', '新版梦咖喱鲜蔬牛肉', '', null, '16.80', null, null, null, null, null, null, '', '盒', '实物', null, null, '2016-09-07', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000270', '通芯湘莲238g', '', null, '18.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-09-08', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000271', '飞那腰果（鲜烤）120g/罐', '', null, '37.50', null, null, null, null, null, null, '', '罐', '实物', null, null, '2016-09-08', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000272', '飞那腰果（蜜烤）120g/罐', '', null, '37.50', null, null, null, null, null, null, '', '罐', '实物', null, null, '2016-09-08', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000273', '飞那腰果（泰式）120g/罐 ', '', null, '37.50', null, null, null, null, null, null, '', '罐', '实物', null, null, '2016-09-08', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000274', '飞那腰果（鲜烤）227g/罐 ', '', null, '65.00', null, null, null, null, null, null, '', '罐', '实物', null, null, '2016-09-08', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000275', '飞那腰果（蜜烤）227g/罐', '', null, '65.00', null, null, null, null, null, null, '', '罐', '实物', null, null, '2016-09-08', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000276', '飞那腰果（泰式）227g/罐', '', null, '65.00', null, null, null, null, null, null, '', '罐', '实物', null, null, '2016-09-08', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000277', '绿庄园钙铁锌豆奶粉', '', null, '15.00', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-09-10', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000278', '三只馋猫潍县青萝卜脆片35g', '', null, '7.80', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-09-10', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000279', '厨房硅胶', '', null, '66.00', null, null, null, null, null, null, '', '支', '实物', null, null, '2016-09-10', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000280', '好味佳精选级陈皮梅180g', '', null, '11.90', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-09-10', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000281', '香氏趣溢曲奇饼干（燕麦）', '', null, '9.90', null, null, null, null, null, null, '', '盒', '实物', null, null, '2016-09-10', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000282', '香氏趣溢曲奇饼干（柠檬）', '', null, '9.90', null, null, null, null, null, null, '', '盒', '实物', null, null, '2016-09-10', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000283', '三只馋猫南瓜脆片35g', '', null, '7.80', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-09-11', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000284', '果肉果冻200g', '', null, '4.00', null, null, null, null, null, null, '', '盒', '实物', null, null, '2016-09-14', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000285', '旭春源无公害大米', '', null, '16.00', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-09-16', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000286', '三只馋猫紫薯脆皮35g', '', null, '7.80', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-09-20', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000287', '哎呦燕麦粥特浓牛奶味（净含量：40g）', '', null, '3.50', null, null, null, null, null, null, '', '盒', '实物', null, null, '2016-09-20', 'yesok', null, '梁吉', '', '梁吉', 'A+');
INSERT INTO `sp_info` VALUES ('10000288', '大昭圣泉', '', null, '45.00', null, null, null, null, null, null, '', '盒', '实物', null, null, '2016-09-23', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000289', '劲仔厚豆干25g/包', '', null, '1.00', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-09-23', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000290', '大漠野宝红香妃葡萄干①', '', null, '18.00', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-09-26', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000291', '大漠野宝红香妃葡萄干②', '', null, '18.00', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-09-26', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000292', '谷优玛利亚饼干100g', '', null, '5.00', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-09-27', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000293', '皇族牌法雷卷180g/盒', '', null, '35.00', null, null, null, null, null, null, '', '盒', '实物', null, null, '2016-09-28', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000294', '叶青教育大礼包（卡券）', '', null, '1200.00', null, null, null, null, null, null, '', '张', '服务', null, null, '2016-09-30', 'yesok', null, '梁吉', '', '梁吉', 'C');
INSERT INTO `sp_info` VALUES ('10000295', '知农良物 秋葵脆片40g', '', null, '19.80', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-09-30', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000296', '永和豆浆香浓原味250ml', '', null, '4.50', null, null, null, null, null, null, '', '盒', '实物', null, null, '2016-09-30', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000297', '永和豆浆香浓黑豆250ml', '', null, '4.50', null, null, null, null, null, null, '', '盒', '实物', null, null, '2016-09-30', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000298', 'New Water饮用天然矿泉水，10升①', '', null, '98.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-09-30', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000299', 'New Water饮用天然矿泉水，10升②', '', null, '98.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-09-30', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000300', '阿咪不添加蔗糖奶油曲奇 250g', '', null, '16.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-09-30', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000301', '大昭圣泉水卡', '', null, '160.00', null, null, null, null, null, null, '', '张', '服务', null, null, '2016-10-01', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000302', '皇菊皇茶', '', null, '128.00', null, null, null, null, null, null, '', '盒', '实物', null, null, '2016-10-01', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000303', '珍宝猫粮', '', null, '50.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-10-01', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000304', '瑞砂汉方足浴', '', null, '5.00', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-10-01', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000305', '番茄红素', '', null, '199.00', null, null, null, null, null, null, '', '罐', '实物', null, null, '2016-10-01', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000306', '粳冠优质有机盘锦大米2.5kg', '', null, '58.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-10-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000307', '粳冠玉粳香2.5kg', '', null, '58.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-10-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000308', '薏仁350g', '', null, '16.80', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-10-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000309', '燕麦350g', '', null, '19.80', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-10-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000310', '红小豆350g', '', null, '22.60', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-10-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000311', '荞麦350g', '', null, '18.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-10-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000312', '巧罗魔力速融牛奶巧克力42g', '', null, '12.90', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-10-02', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000313', '巧罗魔力速融黑巧克力42g', '', null, '12.90', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-10-02', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000314', '冻疮护理精油', '', null, '90.00', null, null, null, null, null, null, '', '只', '实物', null, null, '2016-10-07', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000315', '饭扫光新生代下饭菜爆炒金针菇60g', '', null, '5.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-10-07', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000316', '利男居四盒装糕点礼盒', '', null, '36.00', null, null, null, null, null, null, '', '盒', '实物', null, null, '2016-10-08', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000317', '蓝氏鸡肉芝士全价成猫粮', '', null, '50.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-10-09', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000318', '澳洲柯泰儿 石榴籽樱花冷制皂,75g/盒', '', null, '98.00', null, null, null, null, null, null, '', '盒', '实物', null, null, '2016-10-12', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000319', '丽得姿面膜（黄色，紧致弹力）', '', null, '25.00', null, null, null, null, null, null, '', '片', '实物', null, null, '2016-10-14', 'yesok', null, '梁吉', '', '梁吉', 'C');
INSERT INTO `sp_info` VALUES ('10000320', '加多宝利乐装225ml', '', null, '3.50', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-10-17', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000321', '葱花排骨面186g', '', null, '4.50', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-10-17', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000322', '牛骨汤面223g', '', null, '15.00', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-10-17', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000323', '凯撒黑啤酒1L', '', null, '27.60', null, null, null, null, null, null, '', '听', '实物', null, null, '2016-10-28', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000324', '俏江南时尚干锅秘制底料60g*2', '', null, '12.80', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-10-30', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000325', '俏江南川味火锅秘制底料80g*2', '', null, '12.80', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-10-30', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000326', '俏江南秘制香辣酱208g①', '', null, '18.80', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-10-30', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000327', '俏江南私房鲜辣酱208g', '', null, '18.80', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-10-30', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000328', '俏江南秘制香辣酱208g②', '', null, '18.80', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-10-30', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000329', '英诺迪洗衣片（10片装）', '', null, '19.80', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-10-30', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000330', '宝鼎淀粉454g', '', null, '4.60', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-10-30', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000331', '宝鼎九味一辣酱油640ml', '', null, '8.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-10-30', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000332', '宝鼎南乳汁550g', '', null, '8.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-10-30', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000333', '精制上海米醋500ml', '', null, '5.20', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-10-30', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000334', '宝鼎康乐醋无糖500ml', '', null, '6.50', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-10-30', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000335', '宝鼎康乐醋枸杞500ml', '', null, '8.90', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-10-30', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000336', '宝鼎浸蛋米醋500ml', '', null, '9.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-10-30', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000337', '宝鼎康乐醋500ml', '', null, '5.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-10-30', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000338', '黄山无极雪天然矿泉水，518ml', '', null, '3.80', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-10-30', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000339', '黄山无极雪天然活性矿泉水，518ml', '', null, '3.80', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-10-30', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000340', '均瑶味动力六种坚果饮料', '', null, '5.00', null, null, null, null, null, null, '', '罐', '实物', null, null, '2016-11-01', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000341', '均瑶味动力六种坚果饮料①', '', null, '5.00', null, null, null, null, null, null, '', '罐', '实物', null, null, '2016-11-01', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000342', '恒大兴安500ML绿色大豆油  ', '', null, '30.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-11-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000343', '塞保荞麦糊100g', '', null, '5.00', null, null, null, null, null, null, '', '盒', '实物', null, null, '2016-11-01', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000344', '爱芬乐帕拉斯糖，32克', '', null, '14.80', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-11-02', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000345', '王家渡麻辣豆腐80g②', '', null, '6.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-11-04', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000346', '王家渡回锅肉料65g②', '', null, '6.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-11-04', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000347', '王家渡麻辣豆腐80g①', '', null, '6.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-11-04', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000348', '王家渡回锅肉料65g①', '', null, '6.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-11-04', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000349', '五味园Q薯条，净重15克', '', null, '1.00', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-11-05', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000350', '薄皮核桃500g', '', null, '38.00', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-11-05', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000351', '神恋昆仑玄香枣（6粒装）', '', null, '2.50', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-11-08', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000352', '神恋昆仑仙香枣（10粒装）', '', null, '3.00', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-11-08', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000353', '好味佳优品加应子160g', '', null, '12.90', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-11-12', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000354', '香港金津糖果，40克', '', null, '10.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-11-12', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000355', '好想你-即食枣（去核）只用灰枣二级180g', '', null, '28.00', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-11-15', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000356', 'Duri丽维婴幼儿配方奶粉1段900g', '', null, '308.00', null, null, null, null, null, null, '', '罐', '实物', null, null, '2016-11-17', 'yesok', null, '梁吉', '', '梁吉', 'A+');
INSERT INTO `sp_info` VALUES ('10000357', 'Duri丽维婴幼儿配方奶粉2段900g', '', null, '308.00', null, null, null, null, null, null, '', '罐', '实物', null, null, '2016-11-17', 'yesok', null, '梁吉', '', '梁吉', 'A+');
INSERT INTO `sp_info` VALUES ('10000358', 'Duri丽维婴幼儿配方奶粉3段900g', '', null, '308.00', null, null, null, null, null, null, '', '罐', '实物', null, null, '2016-11-17', 'yesok', null, '梁吉', '', '梁吉', 'A+');
INSERT INTO `sp_info` VALUES ('10000359', '千岁红糖336g+生姜粉180g', '', null, '80.00', null, null, null, null, null, null, '', '组合装', '实物', null, null, '2016-11-20', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000360', '伊夫黎雪滢透保湿精华液5ml', '', null, '50.00', null, null, null, null, null, null, '', '支', '实物', null, null, '2016-11-28', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000361', '喀什红枣-神恋灰枣500g', '', null, '45.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-11-28', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000362', '美加净植尚礼盒', '', null, '100.00', null, null, null, null, null, null, '', '盒', '实物', null, null, '2016-11-29', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000363', '原种魏米500g', '', null, '12.90', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-11-30', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000364', '乌江原味菜片60g/包', '', null, '1.40', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-12-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000365', '元蘑50g', '', null, '19.00', null, null, null, null, null, null, '', '盒', '实物', null, null, '2016-12-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000366', '滑子蘑50g', '', null, '19.00', null, null, null, null, null, null, '', '盒', '实物', null, null, '2016-12-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000367', '东北仁儿开口松籽128g', '', null, '23.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-12-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000368', '东北仁儿炒榛子128g', '', null, '23.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-12-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000369', '东北仁儿松籽仁100g', '', null, '43.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-12-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000370', '东北仁儿榛子仁100g', '', null, '43.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-12-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000371', '东北仁儿核桃仁100g', '', null, '25.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-12-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000372', '仁来仁往开口松子128g', '', null, '18.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-12-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000373', '仁来仁往松子仁100g', '', null, '35.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-12-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000374', '东北仁儿开口松籽128g①', '', null, '23.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-12-01', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000375', '东北仁儿炒榛子128g①', '', null, '23.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-12-01', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000376', '东北仁儿松籽仁100g①', '', null, '43.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-12-01', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000377', '东北仁儿榛子仁100g①', '', null, '43.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-12-01', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000378', '东北仁儿核桃仁100g①', '', null, '25.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-12-01', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000379', '仁来仁往松子仁100g①', '', null, '35.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-12-01', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000380', '东北仁儿开口松籽128g②', '', null, '23.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-12-01', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000381', '东北仁儿炒榛子128g②', '', null, '23.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-12-01', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000382', '东北仁儿松籽仁100g②', '', null, '43.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-12-01', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000383', '东北仁儿榛子仁100g②', '', null, '43.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-12-01', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000384', '东北仁儿核桃仁100g②', '', null, '25.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-12-01', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000385', '仁来仁往开口松子128g②', '', null, '18.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-12-01', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000386', '仁来仁往松子仁100g②', '', null, '35.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-12-01', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000387', '原浆核桃乳 250ml/盒①', '', null, '3.30', null, null, null, null, null, null, '', '盒', '实物', null, null, '2016-12-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000388', '原浆核桃乳 250ml/盒②', '', null, '3.30', null, null, null, null, null, null, '', '盒', '实物', null, null, '2016-12-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000389', '贝因美冠军宝贝配方奶粉，908g', '', null, '65.00', null, null, null, null, null, null, '', '罐', '实物', null, null, '2016-12-02', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000390', '劲仔小鱼，15g', '', null, '1.00', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-12-04', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000391', '大地久久 贡米 5kg', '', null, '45.00', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-12-08', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000392', '乐只菊粉益生元', '', null, '70.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-12-15', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000393', '千岁红糖125g', '', null, '25.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-12-20', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000394', '红糖336g+中宁枸杞150g', '', null, '80.00', null, null, null, null, null, null, '', '组合装', '实物', null, null, '2016-12-20', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000395', '红糖336g+金边玫瑰180g', '', null, '80.00', null, null, null, null, null, null, '', '组合装', '实物', null, null, '2016-12-20', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000396', '贝因美经典优选配方奶粉1段，908g', '', null, '298.00', null, null, null, null, null, null, '', '罐', '实物', null, null, '2016-12-23', 'yesok', null, '梁吉', '', '梁吉', 'A+');
INSERT INTO `sp_info` VALUES ('10000397', '阿咪不添加蔗糖黑巧克力    100g', '', null, '9.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-12-24', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000398', '椴背黑木耳150g', '', null, '24.50', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-12-26', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000399', '胶原蛋白玛卡一盒（2g/袋，10袋/盒）', '', null, '719.00', null, null, null, null, null, null, '', '盒', '实物', null, null, '2016-12-27', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000400', '上海东觉实业便便固体饮料6g/包', '', null, '13.00', null, null, null, null, null, null, '', '包', '实物', null, null, '2016-12-27', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000401', '味都龙须面200g', '', null, '2.60', null, null, null, null, null, null, '', '袋', '实物', null, null, '2016-12-27', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000402', '巴马铂泉包装饮用水 500ml①', '', null, '3.50', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-12-30', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000403', '巴马铂泉包装饮用水 500ml②', '', null, '3.50', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-12-30', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000404', '活力鳄强化维生素饮料', '', null, '15.00', null, null, null, null, null, null, '', '罐', '实物', null, null, '2016-12-30', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000405', '澳琳达蜂王浆胶囊1400mg*365粒', '', null, '1189.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2016-12-30', 'yesok', null, '梁吉', '', '梁吉', 'A+');
INSERT INTO `sp_info` VALUES ('10000406', '中国人民解放军第四五五医院早早孕快速检测试纸（含男科体检卡）', '', null, '515.00', null, null, null, null, null, null, '', '支', '实物', null, null, '2016-12-31', 'yesok', null, '梁吉', '', '梁吉', 'B');
INSERT INTO `sp_info` VALUES ('10000407', '专业定制领带一条加定制丝巾一条', '', null, '258.00', null, null, null, null, null, null, '', '条', '实物', null, null, '2017-01-01', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000408', '珍宝泰迪犬食品', '', null, '58.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2017-01-01', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000409', '鲁之元玉米油200ml', '', null, '13.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2017-01-01', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000410', '海狮大豆油5L', '', null, '36.80', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2017-01-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000411', '瑞迪康卫生巾290mm（8片）', '', null, '28.80', null, null, null, null, null, null, '', '包', '实物', null, null, '2017-01-01', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000412', '瑞迪康卫生巾410mm（5片）', '', null, '28.80', null, null, null, null, null, null, '', '包', '实物', null, null, '2017-01-01', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000413', '瑞迪康卫生巾245mm（8片）', '', null, '28.80', null, null, null, null, null, null, '', '包', '实物', null, null, '2017-01-01', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000414', '瑞迪康卫生巾160mm（20片）', '', null, '28.80', null, null, null, null, null, null, '', '包', '实物', null, null, '2017-01-01', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000415', '鼎优米 450g/包', '', null, '16.80', null, null, null, null, null, null, '', '包', '实物', null, null, '2017-01-01', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000416', '美味牛肝菌（干片）20g', '', null, '15.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2017-01-01', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000417', '蓝莓果茶18g*3', '', null, '15.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2017-01-01', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000418', '南瓜粉', '', null, '396.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2017-01-04', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000419', '瑞迪康卫生巾', '', null, '22.00', null, null, null, null, null, null, '', '包', '实物', null, null, '2017-01-10', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000420', '和田玉枣一包', '', null, '5.00', null, null, null, null, null, null, '', '包', '实物', null, null, '2017-01-14', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000421', '和田玉枣500g', '', null, '45.00', null, null, null, null, null, null, '', '包', '实物', null, null, '2017-01-14', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000422', '歌丽珀吉安杜佳榛子巧克力85.5g', '', null, '58.00', null, null, null, null, null, null, '', '盒', '实物', null, null, '2017-01-30', 'yesok', null, '梁吉', '', '梁吉', 'A+');
INSERT INTO `sp_info` VALUES ('10000423', '珍宝天然鸭肉犬粮', '', null, '108.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2017-02-01', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000424', '农夫山泉1.5L/瓶', '', null, '3.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2017-02-01', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000425', '金泰誉茉莉香米（5斤装）', '', null, '150.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2017-02-01', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000426', '海狮葵花籽油5L', '', null, '57.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2017-02-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000427', '好味佳精选级加应子60g', '', null, '4.50', null, null, null, null, null, null, '', '包', '实物', null, null, '2017-02-03', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000428', '氨糖软骨素加钙片', '', null, '218.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2017-02-06', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000429', '氨糖软骨素加钙片②', '', null, '208.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2017-02-07', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000430', '黑嫂黄豆400g', '', null, '6.00', null, null, null, null, null, null, '', '包', '实物', null, null, '2017-02-09', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000431', '黑嫂小米400g', '', null, '7.00', null, null, null, null, null, null, '', '包', '实物', null, null, '2017-02-09', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000432', '黑嫂夏木耳100g', '', null, '12.00', null, null, null, null, null, null, '', '包', '实物', null, null, '2017-02-09', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000433', '黑嫂黑豆400g', '', null, '6.00', null, null, null, null, null, null, '', '包', '实物', null, null, '2017-02-09', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000434', '黑嫂小楂子400g', '', null, '5.00', null, null, null, null, null, null, '', '包', '实物', null, null, '2017-02-09', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000435', '黑嫂紫花（紫花芸豆）400g', '', null, '5.00', null, null, null, null, null, null, '', '包', '实物', null, null, '2017-02-09', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000436', '黑嫂黑龙江逊克-全生态农副产品礼盒套装', '', null, '55.00', null, null, null, null, null, null, '', '盒', '实物', null, null, '2017-02-09', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000437', '惠氏爱儿乐妈妈奶粉②', '', null, '72.00', null, null, null, null, null, null, '', '盒', '实物', null, null, '2017-02-10', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000438', '大昭圣泉5L桶装水', '', null, '18.00', null, null, null, null, null, null, '', '桶', '实物', null, null, '2017-02-17', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000439', '汉廷金枪鱼185g/罐', '', null, '19.90', null, null, null, null, null, null, '', '罐', '实物', null, null, '2017-02-26', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000440', '纽瑞滋新西兰原装进口全脂奶粉800g', '', null, '158.00', null, null, null, null, null, null, '', '罐', '实物', null, null, '2017-02-28', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000441', '恒顺镇江香醋550ml/瓶', '', null, '6.50', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2017-03-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000442', '福临门天然谷物调和油1.8L', '', null, '21.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2017-03-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000443', '秋木耳50g', '', null, '21.00', null, null, null, null, null, null, '', '盒', '实物', null, null, '2017-03-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000444', '黑木耳50g', '', null, '17.00', null, null, null, null, null, null, '', '盒', '实物', null, null, '2017-03-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000445', '香菇50g', '', null, '19.00', null, null, null, null, null, null, '', '盒', '实物', null, null, '2017-03-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000446', '金燕窝牌燕窝原味饮料①', '', null, '49.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2017-03-04', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000447', '金燕窝牌燕窝原味饮料②', '', null, '49.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2017-03-04', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000448', '金燕窝牌燕窝原味饮料③', '', null, '49.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2017-03-04', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000449', '旗帜幼儿配方奶粉', '', null, '360.00', null, null, null, null, null, null, '', '听', '实物', null, null, '2017-03-08', 'yesok', null, '梁吉', '', '梁吉', 'B');
INSERT INTO `sp_info` VALUES ('10000450', '早早孕快速检测试纸', '', null, '25.00', null, null, null, null, null, null, '', '盒', '实物', null, null, '2017-03-09', 'yesok', null, '梁吉', '', '梁吉', 'B');
INSERT INTO `sp_info` VALUES ('10000451', '瑞砂沐浴乳盐②', '', null, '4.00', null, null, null, null, null, null, '', '片', '实物', null, null, '2017-03-11', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000452', '瑞砂沐浴乳盐①', '', null, '4.00', null, null, null, null, null, null, '', '片', '实物', null, null, '2017-03-11', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000453', '梦咖喱辣味105克/包', '', null, '19.80', null, null, null, null, null, null, '', '包', '实物', null, null, '2017-03-13', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000454', '莓博士庄园明日叶粉50克①', '', null, '50.00', null, null, null, null, null, null, '', '包', '实物', null, null, '2017-03-16', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000455', '莓博士庄园明日叶粉50克②', '', null, '50.00', null, null, null, null, null, null, '', '包', '实物', null, null, '2017-03-16', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000456', '横沔牌亚麻油500ml', '', null, '99.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2017-04-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000457', '恒大兴安5L绿色菜籽油与5KG香米一号套装 ', '', null, '240.00', null, null, null, null, null, null, '', '套', '实物', null, null, '2017-04-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000458', '纽卡姿环保健康指甲油10ml/瓶', '', null, '68.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2017-04-02', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000459', '圣世恒隆砂板糖225g②', '', null, '128.00', null, null, null, null, null, null, '', '盒', '实物', null, null, '2017-04-14', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000460', '好味佳精选级加应子306g', '', null, '22.90', null, null, null, null, null, null, '', '包', '实物', null, null, '2017-04-14', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000461', '好味佳精选级加应子160g', '', null, '8.80', null, null, null, null, null, null, '', '包', '实物', null, null, '2017-04-17', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000462', '九草铁桔', '', null, '30.00', null, null, null, null, null, null, '', '个', '实物', null, null, '2017-04-18', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000463', '三精双黄连加强型（冬青薄荷香型）', '', null, '39.80', null, null, null, null, null, null, '', '支', '实物', null, null, '2017-04-18', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000464', '梦咖喱原味105克/包', '', null, '19.80', null, null, null, null, null, null, '', '包', '实物', null, null, '2017-04-22', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000465', '澳琳达左旋肉碱胶囊837mg*30粒', '', null, '65.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2017-04-25', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000466', '澳琳达葡萄糖胺胶囊650mg*90粒', '', null, '250.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2017-04-25', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000467', '澳琳达左旋肉碱胶囊837mg*120粒', '', null, '98.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2017-04-25', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000468', '澳琳达葡萄糖胺胶囊650mg*30粒', '', null, '95.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2017-04-25', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000469', '宝鼎泡椒卤500ml', '', null, '9.30', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2017-04-30', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000470', '宝鼎糯米醋500ml', '', null, '10.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2017-04-30', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000471', '宝鼎糟卤500ml', '', null, '5.90', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2017-04-30', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000472', '宝鼎辣糟卤500ml', '', null, '6.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2017-04-30', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000473', '宝鼎香糟卤610ml', '', null, '6.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2017-04-30', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000474', '宝鼎糟卤2L', '', null, '19.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2017-04-30', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000475', '亲亲马婆香菇宝贝香辣味90g', '', null, '11.80', null, null, null, null, null, null, '', '袋', '实物', null, null, '2017-04-30', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000476', '亲亲马婆香菇宝贝原味90g', '', null, '11.80', null, null, null, null, null, null, '', '袋', '实物', null, null, '2017-04-30', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000477', '亲亲马婆香菇宝贝烧烤味90g', '', null, '11.80', null, null, null, null, null, null, '', '袋', '实物', null, null, '2017-04-30', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000478', '亲亲马婆香菇宝贝泡椒味90g', '', null, '11.80', null, null, null, null, null, null, '', '袋', '实物', null, null, '2017-04-30', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000479', '扇牌高级洗衣皂125g*4', '', null, '8.20', null, null, null, null, null, null, '', '份', '实物', null, null, '2017-05-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000480', '贪心的草本牌植物饮料350ml', '', null, '10.20', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2017-05-01', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000481', '泰椰椰牌椰子饮料330ml（两种口味随机）', '', null, '7.80', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2017-05-01', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000482', '莓博士庄园明日叶粉100克', '', null, '100.00', null, null, null, null, null, null, '', '包', '实物', null, null, '2017-05-02', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000483', '楼兰红枣500g', '', null, '42.00', null, null, null, null, null, null, '', '包', '实物', null, null, '2017-05-04', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000484', '黑蜂蜂蜜15克', '', null, '6.00', null, null, null, null, null, null, '', '条', '实物', null, null, '2017-05-06', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000485', '红酒面膜120g①', '', null, '79.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2017-05-07', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000486', '红石榴鲜活优氧生肌水 30ml', '', null, '0.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2017-05-11', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000487', '天子果蔬伴侣一袋（15g*6）②', '', null, '58.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2017-05-12', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000488', '芳草集活泉补水旅行套', '', null, '59.00', null, null, null, null, null, null, '', '份', '实物', null, null, '2017-05-16', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000489', '净化美白修颜隔离霜35g', '', null, '68.00', null, null, null, null, null, null, '', '盒', '实物', null, null, '2017-05-22', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000490', '和田精品枣（500g）', '', null, '39.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2017-05-25', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000491', '灿都优质东北珍珠米800g', '', null, '19.90', null, null, null, null, null, null, '', '罐', '实物', null, null, '2017-05-25', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000492', '中粮香雪全麦鸡蛋面（200g）', '', null, '2.30', null, null, null, null, null, null, '', '袋', '实物', null, null, '2017-06-03', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000493', '蒂亚斯预调酒275ml/瓶①', '', null, '38.90', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2017-06-05', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000494', '九草王朝昆仑雪菊15g', '', null, '25.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2017-06-07', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000495', '510ml昆仑山雪山矿泉水', '', null, '4.10', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2017-06-11', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000496', '西麦特浓牛奶营养燕麦片700g', '', null, '26.80', null, null, null, null, null, null, '', '袋', '实物', null, null, '2017-06-23', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000497', '金燕窝牌燕窝桂圆味饮料①', '', null, '49.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2017-06-26', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000498', '金燕窝牌燕窝桂圆味饮料②', '', null, '49.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2017-06-26', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000499', '金燕窝牌燕窝荔枝味饮料①', '', null, '49.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2017-06-28', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000500', '金燕窝牌燕窝荔枝味饮料②', '', null, '49.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2017-06-28', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000501', '本草丝元发膜加试用装（180ml/瓶+25ml/瓶+25ml/瓶）①', '', null, '78.00', null, null, null, null, null, null, '', '份', '实物', null, null, '2017-06-30', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000502', '纽瑞滋新西兰原装进口全脂奶粉1000g', '', null, '138.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2017-06-30', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000503', '本草丝元发膜加试用装（180ml/瓶+25ml/瓶+25ml/瓶）②', '', null, '78.00', null, null, null, null, null, null, '', '份', '实物', null, null, '2017-06-30', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000504', '西麦红枣高铁营养燕麦片700g', '', null, '26.80', null, null, null, null, null, null, '', '袋', '实物', null, null, '2017-06-30', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000505', '宝鼎上海白醋（酿造），500ml', '', null, '4.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2017-06-30', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000506', '金燕窝牌燕窝红枣枸杞味饮料①', '', null, '49.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2017-07-01', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000507', '金燕窝牌燕窝红枣枸杞味饮料②', '', null, '49.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2017-07-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000508', '艾可起源护垫', '', null, '26.80', null, null, null, null, null, null, '', '盒', '实物', null, null, '2017-07-01', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000509', '防酸至臻克敏抗敏全效牙膏130克', '', null, '59.80', null, null, null, null, null, null, '', '支', '实物', null, null, '2017-07-05', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000510', '一日食燕麦周食装210g', '', null, '12.00', null, null, null, null, null, null, '', '包', '实物', null, null, '2017-07-07', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000511', '一日食荞麦周食装210g', '', null, '12.00', null, null, null, null, null, null, '', '包', '实物', null, null, '2017-07-07', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000512', '蒙古燕麦200g', '', null, '5.20', null, null, null, null, null, null, '', '包', '实物', null, null, '2017-07-07', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000513', '亚麻籽油250ml', '', null, '16.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2017-07-08', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000514', '利口健牙膏，20克', '', null, '2.00', null, null, null, null, null, null, '', '支', '实物', null, null, '2017-07-13', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000515', '艾可起源护垫（20片）①', '', null, '26.80', null, null, null, null, null, null, '', '盒', '实物', null, null, '2017-07-15', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000516', '贝佳斯柔丽卸妆啫喱118ml/瓶', '', null, '218.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2017-07-24', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000517', '姜健宝gingerpeople水晶姜糖190g/罐', '', null, '39.80', null, null, null, null, null, null, '', '罐', '实物', null, null, '2017-07-28', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000518', '兰维乐新西兰进口天然地下矿泉水10L', '', null, '73.00', null, null, null, null, null, null, '', '箱', '实物', null, null, '2017-07-28', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000519', '兰维乐新西兰进口天然地下矿泉水300ml', '', null, '8.20', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2017-07-28', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000520', '鸿香种蜂场大礼包', '', null, '108.00', null, null, null, null, null, null, '', '份', '实物', null, null, '2017-08-04', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000521', '曼吉磁贴(3片/包)', '', null, '25.90', null, null, null, null, null, null, '', '包', '实物', null, null, '2017-08-11', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000522', '350ml昆仑山雪山矿泉水', '', null, '4.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2017-08-16', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000523', '银坊蜂巢蜜65g', '', null, '59.00', null, null, null, null, null, null, '', '盒', '实物', null, null, '2017-08-19', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000524', '新疆黑蜂蜂蜜500克', '', null, '159.00', null, null, null, null, null, null, '', '罐', '实物', null, null, '2017-08-26', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000525', '林农特黑木耳200g①', '', null, '34.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2017-08-28', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000526', '林农特黑木耳200g②', '', null, '34.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2017-08-28', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000527', '林农特黑木耳200g③', '', null, '34.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2017-08-28', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000528', '纽瑞滋新西兰原装进口脱脂奶粉800g', '', null, '158.00', null, null, null, null, null, null, '', '罐', '实物', null, null, '2017-08-31', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000529', '纽瑞滋新西兰原装进口脱脂奶粉1000g', '', null, '138.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2017-08-31', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000530', '姜健宝gingerpeople浓缩糖姜汁237ml/瓶', '', null, '38.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2017-09-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000531', '娃哈哈桂圆莲子八宝粥360g', '', null, '3.70', null, null, null, null, null, null, '', '罐', '实物', null, null, '2017-09-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000532', '蓝白电子烟即抛型（烤烟型）', '', null, '29.00', null, null, null, null, null, null, '', '支', '实物', null, null, '2017-09-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000533', '蓝白电子烟即抛型（薄荷型）', '', null, '29.00', null, null, null, null, null, null, '', '支', '实物', null, null, '2017-09-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000534', '蓝白电子烟即抛型（烤烟型）①', '', null, '29.00', null, null, null, null, null, null, '', '支', '实物', null, null, '2017-09-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000535', '蓝白电子烟即抛型（薄荷型）①', '', null, '29.00', null, null, null, null, null, null, '', '支', '实物', null, null, '2017-09-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000536', '奇盛 手帕纸 QS-ZJ10 210*205mm/包', '', null, '0.60', null, null, null, null, null, null, '', '包', '实物', null, null, '2017-09-03', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000537', '奇盛 手帕纸 QS-ZJ10 210*205mm/包  一条十包', '', null, '2.00', null, null, null, null, null, null, '', '条', '实物', null, null, '2017-09-03', 'yesok', null, '梁吉', '', '梁吉', 'B');
INSERT INTO `sp_info` VALUES ('10000538', '1.23L昆仑山雪山矿泉水', '', null, '8.20', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2017-09-06', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000539', '太火鸟推荐锂电螺丝刀', '', null, '259.00', null, null, null, null, null, null, '', '个', '实物', null, null, '2017-09-10', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000540', '瑞砂沐浴乳盐', '', null, '28.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2017-09-11', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000541', 'FREYA面膜礼包', '', null, '92.00', null, null, null, null, null, null, '', '份', '实物', null, null, '2017-09-18', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000542', '瑞砂尤加利精油洗颜盐', '', null, '22.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2017-09-18', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000543', '上海药皂', '', null, '4.00', null, null, null, null, null, null, '', '块', '实物', null, null, '2017-09-23', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000544', '健康洗手液', '', null, '16.00', null, null, null, null, null, null, '', '支', '实物', null, null, '2017-10-08', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000545', '牛油果双重滋养手膜 30g', '', null, '0.00', null, null, null, null, null, null, '', '支', '实物', null, null, '2017-10-08', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000546', '农夫山泉 饮用天然水 550ml', '', null, '2.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2017-10-22', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000547', '美加净炭清新牙膏110g/支', '', null, '9.70', null, null, null, null, null, null, '', '支', '实物', null, null, '2017-10-26', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000548', '诗碟护手霜80g*2 ', '', null, '12.80', null, null, null, null, null, null, '', '套', '实物', null, null, '2017-10-28', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000549', '古方红糖 便携盒装 96g', '', null, '29.80', null, null, null, null, null, null, '', '盒', '实物', null, null, '2017-11-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000550', '古方红糖 罐装 180g', '', null, '49.00', null, null, null, null, null, null, '', '罐', '实物', null, null, '2017-11-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000551', '古方红糖 体验装 24g', '', null, '7.80', null, null, null, null, null, null, '', '袋', '实物', null, null, '2017-11-01', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000552', '植尚漱口水', '', null, '0.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2017-11-03', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000553', '艾可起源护垫（20片）', '', null, '26.80', null, null, null, null, null, null, '', '盒', '实物', null, null, '2017-11-09', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000554', '艾克起源日用卫生巾（12片）', '', null, '43.80', null, null, null, null, null, null, '', '盒', '实物', null, null, '2017-11-09', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000555', '艾克起源夜用卫生巾（5片）', '', null, '29.80', null, null, null, null, null, null, '', '盒', '实物', null, null, '2017-11-09', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000556', '皇室·艾蒂雅面膜', '', null, '73.60', null, null, null, null, null, null, '', '片', '实物', null, null, '2017-11-18', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000557', '菇盐固态复合调味料', '', null, '5.00', null, null, null, null, null, null, '', '包', '实物', null, null, '2017-12-01', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000558', '菇盐固态复合调味料①', '', null, '10.00', null, null, null, null, null, null, '', '包', '实物', null, null, '2017-12-01', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000559', '林农特猴头菇200g①', '', null, '40.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2017-12-03', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000560', '林农特猴头菇200g②', '', null, '40.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2017-12-03', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000561', '林农特猴头菇200g③', '', null, '40.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2017-12-03', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000562', '林农特滑子蘑200g①', '', null, '32.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2017-12-04', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000563', '林农特滑子蘑200g②', '', null, '32.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2017-12-04', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000564', '林农特滑子蘑200g③', '', null, '32.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2017-12-04', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000565', '上海药皂高级透明药皂45g', '', null, '2.50', null, null, null, null, null, null, '', '块', '实物', null, null, '2017-12-04', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000566', '林农特元蘑200g①', '', null, '52.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2017-12-05', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000567', '林农特元蘑200g②', '', null, '52.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2017-12-05', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000568', '林农特元蘑200g③', '', null, '52.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2017-12-05', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000569', '林农特榛蘑200g①', '', null, '38.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2017-12-06', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000570', '林农特榛蘑200g②', '', null, '38.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2017-12-06', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000571', '林农特榛蘑200g③', '', null, '38.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2017-12-06', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000572', '红石榴鲜活优氧洁面乳 100g', '', null, '85.00', null, null, null, null, null, null, '', '支', '实物', null, null, '2017-12-08', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000573', '新疆黑蜂蜂蜜100克', '', null, '29.90', null, null, null, null, null, null, '', '盒', '实物', null, null, '2017-12-12', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000574', '怡呈雪肌冰膜净含量25ml/片+怡呈活性肽鹿茸面膜25ml/片', '', null, '41.30', null, null, null, null, null, null, '', '片', '实物', null, null, '2017-12-23', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000575', '怡悦面膜两片', '', null, '68.00', null, null, null, null, null, null, '', '两片/袋', '实物', null, null, '2017-12-24', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000576', '云南白药薄荷牙膏加量装100g', '', null, '19.80', null, null, null, null, null, null, '', '支', '实物', null, null, '2017-12-28', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000577', '怡悦黑茶极致滋养面膜', '', null, '228.00', null, null, null, null, null, null, '', '6片/盒', '实物', null, null, '2017-12-29', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000578', '必胜客50元美食券', '', null, '50.00', null, null, null, null, null, null, '', '张', '服务', null, null, '2017-12-31', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000579', '奥妙无磷洗衣粉560g', '', null, '8.80', null, null, null, null, null, null, '', '袋', '实物', null, null, '2018-01-01', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000580', '牛家帮月卡', '', null, '450.00', null, null, null, null, null, null, '', '张', '服务', null, null, '2018-01-01', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000581', '特效牙膏', '', null, '3.50', null, null, null, null, null, null, '', '支', '实物', null, null, '2018-01-08', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000582', '悦宴-富贵喜悦佛跳墙290g', '', null, '258.00', null, null, null, null, null, null, '', '份', '实物', null, null, '2018-01-08', 'yesok', null, '梁吉', '', '梁吉', 'A+');
INSERT INTO `sp_info` VALUES ('10000583', '专业手部SPA套 30g*3', '', null, '68.00', null, null, null, null, null, null, '', '套', '实物', null, null, '2018-01-13', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000584', '艾可起源卫生巾', '', null, '7.80', null, null, null, null, null, null, '', '包', '实物', null, null, '2018-01-19', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000585', '克莉丝汀新生焕颜面膜（25ml）', '', null, '35.00', null, null, null, null, null, null, '', '片', '实物', null, null, '2018-02-04', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000586', '克莉丝汀玻尿酸EGF修复面膜（25ml）', '', null, '35.00', null, null, null, null, null, null, '', '片', '实物', null, null, '2018-02-04', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000587', '胶原蛋白弹力乳霜50g①', '', null, '76.00', null, null, null, null, null, null, '', '盒', '实物', null, null, '2018-02-26', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000588', '胶原蛋白弹力乳霜50g②', '', null, '76.00', null, null, null, null, null, null, '', '盒', '实物', null, null, '2018-02-26', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000589', '瞬时提升精华机理液 8ml', '', null, '45.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2018-03-02', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000590', '狮王牙龈护理套装', '', null, '15.00', null, null, null, null, null, null, '', '套', '实物', null, null, '2018-03-25', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000591', '花王 妙而舒婴幼儿纸尿裤 S 66片', '', null, '110.00', null, null, null, null, null, null, '', '包', '实物', null, null, '2018-03-25', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000592', '贵茶', '', null, '28.00', null, null, null, null, null, null, '', '包', '实物', null, null, '2018-03-30', 'yesok', null, '梁吉', '', '梁吉', 'C');
INSERT INTO `sp_info` VALUES ('10000593', '仁爱医院早早孕检测试纸（九号测试纸/笔型）', '', null, '39.00', null, null, null, null, null, null, '', '盒', '实物', null, null, '2018-04-02', 'yesok', null, '梁吉', '', '梁吉', 'B');
INSERT INTO `sp_info` VALUES ('10000594', '瑞砂丝蛋白美足浴盐', '', null, '36.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2018-04-09', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000595', '瑞砂森林泡泡浴盐', '', null, '42.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2018-04-22', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000596', '宝鼎醋精500ml', '', null, '8.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2018-04-30', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000597', '真洁丽 抽纸 CF-007 175mm*130mm*480(三层）', '', null, '3.00', null, null, null, null, null, null, '', '包', '实物', null, null, '2018-05-06', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000598', '荷荷巴密集补水倍润面膜 1*6p', '', null, '198.00', null, null, null, null, null, null, '', '盒', '实物', null, null, '2018-05-06', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000599', '奇盛抽纸 QS-ZJ20  200张', '', null, '3.00', null, null, null, null, null, null, '', '包', '实物', null, null, '2018-05-07', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000600', '真洁丽 抽纸 CF-007 480张', '', null, '3.00', null, null, null, null, null, null, '', '包', '实物', null, null, '2018-05-07', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000601', '真洁丽 抽纸 CF-007 480张①', '', null, '1.40', null, null, null, null, null, null, '', '包', '实物', null, null, '2018-05-07', 'yesok', null, '梁吉', '', '梁吉', 'B');
INSERT INTO `sp_info` VALUES ('10000602', '澳洲柯泰儿 尊贵滋养护手霜,50g/盒', '', null, '118.00', null, null, null, null, null, null, '', '盒', '实物', null, null, '2018-05-09', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000603', '澳洲柯泰儿 防护抗氧化保湿霜,45g/盒', '', null, '215.00', null, null, null, null, null, null, '', '盒', '实物', null, null, '2018-05-09', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000604', '魅清本草洗衣液（薰衣草香）2kg', '', null, '19.90', null, null, null, null, null, null, '', '袋', '实物', null, null, '2018-05-14', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000605', '魅清本草洗衣液（清新水莲）2kg', '', null, '19.90', null, null, null, null, null, null, '', '袋', '实物', null, null, '2018-05-14', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000606', '魔彩精灵蓝钻睫毛膏', '', null, '39.00', null, null, null, null, null, null, '', '支', '实物', null, null, '2018-05-17', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000607', '花王 妙而舒婴幼儿纸尿裤 XL 40片', '', null, '110.00', null, null, null, null, null, null, '', '包', '实物', null, null, '2018-05-26', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000608', '美即牛奶嫩滑润颜面膜5片装', '', null, '49.00', null, null, null, null, null, null, '', '盒', '实物', null, null, '2018-05-31', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000609', '蓝月亮深层洁净洗衣液(薰衣草)2KG', '', null, '33.50', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2018-06-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000610', '韩束面膜单片装', '', null, '29.00', null, null, null, null, null, null, '', '片', '实物', null, null, '2018-06-08', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000611', '五芳斋10元现金券', '', null, '10.00', null, null, null, null, null, null, '', '张', '服务', null, null, '2018-06-15', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000612', '心居客全新强力去污乳①', '', null, '30.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2018-06-15', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000613', '心居客全新强力去污乳②', '', null, '30.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2018-06-15', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000614', '雷允上香囊', '', null, '12.80', null, null, null, null, null, null, '', '个', '实物', null, null, '2018-06-16', 'yesok', null, '梁吉', '', '梁吉', 'B');
INSERT INTO `sp_info` VALUES ('10000615', '新雪肌系列-熏衣草洗发精350ml/瓶', '', null, '210.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2018-06-25', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000616', '新雪肌系列-草本润香润发乳(护发素)350ml/瓶', '', null, '180.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2018-06-25', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000617', '新雪肌系列-玫瑰花香洗发精350ml/瓶', '', null, '230.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2018-06-25', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000618', '新雪肌系列-凉味氨基酸洗发乳350ml/瓶', '', null, '200.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2018-06-25', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000619', '新雪肌系列-深层洁面卸妆乳150ml/瓶', '', null, '110.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2018-06-26', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000620', '新雪肌系列-葡萄籽秀发滋养液150ml/瓶', '', null, '150.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2018-06-26', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000621', '幽螺莎星牙膏', '', null, '15.00', null, null, null, null, null, null, '', '支', '实物', null, null, '2018-06-27', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000622', '蒂亚斯预调酒275ml/瓶', '', null, '12.80', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2018-06-28', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000623', '新雪肌系列-洗髮+護髮 (旅行組)60ml/瓶*2瓶', '', null, '55.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2018-06-29', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000624', '营养保湿洗发水(红石榴精华)400ml', '', null, '49.90', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2018-06-30', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000625', '亮丽保湿造型弹力素(红石榴)200ml', '', null, '24.90', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2018-06-30', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000626', '红石榴营养润手霜60g', '', null, '16.80', null, null, null, null, null, null, '', '支', '实物', null, null, '2018-06-30', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000627', 'Denise护手霜3支装礼盒60g*3', '', null, '49.00', null, null, null, null, null, null, '', '盒', '实物', null, null, '2018-06-30', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000628', '手部及身体护理精华（橄榄精油配方）100g', '', null, '24.90', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2018-06-30', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000629', '防干防裂护足霜[橄榄精油]100g', '', null, '19.90', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2018-06-30', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000630', '橄榄美体润肤精华乳(升级版)370ml', '', null, '32.90', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2018-06-30', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000631', '嘉优宝消除有害气体片', '', null, '25.00', null, null, null, null, null, null, '', '盒', '实物', null, null, '2018-07-01', 'yesok', null, '梁吉', '', '梁吉', 'B');
INSERT INTO `sp_info` VALUES ('10000632', '怡呈黑钻晶膜净含量25ml/片', '', null, '38.00', null, null, null, null, null, null, '', '片', '实物', null, null, '2018-07-13', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000633', '心居客深层洁净洗衣液2L', '', null, '30.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2018-07-15', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000634', '防脱育发香波55g', '', null, '12.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2018-07-16', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000635', '防脱育发香波55g①', '', null, '12.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2018-07-16', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000636', '劲活酷男肌亮派（20ml+20ml)', '', null, '20.00', null, null, null, null, null, null, '', '盒', '实物', null, null, '2018-07-17', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000637', '百变亲肌芦荟胶（80g）', '', null, '98.00', null, null, null, null, null, null, '', '支', '实物', null, null, '2018-07-17', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000638', '亲肌语亲肌润颜细致毛孔洁面乳，100g', '', null, '68.00', null, null, null, null, null, null, '', '支', '实物', null, null, '2018-07-17', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000639', '女士防脱育发1+1套组', '', null, '128.00', null, null, null, null, null, null, '', '套', '实物', null, null, '2018-07-17', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000640', '修正抗敏健白牙膏120g', '', null, '29.90', null, null, null, null, null, null, '', '支', '实物', null, null, '2018-07-19', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000641', '修正牛黄牙膏120g', '', null, '19.80', null, null, null, null, null, null, '', '支', '实物', null, null, '2018-07-19', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000642', '六神清爽沐浴露200ml', '', null, '8.60', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2018-07-21', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000643', '修正孕产特护牙膏100g', '', null, '33.80', null, null, null, null, null, null, '', '支', '实物', null, null, '2018-07-24', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000644', '花王 妙而舒婴幼儿纸尿裤 M 57片', '', null, '110.00', null, null, null, null, null, null, '', '包', '实物', null, null, '2018-07-31', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000645', '仁爱医院早早孕检测试纸（好运测试纸/笔型）', '', null, '39.00', null, null, null, null, null, null, '', '盒', '实物', null, null, '2018-08-02', 'yesok', null, '梁吉', '', '梁吉', 'B');
INSERT INTO `sp_info` VALUES ('10000646', '舒肤佳薰衣草香皂115g*3盒', '', null, '7.74', null, null, null, null, null, null, '', '份', '实物', null, null, '2018-08-02', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000647', '泉林本色卫生卷纸 HK130 105g/娟', '', null, '24.90', null, null, null, null, null, null, '', '包', '实物', null, null, '2018-08-03', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000648', '花王 妙而舒婴幼儿纸尿裤 L 48片', '', null, '110.00', null, null, null, null, null, null, '', '包', '实物', null, null, '2018-08-03', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000649', '扇牌檀香皂液旅行装80g', '', null, '5.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2018-08-10', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000650', '修正防护健齿牙膏80g', '', null, '24.80', null, null, null, null, null, null, '', '支', '实物', null, null, '2018-08-20', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000651', '粉色奇迹香水沐浴露55g', '', null, '3.60', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2018-08-26', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000652', '修正牛黄牙膏70g+10g', '', null, '12.80', null, null, null, null, null, null, '', '支', '实物', null, null, '2018-08-30', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000653', '修正儿童草莓味牙膏55g', '', null, '12.80', null, null, null, null, null, null, '', '支', '实物', null, null, '2018-08-30', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000654', '修正儿童苹果味牙膏55g', '', null, '12.80', null, null, null, null, null, null, '', '支', '实物', null, null, '2018-08-30', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000655', '修正修复去渍牙膏80g', '', null, '20.80', null, null, null, null, null, null, '', '支', '实物', null, null, '2018-08-30', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000656', '修正维生素牙膏120g', '', null, '19.80', null, null, null, null, null, null, '', '支', '实物', null, null, '2018-08-31', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000657', '修正修复去渍牙膏120g', '', null, '29.90', null, null, null, null, null, null, '', '支', '实物', null, null, '2018-08-31', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000658', '修正中老年特护牙膏100g', '', null, '23.80', null, null, null, null, null, null, '', '支', '实物', null, null, '2018-08-31', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000659', '修正溶菌酶牙膏120g', '', null, '23.80', null, null, null, null, null, null, '', '支', '实物', null, null, '2018-08-31', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000660', '艾霏臻颜亮彩膜力水', '', null, '35.00', null, null, null, null, null, null, '', '瓶/20ml', '实物', null, null, '2018-09-01', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000661', '澳洲柯泰儿美肤包（羊奶蜂蜜冷制皂,5g+尊贵滋养护手霜,5g+防护抗氧化保湿霜,5g）', '', null, '48.00', null, null, null, null, null, null, '', '套', '实物', null, null, '2018-09-01', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000662', '美即海洋冰泉补水面膜5片装', '', null, '49.00', null, null, null, null, null, null, '', '盒', '实物', null, null, '2018-09-07', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000663', '智强 核桃世家 核桃蛋白饮料核桃乳（二级A型） 240ml', '', null, '5.60', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2018-09-14', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000664', '根源头皮养护1+1套组', '', null, '118.00', null, null, null, null, null, null, '', '套', '实物', null, null, '2018-09-17', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000665', '泉林本色 秸杆面巾纸 HR170* 140*188mm ', '', null, '12.90', null, null, null, null, null, null, '', '包', '实物', null, null, '2018-09-21', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000666', '蓝色迷恋香水沐浴露55g', '', null, '3.60', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2018-09-23', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000667', '来伊份20元储值卡', '', null, '20.00', null, null, null, null, null, null, '', '张', '服务', null, null, '2018-10-08', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000668', '美肌洗手液（橄榄）500ml', '', null, '19.90', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2018-10-12', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000669', '美肌洗手液（红石榴）500ml', '', null, '19.90', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2018-10-12', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000670', '修正儿茶素牙膏120g', '', null, '19.80', null, null, null, null, null, null, '', '支', '实物', null, null, '2018-10-12', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000671', '范思哲t恤', '', null, '0.00', null, null, null, null, null, null, '', '件', '实物', null, null, '2018-10-16', 'yesok', null, '梁吉', '', '梁吉', 'A+');
INSERT INTO `sp_info` VALUES ('10000672', '修正维生素牙膏70g+10g', '', null, '12.80', null, null, null, null, null, null, '', '支', '实物', null, null, '2018-10-27', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000673', '真洁丽 清香纸手帕 210*205mm/包', '', null, '0.60', null, null, null, null, null, null, '', '包', '实物', null, null, '2018-11-02', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000674', '真洁丽 手帕纸 QS-ZJ10 210*205mm/包', '', null, '0.60', null, null, null, null, null, null, '', '包', '实物', null, null, '2018-11-02', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000675', '和睦家居homeyhome冬日女士拖鞋一双，均码38码', '', null, '39.00', null, null, null, null, null, null, '', '双', '实物', null, null, '2018-11-09', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000676', '洁齿康蜂胶牙膏天然薄荷香，105g', '', null, '17.80', null, null, null, null, null, null, '', '支', '实物', null, null, '2019-01-04', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000677', '诺丝茉莉花香避孕套（12片装）', '', null, '28.00', null, null, null, null, null, null, '', '盒', '实物', null, null, '2019-04-01', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000678', '威露士全效洗衣液500ml/袋', '', null, '19.80', null, null, null, null, null, null, '', '袋', '实物', null, null, '2019-04-08', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000679', '艾兰得维C含片①', '', null, '159.00', null, null, null, null, null, null, '', '盒', '实物', null, null, '2019-10-14', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000680', '艾兰得维C含片②', '', null, '159.00', null, null, null, null, null, null, '', '盒', '实物', null, null, '2019-10-14', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000681', '兰维乐新西兰原产地原装进口麦卢卡manuka蜂蜜纯天然UMF6+ 250g', '', null, '98.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2019-12-22', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000682', '兰维乐新西兰原产地原装进口麦卢卡manuka蜂蜜纯天然UMF6+ 500g', '', null, '158.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2019-12-22', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000683', '兰维乐新西兰原产地原装进口麦卢卡manuka蜂蜜纯天然UMF6+ 1KG', '', null, '288.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2019-12-22', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000684', '兰维乐新西兰原产地原装进口麦卢卡manuka蜂蜜纯天然UMF10+ 250g', '', null, '148.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2019-12-22', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000685', '兰维乐新西兰原产地原装进口麦卢卡manuka蜂蜜纯天然UMF10+ 1KG', '', null, '488.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2019-12-22', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000686', '兰维乐新西兰原产地原装进口麦卢卡manuka蜂蜜纯天然UMF15+ 250g', '', null, '258.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2019-12-22', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000687', '兰维乐新西兰原产地原装进口麦卢卡manuka蜂蜜纯天然UMF20+ 250g', '', null, '899.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2019-12-22', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000688', '兰维乐新西兰原产地原装进口百花蜂蜜纯天然野生 500g', '', null, '88.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2019-12-23', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000689', '杰士邦零感Zero/Skyn(3只装)', '', null, '50.00', null, null, null, null, null, null, '', '盒', '实物', null, null, '2020-01-01', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000690', '魅清洗衣机槽清洁剂', '', null, '8.00', null, null, null, null, null, null, '', '袋', '实物', null, null, '2020-01-05', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000691', '诺丝白金零距离3片装', '', null, '27.80', null, null, null, null, null, null, '', '盒', '实物', null, null, '2020-02-01', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000692', '诺丝超薄平面装6个装', '', null, '15.00', null, null, null, null, null, null, '', '盒', '实物', null, null, '2020-02-01', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000693', '桑葚100%原汁干红(保健级）\n100ml', '', null, '50.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2020-03-25', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000694', '爱之湾莫斯卡托桃红甜起泡葡萄酒，750ml', '', null, '79.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2020-05-13', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000695', '东吉黄(水果黄酒）500ml', '', null, '68.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2020-06-25', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000696', '冰桔酒100%柑橘纯酿（清盈型）500ml', '', null, '68.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2020-06-25', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000697', '金果梨酒\n500ml', '', null, '78.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2020-06-25', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000698', '东吉黄(水果黄酒）500ml①', '', null, '68.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2020-06-25', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000699', '冰桔酒100%柑橘纯酿（清盈型）500ml①', '', null, '68.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2020-06-25', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000700', '东吉黄(水果黄酒）500ml②', '', null, '68.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2020-06-25', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000701', '冰桔酒100%柑橘纯酿（清盈型）500ml②', '', null, '68.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2020-06-25', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000702', '唐宋天禧黄酒480ml①', '', null, '28.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2020-09-13', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000703', '唐宋天禧黄酒480ml②', '', null, '28.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2020-09-13', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000704', '六块砖清香垃圾袋30只装①', '', null, '9.80', null, null, null, null, null, null, '', '盒', '实物', null, null, '2020-10-01', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000705', '六块砖清香垃圾袋30只装②', '', null, '9.80', null, null, null, null, null, null, '', '盒', '实物', null, null, '2020-10-01', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000706', '尚岛宜家中国风纸杯（50只）', '', null, '11.80', null, null, null, null, null, null, '', '袋', '实物', null, null, '2020-12-31', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000707', '尚岛宜家厨卫专用垃圾袋（24只）', '', null, '10.80', null, null, null, null, null, null, '', '卷', '实物', null, null, '2020-12-31', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000708', '尚岛宜家保鲜膜（超值装）', '', null, '12.50', null, null, null, null, null, null, '', '卷', '实物', null, null, '2020-12-31', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000709', '尚岛宜家舒柔洗碗巾（3片装印花）', '', null, '12.80', null, null, null, null, null, null, '', '袋', '实物', null, null, '2020-12-31', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000710', '尚岛宜家绒里手套（耐久型）', '', null, '8.90', null, null, null, null, null, null, '', '双', '实物', null, null, '2020-12-31', 'yesok', null, '梁吉', '', '梁吉', 'B');
INSERT INTO `sp_info` VALUES ('10000711', '尚岛宜家百洁布（2片装）', '', null, '8.90', null, null, null, null, null, null, '', '袋', '实物', null, null, '2020-12-31', 'yesok', null, '梁吉', '', '梁吉', 'B');
INSERT INTO `sp_info` VALUES ('10000712', '星得斯智利原瓶进口五星蓝瓶干红葡萄酒梅洛750ml', '', null, '329.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2022-01-01', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000713', '迷恋草莓果味起泡酒750ml', '', null, '140.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2022-10-13', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000714', '星得斯智利原瓶进口三星红瓶干红葡萄酒赤霞珠750ml', '', null, '190.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2023-01-03', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000715', '凯奇瓦酒庄赤霞珠干红葡萄酒，750ml', '', null, '60.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2024-04-11', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000716', '洛思客南极马尔贝克干红葡萄酒750ml', '', null, '118.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2024-08-12', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000717', '天下福150ml', '', null, '20.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2025-03-19', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000718', '凯奇瓦酒庄美乐干红葡萄酒，750ml', '', null, '55.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2025-06-15', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000719', '法国埃莱特酒庄干红750ml', '', null, '158.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2025-08-19', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000720', '天下福（福运）500ml', '', null, '18.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2025-09-24', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000721', '天下福（福庆）500ml', '', null, '48.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '2025-11-20', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000722', 'LOS REYES红葡萄酒', '', null, '40.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000723', '康美健身周卡（广灵店）', '', null, '300.00', null, null, null, null, null, null, '', '张', '服务', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'B');
INSERT INTO `sp_info` VALUES ('10000724', '康美健身周卡（曲阳店）', '', null, '300.00', null, null, null, null, null, null, '', '张', '服务', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'B');
INSERT INTO `sp_info` VALUES ('10000725', '果季名会水果预约券', '', null, '15.00', null, null, null, null, null, null, '', '张', '服务', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000726', '爱情湾美容卡', '', null, '1000.00', null, null, null, null, null, null, '', '张', '服务', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'C');
INSERT INTO `sp_info` VALUES ('10000727', '防蓝光护眼LED灯泡，5W，电压220V-50Hz', '', null, '18.50', null, null, null, null, null, null, '', '个', '实物', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000728', '家政在线便携式电子冷热箱', '', null, '280.00', null, null, null, null, null, null, '', '台', '实物', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000729', '小石榴星座挂件', '', null, '3.30', null, null, null, null, null, null, '', '个', '实物', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', 'B');
INSERT INTO `sp_info` VALUES ('10000730', '好慷七彩布（7条/包）', '', null, '99.00', null, null, null, null, null, null, '', '包', '实物', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000731', '纸箱（53cm*29cm*23cm)', '', null, '0.00', null, null, null, null, null, null, '', '个', '实物', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000732', '达良优品女士蕾丝连衣裙', '', null, '598.00', null, null, null, null, null, null, '', '件', '实物', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'A+');
INSERT INTO `sp_info` VALUES ('10000733', '恒立50cm*25cm毛巾', '', null, '5.00', null, null, null, null, null, null, '', '条', '实物', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000734', '米仔玉米儿童餐具', '', null, '178.00', null, null, null, null, null, null, '', '套', '实物', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000735', '悠哉公仔', '', null, '20.00', null, null, null, null, null, null, '', '个', '实物', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'A+');
INSERT INTO `sp_info` VALUES ('10000736', '德奥通', '', null, '0.00', null, null, null, null, null, null, '', '本', '实物', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000737', '宝矿力水特侧袋', '', null, '15.00', null, null, null, null, null, null, '', '个', '实物', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', 'B');
INSERT INTO `sp_info` VALUES ('10000738', '净邻抽油烟机精洗礼券50元', '', null, '50.00', null, null, null, null, null, null, '', '张', '服务', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000739', '乐视TV·超级电视S40 Air L全配版', '', null, '2079.00', null, null, null, null, null, null, '', '台', '实物', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', 'A+');
INSERT INTO `sp_info` VALUES ('10000740', '哆啦A梦手办', '', null, '50.00', null, null, null, null, null, null, '', '个', '实物', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', 'A+');
INSERT INTO `sp_info` VALUES ('10000741', '小号纸箱', '', null, '0.00', null, null, null, null, null, null, '', '个', '实物', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000742', '大号纸箱', '', null, '0.00', null, null, null, null, null, null, '', '个', '实物', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000743', '米老鼠书包', '', null, '38.00', null, null, null, null, null, null, '', '个', '实物', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000744', '少儿文学名家珍藏册', '', null, '10.00', null, null, null, null, null, null, '', '本', '实物', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', 'B');
INSERT INTO `sp_info` VALUES ('10000745', '玉薇蛋糕代金券（联票、共四张面值为10元、20元、30元、50元', '', null, '110.00', null, null, null, null, null, null, '', '张', '服务', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000746', '中号纸箱', '', null, '0.00', null, null, null, null, null, null, '', '个', '实物', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000747', '精美挂坠', '', null, '88.00', null, null, null, null, null, null, '', '个', '实物', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000748', '精美相框+摄影套餐', '', null, '888.00', null, null, null, null, null, null, '', '套', '实物', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', 'B');
INSERT INTO `sp_info` VALUES ('10000749', '武夷岩茶大红袍茶（茶砖）', '', null, '300.00', null, null, null, null, null, null, '', '包', '实物', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000750', '兰馨冰丝藤草席三件套', '', null, '75.00', null, null, null, null, null, null, '', '套', '实物', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000751', 'WELL BERT钻石玻璃果碗六件套', '', null, '49.00', null, null, null, null, null, null, '', '套', '实物', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000752', '撕名牌马夹', '', null, '10.00', null, null, null, null, null, null, '', '件', '实物', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000753', '维科舒柔安睡枕', '', null, '139.00', null, null, null, null, null, null, '', '个', '实物', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000754', '西班牙花冠干红葡萄酒', '', null, '188.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000755', 'TOTO花洒DM706CMF', '', null, '182.00', null, null, null, null, null, null, '', '个', '实物', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000756', 'TOTO卫洗丽TCL643ICS', '', null, '2380.00', null, null, null, null, null, null, '', '个', '实物', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', 'A+');
INSERT INTO `sp_info` VALUES ('10000757', '西班牙戈林-嘉悦起泡酒', '', null, '198.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000758', '威宝龙锦上添花6件组合杯', '', null, '198.00', null, null, null, null, null, null, '', '套', '实物', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000759', '米欧厨房四件套套刀', '', null, '118.00', null, null, null, null, null, null, '', '套', '实物', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000760', '小杰家纺', '', null, '78.00', null, null, null, null, null, null, '', '份', '实物', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000761', '百家益腕表式激光治疗仪，HA-02旗舰款', '', null, '3339.00', null, null, null, null, null, null, '', '个', '实物', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000762', '佳美口腔手提袋', '', null, '2.00', null, null, null, null, null, null, '', '只', '实物', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', 'B');
INSERT INTO `sp_info` VALUES ('10000763', '安睡宝新羽高弹枕芯', '', null, '45.00', null, null, null, null, null, null, '', '个', '实物', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000764', '实惠logo红包', '', null, '0.80', null, null, null, null, null, null, '', '只', '实物', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', 'B');
INSERT INTO `sp_info` VALUES ('10000765', 'FAMA 个性化定制避孕套', '', null, '12.00', null, null, null, null, null, null, '', '套', '实物', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', 'C');
INSERT INTO `sp_info` VALUES ('10000766', '齿科医院专用牙刷', '', null, '19.00', null, null, null, null, null, null, '', '支', '实物', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000767', '磁性暖靴（男）', '', null, '388.00', null, null, null, null, null, null, '', '双', '实物', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', 'A+');
INSERT INTO `sp_info` VALUES ('10000768', '老掉牙珠宝（手链，货号6594612，价值1680元）', '', null, '1680.00', null, null, null, null, null, null, '', '条', '实物', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000769', '黄金月饼', '', null, '450.00', null, null, null, null, null, null, '', '个', '实物', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000770', 'MOTION STRIKER 121 音箱臂包', '', null, '0.00', null, null, null, null, null, null, '', '个', '实物', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000771', '便携式折叠音箱', '', null, '0.00', null, null, null, null, null, null, '', '个', '实物', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000772', '老掉牙珠宝（项链，货号6594678，价值2680元）', '', null, '2680.00', null, null, null, null, null, null, '', '条', '实物', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000773', '维暖男士内衣', '', null, '518.00', null, null, null, null, null, null, '', '套', '实物', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', 'A+');
INSERT INTO `sp_info` VALUES ('10000774', '阳光 五金渠道专用节能台灯', '', null, '199.00', null, null, null, null, null, null, '', '个', '实物', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000775', 'RICO睿珂 ST000088 5.3CT 欧珀 （价值39900元）', '', null, '39900.00', null, null, null, null, null, null, '', '颗', '实物', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', 'A+');
INSERT INTO `sp_info` VALUES ('10000776', '新奢皮具护理卡（价值500元）', '', null, '500.00', null, null, null, null, null, null, '', '张', '服务', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', 'C');
INSERT INTO `sp_info` VALUES ('10000777', '新奢皮具护理卡（价值1000元）', '', null, '1000.00', null, null, null, null, null, null, '', '张', '服务', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', 'C');
INSERT INTO `sp_info` VALUES ('10000778', '摩尔口腔', '', null, '1999.00', null, null, null, null, null, null, '', '张', '服务', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', 'B');
INSERT INTO `sp_info` VALUES ('10000779', '依波表 50070312 男款 （价值2480元）', '', null, '2480.00', null, null, null, null, null, null, '', '块', '实物', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', 'A+');
INSERT INTO `sp_info` VALUES ('10000780', 'RICO睿珂 18K金蓝宝石戒指', '', null, '36800.00', null, null, null, null, null, null, '', '枚', '实物', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', 'A+');
INSERT INTO `sp_info` VALUES ('10000781', 'RICO睿珂 ST000055 2.170CT 欧珀', '', null, '19900.00', null, null, null, null, null, null, '', '颗', '实物', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', 'A+');
INSERT INTO `sp_info` VALUES ('10000782', '天然蓝珀 19800', '', null, '19800.00', null, null, null, null, null, null, '', '颗', '实物', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', 'A+');
INSERT INTO `sp_info` VALUES ('10000783', '天然蓝珀 29800', '', null, '29800.00', null, null, null, null, null, null, '', '颗', '实物', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', 'A+');
INSERT INTO `sp_info` VALUES ('10000784', '欧迪芬女式保暖内衣', '', null, '329.00', null, null, null, null, null, null, '', '套', '实物', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', 'A+');
INSERT INTO `sp_info` VALUES ('10000785', '恒源祥围巾', '', null, '300.00', null, null, null, null, null, null, '', '条', '实物', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', 'A+');
INSERT INTO `sp_info` VALUES ('10000786', '空气甲醛自测盒', '', null, '20.00', null, null, null, null, null, null, '', '盒', '实物', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'B');
INSERT INTO `sp_info` VALUES ('10000787', '它时代宠物期刊杂志', '', null, '10.00', null, null, null, null, null, null, '', '本', '实物', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000788', '法国佩瑞酒庄欧曼蒂干红葡萄酒（750ml）', '', null, '1280.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000789', 'BT蓝牙智能测温器（含测温贴*1）', '', null, '498.00', null, null, null, null, null, null, '', '个', '实物', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'A+');
INSERT INTO `sp_info` VALUES ('10000790', '蓝牙智能体温帖*1片', '', null, '198.00', null, null, null, null, null, null, '', '片', '实物', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000791', 'TCL无线鼠标', '', null, '50.00', null, null, null, null, null, null, '', '个', '实物', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000792', '防蓝光护眼LED灯泡（3瓦）', '', null, '6.00', null, null, null, null, null, null, '', '份', '实物', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000793', '安易客50元现金券', '', null, '50.00', null, null, null, null, null, null, '', '张', '服务', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000794', '优艾贝婴儿游泳馆SPA券', '', null, '158.00', null, null, null, null, null, null, '', '张', '服务', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'B');
INSERT INTO `sp_info` VALUES ('10000795', '斑马鱼超滤净水机领取券', '', null, '1280.00', null, null, null, null, null, null, '', '张', '服务', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'A+');
INSERT INTO `sp_info` VALUES ('10000796', '美妍汉方美容护理三选一（卡券）', '', null, '300.00', null, null, null, null, null, null, '', '张', '服务', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'C');
INSERT INTO `sp_info` VALUES ('10000797', '兰的SPA美容馆贵宾卡', '', null, '980.00', null, null, null, null, null, null, '', '张', '服务', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'C');
INSERT INTO `sp_info` VALUES ('10000798', '无限极中草养生馆刮痧券', '', null, '68.00', null, null, null, null, null, null, '', '张', '服务', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'C');
INSERT INTO `sp_info` VALUES ('10000799', '艾薇丽原生态有机葡萄（卡券兑换有机葡萄*2串2.5斤-3斤）', '', null, '50.00', null, null, null, null, null, null, '', '张', '服务', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'A+');
INSERT INTO `sp_info` VALUES ('10000800', '星钻拼装玩具一份', '', null, '20.00', null, null, null, null, null, null, '', '份', '实物', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'A+');
INSERT INTO `sp_info` VALUES ('10000801', '克丽缇娜1000元现金卡', '', null, '100.00', null, null, null, null, null, null, '', '张', '服务', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', 'C');
INSERT INTO `sp_info` VALUES ('10000802', '智慧洗车代金券（30元、38元）', '', null, '68.00', null, null, null, null, null, null, '', '张', '服务', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'B');
INSERT INTO `sp_info` VALUES ('10000803', '一骑洗车上门洗车代金券（价值79元，含一次免费清洗+60元洗车红包）', '', null, '79.00', null, null, null, null, null, null, '', '张', '服务', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'C');
INSERT INTO `sp_info` VALUES ('10000804', '乐博士拼装积木', '', null, '26.00', null, null, null, null, null, null, '', '盒', '实物', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'A+');
INSERT INTO `sp_info` VALUES ('10000805', '人民金行现金100元抵用券', '', null, '100.00', null, null, null, null, null, null, '', '张', '服务', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', 'C');
INSERT INTO `sp_info` VALUES ('10000806', '芦花鸡蛋兑换券', '', null, '10.00', null, null, null, null, null, null, '', '张', '服务', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000807', '韩城跆拳道双月卡', '', null, '400.00', null, null, null, null, null, null, '', '张', '服务', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000808', '课程体验券（MTSR早教创造未来）', '', null, '600.00', null, null, null, null, null, null, '', '张', '服务', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'C');
INSERT INTO `sp_info` VALUES ('10000809', '依霖美丽定制贵宾卡', '', null, '1380.00', null, null, null, null, null, null, '', '张', '服务', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'C');
INSERT INTO `sp_info` VALUES ('10000810', '启德签字笔', '', null, '3.30', null, null, null, null, null, null, '', '支', '实物', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000811', '瑜伽礼包（200元景梵瑜伽体验卡+680元梦想感受卡）', '', null, '880.00', null, null, null, null, null, null, '', '张', '服务', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'C');
INSERT INTO `sp_info` VALUES ('10000812', '联合货币折叠伞', '', null, '25.00', null, null, null, null, null, null, '', '把', '实物', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000813', '干洗客洗衣券', '', null, '20.00', null, null, null, null, null, null, '', '张', '服务', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'B');
INSERT INTO `sp_info` VALUES ('10000814', '厨房万能擦巾', '', null, '10.00', null, null, null, null, null, null, '', '个', '实物', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000815', '洗洗免费洗衣体验卡', '', null, '20.00', null, null, null, null, null, null, '', '张', '服务', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'B');
INSERT INTO `sp_info` VALUES ('10000816', '佳美口腔尊享体验卡', '', null, '450.00', null, null, null, null, null, null, '', '张', '服务', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'B');
INSERT INTO `sp_info` VALUES ('10000817', '一骑洗车免费上门洗车券（价值76元，含四次清洗）', '', null, '76.00', null, null, null, null, null, null, '', '张', '服务', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'B');
INSERT INTO `sp_info` VALUES ('10000818', '脑立方课程券', '', null, '1680.00', null, null, null, null, null, null, '', '张', '服务', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'C');
INSERT INTO `sp_info` VALUES ('10000819', '尚屹功夫月卡券', '', null, '880.00', null, null, null, null, null, null, '', '张', '服务', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000820', '水果刨刀', '', null, '6.80', null, null, null, null, null, null, '', '个', '实物', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', 'B');
INSERT INTO `sp_info` VALUES ('10000821', '粉红色冰淇淋机（68552-CN）', '', null, '269.00', null, null, null, null, null, null, '', '台', '实物', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000822', '素写形象剪发抵用券', '', null, '68.00', null, null, null, null, null, null, '', '张', '服务', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'B');
INSERT INTO `sp_info` VALUES ('10000823', '上海陶瓷科技艺术馆门票30元参观券', '', null, '30.00', null, null, null, null, null, null, '', '张', '服务', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000824', '碧然之家50元现金券', '', null, '50.00', null, null, null, null, null, null, '', '张', '服务', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000825', '妇科体检卡', '', null, '297.00', null, null, null, null, null, null, '', '张', '服务', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', 'B');
INSERT INTO `sp_info` VALUES ('10000826', '优悠限量体验卡（首单0元）', '', null, '30.00', null, null, null, null, null, null, '', '张', '服务', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000827', '美丽直达毛绒娃娃', '', null, '15.00', null, null, null, null, null, null, '', '只', '实物', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000828', '日置名媛VIP卡', '', null, '2000.00', null, null, null, null, null, null, '', '张', '服务', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'C');
INSERT INTO `sp_info` VALUES ('10000829', '三致教育课程体验券', '', null, '800.00', null, null, null, null, null, null, '', '张', '服务', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'C');
INSERT INTO `sp_info` VALUES ('10000830', '精锐1对1长宁天山校区精锐1对1VIP卡', '', null, '3037.00', null, null, null, null, null, null, '', '张', '服务', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'C');
INSERT INTO `sp_info` VALUES ('10000831', '佳园装潢餐具', '', null, '20.00', null, null, null, null, null, null, '', '盒', '实物', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000832', '优家画报', '', null, '5.00', null, null, null, null, null, null, '', '张', '实物', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000833', '精品老花镜', '', null, '59.00', null, null, null, null, null, null, '', '副', '实物', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000834', '易存网紫水晶手链2A，8mm，2串/份', '', null, '216.00', null, null, null, null, null, null, '', '份', '实物', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000835', '时尚多彩靠垫', '', null, '68.00', null, null, null, null, null, null, '', '份', '实物', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000836', '巴拉巴拉棒球帽①', '', null, '59.00', null, null, null, null, null, null, '', '顶', '实物', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000837', '巴拉巴拉棒球帽②', '', null, '79.00', null, null, null, null, null, null, '', '顶', '实物', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000838', '巴拉巴拉草帽', '', null, '99.00', null, null, null, null, null, null, '', '顶', '实物', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000839', '厨房二只装', '', null, '55.00', null, null, null, null, null, null, '', '盒', '实物', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000840', 'FROZZYPACK冰饭盒', '', null, '40.00', null, null, null, null, null, null, '', '个', '实物', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000841', '永春牌包芯丝连裤袜', '', null, '12.80', null, null, null, null, null, null, '', '包', '实物', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'B');
INSERT INTO `sp_info` VALUES ('10000842', '中国劲酒', '', null, '20.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000843', '耐飞利好易拍切碎器一台，型号KCM-S02Z', '', null, '30.00', null, null, null, null, null, null, '', '台', '实物', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000844', '澳琳达心型首饰盒', '', null, '15.00', null, null, null, null, null, null, '', '个', '实物', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000845', '澳琳达餐具三件套', '', null, '20.00', null, null, null, null, null, null, '', '套', '实物', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000846', '澳琳达餐具三件套①', '', null, '20.00', null, null, null, null, null, null, '', '套', '实物', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000847', '拓扑工厂礼包（百洁布）①', '', null, '12.00', null, null, null, null, null, null, '', '包', '实物', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000848', '蒂娜丝包芯丝连裤袜一双', '', null, '4.85', null, null, null, null, null, null, '', '双', '实物', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000849', '蒂娜丝天鹅绒加档连裤袜一双', '', null, '9.50', null, null, null, null, null, null, '', '双', '实物', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000850', '加美娜特厚天鹅绒连裤袜一双', '', null, '13.50', null, null, null, null, null, null, '', '双', '实物', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000851', '加美娜加档超值包芯丝连裤袜一双', '', null, '8.55', null, null, null, null, null, null, '', '双', '实物', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000852', '鳄鱼麻棉男袜一双', '', null, '7.20', null, null, null, null, null, null, '', '双', '实物', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000853', '鳄鱼精梳棉男袜一双', '', null, '7.20', null, null, null, null, null, null, '', '双', '实物', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000854', '尼达利竹香枕50*30*20cm②', '', null, '89.90', null, null, null, null, null, null, '', '个', '实物', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000855', '馨莎国际枕头芯①', '', null, '30.00', null, null, null, null, null, null, '', '个', '实物', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000856', '沁茗阁典藏陈年普洱茶150g', '', null, '248.00', null, null, null, null, null, null, '', '包', '实物', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000857', '甫田环保袋', '', null, '5.00', null, null, null, null, null, null, '', '个', '实物', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'B');
INSERT INTO `sp_info` VALUES ('10000858', '尼达利竹香枕50*30*20cm③', '', null, '89.90', null, null, null, null, null, null, '', '个', '实物', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000859', '卖客疯玻璃杯', '', null, '10.00', null, null, null, null, null, null, '', '个', '实物', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000860', '彪马运动袜 均码（23-25cm）', '', null, '39.00', null, null, null, null, null, null, '', '双', '实物', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', '');
INSERT INTO `sp_info` VALUES ('10000861', '金蛋', '', null, '100.00', null, null, null, null, null, null, '', '个', '实物', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000862', '修正牌牙刷一支', '', null, '5.00', null, null, null, null, null, null, '', '支', '实物', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000863', '壹嫂网络 百洁布', '', null, '2.50', null, null, null, null, null, null, '', '条', '实物', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'B');
INSERT INTO `sp_info` VALUES ('10000864', '任性英雄正版人物手办', '', null, '378.00', null, null, null, null, null, null, '', '个', '实物', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', 'A+');
INSERT INTO `sp_info` VALUES ('10000865', '托玛琳健康除臭袜', '', null, '59.00', null, null, null, null, null, null, '', '双', '实物', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000866', '爱心小熊公仔笔一对', '', null, '30.00', null, null, null, null, null, null, '', '对', '实物', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000867', '伊莱美洗漱杯', '', null, '5.00', null, null, null, null, null, null, '', '个', '实物', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000868', '伊莱美牙刷', '', null, '5.00', null, null, null, null, null, null, '', '支', '实物', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'B+');
INSERT INTO `sp_info` VALUES ('10000869', '52度丰谷福酒', '', null, '30.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000870', '降雪儿南瓜酒（每瓶450ml）', '', null, '85.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', 'A');
INSERT INTO `sp_info` VALUES ('10000871', '中国亿信注册卡01', '', null, '100.00', null, null, null, null, null, null, '', '张', '服务', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'B');
INSERT INTO `sp_info` VALUES ('10000872', '安格斯潮流影像潮童造星计划（卡类）', '', null, '1298.00', null, null, null, null, null, null, '', '张', '服务', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'B');
INSERT INTO `sp_info` VALUES ('10000873', '摩尔健康卡', '', null, '1999.00', null, null, null, null, null, null, '', '张', '服务', null, null, '0000-00-00', 'yesok', null, '梁吉', '', '梁吉', 'C');
INSERT INTO `sp_info` VALUES ('10000874', '迪士尼相册（内含四本）', '', null, '20.00', null, null, null, null, null, null, '', '盒', '实物', null, null, '1900-01-00', 'yesok', null, '梁吉', '', '梁吉', 'B');

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
  KEY `shid` (`sh_id`)
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
  `yt_id` int(8) NOT NULL AUTO_INCREMENT,
  `sp_id` int(8) NOT NULL,
  `sh_id` int(8) NOT NULL,
  `sp_name` varchar(30) DEFAULT NULL,
  `place_id` int(5) NOT NULL,
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
  KEY `place_id` (`place_id`)
) ENGINE=InnoDB AUTO_INCREMENT=80000276 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yt_application
-- ----------------------------
INSERT INTO `yt_application` VALUES ('80000001', '10000765', '20000007', '', '30001', '', '套', null, null, '', '', '140', null, '2016-03-02', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000002', '10000541', '20000007', '', '30003', '', '份', null, null, '', '', '57', null, '3000-01-01', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000003', '10000722', '20000007', '', '30001', '', '瓶', null, null, '', '', '99', null, '3000-01-01', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000004', '10000314', '20000007', '', '30001', '', '只', null, null, '', '', '10', null, '3000-01-01', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000005', '10000509', '20000007', '', '30003', '', '支', null, null, '', '', '236', null, '3000-01-01', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000006', '10000748', '20000007', '', '30001', '', '套', null, null, '', '', '1', null, '3000-01-01', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000007', '10000489', '20000007', '', '30003', '', '盒', null, null, '', '', '19', null, '3000-01-01', '任意配置', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000008', '10000690', '20000007', '', '30001', '', '袋', null, null, '', '', '188', null, '3000-01-01', '任意配置', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000009', '10000743', '20000007', '', '30003', '', '个', null, null, '', '', '10', null, '3000-01-01', '任意配置', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000010', '10000712', '20000007', '', '30002', '', '瓶', null, null, '', '', '2', null, '3000-01-01', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000011', '10000552', '20000007', '', '30001', '', '瓶', null, null, '', '', '1', null, '3000-01-01', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000012', '10000302', '20000007', '', '30003', '', '盒', null, null, '', '', '100', null, '2016-10-01', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000013', '10000288', '20000007', '', '30001', '', '盒', null, null, '', '', '50', null, '2016-02-25', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000014', '10000010', '20000007', '', '30002', '', '包', null, null, '', '', '360', null, '2016-02-24', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000015', '10000691', '20000007', '', '30003', '', '盒', null, null, '', '', '10', null, '3000-01-01', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000016', '10000301', '20000007', '', '30001', '', '张', null, null, '', '', '50', null, '2016-02-24', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000017', '10000104', '20000050', '', '30001', '', '袋', null, null, '', '', '31', null, '2016-02-24', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000018', '10000520', '20000163', '', '30001', '', '份', null, null, '', '', '200', null, '3000-01-01', '物业礼包', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000019', '10000730', '20000208', '', '30001', '', '包', null, null, '', '', '21', null, '2016-02-24', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000020', '10000646', '20000007', '', '30003', '', '份', null, null, '', '', '2', null, '3000-01-01', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000021', '10000606', '20000182', '', '30001', '', '支', null, null, '', '', '1411', null, '3000-01-01', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000022', '10000786', '20000214', '', '30001', '', '盒', null, null, '', '', '91', null, '2016-02-24', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000023', '10000769', '20000007', '', '30002', '', '个', null, null, '', '', '1', null, '3000-01-01', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000024', '10000729', '20000007', '', '30003', '', '个', null, null, '', '', '100', null, '2016-02-19', '福利（其他）', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000025', '10000694', '20000196', '', '30001', '', '瓶', null, null, '', '', '10', null, '2016-03-02', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000026', '10000574', '20000173', '', '30001', '', '片', null, null, '', '', '76', null, '2016-02-25', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000027', '10000480', '20000037', '', '30001', '', '瓶', null, null, '', '', '88', null, '2016-03-02', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000028', '10000166', '20000063', '', '30001', '', '盒', null, null, '', '', '77', null, '2016-02-24', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000029', '10000167', '20000063', '', '30001', '', '盒', null, null, '', '', '47', null, '2016-03-02', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000030', '10000168', '20000063', '', '30001', '', '盒', null, null, '', '', '385', null, '2016-02-24', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000031', '10000178', '20000063', '', '30001', '', '盒', null, null, '', '', '159', null, '2016-02-24', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000032', '10000317', '20000114', '', '30001', '', '袋', null, null, '', '', '44', null, '2016-03-03', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000033', '10000065', '20000030', '', '30001', '', '包', null, null, '', '', '10', null, '3000-01-01', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000034', '10000481', '20000037', '', '30001', '', '瓶', null, null, '', '', '126', null, '2016-02-24', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000035', '10000787', '20000114', '', '30001', '', '本', null, null, '', '', '44', null, '2016-03-03', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000036', '10000285', '20000106', '', '30001', '', '包', null, null, '', '', '170', null, '3000-01-01', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000037', '10000516', '20000161', '', '30001', '', '瓶', null, null, '', '', '8', null, '2016-02-25', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000038', '10000869', '20000271', '', '30001', '', '瓶', null, null, '', '', '350', null, '2016-03-02', '福利（其他）', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000039', '10000618', '20000063', '', '30003', '', '瓶', null, null, '', '', '83', null, '3000-01-01', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000040', '10000790', '20000007', '', '30001', '', '片', null, null, '', '', '2', null, '3000-01-01', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000041', '10000558', '20000172', '', '30001', '', '包', null, null, '', '', '68', null, '2016-03-02', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000042', '10000613', '20000184', '', '30001', '', '瓶', null, null, '', '', '26', null, '2016-02-24', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000043', '10000651', '20000007', '', '30003', '', '瓶', null, null, '', '', '159', null, '2016-02-23', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000044', '10000634', '20000007', '', '30003', '', '瓶', null, null, '', '', '159', null, '2016-02-23', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000045', '10000151', '20000063', '', '30001', '', '瓶', null, null, '', '', '119', null, '2016-03-03', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000046', '10000836', '20000256', '', '30001', '', '顶', null, null, '', '', '8', null, '3000-01-01', '任意配置', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000047', '10000452', '20000111', '', '30001', '', '片', null, null, '', '', '72', null, '2016-03-02', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000048', '10000837', '20000256', '', '30001', '', '顶', null, null, '', '', '19', null, '3000-01-01', '任意配置', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000049', '10000488', '20000153', '', '30001', '', '份', null, null, '', '', '23', null, '3000-01-01', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000050', '10000142', '20000024', '', '30001', '', '瓶', null, null, '', '', '128', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000051', '10000291', '20000107', '', '30001', '', '包', null, null, '', '', '31', null, '3000-01-01', '任意配置', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000052', '10000030', '20000021', '', '30001', '', '瓶', null, null, '', '', '40', null, '3000-01-01', '物业礼包', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000053', '10000556', '20000007', '', '30003', '', '片', null, null, '', '', '55', null, '3000-01-01', '任意配置', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000054', '10000450', '20000144', '', '30001', '', '盒', null, null, '', '', '2000', null, '3000-01-01', '任意配置', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000055', '10000024', '20000013', '', '30001', '', '罐', null, null, '', '', '100', null, '3000-01-01', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000056', '10000028', '20000017', '', '30001', '', '盒', null, null, '', '', '150', null, '2016-02-25', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000057', '10000320', '20000117', '', '30001', '', '包', null, null, '', '', '2417', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000058', '10000854', '20000264', '', '30001', '', '个', null, null, '', '', '7', null, '3000-01-01', '任意配置', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000059', '10000322', '20000007', '', '30001', '', '包', null, null, '', '', '1210', null, '2016-03-02', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000060', '10000553', '20000158', '', '30003', '', '盒', null, null, '', '', '176', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000061', '10000554', '20000158', '', '30003', '', '盒', null, null, '', '', '147', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000062', '10000555', '20000158', '', '30003', '', '盒', null, null, '', '', '132', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000063', '10000848', '20000263', '', '30003', '', '双', null, null, '', '', '156', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000064', '10000849', '20000263', '', '30003', '', '双', null, null, '', '', '120', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000065', '10000850', '20000263', '', '30003', '', '双', null, null, '', '', '120', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000066', '10000851', '20000263', '', '30003', '', '双', null, null, '', '', '120', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000067', '10000852', '20000263', '', '30003', '', '双', null, null, '', '', '276', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000068', '10000853', '20000263', '', '30003', '', '双', null, null, '', '', '288', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000069', '10000497', '20000142', '', '30001', '', '瓶', null, null, '', '', '40', null, '2016-02-24', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000070', '10000506', '20000142', '', '30001', '', '瓶', null, null, '', '', '29', null, '2016-03-03', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000071', '10000046', '20000029', '', '30001', '', '袋', null, null, '', '', '60', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000072', '10000204', '20000082', '', '30001', '', '份', null, null, '', '', '240', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000073', '10000522', '20000007', '', '30003', '', '瓶', null, null, '', '', '48', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000074', '10000495', '20000007', '', '30003', '', '瓶', null, null, '', '', '72', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000075', '10000247', '20000097', '', '30001', '', '盒', null, null, '', '', '170', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000076', '10000248', '20000097', '', '30001', '', '盒', null, null, '', '', '169', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000077', '10000064', '20000005', '', '30001', '', '盒', null, null, '', '', '5460', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000078', '10000249', '20000097', '', '30001', '', '包', null, null, '', '', '80', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000079', '10000070', '20000037', '', '30001', '', '瓶', null, null, '', '', '30', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000080', '10000429', '20000007', '', '30003', '', '瓶', null, null, '', '', '100', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000081', '10000547', '20000010', '', '30001', '', '支', null, null, '', '', '1774', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000082', '10000521', '20000164', '', '30003', '', '包', null, null, '', '', '13', null, '2016-02-23', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000083', '10000515', '20000158', '', '30003', '', '盒', null, null, '', '', '2', null, '3000-01-01', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000084', '10000107', '20000027', '', '30001', '', '包', null, null, '', '', '120', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000085', '10000108', '20000027', '', '30001', '', '包', null, null, '', '', '120', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000086', '10000588', '20000152', '', '30001', '', '盒', null, null, '', '', '1500', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000087', '10000594', '20000111', '', '30003', '', '瓶', null, null, '', '', '60', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000088', '10000088', '20000045', '', '30001', '', '瓶', null, null, '', '', '190', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000089', '10000426', '20000007', '', '30001', '', '瓶', null, null, '', '', '8', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000090', '10000609', '20000006', '', '30001', '', '瓶', null, null, '', '', '12', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000091', '10000172', '20000027', '', '30001', '', '包', null, null, '', '', '24', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000092', '10000109', '20000027', '', '30001', '', '包', null, null, '', '', '150', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000093', '10000110', '20000027', '', '30001', '', '包', null, null, '', '', '150', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000094', '10000130', '20000024', '', '30001', '', '瓶', null, null, '', '', '222', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000095', '10000503', '20000157', '', '30001', '', '份', null, null, '', '', '200', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000096', '10000858', '20000264', '', '30001', '', '个', null, null, '', '', '78', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000097', '10000542', '20000111', '', '30003', '', '瓶', null, null, '', '', '60', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000098', '10000595', '20000111', '', '30003', '', '瓶', null, null, '', '', '60', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000099', '10000277', '20000104', '', '30001', '', '包', null, null, '', '', '10', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000100', '10000502', '20000026', '', '30001', '', '袋', null, null, '', '', '98', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000101', '10000105', '20000027', '', '30001', '', '包', null, null, '', '', '48', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000102', '10000106', '20000027', '', '30001', '', '包', null, null, '', '', '44', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000103', '10000011', '20000009', '', '30001', '', '包', null, null, '', '', '397', null, '2016-02-26', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000104', '10000028', '20000017', '', '30003', '', '盒', null, null, '', '', '400', null, '2016-02-25', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000105', '10000228', '20000074', '', '30003', '', '盒', null, null, '', '', '24', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000106', '10000196', '20000074', '', '30003', '', '盒', null, null, '', '', '24', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000107', '10000622', '20000028', '', '30001', '', '瓶', null, null, '', '', '500', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000108', '10000508', '20000158', '', '30001', '', '盒', null, null, '', '', '104', null, '2016-03-02', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000109', '10000838', '20000256', '', '30001', '', '顶', null, null, '', '', '43', null, '3000-01-01', '任意配置', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000110', '10000626', '20000061', '', '30001', '', '支', null, null, '', '', '84', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000111', '10000628', '20000061', '', '30001', '', '瓶', null, null, '', '', '63', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000112', '10000629', '20000061', '', '30001', '', '瓶', null, null, '', '', '56', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000113', '10000630', '20000061', '', '30001', '', '瓶', null, null, '', '', '63', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000114', '10000242', '20000094', '', '30001', '', '包', null, null, '', '', '196', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000115', '10000463', '20000149', '', '30003', '', '支', null, null, '', '', '100', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000116', '10000325', '20000094', '', '30001', '', '包', null, null, '', '', '400', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000117', '10000324', '20000094', '', '30001', '', '包', null, null, '', '', '400', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000118', '10000243', '20000094', '', '30001', '', '包', null, null, '', '', '400', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000119', '10000228', '20000074', '', '30001', '', '盒', null, null, '', '', '9', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000120', '10000196', '20000074', '', '30001', '', '盒', null, null, '', '', '9', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000121', '10000184', '20000073', '', '30001', '', '盒', null, null, '', '', '10', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000122', '10000215', '20000007', '', '30001', '', '包', null, null, '', '', '18', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000123', '10000216', '20000007', '', '30001', '', '包', null, null, '', '', '5', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000124', '10000152', '20000014', '', '30001', '', '瓶', null, null, '', '', '240', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000125', '10000074', '20000014', '', '30001', '', '瓶', null, null, '', '', '240', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000126', '10000439', '20000141', '', '30003', '', '罐', null, null, '', '', '11', null, '3000-01-01', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000127', '10000604', '20000181', '', '30001', '', '袋', null, null, '', '', '40', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000128', '10000605', '20000181', '', '30001', '', '袋', null, null, '', '', '40', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000129', '10000101', '20000048', '', '30001', '', '袋', null, null, '', '', '350', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000130', '10000860', '20000267', '', '30001', '', '双', null, null, '', '', '200', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000131', '10000049', '20000030', '', '30003', '', '盒', null, null, '', '', '34', null, '3000-01-01', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000132', '10000576', '20000170', '', '30003', '', '支', null, null, '', '', '70', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000133', '10000548', '20000170', '', '30003', '', '套', null, null, '', '', '110', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000134', '10000249', '20000097', '', '30003', '', '包', null, null, '', '', '668', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000135', '10000072', '20000038', '', '30001', '', '瓶', null, null, '', '', '600', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000136', '10000060', '20000030', '', '30001', '', '包', null, null, '', '', '220', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000137', '10000266', '20000030', '', '30003', '', '包', null, null, '', '', '518', null, '3000-01-01', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000138', '10000540', '20000111', '', '30003', '', '瓶', null, null, '', '', '60', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000139', '10000240', '20000093', '', '30001', '', '袋', null, null, '', '', '10', null, '2016-02-24', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000140', '10000133', '20000057', '', '30001', '', '盒', null, null, '', '', '125', null, '2016-02-24', '福利（其他）', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000141', '10000704', '20000198', '', '30001', '', '盒', null, null, '', '', '240', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000142', '10000078', '20000002', '', '30001', '', '箱', null, null, '', '', '133', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000143', '10000198', '20000080', '', '30001', '', '袋', null, null, '', '', '1400', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000144', '10000519', '20000003', '', '30001', '', '瓶', null, null, '', '', '240', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000145', '10000234', '20000090', '', '30001', '', '瓶', null, null, '', '', '500', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000146', '10000697', '20000195', '', '30001', '', '瓶', null, null, '', '', '56', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000147', '10000536', '20000167', '', '30001', '', '包', null, null, '', '', '26250', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000148', '10000342', '20000098', '', '30001', '', '瓶', null, null, '', '', '5', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000149', '10000403', '20000130', '', '30001', '', '瓶', null, null, '', '', '3000', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000150', '10000664', '20000007', '', '30003', '', '套', null, null, '', '', '3', null, '3000-01-01', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000151', '10000113', '20000024', '', '30001', '', '瓶', null, null, '', '', '300', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000152', '10000114', '20000024', '', '30001', '', '瓶', null, null, '', '', '300', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000153', '10000159', '20000065', '', '30001', '', '组合装', null, null, '', '', '10', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000154', '10000160', '20000065', '', '30001', '', '组合装', null, null, '', '', '10', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000155', '10000031', '20000022', '', '30001', '', '包', null, null, '', '', '240', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000156', '10000032', '20000022', '', '30001', '', '包', null, null, '', '', '240', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000157', '10000033', '20000022', '', '30001', '', '包', null, null, '', '', '240', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000158', '10000139', '20000060', '', '30001', '', '袋', null, null, '', '', '120', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000159', '10000328', '20000094', '', '30001', '', '包', null, null, '', '', '75', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000160', '10000361', '20000076', '', '30001', '', '袋', null, null, '', '', '160', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000161', '10000188', '20000076', '', '30001', '', '袋', null, null, '', '', '160', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000162', '10000351', '20000076', '', '30001', '', '包', null, null, '', '', '1000', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000163', '10000352', '20000076', '', '30001', '', '包', null, null, '', '', '1000', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000164', '10000116', '20000029', '', '30001', '', '包', null, null, '', '', '692', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000165', '10000351', '20000076', '', '30001', '', '包', null, null, '', '', '460', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000166', '10000352', '20000076', '', '30001', '', '包', null, null, '', '', '460', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000167', '10000018', '20000012', '', '30001', '', '包', null, null, '', '', '109', null, '2016-02-25', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000168', '10000695', '20000195', '', '30001', '', '瓶', null, null, '', '', '56', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000169', '10000257', '20000100', '', '30001', '', '盒', null, null, '', '', '1088', null, '3000-01-01', '物业礼包', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000170', '10000187', '20000063', '', '30001', '', '瓶', null, null, '', '', '80', null, '2016-02-25', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000171', '10000023', '20000013', '', '30001', '', '罐', null, null, '', '', '1260', null, '2016-02-24', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000172', '10000523', '20000165', '', '30001', '', '盒', null, null, '', '', '5', null, '2016-03-02', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000173', '10000349', '20000036', '', '30001', '', '包', null, null, '', '', '300', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000174', '10000041', '20000028', '', '30001', '', '筒', null, null, '', '', '1800', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000175', '10000042', '20000028', '', '30001', '', '筒', null, null, '', '', '1200', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000176', '10000296', '20000100', '', '30001', '', '盒', null, null, '', '', '600', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000177', '10000297', '20000100', '', '30001', '', '盒', null, null, '', '', '600', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000178', '10000390', '20000007', '', '30001', '', '包', null, null, '', '', '400', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000179', '10000289', '20000007', '', '30001', '', '包', null, null, '', '', '400', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000180', '10000482', '20000145', '', '30003', '', '包', null, null, '', '', '95', null, '2016-02-19', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000181', '10000014', '20000011', '', '30001', '', '包', null, null, '', '', '20', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000182', '10000015', '20000011', '', '30001', '', '包', null, null, '', '', '74', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000183', '10000016', '20000011', '', '30001', '', '包', null, null, '', '', '50', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000184', '10000391', '20000011', '', '30001', '', '包', null, null, '', '', '100', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000185', '10000262', '20000046', '', '30001', '', '包', null, null, '', '', '810', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000186', '10000229', '20000046', '', '30001', '', '听', null, null, '', '', '1800', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000187', '10000094', '20000046', '', '30001', '', '听', null, null, '', '', '1800', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000188', '10000700', '20000195', '', '30001', '', '瓶', null, null, '', '', '96', null, '3000-01-01', '一元购', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000189', '10000701', '20000195', '', '30001', '', '瓶', null, null, '', '', '96', null, '3000-01-01', '一元购', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000190', '10000492', '20000154', '', '30001', '', '袋', null, null, '', '', '1000', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000191', '10000645', '20000180', '', '30001', '', '盒', null, null, '', '', '1500', null, '2016-02-25', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000192', '10000459', '20000148', '', '30003', '', '盒', null, null, '', '', '200', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000193', '10000027', '20000019', '', '30003', '', '张', null, null, '', '', '14', null, '2016-02-25', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000194', '10000155', '20000063', '', '30001', '', '瓶', null, null, '', '', '54', null, '2016-03-02', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000195', '10000620', '20000063', '', '30001', '', '瓶', null, null, '', '', '59', null, '2016-03-02', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000196', '10000259', '20000100', '', '30001', '', '盒', null, null, '', '', '2000', null, '3000-01-01', '一元购', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000197', '10000321', '20000007', '', '30001', '', '包', null, null, '', '', '170', null, '3000-01-01', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000198', '10000189', '20000077', '', '30003', '', '袋', null, null, '', '', '20', null, '3000-01-01', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000199', '10000063', '20000005', '', '30003', '', '盒', null, null, '', '', '20', null, '3000-01-01', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000200', '10000318', '20000115', '', '30003', '', '盒', null, null, '', '', '100', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000201', '10000602', '20000115', '', '30003', '', '盒', null, null, '', '', '50', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000202', '10000603', '20000115', '', '30003', '', '盒', null, null, '', '', '50', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000203', '10000189', '20000077', '', '30001', '', '袋', null, null, '', '', '148', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000204', '10000194', '20000077', '', '30001', '', '袋', null, null, '', '', '248', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000205', '10000157', '20000063', '', '30001', '', '瓶', null, null, '', '', '6', null, '3000-01-01', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000206', '10000661', '20000115', '', '30001', '', '套', null, null, '', '', '86', null, '2016-03-02', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000207', '10000263', '20000077', '', '30001', '', '袋', null, null, '', '', '390', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000208', '10000689', '20000007', '', '30003', '', '盒', null, null, '', '', '1000', null, '2016-04-07', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000209', '10000400', '20000007', '', '30001', '', '包', null, null, '', '', '860', null, '2016-03-02', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000210', '10000527', '20000052', '', '30001', '', '袋', null, null, '', '', '14', null, '2016-02-25', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000211', '10000054', '20000034', '', '30003', '', '罐', null, null, '', '', '24', null, '2016-02-26', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000212', '10000056', '20000034', '', '30003', '', '罐', null, null, '', '', '24', null, '2016-02-23', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000213', '10000329', '20000118', '', '30001', '', '包', null, null, '', '', '20', null, '3000-01-01', '物业礼包', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000214', '10000350', '20000121', '', '30001', '', '包', null, null, '', '', '100', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000215', '10000483', '20000121', '', '30001', '', '包', null, null, '', '', '100', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000216', '10000550', '20000171', '', '30001', '', '罐', null, null, '', '', '184', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000217', '10000057', '20000034', '', '30003', '', '罐', null, null, '', '', '24', null, '2016-02-23', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000218', '10000411', '20000019', '', '30001', '', '包', null, null, '', '', '200', null, '3000-01-01', '物业礼包', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000219', '10000412', '20000019', '', '30001', '', '包', null, null, '', '', '72', null, '3000-01-01', '物业礼包', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000220', '10000413', '20000019', '', '30001', '', '包', null, null, '', '', '200', null, '3000-01-01', '物业礼包', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000221', '10000154', '20000063', '', '30001', '', '瓶', null, null, '', '', '25', null, '2016-02-24', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000222', '10000706', '20000199', '', '30001', '', '袋', null, null, '', '', '20', null, '3000-01-01', '物业礼包', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000223', '10000707', '20000199', '', '30001', '', '卷', null, null, '', '', '40', null, '3000-01-01', '物业礼包', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000224', '10000708', '20000199', '', '30001', '', '卷', null, null, '', '', '40', null, '3000-01-01', '物业礼包', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000225', '10000709', '20000199', '', '30001', '', '袋', null, null, '', '', '20', null, '3000-01-01', '物业礼包', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000226', '10000710', '20000200', '', '30001', '', '双', null, null, '', '', '20', null, '3000-01-01', '物业礼包', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000227', '10000711', '20000200', '', '30001', '', '袋', null, null, '', '', '40', null, '3000-01-01', '物业礼包', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000228', '10000505', '20000066', '', '30001', '', '瓶', null, null, '', '', '100', null, '2016-02-24', '任意配置', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000229', '10000098', '20000047', '', '30001', '', '包', null, null, '', '', '16', null, '2016-02-24', '任意配置', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000230', '10000376', '20000052', '', '30001', '', '袋', null, null, '', '', '87', null, '2016-02-24', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000231', '10000083', '20000029', '', '30001', '', '包', null, null, '', '', '160', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000232', '10000084', '20000029', '', '30001', '', '包', null, null, '', '', '160', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000233', '10000085', '20000029', '', '30001', '', '包', null, null, '', '', '160', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000234', '10000086', '20000029', '', '30001', '', '包', null, null, '', '', '160', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000235', '10000053', '20000033', '', '30001', '', '瓶', null, null, '', '', '790', null, '3000-01-01', '任意配置', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000236', '10000162', '20000066', '', '30001', '', '瓶', null, null, '', '', '741', null, '3000-01-01', '任意配置', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000237', '10000375', '20000052', '', '30001', '', '袋', null, null, '', '', '98', null, '2016-02-24', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000238', '10000564', '20000052', '', '30001', '', '袋', null, null, '', '', '24', null, '2016-03-02', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000239', '10000050', '20000031', '', '30001', '', '包', null, null, '', '', '2000', null, '2016-03-02', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000240', '10000396', '20000079', '', '30001', '', '罐', null, null, '', '', '52', null, '2016-02-24', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000241', '10000264', '20000102', '', '30001', '', '瓶', null, null, '', '', '50', null, '2016-02-24', '任意配置', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000242', '10000136', '20000059', '', '30001', '', '袋', null, null, '', '', '210', null, '2016-02-24', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000243', '10000315', '20000075', '', '30001', '', '袋', null, null, '', '', '1800', null, '2016-03-09', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000244', '10000174', '20000037', '', '30001', '', '罐', null, null, '', '', '2150', null, '2016-03-02', '任意配置', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000245', '10000208', '20000083', '', '30001', '', '瓶', null, null, '', '', '300', null, '2016-03-03', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000246', '10000209', '20000083', '', '30001', '', '瓶', null, null, '', '', '300', null, '2016-03-03', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000247', '10000389', '20000079', '', '30001', '', '罐', null, null, '', '', '46', null, '2016-03-02', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000248', '10000258', '20000101', '', '30001', '', '瓶', null, null, '', '', '360', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000249', '10000546', '20000101', '', '30001', '', '瓶', null, null, '', '', '720', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000250', '10000593', '20000180', '', '30001', '', '盒', null, null, '', '', '10000', null, '2016-04-01', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000251', '10000344', '20000081', '', '30001', '', '包', null, null, '', '', '100', null, '2016-03-03', '任意配置', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000252', '10000090', '20000042', '', '30001', '', '盒', null, null, '', '', '25', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000253', '10000081', '20000042', '', '30001', '', '盒', null, null, '', '', '25', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000254', '10000080', '20000042', '', '30001', '', '盒', null, null, '', '', '42', null, '3000-01-01', '一元购', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000255', '10000689', '20000007', '', '30003', '', '盒', null, null, '', '', '1450', null, '2016-02-25', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000256', '10000193', '20000063', '', '30001', '', '瓶', null, null, '', '', '115', null, '2016-02-24', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000257', '10000145', '20000046', '', '30001', '', '听', null, null, '', '', '100', null, '3000-01-01', '社区特卖', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000258', '10000053', '20000033', '', '30001', '', '瓶', null, null, '', '', '400', null, '2016-03-03', '任意配置', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000259', '10000692', '20000007', '', '30003', '', '盒', null, null, '', '', '400', null, '2016-02-26', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000260', '10000347', '20000059', '', '30001', '', '袋', null, null, '', '', '420', null, '2016-02-24', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000261', '10000051', '20000031', '', '30003', '', '包', null, null, '', '', '27500', null, '2016-02-25', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000262', '10000057', '20000034', '', '30001', '', '罐', null, null, '', '', '36', null, '2016-02-24', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000263', '10000582', '20000176', '', '30003', '', '份', null, null, '', '', '80', null, '2016-02-19', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000264', '10000676', '20000036', '', '30001', '', '支', null, null, '', '', '200', null, '2016-02-24', '任意配置', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000265', '10000639', '20000007', '', '30001', '', '套', null, null, '', '', '5', null, '2016-02-19', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000266', '10000405', '20000019', '', '30001', '', '瓶', null, null, '', '', '105', null, '2016-02-24', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000267', '10000348', '20000059', '', '30001', '', '袋', null, null, '', '', '400', null, '2016-03-02', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000268', '10000760', '20000007', '', '30001', '', '份', null, null, '', '', '38', null, '2016-02-24', '任意配置', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000269', '10000619', '20000063', '', '30001', '', '瓶', null, null, '', '', '200', null, '2016-03-02', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000270', '10000645', '20000180', '', '30001', '', '盒', null, null, '', '', '11000', null, '2016-05-02', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000271', '10000003', '20000003', '', '30001', '', '瓶', null, null, '', '', '68', null, '2016-02-24', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000272', '10000338', '20000033', '', '30001', '', '瓶', null, null, '', '', '800', null, '2016-03-02', '任意配置', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000273', '10000164', '20000063', '', '30001', '', '瓶', null, null, '', '', '40', null, '2016-03-02', '福利', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000274', '10000717', '20000202', '', '30001', '', '瓶', null, null, '', '', '48', null, '3000-01-01', '一元购', '', '梁吉');
INSERT INTO `yt_application` VALUES ('80000275', '10000298', '20000109', '', '30001', '', '瓶', null, null, '', '', '100', null, '3000-01-01', '一元购', '', '梁吉');

-- ----------------------------
-- Table structure for zk_application
-- ----------------------------
DROP TABLE IF EXISTS `zk_application`;
CREATE TABLE `zk_application` (
  `zk_application_id` int(8) NOT NULL AUTO_INCREMENT,
  `ck_id` int(5) DEFAULT NULL,
  `sp_id` int(8) DEFAULT NULL,
  `sh_id` int(8) DEFAULT NULL,
  `type_in` enum('福利','物业礼包','社区特卖','一元购','福利（其他）','任意配置') DEFAULT NULL,
  `type_out` enum('福利','物业礼包','社区特卖','一元购','福利（其他）','任意配置') DEFAULT NULL,
  `zk_number` int(8) DEFAULT NULL,
  `expectDate` date DEFAULT NULL,
  `auditTime` datetime DEFAULT NULL,
  `adduser` varchar(30) DEFAULT NULL,
  `edituser` varchar(30) DEFAULT NULL,
  `checkuser` varchar(30) DEFAULT NULL,
  `applicationDate` datetime DEFAULT NULL,
  `state` enum('yesno','yesok','no') DEFAULT 'no',
  PRIMARY KEY (`zk_application_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zk_application
-- ----------------------------
