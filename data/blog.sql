/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50553
Source Host           : 127.0.0.1:3306
Source Database       : blog

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-12-27 18:45:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for zwj_article
-- ----------------------------
DROP TABLE IF EXISTS `zwj_article`;
CREATE TABLE `zwj_article` (
  `aid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章表主键',
  `title` char(100) NOT NULL DEFAULT '' COMMENT '标题',
  `author` varchar(15) NOT NULL DEFAULT '' COMMENT '作者',
  `content` mediumtext NOT NULL COMMENT '文章内容',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` char(255) NOT NULL DEFAULT '' COMMENT '描述',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '文章是否显示 1是 0否',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除 1是 0否',
  `is_top` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否置顶 1是 0否',
  `is_original` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否原创',
  `click` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击数',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `cid` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zwj_article
-- ----------------------------

-- ----------------------------
-- Table structure for zwj_article_pic
-- ----------------------------
DROP TABLE IF EXISTS `zwj_article_pic`;
CREATE TABLE `zwj_article_pic` (
  `ap_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `path` varchar(100) NOT NULL DEFAULT '' COMMENT '图片路径',
  `aid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属文章id',
  PRIMARY KEY (`ap_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zwj_article_pic
-- ----------------------------

-- ----------------------------
-- Table structure for zwj_article_tag
-- ----------------------------
DROP TABLE IF EXISTS `zwj_article_tag`;
CREATE TABLE `zwj_article_tag` (
  `aid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章id',
  `tid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '标签id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zwj_article_tag
-- ----------------------------

-- ----------------------------
-- Table structure for zwj_category
-- ----------------------------
DROP TABLE IF EXISTS `zwj_category`;
CREATE TABLE `zwj_category` (
  `cid` tinyint(2) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类主键id',
  `cname` varchar(15) NOT NULL DEFAULT '' COMMENT '分类名称',
  `keywords` varchar(255) DEFAULT '' COMMENT '关键词',
  `description` varchar(255) DEFAULT '' COMMENT '描述',
  `sort` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `pid` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '父级栏目id',
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zwj_category
-- ----------------------------

-- ----------------------------
-- Table structure for zwj_chat
-- ----------------------------
DROP TABLE IF EXISTS `zwj_chat`;
CREATE TABLE `zwj_chat` (
  `chid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '碎言id',
  `date` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发表时间',
  `content` text NOT NULL COMMENT '内容',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`chid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zwj_chat
-- ----------------------------

-- ----------------------------
-- Table structure for zwj_comment
-- ----------------------------
DROP TABLE IF EXISTS `zwj_comment`;
CREATE TABLE `zwj_comment` (
  `cmtid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `ouid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论用户id 关联oauth_user表的id',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1：文章评论',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
  `aid` int(10) unsigned NOT NULL COMMENT '文章id',
  `content` text NOT NULL COMMENT '内容',
  `date` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论日期',
  `status` tinyint(1) unsigned NOT NULL COMMENT '1:已审核 0：未审核',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`cmtid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zwj_comment
-- ----------------------------

-- ----------------------------
-- Table structure for zwj_config
-- ----------------------------
DROP TABLE IF EXISTS `zwj_config`;
CREATE TABLE `zwj_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '配置项键名',
  `value` text COMMENT '配置项键值 1表示开启 0 关闭',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zwj_config
-- ----------------------------
INSERT INTO `zwj_config` VALUES ('1', 'WEB_NAME', '张伟江-技术博客 | php | web开发 | mysql |linux');
INSERT INTO `zwj_config` VALUES ('2', 'WEB_KEYWORDS', '张伟江，博客系统，技术分享，thinkphp，laravel，linux，web开发，bootstrap，shell脚本');
INSERT INTO `zwj_config` VALUES ('3', 'WEB_DESCRIPTION', '张伟江博客是一个专注于php技术分享的博客网站。主要分享web网站开发，php，linux，mysql等学习经验。免费分享开源代码。');
INSERT INTO `zwj_config` VALUES ('4', 'WEB_STATUS', '1');
INSERT INTO `zwj_config` VALUES ('5', 'ADMIN_PASSWORD', '21232f297a57a5a743894a0e4a801fc3');
INSERT INTO `zwj_config` VALUES ('6', 'WATER_TYPE', '1');
INSERT INTO `zwj_config` VALUES ('7', 'TEXT_WATER_WORD', 'zhangweijiang.com');
INSERT INTO `zwj_config` VALUES ('8', 'TEXT_WATER_TTF_PTH', './Public/static/font/ariali.ttf');
INSERT INTO `zwj_config` VALUES ('9', 'TEXT_WATER_FONT_SIZE', '15');
INSERT INTO `zwj_config` VALUES ('10', 'TEXT_WATER_COLOR', '#008CBA');
INSERT INTO `zwj_config` VALUES ('11', 'TEXT_WATER_ANGLE', '0');
INSERT INTO `zwj_config` VALUES ('12', 'TEXT_WATER_LOCATE', '9');
INSERT INTO `zwj_config` VALUES ('13', 'IMAGE_WATER_PIC_PTAH', './Upload/image/logo/logo.png');
INSERT INTO `zwj_config` VALUES ('14', 'IMAGE_WATER_LOCATE', '9');
INSERT INTO `zwj_config` VALUES ('15', 'IMAGE_WATER_ALPHA', '80');
INSERT INTO `zwj_config` VALUES ('16', 'WEB_CLOSE_WORD', '网站升级中，请稍后访问。');
INSERT INTO `zwj_config` VALUES ('17', 'WEB_ICP_NUMBER', '闽ICP备17030565号-3');
INSERT INTO `zwj_config` VALUES ('18', 'ADMIN_EMAIL', '982215226@qq.com');
INSERT INTO `zwj_config` VALUES ('19', 'COPYRIGHT_WORD', '本文为张伟江原创文章，转载无需和我联系，但请注明来自&lt;a href=&quot;http://www.zhangweijiang.com&quot;&gt;张伟江博客&lt;/a&gt;http://zhangweijiang.com');
INSERT INTO `zwj_config` VALUES ('20', 'QQ_APP_ID', '');
INSERT INTO `zwj_config` VALUES ('21', 'CHANGYAN_APP_ID', 'cyrKRbJ5N');
INSERT INTO `zwj_config` VALUES ('22', 'CHANGYAN_CONF', 'prod_c654661caf5ab6da98742d040413815b');
INSERT INTO `zwj_config` VALUES ('23', 'WEB_STATISTICS', '');
INSERT INTO `zwj_config` VALUES ('24', 'CHANGEYAN_RETURN_COMMENT', '');
INSERT INTO `zwj_config` VALUES ('25', 'AUTHOR', '张伟江');
INSERT INTO `zwj_config` VALUES ('26', 'QQ_APP_KEY', '');
INSERT INTO `zwj_config` VALUES ('27', 'CHANGYAN_COMMENT', '');
INSERT INTO `zwj_config` VALUES ('28', 'BAIDU_SITE_URL', '111111');
INSERT INTO `zwj_config` VALUES ('29', 'DOUBAN_API_KEY', '');
INSERT INTO `zwj_config` VALUES ('30', 'DOUBAN_SECRET', '');
INSERT INTO `zwj_config` VALUES ('31', 'RENREN_API_KEY', '');
INSERT INTO `zwj_config` VALUES ('32', 'RENREN_SECRET', '');
INSERT INTO `zwj_config` VALUES ('33', 'SINA_API_KEY', '');
INSERT INTO `zwj_config` VALUES ('34', 'SINA_SECRET', '');
INSERT INTO `zwj_config` VALUES ('35', 'KAIXIN_API_KEY', '');
INSERT INTO `zwj_config` VALUES ('36', 'KAIXIN_SECRET', '');
INSERT INTO `zwj_config` VALUES ('37', 'SOHU_API_KEY', '');
INSERT INTO `zwj_config` VALUES ('38', 'SOHU_SECRET', '');
INSERT INTO `zwj_config` VALUES ('39', 'GITHUB_CLIENT_ID', '');
INSERT INTO `zwj_config` VALUES ('40', 'GITHUB_CLIENT_SECRET', '');
INSERT INTO `zwj_config` VALUES ('41', 'IMAGE_TITLE_ALT_WORD', '张伟江博客');
INSERT INTO `zwj_config` VALUES ('42', 'EMAIL_SMTP', '');
INSERT INTO `zwj_config` VALUES ('43', 'EMAIL_USERNAME', '');
INSERT INTO `zwj_config` VALUES ('44', 'EMAIL_PASSWORD', '');
INSERT INTO `zwj_config` VALUES ('45', 'EMAIL_FROM_NAME', '');
INSERT INTO `zwj_config` VALUES ('46', 'COMMENT_REVIEW', '1');
INSERT INTO `zwj_config` VALUES ('47', 'COMMENT_SEND_EMAIL', '1');
INSERT INTO `zwj_config` VALUES ('48', 'EMAIL_RECEIVE', '982215226@qq.com');

-- ----------------------------
-- Table structure for zwj_link
-- ----------------------------
DROP TABLE IF EXISTS `zwj_link`;
CREATE TABLE `zwj_link` (
  `lid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `lname` varchar(50) NOT NULL DEFAULT '' COMMENT '链接名',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '排序',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '文章是否显示 1是 0否',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除 1是 0否',
  PRIMARY KEY (`lid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zwj_link
-- ----------------------------

-- ----------------------------
-- Table structure for zwj_oauth_user
-- ----------------------------
DROP TABLE IF EXISTS `zwj_oauth_user`;
CREATE TABLE `zwj_oauth_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联的本站用户id',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '类型 1：QQ  2：新浪微博 3：豆瓣 4：人人 5：开心网',
  `nickname` varchar(30) NOT NULL DEFAULT '' COMMENT '第三方昵称',
  `head_img` varchar(255) NOT NULL DEFAULT '' COMMENT '头像',
  `openid` varchar(40) NOT NULL DEFAULT '' COMMENT '第三方用户id',
  `access_token` varchar(255) NOT NULL DEFAULT '' COMMENT 'access_token token',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '绑定时间',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` varchar(16) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `login_times` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `is_admin` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否是admin',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zwj_oauth_user
-- ----------------------------

-- ----------------------------
-- Table structure for zwj_tag
-- ----------------------------
DROP TABLE IF EXISTS `zwj_tag`;
CREATE TABLE `zwj_tag` (
  `tid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '标签主键',
  `tname` varchar(10) NOT NULL DEFAULT '' COMMENT '标签名',
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zwj_tag
-- ----------------------------
