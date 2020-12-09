/*
Navicat MySQL Data Transfer

Source Server         : pcc
Source Server Version : 50716
Source Host           : localhost:3306
Source Database       : digital

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2020-12-03 18:37:27
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `order_detail`
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail` (
  `o_id` int(11) NOT NULL,
  `p_id` int(11) NOT NULL,
  `num` int(11) DEFAULT NULL,
  PRIMARY KEY (`o_id`,`p_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES ('2', '2', '1');

-- ----------------------------
-- Table structure for `order_info`
-- ----------------------------
DROP TABLE IF EXISTS `order_info`;
CREATE TABLE `order_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `status` varchar(16) DEFAULT NULL,
  `ordertime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_info
-- ----------------------------
INSERT INTO `order_info` VALUES ('2', '1', '交易完成', '2013-07-19 14:55:55');

-- ----------------------------
-- Table structure for `product_info`
-- ----------------------------
DROP TABLE IF EXISTS `product_info`;
CREATE TABLE `product_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(16) DEFAULT NULL COMMENT '商品编号',
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(16) DEFAULT NULL,
  `brand` varchar(16) DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `num` int(11) unsigned zerofill DEFAULT NULL,
  `price` decimal(10,0) unsigned zerofill DEFAULT NULL,
  `sale` decimal(10,0) unsigned zerofill DEFAULT NULL COMMENT '促销减价',
  `intro` longtext,
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_info
-- ----------------------------
INSERT INTO `product_info` VALUES ('1', 'A10001', '戴尔(Dell) M4040(Ins14VR-6206B) 14英寸笔记本电脑 （双核E2-1800 2G 500G DVD刻 HD7450M 512M独显）黑色', '电脑', '戴尔', '/PengccProject/userfiles/images/A10001.png', '00000000200', '0000002399', '0000000100', '<p><img alt=\"\" src=\"/PengccProject/userfiles/images/A10001-1.png\" style=\"height: 493px; width: 700px\" /></p>\r\n\r\n<p><img alt=\"\" src=\"/PengccProject/userfiles/images/A10001-2.png\" style=\"height: 611px; width: 700px\" /></p>\r\n', '1');
INSERT INTO `product_info` VALUES ('2', 'A10002', '戴尔（DELL） Ins14zR-2318R 14英寸笔记本电脑（双核i3-3227U 2G 500G HD7570M 1G独显 蓝牙 Win8）红', '电脑', '戴尔', '/PengccProject/userfiles/images/A10002.png', '00000000097', '0000003299', '0000000100', '<p><img alt=\"\" src=\"/PengccProject/userfiles/images/A10002-1.png\" style=\"width: 700px; height: 430px;\" /></p>\r\n\r\n<p><img alt=\"\" src=\"/PengccProject/userfiles/images/A10002-2.png\" style=\"width: 700px; height: 498px;\" /></p>\r\n', '1');
INSERT INTO `product_info` VALUES ('3', 'A10004', '键盘', '其他', null, null, '00000000150', '0000000100', '0000000020', null, '1');
INSERT INTO `product_info` VALUES ('4', 'A10003', '戴尔（DELL） Ins14TR-3528 14英寸笔记本电脑（双核i5-3210M 4G 500G GT640M 2G独显 USB3.0关机充电 Win7）', '电脑', '戴尔', '/PengccProject/userfiles/images/A10003.png', '00000000099', '0000004399', '0000000100', '<p><img alt=\"\" src=\"/PengccProject/userfiles/images/A10003-1.png\" style=\"width: 500px; height: 451px;\" /></p>\r\n\r\n<p><img alt=\"\" src=\"/PengccProject/userfiles/images/A10003-2.png\" style=\"width: 500px; height: 478px;\" /></p>\r\n', '1');
INSERT INTO `product_info` VALUES ('5', 'A10005', '鼠标', '相册', '手机', 'null', '00000000200', '0000000200', '0000000010', '<p>null</p>\r\n', '1');

-- ----------------------------
-- Table structure for `user_info`
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(16) DEFAULT NULL,
  `password` varchar(16) DEFAULT NULL,
  `realName` varchar(8) DEFAULT NULL,
  `sex` varchar(4) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `question` varchar(50) DEFAULT NULL,
  `answer` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `favorate` varchar(50) DEFAULT NULL,
  `score` int(11) unsigned DEFAULT '0',
  `regDate` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('1', 'tom', '123321', '王小二', '?', '江苏省苏州市吴中区', '您的出生地是', '江苏苏州', 'tom@123.com', '电脑，手机，相机', null, '2013-07-14');
INSERT INTO `user_info` VALUES ('2', 'wen', '123', '张小三', '男', '江苏省南京市玄武区', '您的出生地是？', '江苏南京', 'wen@135.com', '电脑相，机', null, '2013-07-14');
INSERT INTO `user_info` VALUES ('3', 'pcc', '123', '彭长超', '男', '江苏省苏州市吴中区', '您的学校是？', '苏州工业职业技术学院', 'pcc@163.com', '电脑，手机', null, '2020-11-19');
