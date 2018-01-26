/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50720
 Source Host           : localhost
 Source Database       : xxshop

 Target Server Type    : MySQL
 Target Server Version : 50720
 File Encoding         : utf-8

 Date: 01/26/2018 14:03:57 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `shop_address`
-- ----------------------------
DROP TABLE IF EXISTS `shop_address`;
CREATE TABLE `shop_address` (
  `id` char(32) NOT NULL,
  `userid` char(32) NOT NULL,
  `accept` varchar(20) DEFAULT NULL COMMENT '收货人（与用户不同）',
  `zip` char(6) DEFAULT NULL COMMENT '邮编',
  `phoneNum` varchar(13) DEFAULT NULL COMMENT '电话',
  `mobile` char(11) NOT NULL COMMENT '手机',
  `province` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `area` varchar(20) NOT NULL,
  `address` varchar(30) NOT NULL,
  `isdefault` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_SHOP_ADD_REFERENCE_SHOP_USE` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `shop_address`
-- ----------------------------
BEGIN;
INSERT INTO `shop_address` VALUES ('14a16cd98f4d4b879272d32937f08409', '1de124d43e8b4d2b9f388087f9766e36', '杭三', '250000', '010-25639687', '13562626262', '北京', '市辖区', '西城区', '很多事', '1'), ('203e58a9cd2b4301b3d7fc291619026e', 'f23ef84ff50e467b84ce8ed9cc81c84e', '华鑫', '437000', '18186533315', '18186533315', '湖北', '咸宁市', '咸安区', '湖北科技学院温泉校区东区', '2'), ('3e540ce48be94773a0d3d31876eb091f', '250f423a093f41319127a57b9bc0e5a8', '李白', '250000', '010-12345688', '13588888888', '北京', '县', '延庆县', '北京四环外', '1'), ('ad9e690c7fa5489aaa3fb28b876f48fa', 'f23ef84ff50e467b84ce8ed9cc81c83e', '华鑫', '437000', '18186533315', '18186533315', '湖北', '咸宁市', '咸安区', '湖北科技学院温泉校区东区', '1'), ('c5b343173cc545ef909ac6e0a49de2f4', 'f23ef84ff50e467b84ce8ed9cc81c84e', '方法', '', '', '', '北京', '市辖区', '东城区', '方式发送到', '1'), ('d246137b5295422bab49f004c14b6c09', 'f23ef84ff50e467b84ce8ed9cc81c83e', '汪茜芸', '437000', '18186533315', '18186533315', '湖北', '咸宁市', '咸安区', '湖北科技学院温泉校区西区', '2'), ('e82f7add1e2d47a3b2e32d36cf888777', '15bbe9543c474f119c6d00ed27fad6fe', '华鑫', '437000', '13636036616', '13636036616', '湖北', '咸宁市', '咸安区', '咸宁大道88号', '1');
COMMIT;

-- ----------------------------
--  Table structure for `shop_cart`
-- ----------------------------
DROP TABLE IF EXISTS `shop_cart`;
CREATE TABLE `shop_cart` (
  `id` char(32) NOT NULL,
  `userid` char(32) NOT NULL,
  `goodsid` char(32) NOT NULL,
  `num` int(11) NOT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `shop_cart`
-- ----------------------------
BEGIN;
INSERT INTO `shop_cart` VALUES ('2873f1d5b47242a3a08ea4a835db9ed4', '250f423a093f41319127a57b9bc0e5a8', 'db9efbd7c28b4c279f0d1f7cc4dd32b1', '1', '1299'), ('5c424d99f1a84897bd7e74ff121d283e', '250f423a093f41319127a57b9bc0e5a8', '04ec26885efc45bd9537711f7db8fabe', '1', '88'), ('adca81e38f554217a6579a58aa7068d2', 'f23ef84ff50e467b84ce8ed9cc81c84e', '4ec00eb43855403aa81dde1d8a05d538', '1', '3199'), ('b2d86ffdedab4c95ba7168b493834314', '250f423a093f41319127a57b9bc0e5a8', '04ec26885efc45bd9537711f7db8fabe', '1', '88'), ('e4dac71d09da481a9f5efdfb6f41f181', '250f423a093f41319127a57b9bc0e5a8', '09099d7e183349669e3596462bd8846d', '1', '4799');
COMMIT;

-- ----------------------------
--  Table structure for `shop_category`
-- ----------------------------
DROP TABLE IF EXISTS `shop_category`;
CREATE TABLE `shop_category` (
  `id` char(32) NOT NULL,
  `name` varchar(255) NOT NULL,
  `goodsNum` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `shop_category`
-- ----------------------------
BEGIN;
INSERT INTO `shop_category` VALUES ('05dca3df8e2148b9b40614ffba993fe4', '数码相机', '10'), ('11f141d175ba4d588dac3ebe703662ce', '键盘鼠标', '9'), ('1d3c3584d6164047acd4cff929a9eeef', '手机', '11'), ('3abc475d0745493c883388798717e50e', '台式机', '8'), ('4cff6d6c6c434659bf192b8dbd3814df', '笔记本电脑', '8'), ('df0d1b6ea4014d4f8ee6d823f0db9ee7', '平板电脑', '10'), ('fd06a9d05edb4590ae54b10cfd3b791d', '移动硬盘', '0'), ('huhduisa', '手表', '1');
COMMIT;

-- ----------------------------
--  Table structure for `shop_comment`
-- ----------------------------
DROP TABLE IF EXISTS `shop_comment`;
CREATE TABLE `shop_comment` (
  `id` char(32) NOT NULL,
  `ownerid` char(32) NOT NULL,
  `targetid` char(32) NOT NULL,
  `statusnum` int(1) NOT NULL,
  `remark` varchar(256) DEFAULT NULL,
  `createtime` char(20) NOT NULL,
  `score` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `shop_comment`
-- ----------------------------
BEGIN;
INSERT INTO `shop_comment` VALUES ('1', '15bbe9543c474f119c6d00ed27fad6fe', 'db9efbd7c28b4c279f0d1f7cc4dd32b1', '0', '小米性价比很高。特别是这一款！', '2018-01-18', '5'), ('19c9b5827c6c41feab2f5c4ad25e00bb', '15bbe9543c474f119c6d00ed27fad6fe', 'db9efbd7c28b4c279f0d1f7cc4dd32b1', '0', '小米很不错', '2018-01-18  15:57:46', '0'), ('6877859312934f0ea0315de6344a82fa', '250f423a093f41319127a57b9bc0e5a8', '8b1947e8e9dc4055bba9ab97c4710bad', '1', '帮了大忙了', '2018-01-24  12:44:16', '0'), ('78ddf6bd845c4e1e815f417b164e8b4b', '250f423a093f41319127a57b9bc0e5a8', 'db9efbd7c28b4c279f0d1f7cc4dd32b1', '0', '很菜，不好用', '2018-01-19  08:33:06', '2'), ('8b1947e8e9dc4055bba9ab97c4710bad', 'f23ef84ff50e467b84ce8ed9cc81c84e', '0866079a93de4f99a83660abf3d41ddd', '0', '这个电脑不错！！', '2018-01-22  21:40:49', '5'), ('ac8ea03031584dbdbb727ed8ee5a8815', 'f23ef84ff50e467b84ce8ed9cc81c84e', 'db9efbd7c28b4c279f0d1f7cc4dd32b1', '0', '还是蛮喜欢小米的，特别的是白色款！', '2018-01-18  16:46:54', '4'), ('e74d7a23067242c9b8ada5da9a1a0d3c', 'f23ef84ff50e467b84ce8ed9cc81c84e', 'db9efbd7c28b4c279f0d1f7cc4dd32b1', '0', '这是第五部手机，超级爱小米！！！', '2018-01-18  16:39:24', '5');
COMMIT;

-- ----------------------------
--  Table structure for `shop_goods`
-- ----------------------------
DROP TABLE IF EXISTS `shop_goods`;
CREATE TABLE `shop_goods` (
  `id` char(32) NOT NULL,
  `goodsno` varchar(20) NOT NULL,
  `name` varchar(200) NOT NULL,
  `categoryid` char(32) NOT NULL,
  `price1` float NOT NULL,
  `price2` float NOT NULL,
  `stock` int(11) NOT NULL COMMENT '库存',
  `thumbnail` char(50) NOT NULL,
  `description` varchar(300) NOT NULL,
  `role` int(11) NOT NULL COMMENT '表示商品的热卖程度，值越大，显示越靠前 ',
  `selltime` int(11) NOT NULL COMMENT '表示商品的新度，值越大，表示是最新的推出商品',
  `sellnum` int(11) NOT NULL COMMENT '商品的销量',
  `score` float NOT NULL COMMENT '用户的评分',
  PRIMARY KEY (`id`),
  KEY `FK_SHOP_GOO_REFERENCE_SHOP_CAT` (`categoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `shop_goods`
-- ----------------------------
BEGIN;
INSERT INTO `shop_goods` VALUES ('034db61a861345f9bb681b7f283dd1e1', 'XX201601082055145514', '宏碁(acer) V3-572G 15.6英寸笔记本电脑（i5-5200U 4G 500G GeForce 840M 2G独显 win8.1）银色', '4cff6d6c6c434659bf192b8dbd3814df', '3499', '3299', '580', 'goodsimage/bfd2008fcbfb4cfcafc95983cf57dfec.jpg', '商品名称：宏碁V3-572G-51MR\r\n品牌： 宏碁（acer）\r\n上架时间：2015-02-09 20:06:46\r\n商品毛重：3.5kg\r\n商品产地：中国大陆\r\n系统：Windows 8\r\n硬盘容量：500G\r\n显卡：高性能独显\r\n处理器：Intel i5\r\n分辨率：普通屏（1366×768）\r\n尺寸：15.6英寸\r\n适用人群：校园学生，商务办公，其它\r\n内存容量：4G\r\n', '8', '8', '0', '0'), ('04ec26885efc45bd9537711f7db8fabe', 'XX201601081238263826', '黑爵锋尚X3000 无线游戏键鼠套装 2.4G静音省电 无线键盘鼠标', '11f141d175ba4d588dac3ebe703662ce', '110', '88', '350', 'goodsimage/1e75a9a69c654af48d4446e0135e92f4.jpg', '上架时间：2015-08-31 \r\n商品毛重：1.2kg\r\n货号：黑爵锋尚X3000\r\n类别：无线套装\r\n接口：USB接口\r\n', '8', '5', '0', '6'), ('0866079a93de4f99a83660abf3d41ddd', 'XX201601082056225622', '三星（SAMSUNG）270E5K-X05 15.6英寸笔记本电脑（i5-5200U 4G 500G 2G独显 DVD刻录 WIN10 蓝牙4.0）象牙白', '4cff6d6c6c434659bf192b8dbd3814df', '3855', '3699', '686', 'goodsimage/38229862cf384c2dac4a01b9bf2a4c50.jpg', '商品名称：三星NP270E5K-X05CN\r\n品牌： 三星（SAMSUNG）\r\n上架时间：2015-09-29 18:06:06\r\n商品毛重：3.02kg\r\n商品产地：中国大陆\r\n系统：Windows 10\r\n硬盘容量：500G\r\n显卡：入门级独显\r\n处理器：Intel i5\r\n分辨率：普通屏（1366×768）\r\n尺寸：15.6英寸\r\n适用人群：校园学生，商务办公\r\n内存容量：4G\r\n', '8', '9', '0', '0'), ('09099d7e183349669e3596462bd8846d', 'XX201601082114421442', '松下 Lumix DMC-FZ1000 数码相机 黑色 4K（1英寸大底CMOS 2090万像素 F2.8-4.0 16倍光学变焦）', '05dca3df8e2148b9b40614ffba993fe4', '4999', '4799', '879', 'goodsimage/6b2f511a856d4e40aebb0a58f4f66773.jpg', '品牌	松下 Panasonic\r\n系列	长焦数码相机\r\n型号	FZ1000GK\r\n颜色	黑色\r\n数码相机类型	长焦相机\r\n光学变焦倍数	16倍\r\n总像素	2090万\r\n有效像素	2010万\r\n数码变焦倍数	4倍\r\n操作模式	全自动\r\n传感器类型	CMOS\r\n传感器尺寸	1英寸\r\n最大分辨率	5472x3648\r\n短片拍摄	3840 x 2160 像素, 25p (4K： 100Mbps / MP4) 1920 x 1080 像素, 50p (FHD： 28Mbps / AVCHD) 640 x 480, 25p (VGA： 4Mbps / MP4)\r\n语言	英文、中文等\r\n', '8', '9', '0', '6'), ('0ec9fcdc54e94189aa554135617828ce', 'XX2016010722000404', '华硕（ASUS）ZenPad10 Z300C 10.1英寸IPS广视角平板 Intel 64位四核处理器 2GB 16GB 蓝牙4.0 金', 'df0d1b6ea4014d4f8ee6d823f0db9ee7', '1400', '1299', '629', 'goodsimage/93f09e04495e4c20adc4b733e9b6ffa3.jpg', '屏幕尺寸	10.1英寸\r\n屏幕分辨率	1280*800\r\n屏幕比例	16:10\r\n', '8', '7', '0', '6'), ('13c84b9842ec4d7a8f000eef0901fa63', 'XX201601081254185418', '联想 乐檬 K3（K30-T）16G 清新白 移动4G手机 双卡双待', '1d3c3584d6164047acd4cff929a9eeef', '550', '499', '580', 'goodsimage/d0e2bfc0d2d14ede90a4ed1a68d9690f.jpg', '屏幕尺寸	5.0英寸\r\n触摸屏	超灵敏5点触控\r\n分辨率	1280×720(HD,720P)\r\nPPI	294 PPI\r\n屏幕材质	全贴合IPS视网膜屏幕\r\n超大字体	支持\r\n', '7', '8', '0', '6'), ('174fe448869b45c9890b43f24793ff1d', 'XX201601072155155515', '酷比魔方 iwork10旗舰本 10.1英寸平板电脑（Intel Atom X5 正版windows10 4G/64GB 1920*1200）前黑后蓝', 'df0d1b6ea4014d4f8ee6d823f0db9ee7', '1109', '999', '650', 'goodsimage/abbfcb460a874202988f77a8e49fe281.jpg', '屏幕尺寸	10.1英寸\r\n屏幕分辨率	1920x1200\r\n屏幕比例	16:10\r\n屏幕类型	IPS\r\n屏幕描述	电容屏\r\n指取设备	触摸\r\n', '8', '6', '0', '6'), ('22395b73210745a9b6c4d5f4d1d5a12a', 'XX20160108211301131', '奥林巴斯（OLYMPUS） SP-100EE 长焦数码相机 黑（“鹰眼”红外瞄准器 50倍光学变焦）（赠8G卡）', '05dca3df8e2148b9b40614ffba993fe4', '1999', '1799', '719', 'goodsimage/eef007cb8fde4004a17bd04d6ddef974.jpg', '品牌	奥林巴斯 OLYMPUS\r\n系列	SP\r\n型号	SP-100EE\r\n颜色	黑色\r\n上市时间	2014年2月\r\n数码相机类型	长焦相机\r\n光学变焦倍数	50倍\r\n机身材质	工程塑料\r\n总像素	1670万像素\r\n有效像素	1600万像素\r\n数码变焦倍数	4倍\r\n操作模式	手动\r\n传感器类型	CMOS\r\n传感器尺寸	1/2.3英寸\r\n最大分辨率	4288x3216\r\n图像处理系统	TruePic VII\r\n短片拍摄	1920x1080\r\n语言	多国语言\r\n', '8', '9', '0', '0'), ('2372cf18c7944dcc99aad105c7f9aab5', 'XX201601082111431143', '富士（FUJIFILM）X100T 数码旁轴相机 银色（1630万像素 3.0英寸屏 23mmF2定焦镜头 混合取景器 WiFi）', '05dca3df8e2148b9b40614ffba993fe4', '6322', '5999', '730', 'goodsimage/59fdc933a7f247ac858cb867261b9ed5.jpg', '品牌	富士 FUJIFILM\r\n系列	X系列\r\n型号	X100T\r\n颜色	银色\r\n上市时间	2014.10\r\n数码相机类型	高端紧凑型相机\r\n光学变焦倍数	定焦镜头\r\n机身材质	合成金属\r\n总像素	1600-1800万\r\n有效像素	1600以上\r\n数码变焦倍数	定焦镜头\r\n操作模式	手动\r\n传感器类型	CMOS\r\n传感器尺寸	APS-C\r\n最大分辨率	1630万有效像素\r\n图像处理系统	EXR处理器II\r\n短片拍摄	1920x1080\r\n语言	35国语言\r\n', '7', '9', '0', '0'), ('2968fa8ef05d4e029c675a1c2f2e1c73', 'XX20160108210833833', '索尼（SONY） DSC-W800 数码相机 黑色（2010万像素 5倍光学变焦 2.7英寸屏 26mm广角）', '05dca3df8e2148b9b40614ffba993fe4', '750', '599', '860', 'goodsimage/118e1fb64ae84b7bb09df1cc2ebd1a5a.jpg', '品牌	索尼 SONY\r\n系列	W\r\n型号	DSC-W800\r\n上市时间	2014.04\r\n光学变焦倍数	5倍\r\n总像素	2040\r\n操作模式	全自动\r\n传感器类型	CCD\r\n传感器尺寸	1/2.3英寸\r\n短片拍摄	1280x720 （1,280x720/30fps） / VGA （640x480/30fps） / QVGA （320x240/30fps）\r\n', '6', '6', '0', '0'), ('317c22ea2269464a9ff8270e202f9c4d', 'XX20160108210935935', '卡西欧（CASIO）EX-TR600 数码相机 白色 （1110万像素 21mm广角 自拍神器）', '05dca3df8e2148b9b40614ffba993fe4', '6522', '6399', '720', 'goodsimage/7acafbfda91948eb89f510ccebb08508.jpg', '品牌	卡西欧 Casio\r\n系列	TR\r\n型号	EX-TR600\r\n颜色	白色\r\n上市时间	2015年12月\r\n数码相机类型	卡片机\r\n光学变焦倍数	无\r\n机身材质	合成金属\r\n有效像素	约1110万\r\n数码变焦倍数	4X\r\n操作模式	全自动\r\n传感器类型	CMOS\r\n传感器尺寸	1/1.7英寸\r\n最大分辨率	4000x3000\r\n短片拍摄	1920x1080\r\n语言	中文\r\n', '8', '9', '0', '0'), ('39b2df77d54d4a88b782df75caa32937', 'XX201601082048464846', '华硕（ASUS）经典系列R557LI 15.6英寸笔记本电脑（i5-5200U 4G 7200转500G 2G独显 D刻 蓝牙 Win8.1 黑色）', '4cff6d6c6c434659bf192b8dbd3814df', '3822', '3699', '700', 'goodsimage/b31cc0249ce24ee28c4aec3bed97234a.jpg', '商品名称：华硕R557LI\r\n品牌： 华硕（ASUS）\r\n上架时间：2015-09-25 13:44:28\r\n商品毛重：3.04kg\r\n商品产地：中国大陆\r\n系统：Windows 8\r\n硬盘容量：500G\r\n显卡：入门级独显\r\n处理器：Intel i5\r\n分辨率：普通屏（1366×768）尺寸：15.6英寸\r\n适用人群：校园学生，商务办公\r\n内存容量：4G\r\n', '6', '8', '0', '0'), ('3d3be6f6f71e41118df74ebc959e3472', 'XX201601082051535153', 'Apple MacBook Air 13.3英寸笔记本电脑 银色(Core i5 处理器/4GB内存/128GB SSD闪存 MJVE2CH/A)', '4cff6d6c6c434659bf192b8dbd3814df', '6599', '6488', '750', 'goodsimage/c91578b32acf4f4daea0212e5f4e8595.jpg', '商品名称：AppleMJVE2CH/A\r\n品牌： APPLE\r\n上架时间：2015-03-18 20:43:43\r\n商品毛重：3.0kg\r\n商品产地：中国大陆\r\n处理器：Intel i5\r\n显卡：集成显卡\r\n尺寸：13.3英寸\r\n', '5', '5', '0', '0'), ('3f092d723cae4b0db67756da1907e283', 'XX201601082110471047', '尼康（NIKON） Coolpix S2900 便携数码相机 黑色（2005万像素 2.7英寸屏 5倍光学变焦 26mm广角）', '05dca3df8e2148b9b40614ffba993fe4', '520', '479', '552', 'goodsimage/3925328f1a494a25b07af6df7ef43c9f.jpg', '品牌	尼康 Nikon\r\n系列	COOLPIX\r\n型号	S2900\r\n颜色	黑色\r\n上市时间	2015年4月\r\n数码相机类型	卡片机\r\n光学变焦倍数	5倍光学变焦\r\n总像素	约2,048万\r\n有效像素	2,005万\r\n数码变焦倍数	高达4倍变焦\r\n操作模式	全自动\r\n传感器类型	CCD\r\n传感器尺寸	1/2.3英寸\r\n最大分辨率	5152×3864P\r\n', '7', '8', '0', '0'), ('4146a0d1898b46b4b8e4825aa7ccda12', 'XX201601081235513551', '雷柏（Rapoo） 9160 无线光学纤薄键鼠套装 土豪金版', '11f141d175ba4d588dac3ebe703662ce', '211', '199', '263', 'goodsimage/c1e956131bd94a42bd435b4d0ec34a8b.jpg', '鼠标功能	基础功能\r\n键盘功能	多媒体功能\r\n尺寸	键盘：339.5×110.3×18.2mm；鼠标：94.64×57.50×36.00mm\r\n重量	0.296kg\r\n', '7', '6', '0', '6'), ('435347e5e72a4afa89d5b72f7e502d11', 'XX201601081237473747', '炫光X-A9500无线套装 2.4G无线办公游戏键鼠套装 酒红色', '11f141d175ba4d588dac3ebe703662ce', '136', '128', '360', 'goodsimage/d2f2f23e500c40cdb15f24d9f3edeba1.jpg', '上架时间：2015-08-31 \r\n商品毛重：1.2kg\r\n货号：炫光X-A9500\r\n类别：无线套装\r\n接口：USB接口\r\n', '8', '8', '0', '6'), ('43bfced6539d49a4963bbb676c002934', 'XX201601081252315231', '中兴 AXON天机 A2015 华尔金 移动联通电信4G 双卡双待 智汇（高配）版', '1d3c3584d6164047acd4cff929a9eeef', '2860', '2799', '1500', 'goodsimage/30357763a9d54e6b910549d3ff10e148.jpg', '屏幕尺寸	5.5英寸\r\n触摸屏	电容屏\r\n分辨率	1920×1080(FHD,1080P)\r\n屏幕材质	IPS\r\n超大字体	支持\r\n', '8', '8', '0', '6'), ('4651b83d563f4abda73ddfd45007b5f7', 'XX20160108123908398', '现代（HYUNDAI）HY-NK3500 无线键鼠套装', '11f141d175ba4d588dac3ebe703662ce', '60', '49.9', '450', 'goodsimage/88b9908e4bf24c68b797a31f9a656a52.jpg', '上架时间：2015-08-31 \r\n商品毛重：1.2kg\r\n货号：现代NK3500\r\n类别：无线套装\r\n接口：USB接口\r\n', '6', '6', '0', '6'), ('46a44ed81d4c4616afd151a05da7cd8b', 'XX20160108210144144', '华硕（ASUS）K30BD-A3854M5 台式电脑（Sempron3850四核 4G 500GB R5-235X 1G独显 Win8.1）19.5英寸', '3abc475d0745493c883388798717e50e', '2855', '2699', '780', 'goodsimage/8768784b052146b39923028cbe8b21a8.jpg', '类型	AMD Sempron\r\n速度	1.3 GHz\r\nCPU型号	Sempron 3850\r\n核心数	四核\r\n三级缓存	2MB\r\n', '8', '8', '0', '0'), ('4ec00eb43855403aa81dde1d8a05d538', 'XX201601082057305730', '联想（Lenovo）H3000 台式电脑（奔腾J2900 4G 1T 1G独显 DVD 百兆网卡 Win8.1）', '3abc475d0745493c883388798717e50e', '3422', '3199', '859', 'goodsimage/d26ec22fd43d4d3cb7144276f907ee36.jpg', '类型	奔腾四核\r\n速度	2.41GHz\r\nCPU型号	J2900\r\n核心数	四核\r\n二级缓存	2MB\r\n', '8', '9', '0', '0'), ('58ee06c1fd254e819df417ed15348f8a', 'XX201801121713231323', '大厦', '05dca3df8e2148b9b40614ffba993fe4', '1', '1', '1', 'goodsimage/4ded246703b94fe0a05fa9ff14497b5e.jpg', '111', '1', '1', '0', '0'), ('653931c1670641b5962ee51ca69ee1f8', 'XX20160108210725725', '佳能（Canon） PowerShot SX700 HS 数码相机 红色（1610万像素 30倍光变 3英寸高清屏 25mm广角 WiFi/NFC）', '05dca3df8e2148b9b40614ffba993fe4', '1500', '1299', '560', 'goodsimage/9ecf0b5491ed4aa69c41de609d2ded30.jpg', '品牌	佳能 Canon\r\n系列	PowerShot\r\n型号	PowerShot SX700 HS\r\n颜色	红色\r\n上市时间	2014.03\r\n数码相机类型	长焦相机\r\n光学变焦倍数	18倍以上\r\n机身材质	合成金属\r\n总像素	1600-1800万\r\n有效像素	1600以上\r\n操作模式	全自动\r\n传感器类型	CMOS\r\n传感器尺寸	1/2.3英寸\r\n图像处理系统	DIGIC 6\r\n短片拍摄	1920x1080\r\n', '9', '9', '0', '0'), ('6953f3fdd7c24254a0b3f36c58cad168', 'XX2016010722080888', '联想（Lenovo）KM4902 无线键盘鼠标套装', '11f141d175ba4d588dac3ebe703662ce', '179', '168', '536', 'goodsimage/7fb25199a7244b7bb1323c3c66f323a2.jpg', '上架时间：2015-08-31   商品毛重：1.2kg  货号：联想KM4902  类别：无线套装  接口：USB接口', '8', '8', '0', '6'), ('6bf3383788e8418e8c287a3b11fca784', 'XX20160108210254254', '联想（ThinkCentre）E73S（10EN001ACD） 小机箱台式电脑 （I3-4160T 4GB 500GB 核显 串并口 Win7）', '3abc475d0745493c883388798717e50e', '3599', '3399', '790', 'goodsimage/1c5bac8037774ccbb773519066e5dfbe.jpg', '速度	3.10GHz\r\nCPU型号	i3-4160T\r\n核心数	双核\r\n三级缓存	3MB\r\n', '7', '8', '0', '0'), ('73a5bbed9de34a0ba6f16ffd0e8a2b35', 'XX20160108125000500', 'Apple iPhone 5s (A1530) 16GB 金色 移动联通4G', '1d3c3584d6164047acd4cff929a9eeef', '2788', '2688', '5500', 'goodsimage/4e8afa99eeb141ef9004cc9038ceab58.jpg', '屏幕尺寸	4.0英寸\r\n触摸屏	电容屏，多点触控\r\n分辨率	1136×640\r\n屏幕材质	IPS\r\n超大字体	不支持\r\n', '9', '6', '0', '6'), ('7fc9504f22d34b4d8072798209f358c4', 'XX201601081246504650', '魅族 PRO5 64GB 银白色 移动联通双4G手机 双卡双待', '1d3c3584d6164047acd4cff929a9eeef', '3110', '3099', '1200', 'goodsimage/546504ff793a46a3a3208d10f64000b8.jpg', '屏幕尺寸	5.7英寸\r\n触摸屏	电容屏，多点触控\r\n分辨率	1920×1080（16：9）\r\n屏幕材质	康宁大猩猩第三代保护玻璃\r\n', '9', '7', '0', '6'), ('8743e5e08f1e4144a7fcf9f33170469e', 'XX20160108210044044', '惠普（HP）251-039cn 台式电脑 （i3-4170 4G 1TB 1G独显 DVD刻录 WiFi 蓝牙 键鼠 win8.1）', '3abc475d0745493c883388798717e50e', '3600', '3499', '750', 'goodsimage/6b93465af97a43fd9b870c5f668f8e2b.jpg', '类型	i3-4170\r\n速度	3.7 GHz\r\n核心数	双核\r\n三级缓存	3MB\r\n', '6', '8', '0', '0'), ('88542248241f4a759c62dfbcf4da31a4', 'XX20160107220114114', '昂达（ONDA）oBook10 10.1英寸平板电脑（4G 64G WIFI IPS屏 ） 标配', 'df0d1b6ea4014d4f8ee6d823f0db9ee7', '1100', '999', '453', 'goodsimage/d5e9299a71ab4c0184494bfef495b9b2.jpg', '屏幕尺寸	10.1英寸\r\n屏幕分辨率	1280*800\r\n屏幕类型	IPS\r\n屏幕描述	WXGA康宁大猩猩玻璃+全贴合技术\r\n指取设备	触摸\r\n', '6', '8', '0', '6'), ('893d8feeea2b4d23b6a178021dce1d96', 'XX201601082043524352', '联想(Lenovo)小新V4000 Bigger版 15.6英寸超薄游戏笔记本电脑（i7-5500U 8G 1T R9-M375 2G独显 Win10）黑色', '4cff6d6c6c434659bf192b8dbd3814df', '5230', '5199', '800', 'goodsimage/f46bc6caba774791a055aa21d5b66a2d.jpg', '商品名称：联想小新V4000 Bigger版\r\n品牌： 联想（Lenovo）\r\n上架时间：2015-07-27 11:15:30\r\n商品毛重：3.16kg\r\n商品产地：中国大陆\r\n系统：Windows 10\r\n硬盘容量：1T\r\n显卡：高性能独显\r\n处理器：Intel i7\r\n分辨率：全高清屏（1920×1080）\r\n尺寸：15.6英寸\r\n适用人群：游戏达人，校园学生，时尚轻薄，商务办公\r\n内存容量：8G\r\n', '7', '8', '0', '0'), ('9165ec47813a43b6b400577579db56fe', 'XX201601082050315031', '戴尔（DELL）灵越 飞匣3000系列 Ins14C-4528B 14英寸笔记本电脑（i5-5200U 4G 500G GT920M 2G独显 Win8）黑', '4cff6d6c6c434659bf192b8dbd3814df', '3388', '3299', '600', 'goodsimage/645aa255d3a549e49844bd90d1294556.jpg', '商品名称：戴尔Ins14CR-4528B\r\n品牌： 戴尔（DELL）\r\n上架时间：2015-12-11 09:37:37\r\n商品毛重：3.02kg\r\n商品产地：中国大陆\r\n处理器：Intel i5\r\n硬盘容量：500G\r\n系统：Windows 8\r\n分辨率：普通屏（1366×768）\r\n内存容量：4G显卡：入门级独显\r\n适用人群：校园学生，商务办公，其它\r\n尺寸：14.0英寸\r\n', '6', '7', '0', '0'), ('9852457e2cb8492b86e1882c05ba4c9b', 'XX201601082058445844', '戴尔（DELL）Inspiron 3847-R7938 灵越台式电脑 （i5-4460 8G 1TB 2G独显 WIFI D刻 三年上门 Win7）黑', '3abc475d0745493c883388798717e50e', '5233', '4999', '860', 'goodsimage/2384471a0f364f68854a7e7affa35de2.jpg', '戴尔（DELL）Inspiron 3847-R7938 灵越台式电脑 （i5-4460 8G 1TB 2G独显 WIFI D刻 三年上门 Win7）黑', '7', '8', '0', '0'), ('a98cf7147c48434aa85655078a26023c', 'XX201601072153255325', '微软（Microsoft）Surface 3 128G （10.8英寸，USB 3.0接口 4G 内存 1920x1280分辨率）7G6-00024', 'df0d1b6ea4014d4f8ee6d823f0db9ee7', '5100', '4888', '1200', 'goodsimage/841bcc0a2dfd4b82a77758eefeabf748.jpg', '屏幕屏幕尺寸	10.8英寸\r\n屏幕分辨率	1920×1280\r\n屏幕比例	3：2\r\n屏幕类型	ClearType Full HD Plus\r\n指取设备	触摸\r\n', '6', '5', '0', '6'), ('aef538cc82eb4acb96f89ddaa3ec7b0f', 'XX20180125140259259', 'stone', 'huhduisa', '1', '1', '1', 'goodsimage/18b22734440e4048afed853c01b7f261.jpg', '1', '1', '1', '0', '0'), ('b4d486b01f464bde8acf10072917a2d3', 'XX201601072156245624', '台电（Teclast）X16 Pro 11.6英寸平板电脑(Intel Z8500 4G内存 Win10+安卓 1920x1080 )黑色', 'df0d1b6ea4014d4f8ee6d823f0db9ee7', '1520', '1499', '850', 'goodsimage/75cdb85cfab645eda015c3b6870b1e0f.jpg', '屏幕尺寸	11.6英寸\r\n屏幕分辨率	1920×1080\r\n屏幕比例	16:9\r\n屏幕类型	IPS屏\r\n指取设备	触摸\r\n', '8', '9', '0', '6'), ('b7335156b250443284bcc2f33461befd', 'XX20160108124900490', '三星 Galaxy Note 3 Lite (N7508v) 简约白 移动4G手机', '1d3c3584d6164047acd4cff929a9eeef', '1400', '1349', '1400', 'goodsimage/fdc1486b9c08425a9804aeacc840480a.jpg', '屏幕尺寸	5.5英寸\r\n触摸屏	电容屏，多点触控\r\n分辨率	1280×720(HD,720P)\r\n屏幕材质	Super AMOLED\r\n', '8', '8', '0', '6'), ('bcdf6fa2606649498e415fe100cfac0a', 'XX2016010821050555', '海尔（Haier）天越Y3-Z353i台式电脑(Intel四核J1900 4G 500G 键鼠 WIFI Win8.1 )办公电脑', '3abc475d0745493c883388798717e50e', '2200', '1999', '670', 'goodsimage/0210379971d04bfbb72fffd4c057f5d7.jpg', '类型	赛扬四核\r\n速度	2.0GHz~2.42GHz\r\nCPU型号	J1900\r\n核心数	四核\r\n二级缓存	2MB\r\n三级缓存	2MB\r\n', '8', '9', '0', '0'), ('bd3982d23a5b43d68cfdfcfbc5ff3ad9', 'XX2016010821040646', '宏碁（acer）ATC705-N50 台式电脑（奔腾G3250 4G 500G 集显 DVD 键鼠 Win8.1）19.5英寸', '3abc475d0745493c883388798717e50e', '2800', '2699', '670', 'goodsimage/d73c55041aaf4f39abbab79aaf9a0146.jpg', '类型	英特尔奔腾\r\n速度	3.2G\r\nCPU型号	G3250\r\n核心数	双核\r\n三级缓存	3MB\r\n', '7', '9', '0', '0'), ('c18d9a6f59a344f484c1b9e1ff7628d1', 'XX20160108210624624', '清华同方（THTF）精锐X700-BI05 19英寸 台式电脑(i3-4160 4GB 500G 双PCI 后置COM 前置4口USB Win7）', '3abc475d0745493c883388798717e50e', '2950', '2799', '680', 'goodsimage/d5689808c5f542c181e7ba151a147711.jpg', '类型	酷睿四代i3处理器\r\nCPU型号	i3-4160\r\n核心数	双核\r\n三级缓存	3MB\r\n', '6', '7', '0', '0'), ('c1aea0f70ba74f1cb6fb117252db8b7c', 'XX201601081245404540', '【简约套装版】魅族 魅蓝note2 16GB 白色 移动联通双4G手机 双卡双待', '1d3c3584d6164047acd4cff929a9eeef', '900', '849', '1100', 'goodsimage/7332b01a45c8401a9949ff8a0ed191d3.jpg', '后置摄像头	1300万像素\r\n前置摄像头	500万像素\r\n', '8', '6', '0', '6'), ('c8caa8d0ee694f48a84b91e5d7e02a10', 'XX20160107220323323', '富勒（Fuhlen）MK650 节能无线键鼠套装 白色', '11f141d175ba4d588dac3ebe703662ce', '64.9', '59.9', '662', 'goodsimage/796a760fdfb44ab68433e2c2c70e5614.jpg', '上架时间：2015-08-31  商品毛重：1.2kg  货号：富勒MK650  类别：无线套装  接口：USB接口', '7', '7', '0', '6'), ('c8d8183640d5413cbda8dd3ae93cb383', 'XX201601081251385138', 'vivo X5F 手机 双卡双待 极光白 联通4G版', '1d3c3584d6164047acd4cff929a9eeef', '1850', '1798', '1000', 'goodsimage/189398f6d8d240e4aca11151cd2c797f.jpg', '屏幕尺寸	5.0英寸\r\n触摸屏	电容屏，多点触控\r\n分辨率	1280×720(HD,720P)\r\n屏幕材质	IPS\r\n超大字体	不支持\r\n', '7', '8', '0', '6'), ('cd9e1d650c7545158eb89ccdd9d61394', 'XX201601081239573957', '双飞燕（A4TECH）6300F 同步灵2.4G无线光电套', '11f141d175ba4d588dac3ebe703662ce', '140', '129', '560', 'goodsimage/9ef94aab96fe4dd2abfc69f0427385be.jpg', '上架时间：2015-08-31 \r\n商品毛重：1.2kg\r\n货号：双飞燕6300F\r\n类别：无线套装\r\n接口：USB接口\r\n', '8', '8', '0', '6'), ('d375d22a8eab4b7a9ff8982085b297a8', 'XX201601072145524552', 'Apple iPad mini 2 7.9英寸平板电脑 银色（16G WLAN版/A7芯片/Retina显示屏 ME279CH/A）', 'df0d1b6ea4014d4f8ee6d823f0db9ee7', '1900', '1799', '890', 'goodsimage/5236001479314e7089015d6dd7d09ab4.jpg', '尺寸	7.9英寸\r\n屏幕分辨率	2048 x 1536\r\n屏幕类型	IPS\r\n屏幕描述	LED 背光 Multi-Touch显示屏，，采用防油渍防指纹涂层 ,326 ppi\r\niSight 摄像头：500 万像素自动对焦；\r\nFaceTime 摄像头：120 万像素照片；720p HD 高清视频\r\n', '8', '6', '0', '6'), ('d4277e3b7a5c4f9a9a60bde96ddb4fc6', 'XX201601082053175317', '惠普（HP）超薄系列 HP14g-ad005TX 14英寸超薄笔记本电脑（i5-5200U 4G 500G 2G独显 win8.1）银色', '4cff6d6c6c434659bf192b8dbd3814df', '3600', '3499', '650', 'goodsimage/11051ca53bcf4bca9f0345c3d2d47e3a.jpg', '商品名称：惠普HP14g-ad005TX\r\n品牌： 惠普（HP）\r\n上架时间：2015-07-01 09:05:05\r\n商品毛重：2.79kg\r\n商品产地：中国大陆\r\n系统：Windows 8\r\n硬盘容量：500G\r\n显卡：入门级独显\r\n处理器：Intel i5\r\n分辨率：普通屏（1366×768）\r\n尺寸：14.0英寸\r\n适用人群：校园学生，商务办公\r\n内存容量：4G\r\n', '7', '8', '0', '0'), ('d5552aa19b154661a339f8a7ae3c5f26', 'XX201601072158375837', '小米（MI）7.9英寸平板电脑 WIFI版 2代前黑后金(2G RAM+16G ROM)', 'df0d1b6ea4014d4f8ee6d823f0db9ee7', '1550', '1499', '770', 'goodsimage/5275665e56c7423fa997f6810b97979d.jpg', '屏幕分辨率	2048*1536\r\n屏幕比例	4:3\r\n屏幕类型	IPS\r\n', '8', '8', '0', '6'), ('d6140bdc0f414f5a924090d88909cda9', 'XX201801241655455545', '盗版相机', '05dca3df8e2148b9b40614ffba993fe4', '12', '12', '12', 'goodsimage/not_now.jpg', '可以修改\r\n这个相机用来测试', '4', '4', '0', '0'), ('d95968ea2f384d37b2953b43718535bb', 'XX201601081253165316', '乐视（Letv）乐1S（X500）32GB 金色 移动联通4G手机 双卡双待', '1d3c3584d6164047acd4cff929a9eeef', '1199', '1099', '1500', 'goodsimage/5b8992df2aa3481a9e458d3fc1c2871b.jpg', '屏幕尺寸	5.5英寸\r\n触摸屏	电容屏，多点触控\r\n分辨率	1920×1080(FHD,1080P)\r\n屏幕色彩	1600万色\r\n', '8', '8', '0', '6'), ('db9efbd7c28b4c279f0d1f7cc4dd32b1', 'XX20160107220811811', '小米4   2GB内存版 白色 移动4G手机', '1d3c3584d6164047acd4cff929a9eeef', '1300', '1299', '890', 'goodsimage/e5adbeeb36534140b50c327f6fd71a6b.jpg', '后置摄像头：1300万像素\r\n前置摄像头：800万像素', '10', '10', '0', '6'), ('e082e3c8708c4eef9b30c9ee7b8924f0', 'XX20160108123703373', '罗技（Logitech）MK260 无线光电键鼠套装', '11f141d175ba4d588dac3ebe703662ce', '130', '119', '263', 'goodsimage/e87efc71db024bda9a7ce5808a580fed.jpg', '鼠标工作方式	光电\r\n鼠标分辨率	1000dpi\r\n尺寸	鼠标107*60.1*37.6mm，键盘441.5*149*22.8mm\r\n重量	鼠标69g，键盘480g\r\n', '8', '7', '0', '6'), ('e498a5dac9214556a5f5b611e119ee2f', 'XX201601072149154915', '华为（HUAWEI）荣耀畅玩平板note高配版（9.6英寸高清大屏 高通骁龙四核 2G/16G Wifi）银色', 'df0d1b6ea4014d4f8ee6d823f0db9ee7', '1250', '1199', '800', 'goodsimage/c0c2de4d766b40a7b7fb02cd2fd9428c.jpg', '屏幕尺寸	9.6英寸\r\n屏幕分辨率	800×1280\r\n屏幕类型	IPS\r\n屏幕描述	支持5点触控\r\n指取设备	触摸\r\n', '7', '8', '0', '6'), ('e53af1df417d472e9a07b23aec358332', 'XX201801241613571357', '小米盗版1', '05dca3df8e2148b9b40614ffba993fe4', '1', '1', '1', 'goodsimage/not_now.jpg', '1', '1', '1', '0', '0'), ('e5b39c42a74241ec878a182d7513e9f4', 'XX201601072154205420', '【年终吐血卖】联想（Lenovo）YOGA Tablet2 1051F 10英寸平板电脑 官方标配+内胆包', 'df0d1b6ea4014d4f8ee6d823f0db9ee7', '2450', '2399', '560', 'goodsimage/2e535dca9cc34de3a5f62b2c95bf5987.jpg', '屏幕尺寸	10.1英寸\r\n屏幕比例	16:9\r\n屏幕类型	IPS\r\n指取设备	触摸\r\n', '7', '8', '0', '6'), ('e70a4a2ff435408facc5ac42163cb966', 'XX201601082046584658', '联想（ThinkPad） 轻薄系列E450C(20EH0001CD)14英寸笔记本电脑(i5-4210U 4G 500G 2G独显 Win8.1)', '4cff6d6c6c434659bf192b8dbd3814df', '4500', '4199', '850', 'goodsimage/f254d719110b49fe9fa4a37a81bc0e56.jpg', '商品名称：ThinkPadE450C(20EH0001CD)\r\n品牌： ThinkPad\r\n上架时间：2014-12-29 18:28:38\r\n商品毛重：2.84kg\r\n商品产地：中国大陆\r\n处理器：Intel i5\r\n硬盘容量：500G\r\n分辨率：普通屏（1366×768）\r\n内存容量：4G系统：Windows 8\r\n适用人群：商务办公\r\n尺寸：14.0英寸\r\n', '7', '8', '0', '0'), ('f08d9059e95849f6b685e974c75f53eb', 'XX201601081242444244', '荣耀 6 (H60-L01) 3GB内存标准版 白色 移动4G手机', '1d3c3584d6164047acd4cff929a9eeef', '1400', '1299', '1500', 'goodsimage/1dd453dbc5b744a2924f6b35712d9674.jpg', '后置摄像头	带蓝玻璃1300万像素，堆栈式摄像头,F2.0光圈,支持HDR Movie。\r\n前置摄像头	带蓝玻璃500万像素\r\n3G网络：通话时间27 小时 ；LTE网络：通话时间27 小时\r\n3G网络：待机时间463 小时；LTE网络：待机时间414 小时\r\n', '9', '9', '0', '6'), ('f0ca7847f9ca43f4b17fe5d3500420d8', 'XX201801251048354835', '坚果锤子手机', '1d3c3584d6164047acd4cff929a9eeef', '1200', '1000', '12', 'goodsimage/4f8e4940937b47218f822de529e76005.jpg', '新款上市', '4', '4', '0', '0'), ('f343e13006884a2a9c721ed18e67f275', 'XX20160107220514514', '诺基亚N1平板电脑（安卓5.0四核7.9英寸支持4K视频 英特尔64位处理器） 火山灰', 'df0d1b6ea4014d4f8ee6d823f0db9ee7', '1450', '1399', '1200', 'goodsimage/4b49b65c151040918e1dbeab1a4aa7c5.jpg', '屏幕尺寸	8英寸\r\n屏幕比例	4:3\r\n屏幕类型	IPS\r\n屏幕描述	电容屏\r\n指取设备	触摸\r\n', '8', '8', '0', '6');
COMMIT;

-- ----------------------------
--  Table structure for `shop_order`
-- ----------------------------
DROP TABLE IF EXISTS `shop_order`;
CREATE TABLE `shop_order` (
  `id` char(32) NOT NULL,
  `userid` char(32) NOT NULL,
  `ordertime` date NOT NULL,
  `paytype` char(30) NOT NULL,
  `paytime` date DEFAULT NULL,
  `sendtime` date DEFAULT NULL,
  `completiontime` date DEFAULT NULL,
  `addressid` char(32) DEFAULT NULL,
  `totalmoney` float NOT NULL,
  `deliverytype` varchar(30) NOT NULL,
  `deliverytime` varchar(30) NOT NULL,
  `status` char(1) NOT NULL,
  `deliverynum` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_SHOP_ORD_REFERENCE_SHOP_USE` (`userid`),
  KEY `FK_SHOP_ORD_REFERENCE_SHOP_ADD` (`addressid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `shop_order`
-- ----------------------------
BEGIN;
INSERT INTO `shop_order` VALUES ('0c25eba301ec45c2b01966e6f83a0fe7', '250f423a093f41319127a57b9bc0e5a8', '2018-01-24', '预存款支付', '2018-01-24', null, null, '3e540ce48be94773a0d3d31876eb091f', '6098', '快递', '任意', '1', null), ('1778ba3539554b06bb0f3a5b0c320dd0', 'f23ef84ff50e467b84ce8ed9cc81c84e', '2018-01-23', '预存款支付', '2018-01-23', null, null, '203e58a9cd2b4301b3d7fc291619026e', '3098', '快递', '周末', '1', null), ('3b4c09aa57bb4f879b1a4eaa7c1bf58d', '15bbe9543c474f119c6d00ed27fad6fe', '2018-01-24', '预存款支付', '2018-01-24', null, null, 'e82f7add1e2d47a3b2e32d36cf888777', '1299', '快递', '任意', '1', null), ('5df837cfa93e48bd863bf629fe2886ec', '15bbe9543c474f119c6d00ed27fad6fe', '2018-01-24', '预存款支付', '2018-01-24', null, null, 'e82f7add1e2d47a3b2e32d36cf888777', '3098', '快递', '任意', '1', null), ('6ec33db57dde42209532ba4848327bcb', 'f23ef84ff50e467b84ce8ed9cc81c84e', '2018-01-23', '预存款支付', '2018-01-23', null, null, 'c5b343173cc545ef909ac6e0a49de2f4', '6898', '快递', '任意', '1', null), ('ac03730560ce46ceb0bb7e2a055a2a86', '15bbe9543c474f119c6d00ed27fad6fe', '2018-01-24', '预存款支付', null, null, null, 'e82f7add1e2d47a3b2e32d36cf888777', '2699', '快递', '任意', '1', null), ('cd6eca2e77f04406b16373963a74e9b4', 'f23ef84ff50e467b84ce8ed9cc81c84e', '2018-01-23', '预存款支付', null, null, null, 'c5b343173cc545ef909ac6e0a49de2f4', '3699', '快递', '任意', '1', null), ('f306a3f71dc54e6e91b621d98608522d', '15bbe9543c474f119c6d00ed27fad6fe', '2018-01-24', '预存款支付', null, null, null, 'e82f7add1e2d47a3b2e32d36cf888777', '19196', '快递', '任意', '1', null);
COMMIT;

-- ----------------------------
--  Table structure for `shop_orderdetail`
-- ----------------------------
DROP TABLE IF EXISTS `shop_orderdetail`;
CREATE TABLE `shop_orderdetail` (
  `id` char(32) NOT NULL,
  `orderid` char(32) NOT NULL,
  `goodsid` char(32) NOT NULL,
  `nums` int(11) NOT NULL,
  `paystatus` int(11) DEFAULT NULL,
  `sendstatus` int(11) DEFAULT NULL,
  `orderstatus` int(11) DEFAULT NULL,
  `dealprice` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_SHOP_ORD_REFERENCE_SHOP_ORD` (`orderid`),
  KEY `FK_SHOP_ORD_REFERENCE_SHOP_GOO` (`goodsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `shop_orderdetail`
-- ----------------------------
BEGIN;
INSERT INTO `shop_orderdetail` VALUES ('0ce2f57b3b764496a8a8549484b75bd8', '0c25eba301ec45c2b01966e6f83a0fe7', 'db9efbd7c28b4c279f0d1f7cc4dd32b1', '1', '1', '0', '2', '0'), ('1013cc873857488facd9889c9047e888', 'ac03730560ce46ceb0bb7e2a055a2a86', '46a44ed81d4c4616afd151a05da7cd8b', '1', '0', '0', '1', '0'), ('3636b61c946d47e9b6c9b63708f77e54', '0c25eba301ec45c2b01966e6f83a0fe7', '09099d7e183349669e3596462bd8846d', '1', '1', '0', '2', '0'), ('77b038ccab9e4289b7f3cbf2b93f84a5', 'f306a3f71dc54e6e91b621d98608522d', '09099d7e183349669e3596462bd8846d', '4', '0', '0', '1', '0'), ('8d88766e8c8a4f2a8a8a53ab7df99e16', '5df837cfa93e48bd863bf629fe2886ec', '22395b73210745a9b6c4d5f4d1d5a12a', '1', '1', '0', '2', '0'), ('98e0f74910174d289f323693a05d9225', '3b4c09aa57bb4f879b1a4eaa7c1bf58d', 'db9efbd7c28b4c279f0d1f7cc4dd32b1', '1', '1', '0', '2', '0'), ('a7605a566fe049bbb04d636263cfa7a0', 'cd6eca2e77f04406b16373963a74e9b4', '0866079a93de4f99a83660abf3d41ddd', '1', '0', '0', '1', '0'), ('bfb72c80d4c443dea8eaa2c60f8daa67', '1778ba3539554b06bb0f3a5b0c320dd0', '22395b73210745a9b6c4d5f4d1d5a12a', '1', '1', '0', '2', '0'), ('cd5a4a98821b4cc6916f02e7d65faa1d', '1778ba3539554b06bb0f3a5b0c320dd0', 'db9efbd7c28b4c279f0d1f7cc4dd32b1', '1', '1', '0', '2', '0'), ('ebfb6bf6650d43dfb0ce3fe00f81778d', '6ec33db57dde42209532ba4848327bcb', '0866079a93de4f99a83660abf3d41ddd', '1', '1', '0', '2', '0'), ('f3d3641248d84451b89ca89ea56e9b63', '5df837cfa93e48bd863bf629fe2886ec', '0ec9fcdc54e94189aa554135617828ce', '1', '1', '0', '2', '0'), ('f91173fe989242d18c99b26131d6ff4f', '6ec33db57dde42209532ba4848327bcb', '4ec00eb43855403aa81dde1d8a05d538', '1', '1', '0', '2', '0');
COMMIT;

-- ----------------------------
--  Table structure for `shop_orderstatus`
-- ----------------------------
DROP TABLE IF EXISTS `shop_orderstatus`;
CREATE TABLE `shop_orderstatus` (
  `id` char(32) NOT NULL,
  `statusname` varchar(255) DEFAULT NULL,
  `statusnum` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `shop_orderstatus`
-- ----------------------------
BEGIN;
INSERT INTO `shop_orderstatus` VALUES ('0', '已取消', '0'), ('1', '待支付', '1'), ('2', '待发货', '2'), ('3', '待接收', '3'), ('4', '已完成', '4');
COMMIT;

-- ----------------------------
--  Table structure for `shop_user`
-- ----------------------------
DROP TABLE IF EXISTS `shop_user`;
CREATE TABLE `shop_user` (
  `ID` char(32) NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(32) NOT NULL,
  `phonenum` char(11) NOT NULL,
  `money` float NOT NULL,
  `avatar` varchar(50) DEFAULT NULL COMMENT '用户头像',
  `regtime` varchar(20) NOT NULL COMMENT '注册时间',
  `role` char(1) NOT NULL COMMENT '‘u’ 开头表示普通用户 ''a'' 开头表示管理员',
  `status` int(11) DEFAULT NULL COMMENT '保存用户状态 1:在线，2:离线，其他：不可登录状态',
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `shop_user`
-- ----------------------------
BEGIN;
INSERT INTO `shop_user` VALUES ('15bbe9543c474f119c6d00ed27fad6fe', 'huaxin', '123456', '13636036616', '5603', 'useravatars/15bbe9543c474f119c6d00ed27fad6fe.png', '2016-05-13  08:32:33', 'u', '1', 'huaxin@qq.com'), ('1de124d43e8b4d2b9f388087f9766e36', '456', '123456', '18186533315', '6301', 'useravatars/1de124d43e8b4d2b9f388087f9766e36.jpg', '2016-12-08  14:46:37', 'u', '1', '456@qq.com'), ('250f423a093f41319127a57b9bc0e5a8', 'business', 'business', '12345678910', '11304', null, '2018-01-18  21:45:17', 'a', '1', 'yinziang@qq.com'), ('36e57693959447f78450899557b63da1', 'abc', '123', '18840836087', '0', null, '2018-01-09  10:05:51', 'u', '2', 'abc@qq.com'), ('9d97fc96d73e4126bfbde468fbf420d6', 'zzzz', '123456', '18186533315', '0', null, '2017-04-09  23:27:05', 'u', '0', 'zzzz@qq.com'), ('f23ef84ff50e467b84ce8ed9cc81c83e', '华鑫', '123456', '18186533315', '91356', 'useravatars/f23ef84ff50e467b84ce8ed9cc81c83e.jpg', '2015-12-21  22:07:49', 'u', '1', 'huaxing@gmail.cn'), ('f23ef84ff50e467b84ce8ed9cc81c84e', 'admin', 'admin', '18186533315', '10872', 'useravatars/f23ef84ff50e467b84ce8ed9cc81c83e.png', '2015-12-21  22:07:49', 'a', '1', 'admin@qq.com');
COMMIT;

-- ----------------------------
--  Table structure for `visit`
-- ----------------------------
DROP TABLE IF EXISTS `visit`;
CREATE TABLE `visit` (
  `id` char(32) NOT NULL,
  `ip` varchar(64) NOT NULL,
  `username` varchar(32) NOT NULL,
  `logintime` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `visit`
-- ----------------------------
BEGIN;
INSERT INTO `visit` VALUES ('7b3d043410ca48f884ff447bc53df3ee', '127.0.0.1', 'admin', '2018-01-26  12:04:07'), ('8289cfa3b718407f933af061e4de7e4b', '127.0.0.1', 'admin', '2018-01-26  11:17:02'), ('d70242fce8a744c1838e319ad8a9c822', '127.0.0.1', 'admin', '2018-01-26  12:29:10'), ('fd8fcfb0e1bc41d2bc11d68c67dc3eab', '127.0.0.1', 'admin', '2018-01-26  09:47:13');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
