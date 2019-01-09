/*
 Navicat Premium Data Transfer

 Source Server         : springframework
 Source Server Type    : MySQL
 Source Server Version : 50528
 Source Host           : localhost:3306
 Source Schema         : springtransaction

 Target Server Type    : MySQL
 Target Server Version : 50528
 File Encoding         : 65001

 Date: 09/01/2019 10:29:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for chooseclass
-- ----------------------------
DROP TABLE IF EXISTS `chooseclass`;
CREATE TABLE `chooseclass`  (
  `CCId` int(11) NOT NULL AUTO_INCREMENT,
  `CCSnum` int(255) NOT NULL,
  `CChooseclass` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CChooseday` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CChoosetime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CChooseteacher` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`CCId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of chooseclass
-- ----------------------------
INSERT INTO `chooseclass` VALUES (1, 0, '0', '0', '0', '0');
INSERT INTO `chooseclass` VALUES (2, 2015407044, '管理沟通', '周六', '12', '敖二通');
INSERT INTO `chooseclass` VALUES (3, 2015407036, '知识产权法', '周六', '12', '艾伦');
INSERT INTO `chooseclass` VALUES (4, 2015407037, '心理学与生活', '周天', '34', '毕万波');
INSERT INTO `chooseclass` VALUES (5, 2015407037, '微观经济学', '周天', '12', '顾一罗');
INSERT INTO `chooseclass` VALUES (6, 2015407038, '世界军事', '周六', '90', '陈一司');
INSERT INTO `chooseclass` VALUES (7, 2015407035, '饮食与中国文化', '周天', '34', '谷三中');
INSERT INTO `chooseclass` VALUES (8, 2015407036, '大学生健康与运动', '周六', '78', '郭丛瑞');
INSERT INTO `chooseclass` VALUES (9, 2015407045, '欧洲一体化史', '周六', '12', '柏兰兰');
INSERT INTO `chooseclass` VALUES (10, 2015407045, '当前国际形势', '周六', '78', '宫业一');
INSERT INTO `chooseclass` VALUES (11, 2015407044, '计算机基础', '周天', '56', '韩丛羽');
INSERT INTO `chooseclass` VALUES (12, 2015407085, '欧洲一体化史', '周六', '12', '柏兰兰');
INSERT INTO `chooseclass` VALUES (13, 2015407085, '饮食与中国文化', '周天', '12', '谷三中');
INSERT INTO `chooseclass` VALUES (14, 2015407144, '欧洲一体化史', '周六', '12', '柏兰兰');
INSERT INTO `chooseclass` VALUES (15, 2015407144, '知识产权法', '周天', '78', '艾伦');


-- ----------------------------
-- Table structure for review
-- ----------------------------
DROP TABLE IF EXISTS `review`;
CREATE TABLE `review`  (
  `RId` int(255) NOT NULL AUTO_INCREMENT,
  `Rsnum` int(255) NOT NULL,
  PRIMARY KEY (`RId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of review
-- ----------------------------
INSERT INTO `review` VALUES (1, 0);
INSERT INTO `review` VALUES (2, 2015407044);
INSERT INTO `review` VALUES (3, 2015407045);
INSERT INTO `review` VALUES (4, 2015407085);
INSERT INTO `review` VALUES (5, 2015407144);

-- ----------------------------
-- Table structure for sclass
-- ----------------------------
DROP TABLE IF EXISTS `sclass`;
CREATE TABLE `sclass`  (
  `CId` int(100) NOT NULL AUTO_INCREMENT,
  `CSnum` int(100) NOT NULL,
  `CMonday` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CTuesday` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CWednesday` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CThursday` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CFriday` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`CId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sclass
-- ----------------------------
INSERT INTO `sclass` VALUES (1, 0, '0', '0', '0', '0', '0');
INSERT INTO `sclass` VALUES (2, 2015407034, '7,8:12345', '9,0:12345', '9,0:12345', '5,6:565656', '1,2:333333');
INSERT INTO `sclass` VALUES (3, 2015407044, '7,8:1123456666', '3,4:1111123', '7,8:1231156', '1,2:2323232323', '9,0:454444');
INSERT INTO `sclass` VALUES (4, 2015407099, '5,6:09111', '3,4:02345', '7,8:09111', '1,2:1213', '9,0:02345');
INSERT INTO `sclass` VALUES (5, 2015407066, '3,4:1123456666', '7,8:1123456666', '9,0:1123456666', '9,0:2323232323', '5,6:1111123');
INSERT INTO `sclass` VALUES (6, 2015407077, '7,8:2323232323', '7,8:3704123', '9,0:1123456666', '1,2:2323232323', '7,8:1235567888');
INSERT INTO `sclass` VALUES (7, 2015407033, '1,2:123344', '1,2:111333', '9,0:123112', '3,4:12334412', '7,8:545411');
INSERT INTO `sclass` VALUES (8, 2015407085, '9,0:02345', '5,6:45111', '1,2:2113', '3,4:09111', '9,0:7676');
INSERT INTO `sclass` VALUES (9, 2015407021, '3,4:0123', '3,4:0123', '1,2:7676', '1,2:45111', '9,0:7676');
INSERT INTO `sclass` VALUES (10, 2015407002, '3,4:222222222', '7,8:1123456666', '5,6:2323232323', '1,2:1123456666', '9,0:1231156');
INSERT INTO `sclass` VALUES (11, 2015407068, '1,2:3704123', '9,0:3704123', '1,2:989898', '3,4:1123456666', '7,8:345677865');
INSERT INTO `sclass` VALUES (12, 2015407036, '3,4:1123456666', '7,8:3704123', '9,0:989898', '7,8:454444', '9,0:1231156');
INSERT INTO `sclass` VALUES (13, 2015407045, '1,2:1231156', '1,2:454444', '9,0:1235567888', '1,2:1235567888', '1,2:1231156');
INSERT INTO `sclass` VALUES (14, 2015407144, '9,0:1231156', '7,8:454444', '1,2:1231156', '1,2:222222222', '5,6:1231156');

-- ----------------------------
-- Table structure for sexchange
-- ----------------------------
DROP TABLE IF EXISTS `sexchange`;
CREATE TABLE `sexchange`  (
  `SXId` int(255) NOT NULL AUTO_INCREMENT,
  `SXnum` int(255) NOT NULL,
  `SXname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `SXword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SXId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sexchange
-- ----------------------------
INSERT INTO `sexchange` VALUES (1, 0, '0', '0');
INSERT INTO `sexchange` VALUES (2, 2015407144, '龙湖', '你好');
INSERT INTO `sexchange` VALUES (3, 2015407144, '龙湖', 'zaijian');
INSERT INTO `sexchange` VALUES (4, 2015407144, '龙湖', '我叫龙湖');
INSERT INTO `sexchange` VALUES (5, 2015407244, '庄俊', 'asd');
INSERT INTO `sexchange` VALUES (6, 2015407144, '龙湖', 'asd123');

-- ----------------------------
-- Table structure for sgrade
-- ----------------------------
DROP TABLE IF EXISTS `sgrade`;
CREATE TABLE `sgrade`  (
  `GId` int(255) NOT NULL AUTO_INCREMENT,
  `GSnum` int(255) NOT NULL,
  `GTnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `GTname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `GTclass` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `GSgrade` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`GId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sgrade
-- ----------------------------
INSERT INTO `sgrade` VALUES (1, 0, '0', '0', '0', '0');
INSERT INTO `sgrade` VALUES (2, 2015407077, '2323232323', '王文', 'Android应用', 'a');
INSERT INTO `sgrade` VALUES (3, 2015407077, '3704123', '李文', 'springmvc', 'a');
INSERT INTO `sgrade` VALUES (4, 2015407077, '3704123', '李文', 'springmvc', 'a');
INSERT INTO `sgrade` VALUES (5, 2015407077, '3704123', '李文', 'springmvc', 'a');
INSERT INTO `sgrade` VALUES (6, 2015407033, '123344', '江函', '线性代数', '78');
INSERT INTO `sgrade` VALUES (7, 2015407033, '111333', '徐峰', '离散数学', 'a');
INSERT INTO `sgrade` VALUES (8, 2015407033, '123112', '刘晶', '高等数学', '33');
INSERT INTO `sgrade` VALUES (9, 2015407033, '12334412', '鑫丰', '线性代数', 'a');
INSERT INTO `sgrade` VALUES (10, 2015407033, '545411', '柏喜', '离散数学', 'a');
INSERT INTO `sgrade` VALUES (11, 2015407000, '123344', '江函', '线性代数', '45');
INSERT INTO `sgrade` VALUES (12, 2015407085, '02345', '张继', '民间文学', 'a');
INSERT INTO `sgrade` VALUES (13, 2015407085, '45111', '光至', '语言学概论', 'a');
INSERT INTO `sgrade` VALUES (14, 2015407085, '2113', '敬启', '中国现当代汉语史', 'a');
INSERT INTO `sgrade` VALUES (15, 2015407085, '09111', '张翰', '民间文学', 'a');
INSERT INTO `sgrade` VALUES (16, 2015407085, '7676', '盛广开', '语言学概论', 'a');
INSERT INTO `sgrade` VALUES (17, 2015407021, '0123', '于芳', '民间文学', 'a');
INSERT INTO `sgrade` VALUES (18, 2015407021, '7676', '盛广开', '语言学概论', 'a');
INSERT INTO `sgrade` VALUES (19, 2015407021, '45111', '光至', '语言学概论', 'a');
INSERT INTO `sgrade` VALUES (20, 2015407002, '222222222', '王九', 'Android应用', 'a');
INSERT INTO `sgrade` VALUES (21, 2015407002, '1123456666', '莉华', 'springmvc', 'a');
INSERT INTO `sgrade` VALUES (22, 2015407002, '2323232323', '王文', 'Android应用', 'a');
INSERT INTO `sgrade` VALUES (23, 2015407002, '1231156', '雪十', 'springmvc', 'a');
INSERT INTO `sgrade` VALUES (24, 2015407068, '3704123', '李文', 'springmvc', 'a');
INSERT INTO `sgrade` VALUES (25, 2015407068, '989898', '徐欣', '软件构造', 'a');
INSERT INTO `sgrade` VALUES (26, 2015407068, '1123456666', '莉华', 'springmvc', 'a');
INSERT INTO `sgrade` VALUES (27, 2015407068, '345677865', '李龙', 'springmvc', 'a');
INSERT INTO `sgrade` VALUES (28, 2015407036, '1123456666', '莉华', 'springmvc', 'a');
INSERT INTO `sgrade` VALUES (29, 2015407036, '3704123', '李文', 'springmvc', 'a');
INSERT INTO `sgrade` VALUES (30, 2015407036, '989898', '徐欣', '软件构造', 'a');
INSERT INTO `sgrade` VALUES (31, 2015407036, '454444', '郑尧', '软件构造', '45');
INSERT INTO `sgrade` VALUES (32, 2015407036, '1231156', '雪十', 'springmvc', 'a');
INSERT INTO `sgrade` VALUES (33, 2015407045, '1231156', '雪十', 'springmvc', 'a');
INSERT INTO `sgrade` VALUES (34, 2015407045, '454444', '郑尧', '软件构造', 'a');
INSERT INTO `sgrade` VALUES (35, 2015407045, '1235567888', '灵梦', 'Android应用', 'a');
INSERT INTO `sgrade` VALUES (36, 2015407085, 'qwe', '谷三中', '饮食与中国文化', 'a');
INSERT INTO `sgrade` VALUES (37, 2015407144, '1231156', '雪十', 'springmvc', 'a');
INSERT INTO `sgrade` VALUES (38, 2015407144, '454444', '郑尧', '软件构造', 'a');
INSERT INTO `sgrade` VALUES (39, 2015407144, '222222222', '王九', 'Android应用', 'a');
INSERT INTO `sgrade` VALUES (40, 2015407144, 'qwe', '柏兰兰', '欧洲一体化史', 'a');
INSERT INTO `sgrade` VALUES (41, 2015407144, 'qwe', '艾伦', '知识产权法', 'a');

-- ----------------------------
-- Table structure for sinfo
-- ----------------------------
DROP TABLE IF EXISTS `sinfo`;
CREATE TABLE `sinfo`  (
  `SIid` int(11) NOT NULL AUTO_INCREMENT,
  `SInum` int(255) NOT NULL,
  `SItel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `SIgender` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `SInation` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `SIacademy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `SImajor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `SIprovince` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SItown` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SIaddress` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SIidcard` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SIid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sinfo
-- ----------------------------
INSERT INTO `sinfo` VALUES (1, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sinfo` VALUES (2, 2015407044, '17864298897', '男', '汉族', '计算机学院', '软件工程', '湖北省', '武汉市', '武汉市市中心', '123123123');
INSERT INTO `sinfo` VALUES (3, 2015407044, '17864298897', '男', '汉族', '计算机学院', '软件工程', '吉林省', '长春市', '长春市市中心', '123123123');
INSERT INTO `sinfo` VALUES (4, 2015407041, '17864298897', '男', '壮族', '计算机学院', '纺织', '山东省', '济南市', '济南市市中心', '123123123');
INSERT INTO `sinfo` VALUES (5, 2015407011, '17864298897', '男', '汉族', '计算机学院', '软件工程', '湖南省', '长沙市', '长沙市市中心', '123123123');
INSERT INTO `sinfo` VALUES (6, 2015407033, '17864298897', '男', '汉族', '数学学院', '数学', '宁夏回族自治区', '银川市', 'asdasd', '123123123123');
INSERT INTO `sinfo` VALUES (7, 2015407033, '17864298897', '男', '汉族', '数学学院', '数学', '北京', '北京市', '北京市中区', '123123123123');
INSERT INTO `sinfo` VALUES (8, 2015407022, '17864298897', '男', '壮族', '纺织学院', '纺织', '北京', '北京市', '北京市中区', '123123123123');
INSERT INTO `sinfo` VALUES (9, 2015407023, '17864298897', '男', '汉族', '计算机学院', '软件工程', '北京', '北京市', '北京市中区', '123123123123');
INSERT INTO `sinfo` VALUES (10, 2015407066, '17864298897', '男', '汉族', '计算机学院', '软件工程', '河北省', '石家庄市', '石家庄市中区', '370402198702021111');
INSERT INTO `sinfo` VALUES (11, 2015407055, '17864298897', '男', '汉族', '计算机学院', '软件工程', '北京', '北京市', '北京市中区', '2222222222222');
INSERT INTO `sinfo` VALUES (12, 2015407077, '17864298897', '男', '汉族', '计算机学院', '软件工程', '北京', '北京市', '北京市中区', '370402198702020000');
INSERT INTO `sinfo` VALUES (13, 2015407034, '17864298897', '男', '汉族', '纺织学院', '纺织', '北京', '北京市', '北京市中区', '123123123123');
INSERT INTO `sinfo` VALUES (14, 2015407099, '17864298897', '男', '汉族', '计算机学院', '汉语', '北京', '北京市', '北京市中区', '123123123123');
INSERT INTO `sinfo` VALUES (15, 2015407085, '17864298897', '男', '汉族', '汉语学院', '汉语', '北京', '北京市', '北京市中区', '370402198702021234');
INSERT INTO `sinfo` VALUES (16, 2015407021, '17864298897', '男', '汉族', '汉语学院', '汉语', '北京', '北京市', '北京市中区', '123123123123');
INSERT INTO `sinfo` VALUES (17, 2015407002, '17864298897', '男', '汉族', '计算机学院', '软件工程', '北京', '北京市', '北京市中区', '123123123123');
INSERT INTO `sinfo` VALUES (18, 2015407068, '17864298897', '男', '汉族', '计算机学院', '软件工程', '北京', '北京市', '北京市中区', '123123123123');
INSERT INTO `sinfo` VALUES (19, 2015407038, '17864298897', '男', '汉族', '计算机学院', '软件工程', '北京', '北京市', '北京市中区', '123123123123');
INSERT INTO `sinfo` VALUES (20, 2015407031, '17864298897', '男', '汉族', '计算机学院', '软件工程', '北京', '北京市', '北京市中区', '123123123123');
INSERT INTO `sinfo` VALUES (21, 2015407036, '17864298897', '女', '汉族', '计算机学院', '软件工程', '北京', '北京市', '北京市中区', '123123123123');
INSERT INTO `sinfo` VALUES (22, 2015407045, '17864296168', '女', '汉族', '计算机学院', '软件工程', '北京', '北京市', '北京市中区', '123123123123');
INSERT INTO `sinfo` VALUES (23, 2015407144, '17864298897', '女', '汉族', '计算机学院', '软件工程', '北京', '北京市', '北京市中区', '123123123123');

-- ----------------------------
-- Table structure for sregister
-- ----------------------------
DROP TABLE IF EXISTS `sregister`;
CREATE TABLE `sregister`  (
  `SId` int(11) NOT NULL AUTO_INCREMENT,
  `Snum` int(11) NOT NULL COMMENT '学生学号',
  `Sname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学生姓名',
  `Spassword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学生密码',
  PRIMARY KEY (`SId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sregister
-- ----------------------------
INSERT INTO `sregister` VALUES (1, 0, 'a', 'a');
INSERT INTO `sregister` VALUES (2, 2015407044, '张三', 'asd123');
INSERT INTO `sregister` VALUES (3, 2015407041, '李四', '123');
INSERT INTO `sregister` VALUES (4, 2015407022, '王二', '123');
INSERT INTO `sregister` VALUES (5, 2015407023, '李武', '111111');
INSERT INTO `sregister` VALUES (6, 2015407048, '刘玉', '123123');
INSERT INTO `sregister` VALUES (7, 2015407011, '李给', '123123');
INSERT INTO `sregister` VALUES (8, 2015407033, '王六', '123123');
INSERT INTO `sregister` VALUES (9, 2015407055, '里斯', 'aaaaaa');
INSERT INTO `sregister` VALUES (10, 2015407066, '刘恒', '111111');
INSERT INTO `sregister` VALUES (11, 2015407077, '梅乌', 'qweqwe');
INSERT INTO `sregister` VALUES (12, 2015407021, '王洪', '123456');
INSERT INTO `sregister` VALUES (13, 2015407034, '王金', '123123');
INSERT INTO `sregister` VALUES (14, 2015407099, '红柿', '123');
INSERT INTO `sregister` VALUES (15, 2015407085, '灵心', '111');
INSERT INTO `sregister` VALUES (16, 2015407002, '张汉', '111');
INSERT INTO `sregister` VALUES (17, 2015407068, '张三', '123');
INSERT INTO `sregister` VALUES (18, 2015407038, '张柳', '111');
INSERT INTO `sregister` VALUES (19, 2015407031, '乐山', '111');
INSERT INTO `sregister` VALUES (20, 2015407036, '张哈', '111');
INSERT INTO `sregister` VALUES (21, 2015407045, 'fairy', '111');
INSERT INTO `sregister` VALUES (22, 2015407144, '龙湖', '111');
INSERT INTO `sregister` VALUES (23, 2015407244, '庄俊', '123');
INSERT INTO `sregister` VALUES (24, 2015407444, '王六', '111');

-- ----------------------------
-- Table structure for texchange
-- ----------------------------
DROP TABLE IF EXISTS `texchange`;
CREATE TABLE `texchange`  (
  `TXId` int(255) NOT NULL AUTO_INCREMENT,
  `TXnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TXname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TXword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`TXId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of texchange
-- ----------------------------
INSERT INTO `texchange` VALUES (1, '0', '0', '0');
INSERT INTO `texchange` VALUES (3, '454444', '郑尧', '你哈珀');
INSERT INTO `texchange` VALUES (4, '454444', '郑尧', 'zxc');
INSERT INTO `texchange` VALUES (5, '1234556', '刘龙', '123');
INSERT INTO `texchange` VALUES (6, '454444', '郑尧', 'asd');

-- ----------------------------
-- Table structure for tregister
-- ----------------------------
DROP TABLE IF EXISTS `tregister`;
CREATE TABLE `tregister`  (
  `TId` int(11) NOT NULL AUTO_INCREMENT,
  `Tnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Tname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Tmajor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Tclass` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Tpassword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`TId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tregister
-- ----------------------------
INSERT INTO `tregister` VALUES (1, '0', '0', '0', '0', '0');
INSERT INTO `tregister` VALUES (2, '3704123', '李文', '软件工程', 'springmvc', '111111');
INSERT INTO `tregister` VALUES (3, '1231156', '雪十', '软件工程', 'springmvc', 'qqqqqq');
INSERT INTO `tregister` VALUES (4, '345677865', '李龙', '软件工程', 'springmvc', 'qweqwe');
INSERT INTO `tregister` VALUES (5, '1123456666', '莉华', '软件工程', 'springmvc', '111111');
INSERT INTO `tregister` VALUES (6, '1235567888', '灵梦', '软件工程', 'Android应用', '111111');
INSERT INTO `tregister` VALUES (7, '222222222', '王九', '软件工程', 'Android应用', '111111');
INSERT INTO `tregister` VALUES (8, '2323232323', '王文', '软件工程', 'Android应用', '111111');
INSERT INTO `tregister` VALUES (9, '1111123', '龙飞', '软件工程', '软件构造', 'qweqwe');
INSERT INTO `tregister` VALUES (10, '777777777', '郑华', '纺织', '纺织应用化学', 'lololo');
INSERT INTO `tregister` VALUES (11, '565656', '费兴', '纺织', '纺织应用化学', 'aaaaaa');
INSERT INTO `tregister` VALUES (12, '666664444', '龙工', '纺织', '纺织应用化学', '123123');
INSERT INTO `tregister` VALUES (13, '989898', '徐欣', '软件工程', '软件构造', 'qqqqqq');
INSERT INTO `tregister` VALUES (14, '454444', '郑尧', '软件工程', '软件构造', 'zzzzzz');
INSERT INTO `tregister` VALUES (15, '333333', '风华', '纺织', '现代纺织加工技术', 'qwe');
INSERT INTO `tregister` VALUES (16, '123123', '徐凯', '纺织', '现代纺织加工技术', '123');
INSERT INTO `tregister` VALUES (17, '5553221', '宁静', '纺织', '现代纺织加工技术', 'aaa');
INSERT INTO `tregister` VALUES (18, '1221', '华文', '纺织', '纺织应用化学', 'zxc');
INSERT INTO `tregister` VALUES (19, '12345', '静江', '纺织', '纺织最优化设计与分析', 'fff');
INSERT INTO `tregister` VALUES (20, '654654', '田舒', '纺织', '纺织最优化设计与分析', 'bbb');
INSERT INTO `tregister` VALUES (21, '4544441', '阿斯顿', '纺织', '纺织最优化设计与分析', 'qqq');
INSERT INTO `tregister` VALUES (22, '123344', '江函', '数学', '线性代数', 'qwe');
INSERT INTO `tregister` VALUES (23, '12334412', '鑫丰', '数学', '线性代数', 'qweqwe');
INSERT INTO `tregister` VALUES (24, '87231', '公琴', '数学', '线性代数', 'fff');
INSERT INTO `tregister` VALUES (25, '44343', '李峰', '数学', '高等数学', 'sss');
INSERT INTO `tregister` VALUES (26, '6565123', '罗华', '数学', '高等数学', '123');
INSERT INTO `tregister` VALUES (27, '123112', '刘晶', '数学', '高等数学', 'qqq');
INSERT INTO `tregister` VALUES (28, '111222', '徐闻', '数学', '离散数学', 'aaa');
INSERT INTO `tregister` VALUES (29, '111333', '徐峰', '数学', '离散数学', 'sss');
INSERT INTO `tregister` VALUES (30, '545411', '柏喜', '数学', '离散数学', 'fff');
INSERT INTO `tregister` VALUES (31, '7676', '盛广开', '汉语', '语言学概论', 'uuu');
INSERT INTO `tregister` VALUES (32, '99887', '刘宋', '汉语', '语言学概论', 'xxx');
INSERT INTO `tregister` VALUES (33, '45111', '光至', '汉语', '语言学概论', '1qq');
INSERT INTO `tregister` VALUES (34, '2113', '敬启', '汉语', '中国现当代汉语史', 'ppp');
INSERT INTO `tregister` VALUES (35, '1213', '张晋', '汉语', '中国现当代汉语史', 'zzz');
INSERT INTO `tregister` VALUES (36, '65654', '广丰顺', '汉语', '中国现当代汉语史', 'aaz');
INSERT INTO `tregister` VALUES (37, '09111', '张翰', '汉语', '民间文学', 'ggg');
INSERT INTO `tregister` VALUES (38, '0123', '于芳', '汉语', '民间文学', 'eee');
INSERT INTO `tregister` VALUES (39, '02345', '张继', '汉语', '民间文学', 'ttt');
INSERT INTO `tregister` VALUES (40, '1234556', '刘龙', '数学', '离散数学', '123');
INSERT INTO `tregister` VALUES (41, '123456', '雪十', '数学', '离散数学', '111');
INSERT INTO `tregister` VALUES (42, '12121212', '王微微', '纺织', '纺织应用化学', '111');

SET FOREIGN_KEY_CHECKS = 1;
