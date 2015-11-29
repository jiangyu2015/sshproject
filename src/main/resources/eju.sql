/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50616
Source Host           : localhost:3306
Source Database       : eju

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-11-27 17:58:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for activity
-- ----------------------------
DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `hd_id` int(4) NOT NULL,
  `hd_type` enum('其他','同城会','一元购','社区特卖','社区礼包','定时开','老虎机','摇一摇') DEFAULT NULL,
  `hd_date` date NOT NULL,
  `peisong_cost` int(6) DEFAULT '0',
  `xiaoma_cost` int(6) DEFAULT '0',
  `hd_state` enum('已结束','未结束') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activity
-- ----------------------------
INSERT INTO `activity` VALUES ('1', '1', '老虎机', '2015-11-07', '10', '0', null);
INSERT INTO `activity` VALUES ('2', '1', '老虎机', '2015-11-10', '5', '0', null);
INSERT INTO `activity` VALUES ('3', '1', '老虎机', '2015-11-20', '25', '0', null);
INSERT INTO `activity` VALUES ('4', '1', '老虎机', '2015-11-30', '10', '0', null);
INSERT INTO `activity` VALUES ('5', '2', '摇一摇', '2015-11-19', '20', '0', null);
INSERT INTO `activity` VALUES ('6', '2', '摇一摇', '2015-11-20', '30', '0', null);
INSERT INTO `activity` VALUES ('7', '2', '摇一摇', '2015-11-21', '5', '0', null);
INSERT INTO `activity` VALUES ('8', '2', '摇一摇', '2015-11-24', '16', '0', null);
INSERT INTO `activity` VALUES ('9', '3', '一元购', '2015-11-10', '3', '0', null);
INSERT INTO `activity` VALUES ('10', '3', '一元购', '2015-11-11', '10', '0', null);
INSERT INTO `activity` VALUES ('11', '3', '一元购', '2015-12-01', '7', '0', null);

