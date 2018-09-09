-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 
-- 服务器版本: 5.5.53
-- PHP 版本: 7.2.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `meiguili.l`
--

-- --------------------------------------------------------

--
-- 表的结构 `data_ad`
--

CREATE TABLE IF NOT EXISTS `data_ad` (
  `ad_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '广告id',
  `ad_name` varchar(255) NOT NULL COMMENT '广告名称',
  `ad_content` text COMMENT '广告内容',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  PRIMARY KEY (`ad_id`),
  KEY `ad_name` (`ad_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `data_area`
--

CREATE TABLE IF NOT EXISTS `data_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(100) NOT NULL COMMENT '地址',
  `createtime` datetime NOT NULL COMMENT '留言时间',
  `status` smallint(2) NOT NULL DEFAULT '1' COMMENT '留言状态，1：正常，0：删除',
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='留言表' AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `data_area`
--

INSERT INTO `data_area` (`id`, `address`, `createtime`, `status`, `uid`) VALUES
(1, '北京·太阳公元', '2018-05-31 10:47:02', 1, 1),
(2, '上海·外滩', '2018-05-31 10:48:13', 1, 1),
(3, '天津·爱琴海', '2018-05-31 10:48:28', 1, 1),
(4, '南京·外秦淮', '2018-05-31 10:48:37', 1, 1),
(5, '南京·1865', '2018-05-31 10:48:43', 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `data_area_phone`
--

CREATE TABLE IF NOT EXISTS `data_area_phone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(100) NOT NULL COMMENT '地址',
  `phone` varchar(255) DEFAULT NULL,
  `createtime` datetime NOT NULL COMMENT '留言时间',
  `status` smallint(2) NOT NULL DEFAULT '1' COMMENT '留言状态，1：正常，0：删除',
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='留言表' AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `data_area_phone`
--

INSERT INTO `data_area_phone` (`id`, `address`, `phone`, `createtime`, `status`, `uid`) VALUES
(1, '北京·太阳公元', '13693267266', '2018-07-17 22:15:59', 1, 1),
(2, '上海·外滩', '13693267266', '2018-07-17 22:16:24', 1, 1),
(3, '天津·爱琴海', '13693267266', '2018-07-17 22:16:33', 1, 1),
(4, '南京·外秦淮', '13693267266', '2018-07-17 22:16:46', 1, 1),
(5, '南京·1865', '13693267266', '2018-07-17 22:18:55', 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `data_asset`
--

CREATE TABLE IF NOT EXISTS `data_asset` (
  `aid` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户 id',
  `key` varchar(50) NOT NULL COMMENT '资源 key',
  `filename` varchar(50) DEFAULT NULL COMMENT '文件名',
  `filesize` int(11) DEFAULT NULL COMMENT '文件大小,单位Byte',
  `filepath` varchar(200) NOT NULL COMMENT '文件路径，相对于 upload 目录，可以为 url',
  `uploadtime` int(11) NOT NULL COMMENT '上传时间',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1：可用，0：删除，不可用',
  `meta` text COMMENT '其它详细信息，JSON格式',
  `suffix` varchar(50) DEFAULT NULL COMMENT '文件后缀名，不包括点',
  `download_times` int(11) NOT NULL DEFAULT '0' COMMENT '下载次数',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='资源表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `data_auth_access`
--

CREATE TABLE IF NOT EXISTS `data_auth_access` (
  `role_id` mediumint(8) unsigned NOT NULL COMMENT '角色',
  `rule_name` varchar(255) NOT NULL COMMENT '规则唯一英文标识,全小写',
  `type` varchar(30) DEFAULT NULL COMMENT '权限规则分类，请加应用前缀,如admin_',
  KEY `role_id` (`role_id`),
  KEY `rule_name` (`rule_name`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='权限授权表';

-- --------------------------------------------------------

--
-- 表的结构 `data_auth_rule`
--

CREATE TABLE IF NOT EXISTS `data_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` varchar(30) NOT NULL DEFAULT '1' COMMENT '权限规则分类，请加应用前缀,如admin_',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `param` varchar(255) DEFAULT NULL COMMENT '额外url参数',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='权限规则表' AUTO_INCREMENT=174 ;

--
-- 转存表中的数据 `data_auth_rule`
--

INSERT INTO `data_auth_rule` (`id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition`) VALUES
(1, 'Admin', 'admin_url', 'admin/content/default', NULL, '内容管理', 1, ''),
(2, 'Api', 'admin_url', 'api/guestbookadmin/index', NULL, '所有留言', 1, ''),
(3, 'Api', 'admin_url', 'api/guestbookadmin/delete', NULL, '删除网站留言', 1, ''),
(4, 'Comment', 'admin_url', 'comment/commentadmin/index', NULL, '评论管理', 1, ''),
(5, 'Comment', 'admin_url', 'comment/commentadmin/delete', NULL, '删除评论', 1, ''),
(6, 'Comment', 'admin_url', 'comment/commentadmin/check', NULL, '评论审核', 1, ''),
(7, 'Portal', 'admin_url', 'portal/adminpost/index', NULL, '文章管理', 1, ''),
(8, 'Portal', 'admin_url', 'portal/adminpost/listorders', NULL, '文章排序', 1, ''),
(9, 'Portal', 'admin_url', 'portal/adminpost/top', NULL, '文章置顶', 1, ''),
(10, 'Portal', 'admin_url', 'portal/adminpost/recommend', NULL, '文章推荐', 1, ''),
(11, 'Portal', 'admin_url', 'portal/adminpost/move', NULL, '批量移动', 1, ''),
(12, 'Portal', 'admin_url', 'portal/adminpost/check', NULL, '文章审核', 1, ''),
(13, 'Portal', 'admin_url', 'portal/adminpost/delete', NULL, '删除文章', 1, ''),
(14, 'Portal', 'admin_url', 'portal/adminpost/edit', NULL, '编辑文章', 1, ''),
(15, 'Portal', 'admin_url', 'portal/adminpost/edit_post', NULL, '提交编辑', 1, ''),
(16, 'Portal', 'admin_url', 'portal/adminpost/add', NULL, '添加文章', 1, ''),
(17, 'Portal', 'admin_url', 'portal/adminpost/add_post', NULL, '提交添加', 1, ''),
(18, 'Portal', 'admin_url', 'portal/adminterm/index', NULL, '分类管理', 1, ''),
(19, 'Portal', 'admin_url', 'portal/adminterm/listorders', NULL, '文章分类排序', 1, ''),
(20, 'Portal', 'admin_url', 'portal/adminterm/delete', NULL, '删除分类', 1, ''),
(21, 'Portal', 'admin_url', 'portal/adminterm/edit', NULL, '编辑分类', 1, ''),
(22, 'Portal', 'admin_url', 'portal/adminterm/edit_post', NULL, '提交编辑', 1, ''),
(23, 'Portal', 'admin_url', 'portal/adminterm/add', NULL, '添加分类', 1, ''),
(24, 'Portal', 'admin_url', 'portal/adminterm/add_post', NULL, '提交添加', 1, ''),
(25, 'Portal', 'admin_url', 'portal/adminpage/index', NULL, '页面管理', 1, ''),
(26, 'Portal', 'admin_url', 'portal/adminpage/listorders', NULL, '页面排序', 1, ''),
(27, 'Portal', 'admin_url', 'portal/adminpage/delete', NULL, '删除页面', 1, ''),
(28, 'Portal', 'admin_url', 'portal/adminpage/edit', NULL, '编辑页面', 1, ''),
(29, 'Portal', 'admin_url', 'portal/adminpage/edit_post', NULL, '提交编辑', 1, ''),
(30, 'Portal', 'admin_url', 'portal/adminpage/add', NULL, '添加页面', 1, ''),
(31, 'Portal', 'admin_url', 'portal/adminpage/add_post', NULL, '提交添加', 1, ''),
(32, 'Admin', 'admin_url', 'admin/recycle/default', NULL, '回收站', 1, ''),
(33, 'Portal', 'admin_url', 'portal/adminpost/recyclebin', NULL, '文章回收', 1, ''),
(34, 'Portal', 'admin_url', 'portal/adminpost/restore', NULL, '文章还原', 1, ''),
(35, 'Portal', 'admin_url', 'portal/adminpost/clean', NULL, '彻底删除', 1, ''),
(36, 'Portal', 'admin_url', 'portal/adminpage/recyclebin', NULL, '页面回收', 1, ''),
(37, 'Portal', 'admin_url', 'portal/adminpage/clean', NULL, '彻底删除', 1, ''),
(38, 'Portal', 'admin_url', 'portal/adminpage/restore', NULL, '页面还原', 1, ''),
(39, 'Admin', 'admin_url', 'admin/extension/default', NULL, '扩展工具', 1, ''),
(40, 'Admin', 'admin_url', 'admin/backup/default', NULL, '备份管理', 1, ''),
(41, 'Admin', 'admin_url', 'admin/backup/restore', NULL, '数据还原', 1, ''),
(42, 'Admin', 'admin_url', 'admin/backup/index', NULL, '数据备份', 1, ''),
(43, 'Admin', 'admin_url', 'admin/backup/index_post', NULL, '提交数据备份', 1, ''),
(44, 'Admin', 'admin_url', 'admin/backup/download', NULL, '下载备份', 1, ''),
(45, 'Admin', 'admin_url', 'admin/backup/del_backup', NULL, '删除备份', 1, ''),
(46, 'Admin', 'admin_url', 'admin/backup/import', NULL, '数据备份导入', 1, ''),
(47, 'Admin', 'admin_url', 'admin/plugin/index', NULL, '插件管理', 1, ''),
(48, 'Admin', 'admin_url', 'admin/plugin/toggle', NULL, '插件启用切换', 1, ''),
(49, 'Admin', 'admin_url', 'admin/plugin/setting', NULL, '插件设置', 1, ''),
(50, 'Admin', 'admin_url', 'admin/plugin/setting_post', NULL, '插件设置提交', 1, ''),
(51, 'Admin', 'admin_url', 'admin/plugin/install', NULL, '插件安装', 1, ''),
(52, 'Admin', 'admin_url', 'admin/plugin/uninstall', NULL, '插件卸载', 1, ''),
(53, 'Admin', 'admin_url', 'admin/slide/default', NULL, '幻灯片', 1, ''),
(54, 'Admin', 'admin_url', 'admin/slide/index', NULL, '幻灯片管理', 1, ''),
(55, 'Admin', 'admin_url', 'admin/slide/listorders', NULL, '幻灯片排序', 1, ''),
(56, 'Admin', 'admin_url', 'admin/slide/toggle', NULL, '幻灯片显示切换', 1, ''),
(57, 'Admin', 'admin_url', 'admin/slide/delete', NULL, '删除幻灯片', 1, ''),
(58, 'Admin', 'admin_url', 'admin/slide/edit', NULL, '编辑幻灯片', 1, ''),
(59, 'Admin', 'admin_url', 'admin/slide/edit_post', NULL, '提交编辑', 1, ''),
(60, 'Admin', 'admin_url', 'admin/slide/add', NULL, '添加幻灯片', 1, ''),
(61, 'Admin', 'admin_url', 'admin/slide/add_post', NULL, '提交添加', 1, ''),
(62, 'Admin', 'admin_url', 'admin/slidecat/index', NULL, '幻灯片分类', 1, ''),
(63, 'Admin', 'admin_url', 'admin/slidecat/delete', NULL, '删除分类', 1, ''),
(64, 'Admin', 'admin_url', 'admin/slidecat/edit', NULL, '编辑分类', 1, ''),
(65, 'Admin', 'admin_url', 'admin/slidecat/edit_post', NULL, '提交编辑', 1, ''),
(66, 'Admin', 'admin_url', 'admin/slidecat/add', NULL, '添加分类', 1, ''),
(67, 'Admin', 'admin_url', 'admin/slidecat/add_post', NULL, '提交添加', 1, ''),
(68, 'Admin', 'admin_url', 'admin/ad/index', NULL, '网站广告', 1, ''),
(69, 'Admin', 'admin_url', 'admin/ad/toggle', NULL, '广告显示切换', 1, ''),
(70, 'Admin', 'admin_url', 'admin/ad/delete', NULL, '删除广告', 1, ''),
(71, 'Admin', 'admin_url', 'admin/ad/edit', NULL, '编辑广告', 1, ''),
(72, 'Admin', 'admin_url', 'admin/ad/edit_post', NULL, '提交编辑', 1, ''),
(73, 'Admin', 'admin_url', 'admin/ad/add', NULL, '添加广告', 1, ''),
(74, 'Admin', 'admin_url', 'admin/ad/add_post', NULL, '提交添加', 1, ''),
(75, 'Admin', 'admin_url', 'admin/link/index', NULL, '友情链接', 1, ''),
(76, 'Admin', 'admin_url', 'admin/link/listorders', NULL, '友情链接排序', 1, ''),
(77, 'Admin', 'admin_url', 'admin/link/toggle', NULL, '友链显示切换', 1, ''),
(78, 'Admin', 'admin_url', 'admin/link/delete', NULL, '删除友情链接', 1, ''),
(79, 'Admin', 'admin_url', 'admin/link/edit', NULL, '编辑友情链接', 1, ''),
(80, 'Admin', 'admin_url', 'admin/link/edit_post', NULL, '提交编辑', 1, ''),
(81, 'Admin', 'admin_url', 'admin/link/add', NULL, '添加友情链接', 1, ''),
(82, 'Admin', 'admin_url', 'admin/link/add_post', NULL, '提交添加', 1, ''),
(83, 'Api', 'admin_url', 'api/oauthadmin/setting', NULL, '第三方登陆', 1, ''),
(84, 'Api', 'admin_url', 'api/oauthadmin/setting_post', NULL, '提交设置', 1, ''),
(85, 'Admin', 'admin_url', 'admin/menu/default', NULL, '菜单管理', 1, ''),
(86, 'Admin', 'admin_url', 'admin/navcat/default1', NULL, '前台菜单', 1, ''),
(87, 'Admin', 'admin_url', 'admin/nav/index', NULL, '菜单管理', 1, ''),
(88, 'Admin', 'admin_url', 'admin/nav/listorders', NULL, '前台导航排序', 1, ''),
(89, 'Admin', 'admin_url', 'admin/nav/delete', NULL, '删除菜单', 1, ''),
(90, 'Admin', 'admin_url', 'admin/nav/edit', NULL, '编辑菜单', 1, ''),
(91, 'Admin', 'admin_url', 'admin/nav/edit_post', NULL, '提交编辑', 1, ''),
(92, 'Admin', 'admin_url', 'admin/nav/add', NULL, '添加菜单', 1, ''),
(93, 'Admin', 'admin_url', 'admin/nav/add_post', NULL, '提交添加', 1, ''),
(94, 'Admin', 'admin_url', 'admin/navcat/index', NULL, '菜单分类', 1, ''),
(95, 'Admin', 'admin_url', 'admin/navcat/delete', NULL, '删除分类', 1, ''),
(96, 'Admin', 'admin_url', 'admin/navcat/edit', NULL, '编辑分类', 1, ''),
(97, 'Admin', 'admin_url', 'admin/navcat/edit_post', NULL, '提交编辑', 1, ''),
(98, 'Admin', 'admin_url', 'admin/navcat/add', NULL, '添加分类', 1, ''),
(99, 'Admin', 'admin_url', 'admin/navcat/add_post', NULL, '提交添加', 1, ''),
(100, 'Admin', 'admin_url', 'admin/menu/index', NULL, '后台菜单', 1, ''),
(101, 'Admin', 'admin_url', 'admin/menu/add', NULL, '添加菜单', 1, ''),
(102, 'Admin', 'admin_url', 'admin/menu/add_post', NULL, '提交添加', 1, ''),
(103, 'Admin', 'admin_url', 'admin/menu/listorders', NULL, '后台菜单排序', 1, ''),
(104, 'Admin', 'admin_url', 'admin/menu/export_menu', NULL, '菜单备份', 1, ''),
(105, 'Admin', 'admin_url', 'admin/menu/edit', NULL, '编辑菜单', 1, ''),
(106, 'Admin', 'admin_url', 'admin/menu/edit_post', NULL, '提交编辑', 1, ''),
(107, 'Admin', 'admin_url', 'admin/menu/delete', NULL, '删除菜单', 1, ''),
(108, 'Admin', 'admin_url', 'admin/menu/lists', NULL, '所有菜单', 1, ''),
(109, 'Admin', 'admin_url', 'admin/setting/default', NULL, '设置', 1, ''),
(110, 'Admin', 'admin_url', 'admin/setting/userdefault', NULL, '个人信息', 1, ''),
(111, 'Admin', 'admin_url', 'admin/user/userinfo', NULL, '修改信息', 1, ''),
(112, 'Admin', 'admin_url', 'admin/user/userinfo_post', NULL, '修改信息提交', 1, ''),
(113, 'Admin', 'admin_url', 'admin/setting/password', NULL, '修改密码', 1, ''),
(114, 'Admin', 'admin_url', 'admin/setting/password_post', NULL, '提交修改', 1, ''),
(115, 'Admin', 'admin_url', 'admin/setting/site', NULL, '网站信息', 1, ''),
(116, 'Admin', 'admin_url', 'admin/setting/site_post', NULL, '提交修改', 1, ''),
(117, 'Admin', 'admin_url', 'admin/route/index', NULL, '路由列表', 1, ''),
(118, 'Admin', 'admin_url', 'admin/route/add', NULL, '路由添加', 1, ''),
(119, 'Admin', 'admin_url', 'admin/route/add_post', NULL, '路由添加提交', 1, ''),
(120, 'Admin', 'admin_url', 'admin/route/edit', NULL, '路由编辑', 1, ''),
(121, 'Admin', 'admin_url', 'admin/route/edit_post', NULL, '路由编辑提交', 1, ''),
(122, 'Admin', 'admin_url', 'admin/route/delete', NULL, '路由删除', 1, ''),
(123, 'Admin', 'admin_url', 'admin/route/ban', NULL, '路由禁止', 1, ''),
(124, 'Admin', 'admin_url', 'admin/route/open', NULL, '路由启用', 1, ''),
(125, 'Admin', 'admin_url', 'admin/route/listorders', NULL, '路由排序', 1, ''),
(126, 'Admin', 'admin_url', 'admin/mailer/default', NULL, '邮箱配置', 1, ''),
(127, 'Admin', 'admin_url', 'admin/mailer/index', NULL, 'SMTP配置', 1, ''),
(128, 'Admin', 'admin_url', 'admin/mailer/index_post', NULL, '提交配置', 1, ''),
(129, 'Admin', 'admin_url', 'admin/mailer/active', NULL, '邮件模板', 1, ''),
(130, 'Admin', 'admin_url', 'admin/mailer/active_post', NULL, '提交模板', 1, ''),
(131, 'Admin', 'admin_url', 'admin/setting/clearcache', NULL, '清除缓存', 1, ''),
(132, 'User', 'admin_url', 'user/indexadmin/default', NULL, '用户管理', 1, ''),
(133, 'User', 'admin_url', 'user/indexadmin/default1', NULL, '用户组', 1, ''),
(134, 'User', 'admin_url', 'user/indexadmin/index', NULL, '本站用户', 1, ''),
(135, 'User', 'admin_url', 'user/indexadmin/ban', NULL, '拉黑会员', 1, ''),
(136, 'User', 'admin_url', 'user/indexadmin/cancelban', NULL, '启用会员', 1, ''),
(137, 'User', 'admin_url', 'user/oauthadmin/index', NULL, '第三方用户', 1, ''),
(138, 'User', 'admin_url', 'user/oauthadmin/delete', NULL, '第三方用户解绑', 1, ''),
(139, 'User', 'admin_url', 'user/indexadmin/default3', NULL, '管理组', 1, ''),
(140, 'Admin', 'admin_url', 'admin/rbac/index', NULL, '角色管理', 1, ''),
(141, 'Admin', 'admin_url', 'admin/rbac/member', NULL, '成员管理', 1, ''),
(142, 'Admin', 'admin_url', 'admin/rbac/authorize', NULL, '权限设置', 1, ''),
(143, 'Admin', 'admin_url', 'admin/rbac/authorize_post', NULL, '提交设置', 1, ''),
(144, 'Admin', 'admin_url', 'admin/rbac/roleedit', NULL, '编辑角色', 1, ''),
(145, 'Admin', 'admin_url', 'admin/rbac/roleedit_post', NULL, '提交编辑', 1, ''),
(146, 'Admin', 'admin_url', 'admin/rbac/roledelete', NULL, '删除角色', 1, ''),
(147, 'Admin', 'admin_url', 'admin/rbac/roleadd', NULL, '添加角色', 1, ''),
(148, 'Admin', 'admin_url', 'admin/rbac/roleadd_post', NULL, '提交添加', 1, ''),
(149, 'Admin', 'admin_url', 'admin/user/index', NULL, '管理员', 1, ''),
(150, 'Admin', 'admin_url', 'admin/user/delete', NULL, '删除管理员', 1, ''),
(151, 'Admin', 'admin_url', 'admin/user/edit', NULL, '管理员编辑', 1, ''),
(152, 'Admin', 'admin_url', 'admin/user/edit_post', NULL, '编辑提交', 1, ''),
(153, 'Admin', 'admin_url', 'admin/user/add', NULL, '管理员添加', 1, ''),
(154, 'Admin', 'admin_url', 'admin/user/add_post', NULL, '添加提交', 1, ''),
(155, 'Admin', 'admin_url', 'admin/plugin/update', NULL, '插件更新', 1, ''),
(156, 'Admin', 'admin_url', 'admin/storage/index', NULL, '文件存储', 1, ''),
(157, 'Admin', 'admin_url', 'admin/storage/setting_post', NULL, '文件存储设置提交', 1, ''),
(158, 'Admin', 'admin_url', 'admin/slide/ban', NULL, '禁用幻灯片', 1, ''),
(159, 'Admin', 'admin_url', 'admin/slide/cancelban', NULL, '启用幻灯片', 1, ''),
(160, 'Admin', 'admin_url', 'admin/user/ban', NULL, '禁用管理员', 1, ''),
(161, 'Admin', 'admin_url', 'admin/user/cancelban', NULL, '启用管理员', 1, ''),
(162, 'Indexcomment', 'admin_url', 'indexcomment/indexcommentadmin/index', NULL, '首页评论', 1, ''),
(163, 'Indexyuyue', 'admin_url', 'indexyuyue/indexyuyueadmin/index', NULL, '北京·太阳公元', 1, ''),
(164, 'Admin', 'admin_url', 'admin/setting/setaddress', NULL, '地址管理', 1, ''),
(165, 'Indexyuyue', 'admin_url', 'indexyuyue/indexyuyueadmin/default', NULL, '所有预约', 1, ''),
(166, 'Indexyuyue', 'admin_url', 'indexyuyue/indexyuyueadmin/index2', NULL, '上海·外滩', 1, ''),
(167, 'Portal', 'admin_url', 'portal/adminpost/default', NULL, '文章管理', 1, ''),
(168, 'Portal', 'admin_url', 'portal/adminpost/index1111', NULL, 'shangh', 1, ''),
(169, 'Indexyuyue', 'admin_url', 'indexyuyue/indexyuyueadmin/indexqqqq', NULL, 'qqq', 1, ''),
(170, 'Indexyuyue', 'admin_url', 'indexyuyue/indexyuyueadmin/1111', NULL, '111', 1, ''),
(171, '1', 'admin_url', '1/indexyuyueadmin/1', NULL, '111', 1, ''),
(172, 'Admin', 'admin_url', 'admin/setting/setphone', NULL, '地区联系人', 1, ''),
(173, 'Admin', 'admin_url', 'admin/setting/phonelist', NULL, '地区联系人', 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `data_comment`
--

CREATE TABLE IF NOT EXISTS `data_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '留言者姓名',
  `msg` text NOT NULL COMMENT '评论内容',
  `createtime` datetime NOT NULL COMMENT '留言时间',
  `status` smallint(2) NOT NULL DEFAULT '0' COMMENT '留言状态，1：正常，0：删除',
  `post_like` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='留言表' AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `data_comment`
--

INSERT INTO `data_comment` (`id`, `uid`, `msg`, `createtime`, `status`, `post_like`) VALUES
(1, 2, '1111', '2018-05-14 22:16:15', 1, 1),
(2, 5, '测试', '2018-08-31 16:54:59', 1, 1),
(3, 7, '好漂亮', '2018-09-04 11:20:33', 0, 0),
(4, 8, '测试', '2018-09-05 14:40:06', 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `data_comments`
--

CREATE TABLE IF NOT EXISTS `data_comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_table` varchar(100) NOT NULL COMMENT '评论内容所在表，不带表前缀',
  `post_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '评论内容 id',
  `url` varchar(255) DEFAULT NULL COMMENT '原文地址',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '发表评论的用户id',
  `to_uid` int(11) NOT NULL DEFAULT '0' COMMENT '被评论的用户id',
  `full_name` varchar(50) DEFAULT NULL COMMENT '评论者昵称',
  `email` varchar(255) DEFAULT NULL COMMENT '评论者邮箱',
  `createtime` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '评论时间',
  `content` text NOT NULL COMMENT '评论内容',
  `type` smallint(1) NOT NULL DEFAULT '1' COMMENT '评论类型；1实名评论',
  `parentid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '被回复的评论id',
  `path` varchar(500) DEFAULT NULL,
  `status` smallint(1) NOT NULL DEFAULT '1' COMMENT '状态，1已审核，0未审核',
  PRIMARY KEY (`id`),
  KEY `comment_post_ID` (`post_id`),
  KEY `comment_approved_date_gmt` (`status`),
  KEY `comment_parent` (`parentid`),
  KEY `table_id_status` (`post_table`,`post_id`,`status`),
  KEY `createtime` (`createtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='评论表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `data_common_action_log`
--

CREATE TABLE IF NOT EXISTS `data_common_action_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` bigint(20) DEFAULT '0' COMMENT '用户id',
  `object` varchar(100) DEFAULT NULL COMMENT '访问对象的id,格式：不带前缀的表名+id;如posts1表示xx_posts表里id为1的记录',
  `action` varchar(50) DEFAULT NULL COMMENT '操作名称；格式规定为：应用名+控制器+操作名；也可自己定义格式只要不发生冲突且惟一；',
  `count` int(11) DEFAULT '0' COMMENT '访问次数',
  `last_time` int(11) DEFAULT '0' COMMENT '最后访问的时间戳',
  `ip` varchar(15) DEFAULT NULL COMMENT '访问者最后访问ip',
  PRIMARY KEY (`id`),
  KEY `user_object_action` (`user`,`object`,`action`),
  KEY `user_object_action_ip` (`user`,`object`,`action`,`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='访问记录表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `data_guestbook`
--

CREATE TABLE IF NOT EXISTS `data_guestbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(50) NOT NULL COMMENT '留言者姓名',
  `email` varchar(100) NOT NULL COMMENT '留言者邮箱',
  `title` varchar(255) DEFAULT NULL COMMENT '留言标题',
  `msg` text NOT NULL COMMENT '留言内容',
  `createtime` datetime NOT NULL COMMENT '留言时间',
  `status` smallint(2) NOT NULL DEFAULT '1' COMMENT '留言状态，1：正常，0：删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='留言表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `data_indextable`
--

CREATE TABLE IF NOT EXISTS `data_indextable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(50) NOT NULL COMMENT '姓名',
  `address` varchar(100) NOT NULL COMMENT '地址',
  `number` varchar(255) DEFAULT NULL COMMENT '桌数',
  `tel` text NOT NULL COMMENT '手机号码',
  `datetime` datetime DEFAULT NULL,
  `from` varchar(255) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `createtime` datetime NOT NULL COMMENT '留言时间',
  `status` smallint(2) NOT NULL DEFAULT '1' COMMENT '留言状态，1：正常，0：删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='留言表' AUTO_INCREMENT=39 ;

--
-- 转存表中的数据 `data_indextable`
--

INSERT INTO `data_indextable` (`id`, `full_name`, `address`, `number`, `tel`, `datetime`, `from`, `uid`, `createtime`, `status`) VALUES
(1, '', '天津·爱琴海', '10桌以内', '', NULL, 'yuyue', NULL, '2018-05-14 19:52:10', 1),
(2, 'test', '北京·太阳公元', '10桌以内', '', NULL, 'yuyue', NULL, '2018-05-14 19:54:20', 1),
(3, '111', '北京·太阳公元', '10桌以内', '', NULL, 'yuyue', NULL, '2018-05-14 19:55:17', 1),
(4, '2', '天津·爱琴海', '20桌以上', '22323', NULL, 'yuyue', NULL, '2018-05-14 19:55:26', 1),
(5, '', '天津·爱琴海', NULL, '1234444', NULL, 'address', NULL, '2018-05-14 19:58:26', 1),
(6, '', '北京·太阳公元', NULL, '1111', '2018-01-09 12:12:12', 'date', NULL, '2018-05-14 20:36:26', 1),
(7, '', '天津·爱琴海', NULL, '2334肉额', '2018-01-09 12:12:12', 'date', NULL, '2018-05-14 20:37:17', 1),
(8, '1111', '北京·太阳公元', '10桌以内', '1111', NULL, 'yuyue', 2, '2018-05-16 10:18:22', 1),
(9, '1111', '北京·太阳公元', '10桌以内', '1111', NULL, 'yuyue', 2, '2018-05-16 10:18:24', 1),
(10, '测试来源于', '北京·太阳公元', '10桌以内', '15200000000', NULL, '婚礼yuyue', 2, '2018-05-30 15:17:04', 1),
(11, '111', '北京·太阳公元', '10桌以内', '111', NULL, '婚礼预约', NULL, '2018-06-04 13:23:02', 1),
(12, '', '北京·太阳公元', NULL, '123', NULL, '婚礼地址', NULL, '2018-06-04 17:41:06', 1),
(13, '', '北京·太阳公元', NULL, '123', NULL, '婚礼地址', NULL, '2018-06-04 17:41:08', 1),
(14, '11', '北京·太阳公元', '10桌以内', '11111', NULL, '婚礼预约', NULL, '2018-06-06 21:09:13', 1),
(15, '张三', '北京·太阳公元', '10桌以内', '15200000000', NULL, 'yuyue', 4, '2018-07-18 18:38:32', 1),
(16, '张三1', '北京·太阳公元', '10桌以内', '15200000001', NULL, 'yuyue', 4, '2018-07-18 18:39:40', 1),
(17, '张三111', '北京·太阳公元', '10桌以内', '18000000000', NULL, 'yuyue', 4, '2018-07-18 18:40:48', 1),
(18, '扎实', '北京·太阳公元', '10桌以内', '15200010101', NULL, 'yuyue', 4, '2018-07-18 18:41:33', 1),
(19, '扎实', '北京·太阳公元', '10桌以内', '15200010101', NULL, 'yuyue', 4, '2018-07-18 18:59:54', 1),
(20, '扎实', '北京·太阳公元', '10桌以内', '15200010101', NULL, 'yuyue', 4, '2018-07-18 19:31:31', 1),
(21, '渣渣', '北京·太阳公元', '10桌以内', '15240246789', NULL, 'yuyue', 4, '2018-07-18 19:34:24', 1),
(22, '渣渣', '北京·太阳公元', '10桌以内', '15240246789', NULL, 'yuyue', 4, '2018-07-18 19:36:06', 1),
(23, '王在', '北京·太阳公元', '10桌以内', '15240246788', NULL, 'yuyue', 4, '2018-07-18 19:36:55', 1),
(24, '王在', '北京·太阳公元', '10桌以内', '15240246788', NULL, 'yuyue', 4, '2018-07-18 19:37:19', 1),
(25, '你', '上海·外滩', '10-18桌', '我', NULL, '婚礼预约', NULL, '2018-08-19 12:07:05', 1),
(26, '你', '上海·外滩', '10-18桌', '我', NULL, '婚礼预约', NULL, '2018-08-19 12:07:07', 1),
(27, '李', '北京·太阳公元', '10桌以内', '15611078036', NULL, '商务预约', NULL, '2018-08-21 14:31:14', 1),
(28, '', '北京·太阳公元', NULL, '13693267266', '2019-09-18 00:00:00', '婚礼日期', NULL, '2018-08-29 13:43:10', 1),
(29, '', '北京·太阳公元', NULL, '13693267266', '2019-09-18 00:00:00', '婚礼日期', NULL, '2018-08-29 13:43:11', 1),
(30, '', '北京·太阳公元', NULL, '13693267266', '2019-09-18 00:00:00', '婚礼日期', NULL, '2018-08-29 13:43:12', 1),
(31, '', '北京·太阳公元', NULL, '13693267266', '2019-09-18 00:00:00', '婚礼日期', NULL, '2018-08-29 13:43:13', 1),
(32, '', '北京·太阳公元', NULL, '13693267266', '2019-09-18 00:00:00', '婚礼日期', NULL, '2018-08-29 13:43:14', 1),
(33, '', '北京·太阳公元', NULL, '13693267266', '2019-09-18 00:00:00', '婚礼日期', NULL, '2018-08-29 13:43:15', 1),
(34, '', '北京·太阳公元', NULL, '13693267266', '2019-09-18 00:00:00', '婚礼日期', NULL, '2018-08-29 13:43:16', 1),
(35, '', '北京·太阳公元', NULL, '13693267266', '2019-09-18 00:00:00', '婚礼日期', NULL, '2018-08-29 13:43:17', 1),
(36, '', '北京·太阳公元', NULL, '13693267266', '2019-09-18 00:00:00', '婚礼日期', NULL, '2018-08-29 13:43:18', 1),
(37, '张晗', '北京·太阳公元', '10桌以内', '13522378267', NULL, '婚礼预约', NULL, '2018-09-03 21:26:52', 1),
(38, '', '北京·太阳公元', NULL, '13810566129', '2019-05-18 00:00:00', '婚礼日期', NULL, '2018-09-06 09:59:26', 1);

-- --------------------------------------------------------

--
-- 表的结构 `data_links`
--

CREATE TABLE IF NOT EXISTS `data_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL COMMENT '友情链接地址',
  `link_name` varchar(255) NOT NULL COMMENT '友情链接名称',
  `link_image` varchar(255) DEFAULT NULL COMMENT '友情链接图标',
  `link_target` varchar(25) NOT NULL DEFAULT '_blank' COMMENT '友情链接打开方式',
  `link_description` text NOT NULL COMMENT '友情链接描述',
  `link_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `link_rating` int(11) NOT NULL DEFAULT '0' COMMENT '友情链接评级',
  `link_rel` varchar(255) DEFAULT NULL COMMENT '链接与网站的关系',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='友情链接表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `data_links`
--

INSERT INTO `data_links` (`link_id`, `link_url`, `link_name`, `link_image`, `link_target`, `link_description`, `link_status`, `link_rating`, `link_rel`, `listorder`) VALUES
(1, 'http://www.thinkcmf.com', 'ThinkCMF', '', '_blank', '', 1, 0, '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `data_menu`
--

CREATE TABLE IF NOT EXISTS `data_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `app` char(20) NOT NULL COMMENT '应用名称app',
  `model` char(20) NOT NULL COMMENT '控制器',
  `action` char(20) NOT NULL COMMENT '操作名称',
  `data` char(50) NOT NULL COMMENT '额外参数',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '菜单类型  1：权限认证+菜单；0：只作为菜单',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态，1显示，0不显示',
  `name` varchar(50) NOT NULL COMMENT '菜单名称',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '排序ID',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `parentid` (`parentid`),
  KEY `model` (`model`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='后台菜单表' AUTO_INCREMENT=176 ;

--
-- 转存表中的数据 `data_menu`
--

INSERT INTO `data_menu` (`id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder`) VALUES
(1, 0, 'Admin', 'Content', 'default', '', 0, 1, '内容管理', 'th', '', 30),
(2, 1, 'Api', 'Guestbookadmin', 'index', '', 1, 0, '所有留言', '', '', 0),
(3, 2, 'Api', 'Guestbookadmin', 'delete', '', 1, 0, '删除网站留言', '', '', 0),
(4, 1, 'Comment', 'Commentadmin', 'index', '', 1, 0, '评论管理', '', '', 0),
(5, 4, 'Comment', 'Commentadmin', 'delete', '', 1, 0, '删除评论', '', '', 0),
(6, 4, 'Comment', 'Commentadmin', 'check', '', 1, 0, '评论审核', '', '', 0),
(7, 1, 'Portal', 'AdminPost', 'default', '', 1, 1, '文章管理', '', '', 1),
(8, 7, 'Portal', 'AdminPost', 'listorders', '', 1, 0, '文章排序', '', '', 0),
(9, 7, 'Portal', 'AdminPost', 'top', '', 1, 0, '文章置顶', '', '', 0),
(10, 7, 'Portal', 'AdminPost', 'recommend', '', 1, 0, '文章推荐', '', '', 0),
(11, 7, 'Portal', 'AdminPost', 'move', '', 1, 0, '批量移动', '', '', 1000),
(12, 7, 'Portal', 'AdminPost', 'check', '', 1, 0, '文章审核', '', '', 1000),
(13, 7, 'Portal', 'AdminPost', 'delete', '', 1, 0, '删除文章', '', '', 1000),
(14, 7, 'Portal', 'AdminPost', 'edit', '', 1, 0, '编辑文章', '', '', 1000),
(15, 14, 'Portal', 'AdminPost', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(16, 7, 'Portal', 'AdminPost', 'add', '', 1, 1, '添加文章', '', '', 1000),
(17, 16, 'Portal', 'AdminPost', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(18, 1, 'Portal', 'AdminTerm', 'index', '', 0, 1, '分类管理', '', '', 2),
(19, 18, 'Portal', 'AdminTerm', 'listorders', '', 1, 0, '文章分类排序', '', '', 0),
(20, 18, 'Portal', 'AdminTerm', 'delete', '', 1, 0, '删除分类', '', '', 1000),
(21, 18, 'Portal', 'AdminTerm', 'edit', '', 1, 0, '编辑分类', '', '', 1000),
(22, 21, 'Portal', 'AdminTerm', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(23, 18, 'Portal', 'AdminTerm', 'add', '', 1, 0, '添加分类', '', '', 1000),
(24, 23, 'Portal', 'AdminTerm', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(25, 1, 'Portal', 'AdminPage', 'index', '', 1, 1, '页面管理', '', '', 3),
(26, 25, 'Portal', 'AdminPage', 'listorders', '', 1, 0, '页面排序', '', '', 0),
(27, 25, 'Portal', 'AdminPage', 'delete', '', 1, 0, '删除页面', '', '', 1000),
(28, 25, 'Portal', 'AdminPage', 'edit', '', 1, 0, '编辑页面', '', '', 1000),
(29, 28, 'Portal', 'AdminPage', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(30, 25, 'Portal', 'AdminPage', 'add', '', 1, 0, '添加页面', '', '', 1000),
(31, 30, 'Portal', 'AdminPage', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(32, 1, 'Admin', 'Recycle', 'default', '', 1, 1, '回收站', '', '', 4),
(33, 32, 'Portal', 'AdminPost', 'recyclebin', '', 1, 1, '文章回收', '', '', 0),
(34, 33, 'Portal', 'AdminPost', 'restore', '', 1, 0, '文章还原', '', '', 1000),
(35, 33, 'Portal', 'AdminPost', 'clean', '', 1, 0, '彻底删除', '', '', 1000),
(36, 32, 'Portal', 'AdminPage', 'recyclebin', '', 1, 1, '页面回收', '', '', 1),
(37, 36, 'Portal', 'AdminPage', 'clean', '', 1, 0, '彻底删除', '', '', 1000),
(38, 36, 'Portal', 'AdminPage', 'restore', '', 1, 0, '页面还原', '', '', 1000),
(39, 0, 'Admin', 'Extension', 'default', '', 0, 1, '扩展工具', 'cloud', '', 40),
(40, 39, 'Admin', 'Backup', 'default', '', 1, 0, '备份管理', '', '', 0),
(41, 40, 'Admin', 'Backup', 'restore', '', 1, 1, '数据还原', '', '', 0),
(42, 40, 'Admin', 'Backup', 'index', '', 1, 1, '数据备份', '', '', 0),
(43, 42, 'Admin', 'Backup', 'index_post', '', 1, 0, '提交数据备份', '', '', 0),
(44, 40, 'Admin', 'Backup', 'download', '', 1, 0, '下载备份', '', '', 1000),
(45, 40, 'Admin', 'Backup', 'del_backup', '', 1, 0, '删除备份', '', '', 1000),
(46, 40, 'Admin', 'Backup', 'import', '', 1, 0, '数据备份导入', '', '', 1000),
(47, 39, 'Admin', 'Plugin', 'index', '', 1, 0, '插件管理', '', '', 0),
(48, 47, 'Admin', 'Plugin', 'toggle', '', 1, 0, '插件启用切换', '', '', 0),
(49, 47, 'Admin', 'Plugin', 'setting', '', 1, 0, '插件设置', '', '', 0),
(50, 49, 'Admin', 'Plugin', 'setting_post', '', 1, 0, '插件设置提交', '', '', 0),
(51, 47, 'Admin', 'Plugin', 'install', '', 1, 0, '插件安装', '', '', 0),
(52, 47, 'Admin', 'Plugin', 'uninstall', '', 1, 0, '插件卸载', '', '', 0),
(53, 39, 'Admin', 'Slide', 'default', '', 1, 1, '幻灯片', '', '', 1),
(54, 53, 'Admin', 'Slide', 'index', '', 1, 1, '幻灯片管理', '', '', 0),
(55, 54, 'Admin', 'Slide', 'listorders', '', 1, 0, '幻灯片排序', '', '', 0),
(56, 54, 'Admin', 'Slide', 'toggle', '', 1, 0, '幻灯片显示切换', '', '', 0),
(57, 54, 'Admin', 'Slide', 'delete', '', 1, 0, '删除幻灯片', '', '', 1000),
(58, 54, 'Admin', 'Slide', 'edit', '', 1, 0, '编辑幻灯片', '', '', 1000),
(59, 58, 'Admin', 'Slide', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(60, 54, 'Admin', 'Slide', 'add', '', 1, 0, '添加幻灯片', '', '', 1000),
(61, 60, 'Admin', 'Slide', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(62, 53, 'Admin', 'Slidecat', 'index', '', 1, 1, '幻灯片分类', '', '', 0),
(63, 62, 'Admin', 'Slidecat', 'delete', '', 1, 0, '删除分类', '', '', 1000),
(64, 62, 'Admin', 'Slidecat', 'edit', '', 1, 0, '编辑分类', '', '', 1000),
(65, 64, 'Admin', 'Slidecat', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(66, 62, 'Admin', 'Slidecat', 'add', '', 1, 0, '添加分类', '', '', 1000),
(67, 66, 'Admin', 'Slidecat', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(68, 39, 'Admin', 'Ad', 'index', '', 1, 1, '网站广告', '', '', 2),
(69, 68, 'Admin', 'Ad', 'toggle', '', 1, 0, '广告显示切换', '', '', 0),
(70, 68, 'Admin', 'Ad', 'delete', '', 1, 0, '删除广告', '', '', 1000),
(71, 68, 'Admin', 'Ad', 'edit', '', 1, 0, '编辑广告', '', '', 1000),
(72, 71, 'Admin', 'Ad', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(73, 68, 'Admin', 'Ad', 'add', '', 1, 0, '添加广告', '', '', 1000),
(74, 73, 'Admin', 'Ad', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(75, 39, 'Admin', 'Link', 'index', '', 0, 0, '友情链接', '', '', 3),
(76, 75, 'Admin', 'Link', 'listorders', '', 1, 0, '友情链接排序', '', '', 0),
(77, 75, 'Admin', 'Link', 'toggle', '', 1, 0, '友链显示切换', '', '', 0),
(78, 75, 'Admin', 'Link', 'delete', '', 1, 0, '删除友情链接', '', '', 1000),
(79, 75, 'Admin', 'Link', 'edit', '', 1, 0, '编辑友情链接', '', '', 1000),
(80, 79, 'Admin', 'Link', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(81, 75, 'Admin', 'Link', 'add', '', 1, 0, '添加友情链接', '', '', 1000),
(82, 81, 'Admin', 'Link', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(83, 39, 'Api', 'Oauthadmin', 'setting', '', 1, 0, '第三方登陆', 'leaf', '', 4),
(84, 83, 'Api', 'Oauthadmin', 'setting_post', '', 1, 0, '提交设置', '', '', 0),
(85, 0, 'Admin', 'Menu', 'default', '', 1, 0, '菜单管理', 'list', '', 20),
(86, 85, 'Admin', 'Navcat', 'default1', '', 1, 1, '前台菜单', '', '', 0),
(87, 86, 'Admin', 'Nav', 'index', '', 1, 1, '菜单管理', '', '', 0),
(88, 87, 'Admin', 'Nav', 'listorders', '', 1, 0, '前台导航排序', '', '', 0),
(89, 87, 'Admin', 'Nav', 'delete', '', 1, 0, '删除菜单', '', '', 1000),
(90, 87, 'Admin', 'Nav', 'edit', '', 1, 0, '编辑菜单', '', '', 1000),
(91, 90, 'Admin', 'Nav', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(92, 87, 'Admin', 'Nav', 'add', '', 1, 0, '添加菜单', '', '', 1000),
(93, 92, 'Admin', 'Nav', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(94, 86, 'Admin', 'Navcat', 'index', '', 1, 1, '菜单分类', '', '', 0),
(95, 94, 'Admin', 'Navcat', 'delete', '', 1, 0, '删除分类', '', '', 1000),
(96, 94, 'Admin', 'Navcat', 'edit', '', 1, 0, '编辑分类', '', '', 1000),
(97, 96, 'Admin', 'Navcat', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(98, 94, 'Admin', 'Navcat', 'add', '', 1, 0, '添加分类', '', '', 1000),
(99, 98, 'Admin', 'Navcat', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(100, 85, 'Admin', 'Menu', 'index', '', 1, 1, '后台菜单', '', '', 0),
(101, 100, 'Admin', 'Menu', 'add', '', 1, 0, '添加菜单', '', '', 0),
(102, 101, 'Admin', 'Menu', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(103, 100, 'Admin', 'Menu', 'listorders', '', 1, 0, '后台菜单排序', '', '', 0),
(104, 100, 'Admin', 'Menu', 'export_menu', '', 1, 0, '菜单备份', '', '', 1000),
(105, 100, 'Admin', 'Menu', 'edit', '', 1, 0, '编辑菜单', '', '', 1000),
(106, 105, 'Admin', 'Menu', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(107, 100, 'Admin', 'Menu', 'delete', '', 1, 0, '删除菜单', '', '', 1000),
(108, 100, 'Admin', 'Menu', 'lists', '', 1, 0, '所有菜单', '', '', 1000),
(109, 0, 'Admin', 'Setting', 'default', '', 0, 1, '设置', 'cogs', '', 0),
(110, 109, 'Admin', 'Setting', 'userdefault', '', 0, 1, '个人信息', '', '', 0),
(111, 110, 'Admin', 'User', 'userinfo', '', 1, 1, '修改信息', '', '', 0),
(112, 111, 'Admin', 'User', 'userinfo_post', '', 1, 0, '修改信息提交', '', '', 0),
(113, 110, 'Admin', 'Setting', 'password', '', 1, 1, '修改密码', '', '', 0),
(114, 113, 'Admin', 'Setting', 'password_post', '', 1, 0, '提交修改', '', '', 0),
(115, 109, 'Admin', 'Setting', 'site', '', 1, 1, '网站信息', '', '', 0),
(116, 115, 'Admin', 'Setting', 'site_post', '', 1, 0, '提交修改', '', '', 0),
(117, 115, 'Admin', 'Route', 'index', '', 1, 0, '路由列表', '', '', 0),
(118, 115, 'Admin', 'Route', 'add', '', 1, 0, '路由添加', '', '', 0),
(119, 118, 'Admin', 'Route', 'add_post', '', 1, 0, '路由添加提交', '', '', 0),
(120, 115, 'Admin', 'Route', 'edit', '', 1, 0, '路由编辑', '', '', 0),
(121, 120, 'Admin', 'Route', 'edit_post', '', 1, 0, '路由编辑提交', '', '', 0),
(122, 115, 'Admin', 'Route', 'delete', '', 1, 0, '路由删除', '', '', 0),
(123, 115, 'Admin', 'Route', 'ban', '', 1, 0, '路由禁止', '', '', 0),
(124, 115, 'Admin', 'Route', 'open', '', 1, 0, '路由启用', '', '', 0),
(125, 115, 'Admin', 'Route', 'listorders', '', 1, 0, '路由排序', '', '', 0),
(126, 109, 'Admin', 'Mailer', 'default', '', 1, 0, '邮箱配置', '', '', 0),
(127, 126, 'Admin', 'Mailer', 'index', '', 1, 1, 'SMTP配置', '', '', 0),
(128, 127, 'Admin', 'Mailer', 'index_post', '', 1, 0, '提交配置', '', '', 0),
(129, 126, 'Admin', 'Mailer', 'active', '', 1, 1, '邮件模板', '', '', 0),
(130, 129, 'Admin', 'Mailer', 'active_post', '', 1, 0, '提交模板', '', '', 0),
(131, 109, 'Admin', 'Setting', 'clearcache', '', 1, 1, '清除缓存', '', '', 1),
(132, 0, 'User', 'Indexadmin', 'default', '', 1, 1, '用户管理', 'group', '', 10),
(133, 132, 'User', 'Indexadmin', 'default1', '', 1, 1, '用户组', '', '', 0),
(134, 133, 'User', 'Indexadmin', 'index', '', 1, 1, '本站用户', 'leaf', '', 0),
(135, 134, 'User', 'Indexadmin', 'ban', '', 1, 0, '拉黑会员', '', '', 0),
(136, 134, 'User', 'Indexadmin', 'cancelban', '', 1, 0, '启用会员', '', '', 0),
(137, 133, 'User', 'Oauthadmin', 'index', '', 1, 1, '第三方用户', 'leaf', '', 0),
(138, 137, 'User', 'Oauthadmin', 'delete', '', 1, 0, '第三方用户解绑', '', '', 0),
(139, 132, 'User', 'Indexadmin', 'default3', '', 1, 1, '管理组', '', '', 0),
(140, 139, 'Admin', 'Rbac', 'index', '', 1, 1, '角色管理', '', '', 0),
(141, 140, 'Admin', 'Rbac', 'member', '', 1, 0, '成员管理', '', '', 1000),
(142, 140, 'Admin', 'Rbac', 'authorize', '', 1, 0, '权限设置', '', '', 1000),
(143, 142, 'Admin', 'Rbac', 'authorize_post', '', 1, 0, '提交设置', '', '', 0),
(144, 140, 'Admin', 'Rbac', 'roleedit', '', 1, 0, '编辑角色', '', '', 1000),
(145, 144, 'Admin', 'Rbac', 'roleedit_post', '', 1, 0, '提交编辑', '', '', 0),
(146, 140, 'Admin', 'Rbac', 'roledelete', '', 1, 1, '删除角色', '', '', 1000),
(147, 140, 'Admin', 'Rbac', 'roleadd', '', 1, 1, '添加角色', '', '', 1000),
(148, 147, 'Admin', 'Rbac', 'roleadd_post', '', 1, 0, '提交添加', '', '', 0),
(149, 139, 'Admin', 'User', 'index', '', 1, 1, '管理员', '', '', 0),
(150, 149, 'Admin', 'User', 'delete', '', 1, 0, '删除管理员', '', '', 1000),
(151, 149, 'Admin', 'User', 'edit', '', 1, 0, '管理员编辑', '', '', 1000),
(152, 151, 'Admin', 'User', 'edit_post', '', 1, 0, '编辑提交', '', '', 0),
(153, 149, 'Admin', 'User', 'add', '', 1, 0, '管理员添加', '', '', 1000),
(154, 153, 'Admin', 'User', 'add_post', '', 1, 0, '添加提交', '', '', 0),
(155, 47, 'Admin', 'Plugin', 'update', '', 1, 0, '插件更新', '', '', 0),
(156, 39, 'Admin', 'Storage', 'index', '', 1, 0, '文件存储', '', '', 0),
(157, 156, 'Admin', 'Storage', 'setting_post', '', 1, 0, '文件存储设置提交', '', '', 0),
(158, 54, 'Admin', 'Slide', 'ban', '', 1, 0, '禁用幻灯片', '', '', 0),
(159, 54, 'Admin', 'Slide', 'cancelban', '', 1, 0, '启用幻灯片', '', '', 0),
(160, 149, 'Admin', 'User', 'ban', '', 1, 0, '禁用管理员', '', '', 0),
(161, 149, 'Admin', 'User', 'cancelban', '', 1, 0, '启用管理员', '', '', 0),
(162, 1, 'Indexcomment', 'Indexcommentadmin', 'index', '', 1, 1, '首页评论', '', '', 0),
(163, 1, 'Indexyuyue', 'Indexyuyueadmin', 'default', '', 1, 1, '所有预约', '', '', 0),
(164, 109, 'Admin', 'Setting', 'setaddress', '', 1, 1, '地址管理', '', '', 0),
(165, 163, 'Indexyuyue', 'Indexyuyueadmin', 'index', 'address=北京·太阳公元', 1, 1, '北京·太阳公元', '', '', 0),
(166, 163, 'Indexyuyue', 'Indexyuyueadmin', 'index', 'address=上海·外滩', 1, 1, '上海·外滩', '', '', 0),
(167, 163, 'Indexyuyue', 'Indexyuyueadmin', 'index', 'address=天津·爱琴海', 1, 1, '天津·爱琴海', '', '', 0),
(168, 163, 'Indexyuyue', 'Indexyuyueadmin', 'index', 'address=南京·外秦淮', 1, 1, '南京·外秦淮', '', '', 0),
(169, 163, 'Indexyuyue', 'Indexyuyueadmin', 'index', 'address=南京·1865', 1, 1, '南京·1865', '', '', 0),
(170, 7, 'Portal', 'AdminPost', 'addressindex', 'address=北京·太阳公元', 1, 1, '北京·太阳公元', '', '', 0),
(171, 7, 'Portal', 'AdminPost', 'addressindex', 'address=上海·外滩', 1, 1, '上海·外滩', '', '', 0),
(172, 7, 'Portal', 'AdminPost', 'addressindex', 'address=天津·爱琴海', 1, 1, '天津·爱琴海', '', '', 0),
(173, 7, 'Portal', 'AdminPost', 'addressindex', 'address=南京·外秦淮', 1, 1, '南京·外秦淮', '', '', 0),
(174, 7, 'Portal', 'AdminPost', 'addressindex', 'address=南京·1865', 1, 1, '南京·1865', '', '', 0),
(175, 109, 'Admin', 'Setting', 'phonelist', '', 1, 1, '地区联系人', '', '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `data_nav`
--

CREATE TABLE IF NOT EXISTS `data_nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL COMMENT '导航分类 id',
  `parentid` int(11) NOT NULL COMMENT '导航父 id',
  `label` varchar(255) NOT NULL COMMENT '导航标题',
  `target` varchar(50) DEFAULT NULL COMMENT '打开方式',
  `href` varchar(255) NOT NULL COMMENT '导航链接',
  `icon` varchar(255) NOT NULL COMMENT '导航图标',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `listorder` int(6) DEFAULT '0' COMMENT '排序',
  `path` varchar(255) NOT NULL DEFAULT '0' COMMENT '层级关系',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='前台导航表' AUTO_INCREMENT=39 ;

--
-- 转存表中的数据 `data_nav`
--

INSERT INTO `data_nav` (`id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path`) VALUES
(1, 1, 0, '首页', '', '/index.php?g=&m=index&a=main', '', 1, 0, '0-1'),
(2, 1, 0, '婚宴场馆', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:1:"1";}}', '', 1, 0, '0-2'),
(3, 1, 0, '一站式服务', '', 'a:2:{s:6:"action";s:17:"Portal/Page/index";s:5:"param";a:1:{s:2:"id";s:1:"5";}}', '', 1, 0, '0-3'),
(4, 1, 0, '婚宴报价', '', 'a:2:{s:6:"action";s:17:"Portal/Page/index";s:5:"param";a:1:{s:2:"id";s:1:"7";}}', '', 1, 0, '0-4'),
(5, 1, 0, '婚礼案例', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:1:"9";}}', '', 1, 0, '0-5'),
(6, 1, 0, '最新活动', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:1:"5";}}', '', 1, 0, '0-6'),
(7, 1, 0, '在线预约', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:1:"6";}}', '', 1, 0, '0-7'),
(8, 1, 0, '关于玫瑰里', '', 'a:2:{s:6:"action";s:17:"Portal/Page/index";s:5:"param";a:1:{s:2:"id";s:1:"1";}}', '', 1, 0, '0-8'),
(9, 1, 8, '企业背景', '', 'a:2:{s:6:"action";s:17:"Portal/Page/index";s:5:"param";a:1:{s:2:"id";s:1:"1";}}', '', 1, 0, '0-8-9'),
(10, 1, 8, '品牌定位', '', 'a:2:{s:6:"action";s:17:"Portal/Page/index";s:5:"param";a:1:{s:2:"id";s:1:"2";}}', '', 1, 0, '0-8-10'),
(11, 1, 8, '合作品牌', '', 'a:2:{s:6:"action";s:17:"Portal/Page/index";s:5:"param";a:1:{s:2:"id";s:1:"3";}}', '', 1, 0, '0-8-11'),
(12, 1, 8, '玫瑰里大事件', '', 'a:2:{s:6:"action";s:17:"Portal/Page/index";s:5:"param";a:1:{s:2:"id";s:2:"12";}}', '', 1, 0, '0-8-12'),
(13, 1, 8, '服务团队', '', 'a:2:{s:6:"action";s:17:"Portal/Page/index";s:5:"param";a:1:{s:2:"id";s:1:"4";}}', '', 1, 0, '0-8-13'),
(14, 1, 4, '菜单详情', '', 'a:2:{s:6:"action";s:17:"Portal/Page/index";s:5:"param";a:1:{s:2:"id";s:1:"7";}}', '', 1, 0, '0-4-14'),
(15, 1, 4, '菜品图例', '', 'a:2:{s:6:"action";s:17:"Portal/Page/index";s:5:"param";a:1:{s:2:"id";s:1:"8";}}', '', 1, 0, '0-4-15'),
(16, 1, 5, '婚礼案例', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:1:"9";}}', '', 1, 0, '0-5-16'),
(17, 1, 4, '套系报价', '', 'a:2:{s:6:"action";s:17:"Portal/Page/index";s:5:"param";a:1:{s:2:"id";s:1:"9";}}', '', 1, 0, '0-4-17'),
(18, 1, 5, '婚礼实录', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:2:"10";}}', '', 1, 0, '0-5-18'),
(19, 2, 0, '首页', '', '/index.php?g=&m=index&a=swmain', '', 1, 0, '0-19'),
(20, 2, 0, '商务场馆', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:2:"11";}}', '', 1, 0, '0-20'),
(21, 2, 0, '一站式服务', '', 'a:2:{s:6:"action";s:17:"Portal/Page/index";s:5:"param";a:1:{s:2:"id";s:1:"5";}}', '', 1, 0, '0-21'),
(22, 2, 0, '商务报价', '', 'a:2:{s:6:"action";s:17:"Portal/Page/index";s:5:"param";a:1:{s:2:"id";s:1:"7";}}', '', 1, 0, '0-22'),
(23, 2, 22, '菜单详情', '', 'a:2:{s:6:"action";s:17:"Portal/Page/index";s:5:"param";a:1:{s:2:"id";s:1:"7";}}', '', 1, 0, '0-22-23'),
(24, 2, 22, '菜品图例', '', 'a:2:{s:6:"action";s:17:"Portal/Page/index";s:5:"param";a:1:{s:2:"id";s:1:"8";}}', '', 1, 0, '0-22-24'),
(25, 2, 22, '套系报价', '', 'a:2:{s:6:"action";s:17:"Portal/Page/index";s:5:"param";a:1:{s:2:"id";s:1:"9";}}', '', 1, 0, '0-22-25'),
(26, 2, 0, '商务案列', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:2:"14";}}', '', 1, 0, '0-26'),
(27, 2, 26, '商务案例', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:2:"14";}}', '', 1, 0, '0-26-27'),
(28, 2, 26, '商务实录', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:2:"15";}}', '', 1, 0, '0-26-28'),
(29, 2, 0, '最新活动', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:1:"5";}}', '', 1, 0, '0-29'),
(30, 2, 0, '在线预约', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:1:"6";}}', '', 1, 0, '0-30'),
(31, 2, 0, '关于玫瑰里', '', 'a:2:{s:6:"action";s:17:"Portal/Page/index";s:5:"param";a:1:{s:2:"id";s:1:"1";}}', '', 1, 0, '0-31'),
(32, 2, 31, '企业背景', '', 'a:2:{s:6:"action";s:17:"Portal/Page/index";s:5:"param";a:1:{s:2:"id";s:1:"1";}}', '', 1, 0, '0-31-32'),
(33, 2, 31, '品牌定位', '', 'a:2:{s:6:"action";s:17:"Portal/Page/index";s:5:"param";a:1:{s:2:"id";s:1:"2";}}', '', 1, 0, '0-31-33'),
(34, 2, 31, '合作品牌', '', 'a:2:{s:6:"action";s:17:"Portal/Page/index";s:5:"param";a:1:{s:2:"id";s:1:"3";}}', '', 1, 0, '0-31-34'),
(35, 2, 31, '玫瑰里大事件', '', 'a:2:{s:6:"action";s:17:"Portal/Page/index";s:5:"param";a:1:{s:2:"id";s:2:"12";}}', '', 1, 0, '0-31-35'),
(36, 2, 31, '企业团队', '', 'a:2:{s:6:"action";s:17:"Portal/Page/index";s:5:"param";a:1:{s:2:"id";s:1:"4";}}', '', 1, 0, '0-31-36'),
(37, 1, 0, '玫瑰里大事件', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:2:"19";}}', '', 0, 0, '0-37'),
(38, 1, 37, '图片', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:2:"19";}}', '', 0, 0, '0-37-38');

-- --------------------------------------------------------

--
-- 表的结构 `data_nav_cat`
--

CREATE TABLE IF NOT EXISTS `data_nav_cat` (
  `navcid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '导航分类名',
  `active` int(1) NOT NULL DEFAULT '1' COMMENT '是否为主菜单，1是，0不是',
  `remark` text COMMENT '备注',
  PRIMARY KEY (`navcid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='前台导航分类表' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `data_nav_cat`
--

INSERT INTO `data_nav_cat` (`navcid`, `name`, `active`, `remark`) VALUES
(1, '主导航', 1, '主导航'),
(2, '商务导航', 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `data_newarc`
--

CREATE TABLE IF NOT EXISTS `data_newarc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '留言者姓名',
  `arcid` int(11) DEFAULT '0',
  `arctitle` varchar(255) DEFAULT NULL,
  `uname` varchar(255) NOT NULL COMMENT '评论内容',
  `utel` varchar(255) DEFAULT NULL,
  `createtime` datetime NOT NULL COMMENT '留言时间',
  `status` smallint(2) NOT NULL DEFAULT '1' COMMENT '留言状态，1：正常，0：删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='留言表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `data_newarc`
--

INSERT INTO `data_newarc` (`id`, `uid`, `arcid`, `arctitle`, `uname`, `utel`, `createtime`, `status`) VALUES
(1, 2, 6, 'testhuodong', '1', '1', '2018-05-15 21:54:46', 1);

-- --------------------------------------------------------

--
-- 表的结构 `data_num`
--

CREATE TABLE IF NOT EXISTS `data_num` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `data_num`
--

INSERT INTO `data_num` (`id`, `num`) VALUES
(1, 2029);

-- --------------------------------------------------------

--
-- 表的结构 `data_oauth_user`
--

CREATE TABLE IF NOT EXISTS `data_oauth_user` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `from` varchar(20) NOT NULL COMMENT '用户来源key',
  `name` varchar(30) NOT NULL COMMENT '第三方昵称',
  `head_img` varchar(200) NOT NULL COMMENT '头像',
  `uid` int(20) NOT NULL COMMENT '关联的本站用户id',
  `create_time` datetime NOT NULL COMMENT '绑定时间',
  `last_login_time` datetime NOT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(16) NOT NULL COMMENT '最后登录ip',
  `login_times` int(6) NOT NULL COMMENT '登录次数',
  `status` tinyint(2) NOT NULL,
  `access_token` varchar(512) NOT NULL,
  `expires_date` int(11) NOT NULL COMMENT 'access_token过期时间',
  `openid` varchar(40) NOT NULL COMMENT '第三方用户id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='第三方用户表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `data_options`
--

CREATE TABLE IF NOT EXISTS `data_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL COMMENT '配置名',
  `option_value` longtext NOT NULL COMMENT '配置值',
  `autoload` int(2) NOT NULL DEFAULT '1' COMMENT '是否自动加载',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='全站配置表' AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `data_options`
--

INSERT INTO `data_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'member_email_active', '{"title":"ThinkCMF\\u90ae\\u4ef6\\u6fc0\\u6d3b\\u901a\\u77e5.","template":"<p>\\u672c\\u90ae\\u4ef6\\u6765\\u81ea<a href=\\"http:\\/\\/www.thinkcmf.com\\">ThinkCMF<\\/a><br\\/><br\\/>&nbsp; &nbsp;<strong>---------------<\\/strong><br\\/>&nbsp; &nbsp;<strong>\\u5e10\\u53f7\\u6fc0\\u6d3b\\u8bf4\\u660e<\\/strong><br\\/>&nbsp; &nbsp;<strong>---------------<\\/strong><br\\/><br\\/>&nbsp; &nbsp; \\u5c0a\\u656c\\u7684<span style=\\"FONT-SIZE: 16px; FONT-FAMILY: Arial; COLOR: rgb(51,51,51); LINE-HEIGHT: 18px; BACKGROUND-COLOR: rgb(255,255,255)\\">#username#\\uff0c\\u60a8\\u597d\\u3002<\\/span>\\u5982\\u679c\\u60a8\\u662fThinkCMF\\u7684\\u65b0\\u7528\\u6237\\uff0c\\u6216\\u5728\\u4fee\\u6539\\u60a8\\u7684\\u6ce8\\u518cEmail\\u65f6\\u4f7f\\u7528\\u4e86\\u672c\\u5730\\u5740\\uff0c\\u6211\\u4eec\\u9700\\u8981\\u5bf9\\u60a8\\u7684\\u5730\\u5740\\u6709\\u6548\\u6027\\u8fdb\\u884c\\u9a8c\\u8bc1\\u4ee5\\u907f\\u514d\\u5783\\u573e\\u90ae\\u4ef6\\u6216\\u5730\\u5740\\u88ab\\u6ee5\\u7528\\u3002<br\\/>&nbsp; &nbsp; \\u60a8\\u53ea\\u9700\\u70b9\\u51fb\\u4e0b\\u9762\\u7684\\u94fe\\u63a5\\u5373\\u53ef\\u6fc0\\u6d3b\\u60a8\\u7684\\u5e10\\u53f7\\uff1a<br\\/>&nbsp; &nbsp; <a title=\\"\\" href=\\"http:\\/\\/#link#\\" target=\\"_self\\">http:\\/\\/#link#<\\/a><br\\/>&nbsp; &nbsp; (\\u5982\\u679c\\u4e0a\\u9762\\u4e0d\\u662f\\u94fe\\u63a5\\u5f62\\u5f0f\\uff0c\\u8bf7\\u5c06\\u8be5\\u5730\\u5740\\u624b\\u5de5\\u7c98\\u8d34\\u5230\\u6d4f\\u89c8\\u5668\\u5730\\u5740\\u680f\\u518d\\u8bbf\\u95ee)<br\\/>&nbsp; &nbsp; \\u611f\\u8c22\\u60a8\\u7684\\u8bbf\\u95ee\\uff0c\\u795d\\u60a8\\u4f7f\\u7528\\u6109\\u5feb\\uff01<br\\/><br\\/>&nbsp; &nbsp; \\u6b64\\u81f4<br\\/>&nbsp; &nbsp; ThinkCMF \\u7ba1\\u7406\\u56e2\\u961f.<\\/p>"}', 1),
(2, 'site_options', '{"site_name":"\\u73ab\\u7470\\u91cc","site_host":"http:\\/\\/www.lavin.com.cn","site_admin_url_password":"","site_tpl":"simplebootx","mobile_tpl_enabled":"1","site_adminstyle":"bluesky","site_icp":"","site_admin_email":"mindasiy@sina.com","site_tongji":"","site_copyright":"","site_seo_title":"","site_seo_keywords":" ","site_seo_description":" ","urlmode":"0","html_suffix":"","comment_time_interval":60}', 1),
(3, 'cmf_settings', '{"banned_usernames":""}', 1);

-- --------------------------------------------------------

--
-- 表的结构 `data_page`
--

CREATE TABLE IF NOT EXISTS `data_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `postadderss` varchar(255) DEFAULT NULL,
  `post_content` longtext,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=17 ;

--
-- 转存表中的数据 `data_page`
--

INSERT INTO `data_page` (`id`, `pid`, `postadderss`, `post_content`, `type`) VALUES
(1, 7, '北京·太阳公元', '<p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b912991e70d9.jpg" style="" title="北京5988.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b912992254b2.jpg" style="" title="北京6988.jpg"/></p><p><br/></p>', '婚礼'),
(2, 7, '上海·外滩', '<p style="text-align: center;"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f028d7dff.jpg" style="" title="5988.jpg"/></p><p style="text-align: center;"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f028d94d4.jpg" style="" title="6988.jpg"/></p><p style="text-align: center;"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f029df030.jpg" title="7888.jpg" style="white-space: normal;"/></p><p style="text-align: center;"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f02906718.jpg" style="" title="8888.jpg"/></p><p style="text-align: center;"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f02908650.jpg" style="" title="9999.jpg"/></p><p><br/></p>', '婚礼'),
(3, 7, '天津·爱琴海', '<p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b912a207bacb.jpg" title="天津4288.jpg" style="text-align: center; white-space: normal;"/></p><p><br/></p><p style="text-align: center;"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b912a2052fa9.jpg" style="" title="天津4588.jpg"/></p><p style="text-align: center"><br/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b912a2091fa5.jpg" style="" title="天津5288.jpg"/></p><p><br/></p>', '婚礼'),
(5, 7, '南京·1865', '<p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b912eef6cd14.jpg" style="" title="1865  3988.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b912eef81708.jpg" style="" title="1865  4588.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b912ef0e2cc1.jpg" style="" title="1865  5688.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b912ef21ff8a.jpg" style="" title="1865  6688.jpg"/></p><p><br/></p>', '婚礼'),
(4, 7, '南京·外秦淮', '<p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b912de962fd2.jpg" style="" title="外秦淮3988.jpg"/></p><p style="text-align: center"><br/></p><p style="text-align: center;"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b912dee0be30.jpg" title="外秦淮4588.jpg" style="text-align: center; white-space: normal;"/></p><p style="text-align: center"><br/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b912deee383f.jpg" style="" title="外秦淮4988.jpg"/></p><p></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b912e78259e4.jpg" title="外秦淮5688.jpg" alt="外秦淮5688.jpg"/></p><p style="text-align: center;"><br/></p>', '婚礼'),
(6, 9, '北京·太阳公元', '<p>test 菜系</p>', '婚礼'),
(7, 7, '北京·太阳公元', '<p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b926ae14213e.jpg" style="" title="北京2500.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b926ae1e42df.jpg" style="" title="北京3500.jpg"/></p><p><br/></p>', '商务'),
(8, 7, '上海·外滩', '<p style="text-align: center"></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b926b2b7d613.jpg" style="" title="上海2888.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b926b44bfdb8.jpg" title="上海3588.jpg" alt="上海3588.jpg"/></p><p><br/></p>', '商务'),
(9, 7, '天津·爱琴海', '<p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b926b6f4594d.jpg" style="" title="天津2888.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b926b73d95a4.jpg" style="" title="天津3888.jpg"/></p><p><br/></p>', '商务'),
(10, 7, '南京·外秦淮', '<p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b915534e064c.jpeg" style="" title="1888元.jpeg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b915534e8b10.jpeg" style="" title="2288元.jpeg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b91555da7e36.png" title="image.png" alt="image.png"/><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b91553739770.jpeg" title="2888元.jpeg" style="text-align: center; white-space: normal;"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b9155372a11d.jpeg" style="" title="3288元.jpeg"/></p><p><br/></p>', '商务'),
(11, 7, '南京·1865', '<p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b9155d38eb87.jpeg" style="" title="1888元.jpeg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b9155da144c4.jpeg" style="" title="2288元.jpeg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b9155e0d0f1d.jpeg" style="" title="2588元.jpeg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b9155ea9d762.jpeg" style="" title="2888元.jpeg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b9155f0a7bd6.jpeg" style="" title="3288元.jpeg"/></p><p><br/></p>', '商务'),
(12, 8, '北京·太阳公元', '<p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f116b2a8a.jpg" style="" title="1.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f117e46f1.jpg" style="" title="3.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f118db67f.jpg" style="" title="2.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f11b13640.jpg" style="" title="5.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f11b2d541.jpg" style="" title="4.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f11c39ed3.jpg" style="" title="6.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f11d54a57.jpg" style="" title="澳洲花龙刺身.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f11e53d59.jpg" style="" title="白灼彩意时令蔬.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f1201ff99.jpg" style="" title="菜松牛肉香炒饭.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f12038f04.jpg" style="" title="当红脆皮炸仔鸡.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f12226164.jpg" style="" title="港式冰梅香烧鸭.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f1233bef4.jpg" style="" title="桂花糯米藕.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f12468f2e.jpg" style="" title="过桥孜然羊肋排.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f12580a28.jpg" style="" title="惠州梅菜扣肉.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f12628b1e.jpg" style="" title="金汤枸杞浸时蔬.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f1275fc77.jpg" style="" title="茄汁烧大虾.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f1291a167.jpg" style="" title="蜜汁浸芸豆.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f12a06f22.jpg" style="" title="马苏芝士焗青口贝.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f12b11e13.jpg" style="" title="三味碳烤帝王蟹.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f12cc589f.jpg" style="" title="烧汁牛肋骨细节图.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f12cf37cb.jpg" style="" title="上汤芝士伊面焗龙虾.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f12eb2c9e.jpg" style="" title="双葱椒盐焗龙虾.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f12ebdcb6.jpg" style="" title="柠檬小木耳.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f130b1807.jpg" style="" title="私家京葱梅花参.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f130d1b8a.jpg" style="" title="五香酱牛腱.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f13220896.jpg" style="" title="夏果雀巢牛仔粒.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f132b2b97.jpg" style="" title="鲜人参炖老鸡.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f13439929.jpeg" style="" title="WechatIMG105.jpeg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f1355bb6d.jpg" style="" title="镇江水晶肉.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f13663087.jpg" style="" title="XO酱鲜虾爆双鲜.jpg"/></p><p><br/></p>', '婚礼'),
(13, 8, '上海·外滩', '<p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f3482e0ea.jpg" style="" title="1.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f3494abf3.jpg" style="" title="2.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f34ae4c8f.jpg" style="" title="5.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f34c2850a.jpg" style="" title="6.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f34da275c.jpg" style="" title="4.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f34e7d7f2.jpg" style="" title="澳洲花龙刺身.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f34fe46b6.jpg" style="" title="白灼彩意时令蔬.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f35062ad7.jpg" style="" title="菜松牛肉香炒饭.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f3513baa6.jpg" style="" title="3.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f352aa055.jpg" style="" title="港式冰梅香烧鸭.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f353221f9.jpg" style="" title="当红脆皮炸仔鸡.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f3559ce5a.jpg" style="" title="惠州梅菜扣肉.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f3560fce0.jpg" style="" title="过桥孜然羊肋排.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f357075d1.jpg" style="" title="金汤枸杞浸时蔬.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f3592b1f2.jpg" style="" title="马苏芝士焗青口贝.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f35a13ec1.jpg" style="" title="茄汁烧大虾.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f35a2b974.jpg" style="" title="桂花糯米藕.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f35b5b2d4.jpg" style="" title="蜜汁浸芸豆.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f35d02c12.jpg" style="" title="柠檬小木耳.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f35d6a78b.jpg" style="" title="上汤芝士伊面焗龙虾.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f35ec643c.jpg" style="" title="双葱椒盐焗龙虾.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f3605d2a6.jpg" style="" title="私家京葱梅花参.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f36112b30.jpg" style="" title="烧汁牛肋骨细节图.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f36204bba.jpg" style="" title="五香酱牛腱.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f36340349.jpg" style="" title="鲜人参炖老鸡.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f3651071b.jpg" style="" title="镇江水晶肉.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f36532dfc.jpg" style="" title="夏果雀巢牛仔粒.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f366ed6ed.jpeg" style="" title="WechatIMG105.jpeg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f367162c3.jpg" style="" title="三味碳烤帝王蟹.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f3672bbdc.jpg" style="" title="XO酱鲜虾爆双鲜.jpg"/></p><p><br/></p>', '婚礼'),
(14, 8, '天津·爱琴海', '<p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f3b299e20.jpg" style="" title="1.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f3b44e285.jpg" style="" title="2.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f3b523bca.jpg" style="" title="4.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f3b7091a4.jpg" style="" title="6.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f3b75d161.jpg" style="" title="5.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f3b9262e7.jpg" style="" title="澳洲花龙刺身.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f3b9e0593.jpg" style="" title="白灼彩意时令蔬.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f3bbeab46.jpg" style="" title="菜松牛肉香炒饭.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f3bc1a7b4.jpg" style="" title="当红脆皮炸仔鸡.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f3bc5d4f6.jpg" style="" title="3.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f3be4da25.jpg" style="" title="港式冰梅香烧鸭.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f3be56507.jpg" style="" title="桂花糯米藕.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f3bfe05f2.jpg" style="" title="惠州梅菜扣肉.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f3c14dee1.jpg" style="" title="金汤枸杞浸时蔬.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f3c1d99d4.jpg" style="" title="茄汁烧大虾.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f3c3d99b9.jpg" style="" title="马苏芝士焗青口贝.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f3c550a70.jpg" style="" title="蜜汁浸芸豆.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f3c5d3afb.jpg" style="" title="柠檬小木耳.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f3c7eeb79.jpg" style="" title="上汤芝士伊面焗龙虾.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f3c80c47b.jpg" style="" title="三味碳烤帝王蟹.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f3ca1c91e.jpg" style="" title="烧汁牛肋骨细节图.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f3ca3b22e.jpg" style="" title="双葱椒盐焗龙虾.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f3cb8aab3.jpg" style="" title="私家京葱梅花参.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f3ccc2e2e.jpg" style="" title="五香酱牛腱.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f3cd439fc.jpg" style="" title="夏果雀巢牛仔粒.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f3cf0e12d.jpg" style="" title="鲜人参炖老鸡.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f3cfe8630.jpg" style="" title="镇江水晶肉.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f3d0c5420.jpeg" style="" title="WechatIMG105.jpeg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f3d18847d.jpg" style="" title="XO酱鲜虾爆双鲜.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f3d1e9f7d.jpg" style="" title="过桥孜然羊肋排.jpg"/></p><p><br/></p>', '婚礼'),
(15, 8, '南京·外秦淮', '<p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f56e6006d.jpg" style="" title="1.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f56ee97f3.jpg" style="" title="2.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f57195713.jpg" style="" title="4.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f57240e2f.jpg" style="" title="5.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f572a726d.jpg" style="" title="3.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f57325847.jpg" style="" title="6.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f575829cc.jpg" style="" title="菜松牛肉香炒饭.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f57656c6e.jpg" style="" title="澳洲花龙刺身.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f576eb69c.jpg" style="" title="白灼彩意时令蔬.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f577939a8.jpg" style="" title="当红脆皮炸仔鸡.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f57a58097.jpg" style="" title="桂花糯米藕.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f57acf9ea.jpg" style="" title="港式冰梅香烧鸭.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f57b3761d.jpg" style="" title="过桥孜然羊肋排.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f57cc8ae3.jpg" style="" title="金汤枸杞浸时蔬.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f57ef2a70.jpg" style="" title="茄汁烧大虾.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f57f62660.jpg" style="" title="马苏芝士焗青口贝.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f57f77cac.jpg" style="" title="惠州梅菜扣肉.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f5810f820.jpg" style="" title="柠檬小木耳.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f582c902b.jpg" style="" title="上汤芝士伊面焗龙虾.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f58483ecd.jpg" style="" title="烧汁牛肋骨细节图.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f584b8a1b.jpg" style="" title="蜜汁浸芸豆.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f585808ca.jpg" style="" title="三味碳烤帝王蟹.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f5867635d.jpg" style="" title="双葱椒盐焗龙虾.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f5881e0d3.jpg" style="" title="夏果雀巢牛仔粒.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f5889f3b6.jpg" style="" title="私家京葱梅花参.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f589e39e0.jpg" style="" title="鲜人参炖老鸡.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f58a8c259.jpg" style="" title="五香酱牛腱.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f58c2cfa8.jpeg" style="" title="WechatIMG105.jpeg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f58c827da.jpg" style="" title="镇江水晶肉.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f58ce5c7a.jpg" style="" title="XO酱鲜虾爆双鲜.jpg"/></p><p><br/></p>', '婚礼'),
(16, 8, '南京·1865', '<p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f5ae4b998.jpg" style="" title="1.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f5af2c03c.jpg" style="" title="3.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f5b0ea95c.jpg" style="" title="2.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f5b0ee18e.jpg" style="" title="4.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f5b25b64c.jpg" style="" title="6.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f5b3d4289.jpg" style="" title="白灼彩意时令蔬.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f5b55ba9d.jpg" style="" title="菜松牛肉香炒饭.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f5b586869.jpg" style="" title="澳洲花龙刺身.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f5b68cb82.jpg" style="" title="当红脆皮炸仔鸡.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f5b760100.jpg" style="" title="桂花糯米藕.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f5b97fe71.jpg" style="" title="过桥孜然羊肋排.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f5ba6a40b.jpg" style="" title="5.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f5bb4d4b4.jpg" style="" title="惠州梅菜扣肉.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f5bc4f145.jpg" style="" title="金汤枸杞浸时蔬.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f5bebd684.jpg" style="" title="马苏芝士焗青口贝.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f5bed0e1c.jpg" style="" title="港式冰梅香烧鸭.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f5c0f0dc3.jpg" style="" title="蜜汁浸芸豆.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f5c104b01.jpg" style="" title="茄汁烧大虾.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f5c27a960.jpg" style="" title="三味碳烤帝王蟹.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f5c3c874e.jpg" style="" title="烧汁牛肋骨细节图.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f5c3e38f1.jpg" style="" title="柠檬小木耳.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f5c52efa7.jpg" style="" title="双葱椒盐焗龙虾.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f5c65f546.jpg" style="" title="五香酱牛腱.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f5c7ea92e.jpg" style="" title="夏果雀巢牛仔粒.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f5c902f90.jpg" style="" title="私家京葱梅花参.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f5c977f45.jpg" style="" title="鲜人参炖老鸡.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f5cb12203.jpeg" style="" title="WechatIMG105.jpeg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f5cc0998b.jpg" style="" title="上汤芝士伊面焗龙虾.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f5cc62d91.jpg" style="" title="XO酱鲜虾爆双鲜.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b90f5ccc54ee.jpg" style="" title="镇江水晶肉.jpg"/></p><p><br/></p>', '婚礼');

-- --------------------------------------------------------

--
-- 表的结构 `data_plugins`
--

CREATE TABLE IF NOT EXISTS `data_plugins` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(50) NOT NULL COMMENT '插件名，英文',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '插件名称',
  `description` text COMMENT '插件描述',
  `type` tinyint(2) DEFAULT '0' COMMENT '插件类型, 1:网站；8;微信',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态；1开启；',
  `config` text COMMENT '插件配置',
  `hooks` varchar(255) DEFAULT NULL COMMENT '实现的钩子;以“，”分隔',
  `has_admin` tinyint(2) DEFAULT '0' COMMENT '插件是否有后台管理界面',
  `author` varchar(50) DEFAULT '' COMMENT '插件作者',
  `version` varchar(20) DEFAULT '' COMMENT '插件版本号',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '插件安装时间',
  `listorder` smallint(6) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='插件表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `data_posts`
--

CREATE TABLE IF NOT EXISTS `data_posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned DEFAULT '0' COMMENT '发表者id',
  `post_keywords` varchar(150) NOT NULL COMMENT 'seo keywords',
  `post_source` varchar(150) DEFAULT NULL COMMENT '转载文章的来源',
  `post_date` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post创建日期，永久不变，一般不显示给用户',
  `post_content` longtext COMMENT 'post内容',
  `post_title` text COMMENT 'post标题',
  `post_excerpt` text COMMENT 'post摘要',
  `post_status` int(2) DEFAULT '1' COMMENT 'post状态，1已审核，0未审核',
  `comment_status` int(2) DEFAULT '1' COMMENT '评论状态，1允许，0不允许',
  `post_modified` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post更新时间，可在前台修改，显示给用户',
  `post_content_filtered` longtext,
  `post_parent` bigint(20) unsigned DEFAULT '0' COMMENT 'post的父级post id,表示post层级关系',
  `post_type` int(2) DEFAULT NULL,
  `post_mime_type` varchar(100) DEFAULT '',
  `comment_count` bigint(20) DEFAULT '0',
  `smeta` text COMMENT 'post的扩展字段，保存相关扩展属性，如缩略图；格式为json',
  `post_hits` int(11) DEFAULT '0' COMMENT 'post点击数，查看数',
  `post_like` int(11) DEFAULT '0' COMMENT 'post赞数',
  `istop` tinyint(1) NOT NULL DEFAULT '0' COMMENT '置顶 1置顶； 0不置顶',
  `recommended` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐 1推荐 0不推荐',
  `newarc` int(11) DEFAULT '0' COMMENT '活动报名数',
  `actstarttime` datetime DEFAULT NULL COMMENT '活动开始时间',
  `actendtime` datetime DEFAULT NULL COMMENT '活动结束时间',
  `postadderss` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `max` varchar(255) DEFAULT '0',
  `tinggao` varchar(255) DEFAULT '0',
  `zhuoshu` varchar(255) DEFAULT '0',
  `tese` varchar(255) DEFAULT NULL,
  `youhui` varchar(255) DEFAULT NULL,
  `jiage` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`id`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`),
  KEY `post_date` (`post_date`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Portal文章表' AUTO_INCREMENT=136 ;

--
-- 转存表中的数据 `data_posts`
--

INSERT INTO `data_posts` (`id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `newarc`, `actstarttime`, `actendtime`, `postadderss`, `type`, `max`, `tinggao`, `zhuoshu`, `tese`, `youhui`, `jiage`) VALUES
(1, 1, '', NULL, '2018-05-05 10:49:53', '<p><br/></p><p><span style="color: rgb(0, 0, 0); font-size: 20px;"><strong>玫瑰里文化集团有限公司</strong></span></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180819/5b786cc91a427.jpg" title="6关于LAVIN（企业背景）.jpg" alt="6关于LAVIN（企业背景）.jpg"/></p>', '企业背景', '', 1, 1, '2018-05-05 10:49:12', NULL, 0, 2, '', 0, '{"template":"page","thumb":""}', 0, 0, 0, 0, 0, NULL, NULL, '北京·太阳公元', '婚礼', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 1, '', NULL, '2018-05-05 10:51:49', '<p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180819/5b786d460efec.jpg" title="7关于LAVIN（品牌定位）.jpg" alt="7关于LAVIN（品牌定位）.jpg"/> </p>', '品牌定位', '', 1, 1, '2018-05-05 10:51:27', NULL, 0, 2, '', 0, '{"template":"page","thumb":""}', 0, 0, 0, 0, 0, NULL, NULL, '北京·太阳公元', '婚礼', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 1, '', NULL, '2018-05-05 10:52:17', '<p style="text-align: center;"><img src="/images/about-hzpp.png"/></p>', '合作品牌', '', 0, 1, '2018-05-05 10:51:57', NULL, 0, 2, '', 0, '{"template":"page","thumb":""}', 0, 0, 0, 0, 0, NULL, NULL, '北京·太阳公元', '婚礼', NULL, NULL, NULL, NULL, NULL, NULL),
(4, 1, '', NULL, '2018-05-05 10:56:31', '<p><img src="/images/about_team_01.png"/> <img src="/images/about_team_02.png"/> <img src="/images/about_team_03.png"/> <img src="/images/about_team_04.png"/> <img src="/images/about_team_05.png"/> <img src="/images/about_team_06.png"/></p>', '服务团队', '', 1, 1, '2018-05-05 10:55:32', NULL, 0, 2, '', 0, '{"template":"page","thumb":""}', 0, 0, 0, 0, 0, NULL, NULL, '北京·太阳公元', '婚礼', NULL, NULL, NULL, NULL, NULL, NULL),
(5, 1, '', NULL, '2018-05-05 11:08:56', '<p><br/> </p><p><br/> </p><p><br/> </p><p><img src="/images/mgl-yzsfw_01.png"/> </p><p><br/> </p><p><br/> </p><p><br/> </p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180819/5b786bd6c81d3.jpg" title="5预约参观.jpg" alt="5预约参观.jpg"/> </p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180819/5b786be9418c9.jpg" title="5前期沟通.jpg" alt="5前期沟通.jpg"/></p><p><br/></p><p><img src="/images/mgl-yzsfw_07.png"/> </p><p><img src="/images/mgl-yzsfw_08.png"/><br/></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180819/5b786c138c060.jpg" title="5婚礼彩排.jpg" alt="5婚礼彩排.jpg"/></p><p><br/></p><p><img src="/images/mgl-yzsfw_12.png"/> </p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180819/5b786c27cd13e.jpg" title="5婚礼结束.jpg" alt="5婚礼结束.jpg"/> </p><p><br/> </p><p><br/> </p><p><br/> </p>', '一站式服务', '', 1, 1, '2018-05-05 11:08:23', NULL, 0, 2, '', 0, '{"template":"page-yzsfw","thumb":""}', 0, 0, 0, 0, 0, NULL, NULL, '北京·太阳公元', '婚礼', NULL, NULL, NULL, NULL, NULL, NULL),
(6, 1, '', '', '2018-05-05 14:58:20', '<p>①预定2018年婚宴，享受原价7折优惠；</p><p>②预定2019年4月底前7-8月及所有非节假日的婚宴，享受买二送一优惠，剩余档期享受买5送1优惠。</p><p><br/></p>', '约惠七夕', '浪漫七夕  玫瑰钜惠', 1, 1, '2018-08-14 00:00:00', NULL, 0, NULL, '', 0, '{"thumb":"20180820\\/5b7a16bdc42e3.png"}', 80, 0, 0, 0, 1, '2018-08-17 09:14:00', '2018-08-19 09:14:00', '上海·外滩', '婚礼', '', '', '', '', '', ''),
(7, 1, '', NULL, '2018-05-06 21:37:35', '', '菜单详情', '', 1, 1, '2018-05-06 21:37:14', NULL, 0, 2, '', 0, '{"template":"page-cdxq","thumb":""}', 0, 0, 0, 0, 0, NULL, NULL, '天津·爱琴海', '婚礼', NULL, NULL, NULL, NULL, NULL, NULL),
(8, 1, '', NULL, '2018-05-06 22:19:29', '', '菜品图例', '', 1, 1, '2018-05-06 22:14:11', NULL, 0, 2, '', 0, '{"template":"page-cptl","thumb":""}', 0, 0, 0, 0, 0, NULL, NULL, '南京·1865', '婚礼', NULL, NULL, NULL, NULL, NULL, NULL),
(9, 1, '', NULL, '2018-05-06 22:19:30', '', '套系报价', '', 1, 1, '2018-05-06 22:14:11', NULL, 0, 2, '', 0, '{"template":"page-cdxq","thumb":""}', 0, 0, 0, 0, 0, NULL, NULL, '北京·太阳公元', '婚礼', NULL, NULL, NULL, NULL, NULL, NULL),
(10, 1, '', '', '2018-05-07 19:47:33', '<p style="margin-top: 0px; margin-bottom: 0px; font-stretch: normal; font-size: 13px; line-height: normal; font-family: &quot;Helvetica Neue&quot;; text-align: center;"><span style="font-size: 16px;"><br/></span></p><p style="margin-top: 0px; margin-bottom: 0px; font-stretch: normal; font-size: 13px; line-height: normal; font-family: &quot;Helvetica Neue&quot;;"><span style="font-size: 16px;"><br/></span></p><p style="margin-top: 0px; margin-bottom: 0px; font-stretch: normal; font-size: 13px; line-height: normal; font-family: &quot;Helvetica Neue&quot;; text-align: center;"><span style="font-size: 16px;"></span></p><p style="text-align: center;"><span style="font-size: 18px;">爱是无处不在</span></p><p style="text-align: center;"><span style="font-size: 18px;">如何拥有而不占有</span></p><p style="text-align: center;"><span style="font-size: 18px;">如晨曦，流水，草木葳蕤</span></p><p style="text-align: center;"><span style="font-size: 18px;">多少承诺以爱之名</span></p><p style="text-align: center;"><span style="font-size: 18px;">如星夜，繁花，田园怡情</span></p><p style="text-align: center;"><span style="font-size: 18px;">用最自然的方式说我爱你</span></p><p style="margin-top: 0px; margin-bottom: 0px; font-stretch: normal; font-size: 13px; line-height: normal; font-family: &quot;Helvetica Neue&quot;; text-align: center;"><span style="font-size: 16px;"></span><br/></p><p><br/></p>', '莫忘最初', '用最自然的方式说我爱你。', 1, 1, '2018-05-07 19:47:14', NULL, 0, NULL, '', 0, '{"thumb":"20180821\\/5b7bb94328d80.jpg","photo":[{"url":"20180821\\/5b7bbafcc7356.jpg","alt":"G02A8016"},{"url":"20180821\\/5b7bbb34996fd.jpg","alt":"G02A8031"},{"url":"20180821\\/5b7bbb6b6991b.jpg","alt":"BU3I9497"},{"url":"20180821\\/5b7bbb98d6d20.jpg","alt":"BU3I9344"},{"url":"20180821\\/5b7bbbea0aeb5.jpg","alt":"BU3I9366"},{"url":"20180821\\/5b7bbc279d474.jpg","alt":"DV3A8029"}]}', 97, 0, 0, 0, 0, '1899-11-30 00:00:00', '2018-11-29 00:00:00', '北京·太阳公元', '商务', '', '', '', '', '', ''),
(11, 1, '', '', '2018-05-07 19:48:00', '<p style="text-align: center;"><video class="edui-upload-video  vjs-default-skin video-js" controls="" preload="none" width="420" height="280" src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b914405063cc.mp4" data-setup="{}"><source src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b914405063cc.mp4" type="video/mp4"/></video></p>', '告白气球', '告白气球', 1, 1, '2018-05-07 19:47:45', NULL, 0, NULL, '', 0, '{"thumb":"20180906\\/5b9144358e2c7.jpg"}', 68, 0, 0, 0, 0, '1899-08-21 00:00:00', '2018-08-21 00:00:00', '北京·太阳公元', '婚礼', '', '', '', '', '', ''),
(12, 1, '', NULL, '2018-05-09 16:00:04', '<table cellspacing="0" cellpadding="0"><tbody><tr class="firstRow"><td width="57" rowspan="13" style="border-width: 1px; border-color: windowtext; padding: 0px 7px;"><p style=";text-align: center;font-size: 14px;font-family: DengXian"><span style="font-family: 宋体, SimSun; color: rgb(255, 192, 0);">北京</span></p></td><td style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-style: none; border-top-color: windowtext; border-right-color: windowtext; border-bottom-color: windowtext; padding: 0px 7px;" width="280"><p style=";text-align: center;font-size: 14px;font-family: DengXian"><span style="font-family: 宋体, SimSun; color: rgb(255, 192, 0);">2014/9/7</span></p></td><td style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-style: none; border-top-color: windowtext; border-right-color: windowtext; border-bottom-color: windowtext; padding: 0px 7px; word-break: break-all;" width="207" align="center" valign="middle"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(255, 192, 0);">“楠海之滨”体操冠军滕海滨&amp;张楠婚礼</span></p><p style="font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(255, 192, 0);">—玫瑰里太阳公元·北京第一场婚礼</span></p></td></tr><tr><td width="84" style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(255, 192, 0);">2014/9/27</span></p></td><td style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;" width="409"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(255, 192, 0);">《夏洛特烦恼》电影拍摄</span></p></td></tr><tr><td width="84" style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(255, 192, 0);">2014/10/30</span></p></td><td style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;" width="415"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(255, 192, 0);">Let&#39;s Shining</span></p><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(255, 192, 0);">时尚新娘7周年庆生暨LAVIN玫瑰里·太阳公元温暖盛开</span></p></td></tr><tr><td width="84" style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(255, 192, 0);">2015/3/8</span></p></td><td style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;" width="415"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(255, 192, 0);">“如鱼归林”喻恩泰&amp;史林子婚礼</span></p></td></tr><tr><td width="84" style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(255, 192, 0);">2015/4/8</span></p></td><td style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;" width="415"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(255, 192, 0);">《大自然在说话》系列公益影片北京新闻发布会</span></p></td></tr><tr><td width="84" style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(255, 192, 0);">2015/8/26</span></p></td><td style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;" width="415"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(255, 192, 0);">都市爱情喜剧《小丈夫》拍摄</span></p></td></tr><tr><td width="84" style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(255, 192, 0);">2015/10/22</span></p></td><td style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;" width="415"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(255, 192, 0);">2015 ZAKER媒体盛典</span></p></td></tr><tr><td width="84" style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(255, 192, 0);">2016/5/10</span></p></td><td style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;" width="415"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(255, 192, 0);">林继东&amp;沈陶然婚礼</span></p></td></tr><tr><td width="84" style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(255, 192, 0);">2016/12/9</span></p></td><td style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;" width="415"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(255, 192, 0);">太阳LIVE发布会暨孙冕生日晚宴</span></p></td></tr><tr><td width="84" style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(255, 192, 0);">2017/2/6</span></p></td><td style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;" width="415"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(255, 192, 0);">Light Up 2018 Audi Gourp Media Night</span></p></td></tr><tr><td width="84" style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(255, 192, 0);">2017/5/27</span></p></td><td style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;" width="415"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(255, 192, 0);">听不够的新经典·《凯叔西游记》全集产品发布会</span></p></td></tr><tr><td width="84" style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(255, 192, 0);">2017/6/3</span></p></td><td style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;" width="415"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(255, 192, 0);">文隽60大寿·艺隽影视公司成立晚宴</span></p></td></tr><tr><td width="84" style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(255, 192, 0);">2018/3/25</span></p></td><td style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;" width="415"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(255, 192, 0);">Addy&#39;s World孙红雷女儿百日宴</span></p></td></tr><tr><td width="57" rowspan="9" style="border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-style: none; border-right-color: windowtext; border-bottom-color: windowtext; border-left-color: windowtext; padding: 0px 7px;"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(118, 146, 60);">上海</span></p></td><td style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;" width="280"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(118, 146, 60);">2014/11/1</span></p></td><td style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;" width="207"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(118, 146, 60);">玫瑰里外滩·上海 第一场婚礼</span></p></td></tr><tr><td width="84" style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(118, 146, 60);">2015/6/12</span></p></td><td style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;" width="415"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(118, 146, 60);">“让爱沸腾”《爱情麻辣烫至情定终身》电影发布会</span></p><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(118, 146, 60);">（上海国际电影节）</span></p></td></tr><tr><td width="84" style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(118, 146, 60);">2015/6/13</span></p></td><td style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;" width="415"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(118, 146, 60);">《西游记之三打白骨精》电影发布会</span></p><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(118, 146, 60);">（上海国际电影节）</span></p></td></tr><tr><td width="84" style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(118, 146, 60);">2015/6/17</span></p></td><td style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;" width="415"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(118, 146, 60);">麒麟影业之夜酒会与《日月人鱼》电影发布会</span></p><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(118, 146, 60);">（上海国际电影节）</span></p></td></tr><tr><td width="84" style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(118, 146, 60);">2015/11/30</span></p></td><td style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;" width="415"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(118, 146, 60);">“徽常美丽”2016《美丽俏佳人》发布酒会</span></p></td></tr><tr><td width="84" style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(118, 146, 60);">2016/6/13</span></p></td><td style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;" width="415"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(118, 146, 60);">向上之夜（上海国际电影节期间举办）</span></p></td></tr><tr><td width="84" style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(118, 146, 60);">2016年9月</span></p></td><td style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;" width="415"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(118, 146, 60);">都市爱情剧《漂亮的李慧珍》拍摄</span></p></td></tr><tr><td width="84" style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(118, 146, 60);">2017/6/19</span></p></td><td style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;" width="415"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(118, 146, 60);">向上之夜（上海国际电影节期间举办）</span></p></td></tr><tr><td width="84" style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(118, 146, 60);">2018/7/4</span></p></td><td style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;" width="415"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(118, 146, 60);">伊利优酸乳“果果昔”新品发布会</span></p></td></tr><tr><td width="57" rowspan="6" style="border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-style: none; border-right-color: windowtext; border-bottom-color: windowtext; border-left-color: windowtext; padding: 0px 7px;"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(49, 133, 155);">天津</span></p></td><td style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;" width="280"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(49, 133, 155);">2015/5/9</span></p></td><td style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px; word-break: break-all;" width="207" align="center" valign="middle"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(49, 133, 155);">天津爱琴海购物公园招商成果发布会</span></p><p style="font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(49, 133, 155);">暨开业倒计时启动盛典</span></p><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(49, 133, 155);">（玫瑰里入驻天津爱琴海购物公园）</span></p></td></tr><tr><td width="84" style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(49, 133, 155);">2015/10/24</span></p></td><td style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;" width="415"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(49, 133, 155);">“向天空说爱你”直升机高空求婚</span></p></td></tr><tr><td width="84" style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(49, 133, 155);">2015/11/15</span></p></td><td style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;" width="415"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(49, 133, 155);">玫瑰里爱琴海第一场婚礼</span></p></td></tr><tr><td width="84" style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(49, 133, 155);">2017/7/21</span></p></td><td style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;" width="415"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(49, 133, 155);">天津顶级时尚杂志“范”（天津日报集团直属单位）</span></p><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(49, 133, 155);">第79期首页展示及总经理专访</span></p></td></tr><tr><td width="84" style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(49, 133, 155);">2017/12/9</span></p></td><td style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;" width="415"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(49, 133, 155);">2017第三届天津商业金地标创新单项奖评选峰会</span></p><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(49, 133, 155);">玫瑰里荣获最佳宴会服务体验奖</span></p></td></tr><tr><td width="84" style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(49, 133, 155);">2018/6/29</span></p></td><td style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;" width="415"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(49, 133, 155);">VIVO&nbsp;联通主推月度会议</span></p></td></tr><tr><td width="57" rowspan="6" style="border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-style: none; border-right-color: windowtext; border-bottom-color: windowtext; border-left-color: windowtext; padding: 0px 7px;"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(178, 162, 199);">南京</span></p><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(178, 162, 199);">外秦淮</span></p></td><td style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;" width="280"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(178, 162, 199);">2015/11/6</span></p></td><td style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px; word-break: break-all;" width="207" align="center" valign="middle"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(178, 162, 199);">时尚新娘8周年庆生</span></p><p style="font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(178, 162, 199);">暨玫瑰里外秦淮与玫瑰里1865唯美绽放</span></p></td></tr><tr><td width="84" style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(178, 162, 199);">2016/9/26</span></p></td><td style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;" width="415"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(178, 162, 199);">第51届全球生态旅游大使（Miss All Nations）总决赛</span></p></td></tr><tr><td width="84" style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(178, 162, 199);">2016/10/30</span></p></td><td style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;" width="415"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(178, 162, 199);">体操冠军 吕君海&amp;俞静秋婚礼</span></p></td></tr><tr><td width="84" style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(178, 162, 199);">2018/1/18</span></p></td><td style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;" width="415"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(178, 162, 199);">第52届全球生态旅游大使（Miss All Nations）总决赛</span></p></td></tr><tr><td width="84" style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(178, 162, 199);">2018/3/27</span></p></td><td style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;" width="415"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(178, 162, 199);">周大福年会</span></p></td></tr><tr><td width="84" style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(178, 162, 199);">2018/6/6</span></p></td><td style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;" width="415"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(178, 162, 199);">世界知名城市“南京周”巴黎站品牌发布会</span></p></td></tr><tr><td width="57" rowspan="6" style="border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-style: none; border-right-color: windowtext; border-bottom-color: windowtext; border-left-color: windowtext; padding: 0px 7px;"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(127, 127, 127);">南京</span></p><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(127, 127, 127);">1865</span></p></td><td style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;" width="280"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(127, 127, 127);">2016/9</span></p></td><td style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;" width="207"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(127, 127, 127);">玫瑰里1865·南京唯美绽放</span></p></td></tr><tr><td width="84" style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(127, 127, 127);">2016/9/18</span></p></td><td style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;" width="415"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(127, 127, 127);">“环球小姐”刘宇珺婚礼</span></p></td></tr><tr><td width="84" style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(127, 127, 127);">2016/9/30</span></p></td><td style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;" width="415"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(127, 127, 127);">世界小姐江苏赛区总决赛</span></p></td></tr><tr><td width="84" style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(127, 127, 127);">2016/12/14</span></p></td><td style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;" width="415"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(127, 127, 127);">万科·星荟产品发布会发布会</span></p></td></tr><tr><td width="84" style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(127, 127, 127);">2017/8/19</span></p></td><td style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;" width="415"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(127, 127, 127);">沃尔沃汽车发布会</span></p></td></tr><tr><td width="84" style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(127, 127, 127);">2017/10/28</span></p></td><td style="border-top-style: none; border-left-style: none; border-bottom-width: 1px; border-bottom-color: windowtext; border-right-width: 1px; border-right-color: windowtext; padding: 0px 7px;" width="415"><p style="text-align: center; font-size: 14px; font-family: DengXian; line-height: 2em;"><span style="font-family: 宋体, SimSun; color: rgb(127, 127, 127);">丰田汽车发布会</span></p></td></tr></tbody></table><p><br style="text-align: center;"/></p>', '玫瑰里大事件', '', 1, 1, '2018-05-09 15:59:32', NULL, 0, 2, '', 0, '{"template":"page","thumb":""}', 0, 0, 0, 0, 0, NULL, NULL, '北京·太阳公元', '婚礼', NULL, NULL, NULL, NULL, NULL, NULL),
(13, 1, '', '', '2018-05-12 15:03:18', '<p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180819/5b78638a106d0.jpg" title="婚礼版块-北京-阳光之吻1（头图）.jpg" alt="婚礼版块-北京-阳光之吻1（头图）.jpg"/></p>', '阳光之吻', '阳光之吻仪式堂具有独特的婚礼景观设计，正面环绕的落地玻璃窗和采光塔让整个仪式堂充满爱的温暖。营造出独一无二的、圣洁的婚礼现场场景。', 1, 1, '2018-05-12 15:02:24', NULL, 0, NULL, '', 0, '{"thumb":"20180512\\/5af691aa430df.jpg"}', 13, 0, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '北京·太阳公元', '商务', '120人', '16', '5', '草坪婚礼 大厅无柱', NULL, NULL),
(14, 1, '', '', '2018-05-12 15:23:05', '<p>11111</p>', '1233333', '1', 1, 1, '2018-05-12 15:22:14', NULL, 0, NULL, '', 0, '{"thumb":"\\/images\\/index-aboutad.png"}', 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '北京·太阳公元', '婚礼', '', '', '', NULL, NULL, NULL),
(15, 1, '', '', '2018-05-15 22:17:56', '<p>1111</p>', '111', '111', 1, 1, '2018-05-15 22:16:59', NULL, 0, NULL, '', 0, '{"thumb":""}', 0, 0, 1, 0, 0, '2018-05-15 22:16:00', '2018-05-15 22:16:59', '北京·太阳公元', '婚礼', NULL, NULL, NULL, NULL, NULL, NULL),
(16, 1, '', '', '2018-05-15 22:21:18', '<p>2018年会钜惠</p>', '2018年会钜惠', '2018年会钜惠', 1, 1, '2018-05-15 22:20:20', NULL, 0, NULL, '', 0, '{"thumb":"20180907\\/5b926ceef3d36.jpg"}', 7, 0, 0, 0, 0, '2018-09-10 00:00:00', '2018-12-31 00:00:00', '北京·太阳公元', '商务', '', '', '', '', '', ''),
(17, 1, '', NULL, '2018-05-18 21:11:47', '<p>内容自定义</p>', '商务报价', '商务报价', 1, 1, '2018-05-18 21:09:52', NULL, 0, 2, '', 0, '{"template":"page-yzsfw","thumb":""}', 0, 0, 0, 0, 0, NULL, NULL, '北京·太阳公元', '婚礼', NULL, NULL, NULL, NULL, NULL, NULL),
(18, 1, '1', '1', '2018-05-26 21:07:15', '<p>1</p>', '1', '1', 1, 1, '2018-05-26 21:06:49', NULL, 0, NULL, '', 0, '{"thumb":""}', 0, 0, 0, 0, 0, '2018-05-26 21:06:49', '2018-05-26 21:06:49', '上海·外滩', '商务', NULL, NULL, NULL, NULL, NULL, NULL),
(19, 1, '', '', '2018-06-06 10:55:27', '<p>阳光之吻仪式堂具有独特的婚礼景观设计，正面环绕的落地玻璃窗和采光塔让整个仪式堂充满爱的温暖。营造出独一无二的、圣洁的婚礼现场场景。</p>', '阳光之吻仪式堂', '阳光之吻仪式堂具有独特的婚礼景观设计，正面环绕的落地玻璃窗和采光塔让整个仪式堂充满爱的温暖。营造出独一无二的、圣洁的婚礼现场场景。', 1, 1, '2018-06-06 10:47:46', NULL, 0, NULL, '', 0, '{"thumb":"20180606\\/5b174d0fe79b2.jpg","photo":[{"url":"20180606\\/5b174c7ed106c.jpg","alt":"\\u9633\\u5149\\u4e4b\\u543b\\u5ba3\\u4f20\\u4e3b\\u7528\\u56fe\\u7247"},{"url":"20180606\\/5b174c9b4bc76.jpg","alt":"\\u9633\\u5149\\u4e4b\\u543b2"},{"url":"20180606\\/5b174ca25f654.jpg","alt":"\\u9633\\u5149\\u4e4b\\u543b3"},{"url":"20180606\\/5b174caa2ac73.jpg","alt":"\\u9633\\u5149\\u4e4b\\u543b4"}]}', 12, 0, 0, 1, 0, '2018-06-06 10:47:46', '2018-06-06 10:47:46', '北京·太阳公元', '商务', '120', '16米', '5桌', '草坪', NULL, NULL),
(20, 1, '', '', '2018-06-06 13:07:20', '<p style="text-align: center;"><span style="font-size: 20px;"><br/></span></p><p><span style="font-size: 20px;"><br/></span></p><p style="text-align: center;"><span style="font-size: 20px;"><span style="font-size: 20px;"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b91eb4dcc04f.png" title="list-hlcg-banner.png" alt="list-hlcg-banner.png"/></span></span></p><p><span style="font-size: 20px;"></span></p><p style="text-align: center;"><span style="font-size: 20px;"><br/></span></p><p style="text-align: center;"><span style="font-size: 20px;">①活动测试页面，内容无效。</span></p><p style="text-align: center;"><span style="font-size: 20px;"><br/></span></p><p style="text-align: center;"><span style="font-size: 20px;">当日前两对签单的新人赠送两桌星级婚宴；</span></p><p style="text-align: center;"><span style="font-size: 20px;"><br/></span></p><p style="text-align: center;"><span style="font-size: 20px;">②签订2018年淡季档期，赠送价值人民币5000元甜品台一套。</span></p>', '预定2018年婚礼档期，立享婚宴满5桌送1桌！', '预定2018年婚礼档期，立享婚宴满5桌送1桌！', 1, 1, '2018-09-07 00:00:00', NULL, 0, NULL, '', 0, '{"thumb":"20180907\\/5b926d625545d.jpg"}', 26, 0, 0, 0, 0, '2018-09-07 00:00:00', '2018-09-15 00:00:00', '北京·太阳公元', '婚礼', '', '', '', '', '', '');
INSERT INTO `data_posts` (`id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `newarc`, `actstarttime`, `actendtime`, `postadderss`, `type`, `max`, `tinggao`, `zhuoshu`, `tese`, `youhui`, `jiage`) VALUES
(21, 1, '', '', '2018-06-06 16:19:39', '<p>独具风格的穹顶，配有经典复古的水晶吊灯；专为婚礼设计的灯光音响设备，呈现梦幻多彩的光影视听盛宴；可通过主题场景设计，营造华丽浪漫的婚礼氛围；超大弧形60平米P4LED大屏幕，专递真情瞬间。<br/></p>', '心之芳庭', '独具风格的穹顶，配有经典复古的水晶吊灯；专为婚礼设计的灯光音响设备，呈现梦幻多彩的光影视听盛宴；可通过主题场景设计，营造华丽浪漫的婚礼氛围；超大弧形60平米P4LED大屏幕，专递真情瞬间。', 1, 1, '2018-06-06 15:41:45', NULL, 0, NULL, '', 0, '{"thumb":"20180606\\/5b179d40aeb58.jpg","photo":[{"url":"20180606\\/5b179974af394.jpg","alt":"\\u5fc3\\u4e4b\\u82b3\\u5ead\\uff08\\u5ac1\\u7ed9\\u7231\\u60c5\\uff09"}]}', 0, 0, 0, 1, 0, '2018-06-06 15:41:45', '2018-06-06 15:41:45', '北京·太阳公元', '商务', '320', '9', '18', NULL, NULL, NULL),
(22, 1, '', '', '2018-06-06 17:01:14', '<p>在爱情的码头，我将为你筑一个温暖的港湾，净澈平缓的天然湖景，深邃迷人的林萌细路。质朴和谐的市栈 露台，深处在其中，让爱在自由中绽放。</p>', '爱情码头', '在爱情的码头，我将为你筑一个温暖的港湾，净澈平缓的天然湖景，深邃迷人的林萌细路。质朴和谐的市栈 露台，深处在其中，让爱在自由中绽放。', 1, 1, '2018-06-06 16:47:20', NULL, 0, NULL, '', 0, '{"thumb":"20180606\\/5b17a2d26055e.jpg","photo":[{"url":"20180606\\/5b17a2b8007b7.jpg","alt":"\\u5916\\u666f4"}]}', 2, 0, 0, 0, 0, '2018-06-06 16:47:20', '2018-06-06 16:47:20', '北京·太阳公元', '婚礼', '80', '', '4桌', NULL, NULL, NULL),
(23, 1, '', '', '2018-06-06 17:13:25', '<p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180819/5b7861274c207.jpg" style="" title="婚礼版块-北京-天长地久1副本.jpg"/></p><p><br/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180819/5b786127e6c33.jpg" style="" title="婚礼版块-北京-天长地久6副本.jpg"/></p><p><br/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180819/5b7861281c25d.jpeg" style="" title="婚礼版块-北京-天长地久11.jpeg"/></p><p><br/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180819/5b78612852eb2.jpeg" style="" title="婚礼版块-北京-天长地久13.jpeg"/></p><p><br/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180819/5b78612920bce.jpeg" style="" title="婚礼版块-北京-天长地久14.jpeg"/></p><p><br/></p>', '天长地久', '秘境林间，圆形仪式场地，可容纳40-80人，小型婚礼的最佳选择， 坐落于静谧幽深的树间，路树成荫花团锦簇，仪式背景为天然形成的一颗连理树，俗称“在天愿做比翼鸟，在地愿为连理枝”，树缠树绕树，永结同根树。相拥至耋耄，恩爱相不负，寓意两个人的感情缠缠绵绵、长 长久久，更值得一提的是这里因其独特另类的神秘气质，成为许多人举办晚宴派对的首选之地。', 1, 1, '2018-06-06 17:04:21', NULL, 0, NULL, '', 0, '{"thumb":"20180606\\/5b17a5ae9ee07.jpeg"}', 11, 0, 0, 0, 0, '2018-06-06 17:04:21', '2018-06-06 17:04:21', '北京·太阳公元', '商务', '80', '', '4桌', NULL, NULL, NULL),
(24, 1, '', '', '2018-06-06 17:18:18', '<p>在清晨泛着朝霞红光的雾色中，藤蔓缠绕着爱情的连廊，倾诉着绵延不尽的思慕。园中的玫瑰花已绽放，静候着宾客的到来，让这一场爱的盛宴完美无瑕，成为伴随一生的璀璨回忆。爱情如鲜花盛开，活泼、明媚。在一座运用花卉、灌木、乔木立体种植的花园，穿着白纱踏上鲜花簇拥的舞台， 在浪漫的环境下宣誓终身相守的约定，无疑是罗曼蒂克的终极幻想。</p>', '玫瑰花园', '在清晨泛着朝霞红光的雾色中，藤蔓缠绕着爱情的连廊，倾诉着绵延不尽的思慕。园中的玫瑰花 已绽放，静候着宾客的到来，让这一场爱的盛宴完美无瑕，成为伴随一生的璀璨回忆。爱情如鲜花盛开，活泼、明媚。在一座运用花卉、灌木、乔木立体种植的花园，穿着白纱踏上鲜花簇拥的舞台， 在浪漫的环境下宣誓终身相守的约定，无疑是罗曼蒂克的终极幻想。', 1, 1, '2018-06-06 17:14:16', NULL, 0, NULL, '', 0, '{"thumb":"20180606\\/5b17a6d4402c2.jpg","photo":[{"url":"20180606\\/5b17a67f097db.jpg","alt":"\\u5916\\u666f6"},{"url":"20180606\\/5b17a6b4b65f0.jpeg","alt":"WechatIMG57"}]}', 6, 0, 0, 0, 0, '2018-06-06 17:14:16', '2018-06-06 17:14:16', '北京·太阳公元', '婚礼', '150', '', '4桌', NULL, NULL, NULL),
(25, 1, '', '', '2018-06-06 17:22:06', '<p style="text-align: center"><span style="font-size: 18px;">湖光山色，亭台楼阁，古典八角亭，</span></p><p style="text-align: center;"><span style="font-size: 18px;">环绕270度全湖景宴会厅，</span></p><p style="text-align: center;"><span style="font-size: 18px;">谁说爱只在声光电中直行，</span></p><p style="text-align: center;"><span style="font-size: 18px;">蜿蜒的流转让爱更显自然的荡气回肠，</span></p><p style="text-align: center;"><span style="font-size: 18px;">让金风玉露、葳蕤草木来为你证婚。</span></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180819/5b78603bcec06.jpg" style="" title="婚礼版块-北京-水云间1（头图）副本.jpg"/></p><p style="text-align: center"><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180819/5b78603e4252f.jpg" style="" title="婚礼版块-北京-水云间3副本.jpg"/></p><p style="text-align: center"><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180819/5b78603f800c6.jpg" style="" title="婚礼版块-北京-水云间2副本.jpg"/></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b86a9bda51ae.jpg" title="婚礼版块-北京-水云间4.jpg" alt="婚礼版块-北京-水云间4.jpg"/></p>', '水云间', '湖光山色，亭台楼阁，古典八角亭，环绕270度全湖景宴会厅，谁说爱只在声光电中直行，蜿蜒的流转让爱更显自然的荡气回肠，让金风玉露、葳蕤草木来为你证婚。', 1, 1, '2018-06-06 17:19:24', NULL, 0, NULL, '', 0, '{"thumb":"20180827\\/5b8387eec474e.jpg","photo":[{"url":"20180608\\/5b1a22fe01c18.jpg","alt":"\\u5a5a\\u793c\\u7248\\u5757-\\u5317\\u4eac-\\u6c34\\u4e91\\u95f41\\uff08\\u5934\\u56fe\\uff09\\u526f\\u672c"}]}', 26, 0, 0, 0, 0, '2018-06-06 17:19:24', '2018-06-06 17:19:24', '北京·太阳公元', '商务', '130', '16米', '5桌', '270度全湖景', '2018年档期免收服务费', '10000元'),
(26, 1, '', '', '2018-06-08 15:01:27', '<p style="text-align: center; margin-bottom: 0px; line-height: normal;"><span style="font-size: 18px;">洁白的雕栏设计空间，</span></p><p style="margin-bottom: 0px; line-height: normal; text-align: center;"><span style="font-size: 18px;">兼具传统与现代，高雅与浪漫，华丽与婉约，</span></p><p style="margin-bottom: 0px; line-height: normal; text-align: center;"><span style="font-size: 18px;">百万级灯光音响，呈现梦幻多彩的光影视听盛宴，</span></p><p style="margin-bottom: 0px; line-height: normal; text-align: center;"><span style="font-size: 18px;">厅内舞台双侧LED屏幕更方便随心表现新人的爱情故事，</span></p><p style="margin-bottom: 0px; line-height: normal; text-align: center;"><span style="font-size: 18px;">主题场景设计，营造极致唯美的婚礼氛围。</span></p><p style="margin-bottom: 0px; line-height: normal;"><strong><span style="font-size: 18px;"><br/></span></strong></p><p style="margin-bottom: 0px; line-height: normal;"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180819/5b7853dbe7cd6.jpg" title="婚礼版块-北京-幸福时光4副本.jpg"/> </p><p style="text-align: center;"><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180819/5b7853dce9ff0.jpg" style="" title="婚礼版块-北京-幸福时光1（头图）副本.jpg"/> </p><p style="text-align: center;"><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180819/5b7853de0aba2.jpg" style="" title="婚礼版块-北京-幸福时光3副本.jpg"/> </p><p><br/> </p>', '幸福时光', '洁白的雕栏设计空间，兼具传统与现代，高雅与浪漫，华丽与婉约，百万级灯光音响，呈现梦幻多彩的光影视听盛宴，厅内舞台双侧LED屏幕更方便随心表现新人的爱情故事，主题场景设计，营造极致唯美的婚礼氛围。', 1, 1, '2018-06-08 14:33:46', NULL, 0, NULL, '', 0, '{"thumb":"20180827\\/5b83876ac51a2.jpg"}', 43, 0, 0, 0, 0, '2018-06-08 14:33:46', '2018-06-08 14:33:46', '北京·太阳公元', '商务', '180', '8米', '10桌', 'P3 LED屏', '2018年档期免收服务费', '25000元'),
(27, 1, '', '', '2018-06-08 15:09:04', '<p style="text-align: center;"><span style="font-size: 18px;">经典的法师宫廷设计，</span></p><p style="text-align: center;"><span style="font-size: 18px;">高达通透的宴会空间;独居风格的穹顶，</span></p><p style="text-align: center;"><span style="font-size: 18px;">配有经典复古的水晶吊顶；</span></p><p style="text-align: center;"><span style="font-size: 18px;">百万级灯光音响，</span></p><p style="text-align: center;"><span style="font-size: 18px;">呈现梦幻多彩的光影视听盛宴，</span></p><p style="text-align: center;"><span style="font-size: 18px;">主题场景设计，</span></p><p style="text-align: center;"><span style="font-size: 18px;">营造华丽浪漫的婚礼氛围；</span></p><p style="text-align: center;"><span style="font-size: 18px;">超大弧形LED大屏幕，</span></p><p style="text-align: center;"><span style="font-size: 18px;">传递真情瞬间。</span><br/></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b860afb3a125.jpg" title="婚礼版块-北京-心之芳庭1（头图）.jpg" alt="婚礼版块-北京-心之芳庭1（头图）.jpg"/></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b860b07511ff.jpg" title="婚礼版块-北京-心之芳庭2.jpg" alt="婚礼版块-北京-心之芳庭2.jpg"/></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b860b1286de9.jpg" title="婚礼版块-北京-心之芳庭3.jpg" alt="婚礼版块-北京-心之芳庭3.jpg"/></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b860b245d5b8.jpg" title="婚礼版块-北京-心之芳庭4.jpg" alt="婚礼版块-北京-心之芳庭4.jpg"/></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b860b434c993.jpg" title="婚礼版块-北京-心之芳庭5.jpg" alt="婚礼版块-北京-心之芳庭5.jpg"/></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b860b522054e.jpg" title="婚礼版块-北京-心之芳庭6.jpg" alt="婚礼版块-北京-心之芳庭6.jpg"/></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b860b663abec.jpg" title="婚礼版块-北京-心之芳庭7.jpg" alt="婚礼版块-北京-心之芳庭7.jpg"/></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b860b7c03c88.jpg" title="婚礼版块-北京-心之芳庭8.jpg" alt="婚礼版块-北京-心之芳庭8.jpg"/></p>', '心之芳庭', '经典的法师宫廷设计，高达通透的宴会空间;独居风格的穹顶，配有经典复古的水晶吊顶；百万级灯光音响，呈现梦幻多彩的光影视听盛宴，主题场景设计，营造华丽浪漫的婚礼氛围；超大弧形LED大屏幕，传递真情瞬间。', 1, 1, '2018-06-08 15:02:01', NULL, 0, NULL, '', 0, '{"thumb":"20180829\\/5b860b8d3c401.jpg"}', 52, 0, 0, 0, 0, '2018-06-08 15:02:01', '2018-06-08 15:02:01', '北京·太阳公元', '商务', '380', '9米', '18桌', '大厅  无柱  穹顶', '2018年档期免收服务费', '35000元'),
(28, 1, '', '', '2018-06-08 15:17:13', '<p style="text-align: center;"><span style="font-size: 18px;">360度全透明婚礼仪式堂，</span></p><p style="text-align: center;"><span style="font-size: 18px;">四面环绕的落地玻璃花窗和采光塔让整个仪式充满温暖的爱意。</span></p><p style="text-align: center;"><span style="font-size: 18px;">浪漫唯美的婚礼景观与极具创意的空间布局，</span></p><p style="text-align: center;"><span style="font-size: 18px;">营造出独一无二的、坚贞圣洁的婚礼现场气氛。</span></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180819/5b785ceec288c.jpg" title="婚礼版块-北京-阳光之吻1（头图）.jpg"/> <br/></p><p style="text-align: center"><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180819/5b785cefc738c.jpg" style="" title="婚礼版块-北京-阳光之吻2.jpg"/></p><p style="text-align: center"><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180819/5b785cf065b62.jpg" style="" title="婚礼版块-北京-阳光之吻3.jpg"/></p><p style="text-align: center;"><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180819/5b785cf09493d.jpg" style="" title="婚礼版块-北京-阳光之吻5副本.jpg"/></p>', '阳光之吻', '360度全透明婚礼仪式堂，四面环绕的落地玻璃花窗和采光塔让整个仪式充满温暖的爱意。浪漫唯美的婚礼景观与极具创意的空间布局，营造出独一无二的、坚贞圣洁的婚礼现场气氛。', 1, 1, '2018-06-08 15:12:42', NULL, 0, NULL, '', 0, '{"thumb":"20180608\\/5b1a2d746b512.jpg"}', 82, 0, 0, 0, 0, '2018-06-08 15:12:42', '2018-06-08 15:12:42', '北京·太阳公元', '商务', '150', '16米', '5桌', '360度景观婚礼仪式堂', '2018年档期场租7折优惠', '29800元'),
(29, 1, '', '', '2018-06-08 15:38:50', '<p style="text-align: center;"><span style="font-size: 18px;">玫瑰里·北京太阳公元拥有北京唯一的 360°景观殿堂:阳光殿堂，</span></p><p style="text-align: center;"><span style="font-size: 18px;">四面环绕的落地 玻璃花窗和采光塔让整个仪式充满温暖氛围。 <br/></span></p><p style="text-align: center;"><span style="font-size: 18px;">唯美的天然景观与极具创意的空间布局，</span></p><p style="text-align: center;"><span style="font-size: 18px;">营造 出独一无二的商务活动现场氛围。</span></p><p><span style="font-size: 18px;"><br/></span></p><p><span style="font-size: 18px;"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b86ab6218db9.jpg" title="婚礼版块-北京-阳光之吻1（头图）.jpg" alt="婚礼版块-北京-阳光之吻1（头图）.jpg"/></span></p><p><span style="font-size: 18px;"><br/></span></p><p><span style="font-size: 18px;"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b86ab7b6f413.jpg" title="婚礼版块-北京-阳光之吻2.jpg" alt="婚礼版块-北京-阳光之吻2.jpg"/></span></p><p><span style="font-size: 18px;"><br/></span></p><p><span style="font-size: 18px;"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b86ab9443364.jpg" title="婚礼版块-北京-阳光之吻3.jpg" alt="婚礼版块-北京-阳光之吻3.jpg"/></span></p><p><span style="font-size: 18px;"><br/></span></p><p><span style="font-size: 18px;"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b86aba9d6b3e.jpg" title="婚礼版块-北京-阳光之吻4.jpg" alt="婚礼版块-北京-阳光之吻4.jpg"/><br/></span></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b86abc39da17.jpg" title="婚礼版块-北京-阳光之吻5.jpg" alt="婚礼版块-北京-阳光之吻5.jpg"/><span style="font-size: 18px;"></span></p>', '阳光殿堂', '玫瑰里·北京太阳公元拥有北京唯一的 360°景观殿堂:阳光殿堂，四面环绕的落地 玻璃花窗和采光塔让整个仪式充满温暖氛围。 唯美的天然景观与极具创意的空间布局，营造 出独一无二的商务活动现场氛围。', 1, 1, '2018-06-08 15:33:20', NULL, 0, NULL, '', 0, '{"thumb":"20180608\\/5b1a328334753.jpg","photo":[{"url":"20180608\\/5b1a3276aa31a.jpg","alt":"\\u5a5a\\u793c\\u7248\\u5757-\\u5317\\u4eac-\\u9633\\u5149\\u4e4b\\u543b1\\uff08\\u5934\\u56fe\\uff09"}]}', 24, 0, 0, 0, 0, '2018-06-08 15:33:20', '2018-06-08 15:33:20', '北京·太阳公元', '商务', '150', '16米', '5桌', '360度全景观宴会厅', '2018年档期免收服务费', '30000元'),
(32, 1, '', '', '2018-08-21 11:00:24', '<p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180821/5b7b803a950c5.jpg" title="1-1F505100641137.jpg" alt="1-1F505100641137.jpg"/></p>', '测试', '测试显示问题', 1, 1, '2018-08-21 10:59:29', NULL, 0, NULL, '', 0, '{"thumb":""}', 0, 0, 0, 0, 0, '2018-08-21 10:59:29', '2018-08-21 10:59:29', NULL, '婚礼', '', '', '', '', '', ''),
(33, 1, '', '', '2018-08-21 11:02:32', '<p>测试问题显示<img src="http://www.lavin.com.cn/data/upload/ueditor/20180821/5b7b80bf56307.jpg" title="1-1F505100641137.jpg" alt="1-1F505100641137.jpg"/></p>', '测试', '测试显示问题11', 1, 1, '2018-08-21 11:01:41', NULL, 0, NULL, '', 0, '{"thumb":"20180821\\/5b7b81aa96cf7.jpg"}', 0, 0, 0, 0, 0, '2018-08-21 11:01:41', '2018-08-21 11:01:41', '上海·外滩', '商务', '', '', '', '', '', ''),
(30, 1, '', '', '2018-08-20 09:36:33', '<p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180820/5b7a1b08e1de1.jpg" style="" title="时光厅-1（头图）.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180820/5b7a1b09495f7.jpg" style="" title="时光厅-3副本.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180820/5b7a1b09a44d0.jpg" style="" title="时光厅-2副本.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180820/5b7a1b0bc6e9e.jpg" style="" title="时光厅-7副本.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180820/5b7a1b0d2d092.jpg" style="" title="时光厅-4副本.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180820/5b7a1b0e3306e.jpg" style="" title="时光厅-6副本.jpg"/></p><p><br/></p>', '时光仪式堂', '在神圣庄严的爱情殿堂前宣誓携手一生，270°环幕缔造浪漫非凡的世界，置身其中，生动，忘我。旧时光铺陈如昨，新时光如幻似梦。在最炫目最圣洁的世界里，牵手相约，许诺今生。', 1, 1, '2018-08-20 09:23:59', NULL, 0, NULL, '', 0, '{"thumb":""}', 1, 0, 0, 0, 0, '2018-08-20 09:23:59', '2018-08-20 09:23:59', NULL, '婚礼', '120人', '5米', '3', '仪式堂', '无', '20000元'),
(31, 1, '', '', '2018-08-20 09:45:54', '', '时光厅', '时光厅', 1, 1, '2018-08-20 09:43:14', NULL, 0, NULL, '', 0, '{"thumb":"20180820\\/5b7a1d4a4d204.jpg"}', 7, 0, 0, 0, 0, '2018-08-20 09:43:14', '2018-08-20 09:43:14', NULL, '婚礼', '120人', '5米', '3桌', '仪式堂', '无', '20000'),
(34, 1, '', '', '2018-08-21 11:02:55', '<p>测试问题显示<img src="http://www.lavin.com.cn/data/upload/ueditor/20180821/5b7b80bf56307.jpg" title="1-1F505100641137.jpg" alt="1-1F505100641137.jpg"/></p>', '测试', '测试显示问题11', 1, 1, '2018-08-21 11:01:41', NULL, 0, NULL, '', 0, '{"thumb":"20180821\\/5b7b80d2625f8.jpg"}', 0, 0, 0, 0, 0, '2018-08-21 11:01:41', '2018-08-21 11:01:41', NULL, '婚礼', '', '', '', '', '', ''),
(35, 1, '', '', '2018-08-21 11:08:33', '<p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180821/5b7b822e4d7c0.jpg" title="1-1F505100P2359.jpg" alt="1-1F505100P2359.jpg"/></p>', '测试2', '测试2', 1, 1, '2018-08-21 11:07:08', NULL, 0, NULL, '', 0, '{"thumb":"20180821\\/5b7b82206866b.jpg"}', 0, 0, 0, 0, 0, '2018-08-21 11:07:08', '2018-08-21 11:07:08', NULL, '婚礼', '', '', '', '', '', ''),
(36, 1, '', '', '2018-08-21 11:13:02', '<p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180821/5b7b831b4f917.jpg" title="1-1F41G53I4c7.jpg" alt="1-1F41G53I4c7.jpg"/></p>', '测试上海页面展示问题', '测试', 1, 1, '2018-08-21 11:11:18', NULL, 0, NULL, '', 0, '{"thumb":"20180821\\/5b7b82e71985c.jpg"}', 0, 0, 0, 0, 0, '2018-08-21 11:11:18', '2018-08-21 11:11:18', '上海·外滩', '商务', '', '', '', '', '', ''),
(37, 1, '', '', '2018-08-21 13:49:07', '<p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180821/5b7ba7d0d3252.jpg" title="1-1F505100P2359.jpg" alt="1-1F505100P2359.jpg"/></p>', '测试2222', '2222', 1, 1, '2018-08-21 13:48:32', NULL, 0, NULL, '', 0, '{"thumb":"20180821\\/5b7ba7c202ba8.jpg"}', 0, 0, 0, 0, 0, '2018-08-21 13:48:32', '2018-08-21 13:48:32', NULL, '商务', '', '', '', '', '', ''),
(38, 1, '', '', '2018-08-21 13:52:58', '<p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180821/5b7ba8b217b85.jpg" title="1-1F505100P2359.jpg" alt="1-1F505100P2359.jpg"/></p>', '222测试', '测试222', 1, 1, '2018-08-21 13:52:23', NULL, 0, NULL, '', 0, '{"thumb":"20180821\\/5b7ba8b6b9695.jpg"}', 0, 0, 0, 0, 0, '2018-08-21 13:52:23', '2018-08-21 13:52:23', NULL, '商务', '', '', '', '', '', ''),
(39, 1, '', '', '2018-08-21 14:01:22', '<p><span style="font-size: 18px;">周冬雨代言伊利优酸乳“果果昔”，出席新品发布会。</span></p>', '伊利优酸乳“果果昔”新品发布会', '周冬雨代言伊利优酸乳“果果昔”，出席新品发布会。', 1, 1, '2018-08-21 14:00:06', NULL, 0, NULL, '', 0, '{"thumb":"20180907\\/5b92323bc5027.jpeg","photo":[{"url":"20180907\\/5b9225ef1d6f3.jpg","alt":"\\u5468\\u51ac\\u96e82"},{"url":"20180907\\/5b9225fc17eab.jpg","alt":"WechatIMG130"},{"url":"20180907\\/5b92260cd3c01.jpg","alt":"WechatIMG131"},{"url":"20180907\\/5b9226141499a.jpg","alt":"WechatIMG132"},{"url":"20180907\\/5b92261e987d5.jpg","alt":"\\u5468\\u51ac\\u96e83"},{"url":"20180907\\/5b922629dfa82.jpg","alt":"\\u5468\\u51ac\\u96e8"}]}', 11, 0, 0, 0, 0, '2018-08-21 14:00:06', '2018-08-21 14:00:06', '上海·外滩', '商务', '', '', '', '', '', ''),
(40, 1, '', '', '2018-08-21 14:05:27', '', '测试2', '2', 1, 1, '2018-08-21 14:04:49', NULL, 0, NULL, '', 0, '{"thumb":"20180821\\/5b7baba1d4135.jpg"}', 5, 0, 0, 0, 0, '2018-08-21 14:04:49', '2018-08-21 14:04:49', NULL, '商务', '', '', '', '', '', ''),
(41, 1, '', '', '2018-08-21 15:22:38', '<p><br/></p><p><br/></p><p style="text-align: center;"><span style="font-size: 18px;">沐浴在360度阳光殿堂</span></p><p style="text-align: center;"><span style="font-size: 18px;">许下你我最温暖的承诺</span></p><p style="text-align: center;"><span style="font-size: 18px;">站在上海最高的爱情钟楼</span></p><p style="text-align: center;"><span style="font-size: 18px;">让幸福的声音随时间久长</span></p><p style="text-align: center;"><span style="font-size: 18px;">用最晶莹剔透的色彩扮靓我们的婚礼</span></p><p style="text-align: center;"><span style="font-size: 18px;">用最纯洁无暇的气息表达我们的爱意</span></p><p style="text-align: center;"><span style="font-size: 18px;">你问永远有多远？我用一生回答你</span></p><p><br/></p>', '拥抱美好', '美人在怀，柔荑在握，你需要的只是敞开双臂，拥抱这份纯贞的美好~', 1, 1, '2018-08-21 15:18:29', NULL, 0, NULL, '', 0, '{"thumb":"20180821\\/5b7bbd0649e21.jpg","photo":[{"url":"20180821\\/5b7bbd5a7d542.jpg","alt":"20160910-123"},{"url":"20180821\\/5b7bbe554c369.jpg","alt":"20160910-39"},{"url":"20180821\\/5b7bbe8b1ac83.jpg","alt":"20160910-43"},{"url":"20180821\\/5b7bbead22d5c.jpg","alt":"20160910-44"},{"url":"20180821\\/5b7bbec029ccd.jpg","alt":"20160910-41"},{"url":"20180821\\/5b7bbf326bd3d.jpg","alt":"20160910-63"}]}', 46, 0, 0, 0, 0, '2018-08-21 15:18:29', '2018-08-21 15:18:29', '北京·太阳公元', '商务', '', '', '', '', '', ''),
(42, 1, '', '', '2018-08-21 16:46:48', '<p style="text-align: center;"><video class="edui-upload-video  vjs-default-skin  video-js" controls="" preload="none" width="640" height="480" src="http://www.lavin.com.cn/data/upload/ueditor/20180821/5b7bd14630332.mp4" data-setup="{}"><source src="http://www.lavin.com.cn/data/upload/ueditor/20180821/5b7bd14630332.mp4" type="video/mp4"/></video></p>', '繁华入梦', '繁华入梦', 1, 1, '2018-08-21 16:45:26', NULL, 0, NULL, '', 0, '{"thumb":"20180821\\/5b7bd135f0f8c.png"}', 39, 0, 0, 0, 0, '2018-08-21 16:45:26', '2018-08-21 16:45:26', '北京·太阳公元', '商务', '', '', '', '', '', ''),
(43, 1, '', '', '2018-08-21 20:51:03', '<p>111</p>', 'qq', '1', 1, 1, '2018-08-21 20:50:06', NULL, 0, NULL, '', 0, '{"thumb":""}', 0, 0, 0, 0, 0, '2018-08-21 20:50:06', '2018-08-21 20:50:06', '上海·外滩', '婚礼', '', '', '', '', '', ''),
(44, 1, '', '', '2018-08-21 21:10:06', '<p>1</p>', '123', '1', 1, 1, '2018-08-21 21:09:22', NULL, 0, NULL, '', 0, '{"thumb":""}', 0, 0, 0, 0, 0, '2018-08-21 21:09:22', '2018-08-21 21:09:22', '上海·外滩', '婚礼', '', '', '', '', '', ''),
(45, 1, '', '', '2018-08-21 21:12:27', '<p>111</p>', '122444', '1', 1, 1, '2018-08-21 21:12:08', NULL, 0, NULL, '', 0, '{"thumb":""}', 0, 0, 0, 0, 0, '2018-08-21 21:12:08', '2018-08-21 21:12:08', '上海·外滩', '婚礼', '', '', '', '', '', ''),
(46, 1, '', '', '2018-08-27 12:59:01', '<p>测试</p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180827/5b83850474075.png" title="高级培训.png" alt="高级培训.png"/></p>', '测试', '测试', 1, 1, '2018-08-27 12:56:22', NULL, 0, NULL, '', 0, '{"thumb":""}', 0, 0, 0, 0, 0, '2018-08-27 12:56:22', '2018-08-27 12:56:22', '上海·外滩', '商务', '', '', '', '', '', ''),
(47, 1, '', '', '2018-08-27 13:22:20', '<p style="text-align: center;"><span style="font-size: 18px;">经典法式宫殿设计，</span></p><p style="text-align: center;"><span style="font-size: 18px;">高大通透的宴会空间，</span></p><p style="text-align: center;"><span style="font-size: 18px;"> 独具风格的挑高穹顶，</span></p><p style="text-align: center;"><span style="font-size: 18px;">配有经典复古的水晶 吊灯。</span></p><p style="text-align: center;"><span style="font-size: 18px;">百万级定光音响设备，</span></p><p style="text-align: center;"><span style="font-size: 18px;">呈现梦幻多彩 的光影视听盛宴。</span></p><p style="text-align: center;"><span style="font-size: 18px;">超大弧形 LED 大屏幕，</span></p><p style="text-align: center;"><span style="font-size: 18px;"> 丰富商务活动立体体验。<br/></span></p><p><br/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b914cfecff32.jpg" style="" title="WechatIMG39.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b914cff519b4.jpg" style="" title="WechatIMG40.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b914d0052ab7.jpg" style="" title="WechatIMG38.jpg"/></p><p><br/></p><p><br/></p><p><br/></p>', '心之芳庭', '经典法式宫殿设计，高大通透的宴会空间，独具风格的挑高穹顶，配有经典复古的水晶吊灯。百万级定光音响设备，呈现梦幻多彩的光影视听盛宴。超大弧形LED大屏幕，丰富商务活动立体体验。', 1, 1, '2018-08-27 13:19:06', NULL, 0, NULL, '', 0, '{"thumb":"20180906\\/5b914c3b9bce1.jpg"}', 20, 0, 0, 0, 0, '2018-08-27 13:19:06', '2018-08-27 13:19:06', '北京·太阳公元', '商务', '380', '9米', '18桌', '大厅无柱  P3LED屏', '2018年档期免收服务费', '85000元'),
(48, 1, '', '', '2018-08-27 13:32:06', '<p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180827/5b838cc8813a1.png" title="大匠传承.png" alt="大匠传承.png"/><img src="http://www.lavin.com.cn/data/upload/ueditor/20180827/5b838ccd797c1.png" title="高级培训.png" alt="高级培训.png"/></p>', 'ces ', 'ces', 1, 1, '2018-08-27 13:30:59', NULL, 0, NULL, '', 0, '{"thumb":"20180827\\/5b838cb4c537f.JPG"}', 0, 0, 0, 0, 0, '2018-08-27 13:30:59', '2018-08-27 13:30:59', '北京·太阳公元', '商务', '', '', '', '', '', ''),
(49, 1, '', '', '2018-08-27 13:34:00', '<p style="text-align: center;"><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b86099531fff.jpg" title="婚礼版块-北京-天长地久1.jpg" alt="婚礼版块-北京-天长地久1.jpg"/></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b86099a67d2c.jpg" title="婚礼版块-北京-天长地久2.jpg" alt="婚礼版块-北京-天长地久2.jpg"/></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b8609a39bb1e.jpg" title="婚礼版块-北京-天长地久3.jpg" alt="婚礼版块-北京-天长地久3.jpg"/></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b8609a8b7466.jpg" title="婚礼版块-北京-天长地久4.jpg" alt="婚礼版块-北京-天长地久4.jpg"/></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b8609b9c4719.jpg" title="婚礼版块-北京-天长地久6.jpg" alt="婚礼版块-北京-天长地久6.jpg"/></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b8609c0b6a71.jpg" title="婚礼版块-北京-天长地久7.jpg" alt="婚礼版块-北京-天长地久7.jpg"/></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b8609e8a382d.jpg" title="婚礼版块-北京-天长地久9.jpg" alt="婚礼版块-北京-天长地久9.jpg"/></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b8609ed39ce1.jpg" title="婚礼版块-北京-天长地久10.jpg" alt="婚礼版块-北京-天长地久10.jpg"/></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b8609fa437dd.jpg" title="婚礼版块-北京-天长地久11.jpg" alt="婚礼版块-北京-天长地久11.jpg"/></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b860a0e8a0b3.jpg" title="婚礼版块-北京-天长地久13.jpg" alt="婚礼版块-北京-天长地久13.jpg"/><br/></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b860a1708050.jpg" title="婚礼版块-北京-天长地久14.jpg" alt="婚礼版块-北京-天长地久14.jpg"/></p>', '天长地久', '我们相遇在双方最美丽的年华里，这一刻你未娶，我未嫁，并一见倾心，当恍惚的记忆遗落在时光中，让我们在这里把梦精心收留，当阳光缓缓地撒进这里，在这处听着风声都可以做梦的所在，天地为证，以爱之名，我们慎重地许下一生一世的绮愿，开启我们的新生。', 1, 1, '2018-08-27 13:31:30', NULL, 0, NULL, '', 0, '{"thumb":"20180827\\/5b838d33c9762.jpg"}', 35, 0, 0, 0, 0, '2018-08-27 13:31:30', '2018-08-27 13:31:30', '北京·太阳公元', '婚礼', '80', '户外', '5桌', '户外仪式  晚间婚礼', '2018年档期免收服务费', '9999元'),
(50, 1, '', '', '2018-08-29 09:47:27', '<p style="text-align: center;"><br/></p><p style="text-align: center;"><span style="font-size: 18px;">日月星空，浩瀚宇宙，</span></p><p style="text-align: center;"><span style="font-size: 18px;">BAZAAR独特的跃层空间结构，</span></p><p style="text-align: center;"><span style="font-size: 18px;">结合剧院式的舞台艺术设计，</span></p><p style="text-align: center;"><span style="font-size: 18px;">将引领婚尚艺术潮流，</span></p><p style="text-align: center;"><span style="font-size: 18px;">近十米的挑高空间，</span></p><p style="text-align: center;"><span style="font-size: 18px;">直径1500mm的升降舞台，</span></p><p style="text-align: center;"><span style="font-size: 18px;">充满艺术气息的异形LED屏幕，</span></p><p style="text-align: center;"><span style="font-size: 18px;">为婚礼创造一种更具生动活泼的立体呈现效果，</span></p><p style="text-align: center;"><span style="font-size: 18px;">增添更多的婚礼想象空间。</span></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b8600e159790.jpg" title="BAZZAR-1.jpg" alt="BAZZAR-1.jpg"/></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b8600eb512d4.jpg" title="BAZZAR-2.jpg" alt="BAZZAR-2.jpg"/></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b8600f59789a.jpg" title="BAZZAR-3.jpg" alt="BAZZAR-3.jpg"/></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b8600fbddb72.jpg" title="BAZZAR-4.jpg" alt="BAZZAR-4.jpg"/></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b86010144679.jpg" title="BAZZAR-5.jpg" alt="BAZZAR-5.jpg"/></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b860109a58d8.jpg" title="BAZZAR-6.jpg" alt="BAZZAR-6.jpg"/></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b8601102556e.jpg" title="BAZZAR-7.jpg" alt="BAZZAR-7.jpg"/></p>', 'BAZZAR', '日月星空，浩瀚宇宙，BAZAAR独特的跃层空间结构，结合剧院式的舞台艺术设计，将引领婚尚艺术潮流，近十米的挑高空间，直径1500mm的升降舞台，充满艺术气息的异形LED屏幕，为婚礼创造一种更具生动活泼的立体呈现效果，增添更多的婚礼想象空间。', 1, 1, '2018-08-29 09:43:35', NULL, 0, NULL, '', 0, '{"thumb":"20180829\\/5b85fb2703a94.jpg"}', 8, 0, 0, 0, 0, '2018-08-29 09:43:35', '2018-08-29 09:43:35', '上海·外滩', '婚礼', '280', '10米', '15桌', '拥有全上海最大100平LED屏，奥运级别舞美灯光音效。', '2018年档期免收服务费', '5388元/桌'),
(51, 1, '', '', '2018-08-29 10:16:17', '<p style="text-align: center;"><br/></p><p style="text-align: center;"><span style="font-size: 18px;">360°高科技全景环投与梦幻的穹顶星空幕交相辉映，</span></p><p style="text-align: center;"><span style="font-size: 18px;">配合着奥运级的灯光音效变换，</span></p><p style="text-align: center;"><span style="font-size: 18px;">升降式吊篮同样会为婚礼的创意形式带来更多惊艳的视觉效果。</span></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b86019fd30d6.jpg" title="COSMO-1.jpg" alt="COSMO-1.jpg"/></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b8601a71d4c4.jpg" title="COSMO-2.jpg" alt="COSMO-2.jpg"/></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b8601b07b968.jpg" title="COSMO-3.jpg" alt="COSMO-3.jpg"/></p><p><br/></p>', 'COSMO', '360°高科技全景环投与梦幻的穹顶星空幕交相辉映，配合着奥运级的灯光音效变换，升降式吊篮同样会为婚礼的创意形式带来更多惊艳的视觉效果。', 1, 1, '2018-08-29 10:14:06', NULL, 0, NULL, '', 0, '{"thumb":"20180829\\/5b8601dc69237.jpg"}', 5, 0, 0, 0, 0, '2018-08-29 10:14:06', '2018-08-29 10:14:06', '上海·外滩', '婚礼', '180', '10米', '5桌', '360度环幕', '2018年档期免收服务费', '5388元/桌'),
(52, 1, '', '', '2018-08-29 10:24:06', '<p style="text-align: center;"><br/></p><p style="text-align: center;"><span style="font-size: 18px;">是谁惊艳了你的时光？</span></p><p style="text-align: center;"><span style="font-size: 18px;">是谁温柔了你的岁月，</span></p><p style="text-align: center;"><span style="font-size: 18px;">在神圣庄严的爱情殿堂前宣誓携手一生，</span></p><p style="text-align: center;"><span style="font-size: 18px;">270°环幕缔造浪漫非凡的世界，</span></p><p style="text-align: center;"><span style="font-size: 18px;">置身其中，生动，忘我。</span></p><p style="text-align: center;"><span style="font-size: 18px;">旧时光铺陈如昨，</span></p><p style="text-align: center;"><span style="font-size: 18px;">新时光如幻似梦。</span></p><p style="text-align: center;"><span style="font-size: 18px;">在最炫目最圣洁的世界里，</span></p><p style="text-align: center;"><span style="font-size: 18px;">牵手相约，许诺今生。</span></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b860378b2fd1.jpg" title="时光厅-1（头图）.jpg" alt="时光厅-1（头图）.jpg"/></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b860380e1480.jpg" title="时光厅-2.jpg" alt="时光厅-2.jpg"/></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b86038d5de3a.jpg" title="时光厅-3.jpg" alt="时光厅-3.jpg"/></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b860399aedea.jpg" title="时光厅-6.jpg" alt="时光厅-6.jpg"/></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b8603aa72390.jpg" title="时光厅-7.jpg" alt="时光厅-7.jpg"/></p>', '时光仪式堂', '是谁惊艳了你的时光？是谁温柔了你的岁月，在神圣庄严的爱情殿堂前宣誓携手一生，270°环幕缔造浪漫非凡的世界，置身其中，生动，忘我。旧时光铺陈如昨，新时光如幻似梦。在最炫目最圣洁的世界里，牵手相约，许诺今生。', 1, 1, '2018-08-29 10:20:46', NULL, 0, NULL, '', 0, '{"thumb":"20180829\\/5b8606e6c69e1.jpg"}', 4, 0, 0, 0, 0, '2018-08-29 10:20:46', '2018-08-29 10:20:46', '上海·外滩', '婚礼', '30', '5米', '1桌', '270度环幕', '2018年档期免收服务费', '5388元/桌'),
(53, 1, '', '', '2018-08-29 10:39:15', '<p style="text-align: center;"><span style="font-size: 18px;">户外欧式田园森系风格，</span></p><p style="text-align: center;"><span style="font-size: 18px;">轻松惬意的气氛，</span></p><p style="text-align: center;"><span style="font-size: 18px;">舞美灯光音效俱全，</span></p><p style="text-align: center;"><span style="font-size: 18px;">黄浦江畔1500多平方户外草坪，</span></p><p style="text-align: center;"><span style="font-size: 18px;">无尽享受尽在玫瑰里。</span></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b860744543d1.jpg" title="户外仪式区.jpg" alt="户外仪式区.jpg"/></p>', '情定钟声', '户外欧式田园森系风格，轻松惬意的气氛，舞美灯光音效俱全，黄浦江畔1500多平方户外草坪，无尽享受尽在玫瑰里。', 1, 1, '2018-08-29 10:38:16', NULL, 0, NULL, '', 0, '{"thumb":"20180829\\/5b86074d65572.jpg"}', 10, 0, 0, 0, 0, '2018-08-29 10:38:16', '2018-08-29 10:38:16', '上海·外滩', '婚礼', '50', '户外仪式区', '5桌', '草坪婚礼', '2018年档期免收服务费', '20000元'),
(54, 1, '', '', '2018-08-29 11:02:17', '<p style="text-align: center;"><br/></p><p style="text-align: center;"><span style="font-size: 18px;">当爱情发生时<br/>记得抬头看看<br/>在浩瀚无垠天空中找到最亮的星<br/>许下愿望<br/>Will you marry me？</span></p><p><span style="font-size: 18px;"><br/></span></p><p style="text-align: center;"><span style="font-size: 18px;">480平米宴会厅，挑高八米。</span></p><p style="text-align: center;"><span style="font-size: 18px;">符合国际五星酒店装修布局。</span></p><p style="text-align: center;"><span style="font-size: 18px;">并设有专为婚礼打造的AVLC声光电设备。</span></p><p style="text-align: center;"><span style="font-size: 18px;">40平米LED大屏，顶部92组舞美灯光设计。</span></p><p style="text-align: center;"><span style="font-size: 18px;">专家级VJ灯光师会为您的婚礼打造出更动人心弦的仪式效果。</span></p><p style="text-align: center;"><span style="font-size: 18px;">每个宴会大厅均配有65平米专属新娘化妆间，欧式简约设计。</span></p><p style="text-align: center;"><span style="font-size: 18px;">明星梳妆台、落地更衣镜圆您期待已久的公主梦。</span><br/></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b860d2b95db1.jpg" title="2016-09-18 141550.jpg" alt="2016-09-18 141550.jpg"/></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b860d3422a2d.jpg" title="2016-09-18 142752.jpg" alt="2016-09-18 142752.jpg"/></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b860d3e65e12.jpg" title="2016-10-07 145332.jpg" alt="2016-10-07 145332.jpg"/></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b860d4cc8ed2.jpg" title="2016-10-07 150137.jpg" alt="2016-10-07 150137.jpg"/></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b860d5250d99.jpg" title="2016-10-07 151043.jpg" alt="2016-10-07 151043.jpg"/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b860d5a2bbcb.jpg" title="2017-03-11 132609.jpg" alt="2017-03-11 132609.jpg"/></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b860d61606eb.jpg" title="2017-06-18 145320.jpg" alt="2017-06-18 145320.jpg"/></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b860d6a7c770.jpg" title="2017-06-18 150034.jpg" alt="2017-06-18 150034.jpg"/></p>', '天空之城', '480平米宴会厅，挑高八米。符合国际五星酒店装修布局。并设有专为婚礼打造的AVLC声光电设备。40平米LED大屏，顶部92组舞美灯光设计。专家级VJ灯光师会为您的婚礼打造出更动人心弦的仪式效果。每个宴会大厅均配有65平米专属新娘化妆间，欧式简约设计。明星梳妆台、落地更衣镜圆您期待已久的公主梦。', 1, 1, '2018-08-29 11:00:46', NULL, 0, NULL, '', 0, '{"thumb":"20180829\\/5b860cb271956.jpg"}', 6, 0, 0, 0, 0, '2018-08-29 11:00:46', '2018-08-29 11:00:46', '天津·爱琴海', '商务', '300', '8米', '15桌', '大厅无柱', '2018年档期免收服务费', '3888元/桌'),
(55, 1, '', '', '2018-08-29 11:05:45', '<p>ce&nbsp;</p>', '测试', 'ces', 1, 1, '2018-08-29 11:03:51', NULL, 0, NULL, '', 0, '{"thumb":"20180829\\/5b860d7645877.jpg"}', 0, 0, 0, 0, 0, '2018-08-29 11:03:51', '2018-08-29 11:03:51', '天津·爱琴海', '商务', '', '', '', '', '', ''),
(56, 1, '', '', '2018-08-29 11:12:46', '<p style="text-align: center;"><br/></p><p style="text-align: center;"><span style="font-size: 18px;">天使的眼泪，<br/>有舍得、有祝福、有满足，<br/>聚集了所有泪水变成水晶，<br/>就是一场婚礼，<br/>最美的庆祝！<br/><br/>水晶——天使的眼泪，<br/>凝结了不舍、祝福与满足，<br/>是对人间真爱永恒恋人的祈祷。<br/>优雅高贵，如水晶版纯净的感情，<br/>是这场婚礼最美的祝福。</span></p><p><br/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b92335c374b3.jpg" style="" title="2018-05-01 2.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b92335ed7ca1.jpg" style="" title="2018-05-01 1.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b92335eddceb.jpg" style="" title="2018-04-01.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b92335fb4eb8.jpg" style="" title="2018-05-01.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b92336120cc3.jpg" style="" title="2018-06-02.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b92336313eba.jpg" style="" title="2018-05-06.jpg"/></p><p><br/></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b860fb2196f7.jpg" title="2017-04-16 153527.jpg" alt="2017-04-16 153527.jpg"/></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b860fc1264b2.jpg" title="2017-09-10 210925.jpg" alt="2017-09-10 210925.jpg"/></p><p><br/></p><p><br/></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b860fd7b6d98.jpg" title="2017-09-23 143533.jpg" alt="2017-09-23 143533.jpg"/></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b860ff2abe8d.jpg" title="2017-09-26 152045.jpg" alt="2017-09-26 152045.jpg"/></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b861045170fe.jpg" title="2017-09-26 155230.jpg" alt="2017-09-26 155230.jpg"/></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b86104e51350.jpg" title="2017-09-26 155740.jpg" alt="2017-09-26 155740.jpg"/></p>', '水晶之恋', '480平米宴会厅，挑高八米。符合国际五星酒店装修布局。并设有专为婚礼打造的AVLC声光电设备。40平米LED大屏，顶部92组舞美灯光设计。专家级VJ灯光师会为您的婚礼打造出更动人心弦的仪式效果。每个宴会大厅均配有65平米专属新娘化妆间，欧式简约设计。明星梳妆台、落地更衣镜圆您期待已久的公主梦。', 1, 1, '2018-08-29 11:07:09', NULL, 0, NULL, '', 0, '{"thumb":"20180907\\/5b92331156f26.jpg"}', 3, 0, 0, 0, 0, '2018-08-29 11:07:09', '2018-08-29 11:07:09', '天津·爱琴海', '婚礼', '300', '8米', '15桌', '大厅无柱', '2018年档期免收服务费', '3888元/桌'),
(57, 1, '', '', '2018-08-29 11:31:52', '<p style="text-align: center;"><br/></p><p style="text-align: center;"><span style="font-size: 18px;">踏在云上 轻盈的脚步<br/>手握繁花 坚定的温度<br/>目视彼此 熟悉的嘴角<br/>言为承诺 永恒的时刻<br/><br/>天空的白云朵朵，<br/>为每个相信爱情的人们守候。<br/>云端教堂为天津最靠近天际的空中仪式殿堂，<br/>伴随着教堂独制清新的香芬气息，<br/>在圣洁的乐声中开启崭新的人生旅程，<br/>敲响户外为永恒订制的幸福钟声，<br/>让所有人分享相爱的终生幸福。</span></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b86139ae7ad2.jpg" title="2018-03-07 172058.jpg" alt="2018-03-07 172058.jpg"/></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b8613a06408e.jpg" title="2018-03-07 172647.jpg" alt="2018-03-07 172647.jpg"/></p>', '云端仪式堂', '云端仪式堂，天津独家西式典礼教堂风格。彩色玻璃、浪漫穹顶、洁白的大厅、梦幻的森系布置。让您在离天空最近的地方与他情定终身。', 1, 1, '2018-08-29 11:30:46', NULL, 0, NULL, '', 0, '{"thumb":"20180907\\/5b923619b6c84.jpg"}', 31, 0, 0, 0, 0, '2018-08-29 11:30:46', '2018-08-29 11:30:46', '天津·爱琴海', '婚礼', '120', '6米', '0', '空中仪式堂', '2018年档期免收服务费', '20000元');
INSERT INTO `data_posts` (`id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `newarc`, `actstarttime`, `actendtime`, `postadderss`, `type`, `max`, `tinggao`, `zhuoshu`, `tese`, `youhui`, `jiage`) VALUES
(58, 1, '', '', '2018-08-29 11:38:58', '<p style="text-align: center;"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b8614d3af5b9.jpg" title="WechatIMG95.jpg" alt="WechatIMG95.jpg"/><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b8614dbb2002.jpg" title="WechatIMG96.jpg" alt="WechatIMG96.jpg"/><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b8614e06c510.jpg" title="WechatIMG97.jpg" alt="WechatIMG97.jpg"/><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b8614e79d24d.jpg" title="WechatIMG98.jpg" alt="WechatIMG98.jpg"/><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b8614eb0632e.jpg" title="WechatIMG99.jpg" alt="WechatIMG99.jpg"/><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b8614eeb6a98.jpg" title="WechatIMG100.jpg" alt="WechatIMG100.jpg"/><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b8614f310e7f.jpg" title="WechatIMG101.jpg" alt="WechatIMG101.jpg"/><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b8614f6b3bc9.jpg" title="WechatIMG102.jpg" alt="WechatIMG102.jpg"/><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b8614fb48335.jpg" title="WechatIMG103.jpg" alt="WechatIMG103.jpg"/><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b8614ffa4a01.jpg" title="WechatIMG104.jpg" alt="WechatIMG104.jpg"/><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b8615037f64a.jpg" title="WechatIMG105.jpg" alt="WechatIMG105.jpg"/><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b861507d0c67.jpg" title="WechatIMG128.jpg" alt="WechatIMG128.jpg"/><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b861518e3103.jpg" title="WechatIMG129.jpg" alt="WechatIMG129.jpg"/><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b86152b1c272.jpg" title="WechatIMG130.jpg" alt="WechatIMG130.jpg"/><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b86153198cda.jpg" title="WechatIMG105.jpg" alt="WechatIMG105.jpg"/><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b861537ad9f9.jpg" title="WechatIMG132.jpg" alt="WechatIMG132.jpg"/><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b86153ece592.jpg" title="WechatIMG133.jpg" alt="WechatIMG133.jpg"/></p>', '云锦厅', '每一种美好的情感都需要一种表达，云端上的圆舞曲像是为爱情创造的梦，当拥有坚定承诺，就能一起，漫步在云端。当你我踩着灯光和花瓣，从大气浪漫的法式礼堂入场；当你我伴着祝福和音乐，在众人的祝福中微笑；爱在这一刻的我们，幸福，是无法言说的秘密。', 1, 1, '2018-08-29 11:35:44', NULL, 0, NULL, '', 0, '{"thumb":"20180907\\/5b924e422b280.jpg"}', 2, 0, 0, 0, 0, '2018-08-29 11:35:44', '2018-08-29 11:35:44', '南京·外秦淮', '婚礼', '360', '8米', '24桌', '大厅无柱', '2018年档期免收服务费', '3988元/桌'),
(59, 1, '', '', '2018-08-29 11:42:30', '<p style="text-align: center;"><br/></p><p style="text-align: center;"><span style="font-size: 18px;">我们拥有不同的个性，对于爱情重要的时刻，也许有不同的表达。</span></p><p style="text-align: center;"><span style="font-size: 18px;">你最爱表白的那句——我喜欢你；</span></p><p style="text-align: center;"><span style="font-size: 18px;">她钟情思念的那句——我想念你；</span></p><p style="text-align: center;"><span style="font-size: 18px;">我迷恋送上玫瑰时那不说出口的——我爱你……<br/><br/>LAVIN玫瑰里·南京1865独有的莫奈花园以花的色彩传递了情感，</span></p><p style="text-align: center;"><span style="font-size: 18px;">走入莫奈花园仪式堂，犹如进入莫奈的油画中，</span></p><p style="text-align: center;"><span style="font-size: 18px;">以花的芬芳延续了记忆，以花来表达千言万语，</span></p><p style="text-align: center;"><span style="font-size: 18px;">花开瞬间永恒，爱在不言中。</span></p><p style="text-align: center;"><span style="font-size: 18px;">如同所有古老神秘的地方，</span></p><p style="text-align: center;"><span style="font-size: 18px;">借鉴欧洲的浪漫和温情，</span></p><p style="text-align: center;"><span style="font-size: 18px;">铺满灼烈热闹的鲜花，</span></p><p style="text-align: center;"><span style="font-size: 18px;">在芬芳中沉醉在爱情里，</span></p><p style="text-align: center;"><span style="font-size: 18px;">沉醉在有你的城市里。</span><br/></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b8615f99e4ee.jpg" title="20170213-FA5A8040.jpg" alt="20170213-FA5A8040.jpg"/></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b8615ff69e6a.jpg" title="20170213-FA5A8048.jpg" alt="20170213-FA5A8048.jpg"/></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b861603b1aea.jpg" title="20170213-FA5A8050.jpg" alt="20170213-FA5A8050.jpg"/></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b8616073f20d.jpg" title="20170213-FA5A8052.jpg" alt="20170213-FA5A8052.jpg"/></p>', '莫奈花园仪式堂', '如果说生活需要共同的经营与修剪，那爱情最美的，无疑是他自由生长的模样。\r\n恣意的玫瑰顺着藤蔓蜿蜒而上，而绿色植被明媚如生命张扬。\r\n许你一座花园，他或许曾是画家手中的调色板，但如今以此起誓，这将是独一无二。', 1, 1, '2018-08-29 11:40:00', NULL, 0, NULL, '', 0, '{"thumb":"20180829\\/5b86160fd0c90.jpg"}', 5, 0, 0, 0, 0, '2018-08-29 11:40:00', '2018-08-29 11:40:00', '南京·1865', '婚礼', '100-150人', '5米', '', '', '', ''),
(60, 1, '', '', '2018-08-29 13:15:37', '<img src="http://www.lavin.com.cn/data/upload/ueditor/20180830/5b88052b8e7d7.jpg" title="4A3V0731.jpg" alt="4A3V0731.jpg"/>', '傅正刚婚礼', '傅正刚婚礼', 1, 1, '2018-08-29 13:14:39', NULL, 0, NULL, '', 0, '{"thumb":"20180830\\/5b88051e219e3.jpg","photo":[{"url":"20180830\\/5b880537acc50.jpg","alt":"4A3V0731"},{"url":"20180830\\/5b88054054c0d.jpg","alt":"4A3V0923"},{"url":"20180830\\/5b8805476f7ca.jpg","alt":"4A3V0962"},{"url":"20180830\\/5b88054eab2c8.jpg","alt":"4A3V1015"},{"url":"20180830\\/5b880556c0d49.jpg","alt":"D12A1962"},{"url":"20180830\\/5b88055d68c9b.jpg","alt":"IMG_4543"},{"url":"20180830\\/5b880564bbe32.jpg","alt":"IMG_4597"},{"url":"20180830\\/5b88056c13e52.jpg","alt":"IMG_4612"},{"url":"20180830\\/5b8805731bfd1.jpg","alt":"IMG_4641"},{"url":"20180830\\/5b88057a9bef9.jpg","alt":"IMG_4757"}]}', 40, 0, 0, 0, 0, '2018-08-29 13:14:39', '2018-08-29 13:14:39', '北京·太阳公元', '商务', '', '', '', '', '', ''),
(85, 1, '', '', '2018-09-07 00:07:33', '<p style="text-align: center;">湖光山色，亭台楼阁，</p><p style="text-align: center;">古典式八角亭，环绕式 270°全湖景宴会厅，</p><p style="text-align: center;">湖光山色，亭台楼阁， 清新怡人，</p><p style="text-align: center;">专业的灯光音响，主题场景设计， 五星级的服务体验，</p><p style="text-align: center;">打造你的商务私人订制。&nbsp;</p><p style="text-align: center;">心中若有桃花源，何处不是水云间。</p><p><br/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b91506c26bb7.jpg" title="6484568788539802125.jpg" alt="6484568788539802125.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b9150b507824.jpg" title="6484568473329467917.jpg" alt="6484568473329467917.jpg"/></p><p><br/></p>', '水云间', '湖光山色，亭台楼阁，古典式八角亭，环绕式 270°全湖景宴会厅，湖光山色，亭台楼阁， 清新怡人，专业的灯光音响，主题场景设计， 五星级的服务体验，打造你的商务私人订制。 心中若有桃花源，何处不是水云间。', 1, 1, '2018-09-06 23:56:08', NULL, 0, NULL, '', 0, '{"thumb":"20180907\\/5b91507943eac.jpg"}', 0, 0, 0, 0, 0, '2018-09-06 23:56:08', '2018-09-06 23:56:08', '北京·太阳公元', '商务', '130', '16米', '5', '270度湖景宴会厅', '2018年档期免收服务费', '20000元'),
(61, 1, '', '', '2018-08-29 22:32:01', '<p style="text-align: center;"><span style="font-size: 18px;">洁白的雕栏设计，</span></p><p style="text-align: center;"><span style="font-size: 18px;">兼具传统与现代，华美与婉约。</span></p><p style="text-align: center;"><span style="font-size: 18px;">厅内舞台双侧 LED 屏幕</span></p><p style="text-align: center;"><span style="font-size: 18px;">满足活动各角度视觉感。</span></p><p style="text-align: center;"><br/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b914b31042f8.jpg" style="" title="17幸福时光.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180906/5b914b311d455.jpg" style="" title="幸福.jpg"/></p><p><br/></p>', '幸福时光', '洁白的雕栏设计，兼具传统与现代，华美与婉约。厅内舞台双侧 LED 屏幕满足活动各角度视觉感。', 1, 1, '2018-08-29 22:28:20', NULL, 0, NULL, '', 0, '{"thumb":"20180906\\/5b914aaa63064.jpg"}', 10, 0, 0, 0, 0, '2018-08-29 22:28:20', '2018-08-29 22:28:20', '北京·太阳公元', '商务', '180', '8米', '10桌', 'P3 LED屏3', '2018年档期免收服务费', '45000元'),
(86, 1, '', '', '2018-09-07 00:42:07', '<p style="text-align: center;"><span style="font-size: 18px;"><br/></span></p><p><span style="font-size: 18px;"><br/></span></p><p style="text-align: center;"><span style="font-size: 18px;">《凯叔西游记》全集产品发布会</span></p>', '听不够的新经典', '《凯叔西游记》全集产品发布会', 1, 1, '2017-05-27 00:00:00', NULL, 0, NULL, '', 0, '{"thumb":"20180907\\/5b9159e325087.jpg","photo":[{"url":"20180907\\/5b91587a56f03.jpg","alt":"\\u51ef\\u53d46"},{"url":"20180907\\/5b91588911999.jpg","alt":"\\u51ef\\u53d4"},{"url":"20180907\\/5b91589b4d429.jpg","alt":"\\u51ef\\u53d45"},{"url":"20180907\\/5b9158ac807a6.jpg","alt":"\\u51ef\\u53d44"},{"url":"20180907\\/5b9158bb6ac0c.jpg","alt":"\\u51ef\\u53d42"},{"url":"20180907\\/5b9158c84eddc.jpg","alt":"\\u51ef\\u53d43"}]}', 0, 0, 0, 0, 0, '2018-09-07 00:33:43', '2018-09-07 00:33:43', '北京·太阳公元', '商务', '', '', '', '', '', ''),
(62, 1, '', '', '2018-08-29 22:44:20', '<p><br/></p><p><br/></p><p style="text-align: center;"><span style="font-size: 18px;">爱是最完美的自己</span></p><p style="text-align: center;"><span style="font-size: 18px;">满眼的星光，看着你微醉的脸</span></p><p style="text-align: center;"><span style="font-size: 18px;">坠落在花的海洋，跳动着浪漫的情</span></p><p style="text-align: center;"><span style="font-size: 18px;">我最心爱的公主</span></p><p style="text-align: center;"><span style="font-size: 18px;">你似香槟酒巴黎之花</span></p><p style="text-align: center;"><span style="font-size: 18px;">雅致而率真，时尚却隽永</span></p><p style="text-align: center;"><span style="font-size: 18px;">以爱之名，久久难忘</span></p>', '金色年华', '以爱之名，久久难忘~', 1, 1, '2018-08-29 22:37:15', NULL, 0, NULL, '', 0, '{"thumb":"20180906\\/5b913748037a4.jpg","photo":[{"url":"20180906\\/5b9138c2a1152.jpg","alt":"_086"},{"url":"20180906\\/5b9138d2363b2.jpg","alt":"_090"},{"url":"20180906\\/5b9138de0f9e8.jpg","alt":"_091"},{"url":"20180906\\/5b9138e92a47b.jpg","alt":"_094"},{"url":"20180906\\/5b9138f59f39e.jpg","alt":"_096"},{"url":"20180906\\/5b9139004a618.jpg","alt":"_101"}]}', 10, 0, 0, 0, 0, '2018-08-29 22:37:15', '2018-08-29 22:37:15', '北京·太阳公元', '婚礼', '', '', '', '', '', ''),
(69, 1, '', '', '2018-08-30 22:08:46', '<p style="text-align: center;"><span style="font-size: 18px;"><br/></span></p><p><span style="font-size: 18px;"><br/></span></p><p style="text-align: center;"><span style="font-size: 18px;">爱是一段旅途</span></p><p style="text-align: center;"><span style="font-size: 18px;">与最爱的人并肩相守</span></p><p style="text-align: center;"><span style="font-size: 18px;">越过山岭，穿过海洋</span></p><p style="text-align: center;"><span style="font-size: 18px;">大海与阳光的交汇</span></p><p style="text-align: center;"><span style="font-size: 18px;">每一寸土地翻滚着爱的气息</span></p><p style="text-align: center;"><span style="font-size: 18px;">你问这旅途有多远</span></p><p style="text-align: center;"><span style="font-size: 18px;">一辈子，就是永远</span></p><p><br/></p>', '爱是永远', '一辈子，就是永远~', 1, 1, '2018-08-30 22:05:13', NULL, 0, NULL, '', 0, '{"thumb":"20180903\\/5b8cc78826310.jpg","photo":[{"url":"20180830\\/5b87fa111a5cf.jpg","alt":"7M5A8945"},{"url":"20180830\\/5b87fa1f78cf0.jpg","alt":"7M5A8971"},{"url":"20180830\\/5b87fa2c4fdf5.jpg","alt":"7M5A8999"},{"url":"20180830\\/5b87fa3ba2420.jpg","alt":"7M5A9034"},{"url":"20180830\\/5b87fa4c19e42.jpg","alt":"7M5A9057"},{"url":"20180830\\/5b87fa5a1140b.jpg","alt":"7M5A9804"}]}', 17, 0, 0, 0, 0, '2018-08-30 22:05:13', '2018-08-30 22:05:13', '北京·太阳公元', '婚礼', '', '', '', '', '', ''),
(63, 1, '', '', '2018-08-29 22:55:06', '<p style="text-align: center;"><span style="font-size: 18px;"><br/></span></p><p><span style="font-size: 18px;"><br/></span></p><p style="text-align: center;"><span style="font-size: 18px;">亲爱的 爱上你<br/>从那天起 甜蜜的很轻易<br/>亲爱的 别任性<br/>你的眼睛 在说我愿意 <br/>亲爱的 爱上你 <br/>恋爱日记 飘香水的回忆<br/>一整瓶的梦境 <br/>全都有你 搅拌在一起</span><br/></p>', '告白气球', '最长情的告白就是陪伴。', 1, 1, '2018-08-29 22:53:38', NULL, 0, NULL, '', 0, '{"thumb":"20180829\\/5b86b3c439ac4.png","photo":[{"url":"20180829\\/5b86b4046bc18.png","alt":"\\u56fe\\u72471"},{"url":"20180906\\/5b9133c6c657f.jpg","alt":"20170102-81"},{"url":"20180906\\/5b9133dad7ba1.jpg","alt":"20170102-82"},{"url":"20180906\\/5b9133ea01073.jpg","alt":"20170102-90"},{"url":"20180906\\/5b9133f383ea3.jpg","alt":"20170102-91"},{"url":"20180906\\/5b9133fd9b3f3.jpg","alt":"20170102-92"}]}', 8, 0, 0, 0, 0, '2018-08-29 22:53:38', '2018-08-29 22:53:38', '北京·太阳公元', '婚礼', '', '', '', '', '', ''),
(64, 1, '', '', '2018-08-29 22:58:15', '<p style="text-align: center;"><span style="font-size: 18px;"><br/></span></p><p><span style="font-size: 18px;"><br/></span></p><p style="text-align: center;"><span style="font-size: 18px;">你的另一半，<br/>是能够让你有充足的安全感，<br/>是能够让你在难过的时候转哭为笑，<br/>是能够和你有共同的生活目标，<br/>是能够与你有共同的语言，<br/>并且让你觉得安心和温暖的人。<br/>爱情，其实就是选你所爱~</span></p>', '嫁给爱情', '爱情，其实就是选你所爱~', 1, 1, '2018-08-29 22:57:07', NULL, 0, NULL, '', 0, '{"thumb":"20180906\\/5b913eb454c18.jpg","photo":[{"url":"20180906\\/5b913ee696b4c.jpg","alt":"FDS_4460"},{"url":"20180906\\/5b913eef27686.jpg","alt":"FDS_4463"},{"url":"20180906\\/5b913efb83afe.jpg","alt":"FDS_4487"},{"url":"20180906\\/5b913f0918e24.jpg","alt":"FDS_4510"},{"url":"20180906\\/5b913f163b145.jpg","alt":"FDS_4552"},{"url":"20180906\\/5b913f228adbd.jpg","alt":"FDS_4699"}]}', 7, 0, 0, 0, 0, '2018-08-29 22:57:07', '2018-08-29 22:57:07', '北京·太阳公元', '婚礼', '', '', '', '', '', ''),
(65, 1, '', '', '2018-08-29 23:00:44', '<p style="text-align: center;"><span style="font-size: 18px;"><br/></span></p><p style="text-align: center;"><span style="font-size: 18px;"><br/></span></p><p style="text-align: center;"><span style="font-size: 18px;">“人只有一辈子，</span></p><p style="text-align: center;"><span style="font-size: 18px;">请你给我一次让我陪着你</span></p><p style="text-align: center;"><span style="font-size: 18px;">一直到</span><span style="font-size: 18px;">天荒地老的机会，</span></p><p style="text-align: center;"><span style="font-size: 18px;">让我和你一起上一秒吵吵闹闹，</span></p><p style="text-align: center;"><span style="font-size: 18px;">下一秒就转身和好。</span></p><p style="text-align: center;"><span style="font-size: 18px;">我的心为你而跳，</span></p><p style="text-align: center;"><span style="font-size: 18px;">我唯一想要的就是想永远和你在一起，</span></p><p style="text-align: center;"><span style="font-size: 18px;">一起玩，一起闹，一起笑，一起哭，</span></p><p style="text-align: center;"><span style="font-size: 18px;">因为我爱你！”<br/></span></p>', '繁华入梦', '她把自己的设计，诠释成婚礼的一处一花一绚烂。把他的爱作为灵感，散落到这繁华入梦中~', 1, 1, '2018-08-29 22:58:17', NULL, 0, NULL, '', 0, '{"thumb":"20180829\\/5b86b4fd40bdf.png","photo":[{"url":"20180906\\/5b9130edaef8b.jpg","alt":"WechatIMG26"},{"url":"20180906\\/5b9130fc51d56.jpg","alt":"WechatIMG27"},{"url":"20180906\\/5b91310c5d2e0.jpg","alt":"WechatIMG28"},{"url":"20180906\\/5b91311be0090.jpg","alt":"WechatIMG29"},{"url":"20180906\\/5b91312e5dbd2.jpg","alt":"WechatIMG33"},{"url":"20180906\\/5b91316f5e567.jpg","alt":"WechatIMG30"}]}', 13, 0, 0, 0, 0, '2018-08-29 22:58:17', '2018-08-29 22:58:17', '北京·太阳公元', '婚礼', '', '', '', '', '', ''),
(66, 1, '', '', '2018-08-29 23:42:33', '<p><br/></p><p style="text-align: center;"><span style="font-size: 18px;">戒指的永恒流传，</span></p><p style="text-align: center;"><span style="font-size: 18px;">誓言的坚定信心，</span></p><p style="text-align: center;"><span style="font-size: 18px;">眼神的幸福泪光，</span></p><p style="text-align: center;"><span style="font-size: 18px;">以及承诺的天长地久……<br/><br/>缤纷的色彩中，女人最爱的，是永流传的美丽闪耀光芒。</span></p><p style="text-align: center;"><span style="font-size: 18px;">传说中的德国的天鹅堡是痴情人为心上人所建，</span></p><p style="text-align: center;"><span style="font-size: 18px;">这里的天鹅堡是我对你矢志不渝的爱情体现，</span></p><p style="text-align: center;"><span style="font-size: 18px;">在天鹅堡宴会厅的设计里，</span></p><p style="text-align: center;"><span style="font-size: 18px;">利用百万及声光电设备，打造出似钻戒般的七彩缤纷世界，</span></p><p style="text-align: center;"><span style="font-size: 18px;">让相爱的两人沐浴在承诺中，走向永恒。</span></p><p style="text-align: center;"><span style="font-size: 18px;">LAVIV玫瑰里·南京1865就像一個最美丽的求婚钻戒，一同与你完成美梦。</span><br/></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b86bd88e77e5.jpg" title="9.jpg" alt="9.jpg"/></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b86bd9a8ccf1.jpg" title="9-1.jpg" alt="9-1.jpg"/></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b86bda58505a.jpg" title="HUI_0005.jpg" alt="HUI_0005.jpg"/></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b86be4068d0f.jpg" title="HUI_0023.jpg" alt="HUI_0023.jpg"/></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b86be5d160bc.jpg" title="HUI_0042.jpg" alt="HUI_0042.jpg"/></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b86be6a1d464.jpg" title="HUI_0043.jpg" alt="HUI_0043.jpg"/></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b86be77569b8.jpg" title="HUI_0073.jpg" alt="HUI_0073.jpg"/></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b86be9e465ab.jpg" title="HUI_0093.jpg" alt="HUI_0093.jpg"/></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b86be899e7e7.jpg" title="HUI_0142.jpg" alt="HUI_0142.jpg"/></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b86beb1c99d5.jpg" title="HUI_0149.jpg" alt="HUI_0149.jpg"/></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b86bec112cfb.jpg" title="HUI_0157.jpg" alt="HUI_0157.jpg"/></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b86becd43e64.jpg" title="HUI_0168.jpg" alt="HUI_0168.jpg"/></p>', '天鹅湖', '或许生活没有那么多的荡气回肠，惟愿记得琐碎时光里的每点温馨。\r\n流水般的线形墙壁，是走过漫长岁月后彼此依然柔软的心。\r\n七米的层高，梦幻的光影，天低，云高，水阔，在这刻，找到每只天鹅停驻的意义，是相遇和约定。                                                              ', 1, 1, '2018-08-29 23:35:06', NULL, 0, NULL, '', 0, '{"thumb":"20180829\\/5b86bedce9db2.jpg"}', 7, 0, 0, 0, 0, '2018-08-29 23:35:06', '2018-08-29 23:35:06', '南京·1865', '婚礼', '25桌', '7米', '', '', '', ''),
(67, 1, '', '', '2018-08-29 23:50:18', '<p><br/></p><p><br/></p><p style="text-align: center;"><span style="font-size: 18px;">光 ,是这世上第一抹色彩，</span></p><p style="text-align: center;"><span style="font-size: 18px;">糅合七种颜色而无色，</span></p><p style="text-align: center;"><span style="font-size: 18px;">如同对你的爱，大爱而无疆， <br/></span></p><p style="text-align: center;"><span style="font-size: 18px;">圣经里说：神说有光，于是便有了光。</span></p><p style="text-align: center;"><span style="font-size: 18px;">我们看得见清晨的一缕橙黄，</span></p><p style="text-align: center;"><span style="font-size: 18px;">晴午的蓝天白云，</span></p><p style="text-align: center;"><span style="font-size: 18px;">夕照的万紫千红，</span></p><p style="text-align: center;"><span style="font-size: 18px;">夜空的闪耀静谧……<br/><br/>我对神祈祷，让我生命里拥有你，让我看见这世界的缤纷，</span></p><p style="text-align: center;"><span style="font-size: 18px;">而你，让我懂得这世界的美丽。</span></p><p style="text-align: center;"><span style="font-size: 18px;">在爱情海宴会厅的设计里，</span></p><p style="text-align: center;"><span style="font-size: 18px;">利用顶级声光电设备 建构出不同时间的光影氛围，</span></p><p style="text-align: center;"><span style="font-size: 18px;">你是否想起了与他相遇的瞬间？</span></p><p style="text-align: center;"><span style="font-size: 18px;">玫瑰里不仅让你忆起爱情所有美好时光，</span></p><p style="text-align: center;"><span style="font-size: 18px;">我们还将时光永远保存。</span></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b86c012dfb20.jpg" title="IMG_6716.jpg" alt="IMG_6716.jpg"/></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b86c0216e9ff.jpg" title="IMG_6789.jpg" alt="IMG_6789.jpg"/></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b86c02c2a03e.jpg" title="IMG_6810.jpg" alt="IMG_6810.jpg"/></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b86c036843ed.jpg" title="IMG_6849.jpg" alt="IMG_6849.jpg"/></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b86c0438d985.jpg" title="IMG_6855.jpg" alt="IMG_6855.jpg"/></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b86c04ec9bdf.jpg" title="IMG_6887.jpg" alt="IMG_6887.jpg"/></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b86c05dd401f.jpg" title="IMG_6891.jpg" alt="IMG_6891.jpg"/></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b86c06a372d4.jpg" title="IMG_6932.jpg" alt="IMG_6932.jpg"/></p><p><br/></p><p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180829/5b86c078e9070.jpg" title="IMG_6934.jpg" alt="IMG_6934.jpg"/></p><p><br/></p>', '爱琴海', '也许每份爱情，都可以谱写成一曲有关海洋的童话。\r\n近七百平的海浪墙壁，流动着的是有关未来的畅想。\r\n专业打造的灯光音响，点亮了的是有关携手的勇气与力量。\r\n透过3D全息创造的梦境，那是有关于爱情，静默守望的目光。', 1, 1, '2018-08-29 23:46:03', NULL, 0, NULL, '', 0, '{"thumb":"20180829\\/5b86c0869489a.jpg"}', 2, 0, 0, 0, 0, '2018-08-29 23:46:03', '2018-08-29 23:46:03', '南京·1865', '婚礼', '50桌', '7米', '', '', '', ''),
(68, 1, '', '', '2018-08-30 11:47:59', '<p>1</p>', 'ces', '1', 1, 1, '2018-08-30 11:47:25', NULL, 0, NULL, '', 0, '{"thumb":"20180830\\/5b8768ea56324.jpg"}', 0, 0, 0, 0, 0, '2018-08-30 11:47:25', '2018-08-30 11:47:25', '北京·太阳公元', '婚礼', '', '', '', '', '', ''),
(70, 1, '', '', '2018-08-30 22:24:09', '<p><br/></p><p><br/></p><p><span style="font-size: 18px;">整个婚礼套系采用粉色和香槟色为主基调，端庄而华丽。</span></p>', '华丽旅程', '华丽旅程', 1, 1, '2018-08-30 22:19:43', NULL, 0, NULL, '', 0, '{"thumb":"20180907\\/5b916a7d1b870.jpg","photo":[{"url":"20180907\\/5b916af4752fc.jpg","alt":"AHAO5745m"},{"url":"20180907\\/5b916b040c779.jpg","alt":"WZ__9360m"},{"url":"20180907\\/5b916b1047eb2.jpg","alt":"WZ__9514m"},{"url":"20180907\\/5b916b1b02c6b.jpg","alt":"WZ__9528m"},{"url":"20180907\\/5b916b268474f.jpg","alt":"WZ__9637m"},{"url":"20180907\\/5b916b322466b.jpg","alt":"WZ__9666m"}]}', 2, 0, 0, 0, 0, '2018-08-30 22:19:43', '2018-08-30 22:19:43', '上海·外滩', '婚礼', '', '', '', '', '', ''),
(71, 1, '', '', '2018-08-30 22:27:23', '<p><span style="font-size: 18px;"><br/></span></p><p><span style="font-size: 18px;"><br/></span></p><p style="text-align: left;"><span style="font-size: 18px;">整个婚礼套系采用蓝色为主基调，</span></p><p style="text-align: left;"><span style="font-size: 18px; text-align: center;">唯美梦幻。</span></p>', '璀璨星空', '璀璨星空', 1, 1, '2018-08-30 22:25:32', NULL, 0, NULL, '', 0, '{"thumb":"20180907\\/5b92148ea2d0a.jpg","photo":[{"url":"20180830\\/5b87fe9d4fd12.jpg","alt":"AHAO5859m"},{"url":"20180830\\/5b87fea6d32b9.jpg","alt":"AHAO5878m"},{"url":"20180830\\/5b87feae57ca4.jpg","alt":"DAJ_2103m"},{"url":"20180830\\/5b87feb6ce524.jpg","alt":"DAJ_2111m"},{"url":"20180830\\/5b87febe92ee4.jpg","alt":"DSC_8360"},{"url":"20180830\\/5b87fec68b737.jpg","alt":"DSC_8363"}]}', 13, 0, 0, 0, 0, '2018-08-30 22:25:32', '2018-08-30 22:25:32', '上海·外滩', '婚礼', '', '', '', '', '', ''),
(72, 1, '', '', '2018-08-30 22:30:49', '<p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180830/5b87ff7bd7754.jpg" title="2017-11-11 120918.jpg" alt="2017-11-11 120918.jpg"/></p>', '云端仪式堂案例', '云端仪式堂案例', 1, 1, '2018-08-30 22:29:22', NULL, 0, NULL, '', 0, '{"thumb":"20180830\\/5b87ff6f5e076.jpg","photo":[{"url":"20180830\\/5b87ff8ac6ba3.jpg","alt":"2018-03-07 172058"},{"url":"20180830\\/5b87ff934c799.jpg","alt":"2018-03-07 172647"},{"url":"20180830\\/5b87ffc29607b.jpg","alt":"2017-11-11 120918"},{"url":"20180907\\/5b9239934da6c.jpg","alt":"\\u4e91\\u7aef\\u4eea\\u5f0f\\u580212"},{"url":"20180907\\/5b92399b031ef.jpg","alt":"\\u4e91\\u7aef\\u4eea\\u5f0f\\u58023"},{"url":"20180907\\/5b9239a06cdae.jpg","alt":"\\u4e91\\u7aef\\u4eea\\u5f0f\\u58026"}]}', 2, 0, 0, 0, 0, '2018-08-30 22:29:22', '2018-08-30 22:29:22', '天津·爱琴海', '婚礼', '', '', '', '', '', ''),
(73, 1, '', '', '2018-08-30 22:33:47', '<p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180830/5b8800117eba8.jpg" title="2016-09-18 141550.jpg" alt="2016-09-18 141550.jpg"/></p>', '天空之城', '天空之城', 1, 1, '2018-08-30 22:32:02', NULL, 0, NULL, '', 0, '{"thumb":"20180830\\/5b880002e709b.jpg","photo":[{"url":"20180830\\/5b88001af2b78.jpg","alt":"2016-09-18 142752"},{"url":"20180830\\/5b88002347624.jpg","alt":"2016-10-07 145332"},{"url":"20180830\\/5b88002b201e3.jpg","alt":"2016-10-07 150137"},{"url":"20180830\\/5b880033392f5.jpg","alt":"2016-10-07 151043"},{"url":"20180830\\/5b88003a8b277.jpg","alt":"2017-03-11 132609"},{"url":"20180830\\/5b880043c03ba.jpg","alt":"2017-06-18 145320"}]}', 0, 0, 0, 0, 0, '2018-08-30 22:32:02', '2018-08-30 22:32:02', '天津·爱琴海', '婚礼', '', '', '', '', '', ''),
(74, 1, '', '', '2018-08-30 22:35:38', '<p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180830/5b88007e04cb8.jpg" title="2017-04-16 153150.jpg" alt="2017-04-16 153150.jpg"/></p>', '水晶之恋', '水晶之恋', 1, 1, '2018-08-30 22:33:49', NULL, 0, NULL, '', 0, '{"thumb":"20180830\\/5b880074c7e97.jpg","photo":[{"url":"20180830\\/5b8800865c0e2.jpg","alt":"2017-04-16 153527"},{"url":"20180830\\/5b88008f8c2dc.jpg","alt":"2017-09-10 210925"},{"url":"20180830\\/5b880099c6360.jpg","alt":"2017-09-23 143316"},{"url":"20180830\\/5b8800a2bdb51.jpg","alt":"2017-09-23 143533"},{"url":"20180830\\/5b8800aacd21e.jpg","alt":"2017-09-26 152045"},{"url":"20180830\\/5b8800b35bb99.jpg","alt":"2017-09-26 155740"}]}', 7, 0, 0, 0, 0, '2018-08-30 22:33:49', '2018-08-30 22:33:49', '天津·爱琴海', '婚礼', '', '', '', '', '', ''),
(75, 1, '', '', '2018-08-30 22:37:52', '<p style="text-align: center"><span style="font-size: 18px;">我们拥有不同的个性，</span></p><p style="text-align: center;"><span style="font-size: 18px;">对于爱情重要的时刻，</span></p><p style="text-align: center;"><span style="font-size: 18px;">也许有不同的表达。</span></p><p style="text-align: center;"><span style="font-size: 18px;">你最爱表白的那句——我喜欢你；</span></p><p style="text-align: center;"><span style="font-size: 18px;">她钟情思念的那句——我想念你；</span></p><p style="text-align: center;"><span style="font-size: 18px;">我迷恋送上玫瑰时那不说出口的——我爱你……</span></p><p><br/></p>', '紫色童话', '紫色童话', 1, 1, '2018-08-30 22:35:43', NULL, 0, NULL, '', 0, '{"thumb":"20180907\\/5b92546a94633.jpg","photo":[{"url":"20180907\\/5b9254f3724f9.jpg","alt":"\\u7d2b\\u8272\\u7ae5\\u8bdd"},{"url":"20180907\\/5b925555df1a6.jpg","alt":"094"},{"url":"20180907\\/5b92555fd53c6.jpg","alt":"070"},{"url":"20180907\\/5b925566e7c2b.jpg","alt":"071"},{"url":"20180907\\/5b92556eaece9.jpg","alt":"071"},{"url":"20180907\\/5b9255752c09b.jpg","alt":"072"},{"url":"20180907\\/5b92557a77d56.jpg","alt":"077"}]}', 0, 0, 0, 0, 0, '2018-08-30 22:35:43', '2018-08-30 22:35:43', '南京·外秦淮', '婚礼', '', '', '', '', '', ''),
(76, 1, '', '', '2018-08-30 22:39:48', '<p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180830/5b88017d39ffa.jpg" title="002.jpg" alt="002.jpg"/></p>', '梧桐厅', '梧桐厅', 1, 1, '2018-08-30 22:37:58', NULL, 0, NULL, '', 0, '{"thumb":"20180830\\/5b8801713fc4d.jpg","photo":[{"url":"20180830\\/5b88018628dd3.jpg","alt":"005"},{"url":"20180830\\/5b88018f2552b.jpg","alt":"006"},{"url":"20180830\\/5b8801965a2b4.jpg","alt":"007"},{"url":"20180830\\/5b88019ce75f3.jpg","alt":"009"},{"url":"20180830\\/5b8801a4b7aae.jpg","alt":"20170213-FA5A7767"},{"url":"20180830\\/5b8801ab7ece0.jpg","alt":"393412687879771322"}]}', 5, 0, 0, 0, 0, '2018-08-30 22:37:58', '2018-08-30 22:37:58', '南京·外秦淮', '婚礼', '', '', '', '', '', ''),
(77, 1, '', '', '2018-08-30 22:43:00', '<p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180830/5b880237eb525.jpg" title="7.jpg" alt="7.jpg"/></p>', '婚礼案例', '婚礼案例', 1, 1, '2018-08-30 22:41:18', NULL, 0, NULL, '', 0, '{"thumb":"20180830\\/5b88022ac5b6c.jpg","photo":[{"url":"20180830\\/5b8802400893a.jpg","alt":"6"},{"url":"20180830\\/5b88024773ced.jpg","alt":"7"},{"url":"20180830\\/5b88024f8db78.jpg","alt":"8"},{"url":"20180830\\/5b88025837534.jpg","alt":"9"},{"url":"20180830\\/5b8802602b8e8.jpg","alt":"13"},{"url":"20180830\\/5b8802685d0bd.jpg","alt":"17"}]}', 0, 0, 0, 0, 0, '2018-08-30 22:41:18', '2018-08-30 22:41:18', '南京·1865', '婚礼', '', '', '', '', '', ''),
(78, 1, '', '', '2018-08-30 22:45:03', '<p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180830/5b8802a9f06ae.jpg" title="IMG_6789.jpg" alt="IMG_6789.jpg"/></p>', '爱琴海厅-海洋', '爱琴海厅-海洋', 1, 1, '2018-08-30 22:43:06', NULL, 0, NULL, '', 0, '{"thumb":"20180830\\/5b88029f912a5.jpg","photo":[{"url":"20180830\\/5b8802b9659b7.jpg","alt":"IMG_6810"},{"url":"20180830\\/5b8802c449288.jpg","alt":"IMG_6849"},{"url":"20180830\\/5b8802cc7b887.jpg","alt":"IMG_6887"},{"url":"20180830\\/5b8802d875fbc.jpg","alt":"IMG_6855"},{"url":"20180830\\/5b8802e129a7a.jpg","alt":"IMG_6932"},{"url":"20180830\\/5b8802e8b3c8f.jpg","alt":"IMG_6934"}]}', 0, 0, 0, 0, 0, '2018-08-30 22:43:06', '2018-08-30 22:43:06', '南京·1865', '婚礼', '', '', '', '', '', ''),
(79, 1, '', '', '2018-08-30 22:46:54', '<p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180830/5b880326d2d90.jpg" title="2.jpg" alt="2.jpg"/></p>', '天鹅湖厅-森系', '天鹅湖厅-森系', 1, 1, '2018-08-30 22:45:11', NULL, 0, NULL, '', 0, '{"thumb":"20180830\\/5b880318b4626.jpg","photo":[{"url":"20180830\\/5b880333ac7e1.jpg","alt":"1"},{"url":"20180830\\/5b88033b26f59.jpg","alt":"3"},{"url":"20180830\\/5b880341c2986.jpg","alt":"4"},{"url":"20180830\\/5b880348a366a.jpg","alt":"6"},{"url":"20180830\\/5b88034f527bd.jpg","alt":"8"},{"url":"20180830\\/5b8803565c162.jpg","alt":"9"}]}', 0, 0, 0, 0, 0, '2018-08-30 22:45:11', '2018-08-30 22:45:11', '南京·1865', '婚礼', '', '', '', '', '', ''),
(80, 1, '', '', '2018-08-30 22:48:47', '<p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180830/5b880392ea0e9.jpg" title="9.jpg" alt="9.jpg"/></p>', '天鹅湖厅-樱花', '天鹅湖厅-樱花', 1, 1, '2018-08-30 22:47:01', NULL, 0, NULL, '', 0, '{"thumb":"20180830\\/5b8803883b200.jpg","photo":[{"url":"20180830\\/5b88039b5e562.jpg","alt":"9"},{"url":"20180830\\/5b8803a533d4d.jpg","alt":"HUI_0005"},{"url":"20180830\\/5b8803ae9ae22.jpg","alt":"HUI_0042"},{"url":"20180830\\/5b8803b6bfef4.jpg","alt":"HUI_0093"},{"url":"20180830\\/5b8803beeb90b.jpg","alt":"HUI_0149"},{"url":"20180830\\/5b8803c72e2a2.jpg","alt":"HUI_0168"}]}', 0, 0, 0, 0, 0, '2018-08-30 22:47:01', '2018-08-30 22:47:01', '南京·1865', '婚礼', '', '', '', '', '', ''),
(81, 1, '', '', '2018-08-30 22:52:32', '<p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180830/5b88046b5feaf.jpg" title="1K0A6137=副本.jpg" alt="1K0A6137=副本.jpg"/></p>', '楠海之滨', '2014年9月7日体操冠军滕海滨&amp;张楠婚礼', 1, 1, '2018-08-30 22:50:17', NULL, 0, NULL, '', 0, '{"thumb":"20180830\\/5b88044d3999e.jpg","photo":[{"url":"20180830\\/5b88047701ff1.jpg","alt":"1K0A5945=\\u526f\\u672c"},{"url":"20180830\\/5b88047f2b630.jpg","alt":"1K0A6137=\\u526f\\u672c"},{"url":"20180830\\/5b88048825883.jpg","alt":"1K0A6473"},{"url":"20180830\\/5b88049398499.jpg","alt":"4C0A0536_\\u770b\\u56fe\\u738b\\u526f\\u672c"},{"url":"20180830\\/5b8804a0352a9.jpg","alt":"ITA_0770"},{"url":"20180830\\/5b8804a9a6b08.jpg","alt":"ITA_0819"}]}', 13, 0, 0, 0, 0, '2018-08-30 22:50:17', '2018-08-30 22:50:17', '北京·太阳公元', '婚礼', '', '', '', '', '', ''),
(82, 1, '', '', '2018-08-30 22:58:34', '<p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180830/5b8805cb79afc.jpg" title="_55A9438.jpg" alt="_55A9438.jpg"/></p>', '如鱼归林', '2015年3月8日喻恩泰&amp;史林子婚礼', 1, 1, '2018-08-30 22:56:46', NULL, 0, NULL, '', 0, '{"thumb":"20180830\\/5b8805c0d8895.jpg","photo":[{"url":"20180830\\/5b8805d1e0aab.jpg","alt":"_55A9438"},{"url":"20180830\\/5b8805d91cb75.jpg","alt":"_V8A8830"},{"url":"20180830\\/5b8805df951e2.jpg","alt":"099A8538"},{"url":"20180830\\/5b8805e689c8a.jpg","alt":"C_006151"},{"url":"20180830\\/5b8805eeb8546.jpg","alt":"DSC_6784"},{"url":"20180830\\/5b8805f5bd5f0.jpg","alt":"FM8A9292"},{"url":"20180830\\/5b8805fda3279.jpg","alt":"FM8A9724"},{"url":"20180830\\/5b880605c9262.jpg","alt":"FM8A9792\\u526f\\u672c"},{"url":"20180830\\/5b88060d2e9f4.jpg","alt":"IMG_3768"},{"url":"20180830\\/5b8806142a16a.jpg","alt":"LCM_5173"}]}', 8, 0, 0, 0, 0, '2018-08-30 22:56:46', '2018-08-30 22:56:46', '北京·太阳公元', '婚礼', '', '', '', '', '', ''),
(83, 1, '', '', '2018-08-30 23:01:03', '<p><img src="http://www.lavin.com.cn/data/upload/ueditor/20180830/5b880658b7977.jpg" title="481522320036_.pic_hd.jpg" alt="481522320036_.pic_hd.jpg"/></p>', '蝶恋花', '2016年5月10日林继东&amp;沈陶然婚礼', 1, 1, '2018-08-30 22:58:40', NULL, 0, NULL, '', 0, '{"thumb":"20180830\\/5b88064b1c0fc.jpg","photo":[{"url":"20180830\\/5b8806611ce0f.jpg","alt":"481522320036_"},{"url":"20180830\\/5b8806694af6d.jpg","alt":"491522320036_"},{"url":"20180830\\/5b880670c81ff.jpg","alt":"501522320037_"},{"url":"20180830\\/5b880678987ee.jpg","alt":"511522320037_"},{"url":"20180830\\/5b88067f6a21d.jpg","alt":"521522320037_"},{"url":"20180830\\/5b88068d46b77.jpg","alt":"531522320038_"},{"url":"20180830\\/5b8806a207a03.jpg","alt":"541522320038_"},{"url":"20180830\\/5b8806a959fe7.jpg","alt":"551522320038_"}]}', 14, 0, 0, 0, 0, '2018-08-30 22:58:40', '2018-08-30 22:58:40', '北京·太阳公元', '婚礼', '', '', '', '', '', ''),
(84, 1, '', '', '2018-09-01 16:43:51', '<p>测试测试</p>', 'test菜单详情', '1', 1, 1, '2018-09-01 16:43:21', NULL, 0, NULL, '', 0, '{"thumb":""}', 4, 0, 0, 0, 0, '2018-09-01 16:43:21', '2018-09-01 16:43:21', '北京·太阳公元', '婚礼', '', '', '', '', '', ''),
(87, 1, '', '', '2018-09-07 00:52:14', '<p style="text-align: center;"><span style="font-size: 18px;"><br/></span></p><p><span style="font-size: 18px;"><br/></span></p><p style="text-align: center;"><span style="font-size: 18px;">Addy&#39;s world</span></p><p style="text-align: center;"><span style="font-size: 18px;">孙红雷女儿百日宴</span></p>', 'Addy''s world', '孙红雷女儿百日宴', 1, 1, '2018-09-07 00:48:05', NULL, 0, NULL, '', 0, '{"thumb":"20180907\\/5b915a7a54b8f.jpg","photo":[{"url":"20180907\\/5b915aba09285.jpg","alt":"\\u5b59\\u7ea2\\u96f7"},{"url":"20180907\\/5b915ac446e83.jpg","alt":"\\u5b59\\u7ea2\\u96f75"},{"url":"20180907\\/5b915ad725085.jpg","alt":"\\u5b59\\u7ea2\\u96f76"},{"url":"20180907\\/5b915ae37bd69.jpg","alt":"\\u5b59\\u7ea2\\u96f72"},{"url":"20180907\\/5b915aefd3128.jpg","alt":"\\u5b59\\u7ea2\\u96f73"},{"url":"20180907\\/5b915b003b9a3.jpg","alt":"\\u5b59\\u7ea2\\u96f77"}]}', 2, 0, 0, 0, 0, '2018-09-07 00:48:05', '2018-09-07 00:48:05', '北京·太阳公元', '商务', '', '', '', '', '', ''),
(88, 1, '', '', '2018-09-07 01:05:51', '<p style="text-align: center;"><span style="font-size: 18px;"><br/></span></p><p><span style="font-size: 18px;"><br/></span></p><p style="text-align: center;"><span style="font-size: 18px;">“记得你的名字”</span></p><p style="text-align: center;"><span style="font-size: 18px;">天将聚星&amp;CoCo张可盈签约仪式</span></p>', '记得你的名字', '天将聚星&amp;CoCo张可盈签约仪式', 1, 1, '2018-09-07 01:00:43', NULL, 0, NULL, '', 0, '{"thumb":"20180907\\/5b915f3b01d6a.jpg","photo":[{"url":"20180907\\/5b915e00b35e4.jpg","alt":"WechatIMG44"},{"url":"20180907\\/5b915e28b74bc.jpg","alt":"WechatIMG45"},{"url":"20180907\\/5b915e31678c0.jpg","alt":"WechatIMG46"},{"url":"20180907\\/5b915e4200024.jpg","alt":"WechatIMG47"},{"url":"20180907\\/5b915e591f269.jpg","alt":"WechatIMG49"},{"url":"20180907\\/5b915e66af32c.jpg","alt":"WechatIMG50"}]}', 8, 0, 0, 0, 0, '2018-09-07 01:00:43', '2018-09-07 01:00:43', '北京·太阳公元', '商务', '', '', '', '', '', ''),
(89, 1, '', '', '2018-09-07 01:31:11', '<p style="text-align: center;"><span style="font-size: 18px;">270°环幕缔造视觉非凡的世界，</span></p><p style="text-align: center;"><span style="font-size: 18px;">置身其中，生动，忘我。</span></p><p style="text-align: center;"><span style="font-size: 18px;">在最炫目，最光鲜的世界里，</span></p><p style="text-align: center;"><span style="font-size: 18px;">体验无以伦比的至尊理念。</span></p><p><span style="font-size: 18px;"><br/></span></p><p><span style="font-size: 18px;"></span></p><p style="text-align: center"><br/></p><p><span style="font-size: 18px;"></span></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b9164574412a.jpg" style="" title="时光厅-2.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b91645797625.jpeg" style="" title="WechatIMG37.jpeg"/></p><p><br/></p>', '时光厅', '270°环幕缔造视觉非凡的世界，置身其中，生动，忘我。在最炫目，最光鲜的世界里，体验无以伦比的至尊理念。', 1, 1, '2018-09-07 01:15:15', NULL, 0, NULL, '', 0, '{"thumb":"20180907\\/5b9163c82fa57.jpg"}', 0, 0, 0, 0, 0, '2018-09-07 01:15:15', '2018-09-07 01:15:15', '上海·外滩', '商务', '30', '5米', '1桌', '270度环幕', '2018年档期免收服务费', '0元'),
(93, 1, '', '', '2018-09-07 14:47:04', '<p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b9222d86590a.jpg" style="" title="1K0A5945=副本.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b9222d8a7e40.jpg" style="" title="_TA_9719_看图王副本.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b9222da9f8f4.jpg" style="" title="1K0A6473.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b9222db9f1e5.jpg" style="" title="4C0A0536_看图王副本.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b9222dcda087.jpg" style="" title="ITA_5609_看图王副本.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b9222ddced66.jpg" style="" title="1K0A6137=副本.jpg"/></p><p><br/></p>', '楠海之滨', '2014年9月7日体操冠军滕海滨&amp;张楠婚礼', 1, 1, '2018-09-07 14:43:04', NULL, 0, NULL, '', 0, '{"thumb":"20180907\\/5b921e15dae50.jpg","photo":[{"url":"20180907\\/5b92225fe78b0.jpg","alt":"_TA_9719_\\u770b\\u56fe\\u738b\\u526f\\u672c"},{"url":"20180907\\/5b92226d512eb.jpg","alt":"1K0A5945=\\u526f\\u672c"},{"url":"20180907\\/5b922298908f5.jpg","alt":"1K0A6137=\\u526f\\u672c"},{"url":"20180907\\/5b9222a61de36.jpg","alt":"1K0A6473"},{"url":"20180907\\/5b9222b0c0e57.jpg","alt":"4C0A0536_\\u770b\\u56fe\\u738b\\u526f\\u672c"},{"url":"20180907\\/5b9222ba9050f.jpg","alt":"ITA_5609_\\u770b\\u56fe\\u738b\\u526f\\u672c"}]}', 3, 0, 0, 0, 0, '2018-09-07 14:43:04', '2018-09-07 14:43:04', '上海·外滩', '婚礼', '', '', '', '', '', ''),
(90, 1, '', '', '2018-09-07 13:59:54', '', '情定钟声', '户外欧式田园森系风格，轻松惬意的气氛，舞美灯光音效俱全，黄浦江畔1500多平方户外草坪，无尽享受尽在玫瑰里。', 1, 1, '2018-09-07 13:55:40', NULL, 0, NULL, '', 0, '{"thumb":"20180907\\/5b92139b14be4.jpg","photo":[{"url":"20180907\\/5b9213ad4bad5.jpeg","alt":"0-2"},{"url":"20180907\\/5b9213b2efda9.jpg","alt":"13"},{"url":"20180907\\/5b9213bc3cb1b.jpg","alt":"17"},{"url":"20180907\\/5b9213c25b6ec.jpg","alt":"18"},{"url":"20180907\\/5b9213c87c8e3.jpg","alt":"20"},{"url":"20180907\\/5b9213cdc6ebe.jpeg","alt":"21"}]}', 2, 0, 0, 0, 0, '2018-09-07 13:55:40', '2018-09-07 13:55:40', '上海·外滩', '婚礼', '', '', '', '', '', ''),
(91, 1, '', '', '2018-09-07 14:19:08', '<p style="text-align: center;"><span style="font-size: 18px;">600平方米宴会厅，无助超10米挑高空间，</span></p><p style="text-align: center;"><span style="font-size: 18px;">独特的跃层空间结构，结合剧院式的舞台艺术设计。</span></p><p style="text-align: center;"><span style="font-size: 18px;">奥运会级别灯光音响设备，直径5cm*10cm舞台，</span></p><p style="text-align: center;"><span style="font-size: 18px;">配以充满艺术气息的LED屏幕让您体会到超一流的享受。</span></p><p style="text-align: center;"><span style="font-size: 18px;">您可在BAZAAR举办课桌式、剧院式、宴会式、</span></p><p style="text-align: center;"><span style="font-size: 18px;">鱼骨式、U字型和回字型等多种形式的活动。</span></p><p><br/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b92184e7207a.jpg" style="" title="DAJ_1705m.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b921850aef08.jpg" style="" title="WZ__9439m.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b9218513a089.jpg" style="" title="DAJ_1715m.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b92185291ede.jpg" style="" title="WZ__9508m.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b921853a97e9.jpg" style="" title="WZ__9499m.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b921853e3a1d.jpg" style="" title="AHAO5721m.jpg"/></p><p><br/></p>', 'BAZZAR', '600平方米宴会厅，无助超10米挑高空间，独特的跃层空间结构，结合剧院式的舞台艺术设计。奥运会级别灯光音响设备，直径5cm*10cm舞台，配以充满艺术气息的LED屏幕让您体会到超一流的享受。您可在BAZAAR举办课桌式、剧院式、宴会式、鱼骨式、U字型和回字型等多种形式的活动。', 1, 1, '2018-09-07 14:04:02', NULL, 0, NULL, '', 0, '{"thumb":"20180907\\/5b92156d602cf.jpg"}', 2, 0, 0, 0, 0, '2018-09-07 14:04:02', '2018-09-07 14:04:02', '上海·外滩', '商务', '400', '10米', '15桌', '大厅无柱', '2018年档期免收服务费', '90000元'),
(92, 1, '', '', '2018-09-07 14:30:31', '<p style="text-align: center;"><span style="font-size: 18px;">360°高科技全景环投与梦幻的穹顶星空幕，</span></p><p style="text-align: center;"><span style="font-size: 18px;">250英寸8000流明精细投影设备，</span></p><p style="text-align: center;"><span style="font-size: 18px;">星级大厨为您烹制艺术美食。</span></p><p style="text-align: center;"><span style="font-size: 18px;"><br/></span></p><p style="text-align: center;"><span style="font-size: 18px;"></span></p><p style="text-align: center"><br/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b921aebea6e0.jpg" style="" title="AHAO5859m.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b921aecde0cd.jpg" style="" title="DAJ_2111m.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b921aed0c095.jpg" style="" title="DAJ_2103m.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b921aed9c905.jpg" style="" title="AHAO5806m.jpg"/></p><p style="text-align: center;"><span style="font-size: 18px;"><br/></span><br/></p>', 'COSMO', '360°高科技全景环投与梦幻的穹顶星空幕，250英寸8000流明精细投影设备，星级大厨为您烹制艺术美食。', 1, 1, '2018-09-07 14:26:51', NULL, 0, NULL, '', 0, '{"thumb":"20180907\\/5b921a6d00750.jpg"}', 0, 0, 0, 0, 0, '2018-09-07 14:26:51', '2018-09-07 14:26:51', '上海·外滩', '商务', '180', '10', '5桌', '360度环幕', '2018年档期免收服务费', '70000元');
INSERT INTO `data_posts` (`id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `newarc`, `actstarttime`, `actendtime`, `postadderss`, `type`, `max`, `tinggao`, `zhuoshu`, `tese`, `youhui`, `jiage`) VALUES
(94, 1, '', '', '2018-09-07 15:00:23', '<p style="text-align: center"><br/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b9221e98f578.jpg" style="" title="_55A9438.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b9221eb9d796.jpg" style="" title="DSC_6784.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b9221ec927d9.jpg" style="" title="FM8A9292.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b9221eca835d.jpg" style="" title="_V8A8830.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b9221ed9f0b6.jpg" style="" title="FM8A9724.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b9221efcf11e.jpg" style="" title="LCM_5173.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b9221f075f0f.jpg" style="" title="FM8A9792副本.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b9221f130ded.jpg" style="" title="099A8538.jpg"/></p><p><br/></p>', '如鱼归林', '2015年3月8日喻恩泰&amp;史林子婚礼', 1, 1, '2018-09-07 14:58:17', NULL, 0, NULL, '', 0, '{"thumb":"20180907\\/5b9221caadfa6.jpg","photo":[{"url":"20180907\\/5b9222fa701a5.jpg","alt":"_55A9438"},{"url":"20180907\\/5b922301813d7.jpg","alt":"_V8A8830"},{"url":"20180907\\/5b9223090147f.jpg","alt":"099A8538"},{"url":"20180907\\/5b9223115a412.jpg","alt":"DSC_6784"},{"url":"20180907\\/5b92232349182.jpg","alt":"FM8A9292"},{"url":"20180907\\/5b92232982eee.jpg","alt":"FM8A9724"},{"url":"20180907\\/5b92233321d73.jpg","alt":"FM8A9792\\u526f\\u672c"},{"url":"20180907\\/5b92233bb4aab.jpg","alt":"LCM_5173"}]}', 1, 0, 0, 0, 0, '2018-09-07 14:58:17', '2018-09-07 14:58:17', '上海·外滩', '婚礼', '', '', '', '', '', ''),
(95, 1, '', '', '2018-09-07 15:11:13', '<p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b92245985161.jpg" style="" title="481522320036_.pic_hd.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b92245a15bfd.jpg" style="" title="501522320037_.pic_hd.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b92245a9dc84.jpg" style="" title="541522320038_.pic_hd.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b92245be05b6.jpg" style="" title="551522320038_.pic_hd.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b92245c14559.jpg" style="" title="491522320036_.pic_hd.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b92245c1f3f6.jpg" style="" title="531522320038_.pic_hd.jpg"/></p><p><br/></p>', '蝶恋花', '2016年5月10日林继东沈陶然婚礼', 1, 1, '2018-09-07 15:06:08', NULL, 0, NULL, '', 0, '{"thumb":"20180907\\/5b9224cb7fd5d.jpg","photo":[{"url":"20180907\\/5b92246c5b9b2.jpg","alt":"491522320036_"},{"url":"20180907\\/5b92247554872.jpg","alt":"481522320036_"},{"url":"20180907\\/5b92247ad9e1a.jpg","alt":"501522320037_"},{"url":"20180907\\/5b922482d5855.jpg","alt":"531522320038_"},{"url":"20180907\\/5b9224883c2f9.jpg","alt":"541522320038_"},{"url":"20180907\\/5b92248e182e5.jpg","alt":"551522320038_"}]}', 3, 0, 0, 0, 0, '2018-09-07 15:06:08', '2018-09-07 15:06:08', '上海·外滩', '婚礼', '', '', '', '', '', ''),
(96, 1, '', '', '2018-09-07 15:51:04', '<p><span style="font-size: 18px;">2018上海电影节系列活动——大地之夜</span></p>', '大地之夜', '2018上海电影节系列活动', 1, 1, '2018-09-07 15:46:43', NULL, 0, NULL, '', 0, '{"thumb":"20180907\\/5b92321c841ea.jpeg","photo":[{"url":"20180907\\/5b922d9bc80ce.jpg","alt":"\\u5927\\u5730\\u4e4b\\u591c"},{"url":"20180907\\/5b922daa9b38c.jpg","alt":"\\u5927\\u57308"},{"url":"20180907\\/5b922db158ad7.jpg","alt":"\\u5927\\u57309"},{"url":"20180907\\/5b922dbbe45e9.jpg","alt":"\\u5927\\u57305"},{"url":"20180907\\/5b922dd5bee64.jpg","alt":"\\u5927\\u57306"},{"url":"20180907\\/5b922ddeac980.jpg","alt":"\\u5927\\u57302"}]}', 5, 0, 0, 0, 0, '2018-09-07 15:46:43', '2018-09-07 15:46:43', '上海·外滩', '商务', '', '', '', '', '', ''),
(97, 1, '', '', '2018-09-07 15:57:33', '<p><span style="font-size: 18px;">迪丽热巴&amp;盛一伦主演的都市情感剧《漂亮的李慧珍》在时光厅取景拍摄。</span></p>', '《漂亮的李慧珍》拍摄', '都市情感剧《漂亮的李慧珍》在时光厅取景拍摄', 1, 1, '2018-09-07 15:54:17', NULL, 0, NULL, '', 0, '{"thumb":"20180907\\/5b92320598205.jpg","photo":[{"url":"20180907\\/5b922f692a3b6.jpg","alt":"\\u6f02\\u4eae\\u7684\\u674e\\u6167\\u73cd\\u5267\\u71672"},{"url":"20180907\\/5b922f8b10a40.jpg","alt":"\\u6f02\\u4eae\\u7684\\u674e\\u6167\\u73cd\\u5267\\u71674"},{"url":"20180907\\/5b922f95bb374.jpg","alt":"\\u6f02\\u4eae\\u7684\\u674e\\u6167\\u73cd\\u5267\\u71671_1000X1000"}]}', 1, 0, 0, 0, 0, '2018-09-07 15:54:17', '2018-09-07 15:54:17', '上海·外滩', '商务', '', '', '', '', '', ''),
(98, 1, '', '', '2018-09-07 16:47:36', '<p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b923b13c4cbe.jpg" style="" title="WechatIMG58.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b923b15c7023.jpg" style="" title="WechatIMG59.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b923b17b17c6.jpg" style="" title="WechatIMG60.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b923b17eb0f1.jpg" style="" title="WechatIMG57.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b923b1a31dc0.jpg" style="" title="WechatIMG61.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b923b1d62030.jpg" style="" title="WechatIMG62.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b923b1e4ecc5.png" style="" title="WechatIMG42.png"/></p><p><br/></p>', '漫步花园', '漫步花园', 1, 1, '2018-09-07 16:42:29', NULL, 0, NULL, '', 0, '{"thumb":"20180907\\/5b923aad89e91.jpg"}', 0, 0, 0, 0, 0, '2018-09-07 16:42:29', '2018-09-07 16:42:29', '天津·爱琴海', '商务', '150', '6米', '6桌', '大厅无柱', '2018年档期免收服务费', '20000元'),
(99, 1, '', '', '2018-09-07 16:51:29', '<p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b923bfe553db.jpg" style="" title="2017-03-11 132609.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b923bfe9aa52.jpg" style="" title="2018-04-17 1.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b923c0122626.jpg" style="" title="2018-03-28.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b923c0174995.jpg" style="" title="2018-08-19 16.jpg"/></p><p><br/></p>', '天空之城', '450平米宴会厅，挑高八米。符合国际五星酒店装修布局，厅内设有专门吊点为不同客户打造不同活动效果。并设有国内领先的AVLC声光电设备及森海塞尔音响设备。40平米LED大屏，顶部92组舞美灯光设计。每场活动配备专属音响师服务打造自己专属定制效果，满足各类企业用户需求。', 1, 1, '2018-09-07 16:48:32', NULL, 0, NULL, '', 0, '{"thumb":"20180907\\/5b923c0ce3cf4.jpg"}', 1, 0, 0, 0, 0, '2018-09-07 16:48:32', '2018-09-07 16:48:32', '天津·爱琴海', '商务', '300', '8米', '15桌', '大厅无柱', '2018档期免收服务费', '50000元'),
(100, 1, '', '', '2018-09-07 16:56:20', '<p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b923d0bb1eef.jpeg" style="" title="会议摆台空镜4.jpeg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b923d0c05b9d.jpeg" style="" title="会议摆台空镜.jpeg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b923d0dc115a.jpeg" style="" title="WechatIMG12.jpeg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b923d0dd62eb.jpeg" style="" title="WechatIMG14.jpeg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b923d0fade25.jpeg" style="" title="会议摆台空镜5.jpeg"/></p><p></p><p style="text-align: center"></p><p style="text-align: center"></p><p style="text-align: center"></p><p style="text-align: center"></p><p style="text-align: center"></p><p><br/></p>', '水晶之恋', '450平米宴会厅，挑高八米。符合国际五星酒店装修布局，厅内设有专门吊点为不同客户打造不同活动效果。并设有国内领先的AVLC声光电设备及森海塞尔音响设备。40平米LED大屏，顶部92组舞美灯光设计。每场活动配备专属音响师服务打造自己专属定制效果，满足各类企业用户需求。', 1, 1, '2018-09-07 16:51:51', NULL, 0, NULL, '', 0, '{"thumb":"20180907\\/5b923c6d2c083.jpg"}', 0, 0, 0, 0, 0, '2018-09-07 16:51:51', '2018-09-07 16:51:51', '天津·爱琴海', '商务', '300', '8米', '15桌', '大厅无柱', '2018年档期免收服务费', '50000元'),
(101, 1, '', '', '2018-09-07 17:29:47', '<p><span style="font-size: 18px;">漫步花园生日会</span></p>', '漫步花园生日会', '漫步花园生日会', 1, 1, '2018-09-07 17:23:36', NULL, 0, NULL, '', 0, '{"thumb":"20180907\\/5b9243cb05a55.jpeg","photo":[{"url":"20180907\\/5b9244be1aa85.jpeg","alt":"WechatIMG65"},{"url":"20180907\\/5b9244c964d7d.jpeg","alt":"WechatIMG61"},{"url":"20180907\\/5b9244ed640fa.jpeg","alt":"WechatIMG62"},{"url":"20180907\\/5b9244f34820d.jpeg","alt":"WechatIMG63"},{"url":"20180907\\/5b9244fa2315e.jpg","alt":"1"},{"url":"20180907\\/5b92450178403.jpeg","alt":"WechatIMG66"}]}', 1, 0, 0, 0, 0, '2018-09-07 17:23:36', '2018-09-07 17:23:36', '天津·爱琴海', '商务', '', '', '', '', '', ''),
(102, 1, '', '', '2018-09-07 17:38:11', '<p><span style="font-size: 18px;">哆啦A梦主体生日会</span></p>', '哆啦A梦主体生日会', '哆啦A梦主体生日会', 1, 1, '2018-09-07 17:30:37', NULL, 0, NULL, '', 0, '{"thumb":"20180907\\/5b92457e3a41e.jpeg","photo":[{"url":"20180907\\/5b9246db265aa.jpeg","alt":"WechatIMG39"},{"url":"20180907\\/5b9246e1ef9b3.jpeg","alt":"WechatIMG40"},{"url":"20180907\\/5b9246e811ab8.jpeg","alt":"WechatIMG44"},{"url":"20180907\\/5b9246f01bfc7.jpeg","alt":"WechatIMG41"},{"url":"20180907\\/5b9246f7bc234.jpeg","alt":"WechatIMG31"},{"url":"20180907\\/5b9246fd65f92.jpeg","alt":"WechatIMG37"}]}', 0, 0, 0, 0, 0, '2018-09-07 17:30:37', '2018-09-07 17:30:37', '天津·爱琴海', '商务', '', '', '', '', '', ''),
(103, 1, '', '', '2018-09-07 17:49:54', '<p><span style="font-size: 18px;">联通营业厅vivo主推月活动暨明星门店评选会</span></p>', '联通营业厅vivo主推月', '联通营业厅vivo主推月活动暨明星门店评选会', 1, 1, '2018-09-07 17:38:35', NULL, 0, NULL, '', 0, '{"thumb":"20180907\\/5b9249be9f5e2.jpeg","photo":[{"url":"20180907\\/5b9249988ff96.jpg","alt":"vivo"},{"url":"20180907\\/5b92499dcb761.jpeg","alt":"WechatIMG5"},{"url":"20180907\\/5b9249a3399e2.jpeg","alt":"WechatIMG7"},{"url":"20180907\\/5b9249a850ee1.jpeg","alt":"WechatIMG8"},{"url":"20180907\\/5b9249ae358bf.jpeg","alt":"WechatIMG10"},{"url":"20180907\\/5b9249b2d45db.jpeg","alt":"WechatIMG12"}]}', 1, 0, 0, 0, 0, '2018-09-07 17:38:35', '2018-09-07 17:38:35', '天津·爱琴海', '商务', '', '', '', '', '', ''),
(104, 1, '', '', '2018-09-07 17:55:02', '<p>2016年5月10日林继东沈陶然婚礼</p>', '蝶恋花', '2016年5月10日林继东沈陶然婚礼', 1, 1, '2018-09-07 17:51:19', NULL, 0, NULL, '', 0, '{"thumb":"20180907\\/5b924a7816e76.jpg","photo":[{"url":"20180907\\/5b924acf8e09a.jpg","alt":"491522320036_"},{"url":"20180907\\/5b924ad601364.jpg","alt":"481522320036_"},{"url":"20180907\\/5b924adac8e9e.jpg","alt":"501522320037_"},{"url":"20180907\\/5b924ae205a60.jpg","alt":"531522320038_"},{"url":"20180907\\/5b924ae9030a2.jpg","alt":"541522320038_"},{"url":"20180907\\/5b924aeecb895.jpg","alt":"551522320038_"}]}', 0, 0, 0, 0, 0, '2018-09-07 17:51:19', '2018-09-07 17:51:19', '天津·爱琴海', '婚礼', '', '', '', '', '', ''),
(105, 1, '', '', '2018-09-07 17:58:11', '<p>2015年3月8日喻恩泰&amp;史林子婚礼</p>', '如鱼归林', '2015年3月8日喻恩泰&amp;史林子婚礼', 1, 1, '2018-09-07 17:55:27', NULL, 0, NULL, '', 0, '{"thumb":"20180907\\/5b924b53bfed0.jpg","photo":[{"url":"20180907\\/5b924b692a531.jpg","alt":"_55A9438"},{"url":"20180907\\/5b924b7340626.jpg","alt":"_V8A8830"},{"url":"20180907\\/5b924b7e7cb86.jpg","alt":"099A8538"},{"url":"20180907\\/5b924b8a8803a.jpg","alt":"DSC_6784"},{"url":"20180907\\/5b924b9293be9.jpg","alt":"FM8A9292"},{"url":"20180907\\/5b924b99512e6.jpg","alt":"FM8A9724"},{"url":"20180907\\/5b924ba0a298a.jpg","alt":"FM8A9792\\u526f\\u672c"},{"url":"20180907\\/5b924bac555b4.jpg","alt":"LCM_5173"}]}', 0, 0, 0, 0, 0, '2018-09-07 17:55:27', '2018-09-07 17:55:27', '天津·爱琴海', '婚礼', '', '', '', '', '', ''),
(106, 1, '', '', '2018-09-07 18:00:31', '<p>2014年9月7日体操冠军滕海滨&amp;张楠婚礼</p>', '楠海之滨', '2014年9月7日体操冠军滕海滨&amp;张楠婚礼', 1, 1, '2018-09-07 17:58:21', NULL, 0, NULL, '', 0, '{"thumb":"20180907\\/5b924bf1be11c.jpg","photo":[{"url":"20180907\\/5b924c07b855b.jpg","alt":"_TA_9719_\\u770b\\u56fe\\u738b\\u526f\\u672c"},{"url":"20180907\\/5b924c10bee8a.jpg","alt":"1K0A5945=\\u526f\\u672c"},{"url":"20180907\\/5b924c197afa9.jpg","alt":"1K0A6137=\\u526f\\u672c"},{"url":"20180907\\/5b924c2163501.jpg","alt":"1K0A6473"},{"url":"20180907\\/5b924c300298a.jpg","alt":"4C0A0536_\\u770b\\u56fe\\u738b\\u526f\\u672c"},{"url":"20180907\\/5b924c3a442bb.jpg","alt":"ITA_5609_\\u770b\\u56fe\\u738b\\u526f\\u672c"}]}', 0, 0, 0, 0, 0, '2018-09-07 17:58:21', '2018-09-07 17:58:21', '天津·爱琴海', '婚礼', '', '', '', '', '', ''),
(107, 1, '', '', '2018-09-07 18:17:22', '<p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b9251c48e098.jpg" style="" title="凤凰厅.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b9251c6b9bf5.jpg" style="" title="0M2A7060.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b9251c6ddca0.jpg" style="" title="IMG_3807.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b9251c966016.jpg" style="" title="IMG_3808.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b9251c9a07de.jpg" style="" title="IMG_3809.jpg"/></p><p><br/></p>', '凤凰厅', '他们说，女人都是天使，从小父亲给与丰厚的羽翼呵护，当她找到了他，她卸下了父亲的照顾，得到了另一副爱的翅膀，在他的羽翼守护之下，回到天堂。当我们走进这里，就各自拥有了爱的翅膀，在爱的羽翼下，慢慢感悟更美好的成长。', 1, 1, '2018-09-07 18:12:36', NULL, 0, NULL, '', 0, '{"thumb":"20180907\\/5b92517eab732.jpg"}', 0, 0, 0, 0, 0, '2018-09-07 18:12:36', '2018-09-07 18:12:36', '南京·外秦淮', '婚礼', '240', '8米', '15桌', '大厅无柱', '2018年档期免收服务费', '3988元/桌'),
(108, 1, '', '', '2018-09-07 18:33:27', '<p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b9253ea73b6b.jpg" style="" title="凤凰厅.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b9253ece3dc5.jpg" style="" title="IMG_3808.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b9253ed8bb47.jpg" style="" title="0M2A7060.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b9253ef4eaa4.jpg" style="" title="IMG_3807.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b9253f00f9c5.jpg" style="" title="IMG_3809.jpg"/></p><p><br/></p>', '梧桐仪式堂', '梧桐仪式堂，可同时容纳108位亲友参与婚礼仪式，让恋人在这里许下相爱的承诺，完整表达爱情的神圣庄严。传说中，梧是雄树，桐是雌数树，梧桐同长同老，同生同死，是为忠贞爱情。来自欧洲古老教堂的彩色玻璃、梧桐元素设计的美好传说，让恋人在梧桐祝福下许下承诺，在千年的历史见证下足以让人留下一辈子的回忆。当玫瑰邂逅梧桐时，就像浪漫遇见了历史。', 1, 1, '2018-09-07 18:26:59', NULL, 0, NULL, '', 0, '{"thumb":"20180907\\/5b9252e8639c1.jpg"}', 1, 0, 0, 0, 0, '2018-09-07 18:26:59', '2018-09-07 18:26:59', '南京·外秦淮', '婚礼', '108', '10米', '0', '神圣教堂', '2018年档期免收服务费', '10000元'),
(109, 1, '', '', '2018-09-07 18:44:15', '<p style="text-align: center;"><span style="font-size: 18px;">以淡蓝色天空元素作为背景，</span></p><p style="text-align: center;"><span style="font-size: 18px;">加以清新淡雅花艺做装饰，</span></p><p style="text-align: center;"><span style="font-size: 18px;">整体设计清爽明亮，</span></p><p style="text-align: center;"><span style="font-size: 18px;">体现出婚礼的神圣与浪漫。</span></p><p style="text-align: center;"><span style="font-size: 18px;">让人仿佛置身于蓝天白云之下，</span></p><p style="text-align: center;"><span style="font-size: 18px;">轻松惬意的感觉围绕在周边，</span></p><p style="text-align: center;"><span style="font-size: 18px;">是当下年轻人喜爱的清新风格。</span></p><p style="text-align: center;"><span style="font-size: 18px;">且风格可以多变，</span></p><p style="text-align: center;"><span style="font-size: 18px;">通过色彩的调节与背景纹理的改变，</span></p><p style="text-align: center;"><span style="font-size: 18px;">可营造出或清浅或浓烈的风格。</span></p>', '冬季恋歌', '冬季恋歌', 1, 1, '2018-09-07 18:41:25', NULL, 0, NULL, '', 0, '{"thumb":"20180907\\/5b92560ca9027.jpg","photo":[{"url":"20180907\\/5b92567b39dc1.jpg","alt":"\\u51ac\\u5b63\\u604b\\u6b4c"},{"url":"20180907\\/5b9256990009d.jpg","alt":"WechatIMG95"},{"url":"20180907\\/5b9256a1a4dfe.jpg","alt":"WechatIMG96"},{"url":"20180907\\/5b9256a812f38.jpg","alt":"WechatIMG97"},{"url":"20180907\\/5b9256b0d2787.jpg","alt":"WechatIMG98"},{"url":"20180907\\/5b9256ba81401.jpg","alt":"WechatIMG103"}]}', 2, 0, 0, 0, 0, '2018-09-07 18:41:25', '2018-09-07 18:41:25', '南京·外秦淮', '婚礼', '', '', '', '', '', ''),
(110, 1, '', '', '2018-09-07 18:49:18', '<p style="text-align: center;"><span style="font-size: 18px;">以淡蓝色天空元素作为背景，</span></p><p style="text-align: center;"><span style="font-size: 18px;">加以清新淡雅花艺做装饰，</span></p><p style="text-align: center;"><span style="font-size: 18px;">整体设计清爽明亮，</span></p><p style="text-align: center;"><span style="font-size: 18px;">体现出婚礼的神圣与浪漫。</span></p><p style="text-align: center;"><span style="font-size: 18px;">让人仿佛置身于蓝天白云之下，</span></p><p style="text-align: center;"><span style="font-size: 18px;">轻松惬意的感觉围绕在周边，</span></p><p style="text-align: center;"><span style="font-size: 18px;">是当下年轻人喜爱的清新风格。</span></p><p style="text-align: center;"><span style="font-size: 18px;">且风格可以多变，</span></p><p style="text-align: center;"><span style="font-size: 18px;">通过色彩的调节与背景纹理的改变，</span></p><p style="text-align: center;"><span style="font-size: 18px;">可营造出或清浅或浓烈的风格。</span></p>', '缱绻时光', '以淡蓝色天空元素作为背景，\r\n加以清新淡雅花艺做装饰，\r\n整体设计清爽明亮，\r\n体现出婚礼的神圣与浪漫。', 1, 1, '2018-09-07 18:45:46', NULL, 0, NULL, '', 0, '{"thumb":"20180907\\/5b9256f3b6a40.jpg","photo":[{"url":"20180907\\/5b925766a766f.jpg","alt":"\\u7d2b\\u8272\\u68a6\\u5e7b"},{"url":"20180907\\/5b9257700c37c.jpg","alt":"WechatIMG854"},{"url":"20180907\\/5b92577b5f3ac.jpg","alt":"WechatIMG862"},{"url":"20180907\\/5b925781cde8a.jpg","alt":"WechatIMG867"},{"url":"20180907\\/5b925789bd46f.jpg","alt":"WechatIMG868"},{"url":"20180907\\/5b925790820c7.jpg","alt":"WechatIMG869"}]}', 0, 0, 0, 0, 0, '2018-09-07 18:45:46', '2018-09-07 18:45:46', '南京·外秦淮', '婚礼', '', '', '', '', '', ''),
(111, 1, '', '', '2018-09-07 18:53:48', '<p>2016年5月10日林继东&amp;沈陶然婚礼</p>', '蝶恋花', '2016年5月10日林继东&amp;沈陶然婚礼', 1, 1, '2018-09-07 18:50:18', NULL, 0, NULL, '', 0, '{"thumb":"20180907\\/5b92586be0007.jpg","photo":[{"url":"20180907\\/5b9258988bd8b.jpg","alt":"541522320038_"},{"url":"20180907\\/5b9258a51a3ad.jpg","alt":"491522320036_"},{"url":"20180907\\/5b9258aae59a9.jpg","alt":"501522320037_"},{"url":"20180907\\/5b9258b0c034f.jpg","alt":"481522320036_"},{"url":"20180907\\/5b9258b7d1556.jpg","alt":"531522320038_"},{"url":"20180907\\/5b9258cf3130b.jpg","alt":"551522320038_"}]}', 0, 0, 0, 0, 0, '2018-09-07 18:50:18', '2018-09-07 18:50:18', '南京·外秦淮', '婚礼', '', '', '', '', '', ''),
(112, 1, '', '', '2018-09-07 19:00:32', '<p>2015年3月8日喻恩泰&amp;史林子婚礼</p>', '如鱼归林', '2015年3月8日喻恩泰&amp;史林子婚礼', 1, 1, '2018-09-07 18:54:41', NULL, 0, NULL, '', 0, '{"thumb":"20180907\\/5b9259afce876.jpg","photo":[{"url":"20180907\\/5b9259c0d9758.jpg","alt":"_55A9438"},{"url":"20180907\\/5b9259c79075a.jpg","alt":"_V8A8830"},{"url":"20180907\\/5b9259f547d7b.jpg","alt":"099A8538"},{"url":"20180907\\/5b925a01d4bcd.jpg","alt":"DSC_6784"},{"url":"20180907\\/5b925a1184b69.jpg","alt":"FM8A9292"},{"url":"20180907\\/5b925a1fd2c08.jpg","alt":"FM8A9724"},{"url":"20180907\\/5b925a2ed9766.jpg","alt":"FM8A9792\\u526f\\u672c"},{"url":"20180907\\/5b925a381a139.jpg","alt":"LCM_5173"}]}', 1, 0, 0, 0, 0, '2018-09-07 18:54:41', '2018-09-07 18:54:41', '南京·外秦淮', '婚礼', '', '', '', '', '', ''),
(113, 1, '', '', '2018-09-07 19:02:28', '<p>111<br/></p>', '111', '111', 1, 1, '2018-09-07 19:02:03', NULL, 0, NULL, '', 0, '{"thumb":""}', 0, 0, 0, 0, 0, '2018-09-07 19:02:03', '2018-09-07 19:02:03', '南京·外秦淮', '婚礼', '', '', '', '', '', ''),
(114, 1, '', '', '2018-09-07 19:05:53', '<p>2014年9月7日体操冠军滕海滨&amp;张楠婚礼</p>', '楠海之滨', '2014年9月7日体操冠军滕海滨&amp;张楠婚礼', 1, 1, '2018-09-07 19:01:48', NULL, 0, NULL, '', 0, '{"thumb":"20180907\\/5b925aec93ee8.jpg","photo":[{"url":"20180907\\/5b925b3d829fe.jpg","alt":"1K0A5945=\\u526f\\u672c"},{"url":"20180907\\/5b925b45ecbf0.jpg","alt":"_TA_9719_\\u770b\\u56fe\\u738b\\u526f\\u672c"},{"url":"20180907\\/5b925b567ed32.jpg","alt":"1K0A6137=\\u526f\\u672c"},{"url":"20180907\\/5b925b650e7b8.jpg","alt":"1K0A6473"},{"url":"20180907\\/5b925b706a325.jpg","alt":"4C0A0536_\\u770b\\u56fe\\u738b\\u526f\\u672c"},{"url":"20180907\\/5b925b7cceaf0.jpg","alt":"ITA_5609_\\u770b\\u56fe\\u738b\\u526f\\u672c"}]}', 0, 0, 0, 0, 0, '2018-09-07 19:01:48', '2018-09-07 19:01:48', '南京·外秦淮', '婚礼', '', '', '', '', '', ''),
(115, 1, '', '', '2018-09-07 19:18:01', '<p style="text-align: center"></p><p style="text-align: center"></p><p style="text-align: center"></p><p style="text-align: center"></p><p style="text-align: center"></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b925f57ef619.jpg" style="" title="20170213-FA5A7882.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b925f590de2a.jpg" style="" title="20170213-FA5A7883.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b925f6ad0145.jpg" style="" title="20170213-FA5A7960.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b925f6ad8f41.jpg" style="" title="20170213-FA5A7970.jpg"/></p><p><br/></p>', '桐画厅', '层高 8米,会场面积260平方，剧院式可容纳300人，课桌式120人，全厅无柱，独立舞台40平，设备有高清P4大屏，厅内有旋转楼梯，配套设施齐全的顶级声光电。', 1, 1, '2018-09-07 19:14:07', NULL, 0, NULL, '', 0, '{"thumb":"20180907\\/5b925d982577a.jpg"}', 0, 0, 0, 0, 0, '2018-09-07 19:14:07', '2018-09-07 19:14:07', '南京·外秦淮', '商务', '130', '8米', '8桌', '大厅无柱', '2018年档期秒收服务费', '20000元'),
(116, 1, '', '', '2018-09-07 19:21:30', '<p style="text-align: center"></p><p style="text-align: center"></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b925f0bb4508.jpg" style="" title="20170213-FA5A7868.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b925f0c037aa.jpg" style="" title="20170213-FA5A7862.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b925f2298496.jpg" title="20170213-FA5A7853.jpg" alt="20170213-FA5A7853.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b925f2df1cee.jpg" title="20170213-FA5A7851.jpg" alt="20170213-FA5A7851.jpg"/></p><p><br/></p>', '云锦厅', '层高8米，会场面积700平方，剧院式可容纳800人，课桌式可容纳400人，全厅无柱，独立舞台65平，设备有高清P4大屏40平方米，配套设施齐全的顶级声光电。', 1, 1, '2018-09-07 19:18:11', NULL, 0, NULL, '', 0, '{"thumb":"20180907\\/5b925ed4396b3.jpg"}', 0, 0, 0, 0, 0, '2018-09-07 19:18:11', '2018-09-07 19:18:11', '南京·外秦淮', '商务', '360', '8米', '24桌', '大厅无柱', '2018年档期免收服务费', '50000元'),
(117, 1, '', '', '2018-09-07 19:24:15', '<p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b925fdb008e1.jpg" style="" title="20170213-FA5A7854.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b925fdb23409.jpg" style="" title="20170213-FA5A7856.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b925fdb8e17e.jpg" style="" title="20170213-FA5A7859.jpg"/></p><p><br/></p>', '凤凰厅', '层高8米，会场面积500平方，剧院式可容纳500人，课桌式可容纳240人，全厅无柱，独立舞台45平，设备有高清P4大屏35平方，配套设施齐全的顶级声光电。', 1, 1, '2018-09-07 19:22:35', NULL, 0, NULL, '', 0, '{"thumb":"20180907\\/5b925fccec7c2.jpg"}', 0, 0, 0, 0, 0, '2018-09-07 19:22:35', '2018-09-07 19:22:35', '南京·外秦淮', '商务', '240', '8米', '15桌', '大厅无柱', '2018年档期免收服务费', '30000元'),
(118, 1, '', '', '2018-09-07 19:28:17', '<p><span style="font-size: 18px;">2018年1月20日南京创意设计中心有限责任公司设计师之夜</span></p>', '南京创意设计中心有限责任公司设计师之夜', '2018年1月20日南京创意设计中心有限责任公司设计师之夜', 1, 1, '2018-09-07 19:25:23', NULL, 0, NULL, '', 0, '{"thumb":"20180907\\/5b9260551dbf8.jpg","photo":[{"url":"20180907\\/5b9260ab0b22d.jpg","alt":"2018\\u5e741\\u670820\\u65e5\\u5357\\u4eac\\u521b\\u610f\\u8bbe\\u8ba1\\u4e2d\\u5fc3\\u6709\\u9650\\u8d23\\u4efb\\u516c\\u53f8\\u8bbe\\u8ba1\\u5e08\\u4e4b\\u591c1"},{"url":"20180907\\/5b9260b576397.jpg","alt":"2018\\u5e741\\u670820\\u65e5\\u5357\\u4eac\\u521b\\u610f\\u8bbe\\u8ba1\\u4e2d\\u5fc3\\u6709\\u9650\\u8d23\\u4efb\\u516c\\u53f8\\u8bbe\\u8ba1\\u5e08\\u4e4b\\u591c"},{"url":"20180907\\/5b9260bb39d7e.jpg","alt":"2018\\u5e741\\u670820\\u65e5\\u5357\\u4eac\\u521b\\u610f\\u8bbe\\u8ba1\\u4e2d\\u5fc3\\u6709\\u9650\\u8d23\\u4efb\\u516c\\u53f8\\u8bbe\\u8ba1\\u5e08\\u4e4b\\u591c2"},{"url":"20180907\\/5b9260c0e159e.jpg","alt":"2018\\u5e741\\u670820\\u65e5\\u5357\\u4eac\\u521b\\u610f\\u8bbe\\u8ba1\\u4e2d\\u5fc3\\u6709\\u9650\\u8d23\\u4efb\\u516c\\u53f8\\u8bbe\\u8ba1\\u5e08\\u4e4b\\u591c3"},{"url":"20180907\\/5b9260c88d9ca.jpg","alt":"2018\\u5e742\\u670811\\u65e5\\u5357\\u4eac\\u81ea\\u5982\\u623f\\u5c4b\\u79df\\u8d41\\u6709\\u9650\\u516c\\u53f8\\u5e74\\u4f1a"},{"url":"20180907\\/5b9260cf2fe78.jpg","alt":"2018\\u5e742\\u670811\\u65e5\\u5357\\u4eac\\u81ea\\u5982\\u623f\\u5c4b\\u79df\\u8d41\\u6709\\u9650\\u516c\\u53f8\\u5e74\\u4f1a1"}]}', 0, 0, 0, 0, 0, '2018-09-07 19:25:23', '2018-09-07 19:25:23', '南京·外秦淮', '商务', '', '', '', '', '', ''),
(119, 1, '', '', '2018-09-07 19:30:12', '<p><span style="font-size: 18px;">2017年11月20日金梧桐颁奖典礼</span></p>', '金梧桐颁奖典礼', '2017年11月20日金梧桐颁奖典礼', 1, 1, '2018-09-07 19:28:39', NULL, 0, NULL, '', 0, '{"thumb":"20180907\\/5b926103bb3d3.jpg","photo":[{"url":"20180907\\/5b926140c8c84.jpg","alt":"2017\\u5e7411\\u670820\\u65e5\\u91d1\\u68a7\\u6850\\u9881\\u5956\\u5178\\u793c"},{"url":"20180907\\/5b9261560a819.jpg","alt":"2017\\u5e7411\\u670820\\u65e5\\u91d1\\u68a7\\u6850\\u9881\\u5956\\u5178\\u793c1"},{"url":"20180907\\/5b92615ddc9ec.jpg","alt":"2017\\u5e7411\\u670820\\u65e5\\u91d1\\u68a7\\u6850\\u9881\\u5956\\u5178\\u793c2"}]}', 0, 0, 0, 0, 0, '2018-09-07 19:28:39', '2018-09-07 19:28:39', '南京·外秦淮', '商务', '', '', '', '', '', ''),
(120, 1, '', '', '2018-09-07 19:33:08', '<p><span style="font-size: 18px;">2017年11月19日国际创意城市（南京）论坛</span></p>', '国际创意城市（南京）论坛', '2017年11月19日国际创意城市（南京）论坛', 1, 1, '2018-09-07 19:31:38', NULL, 0, NULL, '', 0, '{"thumb":"20180907\\/5b9261ab71ac9.jpg","photo":[{"url":"20180907\\/5b9261f14b5cd.jpg","alt":"2017\\u5e7411\\u670819\\u65e5\\u56fd\\u9645\\u521b\\u610f\\u57ce\\u5e02\\uff08\\u5357\\u4eac\\uff09\\u8bba\\u575b3"},{"url":"20180907\\/5b92620257e71.jpg","alt":"2017\\u5e749\\u670822\\u65e5\\u4e0a\\u6d77\\u5e02\\u6d77\\u534e\\u6c38\\u6cf0\\uff08\\u5357\\u4eac\\uff09\\u5f8b\\u5e08\\u4e8b\\u52a1\\u6240\\uff0c\\u5f00\\u4e1a\\u8bba\\u575b"},{"url":"20180907\\/5b9262094bc03.jpg","alt":"2017\\u5e749\\u670822\\u65e5\\u4e0a\\u6d77\\u5e02\\u6d77\\u534e\\u6c38\\u6cf0\\uff08\\u5357\\u4eac\\uff09\\u5f8b\\u5e08\\u4e8b\\u52a1\\u6240\\uff0c\\u5f00\\u4e1a\\u8bba\\u575b1"},{"url":"20180907\\/5b92621089fe0.jpg","alt":"2017\\u5e7411\\u670819\\u65e5\\u56fd\\u9645\\u521b\\u610f\\u57ce\\u5e02\\uff08\\u5357\\u4eac\\uff09\\u8bba\\u575b1"},{"url":"20180907\\/5b9262161a1e0.jpg","alt":"2017\\u5e7411\\u670819\\u65e5\\u56fd\\u9645\\u521b\\u610f\\u57ce\\u5e02\\uff08\\u5357\\u4eac\\uff09\\u8bba\\u575b2"},{"url":"20180907\\/5b92621beea5e.jpg","alt":"2017\\u5e7411\\u670819\\u65e5\\u56fd\\u9645\\u521b\\u610f\\u57ce\\u5e02\\uff08\\u5357\\u4eac\\uff09\\u8bba\\u575b"}]}', 0, 0, 0, 0, 0, '2018-09-07 19:31:38', '2018-09-07 19:31:38', '南京·外秦淮', '商务', '', '', '', '', '', ''),
(121, 1, '', '', '2018-09-07 19:39:09', '<p><span style="font-size: 18px;">2016年5月10日林继东&amp;沈陶然婚礼</span></p>', '蝶恋花', '2016年5月10日林继东&amp;沈陶然婚礼', 1, 1, '2018-09-07 19:36:48', NULL, 0, NULL, '', 0, '{"thumb":"20180907\\/5b92633299997.jpg","photo":[{"url":"20180907\\/5b92633cea903.jpg","alt":"541522320038_"},{"url":"20180907\\/5b9263447b782.jpg","alt":"481522320036_"},{"url":"20180907\\/5b92634937417.jpg","alt":"491522320036_"},{"url":"20180907\\/5b92634e5a5b4.jpg","alt":"501522320037_"},{"url":"20180907\\/5b9263545adc6.jpg","alt":"531522320038_"},{"url":"20180907\\/5b926358d833f.jpg","alt":"551522320038_"}]}', 0, 0, 0, 0, 0, '2018-09-07 19:36:48', '2018-09-07 19:36:48', '南京·1865', '婚礼', '', '', '', '', '', ''),
(122, 1, '', '', '2018-09-07 19:42:34', '<p>2015年3月8日喻恩泰&amp;史林子婚礼</p>', '如鱼归林', '2015年3月8日喻恩泰&amp;史林子婚礼', 1, 1, '2018-09-07 19:39:24', NULL, 0, NULL, '', 0, '{"thumb":"20180907\\/5b92639c024f2.jpg","photo":[{"url":"20180907\\/5b9263e54142c.jpg","alt":"_55A9438"},{"url":"20180907\\/5b9263f02e95e.jpg","alt":"_V8A8830"},{"url":"20180907\\/5b9263fa3fdca.jpg","alt":"099A8538"},{"url":"20180907\\/5b9264019fd7b.jpg","alt":"DSC_6784"},{"url":"20180907\\/5b92640910a48.jpg","alt":"FM8A9292"},{"url":"20180907\\/5b926410afae7.jpg","alt":"FM8A9724"},{"url":"20180907\\/5b92641884c02.jpg","alt":"FM8A9792\\u526f\\u672c"},{"url":"20180907\\/5b926422b7968.jpg","alt":"LCM_5173"}]}', 0, 0, 0, 0, 0, '2018-09-07 19:39:24', '2018-09-07 19:39:24', '南京·1865', '婚礼', '', '', '', '', '', ''),
(123, 1, '', '', '2018-09-07 19:44:52', '<p>2014年9月7日体操冠军滕海滨&amp;张楠婚礼</p>', '楠海之滨', '2014年9月7日体操冠军滕海滨&amp;张楠婚礼', 1, 1, '2018-09-07 19:42:50', NULL, 0, NULL, '', 0, '{"thumb":"20180907\\/5b9264664031b.jpg","photo":[{"url":"20180907\\/5b9264846ab0c.jpg","alt":"_TA_9719_\\u770b\\u56fe\\u738b\\u526f\\u672c"},{"url":"20180907\\/5b92648befd78.jpg","alt":"1K0A5945=\\u526f\\u672c"},{"url":"20180907\\/5b92649623437.jpg","alt":"1K0A6137=\\u526f\\u672c"},{"url":"20180907\\/5b92649e75d7a.jpg","alt":"1K0A6473"},{"url":"20180907\\/5b9264a470259.jpg","alt":"4C0A0536_\\u770b\\u56fe\\u738b\\u526f\\u672c"},{"url":"20180907\\/5b9264af94ef6.jpg","alt":"ITA_5609_\\u770b\\u56fe\\u738b\\u526f\\u672c"}]}', 0, 0, 0, 0, 0, '2018-09-07 19:42:50', '2018-09-07 19:42:50', '南京·1865', '婚礼', '', '', '', '', '', ''),
(124, 1, '', '', '2018-09-07 19:52:34', '<p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b92667b78788.jpg" title="20170213-FA5A8040.jpg" alt="20170213-FA5A8040.jpg"/></p><p><br/></p>', '莫奈花园', '层高3.2米，会场面积160平方，剧院式可容纳100人，课桌式50人，独立舞台，设备有投影仪，音响话筒。', 1, 1, '2018-09-07 19:45:18', NULL, 0, NULL, '', 0, '{"thumb":"20180907\\/5b926662677b9.jpg"}', 0, 0, 0, 0, 0, '2018-09-07 19:45:18', '2018-09-07 19:45:18', '南京·1865', '商务', '100', '5米', '6桌', '大厅无柱', '2018年档期免收服务费', '20000元'),
(125, 1, '', '', '2018-09-07 19:54:45', '<p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b9266fd5d06e.jpg" style="" title="20170213-FA5A8113.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b9266fe56abf.jpg" style="" title="20170213-FA5A8121.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b9266fe7e1de.jpg" style="" title="20170213-FA5A8132.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b9266ff5c5a3.jpg" style="" title="20170213-FA5A8130.jpg"/></p><p><br/></p>', '爱琴海宴会厅', '层高7米，灯下5米，会场面积800平方，剧院式可容纳1000人，课桌式可容纳450人，全厅无柱,独立舞台50平，设备有高清P4大屏30平方，配套设施齐全的顶级声光电，3D全清投影。', 1, 1, '2018-09-07 19:52:57', NULL, 0, NULL, '', 0, '{"thumb":"20180907\\/5b9266be52e97.jpg"}', 0, 0, 0, 0, 0, '2018-09-07 19:52:57', '2018-09-07 19:52:57', '南京·1865', '商务', '460', '7米', '10桌', '大厅无柱  3D全息投影', '2018年档期免收服务费', '50000元'),
(126, 1, '', '', '2018-09-07 19:57:39', '<p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b9267ad85d66.jpg" style="" title="20170213-FA5A8174.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b9267addca34.jpg" style="" title="20170213-FA5A8176.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b9267ae2f044.jpg" style="" title="20170213-FA5A8173.jpg"/></p><p style="text-align: center"><img src="http://www.lavin.com.cn/data/upload/ueditor/20180907/5b9267aeba899.jpg" style="" title="20170213-FA5A8179.jpg"/></p><p><br/></p>', '天鹅湖宴会厅', '层高7米，灯下5米，会场面积500平方，剧院式可容纳500人，课桌式可容纳250人，全厅无柱，独立舞台48平，设备有高清P4大屏30平方，配套设施齐全的顶级声光电，3D全清投影。', 1, 1, '2018-09-07 19:55:04', NULL, 0, NULL, '', 0, '{"thumb":"20180907\\/5b926723cc34f.jpg"}', 0, 0, 0, 0, 0, '2018-09-07 19:55:04', '2018-09-07 19:55:04', '南京·1865', '商务', '250', '7米', '10桌', '大厅无柱  3D全息投影', '2018年档期免收服务费', '30000元'),
(127, 1, '', '', '2018-09-07 20:02:35', '<p>“绝地求生”主题生日会</p>', '“绝地求生”主题生日会', '“绝地求生”主题生日会', 1, 1, '2018-09-07 19:59:37', NULL, 0, NULL, '', 0, '{"thumb":"20180907\\/5b9268409a286.jpg","photo":[{"url":"20180907\\/5b9268d89f34e.jpg","alt":"\\u5fae\\u4fe1\\u56fe\\u7247_20180905180203"},{"url":"20180907\\/5b92690a5d52c.jpg","alt":"\\u5fae\\u4fe1\\u56fe\\u7247_20180905180154"},{"url":"20180907\\/5b9269108cfb0.jpg","alt":"\\u5fae\\u4fe1\\u56fe\\u7247_20180905180135"},{"url":"20180907\\/5b926917cf5f1.jpg","alt":"\\u5fae\\u4fe1\\u56fe\\u7247_20180905180240"},{"url":"20180907\\/5b926923ae730.jpg","alt":"\\u5fae\\u4fe1\\u56fe\\u7247_20180905180248"},{"url":"20180907\\/5b92692a5caa7.jpg","alt":"\\u5fae\\u4fe1\\u56fe\\u7247_20180905180258"},{"url":"20180907\\/5b92692fec17a.jpg","alt":"\\u5fae\\u4fe1\\u56fe\\u7247_20180905180308"},{"url":"20180907\\/5b9269367e19d.jpg","alt":"\\u5fae\\u4fe1\\u56fe\\u7247_20180905180325"},{"url":"20180907\\/5b92694039acd.jpg","alt":"\\u5fae\\u4fe1\\u56fe\\u7247_20180905180423"}]}', 0, 0, 0, 0, 0, '2018-09-07 19:59:37', '2018-09-07 19:59:37', '南京·1865', '商务', '', '', '', '', '', ''),
(128, 1, '', '', '2018-09-07 20:24:50', '', '2018年会钜惠', '2018年会钜惠', 1, 1, '2018-09-07 20:23:39', NULL, 0, NULL, '', 0, '{"thumb":"20180907\\/5b926e045f5ce.jpg"}', 0, 0, 0, 0, 0, '2018-09-10 20:23:00', '2018-12-28 00:00:00', '上海·外滩', '商务', '', '', '', '', '', ''),
(129, 1, '', '', '2018-09-07 20:26:48', '', '预定2018年婚礼档期，立享婚宴满5桌送1桌！', '预定2018年婚礼档期，立享婚宴满5桌送1桌！', 1, 1, '2018-09-07 20:25:43', NULL, 0, NULL, '', 0, '{"thumb":"20180907\\/5b926e8075c68.jpg"}', 0, 0, 0, 0, 0, '2018-09-10 20:25:00', '2018-10-31 00:00:00', '上海·外滩', '婚礼', '', '', '', '', '', ''),
(130, 1, '', '', '2018-09-07 20:28:35', '', '婚礼促销月开启，签单即送软饮无限畅饮及迎宾酒会！', '婚礼促销月开启，签单即送软饮无限畅饮及迎宾酒会！', 1, 1, '2018-09-07 20:26:52', NULL, 0, NULL, '', 0, '{"thumb":"20180907\\/5b926e9883480.jpg"}', 0, 0, 0, 0, 0, '2018-09-07 20:26:52', '2018-09-07 20:26:52', '天津·爱琴海', '婚礼', '', '', '', '', '', ''),
(131, 1, '', '', '2018-09-07 20:29:11', '', '2018年会钜惠', '2018年会钜惠', 1, 1, '2018-09-07 20:28:38', NULL, 0, NULL, '', 0, '{"thumb":"20180907\\/5b926f02eb72d.jpg"}', 0, 0, 0, 0, 0, '2018-09-07 20:28:38', '2018-09-07 20:28:38', '天津·爱琴海', '商务', '', '', '', '', '', ''),
(132, 1, '', '', '2018-09-07 20:29:46', '', '2019年婚礼订单，即享现金减免3000元起！', '2019年婚礼订单，即享现金减免3000元起！', 1, 1, '2018-09-07 20:29:13', NULL, 0, NULL, '', 0, '{"thumb":"20180907\\/5b926f2b758dc.jpg"}', 0, 0, 0, 0, 0, '2018-09-07 20:29:13', '2018-09-07 20:29:13', '南京·外秦淮', '婚礼', '', '', '', '', '', ''),
(133, 1, '', '', '2018-09-07 20:30:49', '', '生日宴代金券', '生日宴代金券', 1, 1, '2018-09-07 20:29:48', NULL, 0, NULL, '', 0, '{"thumb":"20180907\\/5b926f5c48b33.jpg"}', 0, 0, 0, 0, 0, '2018-09-07 20:29:48', '2018-09-07 20:29:48', '南京·外秦淮', '商务', '', '', '', '', '', ''),
(134, 1, '', '', '2018-09-07 20:31:22', '', '生日宴代金券', '生日宴代金券', 1, 1, '2018-09-07 20:30:51', NULL, 0, NULL, '', 0, '{"thumb":"20180907\\/5b926f950722f.jpg"}', 0, 0, 0, 0, 0, '2018-09-07 20:30:51', '2018-09-07 20:30:51', '南京·1865', '商务', '', '', '', '', '', ''),
(135, 1, '', '', '2018-09-07 20:32:03', '', '2018年婚期清档。试吃活动火爆进行中。进店即送大礼包。', '2018年婚期清档。试吃活动火爆进行中。进店即送大礼包。', 1, 1, '2018-09-07 20:31:24', NULL, 0, NULL, '', 0, '{"thumb":"20180907\\/5b926fbe06055.jpg"}', 0, 0, 0, 0, 0, '2018-09-07 20:31:24', '2018-09-07 20:31:24', '南京·1865', '婚礼', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `data_role`
--

CREATE TABLE IF NOT EXISTS `data_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '角色名称',
  `pid` smallint(6) DEFAULT NULL COMMENT '父角色ID',
  `status` tinyint(1) unsigned DEFAULT NULL COMMENT '状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `listorder` int(3) NOT NULL DEFAULT '0' COMMENT '排序字段',
  PRIMARY KEY (`id`),
  KEY `parentId` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='角色表' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `data_role`
--

INSERT INTO `data_role` (`id`, `name`, `pid`, `status`, `remark`, `create_time`, `update_time`, `listorder`) VALUES
(1, '超级管理员', 0, 1, '拥有网站最高管理员权限！', 1329633709, 1329633709, 0),
(2, '1', NULL, 1, '', 1527338435, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `data_role_user`
--

CREATE TABLE IF NOT EXISTS `data_role_user` (
  `role_id` int(11) unsigned DEFAULT '0' COMMENT '角色 id',
  `user_id` int(11) DEFAULT '0' COMMENT '用户id',
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户角色对应表';

-- --------------------------------------------------------

--
-- 表的结构 `data_route`
--

CREATE TABLE IF NOT EXISTS `data_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '路由id',
  `full_url` varchar(255) DEFAULT NULL COMMENT '完整url， 如：portal/list/index?id=1',
  `url` varchar(255) DEFAULT NULL COMMENT '实际显示的url',
  `listorder` int(5) DEFAULT '0' COMMENT '排序，优先级，越小优先级越高',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态，1：启用 ;0：不启用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='url路由表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `data_slide`
--

CREATE TABLE IF NOT EXISTS `data_slide` (
  `slide_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slide_cid` int(11) NOT NULL COMMENT '幻灯片分类 id',
  `slide_name` varchar(255) NOT NULL COMMENT '幻灯片名称',
  `slide_pic` varchar(255) DEFAULT NULL COMMENT '幻灯片图片',
  `slide_url` varchar(255) DEFAULT NULL COMMENT '幻灯片链接',
  `slide_des` varchar(255) DEFAULT NULL COMMENT '幻灯片描述',
  `slide_content` text COMMENT '幻灯片内容',
  `slide_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `listorder` int(10) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`slide_id`),
  KEY `slide_cid` (`slide_cid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='幻灯片表' AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `data_slide`
--

INSERT INTO `data_slide` (`slide_id`, `slide_cid`, `slide_name`, `slide_pic`, `slide_url`, `slide_des`, `slide_content`, `slide_status`, `listorder`) VALUES
(1, 1, '玫瑰里', '/data/upload/20180905/5b8f84bd79656.jpeg', '', '', '', 0, 1),
(5, 1, '上海外滩', '/data/upload/20180905/5b8f819d3c6a5.jpeg', '', '', '', 1, 3),
(6, 1, '天津爱琴海', '/data/upload/20180905/5b8f820037d55.jpeg', '', '', '', 1, 4),
(7, 1, '南京外秦淮', '/data/upload/20180905/5b8f824ba815e.jpeg', '', '', '', 1, 5),
(8, 1, '南京1865', '/data/upload/20180905/5b8f8270d6ae0.jpeg', '', '', '', 1, 6),
(4, 1, '北京太阳公元', '/data/upload/20180905/5b8f8165de814.jpeg', '', '', '', 1, 2);

-- --------------------------------------------------------

--
-- 表的结构 `data_slide_cat`
--

CREATE TABLE IF NOT EXISTS `data_slide_cat` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(255) NOT NULL COMMENT '幻灯片分类',
  `cat_idname` varchar(255) NOT NULL COMMENT '幻灯片分类标识',
  `cat_remark` text COMMENT '分类备注',
  `cat_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  PRIMARY KEY (`cid`),
  KEY `cat_idname` (`cat_idname`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='幻灯片分类表' AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `data_slide_cat`
--

INSERT INTO `data_slide_cat` (`cid`, `cat_name`, `cat_idname`, `cat_remark`, `cat_status`) VALUES
(1, '北京', 'mgl-banner', '婚庆和商务的首页、一站式服务、婚宴报价、关于玫瑰里公共幻灯', 1),
(2, '上海', 'sh-banner', '', 1),
(3, '天津', 'tj-banner', '', 1),
(4, '南京·外秦淮', 'njwq-banner', '', 1),
(5, '南京·1865', 'nj-banner', '', 1);

-- --------------------------------------------------------

--
-- 表的结构 `data_terms`
--

CREATE TABLE IF NOT EXISTS `data_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `name` varchar(200) DEFAULT NULL COMMENT '分类名称',
  `slug` varchar(200) DEFAULT '',
  `taxonomy` varchar(32) DEFAULT NULL COMMENT '分类类型',
  `description` longtext COMMENT '分类描述',
  `parent` bigint(20) unsigned DEFAULT '0' COMMENT '分类父id',
  `count` bigint(20) DEFAULT '0' COMMENT '分类文章数',
  `path` varchar(500) DEFAULT NULL COMMENT '分类层级关系路径',
  `seo_title` varchar(500) DEFAULT NULL,
  `seo_keywords` varchar(500) DEFAULT NULL,
  `seo_description` varchar(500) DEFAULT NULL,
  `list_tpl` varchar(50) DEFAULT NULL COMMENT '分类列表模板',
  `one_tpl` varchar(50) DEFAULT NULL COMMENT '分类文章页模板',
  `listorder` int(5) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布',
  PRIMARY KEY (`term_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Portal 文章分类表' AUTO_INCREMENT=21 ;

--
-- 转存表中的数据 `data_terms`
--

INSERT INTO `data_terms` (`term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status`) VALUES
(1, '婚宴场馆', '', 'article', '', 0, 0, '0-1', '', '', '', 'list-hlcg', 'article_hlcg', 0, 1),
(2, '一站式服务', '', 'article', '', 0, 0, '0-2', '', '', '', 'list_masonry', 'article', 0, 1),
(3, '婚宴报价', '', 'article', '', 0, 0, '0-3', '', '', '', 'list', 'article', 0, 1),
(4, '婚礼案例', '', 'article', '', 0, 0, '0-4', '', '', '', 'list_anli', 'article', 0, 1),
(5, '最新活动', '', 'article', '', 0, 0, '0-5', '', '', '', 'list_newact', 'article_newact', 0, 1),
(6, '在线预约', '', 'article', '', 0, 0, '0-6', '', '', '', 'list_yy', 'article', 0, 1),
(7, '关于玫瑰里', '', 'article', '', 0, 0, '0-7', '', '', '', 'list', 'article', 0, 1),
(8, '玫瑰里大事件', '', 'article', '', 7, 0, '0-7-8', '', '', '', 'list_dsj', 'article_dsj', 0, 1),
(9, '婚礼案例', '', 'article', '', 4, 0, '0-4-9', '', '', '', 'list_anli', 'article_anli', 0, 1),
(10, '婚礼实录', '', 'article', '', 4, 0, '0-4-10', '', '', '', 'list_shilu', 'article_shilu', 0, 1),
(11, '商务场馆', '', 'article', '', 0, 0, '0-11', '', '', '', 'list-hlcg', 'article_hlcg', 0, 1),
(14, '商务案例', '', 'article', '', 13, 0, '0-13-14', '', '', '', 'list_anli_sw', 'article_anli', 0, 1),
(13, '商务案例', '', 'article', '', 0, 0, '0-13', '', '', '', 'list_anli_sw', 'article', 0, 1),
(15, '商务实录', '', 'article', '', 13, 0, '0-13-15', '', '', '', 'list_shilu_sw', 'article_shilu', 0, 1),
(19, '图片', '', 'article', '', 8, 0, '0-7-8-19', '', '', '', 'list_dsj', 'article_dsj', 0, 1),
(20, '视频', '', 'article', '', 8, 0, '0-7-8-20', '', '', '', 'list_dsj', 'article_shilu', 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `data_term_relationships`
--

CREATE TABLE IF NOT EXISTS `data_term_relationships` (
  `tid` bigint(20) NOT NULL AUTO_INCREMENT,
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'posts表里文章id',
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布',
  PRIMARY KEY (`tid`),
  KEY `term_taxonomy_id` (`term_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Portal 文章分类对应表' AUTO_INCREMENT=136 ;

--
-- 转存表中的数据 `data_term_relationships`
--

INSERT INTO `data_term_relationships` (`tid`, `object_id`, `term_id`, `listorder`, `status`) VALUES
(1, 6, 5, 0, 1),
(5, 10, 9, 33, 1),
(6, 11, 10, 0, 1),
(24, 13, 1, 0, 0),
(23, 14, 4, 0, 1),
(9, 15, 6, 0, 1),
(10, 16, 5, 0, 1),
(11, 18, 3, 0, 0),
(12, 19, 1, 1, 0),
(13, 20, 5, 0, 1),
(14, 21, 1, 2, 0),
(15, 22, 1, 0, 0),
(16, 23, 1, 0, 0),
(17, 24, 1, 0, 0),
(18, 25, 1, 3, 1),
(19, 26, 1, 4, 1),
(20, 27, 1, 2, 1),
(21, 28, 1, 1, 1),
(22, 29, 11, 0, 1),
(25, 30, 1, 0, 0),
(26, 31, 1, 0, 0),
(27, 32, 1, 0, 0),
(33, 33, 15, 0, 0),
(29, 34, 10, 0, 0),
(30, 35, 10, 0, 0),
(32, 36, 15, 0, 0),
(34, 37, 10, 0, 0),
(35, 38, 15, 0, 0),
(36, 39, 14, 0, 1),
(37, 40, 14, 0, 1),
(38, 41, 9, 22, 1),
(39, 42, 10, 0, 1),
(40, 43, 1, 0, 0),
(41, 44, 1, 0, 0),
(42, 45, 1, 0, 0),
(43, 46, 3, 0, 0),
(45, 47, 11, 0, 1),
(46, 48, 3, 0, 1),
(47, 49, 1, 5, 1),
(48, 50, 1, 0, 1),
(49, 51, 1, 0, 1),
(50, 52, 1, 0, 1),
(51, 53, 1, 0, 1),
(52, 54, 1, 0, 1),
(53, 55, 11, 0, 0),
(54, 56, 1, 0, 1),
(55, 57, 1, 0, 1),
(56, 58, 1, 0, 1),
(57, 59, 1, 0, 1),
(59, 60, 19, 0, 1),
(60, 61, 11, 0, 1),
(61, 62, 9, 0, 1),
(62, 63, 9, 0, 1),
(63, 64, 9, 0, 1),
(64, 65, 9, 0, 1),
(65, 66, 1, 0, 1),
(66, 67, 1, 0, 1),
(67, 68, 9, 0, 0),
(68, 69, 9, 0, 1),
(69, 70, 9, 0, 1),
(70, 71, 9, 0, 1),
(71, 72, 9, 0, 1),
(72, 73, 9, 0, 1),
(73, 74, 9, 0, 1),
(74, 75, 9, 0, 1),
(75, 76, 9, 0, 1),
(76, 77, 9, 0, 1),
(77, 78, 9, 0, 1),
(78, 79, 9, 0, 1),
(79, 80, 9, 0, 1),
(80, 81, 19, 0, 1),
(81, 82, 19, 0, 1),
(82, 83, 19, 0, 1),
(83, 84, 16, 0, 0),
(84, 85, 11, 0, 1),
(85, 86, 14, 0, 1),
(86, 87, 14, 0, 1),
(87, 88, 14, 0, 1),
(88, 89, 11, 0, 1),
(89, 90, 9, 0, 1),
(90, 91, 11, 0, 1),
(91, 92, 11, 0, 1),
(93, 93, 19, 0, 1),
(94, 94, 19, 0, 1),
(95, 95, 19, 0, 1),
(96, 96, 14, 0, 1),
(97, 97, 14, 0, 1),
(98, 98, 11, 0, 1),
(99, 99, 11, 0, 1),
(100, 100, 11, 0, 1),
(101, 101, 14, 0, 1),
(102, 102, 14, 0, 1),
(103, 103, 14, 0, 1),
(104, 104, 19, 0, 1),
(105, 105, 19, 0, 1),
(106, 106, 19, 0, 1),
(107, 107, 1, 0, 1),
(108, 108, 1, 0, 1),
(109, 109, 9, 0, 1),
(110, 110, 9, 0, 1),
(111, 111, 19, 0, 1),
(112, 112, 19, 0, 1),
(113, 113, 1, 0, 0),
(114, 114, 19, 0, 1),
(115, 115, 11, 0, 1),
(116, 116, 11, 0, 1),
(117, 117, 11, 0, 1),
(118, 118, 14, 0, 1),
(119, 119, 14, 0, 1),
(120, 120, 14, 0, 1),
(121, 121, 19, 0, 1),
(122, 122, 19, 0, 1),
(123, 123, 19, 0, 1),
(124, 124, 11, 0, 1),
(125, 125, 11, 0, 1),
(126, 126, 11, 0, 1),
(127, 127, 14, 0, 1),
(128, 128, 5, 0, 1),
(129, 129, 5, 0, 1),
(130, 130, 5, 0, 1),
(131, 131, 5, 0, 1),
(132, 132, 5, 0, 1),
(133, 133, 5, 0, 1),
(134, 134, 5, 0, 1),
(135, 135, 5, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `data_users`
--

CREATE TABLE IF NOT EXISTS `data_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名',
  `user_pass` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码；sp_password加密',
  `user_nicename` varchar(50) NOT NULL DEFAULT '' COMMENT '用户美名',
  `user_email` varchar(100) NOT NULL DEFAULT '' COMMENT '登录邮箱',
  `user_url` varchar(100) NOT NULL DEFAULT '' COMMENT '用户个人网站',
  `avatar` varchar(255) DEFAULT NULL COMMENT '用户头像，相对于upload/avatar目录',
  `sex` smallint(1) DEFAULT '0' COMMENT '性别；0：保密，1：男；2：女',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `signature` varchar(255) DEFAULT NULL COMMENT '个性签名',
  `last_login_ip` varchar(16) DEFAULT NULL COMMENT '最后登录ip',
  `last_login_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '最后登录时间',
  `create_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '注册时间',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '' COMMENT '激活码',
  `user_status` int(11) NOT NULL DEFAULT '1' COMMENT '用户状态 0：禁用； 1：正常 ；2：未验证',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `user_type` smallint(1) DEFAULT '1' COMMENT '用户类型，1:admin ;2:会员',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '金币',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  PRIMARY KEY (`id`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='用户表' AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `data_users`
--

INSERT INTO `data_users` (`id`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `avatar`, `sex`, `birthday`, `signature`, `last_login_ip`, `last_login_time`, `create_time`, `user_activation_key`, `user_status`, `score`, `user_type`, `coin`, `mobile`) VALUES
(1, 'admin', '###860d4a9905843a85391d8d05adef5748', 'admin', 'mindasiy@sina.com', '', NULL, 0, NULL, NULL, '127.0.0.1', '2018-09-09 08:52:34', '2018-04-23 12:52:27', '', 1, 0, 1, 0, ''),
(2, '', '###7878661376f0427be5e6bfbfc0e049ee', 'test1', '1@qq.com', '', '5afa70929a7c1.png', 0, NULL, NULL, '58.213.52.234', '2018-05-30 15:16:40', '2018-05-14 13:48:10', '', 1, 0, 2, 0, '15240246781'),
(3, '', '###7878661376f0427be5e6bfbfc0e049ee', '1', '', '', NULL, 0, NULL, NULL, '222.94.192.109', '2018-07-07 11:22:49', '2018-07-07 11:22:49', '', 1, 0, 2, 0, '15240246789'),
(4, '', '###ad6c737ba456aef9526cba2f17e03181', '1', '', '', NULL, 0, NULL, NULL, '58.213.52.234', '2018-07-18 18:27:11', '2018-07-07 11:24:14', '', 1, 0, 2, 0, '15240246782'),
(5, '', '###037af0e2fd56c983b631f19e00d7b7ad', 'linkmedias', '', '', NULL, 0, NULL, NULL, '1.202.16.249', '2018-08-31 16:54:38', '2018-08-31 16:54:38', '', 1, 0, 2, 0, '18618108024'),
(6, '', '###9aa797bfa0b7d849adb71ab7529ca80f', '931460477@qq.com', '', '', NULL, 0, NULL, NULL, '111.56.31.34', '2018-09-04 11:07:44', '2018-09-04 11:04:39', '', 1, 0, 2, 0, '15801602009'),
(7, '', '###6c9913b9d00f431e092587da333994f4', '赵小兜', '', '', NULL, 0, NULL, NULL, '106.39.79.194', '2018-09-06 09:52:30', '2018-09-04 11:17:08', '', 1, 0, 2, 0, '13810566129'),
(8, '', '###68a203b39feef1029f8d577422a6567c', '克里斯托', '', '', NULL, 0, NULL, NULL, '117.107.156.162', '2018-09-05 14:39:39', '2018-09-05 14:39:39', '', 1, 0, 2, 0, '13693267266');

-- --------------------------------------------------------

--
-- 表的结构 `data_user_favorites`
--

CREATE TABLE IF NOT EXISTS `data_user_favorites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) DEFAULT NULL COMMENT '用户 id',
  `title` varchar(255) DEFAULT NULL COMMENT '收藏内容的标题',
  `url` varchar(255) DEFAULT NULL COMMENT '收藏内容的原文地址，不带域名',
  `description` varchar(500) DEFAULT NULL COMMENT '收藏内容的描述',
  `table` varchar(50) DEFAULT NULL COMMENT '收藏实体以前所在表，不带前缀',
  `object_id` int(11) DEFAULT NULL COMMENT '收藏内容原来的主键id',
  `createtime` int(11) DEFAULT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户收藏表' AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
