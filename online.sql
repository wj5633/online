/*
Navicat MariaDB Data Transfer

Source Server         : 192.168.0.106
Source Server Version : 50552
Source Host           : 192.168.0.106:3306
Source Database       : online

Target Server Type    : MariaDB
Target Server Version : 50552
File Encoding         : 65001

Date: 2017-03-13 23:00:36
*/
CREATE DATABASE IF NOT EXISTS online DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`) USING BTREE,
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissions_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`) USING BTREE,
  CONSTRAINT `auth_permission_ibfk_1` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can view log entry', '1', 'view_logentry');
INSERT INTO `auth_permission` VALUES ('5', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('8', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('9', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('11', 'Can view group', '3', 'view_group');
INSERT INTO `auth_permission` VALUES ('12', 'Can view permission', '2', 'view_permission');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '4', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '4', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '4', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can view content type', '4', 'view_contenttype');
INSERT INTO `auth_permission` VALUES ('17', 'Can add session', '5', 'add_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can change session', '5', 'change_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can delete session', '5', 'delete_session');
INSERT INTO `auth_permission` VALUES ('20', 'Can view session', '5', 'view_session');
INSERT INTO `auth_permission` VALUES ('21', 'Can add 用户信息', '6', 'add_userprofile');
INSERT INTO `auth_permission` VALUES ('22', 'Can change 用户信息', '6', 'change_userprofile');
INSERT INTO `auth_permission` VALUES ('23', 'Can delete 用户信息', '6', 'delete_userprofile');
INSERT INTO `auth_permission` VALUES ('24', 'Can add 邮箱验证码', '7', 'add_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('25', 'Can change 邮箱验证码', '7', 'change_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('26', 'Can delete 邮箱验证码', '7', 'delete_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('27', 'Can add 轮播图', '8', 'add_banner');
INSERT INTO `auth_permission` VALUES ('28', 'Can change 轮播图', '8', 'change_banner');
INSERT INTO `auth_permission` VALUES ('29', 'Can delete 轮播图', '8', 'delete_banner');
INSERT INTO `auth_permission` VALUES ('30', 'Can view 轮播图', '8', 'view_banner');
INSERT INTO `auth_permission` VALUES ('31', 'Can view 邮箱验证码', '7', 'view_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('32', 'Can view 用户信息', '6', 'view_userprofile');
INSERT INTO `auth_permission` VALUES ('33', 'Can add 课程', '9', 'add_course');
INSERT INTO `auth_permission` VALUES ('34', 'Can change 课程', '9', 'change_course');
INSERT INTO `auth_permission` VALUES ('35', 'Can delete 课程', '9', 'delete_course');
INSERT INTO `auth_permission` VALUES ('36', 'Can add 章节', '10', 'add_lesson');
INSERT INTO `auth_permission` VALUES ('37', 'Can change 章节', '10', 'change_lesson');
INSERT INTO `auth_permission` VALUES ('38', 'Can delete 章节', '10', 'delete_lesson');
INSERT INTO `auth_permission` VALUES ('39', 'Can add 视频', '11', 'add_video');
INSERT INTO `auth_permission` VALUES ('40', 'Can change 视频', '11', 'change_video');
INSERT INTO `auth_permission` VALUES ('41', 'Can delete 视频', '11', 'delete_video');
INSERT INTO `auth_permission` VALUES ('42', 'Can add 资源', '12', 'add_courseresource');
INSERT INTO `auth_permission` VALUES ('43', 'Can change 资源', '12', 'change_courseresource');
INSERT INTO `auth_permission` VALUES ('44', 'Can delete 资源', '12', 'delete_courseresource');
INSERT INTO `auth_permission` VALUES ('45', 'Can view 课程', '9', 'view_course');
INSERT INTO `auth_permission` VALUES ('46', 'Can view 资源', '12', 'view_courseresource');
INSERT INTO `auth_permission` VALUES ('47', 'Can view 章节', '10', 'view_lesson');
INSERT INTO `auth_permission` VALUES ('48', 'Can view 视频', '11', 'view_video');
INSERT INTO `auth_permission` VALUES ('49', 'Can add 课程机构', '13', 'add_courseorg');
INSERT INTO `auth_permission` VALUES ('50', 'Can change 课程机构', '13', 'change_courseorg');
INSERT INTO `auth_permission` VALUES ('51', 'Can delete 课程机构', '13', 'delete_courseorg');
INSERT INTO `auth_permission` VALUES ('52', 'Can add 城市', '14', 'add_citydict');
INSERT INTO `auth_permission` VALUES ('53', 'Can change 城市', '14', 'change_citydict');
INSERT INTO `auth_permission` VALUES ('54', 'Can delete 城市', '14', 'delete_citydict');
INSERT INTO `auth_permission` VALUES ('55', 'Can add 教师', '15', 'add_teacher');
INSERT INTO `auth_permission` VALUES ('56', 'Can change 教师', '15', 'change_teacher');
INSERT INTO `auth_permission` VALUES ('57', 'Can delete 教师', '15', 'delete_teacher');
INSERT INTO `auth_permission` VALUES ('58', 'Can view 城市', '14', 'view_citydict');
INSERT INTO `auth_permission` VALUES ('59', 'Can view 课程机构', '13', 'view_courseorg');
INSERT INTO `auth_permission` VALUES ('60', 'Can view 教师', '15', 'view_teacher');
INSERT INTO `auth_permission` VALUES ('61', 'Can add 用户咨询', '16', 'add_userask');
INSERT INTO `auth_permission` VALUES ('62', 'Can change 用户咨询', '16', 'change_userask');
INSERT INTO `auth_permission` VALUES ('63', 'Can delete 用户咨询', '16', 'delete_userask');
INSERT INTO `auth_permission` VALUES ('64', 'Can add 课程评论', '17', 'add_coursecomments');
INSERT INTO `auth_permission` VALUES ('65', 'Can change 课程评论', '17', 'change_coursecomments');
INSERT INTO `auth_permission` VALUES ('66', 'Can delete 课程评论', '17', 'delete_coursecomments');
INSERT INTO `auth_permission` VALUES ('67', 'Can add 用户收藏', '18', 'add_userfavorite');
INSERT INTO `auth_permission` VALUES ('68', 'Can change 用户收藏', '18', 'change_userfavorite');
INSERT INTO `auth_permission` VALUES ('69', 'Can delete 用户收藏', '18', 'delete_userfavorite');
INSERT INTO `auth_permission` VALUES ('70', 'Can add 用户消息', '19', 'add_usermessage');
INSERT INTO `auth_permission` VALUES ('71', 'Can change 用户消息', '19', 'change_usermessage');
INSERT INTO `auth_permission` VALUES ('72', 'Can delete 用户消息', '19', 'delete_usermessage');
INSERT INTO `auth_permission` VALUES ('73', 'Can add 用户课程', '20', 'add_usercourse');
INSERT INTO `auth_permission` VALUES ('74', 'Can change 用户课程', '20', 'change_usercourse');
INSERT INTO `auth_permission` VALUES ('75', 'Can delete 用户课程', '20', 'delete_usercourse');
INSERT INTO `auth_permission` VALUES ('76', 'Can view 课程评论', '17', 'view_coursecomments');
INSERT INTO `auth_permission` VALUES ('77', 'Can view 用户咨询', '16', 'view_userask');
INSERT INTO `auth_permission` VALUES ('78', 'Can view 用户课程', '20', 'view_usercourse');
INSERT INTO `auth_permission` VALUES ('79', 'Can view 用户收藏', '18', 'view_userfavorite');
INSERT INTO `auth_permission` VALUES ('80', 'Can view 用户消息', '19', 'view_usermessage');
INSERT INTO `auth_permission` VALUES ('81', 'Can add Bookmark', '21', 'add_bookmark');
INSERT INTO `auth_permission` VALUES ('82', 'Can change Bookmark', '21', 'change_bookmark');
INSERT INTO `auth_permission` VALUES ('83', 'Can delete Bookmark', '21', 'delete_bookmark');
INSERT INTO `auth_permission` VALUES ('84', 'Can add User Setting', '22', 'add_usersettings');
INSERT INTO `auth_permission` VALUES ('85', 'Can change User Setting', '22', 'change_usersettings');
INSERT INTO `auth_permission` VALUES ('86', 'Can delete User Setting', '22', 'delete_usersettings');
INSERT INTO `auth_permission` VALUES ('87', 'Can add User Widget', '23', 'add_userwidget');
INSERT INTO `auth_permission` VALUES ('88', 'Can change User Widget', '23', 'change_userwidget');
INSERT INTO `auth_permission` VALUES ('89', 'Can delete User Widget', '23', 'delete_userwidget');
INSERT INTO `auth_permission` VALUES ('90', 'Can add log entry', '24', 'add_log');
INSERT INTO `auth_permission` VALUES ('91', 'Can change log entry', '24', 'change_log');
INSERT INTO `auth_permission` VALUES ('92', 'Can delete log entry', '24', 'delete_log');
INSERT INTO `auth_permission` VALUES ('93', 'Can view Bookmark', '21', 'view_bookmark');
INSERT INTO `auth_permission` VALUES ('94', 'Can view log entry', '24', 'view_log');
INSERT INTO `auth_permission` VALUES ('95', 'Can view User Setting', '22', 'view_usersettings');
INSERT INTO `auth_permission` VALUES ('96', 'Can view User Widget', '23', 'view_userwidget');
INSERT INTO `auth_permission` VALUES ('97', 'Can add revision', '25', 'add_revision');
INSERT INTO `auth_permission` VALUES ('98', 'Can change revision', '25', 'change_revision');
INSERT INTO `auth_permission` VALUES ('99', 'Can delete revision', '25', 'delete_revision');
INSERT INTO `auth_permission` VALUES ('100', 'Can add version', '26', 'add_version');
INSERT INTO `auth_permission` VALUES ('101', 'Can change version', '26', 'change_version');
INSERT INTO `auth_permission` VALUES ('102', 'Can delete version', '26', 'delete_version');
INSERT INTO `auth_permission` VALUES ('103', 'Can view revision', '25', 'view_revision');
INSERT INTO `auth_permission` VALUES ('104', 'Can view version', '26', 'view_version');
INSERT INTO `auth_permission` VALUES ('105', 'Can add captcha store', '27', 'add_captchastore');
INSERT INTO `auth_permission` VALUES ('106', 'Can change captcha store', '27', 'change_captchastore');
INSERT INTO `auth_permission` VALUES ('107', 'Can delete captcha store', '27', 'delete_captchastore');
INSERT INTO `auth_permission` VALUES ('108', 'Can view captcha store', '27', 'view_captchastore');
INSERT INTO `auth_permission` VALUES ('109', 'Can add 轮播图', '9', 'add_bannercourse');
INSERT INTO `auth_permission` VALUES ('110', 'Can change 轮播图', '9', 'change_bannercourse');
INSERT INTO `auth_permission` VALUES ('111', 'Can delete 轮播图', '9', 'delete_bannercourse');
INSERT INTO `auth_permission` VALUES ('112', 'Can view 轮播图', '28', 'view_bannercourse');

-- ----------------------------
-- Table structure for captcha_captchastore
-- ----------------------------
DROP TABLE IF EXISTS `captcha_captchastore`;
CREATE TABLE `captcha_captchastore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) NOT NULL,
  `response` varchar(32) NOT NULL,
  `hashkey` varchar(40) NOT NULL,
  `expiration` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hashkey` (`hashkey`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of captcha_captchastore
-- ----------------------------
INSERT INTO `captcha_captchastore` VALUES ('1', 'VNBE', 'vnbe', '40fa29ea4b605b327816c99072e5cf16853275b3', '2017-03-08 01:05:04.000000');
INSERT INTO `captcha_captchastore` VALUES ('2', 'FPRF', 'fprf', '3f7dd50abb254c450002ef56d0208cb41d2dfbba', '2017-03-08 01:06:38.000000');
INSERT INTO `captcha_captchastore` VALUES ('3', 'RURT', 'rurt', 'eed9abe6bdfd48635800a027dfa166174320e3d0', '2017-03-08 01:06:44.000000');
INSERT INTO `captcha_captchastore` VALUES ('4', 'ZEIC', 'zeic', '23d3982a460d094ee08235bc10677717c63137d2', '2017-03-08 01:06:49.000000');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`) USING BTREE,
  KEY `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` (`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_ibfk_1` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `mx_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('27', 'captcha', 'captchastore');
INSERT INTO `django_content_type` VALUES ('4', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('28', 'courses', 'bannercourse');
INSERT INTO `django_content_type` VALUES ('9', 'courses', 'course');
INSERT INTO `django_content_type` VALUES ('12', 'courses', 'courseresource');
INSERT INTO `django_content_type` VALUES ('10', 'courses', 'lesson');
INSERT INTO `django_content_type` VALUES ('11', 'courses', 'video');
INSERT INTO `django_content_type` VALUES ('17', 'operation', 'coursecomments');
INSERT INTO `django_content_type` VALUES ('16', 'operation', 'userask');
INSERT INTO `django_content_type` VALUES ('20', 'operation', 'usercourse');
INSERT INTO `django_content_type` VALUES ('18', 'operation', 'userfavorite');
INSERT INTO `django_content_type` VALUES ('19', 'operation', 'usermessage');
INSERT INTO `django_content_type` VALUES ('14', 'organization', 'citydict');
INSERT INTO `django_content_type` VALUES ('13', 'organization', 'courseorg');
INSERT INTO `django_content_type` VALUES ('15', 'organization', 'teacher');
INSERT INTO `django_content_type` VALUES ('25', 'reversion', 'revision');
INSERT INTO `django_content_type` VALUES ('26', 'reversion', 'version');
INSERT INTO `django_content_type` VALUES ('5', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('8', 'users', 'banner');
INSERT INTO `django_content_type` VALUES ('7', 'users', 'emailverifyrecord');
INSERT INTO `django_content_type` VALUES ('6', 'users', 'userprofile');
INSERT INTO `django_content_type` VALUES ('21', 'xadmin', 'bookmark');
INSERT INTO `django_content_type` VALUES ('24', 'xadmin', 'log');
INSERT INTO `django_content_type` VALUES ('22', 'xadmin', 'usersettings');
INSERT INTO `django_content_type` VALUES ('23', 'xadmin', 'userwidget');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2017-02-22 23:07:53.000000');
INSERT INTO `django_migrations` VALUES ('2', 'contenttypes', '0002_remove_content_type_name', '2017-02-22 23:07:54.000000');
INSERT INTO `django_migrations` VALUES ('3', 'auth', '0001_initial', '2017-02-22 23:07:59.000000');
INSERT INTO `django_migrations` VALUES ('4', 'auth', '0002_alter_permission_name_max_length', '2017-02-22 23:07:59.000000');
INSERT INTO `django_migrations` VALUES ('5', 'auth', '0003_alter_user_email_max_length', '2017-02-22 23:08:00.000000');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0004_alter_user_username_opts', '2017-02-22 23:08:00.000000');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0005_alter_user_last_login_null', '2017-02-22 23:08:00.000000');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0006_require_contenttypes_0002', '2017-02-22 23:08:00.000000');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0007_alter_validators_add_error_messages', '2017-02-22 23:08:00.000000');
INSERT INTO `django_migrations` VALUES ('10', 'users', '0001_initial', '2017-02-22 23:08:06.000000');
INSERT INTO `django_migrations` VALUES ('11', 'admin', '0001_initial', '2017-02-22 23:08:08.000000');
INSERT INTO `django_migrations` VALUES ('12', 'admin', '0002_logentry_remove_auto_add', '2017-02-22 23:08:08.000000');
INSERT INTO `django_migrations` VALUES ('13', 'courses', '0001_initial', '2017-02-22 23:08:12.000000');
INSERT INTO `django_migrations` VALUES ('14', 'operation', '0001_initial', '2017-02-22 23:08:13.000000');
INSERT INTO `django_migrations` VALUES ('15', 'operation', '0002_auto_20170222_0136', '2017-02-22 23:08:22.000000');
INSERT INTO `django_migrations` VALUES ('16', 'organization', '0001_initial', '2017-02-22 23:08:25.000000');
INSERT INTO `django_migrations` VALUES ('17', 'sessions', '0001_initial', '2017-02-22 23:08:26.000000');
INSERT INTO `django_migrations` VALUES ('18', 'users', '0002_auto_20170222_0138', '2017-02-22 23:08:26.000000');
INSERT INTO `django_migrations` VALUES ('19', 'users', '0003_auto_20170222_2107', '2017-02-22 23:08:26.000000');
INSERT INTO `django_migrations` VALUES ('20', 'users', '0004_auto_20170222_2237', '2017-02-22 23:08:26.000000');
INSERT INTO `django_migrations` VALUES ('21', 'xadmin', '0001_initial', '2017-02-22 23:08:31.000000');
INSERT INTO `django_migrations` VALUES ('22', 'xadmin', '0002_log', '2017-02-22 23:08:32.000000');
INSERT INTO `django_migrations` VALUES ('23', 'xadmin', '0003_auto_20160715_0100', '2017-02-22 23:08:33.000000');
INSERT INTO `django_migrations` VALUES ('24', 'reversion', '0001_initial', '2017-02-22 23:27:01.000000');
INSERT INTO `django_migrations` VALUES ('25', 'reversion', '0002_auto_20141216_1509', '2017-02-22 23:27:01.000000');
INSERT INTO `django_migrations` VALUES ('26', 'reversion', '0003_auto_20160601_1600', '2017-02-22 23:27:01.000000');
INSERT INTO `django_migrations` VALUES ('27', 'reversion', '0004_auto_20160611_1202', '2017-02-22 23:27:01.000000');
INSERT INTO `django_migrations` VALUES ('28', 'reversion', '0001_squashed_0004_auto_20160611_1202', '2017-02-22 23:27:02.000000');
INSERT INTO `django_migrations` VALUES ('29', 'courses', '0002_auto_20170223_0016', '2017-02-23 00:16:10.000000');
INSERT INTO `django_migrations` VALUES ('30', 'captcha', '0001_initial', '2017-02-27 23:23:12.000000');
INSERT INTO `django_migrations` VALUES ('31', 'organization', '0002_courseorg_category', '2017-03-04 17:33:23.000000');
INSERT INTO `django_migrations` VALUES ('32', 'organization', '0003_auto_20170305_1549', '2017-03-05 15:49:32.000000');
INSERT INTO `django_migrations` VALUES ('33', 'courses', '0003_course_course_org', '2017-03-05 17:29:00.000000');
INSERT INTO `django_migrations` VALUES ('34', 'organization', '0004_teacher_image', '2017-03-05 18:09:08.000000');
INSERT INTO `django_migrations` VALUES ('35', 'courses', '0004_course_category', '2017-03-05 23:45:56.000000');
INSERT INTO `django_migrations` VALUES ('36', 'courses', '0005_auto_20170305_2346', '2017-03-05 23:46:33.000000');
INSERT INTO `django_migrations` VALUES ('37', 'courses', '0006_course_tag', '2017-03-06 00:23:41.000000');
INSERT INTO `django_migrations` VALUES ('38', 'courses', '0007_video_url', '2017-03-06 01:08:33.000000');
INSERT INTO `django_migrations` VALUES ('39', 'users', '0005_auto_20170306_0108', '2017-03-06 01:08:33.000000');
INSERT INTO `django_migrations` VALUES ('40', 'courses', '0008_video_learn_times', '2017-03-06 01:24:18.000000');
INSERT INTO `django_migrations` VALUES ('41', 'courses', '0009_course_teacher', '2017-03-06 01:31:40.000000');
INSERT INTO `django_migrations` VALUES ('42', 'courses', '0010_auto_20170306_0136', '2017-03-06 01:36:33.000000');
INSERT INTO `django_migrations` VALUES ('43', 'organization', '0005_teacher_age', '2017-03-07 01:17:28.000000');
INSERT INTO `django_migrations` VALUES ('44', 'users', '0006_auto_20170309_0053', '2017-03-09 00:54:08.000000');
INSERT INTO `django_migrations` VALUES ('45', 'users', '0007_auto_20170309_0150', '2017-03-09 01:50:31.000000');
INSERT INTO `django_migrations` VALUES ('46', 'courses', '0011_course_is_banner', '2017-03-09 22:15:14.000000');
INSERT INTO `django_migrations` VALUES ('47', 'organization', '0006_courseorg_tag', '2017-03-09 22:36:28.000000');
INSERT INTO `django_migrations` VALUES ('48', 'courses', '0012_auto_20170310_2300', '2017-03-10 23:01:53.000000');
INSERT INTO `django_migrations` VALUES ('49', 'courses', '0013_auto_20170313_0015', '2017-03-13 00:16:13.000000');
INSERT INTO `django_migrations` VALUES ('50', 'operation', '0003_auto_20170313_0015', '2017-03-13 00:16:15.000000');
INSERT INTO `django_migrations` VALUES ('51', 'organization', '0007_auto_20170313_0015', '2017-03-13 00:16:16.000000');
INSERT INTO `django_migrations` VALUES ('52', 'users', '0008_auto_20170313_0015', '2017-03-13 00:16:19.000000');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('6o5osusm6g18il0bjfkdlojd3lcz86yb', 'MzBkYjFhZDkwNjg4ZDc5MWQwMzkwZjY2NDNlZDUyMDc2ZGUwZTE4YTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiTElTVF9RVUVSWSI6W1sidXNlcnMiLCJiYW5uZXIiXSwiIl0sIl9hdXRoX3VzZXJfaGFzaCI6Ijc3NGJmYzNmZTYwZTM1OTI2YTZlOTQ1MGY3YjdiOTlkZjRhOGViYzgiLCJfYXV0aF91c2VyX2lkIjoiMSJ9', '2017-03-09 00:39:39.000000');
INSERT INTO `django_session` VALUES ('h66pju7dqfxbvgg4d4bnxwa8hz375qd6', 'YjFhOTcyMjkxNDM1OTI5OGZiYjQ5ZmM0MTExOWUzZmNhMDQxNzg5NTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiTElTVF9RVUVSWSI6W1siY291cnNlcyIsInZpZGVvIl0sIiJdLCJfYXV0aF91c2VyX2hhc2giOiI3MjBjMTk1MGNhZjAwZDcyODkyMDU5MWFkZTlmM2M5MzhjOGUwN2NlIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIndpemFyZF94YWRtaW51c2Vyd2lkZ2V0X2FkbWluX3dpemFyZF9mb3JtX3BsdWdpbiI6eyJzdGVwX2ZpbGVzIjp7fSwic3RlcCI6bnVsbCwiZXh0cmFfZGF0YSI6e30sInN0ZXBfZGF0YSI6e319fQ==', '2017-03-26 23:51:06.000000');
INSERT INTO `django_session` VALUES ('mfnktbl7qwygrp3iovx96uim3xcbkxl1', 'NTU4ZmEyZmZiMjllZWRjZGFkYzJjYzYyY2RhMDc4MTk2MGQzMTVmZTp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc3NGJmYzNmZTYwZTM1OTI2YTZlOTQ1MGY3YjdiOTlkZjRhOGViYzgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJ1c2Vycy52aWV3cy5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==', '2017-03-22 01:02:53.000000');

-- ----------------------------
-- Table structure for mx_banner
-- ----------------------------
DROP TABLE IF EXISTS `mx_banner`;
CREATE TABLE `mx_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `url` varchar(200) NOT NULL,
  `index` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mx_banner
-- ----------------------------
INSERT INTO `mx_banner` VALUES ('3', 'python1', 'banner/2017/03/python1.jpg', 'http://www.pythondoc.com', '1', '2017-03-12 23:04:00.000000');
INSERT INTO `mx_banner` VALUES ('4', 'python2', 'banner/2017/03/python2.jpg', 'http://www.pythondoc.com', '2', '2017-03-12 23:11:00.000000');
INSERT INTO `mx_banner` VALUES ('5', 'python3', 'banner/2017/03/pythno3.jpg', 'http://www.pythondoc.com', '3', '2017-03-12 23:12:00.000000');
INSERT INTO `mx_banner` VALUES ('6', 'python4', 'banner/2017/03/pythno4.jpg', 'http://www.pythondoc.com', '4', '2017-03-12 23:12:00.000000');
INSERT INTO `mx_banner` VALUES ('7', 'python5', 'banner/2017/03/python5.jpg', 'http://www.pythondoc.com', '5', '2017-03-12 23:12:00.000000');
INSERT INTO `mx_banner` VALUES ('8', 'python6', 'banner/2017/03/python6.jpg', 'http://www.pythondoc.com', '6', '2017-03-12 23:12:00.000000');

-- ----------------------------
-- Table structure for mx_city
-- ----------------------------
DROP TABLE IF EXISTS `mx_city`;
CREATE TABLE `mx_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `desc` varchar(20) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mx_city
-- ----------------------------
INSERT INTO `mx_city` VALUES ('1', '北京市', '北京市', '2017-03-04 17:15:00.000000');
INSERT INTO `mx_city` VALUES ('2', '上海市', '上海市', '2017-03-04 17:15:00.000000');
INSERT INTO `mx_city` VALUES ('3', '深圳市', '深圳市', '2017-03-04 17:15:00.000000');
INSERT INTO `mx_city` VALUES ('4', '天津市', '天津市', '2017-03-04 17:16:00.000000');
INSERT INTO `mx_city` VALUES ('5', '武汉市', '武汉市', '2017-03-04 17:16:00.000000');

-- ----------------------------
-- Table structure for mx_course
-- ----------------------------
DROP TABLE IF EXISTS `mx_course`;
CREATE TABLE `mx_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `desc` varchar(300) NOT NULL,
  `detail` longtext NOT NULL,
  `degree` varchar(5) NOT NULL,
  `learn_times` int(11) NOT NULL,
  `students` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `click_nums` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_org_id` int(11) DEFAULT NULL,
  `category` varchar(20) NOT NULL,
  `tag` varchar(10) NOT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `know` varchar(300) NOT NULL,
  `teacher_tell` varchar(300) NOT NULL,
  `is_banner` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_course_11456c5a` (`course_org_id`) USING BTREE,
  KEY `courses_course_d9614d40` (`teacher_id`) USING BTREE,
  CONSTRAINT `mx_course_ibfk_1` FOREIGN KEY (`course_org_id`) REFERENCES `mx_org` (`id`),
  CONSTRAINT `mx_course_ibfk_2` FOREIGN KEY (`teacher_id`) REFERENCES `mx_org_teacher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mx_course
-- ----------------------------
INSERT INTO `mx_course` VALUES ('1', 'Django入门', 'Django入门', 'Django入门', 'cj', '0', '0', '1', 'banner/2017/03/python2.jpg', '5', '2017-02-22 23:43:00.000000', '1', 'Python', '', null, 'pythonj基础', 'django进阶开发', '0');
INSERT INTO `mx_course` VALUES ('2', 'Python入门', 'Python入门', 'Python入门', 'cj', '0', '0', '0', 'courses/2017/03/python5_zlPefMK.jpg', '0', '2017-03-05 17:52:00.000000', '1', 'Python', 'Python', null, 'pythonj基础', 'django进阶开发', '1');
INSERT INTO `mx_course` VALUES ('3', 'Python进阶', 'Python进阶', 'Python进阶', 'zj', '0', '0', '0', 'banner/2017/03/pythno3.jpg', '0', '2017-03-05 17:53:00.000000', '1', 'Python', 'Django', null, 'pythonj基础', 'django进阶开发', '0');
INSERT INTO `mx_course` VALUES ('4', 'python高级', 'python高级', '<p>&nbsp; &nbsp; python高级</p><p><img src=\"/media/course/ueditor/mischievous-cat_20170310232956_880.jpg\" title=\"\" alt=\"mischievous-cat.jpg\"/> </p>', 'gj', '100', '23', '43', 'courses/2017/03/python5.jpg', '123345', '2017-03-05 20:59:00.000000', '1', 'python', 'Django', null, 'django进阶开发', 'django进阶开发', '1');
INSERT INTO `mx_course` VALUES ('5', 'Django进阶', 'Django进阶', '<p>&nbsp; &nbsp; Django进阶</p>', 'zj', '213', '124213', '12412', 'banner/2017/03/pythno3.jpg', '12412', '2017-03-05 21:02:00.000000', '1', 'Django', 'Django', null, 'safsdf', '学django进阶开发', '0');
INSERT INTO `mx_course` VALUES ('6', 'Django高级', 'Django高级', '<p>&nbsp; &nbsp; Django高级</p>', 'gj', '214234', '23444', '34232', 'banner/2017/03/pythno4.jpg', '24339', '2017-03-05 21:03:00.000000', '1', 'Python', 'python', '4', 'pythonj基础', 'django进阶开发', '0');
INSERT INTO `mx_course` VALUES ('7', 'flask入门', 'flask入门', 'flask入门', 'cj', '1143', '12', '24', 'banner/2017/03/python2.jpg', '0', '2017-03-13 02:07:29.000000', '1', 'Python', '', null, 'pythonj基础', 'django进阶开发', '1');
INSERT INTO `mx_course` VALUES ('8', 'Flask进阶', 'Flask进阶', '<p>&nbsp; &nbsp; Flask进阶</p>', 'zj', '213', '124213', '12412', 'courses/2017/03/python5.jpg', '12412', '2017-03-05 21:02:00.000000', '1', 'Django', 'Django', null, 'safsdf', '学django进阶开发', '0');
INSERT INTO `mx_course` VALUES ('9', 'Flask web', 'Flask web', '<p>&nbsp; &nbsp; Flask web</p>', 'gj', '214234', '23444', '34232', 'banner/2017/03/python2.jpg', '24339', '2017-03-05 21:03:00.000000', '1', 'Python', 'python', '4', 'pythonj基础', 'django进阶开发', '0');
INSERT INTO `mx_course` VALUES ('10', 'python爬虫', 'python爬虫', 'python爬虫', 'cj', '1143', '12', '24', 'banner/2017/03/pythno4.jpg', '0', '2017-03-13 02:07:29.000000', '1', 'Python', '', null, 'python爬虫', 'django进阶开发', '1');

-- ----------------------------
-- Table structure for mx_course_comment
-- ----------------------------
DROP TABLE IF EXISTS `mx_course_comment`;
CREATE TABLE `mx_course_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comments` varchar(200) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_coursecomments_ea134da7` (`course_id`) USING BTREE,
  KEY `operation_coursecomments_e8701ad4` (`user_id`) USING BTREE,
  CONSTRAINT `mx_course_comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `mx_user` (`id`),
  CONSTRAINT `mx_course_comment_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `mx_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mx_course_comment
-- ----------------------------
INSERT INTO `mx_course_comment` VALUES ('1', 'zasdfjasl', '2017-03-06 23:14:29.000000', '6', '1');
INSERT INTO `mx_course_comment` VALUES ('2', 'safaskjflsa', '2017-03-06 23:14:36.000000', '6', '1');
INSERT INTO `mx_course_comment` VALUES ('3', 'asdsajkfl', '2017-03-06 23:17:21.000000', '6', '1');

-- ----------------------------
-- Table structure for mx_course_course
-- ----------------------------
DROP TABLE IF EXISTS `mx_course_course`;
CREATE TABLE `mx_course_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_usercourse_ea134da7` (`course_id`) USING BTREE,
  KEY `operation_usercourse_e8701ad4` (`user_id`) USING BTREE,
  CONSTRAINT `mx_course_course_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `mx_course` (`id`),
  CONSTRAINT `mx_course_course_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `mx_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mx_course_course
-- ----------------------------
INSERT INTO `mx_course_course` VALUES ('1', '2017-03-05 23:51:00.000000', '6', '1');
INSERT INTO `mx_course_course` VALUES ('2', '2017-03-05 23:51:00.000000', '6', '6');
INSERT INTO `mx_course_course` VALUES ('3', '2017-03-05 23:52:00.000000', '1', '1');
INSERT INTO `mx_course_course` VALUES ('4', '2017-03-05 23:52:00.000000', '5', '6');
INSERT INTO `mx_course_course` VALUES ('5', '2017-03-05 23:52:00.000000', '4', '6');
INSERT INTO `mx_course_course` VALUES ('6', '2017-03-05 23:52:00.000000', '4', '1');

-- ----------------------------
-- Table structure for mx_course_favorite
-- ----------------------------
DROP TABLE IF EXISTS `mx_course_favorite`;
CREATE TABLE `mx_course_favorite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fav_id` int(11) NOT NULL,
  `fav_type` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_userfavorite_e8701ad4` (`user_id`) USING BTREE,
  CONSTRAINT `mx_course_favorite_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `mx_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mx_course_favorite
-- ----------------------------
INSERT INTO `mx_course_favorite` VALUES ('20', '1', '3', '2017-03-07 02:50:52.000000', '1');
INSERT INTO `mx_course_favorite` VALUES ('24', '1', '1', '2017-03-09 03:03:05.000000', '1');
INSERT INTO `mx_course_favorite` VALUES ('29', '1', '2', '2017-03-09 03:06:14.000000', '1');
INSERT INTO `mx_course_favorite` VALUES ('30', '2', '2', '2017-03-09 03:14:09.000000', '1');
INSERT INTO `mx_course_favorite` VALUES ('31', '6', '1', '2017-03-09 03:36:12.000000', '1');

-- ----------------------------
-- Table structure for mx_course_lesson
-- ----------------------------
DROP TABLE IF EXISTS `mx_course_lesson`;
CREATE TABLE `mx_course_lesson` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_lesson_course_id_16bc4882_fk_courses_course_id` (`course_id`) USING BTREE,
  CONSTRAINT `mx_course_lesson_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `mx_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mx_course_lesson
-- ----------------------------
INSERT INTO `mx_course_lesson` VALUES ('1', '第一节', '2017-02-22 23:45:00.000000', '1');
INSERT INTO `mx_course_lesson` VALUES ('2', '第二节', '2017-02-22 23:45:00.000000', '1');
INSERT INTO `mx_course_lesson` VALUES ('3', '第一节', '2017-03-06 01:04:00.000000', '6');
INSERT INTO `mx_course_lesson` VALUES ('4', '第二节', '2017-03-06 01:04:00.000000', '6');
INSERT INTO `mx_course_lesson` VALUES ('5', '第三节', '2017-03-06 01:05:00.000000', '6');

-- ----------------------------
-- Table structure for mx_course_message
-- ----------------------------
DROP TABLE IF EXISTS `mx_course_message`;
CREATE TABLE `mx_course_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `message` varchar(500) NOT NULL,
  `has_read` tinyint(1) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mx_course_message
-- ----------------------------

-- ----------------------------
-- Table structure for mx_course_resource
-- ----------------------------
DROP TABLE IF EXISTS `mx_course_resource`;
CREATE TABLE `mx_course_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `download` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_courseresource_course_id_5eba1332_fk_courses_course_id` (`course_id`) USING BTREE,
  CONSTRAINT `mx_course_resource_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `mx_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mx_course_resource
-- ----------------------------
INSERT INTO `mx_course_resource` VALUES ('1', '前段页面', 'courses/resource/2017/03/新手常见Python运行时错误.pdf', '2017-03-06 01:25:00.000000', '6');

-- ----------------------------
-- Table structure for mx_course_video
-- ----------------------------
DROP TABLE IF EXISTS `mx_course_video`;
CREATE TABLE `mx_course_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `url` varchar(200) NOT NULL,
  `learn_times` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_video_lesson_id_59f2396e_fk_courses_lesson_id` (`lesson_id`) USING BTREE,
  CONSTRAINT `mx_course_video_ibfk_1` FOREIGN KEY (`lesson_id`) REFERENCES `mx_course_lesson` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mx_course_video
-- ----------------------------
INSERT INTO `mx_course_video` VALUES ('1', '1-1', '2017-03-06 01:06:00.000000', '3', 'http://ompehspge.bkt.clouddn.com/video/default.mp4', '1');
INSERT INTO `mx_course_video` VALUES ('2', '1-2', '2017-03-06 01:06:00.000000', '3', 'http://ompehspge.bkt.clouddn.com/video/default.mp4', '1');
INSERT INTO `mx_course_video` VALUES ('3', '1-3', '2017-03-06 01:06:00.000000', '3', 'http://ompehspge.bkt.clouddn.com/video/default.mp4', '1');
INSERT INTO `mx_course_video` VALUES ('4', '2-1', '2017-03-06 01:06:00.000000', '4', 'http://ompehspge.bkt.clouddn.com/video/default.mp4', '1');
INSERT INTO `mx_course_video` VALUES ('5', '2-2', '2017-03-06 01:06:00.000000', '4', 'http://ompehspge.bkt.clouddn.com/video/default.mp4', '1');
INSERT INTO `mx_course_video` VALUES ('6', '2-3', '2017-03-06 01:06:00.000000', '4', 'http://ompehspge.bkt.clouddn.com/video/default.mp4', '1');
INSERT INTO `mx_course_video` VALUES ('7', '3-1', '2017-03-06 01:09:00.000000', '5', 'http://ompehspge.bkt.clouddn.com/video/default.mp4', '1');
INSERT INTO `mx_course_video` VALUES ('8', '3-2', '2017-03-06 01:09:00.000000', '5', 'http://ompehspge.bkt.clouddn.com/video/default.mp4', '1');
INSERT INTO `mx_course_video` VALUES ('9', '3-3', '2017-03-06 01:10:00.000000', '5', 'http://ompehspge.bkt.clouddn.com/video/default.mp4', '1');

-- ----------------------------
-- Table structure for mx_org
-- ----------------------------
DROP TABLE IF EXISTS `mx_org`;
CREATE TABLE `mx_org` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `desc` longtext NOT NULL,
  `image` varchar(100) NOT NULL,
  `address` varchar(150) NOT NULL,
  `click_nums` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `city_id` int(11) NOT NULL,
  `category` varchar(20) NOT NULL,
  `course_nums` int(11) NOT NULL,
  `students` int(11) NOT NULL,
  `tag` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_course_city_id_4a842f85_fk_organization_citydict_id` (`city_id`) USING BTREE,
  CONSTRAINT `mx_org_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `mx_city` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mx_org
-- ----------------------------
INSERT INTO `mx_org` VALUES ('1', '慕课网1', '慕课网慕课网慕课网慕课网慕课网慕课网慕课网慕课网慕课网慕课网慕课网慕课网慕课网慕课网慕课网慕课网慕课网慕课网慕课网慕课网慕课网慕课网慕课网慕课网慕课网慕课网慕课网慕课网慕课网慕课网慕课网慕课网慕课网慕课网慕课网慕课网慕课网慕课网慕课网慕课网慕课网慕课网慕课网慕课网慕课网慕课网慕课网慕课网慕课网慕课网慕课网慕课网慕课网慕课网', 'org/2017/03/pythno3.jpg', '北京市', '9', '1', '2017-03-04 17:17:00.000000', '1', 'pxjg', '0', '0', '全国知名');
INSERT INTO `mx_org` VALUES ('2', '慕课网2', '慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2', 'banner/2017/03/pythno4.jpg', '上海市', '1', '1', '2017-03-04 17:23:00.000000', '2', 'pxjg', '0', '0', '全国知名');
INSERT INTO `mx_org` VALUES ('3', '慕课网3', '慕课网3慕课网3慕课网3慕课网3慕课网3慕课网3慕课网3慕课网3慕课网3慕课网3慕课网3慕课网3慕课网3慕课网3慕课网3慕课网3慕课网3慕课网3慕课网3慕课网3慕课网3慕课网3慕课网3慕课网3慕课网3慕课网3慕课网3慕课网3慕课网3慕课网3慕课网3慕课网3慕课网3慕课网3慕课网3慕课网3慕课网3慕课网3慕课网3', 'banner/2017/03/python6.jpg', '深圳市', '0', '0', '2017-03-04 17:23:00.000000', '3', 'pxjg', '0', '0', '全国知名');
INSERT INTO `mx_org` VALUES ('4', '慕课网4', '慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4', 'banner/2017/03/python5.jpg', '天津市', '0', '0', '2017-03-04 17:24:00.000000', '4', 'pxjg', '0', '0', '全国知名');
INSERT INTO `mx_org` VALUES ('5', '慕课网5', '慕课网5慕课网5慕课网5慕课网5慕课网5慕课网5慕课网5慕课网5慕课网5慕课网5慕课网5慕课网5慕课网5慕课网5慕课网5慕课网5慕课网5慕课网5慕课网5慕课网5慕课网5慕课网5慕课网5慕课网5慕课网5慕课网5慕课网5慕课网5慕课网5慕课网5慕课网5慕课网5慕课网5慕课网5慕课网5慕课网5慕课网5', 'banner/2017/03/pythno4.jpg', '武汉市', '0', '0', '2017-03-04 17:24:00.000000', '5', 'pxjg', '0', '0', '全国知名');
INSERT INTO `mx_org` VALUES ('6', '慕课网6', '慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6', 'org/2017/03/pythno3.jpg', '北京市', '0', '0', '2017-03-04 17:24:00.000000', '1', 'pxjg', '0', '0', '全国知名');
INSERT INTO `mx_org` VALUES ('7', '慕课网7', '慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7', 'banner/2017/03/python1.jpg', '深圳市', '0', '0', '2017-03-04 17:25:00.000000', '3', 'pxjg', '0', '0', '全国知名');
INSERT INTO `mx_org` VALUES ('8', '慕课网8', '慕课网8慕课网8慕课网8慕课网8慕课网8慕课网8慕课网8', 'banner/2017/03/python2.jpg', '北京市', '0', '0', '2017-03-04 17:25:00.000000', '1', 'pxjg', '0', '0', '全国知名');
INSERT INTO `mx_org` VALUES ('9', '慕课网9', '慕课网9慕课网9慕课网9慕课网9慕课网9慕课网9慕课网9慕课网9慕课网9慕课网9慕课网9慕课网9慕课网9慕课网9慕课网9慕课网9慕课网9慕课网9慕课网9慕课网9慕课网9慕课网9慕课网9慕课网9慕课网9慕课网9慕课网9慕课网9慕课网9慕课网9慕课网9慕课网9慕课网9慕课网9慕课网9慕课网9慕课网9慕课网9', 'banner/2017/03/python1.jpg', '北京市', '0', '0', '2017-03-04 17:26:00.000000', '1', 'pxjg', '0', '0', '全国知名');
INSERT INTO `mx_org` VALUES ('10', '慕课网10', '慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10', 'banner/2017/03/python5.jpg', '北京市', '0', '0', '2017-03-04 17:26:00.000000', '1', 'pxjg', '0', '0', '全国知名');
INSERT INTO `mx_org` VALUES ('11', '慕课网11', '慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6', 'banner/2017/03/python6.jpg', '北京市', '0', '0', '2017-03-04 17:24:00.000000', '1', 'pxjg', '0', '0', '全国知名');
INSERT INTO `mx_org` VALUES ('12', '慕课网12', '慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7', 'org/2017/03/pythno3.jpg', '深圳市', '0', '0', '2017-03-04 17:25:00.000000', '3', 'pxjg', '0', '0', '全国知名');
INSERT INTO `mx_org` VALUES ('13', '慕课网13', '慕课网8慕课网8慕课网8慕课网8慕课网8慕课网8慕课网8慕课网8慕课网8慕课网8慕课网8慕课网8慕课网8慕课网8慕课网8慕课网8慕课网8慕课网8慕课网8慕课网8慕课网8慕课网8慕课网8慕课网8慕课网8慕课网8慕课网8慕课网8慕课网8慕课网8慕课网8慕课网8慕课网8慕课网8慕课网8慕课网8慕课网8慕课网8慕课网8慕课网8慕课网8慕课网8慕课网8慕课网8慕课网8慕课网8慕课网8慕课网8慕课网8', 'banner/2017/03/python1.jpg', '北京市', '0', '0', '2017-03-04 17:25:00.000000', '1', 'pxjg', '0', '0', '全国知名');
INSERT INTO `mx_org` VALUES ('14', '慕课网14', '慕课网9慕课网9慕课网9慕课网9慕课网9慕课网9慕课网9慕课网9慕课网9慕课网9慕课网9慕课网9慕课网9慕课网9慕课网9慕课网9慕课网9慕课网9慕课网9慕课网9慕课网9慕课网9慕课网9慕课网9慕课网9慕课网9慕课网9慕课网9慕课网9慕课网9慕课网9慕课网9慕课网9慕课网9慕课网9慕课网9慕课网9慕课网9', 'banner/2017/03/python2.jpg', '北京市', '0', '0', '2017-03-04 17:26:00.000000', '1', 'pxjg', '0', '0', '全国知名');
INSERT INTO `mx_org` VALUES ('15', '慕课网15', '慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10慕课网10', 'banner/2017/03/python6.jpg', '北京市', '0', '0', '2017-03-04 17:26:00.000000', '1', 'pxjg', '0', '0', '全国知名');

-- ----------------------------
-- Table structure for mx_org_teacher
-- ----------------------------
DROP TABLE IF EXISTS `mx_org_teacher`;
CREATE TABLE `mx_org_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `work_years` int(11) NOT NULL,
  `work_company` varchar(50) NOT NULL,
  `work_position` varchar(50) NOT NULL,
  `points` varchar(150) NOT NULL,
  `click_nums` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `org_id` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `age` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_teache_org_id_cd000a1a_fk_organization_courseorg_id` (`org_id`) USING BTREE,
  CONSTRAINT `mx_org_teacher_ibfk_1` FOREIGN KEY (`org_id`) REFERENCES `mx_org` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mx_org_teacher
-- ----------------------------
INSERT INTO `mx_org_teacher` VALUES ('1', 'wj', '50', 'aaaaaaaaa', 'aaaaa', 'aa', '102', '46', '2017-03-05 17:22:00.000000', '1', 'teacher/2017/03/grumpy-cat.jpg', '24');
INSERT INTO `mx_org_teacher` VALUES ('2', 'wang', '6', 'bbbbbb', 'bbb', 'bb', '333', '242', '2017-03-05 17:23:00.000000', '1', 'teacher/2017/03/grumpy-cat.jpg', '24');
INSERT INTO `mx_org_teacher` VALUES ('3', 'wangjie', '11', 'cccccccccc', 'ccccc', 'cccc', '123', '123', '2017-03-05 17:23:00.000000', '1', 'teacher/2017/03/funny-cat_sMORWgV.jpg', '24');
INSERT INTO `mx_org_teacher` VALUES ('4', 'wangjie2', '11', 'ddddddddddddddddd', 'ddddddddd', 'dddd', '352', '244', '2017-03-05 17:23:00.000000', '2', 'teacher/2017/03/mischievous-cat.jpg', '24');

-- ----------------------------
-- Table structure for mx_user
-- ----------------------------
DROP TABLE IF EXISTS `mx_user`;
CREATE TABLE `mx_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `nick_name` varchar(50) NOT NULL,
  `birthday` date DEFAULT NULL,
  `gender` varchar(10) NOT NULL,
  `address` varchar(100) NOT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `openid` varchar(50) DEFAULT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mx_user
-- ----------------------------
INSERT INTO `mx_user` VALUES ('1', 'pbkdf2_sha256$24000$WMyX9HMXBHTj$GoDmxjbzRySFZlRgsnkNdpxAP3ePCEz2In6N5wsJ9Fw=', '2017-03-09 22:42:25.000000', '1', 'admin', '', '', '717728534@qq.com', '1', '1', '2017-02-22 23:10:00.000000', '小王', '2017-03-01', 'male', '阿斯顿', '', 'image/2017/03/funny-cat_7ek2pwO.jpg');
INSERT INTO `mx_user` VALUES ('6', 'pbkdf2_sha256$24000$dge9bPzZ4QDw$NgnM7mAbagL2GrLpX3jFTNuklEcdbvdLW/TyijO65qU=', '2017-03-04 13:09:00.000000', '0', '717728534@qq.com', '', '', '7177285@qq.com', '0', '0', '2017-02-28 01:45:00.000000', '小明', null, 'female', '大师傅撒发生的', '', 'image/2016/11/default_middile_7.png');

-- ----------------------------
-- Table structure for mx_user_ask
-- ----------------------------
DROP TABLE IF EXISTS `mx_user_ask`;
CREATE TABLE `mx_user_ask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `course_name` varchar(50) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mx_user_ask
-- ----------------------------
INSERT INTO `mx_user_ask` VALUES ('1', '王杰', '12323123214', 'Django入门', '2017-02-23 00:11:00.000000');
INSERT INTO `mx_user_ask` VALUES ('2', 'admin', '12345678909', 'Django入门', '2017-03-05 16:55:28.000000');
INSERT INTO `mx_user_ask` VALUES ('3', '王杰', '14242234532', 'Django入门', '2017-03-05 16:57:42.000000');
INSERT INTO `mx_user_ask` VALUES ('4', '王杰', '12323123212', 'Django入门', '2017-03-05 17:03:21.000000');
INSERT INTO `mx_user_ask` VALUES ('5', 'wang', '13456789432', 'Django入门', '2017-03-05 17:14:19.000000');

-- ----------------------------
-- Table structure for mx_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `mx_user_groups`;
CREATE TABLE `mx_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_groups_userprofile_id_823cf2fc_uniq` (`userprofile_id`,`group_id`) USING BTREE,
  KEY `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` (`group_id`) USING BTREE,
  CONSTRAINT `mx_user_groups_ibfk_1` FOREIGN KEY (`userprofile_id`) REFERENCES `mx_user` (`id`),
  CONSTRAINT `mx_user_groups_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mx_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for mx_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `mx_user_user_permissions`;
CREATE TABLE `mx_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_user_permissions_userprofile_id_d0215190_uniq` (`userprofile_id`,`permission_id`) USING BTREE,
  KEY `users_userprofile_u_permission_id_393136b6_fk_auth_permission_id` (`permission_id`) USING BTREE,
  CONSTRAINT `mx_user_user_permissions_ibfk_1` FOREIGN KEY (`userprofile_id`) REFERENCES `mx_user` (`id`),
  CONSTRAINT `mx_user_user_permissions_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mx_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for mx_verifycode
-- ----------------------------
DROP TABLE IF EXISTS `mx_verifycode`;
CREATE TABLE `mx_verifycode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `send_type` varchar(20) NOT NULL,
  `send_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mx_verifycode
-- ----------------------------

-- ----------------------------
-- Table structure for reversion_revision
-- ----------------------------
DROP TABLE IF EXISTS `reversion_revision`;
CREATE TABLE `reversion_revision` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_created` datetime(6) NOT NULL,
  `comment` longtext NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reversion_revision_user_id_17095f45_fk_users_userprofile_id` (`user_id`) USING BTREE,
  KEY `reversion_revision_c69e55a4` (`date_created`) USING BTREE,
  CONSTRAINT `reversion_revision_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `mx_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reversion_revision
-- ----------------------------

-- ----------------------------
-- Table structure for reversion_version
-- ----------------------------
DROP TABLE IF EXISTS `reversion_version`;
CREATE TABLE `reversion_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` varchar(191) NOT NULL,
  `format` varchar(255) NOT NULL,
  `serialized_data` longtext NOT NULL,
  `object_repr` longtext NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `revision_id` int(11) NOT NULL,
  `db` varchar(191) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reversion_version_db_b2c54f65_uniq` (`db`,`content_type_id`,`object_id`,`revision_id`) USING BTREE,
  KEY `reversion_ver_content_type_id_7d0ff25c_fk_django_content_type_id` (`content_type_id`) USING BTREE,
  KEY `reversion_version_revision_id_af9f6a9d_fk_reversion_revision_id` (`revision_id`) USING BTREE,
  CONSTRAINT `reversion_version_ibfk_1` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `reversion_version_ibfk_2` FOREIGN KEY (`revision_id`) REFERENCES `reversion_revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reversion_version
-- ----------------------------

-- ----------------------------
-- Table structure for xadmin_bookmark
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_bookmark`;
CREATE TABLE `xadmin_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `url_name` varchar(64) NOT NULL,
  `query` varchar(1000) NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_bookma_content_type_id_60941679_fk_django_content_type_id` (`content_type_id`) USING BTREE,
  KEY `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` (`user_id`) USING BTREE,
  CONSTRAINT `xadmin_bookmark_ibfk_1` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_bookmark_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `mx_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_bookmark
-- ----------------------------

-- ----------------------------
-- Table structure for xadmin_log
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_log`;
CREATE TABLE `xadmin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `ip_addr` char(39) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` varchar(32) NOT NULL,
  `message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` (`content_type_id`) USING BTREE,
  KEY `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` (`user_id`) USING BTREE,
  CONSTRAINT `xadmin_log_ibfk_1` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_log_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `mx_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_log
-- ----------------------------
INSERT INTO `xadmin_log` VALUES ('1', '2017-02-22 23:43:38.000000', '127.0.0.1', '1', 'Course object', 'create', '已添加', '9', '1');
INSERT INTO `xadmin_log` VALUES ('2', '2017-02-22 23:45:46.000000', '127.0.0.1', '1', '第一节', 'create', '已添加', '10', '1');
INSERT INTO `xadmin_log` VALUES ('3', '2017-02-22 23:45:56.000000', '127.0.0.1', '2', '第二节', 'create', '已添加', '10', '1');
INSERT INTO `xadmin_log` VALUES ('4', '2017-02-23 00:11:58.000000', '127.0.0.1', '1', '王杰咨询了Django入门', 'create', '已添加', '16', '1');
INSERT INTO `xadmin_log` VALUES ('5', '2017-02-23 00:38:20.000000', '127.0.0.1', '4', '已经添加了 \"王杰咨询了Django入门\".', 'change', '没有字段被修改。', '24', '1');
INSERT INTO `xadmin_log` VALUES ('6', '2017-03-04 17:15:46.000000', '127.0.0.1', '1', 'CityDict object', 'create', '已添加', '14', '1');
INSERT INTO `xadmin_log` VALUES ('7', '2017-03-04 17:15:58.000000', '127.0.0.1', '2', 'CityDict object', 'create', '已添加', '14', '1');
INSERT INTO `xadmin_log` VALUES ('8', '2017-03-04 17:16:11.000000', '127.0.0.1', '3', 'CityDict object', 'create', '已添加', '14', '1');
INSERT INTO `xadmin_log` VALUES ('9', '2017-03-04 17:16:20.000000', '127.0.0.1', '4', 'CityDict object', 'create', '已添加', '14', '1');
INSERT INTO `xadmin_log` VALUES ('10', '2017-03-04 17:17:11.000000', '127.0.0.1', '5', '武汉市', 'create', '已添加', '14', '1');
INSERT INTO `xadmin_log` VALUES ('11', '2017-03-04 17:20:45.000000', '127.0.0.1', '1', 'CourseOrg object', 'create', '已添加', '13', '1');
INSERT INTO `xadmin_log` VALUES ('12', '2017-03-04 17:23:34.000000', '127.0.0.1', '2', '慕课网2', 'create', '已添加', '13', '1');
INSERT INTO `xadmin_log` VALUES ('13', '2017-03-04 17:24:06.000000', '127.0.0.1', '3', '慕课网3', 'create', '已添加', '13', '1');
INSERT INTO `xadmin_log` VALUES ('14', '2017-03-04 17:24:30.000000', '127.0.0.1', '4', '慕课网4', 'create', '已添加', '13', '1');
INSERT INTO `xadmin_log` VALUES ('15', '2017-03-04 17:24:53.000000', '127.0.0.1', '5', '慕课网5', 'create', '已添加', '13', '1');
INSERT INTO `xadmin_log` VALUES ('16', '2017-03-04 17:25:21.000000', '127.0.0.1', '6', '慕课网6', 'create', '已添加', '13', '1');
INSERT INTO `xadmin_log` VALUES ('17', '2017-03-04 17:25:50.000000', '127.0.0.1', '7', '慕课网7', 'create', '已添加', '13', '1');
INSERT INTO `xadmin_log` VALUES ('18', '2017-03-04 17:26:08.000000', '127.0.0.1', '8', '慕课网8', 'create', '已添加', '13', '1');
INSERT INTO `xadmin_log` VALUES ('19', '2017-03-04 17:26:27.000000', '127.0.0.1', '9', '慕课网9', 'create', '已添加', '13', '1');
INSERT INTO `xadmin_log` VALUES ('20', '2017-03-04 17:26:50.000000', '127.0.0.1', '10', '慕课网10', 'create', '已添加', '13', '1');
INSERT INTO `xadmin_log` VALUES ('21', '2017-03-05 17:23:09.000000', '127.0.0.1', '1', 'wj', 'create', '已添加', '15', '1');
INSERT INTO `xadmin_log` VALUES ('22', '2017-03-05 17:23:28.000000', '127.0.0.1', '2', 'wang', 'create', '已添加', '15', '1');
INSERT INTO `xadmin_log` VALUES ('23', '2017-03-05 17:23:49.000000', '127.0.0.1', '3', 'wangjie', 'create', '已添加', '15', '1');
INSERT INTO `xadmin_log` VALUES ('24', '2017-03-05 17:24:13.000000', '127.0.0.1', '4', 'wangjie2', 'create', '已添加', '15', '1');
INSERT INTO `xadmin_log` VALUES ('25', '2017-03-05 17:52:45.000000', '127.0.0.1', '1', 'Django入门', 'change', '已修改 course_org 和 image 。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('26', '2017-03-05 17:53:10.000000', '127.0.0.1', '2', 'Python入门', 'create', '已添加', '9', '1');
INSERT INTO `xadmin_log` VALUES ('27', '2017-03-05 17:53:28.000000', '127.0.0.1', '3', 'Python进阶', 'create', '已添加', '9', '1');
INSERT INTO `xadmin_log` VALUES ('28', '2017-03-05 18:09:28.000000', '127.0.0.1', '4', 'wangjie2', 'change', '已修改 image 。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('29', '2017-03-05 18:09:38.000000', '127.0.0.1', '3', 'wangjie', 'change', '已修改 image 。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('30', '2017-03-05 18:09:47.000000', '127.0.0.1', '2', 'wang', 'change', '已修改 image 。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('31', '2017-03-05 18:09:56.000000', '127.0.0.1', '1', 'wj', 'change', '已修改 image 。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('32', '2017-03-05 21:00:42.000000', '127.0.0.1', '4', 'python高级', 'create', '已添加', '9', '1');
INSERT INTO `xadmin_log` VALUES ('33', '2017-03-05 21:03:25.000000', '127.0.0.1', '5', 'Django进阶', 'create', '已添加', '9', '1');
INSERT INTO `xadmin_log` VALUES ('34', '2017-03-05 21:04:02.000000', '127.0.0.1', '6', 'Django高级', 'create', '已添加', '9', '1');
INSERT INTO `xadmin_log` VALUES ('35', '2017-03-05 23:51:27.000000', '127.0.0.1', '6', 'Django高级', 'change', '已修改 category 。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('36', '2017-03-05 23:51:36.000000', '127.0.0.1', '5', 'Django进阶', 'change', '已修改 category 。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('37', '2017-03-05 23:51:56.000000', '127.0.0.1', '1', 'admin正在学习Django高级', 'create', '已添加', '20', '1');
INSERT INTO `xadmin_log` VALUES ('38', '2017-03-05 23:52:02.000000', '127.0.0.1', '2', '717728534@qq.com正在学习Django高级', 'create', '已添加', '20', '1');
INSERT INTO `xadmin_log` VALUES ('39', '2017-03-05 23:52:08.000000', '127.0.0.1', '3', 'admin正在学习Django入门', 'create', '已添加', '20', '1');
INSERT INTO `xadmin_log` VALUES ('40', '2017-03-05 23:52:14.000000', '127.0.0.1', '4', '717728534@qq.com正在学习Django进阶', 'create', '已添加', '20', '1');
INSERT INTO `xadmin_log` VALUES ('41', '2017-03-05 23:52:21.000000', '127.0.0.1', '5', '717728534@qq.com正在学习python高级', 'create', '已添加', '20', '1');
INSERT INTO `xadmin_log` VALUES ('42', '2017-03-05 23:52:26.000000', '127.0.0.1', '6', 'admin正在学习python高级', 'create', '已添加', '20', '1');
INSERT INTO `xadmin_log` VALUES ('43', '2017-03-05 23:53:42.000000', '127.0.0.1', '6', '717728534@qq.com', 'change', '已修改 last_login，nick_name，address 和 image 。', '6', '1');
INSERT INTO `xadmin_log` VALUES ('44', '2017-03-05 23:54:08.000000', '127.0.0.1', '1', 'admin', 'change', '已修改 last_login，nick_name，address 和 image 。', '6', '1');
INSERT INTO `xadmin_log` VALUES ('45', '2017-03-06 00:29:42.000000', '127.0.0.1', '6', 'Django高级', 'change', '已修改 tag 。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('46', '2017-03-06 00:29:54.000000', '127.0.0.1', '5', 'Django进阶', 'change', '已修改 tag 。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('47', '2017-03-06 00:30:17.000000', '127.0.0.1', '4', 'python高级', 'change', '已修改 category 和 tag 。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('48', '2017-03-06 01:04:54.000000', '127.0.0.1', '3', '第一节', 'create', '已添加', '10', '1');
INSERT INTO `xadmin_log` VALUES ('49', '2017-03-06 01:05:14.000000', '127.0.0.1', '4', '第二节', 'create', '已添加', '10', '1');
INSERT INTO `xadmin_log` VALUES ('50', '2017-03-06 01:06:03.000000', '127.0.0.1', '5', '第三节', 'create', '已添加', '10', '1');
INSERT INTO `xadmin_log` VALUES ('51', '2017-03-06 01:06:18.000000', '127.0.0.1', '1', '1-1', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('52', '2017-03-06 01:06:21.000000', '127.0.0.1', '2', '1-2', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('53', '2017-03-06 01:06:31.000000', '127.0.0.1', '3', '1-3', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('54', '2017-03-06 01:06:45.000000', '127.0.0.1', '4', '2-1', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('55', '2017-03-06 01:06:49.000000', '127.0.0.1', '5', '2-2', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('56', '2017-03-06 01:06:55.000000', '127.0.0.1', '6', '2-3', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('57', '2017-03-06 01:09:56.000000', '127.0.0.1', '7', '3-1', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('58', '2017-03-06 01:10:02.000000', '127.0.0.1', '8', '3-2', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('59', '2017-03-06 01:10:07.000000', '127.0.0.1', '9', '3-3', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('60', '2017-03-06 01:25:40.000000', '127.0.0.1', '1', '前段页面', 'create', '已添加', '12', '1');
INSERT INTO `xadmin_log` VALUES ('61', '2017-03-06 01:32:24.000000', '127.0.0.1', '6', 'Django高级', 'change', '已修改 teacher 。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('62', '2017-03-06 01:37:10.000000', '127.0.0.1', '6', 'Django高级', 'change', '已修改 know 和 teacher_tell 。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('63', '2017-03-07 00:17:24.000000', '127.0.0.1', '1', '1-1', 'change', '已修改 url 。', '11', '1');
INSERT INTO `xadmin_log` VALUES ('64', '2017-03-09 22:19:21.000000', '127.0.0.1', '1', 'Banner object', 'create', '已添加', '8', '1');
INSERT INTO `xadmin_log` VALUES ('65', '2017-03-09 22:19:39.000000', '127.0.0.1', '2', 'Banner object', 'create', '已添加', '8', '1');
INSERT INTO `xadmin_log` VALUES ('66', '2017-03-10 22:21:06.000000', '127.0.0.1', '4', 'python高级', 'change', '已修改 is_banner，know 和 teacher_tell 。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('67', '2017-03-10 23:29:59.000000', '127.0.0.1', '4', 'python高级', 'change', '已修改 detail 。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('68', '2017-03-12 23:05:09.000000', '127.0.0.1', '3', 'Banner object', 'create', '已添加', '8', '1');
INSERT INTO `xadmin_log` VALUES ('69', '2017-03-12 23:11:28.000000', '127.0.0.1', null, '', 'delete', '批量删除 2 个 轮播图', null, '1');
INSERT INTO `xadmin_log` VALUES ('70', '2017-03-12 23:12:03.000000', '127.0.0.1', '4', 'Banner object', 'create', '已添加', '8', '1');
INSERT INTO `xadmin_log` VALUES ('71', '2017-03-12 23:12:15.000000', '127.0.0.1', '5', 'Banner object', 'create', '已添加', '8', '1');
INSERT INTO `xadmin_log` VALUES ('72', '2017-03-12 23:12:28.000000', '127.0.0.1', '6', 'Banner object', 'create', '已添加', '8', '1');
INSERT INTO `xadmin_log` VALUES ('73', '2017-03-12 23:12:48.000000', '127.0.0.1', '7', 'Banner object', 'create', '已添加', '8', '1');
INSERT INTO `xadmin_log` VALUES ('74', '2017-03-12 23:13:02.000000', '127.0.0.1', '8', 'Banner object', 'create', '已添加', '8', '1');
INSERT INTO `xadmin_log` VALUES ('75', '2017-03-12 23:13:22.000000', '127.0.0.1', null, '', 'delete', '批量删除 7 个 邮箱验证码', null, '1');
INSERT INTO `xadmin_log` VALUES ('76', '2017-03-12 23:14:21.000000', '127.0.0.1', '10', '慕课网10', 'change', '已修改 image 。', '13', '1');
INSERT INTO `xadmin_log` VALUES ('77', '2017-03-12 23:16:00.000000', '127.0.0.1', '4', 'wangjie2', 'change', '已修改 image 。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('78', '2017-03-12 23:16:10.000000', '127.0.0.1', '1', 'wj', 'change', '已修改 image 。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('79', '2017-03-12 23:16:18.000000', '127.0.0.1', '4', 'wangjie2', 'change', '已修改 image 。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('80', '2017-03-12 23:16:28.000000', '127.0.0.1', '3', 'wangjie', 'change', '已修改 image 。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('81', '2017-03-12 23:17:36.000000', '127.0.0.1', '4', 'python高级', 'change', '已修改 detail 和 image 。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('82', '2017-03-12 23:17:50.000000', '127.0.0.1', '6', 'Django高级', 'change', '已修改 detail 和 image 。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('83', '2017-03-12 23:18:21.000000', '127.0.0.1', '5', 'Django进阶', 'change', '已修改 detail，know 和 teacher_tell 。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('84', '2017-03-12 23:20:47.000000', '127.0.0.1', '1', '前段页面', 'change', '已修改 download 。', '12', '1');

-- ----------------------------
-- Table structure for xadmin_usersettings
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_usersettings`;
CREATE TABLE `xadmin_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` (`user_id`) USING BTREE,
  CONSTRAINT `xadmin_usersettings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `mx_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_usersettings
-- ----------------------------
INSERT INTO `xadmin_usersettings` VALUES ('1', 'dashboard:home:pos', '', '1');
INSERT INTO `xadmin_usersettings` VALUES ('2', 'site-theme', '/static/xadmin/css/themes/bootstrap-xadmin.css', '1');

-- ----------------------------
-- Table structure for xadmin_userwidget
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_userwidget`;
CREATE TABLE `xadmin_userwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) NOT NULL,
  `widget_type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` (`user_id`) USING BTREE,
  CONSTRAINT `xadmin_userwidget_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `mx_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_userwidget
-- ----------------------------