-- ----------------------------
-- Table structure for ck_detail
-- ----------------------------
DROP TABLE IF EXISTS `ck_detail`;
CREATE TABLE `ck_detail` (
  `ck_id` int(4) NOT NULL AUTO_INCREMENT,
  `sp_id` int(4) NOT NULL,
  `ck_time` date DEFAULT NULL,
  `ck_number` int(10) DEFAULT NULL,
  `ck_place_id` int(10) DEFAULT NULL,
  `ck_place` varchar(30) DEFAULT NULL,
  `yf_number` int(10) DEFAULT NULL,
  `ck_type` enum('调出','其他','同城会','一元购','社区特卖','社区礼包','定时开','老虎机','正常出库','摇一摇') DEFAULT NULL,
  `remark` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ck_id`),
  KEY `出库商品id` (`sp_id`),
  KEY `出库库存地点id` (`ck_place_id`),
  CONSTRAINT `出库商品id` FOREIGN KEY (`sp_id`) REFERENCES `sp_info` (`sp_id`),
  CONSTRAINT `出库库存地点id` FOREIGN KEY (`ck_place_id`) REFERENCES `kc_place` (`kc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ck_detail
-- ----------------------------
INSERT INTO `ck_detail` VALUES ('62', '1101', '2015-11-03', '75', '2', '一楼仓库', null, '调出', '调至昆山');
INSERT INTO `ck_detail` VALUES ('63', '1102', '2015-11-03', '52', '2', '一楼仓库', null, '调出', '调至昆山');
INSERT INTO `ck_detail` VALUES ('91', '1', '2015-12-01', '50', '2', '一楼仓库', null, '一元购', null);
INSERT INTO `ck_detail` VALUES ('92', '3', '2015-12-30', '20', '7', '373号领奖处', null, '社区特卖', null);
INSERT INTO `ck_detail` VALUES ('93', '1', '2015-12-03', '10', '2', '一楼仓库', null, '社区礼包', null);
INSERT INTO `ck_detail` VALUES ('94', '1', '2015-12-21', '30', '2', '一楼仓库', null, '一元购', null);
INSERT INTO `ck_detail` VALUES ('95', '4', '2015-12-01', '40', '5', '一楼仓库/虚拟入库', null, '一元购', null);
INSERT INTO `ck_detail` VALUES ('96', '1234', '2015-11-06', '888', '2', '一楼仓库', null, '调出', null);
INSERT INTO `ck_detail` VALUES ('97', '1', null, '20', '1', null, null, '社区特卖', null);

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
  PRIMARY KEY (`kc_id`),
  KEY `place` (`place`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kc_place
-- ----------------------------
INSERT INTO `kc_place` VALUES ('1', '昆山仓库', null);
INSERT INTO `kc_place` VALUES ('2', '一楼仓库', null);
INSERT INTO `kc_place` VALUES ('3', '宝山仓库', null);
INSERT INTO `kc_place` VALUES ('4', '四楼财务室进门抽屉', null);
INSERT INTO `kc_place` VALUES ('5', '一楼仓库/虚拟入库', null);
INSERT INTO `kc_place` VALUES ('6', '四楼403', null);
INSERT INTO `kc_place` VALUES ('7', '373号领奖处', null);
INSERT INTO `kc_place` VALUES ('8', '四楼行政办公室', null);
INSERT INTO `kc_place` VALUES ('9', '四楼财务室保险箱', null);
INSERT INTO `kc_place` VALUES ('10', '四楼财务室箱子', null);

-- ----------------------------
-- Table structure for rk_application
-- ----------------------------
DROP TABLE IF EXISTS `rk_application`;
CREATE TABLE `rk_application` (
  `rk_application_id` int(4) NOT NULL AUTO_INCREMENT,
  `sh_id` int(4) DEFAULT NULL,
  `sh_name` varchar(30) NOT NULL,
  `sp_id` int(4) DEFAULT NULL,
  `sp_name` varchar(30) NOT NULL,
  `expect_rk_time` date DEFAULT NULL,
  `expect_rk_number` int(10) DEFAULT NULL,
  `commodity_rating` varchar(10) DEFAULT NULL,
  `sld_id` varchar(10) DEFAULT NULL,
  `rk_place_id` int(4) DEFAULT NULL,
  `rk_place_add` varchar(30) DEFAULT NULL,
  `rk_type` enum('调入','任意调配','一元购','社区特卖','物业礼包','福利') DEFAULT '任意调配',
  `state` enum('ok','no') DEFAULT 'no',
  PRIMARY KEY (`rk_application_id`),
  KEY `spid` (`sp_id`) USING BTREE,
  KEY `shmc` (`sh_name`) USING BTREE,
  KEY `rk_place_add` (`rk_place_add`),
  KEY `sp_name` (`sp_name`),
  CONSTRAINT `rk_place_add` FOREIGN KEY (`rk_place_add`) REFERENCES `kc_place` (`place`),
  CONSTRAINT `sh_name` FOREIGN KEY (`sh_name`) REFERENCES `sh_info` (`sh_name`),
  CONSTRAINT `sp_name` FOREIGN KEY (`sp_name`) REFERENCES `sp_info` (`sp_name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rk_application
-- ----------------------------
INSERT INTO `rk_application` VALUES ('1', '0', '首道养生', '1', '松江原生态大米（2斤装）', '2015-11-05', '200', null, null, null, '一楼仓库', '一元购', 'ok');
INSERT INTO `rk_application` VALUES ('2', '0', '斯锐凯博（上海）健身服务有限公司', '3', '下午茶饼干', null, '200', null, null, null, '373号领奖处', '社区特卖', 'ok');
INSERT INTO `rk_application` VALUES ('3', '0', '首道养生', '1', '松江原生态大米（2斤装）', '2015-11-06', '50', null, null, null, '373号领奖处', '一元购', 'ok');
INSERT INTO `rk_application` VALUES ('4', '0', '首道养生', '1', '查理氏果汁饮料', '2015-11-20', '40', null, null, null, '一楼仓库', '一元购', 'ok');
INSERT INTO `rk_application` VALUES ('5', '0', '首道养生', '3', '下午茶饼干', '2015-11-03', '20', null, null, null, '373号领奖处', '物业礼包', 'ok');
INSERT INTO `rk_application` VALUES ('6', '0', '鞋博士皮具修护中心', '4', '实惠早餐蛋糕', '2015-11-10', '30', null, null, null, '一楼仓库/虚拟入库', '一元购', 'ok');
INSERT INTO `rk_application` VALUES ('7', '4', '波奇宠物', '5', '查理氏果汁饮料', '2015-11-27', '300', null, null, null, null, null, 'no');
INSERT INTO `rk_application` VALUES ('10', null, '首道养生', null, '下午茶饼干', '2015-11-30', '100', 'A', '123', null, '一楼仓库', '一元购', 'no');
INSERT INTO `rk_application` VALUES ('11', null, '波奇宠物', null, '我是商品1', '2015-11-30', '1000', 'A', '123', null, '昆山仓库', '一元购', 'no');

-- ----------------------------
-- Table structure for rk_detail
-- ----------------------------
DROP TABLE IF EXISTS `rk_detail`;
CREATE TABLE `rk_detail` (
  `rk_id` int(4) NOT NULL AUTO_INCREMENT,
  `sp_id` int(4) DEFAULT NULL,
  `sj_stock_date` date DEFAULT NULL,
  `rk_place_id` int(4) DEFAULT NULL,
  `ss_number` int(10) DEFAULT NULL,
  `remark` varchar(30) DEFAULT NULL,
  `rk_type` enum('调入','任意配置','一元购','社区特卖','物业礼包','福利') DEFAULT '任意配置',
  PRIMARY KEY (`rk_id`),
  KEY `rksp_id` (`sp_id`) USING BTREE,
  KEY `rk_plcae_id` (`rk_place_id`),
  CONSTRAINT `rksp_id` FOREIGN KEY (`sp_id`) REFERENCES `sp_info` (`sp_id`),
  CONSTRAINT `rk_plcae_id` FOREIGN KEY (`rk_place_id`) REFERENCES `kc_place` (`kc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rk_detail
-- ----------------------------
INSERT INTO `rk_detail` VALUES ('1', '1234', '2015-10-02', '2', '1000', '', '任意配置');
INSERT INTO `rk_detail` VALUES ('2', '1235', '2015-10-05', '1', '500', '', '任意配置');
INSERT INTO `rk_detail` VALUES ('3', '1237', '2015-10-06', '2', '2000', '', '社区特卖');
INSERT INTO `rk_detail` VALUES ('4', '1', '2015-11-05', '2', '200', null, '一元购');
INSERT INTO `rk_detail` VALUES ('5', '3', '2015-12-01', '7', '100', null, '社区特卖');
INSERT INTO `rk_detail` VALUES ('6', '1', '2015-11-06', '7', '50', null, '一元购');
INSERT INTO `rk_detail` VALUES ('7', '1', '2015-11-20', '2', '40', null, '一元购');
INSERT INTO `rk_detail` VALUES ('8', '3', '2015-11-03', '7', '20', null, '一元购');
INSERT INTO `rk_detail` VALUES ('9', '4', '2015-11-10', '5', '30', null, '一元购');
INSERT INTO `rk_detail` VALUES ('10', '1234', '2015-11-06', '3', '888', null, '调入');
INSERT INTO `rk_detail` VALUES ('11', '4', '2015-10-01', '2', '40', null, '福利');
INSERT INTO `rk_detail` VALUES ('12', '1', '2015-11-30', '1', '1000', null, '一元购');
INSERT INTO `rk_detail` VALUES ('13', '1', '2015-12-04', '1', '1000', null, '一元购');
INSERT INTO `rk_detail` VALUES ('14', '2', '2015-11-30', '2', '1000', null, '一元购');
INSERT INTO `rk_detail` VALUES ('15', '3', '2015-11-27', '3', '1000', '', '一元购');

-- ----------------------------
-- Table structure for sh_info
-- ----------------------------
DROP TABLE IF EXISTS `sh_info`;
CREATE TABLE `sh_info` (
  `sh_id` int(4) NOT NULL AUTO_INCREMENT,
  `sh_name` varchar(30) NOT NULL,
  `sh_add` varchar(50) NOT NULL,
  `linkman` varchar(5) DEFAULT NULL,
  `link_tel1` varchar(15) DEFAULT NULL,
  `link_tel2` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`sh_id`,`sh_name`),
  KEY `商户名称` (`sh_name`),
  KEY `sh_id` (`sh_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sh_info
-- ----------------------------
INSERT INTO `sh_info` VALUES ('1', '首道养生', '试试', '试试', '1312412', '132412412');
INSERT INTO `sh_info` VALUES ('2', '斯锐凯博（上海）健身服务有限公司', '试试3', '试试3', '121231413', '1241242315');
INSERT INTO `sh_info` VALUES ('3', '大地黑牛清真火锅', '希希', '哈哈', '1224343535', '12313214');
INSERT INTO `sh_info` VALUES ('4', '波奇宠物', '试试', '试试', '132143214314', null);
INSERT INTO `sh_info` VALUES ('5', '诗灵菲', 'beiju', 'lala', '121312321', null);
INSERT INTO `sh_info` VALUES ('6', '好慷在线', '', '', '', '');
INSERT INTO `sh_info` VALUES ('7', '实惠上海', '', '', '', '');
INSERT INTO `sh_info` VALUES ('8', '鞋博士皮具修护中心', '', '', '', '');
INSERT INTO `sh_info` VALUES ('9', '卡拉丁(上海)汽车技术服务有限公司', '', '', '', '');
INSERT INTO `sh_info` VALUES ('10', '金生烘培DIY生活馆', '', '', '', '');
INSERT INTO `sh_info` VALUES ('11', '上海臻缘茶叶经营部', '', '', '', '');
INSERT INTO `sh_info` VALUES ('12', '大匠火锅', '', '', '', '');
INSERT INTO `sh_info` VALUES ('13', '海码头', '', '', '', '');
INSERT INTO `sh_info` VALUES ('14', '摩之家健康咨询(上海)有限公司', '', '', '', '');
INSERT INTO `sh_info` VALUES ('15', '夏末摄影', '', '', '', '');
INSERT INTO `sh_info` VALUES ('16', 'RIZAP莱札谱', '', '', '', '');
INSERT INTO `sh_info` VALUES ('17', '一果人生', '', '', '', '');
INSERT INTO `sh_info` VALUES ('18', '宜信卓越财富投资管理（北京）有限公司', '', '', '', '');
INSERT INTO `sh_info` VALUES ('19', '陶桃龙虾馆烧烤', '', '', '', '');
INSERT INTO `sh_info` VALUES ('20', '皓谷实业（上海）有限公司', '', '', '', '');
INSERT INTO `sh_info` VALUES ('22', '泰壹商贸有限公司', '', '', '', '');
INSERT INTO `sh_info` VALUES ('23', '上海纯K量贩KTV', '', '', '', '');
INSERT INTO `sh_info` VALUES ('24', '上海中优智慧医疗科技有限公司', '', '', '', '');
INSERT INTO `sh_info` VALUES ('25', '浦屹投资管理(上海)有限公司', '', '', '', '');
INSERT INTO `sh_info` VALUES ('26', '小地方', '虹口区恒业路啦啦啦', '我', '15221550239', '18768105782');

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
  PRIMARY KEY (`sp_id`),
  KEY `商品名称` (`sp_name`)
) ENGINE=InnoDB AUTO_INCREMENT=1250 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_info
-- ----------------------------
INSERT INTO `sp_info` VALUES ('1', '松江原生态大米（2斤装）', '松江原生态大米1袋（2斤装）', '19.80', '15.00', '4.00', '3.00', '1.00', '1000.00', null, null, '试试1213', '包', '实物', '2015-11-03', null, '2016-01-27');
INSERT INTO `sp_info` VALUES ('2', '松江原生态大米（2斤装）', '松江原生态大米1袋（2斤装）', '19.80', '15.00', '4.00', '3.00', '1.00', null, null, null, '', '包', '实物', null, null, null);
INSERT INTO `sp_info` VALUES ('3', '下午茶饼干', '阳光下午茶大礼包', '3.00', '3.00', null, null, null, null, null, null, 'no time', '包', '实物', '2015-11-20', null, '2015-11-26');
INSERT INTO `sp_info` VALUES ('4', '实惠早餐蛋糕', '爱心早餐', '25.20', '25.20', null, null, null, null, null, null, '', '盒', '实物', null, null, null);
INSERT INTO `sp_info` VALUES ('5', '查理氏果汁饮料', '', '34.90', '34.90', null, null, null, null, null, null, '', '瓶', '实物', null, null, null);
INSERT INTO `sp_info` VALUES ('6', '卡依之黑莓葡萄汁', '', '5.00', '5.00', null, null, null, null, null, null, '', '盒', '实物', null, null, null);
INSERT INTO `sp_info` VALUES ('7', '南瓜庄园天然南瓜籽', '南瓜庄园天然无壳南瓜籽', '30.00', '30.00', null, null, null, null, null, null, '', '包', '实物', null, null, null);
INSERT INTO `sp_info` VALUES ('8', '同灿牛轧糖', '同灿牛轧糖', '39.00', '39.00', null, null, null, null, null, null, '', '袋', '实物', null, null, null);
INSERT INTO `sp_info` VALUES ('9', '妇菌洁女士内裤消毒泡腾片.33g*10片', '妇菌洁消毒泡腾片一盒', '38.00', '38.00', null, null, null, null, null, null, '', '盒', '实物', null, null, null);
INSERT INTO `sp_info` VALUES ('10', '荷高全脂牛奶', '荷高全脂牛奶', '65.00', '65.00', null, null, null, null, null, null, '', '份', '实物', null, null, null);
INSERT INTO `sp_info` VALUES ('11', '安怡金装高钙低脂奶粉', '安怡低脂高钙奶粉一袋', '45.00', '45.00', null, null, null, null, null, null, '', '包', '实物', null, null, null);
INSERT INTO `sp_info` VALUES ('12', '安怡™金装高钙低脂配方奶粉300g', '高钙低脂配方奶粉300g', '45.00', '45.00', null, null, null, null, null, null, '', '包', '实物', null, null, null);
INSERT INTO `sp_info` VALUES ('13', '非非水', '', '3.00', '3.00', null, null, null, null, null, null, '', '瓶', '实物', null, null, null);
INSERT INTO `sp_info` VALUES ('14', '派米盐焗开心果', '爱芬乐希腊进口年货', '20.00', '20.00', null, null, null, null, null, null, '', '包', '实物', null, null, null);
INSERT INTO `sp_info` VALUES ('15', '上海国际车展门票', '', '100.00', '100.00', null, null, null, null, null, null, '', '张', '实物', null, null, null);
INSERT INTO `sp_info` VALUES ('16', 'wills健身周卡', '', '468.00', '468.00', null, null, null, null, null, null, '', '张', '服务', null, null, null);
INSERT INTO `sp_info` VALUES ('17', '咔萨哇牌木薯片40g', '', '8.90', '8.90', null, null, null, null, null, null, '', '包\n', '实物', null, null, null);
INSERT INTO `sp_info` VALUES ('18', '咔萨哇牌木薯片120g', '咔萨哇木薯片', '24.00', '24.00', null, null, null, null, null, null, '', '包', '实物', null, null, null);
INSERT INTO `sp_info` VALUES ('19', '吃吃看鱼松', '吃吃看三文鱼松', '39.90', '39.90', null, null, null, null, null, null, '', '袋', '实物', null, null, null);
INSERT INTO `sp_info` VALUES ('20', '拜尔口腔家庭卡（价值8580元）', '拜尔口腔家庭卡', '8580.00', '8580.00', null, null, null, null, null, null, '', '张', '服务', null, null, null);
INSERT INTO `sp_info` VALUES ('21', '加多宝凉茶（500ml）\r\n', null, '5.00', '5.00', null, null, null, null, null, null, null, '瓶', '实物', null, null, null);
INSERT INTO `sp_info` VALUES ('1101', '新版梦5辣味', '', null, '10.00', null, null, null, null, null, null, '', '', '实物', null, null, null);
INSERT INTO `sp_info` VALUES ('1102', '新版梦5原味', '', null, '15.00', null, null, null, null, null, null, '', '', '实物', null, null, null);
INSERT INTO `sp_info` VALUES ('1103', '蓝氏鸡肉芝士全价成猫粮', '', null, '20.00', null, null, null, null, null, null, '', '', '实物', null, null, null);
INSERT INTO `sp_info` VALUES ('1104', '它时代宠物期刊杂志', '', null, '25.00', null, null, null, null, null, null, '', '', '实物', null, null, null);
INSERT INTO `sp_info` VALUES ('1105', '好慷七彩布（7条/包）', '', null, '30.00', null, null, null, null, null, null, '', '', '实物', null, null, null);
INSERT INTO `sp_info` VALUES ('1106', '易存网紫水晶手链2A，8mm，2串/份', '', null, '35.00', null, null, null, null, null, null, '', '', '实物', null, null, null);
INSERT INTO `sp_info` VALUES ('1107', '乐扣乐扣Ye Dr.Fresh Fine600ml漱口水', '', null, '40.00', null, null, null, null, null, null, '', '', '实物', null, null, null);
INSERT INTO `sp_info` VALUES ('1108', '瑞砂汉方足浴', '', null, '45.00', null, null, null, null, null, null, '', '', '实物', null, null, null);
INSERT INTO `sp_info` VALUES ('1109', '仁爱医院早早孕检测试纸（好运测试纸/笔型）', '', null, '50.00', null, null, null, null, null, null, '', '', '实物', null, null, null);
INSERT INTO `sp_info` VALUES ('1110', '米仔玉米儿童餐具', '', null, '55.00', null, null, null, null, null, null, '', '', '实物', null, null, null);
INSERT INTO `sp_info` VALUES ('1111', '防蓝光护眼LED灯泡，5W，电压220V-50Hz', '', null, '60.00', null, null, null, null, null, null, '', '', '实物', null, null, null);
INSERT INTO `sp_info` VALUES ('1112', '玉堂号素牛排或素牛筋一包（22g)', '', null, '65.00', null, null, null, null, null, null, '', '', '实物', null, null, null);
INSERT INTO `sp_info` VALUES ('1113', '菇盐固态复合调味料①', '', null, '70.00', null, null, null, null, null, null, '', '', '实物', null, null, null);
INSERT INTO `sp_info` VALUES ('1114', '蓝牙智能体温帖*1片', '', null, '75.00', null, null, null, null, null, null, '', '', '实物', null, null, null);
INSERT INTO `sp_info` VALUES ('1115', '纽卡姿环保健康指甲油10ml/瓶', '', null, '80.00', null, null, null, null, null, null, '', '', '实物', null, null, null);
INSERT INTO `sp_info` VALUES ('1116', '太太乐爱的礼物', '', null, '85.00', null, null, null, null, null, null, '', '', '实物', null, null, null);
INSERT INTO `sp_info` VALUES ('1117', '52度丰谷福酒', '', null, '90.00', null, null, null, null, null, null, '', '', '实物', null, null, null);
INSERT INTO `sp_info` VALUES ('1118', 'Silk植朴磨坊植物蛋白饮料', '', null, '95.00', null, null, null, null, null, null, '', '', '实物', null, null, null);
INSERT INTO `sp_info` VALUES ('1119', '瑞典蛋清洁面皂，净含量300g（50g六块装）', '', null, '100.00', null, null, null, null, null, null, '', '', '实物', null, null, null);
INSERT INTO `sp_info` VALUES ('1120', '“乐”牌乐口福30克/条', '', null, '105.00', null, null, null, null, null, null, '', '', '实物', null, null, null);
INSERT INTO `sp_info` VALUES ('1121', '新雪肌系列-茶树净油保湿乳液100ml/瓶', '', null, '110.00', null, null, null, null, null, null, '', '', '实物', null, null, null);
INSERT INTO `sp_info` VALUES ('1122', '泰椰椰牌椰子饮料（原味）300ml', '', null, '115.00', null, null, null, null, null, null, '', '', '实物', null, null, null);
INSERT INTO `sp_info` VALUES ('1123', '心居客全新强力去污乳②', '', null, '120.00', null, null, null, null, null, null, '', '', '实物', null, null, null);
INSERT INTO `sp_info` VALUES ('1124', '滁州贡菊', '', null, '125.00', null, null, null, null, null, null, '', '', '实物', null, null, null);
INSERT INTO `sp_info` VALUES ('1125', '现代牧业纯牛奶', '', null, '130.00', null, null, null, null, null, null, '', '', '实物', null, null, null);
INSERT INTO `sp_info` VALUES ('1126', '百家益腕表式激光治疗仪，HA-02旗舰款', '', null, '135.00', null, null, null, null, null, null, '', '', '实物', null, null, null);
INSERT INTO `sp_info` VALUES ('1127', '水果味棒棒糖（4种口味）①', '', null, '140.00', null, null, null, null, null, null, '', '', '实物', null, null, null);
INSERT INTO `sp_info` VALUES ('1128', '降雪儿南瓜酒（每瓶450ml）', '', null, '145.00', null, null, null, null, null, null, '', '', '实物', null, null, null);
INSERT INTO `sp_info` VALUES ('1129', '俪兰水母变色唇霜（15g）', '', null, '150.00', null, null, null, null, null, null, '', '', '实物', null, null, null);
INSERT INTO `sp_info` VALUES ('1234', '太太乐五福临门礼盒', '太太乐五福临门礼盒', '29.00', '30.00', '40.00', '30.00', '20.00', '0.80', '0.02', '4.00', '', '', '实物', '2015-10-07', '40', null);
INSERT INTO `sp_info` VALUES ('1235', '滁州贡菊', '滁州贡菊', '25.00', '25.00', '30.00', '20.00', '10.00', '0.50', '0.01', '1.00', '60*40*30', '盒', '实物', '2015-11-03', '180', null);
INSERT INTO `sp_info` VALUES ('1237', '现代牧业纯牛奶', '现代牧业纯牛奶', '5.50', '5.50', '20.00', '10.00', '10.00', '0.40', '0.00', '0.33', '40*30*20', '盒', '实物', null, '90', '2015-12-25');
INSERT INTO `sp_info` VALUES ('1239', '啦啦啦', null, '12.00', '12.00', '12.00', '12.30', '978.30', '123.22', '12.00', '344.00', '123*1323*12', '包', '实物', '2015-11-20', '12', null);
INSERT INTO `sp_info` VALUES ('1241', '我是商品1', null, null, null, null, null, null, null, null, null, '', '', '实物', null, null, '2015-12-30');
INSERT INTO `sp_info` VALUES ('1242', '我是商品2', null, null, null, null, null, null, null, null, null, '', '', '实物', null, null, '2015-12-30');
INSERT INTO `sp_info` VALUES ('1245', '商品444', '', null, null, null, null, null, null, null, null, '', '', '服务', null, null, null);
INSERT INTO `sp_info` VALUES ('1246', '商品4444', '', null, null, null, null, null, null, null, null, '', '', '', null, null, null);
INSERT INTO `sp_info` VALUES ('1247', '商品777', '商品777', null, null, null, null, null, null, null, null, '', '', '实物', null, null, null);
INSERT INTO `sp_info` VALUES ('1248', '我是一个小商品2', '我是试试', '20000.00', '30.00', '30.00', '20000.00', '10.00', '100.00', '300.00', '200.00', '比比', '个', '实物', '2015-11-25', '365', '2016-11-25');
INSERT INTO `sp_info` VALUES ('1249', '我是商品n', 'aaaaa', '10000.00', '10000.00', '10000.00', '100.30', '30000.00', '10000.00', '100000.00', '100000.00', '20******啦啦啦00000', '个', '实物', null, null, null);

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
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'a', '123');
INSERT INTO `user` VALUES ('2', 'b', '123');
INSERT INTO `user` VALUES ('3', 'wangyujia', '1234');
INSERT INTO `user` VALUES ('4', 'wangyujia', '1234');
INSERT INTO `user` VALUES ('5', 'zhijie', '1234');
INSERT INTO `user` VALUES ('8', 'lushifeng', '111');
INSERT INTO `user` VALUES ('11', 'do123', '123');
INSERT INTO `user` VALUES ('12', 'do123', '1234');
INSERT INTO `user` VALUES ('13', 'ai', 'ai');

-- ----------------------------
-- Table structure for yt_application
-- ----------------------------
DROP TABLE IF EXISTS `yt_application`;
CREATE TABLE `yt_application` (
  `yt_id` int(4) NOT NULL AUTO_INCREMENT,
  `sp_id` int(4) NOT NULL,
  `sp_name` varchar(30) DEFAULT NULL,
  `place_id` int(4) NOT NULL,
  `place` varchar(30) DEFAULT NULL,
  `unit` varchar(5) DEFAULT NULL,
  `expiration_date` date DEFAULT NULL,
  `hd_id` int(4) DEFAULT NULL,
  `yt_number` int(5) DEFAULT NULL,
  `yt_time` date DEFAULT NULL,
  `dateline` date DEFAULT NULL,
  `use_type` enum('其他','同城会','一元购','社区特卖','社区礼包','定时开','老虎机','摇一摇') DEFAULT NULL,
  PRIMARY KEY (`yt_id`),
  KEY `预提商品id` (`sp_id`) USING BTREE,
  KEY `place_id` (`place_id`),
  CONSTRAINT `place_id` FOREIGN KEY (`place_id`) REFERENCES `kc_place` (`kc_id`),
  CONSTRAINT `yt_sp_id` FOREIGN KEY (`sp_id`) REFERENCES `sp_info` (`sp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yt_application
-- ----------------------------
INSERT INTO `yt_application` VALUES ('1', '1234', '', '2', '一楼仓库', '盒', '2016-11-01', '105478', '200', '2015-11-03', '2015-11-20', '摇一摇');
INSERT INTO `yt_application` VALUES ('2', '1235', '', '1', '昆山仓库', '盒', '2017-12-01', '205478', '150', '2015-11-03', '2015-11-26', '老虎机');
INSERT INTO `yt_application` VALUES ('3', '1237', '', '2', '一楼仓库', '盒', '2016-08-08', '268745', '2000', '2015-10-15', '2015-11-15', '老虎机');
INSERT INTO `yt_application` VALUES ('4', '1', '', '7', '373号领奖处', '包', '2015-12-03', '1', '50', '2015-11-06', '2015-12-01', '老虎机');
INSERT INTO `yt_application` VALUES ('5', '1', null, '2', '一楼仓库', '包', '2015-12-01', '2', '100', '2015-11-06', '2015-12-30', '摇一摇');
INSERT INTO `yt_application` VALUES ('6', '3', null, '7', '373号领奖处', '包', '2016-01-01', '3', '30', '2015-11-09', '2015-11-30', '一元购');
INSERT INTO `yt_application` VALUES ('7', '3', null, '7', '373号领奖处', '包', '2016-01-15', '4', '50', '2015-11-10', '2015-12-30', '一元购');