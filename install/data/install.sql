--
-- 表的结构 `pre_common_menu`
--

DROP TABLE IF EXISTS `pre_common_menu`;
CREATE TABLE IF NOT EXISTS `pre_common_menu` (
  `menu_id` int(10) NOT NULL AUTO_INCREMENT,
  `menu_pid` int(10) NOT NULL DEFAULT '0' COMMENT '父级id',
  `position` varchar(32) DEFAULT '' COMMENT '菜单位置,空=未知位置,admin_index=后台首页,index_index前台首页,user_index=用户个人首页,命名原理=入口页码名称_mod(后台是action)',
  `sub_position` varchar(20) DEFAULT '' COMMENT '其余位置,do=show_tea,若存在三级菜单则do=show_tea&other=parameter',
  `name_var` varchar(50) DEFAULT '' COMMENT '菜单语言变量名称',
  `url` varchar(255) DEFAULT '' COMMENT '完整URL路径',
  `sort` tinyint(4) DEFAULT '0' COMMENT '排序编号',
  `enable` tinyint(1) DEFAULT '1' COMMENT '菜单是否启用,1=启用,0=不启用',
  `isdelete` tinyint(1) unsigned zerofill DEFAULT '0',
  PRIMARY KEY (`menu_id`),
  KEY `position` (`position`) USING BTREE,
  KEY `sub_position` (`sub_position`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1011 ;

-- --------------------------------------------------------

--
-- 表的结构 `pre_common_setting`
--

DROP TABLE IF EXISTS `pre_common_setting`;
CREATE TABLE IF NOT EXISTS `pre_common_setting` (
  `skey` varchar(255) NOT NULL DEFAULT '',
  `svalue` text,
  PRIMARY KEY (`skey`),
  KEY `skey` (`skey`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `pre_common_syscache`
--

DROP TABLE IF EXISTS `pre_common_syscache`;
CREATE TABLE IF NOT EXISTS `pre_common_syscache` (
  `cname` varchar(32) NOT NULL,
  `ctype` tinyint(3) unsigned NOT NULL,
  `dateline` int(10) unsigned NOT NULL,
  `data` mediumtext NOT NULL,
  PRIMARY KEY (`cname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `pre_content`
--

DROP TABLE IF EXISTS `pre_content`;
CREATE TABLE `pre_content` (
  `info_id` int(10) NOT NULL AUTO_INCREMENT,
  `info_cateid` int(10) unsigned zerofill DEFAULT '0000000000',
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `info_img` varchar(255) DEFAULT NULL,
  `create_dateline` int(10) DEFAULT '0' COMMENT '创建时间',
  `modify_dateline` int(10) DEFAULT '0' COMMENT '修改时间',
  `isfrontpage` tinyint(1) DEFAULT '0' COMMENT '是否首页显示1表示首页显示,否则不显示',
  `frontpage_order` tinyint(1) DEFAULT '0' COMMENT '首页焦点排序1,2,3,4,5,6',
  `isdelete` tinyint(1) DEFAULT '0' COMMENT '逻辑删除 1为删除 0为未删除',
  PRIMARY KEY (`info_id`),
  KEY `title` (`title`) USING BTREE,
  KEY `info_cateid` (`info_cateid`) USING BTREE,
  KEY `isfrontpage` (`isfrontpage`),
  KEY `frontpage_order` (`frontpage_order`),
  KEY `isdelete` (`isdelete`),
  FULLTEXT KEY `content` (`content`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 表的结构 `pre_content_cate`
--

-- ----------------------------
-- Table structure for `pre_content_cate`
-- ----------------------------
DROP TABLE IF EXISTS `pre_content_cate`;
CREATE TABLE `pre_content_cate` (
  `info_cateid` int(10) NOT NULL AUTO_INCREMENT,
  `info_catepid` int(10) DEFAULT NULL,
  `relate_info_cateid` int(10) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `cate_desc` tinytext,
  `create_dateline` int(10) DEFAULT '0' COMMENT '创建时间',
  `modify_dateline` int(10) DEFAULT '0' COMMENT '修改时间',
  `isdelete` tinyint(1) DEFAULT '0' COMMENT '逻辑删除 1为删除 0为未删除',
  PRIMARY KEY (`info_cateid`),
  KEY `title` (`title`) USING BTREE,
  KEY `info_catepid` (`info_catepid`) USING BTREE,
  KEY `isdelete` (`isdelete`),
  KEY `relate_info_cateid` (`relate_info_cateid`),
  FULLTEXT KEY `cate_desc` (`cate_desc`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `pre_friendlink`
--

DROP TABLE IF EXISTS `pre_friendlink`;
CREATE TABLE IF NOT EXISTS `pre_friendlink` (
  `fl_id` int(10) NOT NULL AUTO_INCREMENT,
  `fl_title` varchar(64) DEFAULT NULL,
  `fl_url` varchar(128) DEFAULT NULL,
  `create_dateline` int(10) DEFAULT NULL,
  `modify_dateline` int(10) DEFAULT NULL,
  `isdelete` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`fl_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- 表的结构 `pre_users`
--

DROP TABLE IF EXISTS `pre_users`;
CREATE TABLE IF NOT EXISTS `pre_users` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(64) DEFAULT NULL,
  `user_realname` varchar(32) DEFAULT NULL,
  `user_password` varchar(64) DEFAULT NULL,
  `user_group_id` mediumint(8) DEFAULT NULL,
  `user_role_id` mediumint(8) DEFAULT NULL,
  `user_level_id` mediumint(8) DEFAULT NULL,
  `user_detail_id` mediumint(8) DEFAULT NULL,
  `user_create_time` varchar(32) DEFAULT NULL,
  `user_modify_time` varchar(32) DEFAULT NULL,
  `isdelete` tinyint(1) unsigned zerofill DEFAULT '0',
  PRIMARY KEY (`user_id`),
  KEY `user_name` (`user_name`) USING BTREE,
  KEY `user_realname` (`user_realname`) USING BTREE,
  KEY `user_role_id` (`user_role_id`) USING BTREE,
  KEY `user_group_id` (`user_group_id`) USING BTREE,
  KEY `user_level_id` (`user_level_id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

-- --------------------------------------------------------

--
-- 表的结构 `pre_user_access`
--

DROP TABLE IF EXISTS `pre_user_access`;
CREATE TABLE IF NOT EXISTS `pre_user_access` (
  `access_id` int(12) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL,
  `access_mod` varchar(32) DEFAULT NULL,
  `access_action` varchar(32) DEFAULT NULL,
  `access_do` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`access_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- 表的结构 `pre_user_group`
--

DROP TABLE IF EXISTS `pre_user_group`;
CREATE TABLE IF NOT EXISTS `pre_user_group` (
  `group_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `group_name` varbinary(64) DEFAULT NULL,
  `group_description` text,
  `group_role` int(11) DEFAULT NULL,
  `group_create_time` varchar(32) DEFAULT NULL,
  `group_modify_time` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `pre_user_level`
--

DROP TABLE IF EXISTS `pre_user_level`;
CREATE TABLE IF NOT EXISTS `pre_user_level` (
  `level_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `level_name` varchar(64) DEFAULT NULL,
  `isdelete` tinyint(1) unsigned zerofill DEFAULT '0',
  PRIMARY KEY (`level_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `pre_user_role`
--

DROP TABLE IF EXISTS `pre_user_role`;
CREATE TABLE IF NOT EXISTS `pre_user_role` (
  `role_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(64) DEFAULT NULL,
  `isdelete` tinyint(1) unsigned zerofill DEFAULT '0',
  PRIMARY KEY (`role_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

-- --------------------------------------------------------

--
-- 表的结构 `pre_user_role_menu`
--

DROP TABLE IF EXISTS `pre_user_role_menu`;
CREATE TABLE IF NOT EXISTS `pre_user_role_menu` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) DEFAULT '0' COMMENT '菜单唯一编号',
  `role_id` tinyint(4) DEFAULT '0' COMMENT '角色菜单对应的角色id',
  `user_id` int(10) DEFAULT '0' COMMENT '用户菜单对应的用户uid,若登陆用户的用户菜单为空则取该用户角色菜单作为用户登录后的初始化菜单,无角色用户不允许登陆,uid=0为游客菜单',
  PRIMARY KEY (`id`),
  KEY `menu_id` (`menu_id`) USING BTREE,
  KEY `role_id` (`role_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=251 ;

-- --------------------------------------------------------

--
-- 表的结构 `pre_weibo_hide_area`
--

DROP TABLE IF EXISTS `pre_weibo_hide_area`;
CREATE TABLE IF NOT EXISTS `pre_weibo_hide_area` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT '0',
  `weibo_id` int(10) DEFAULT '0',
  `adre` varchar(64) DEFAULT NULL,
  `longitude` varchar(32) DEFAULT NULL,
  `latitude` varchar(32) DEFAULT NULL,
  `range` int(10) DEFAULT NULL,
  `dateline` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `weibo_id` (`weibo_id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=157 ;

-- --------------------------------------------------------

--
-- 表的结构 `pre_weibo_long_lat`
--

DROP TABLE IF EXISTS `pre_weibo_long_lat`;
CREATE TABLE IF NOT EXISTS `pre_weibo_long_lat` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL,
  `weibo_id` int(10) DEFAULT NULL,
  `longitude` varchar(32) DEFAULT NULL,
  `latitude` varchar(32) DEFAULT NULL,
  `address` varchar(128) DEFAULT NULL,
  `dateline` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dateline` (`dateline`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `weibo_id` (`weibo_id`) USING BTREE,
  KEY `longitude` (`longitude`) USING BTREE,
  KEY `latitude` (`latitude`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1707 ;

-- --------------------------------------------------------

--
-- 表的结构 `pre_weibo_users`
--

DROP TABLE IF EXISTS `pre_weibo_users`;
CREATE TABLE IF NOT EXISTS `pre_weibo_users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT '0',
  `weibo_id` varchar(64) DEFAULT '0',
  `weibo_name` varchar(64) DEFAULT NULL,
  `run_time_start` time DEFAULT '08:00:00',
  `run_time_end` time DEFAULT '20:00:00',
  `send_weibo_check` tinyint(1) DEFAULT '1',
  `trigger_limit` int(3) unsigned DEFAULT '100',
  `trigger_limit_left` int(3) DEFAULT '100',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `weibo_id` (`weibo_id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- 限制导出的表
--

--
-- 限制表 `pre_user_role_menu`
--
ALTER TABLE `pre_user_role_menu`
  ADD CONSTRAINT `pre_user_role_menu_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `pre_common_menu` (`menu_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 表的结构 `pre_language`
--
DROP TABLE IF EXISTS `pre_language`;
CREATE TABLE IF NOT EXISTS `pre_language` (
  `tran_id` int(10) NOT NULL AUTO_INCREMENT,
  `tran_src_id` int(10) DEFAULT NULL,
  `tran_language_var` char(6) DEFAULT NULL,
  `tran_language_mod` varchar(16) DEFAULT NULL,
  `tran_language_title` varchar(128) DEFAULT NULL,
  `tran_language_content` text,
  `create_dateline` int(10) DEFAULT NULL,
  `modify_dateline` int(10) DEFAULT NULL,
  `isdelete` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`tran_id`),
  KEY `tran_src_id` (`tran_src_id`),
  KEY `tran_language_var` (`tran_language_var`),
  KEY `tran_language_mod` (`tran_language_mod`),
  KEY `isdelete` (`isdelete`),
  KEY `tran_language_title` (`tran_language_title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `pre_map_lng_lat`;
CREATE TABLE `pre_map_lng_lat` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `sn_mac` varchar(32) DEFAULT NULL,
  `latitude` varchar(32) DEFAULT NULL,
  `longitude` varchar(32) DEFAULT NULL,
  `dateline` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sn_mac` (`sn_mac`) USING BTREE,
  KEY `dateline` (`dateline`) USING BTREE,
  KEY `longitude` (`longitude`) USING BTREE,
  KEY `latitude` (`latitude`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE  `pre_users` ADD  `user_score` INT( 10 ) NULL DEFAULT  '0' COMMENT  '用户积分' AFTER  `user_detail_id` ,
ADD INDEX (  `user_score` ) ;

ALTER TABLE  `pre_common_menu` ADD  `self_style` varchar(32) DEFAULT NULL COMMENT  '自定义菜单样式' AFTER  `sort` ;

DROP TABLE IF EXISTS `pre_dictionary`;
CREATE TABLE IF NOT EXISTS `pre_dictionary` (
  `d_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `d_name` varchar(255) DEFAULT NULL,
  `d_level` tinyint(4) DEFAULT NULL,
  `d_parent_id` bigint(20) DEFAULT NULL,
  `d_root_id` bigint(20) DEFAULT NULL,
  `d_order` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`d_id`),
  KEY `d_name` (`d_name`),
  KEY `d_level` (`d_level`),
  KEY `d_parent_id` (`d_parent_id`),
  KEY `d_root_id` (`d_root_id`),
  KEY `d_order` (`d_order`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='存放系统区域等各类信息数据' AUTO_INCREMENT=1 ;
