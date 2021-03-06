DROP TABLE IF EXISTS `sys_account`;
CREATE TABLE `sys_account` (
  `id` int(10)  NOT NULL AUTO_INCREMENT,
  `username` varchar(32) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL,
  `mobile` char(11) DEFAULT NULL,
  `password` char(32) DEFAULT NULL,
  `realname` varchar(32) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT 1,
  `last_login_ip` varchar(15) DEFAULT NULL COMMENT '最后登录ip',
  `last_login_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(10) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
   UNIQUE INDEX `username_uq_index` (`username`),
   UNIQUE INDEX `email_uq_index` (`email`),
   UNIQUE INDEX `mobile_uq_index` (`mobile`) 
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 COMMENT='系统账号表';
-- ----------------------------
--  Table structure for `resources`
-- ----------------------------
DROP TABLE IF EXISTS `sys_resources`;
CREATE TABLE `sys_resources` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) DEFAULT NULL COMMENT '父ID，顶级为0',
  `module_id` int(10) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL COMMENT '资源名称',
  `code` varchar(200) DEFAULT NULL COMMENT '资源编码(url,按钮编码等)',
  `type` ENUM('menu', 'uri','button') DEFAULT NULL,
  `icon` varchar(50) DEFAULT NULL COMMENT '资源图标',
  `enabled` tinyint(1) DEFAULT 1,
  `sort` int(10) DEFAULT NULL COMMENT '排序',
  `created_at` datetime DEFAULT NULL,
  `created_by` int(10) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 COMMENT='资源';

-- ----------------------------
--  Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL COMMENT '角色名称',
  `memo` varchar(100) DEFAULT NULL COMMENT '备注',
  `enabled` tinyint(1) DEFAULT 1,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(10) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
--  Table structure for `account_r_roles`
-- ----------------------------
DROP TABLE IF EXISTS `sys_account_roles`;
CREATE TABLE `sys_account_roles` (
  `account_id` int(10) NOT NULL COMMENT '用户ID',
  `role_id` int(10) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`account_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

-- ----------------------------
--  Table structure for `role_r_resources`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_resources`;
CREATE TABLE `sys_role_resources` (
  `role_id` int(10) NOT NULL COMMENT '角色ID',
  `resource_id` int(10) NOT NULL COMMENT '资源ID',
  PRIMARY KEY (`role_id`,`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色与资源对应关系';

DROP TABLE IF EXISTS `sys_module`;
CREATE TABLE `sys_module` (
  `id` int(10)  NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `service_id` varchar(32) DEFAULT NULL,
  `route_name` varchar(32) DEFAULT NULL,
  `cors_uris` varchar(200) DEFAULT NULL  COMMENT '可跨域uri集合(多个;隔开)',
  `internal` tinyint(1) DEFAULT 0  COMMENT '是否内部服务模块',
  `enabled` tinyint(1) DEFAULT 1,
  `apidoc_url` varchar(100) DEFAULT NULL,
  `api_infos` TEXT DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(10) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 COMMENT='系统业务模块';


DROP TABLE IF EXISTS `sys_logs`;
CREATE TABLE `sys_logs` (
  `id` int(10)  NOT NULL AUTO_INCREMENT,
  `request_id` varchar(100) DEFAULT NULL,
  `module_id` int(10) DEFAULT NULL,
  `module` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `uri` varchar(100) DEFAULT NULL,
  `origin` varchar(100) DEFAULT NULL,
  `request_datas` text DEFAULT NULL,
  `request_ip` varchar(15) DEFAULT NULL,
  `request_at` datetime DEFAULT NULL,
  `response_at` datetime DEFAULT NULL,
  `request_uid` int(10) DEFAULT NULL,
  `request_uname` varchar(32) DEFAULT NULL,
  `response_code` varchar(6) DEFAULT NULL,
  `response_msg` varchar(100) DEFAULT NULL,
  `exception` text DEFAULT NULL,
  `use_time` int(10) DEFAULT NULL,
  `entrylog` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 COMMENT='系统操作日志';


DROP TABLE IF EXISTS `sys_api_statistics`;
CREATE TABLE `sys_api_statistics` (
  `id` int(10)  NOT NULL AUTO_INCREMENT,
  `api_name` varchar(32) DEFAULT NULL,
  `api_uri` varchar(100) DEFAULT NULL,
  `call_nums` int(8) DEFAULT 0,
  `fail_nums` int(8) DEFAULT 0,
  `stat_date` date DEFAULT NULL,
  `min_use_time` int(10) DEFAULT NULL,
  `max_use_time` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 COMMENT='接口调用统计';

INSERT INTO `sys_account` (`id`,`username`, `email`, `mobile`, `password`, `enabled`,`created_at`) VALUES ('1','admin', 'vakinge@gmail.com', '13800138001', '91373cc449e43d6142f423ec78b72dcc', '1','2018-03-03 12:55:30');
INSERT INTO `sys_module` (`id`,`name`, `service_id`, `route_name`, `internal`, `enabled`,`apidoc_url`) VALUES ('1','基础平台', 'oneplatform', '/', '0', '1','/api/swagger-ui.html');
INSERT INTO `sys_module` (`id`,`name`, `service_id`, `route_name`, `internal`, `enabled`,`apidoc_url`) VALUES ('2','通用服务', 'common-service', 'common', '0', '1','/api/common/swagger-ui.html');


INSERT INTO `sys_role` (`id`, `name`) VALUES ('1000', '系统管理员');

INSERT INTO `sys_resources` (`id`,`parent_id`, `module_id`, `name`, `type`, `enabled`) VALUES ('1000','0', '1', '系统管理', 'menu', '1');
INSERT INTO `sys_resources` (`id`,`parent_id`, `module_id`, `name`,`code`, `type`, `enabled`) VALUES ('1001','1000', '1', '模块管理','/modules/module/list.html', 'menu', '1');
INSERT INTO `sys_resources` (`id`,`parent_id`, `module_id`, `name`,`code`,`type`, `enabled`) VALUES ('1002','1000', '1', '日志管理', '/modules/log/list.html','menu', '1');
INSERT INTO `sys_resources` (`id`,`parent_id`, `module_id`, `name`, `type`, `enabled`) VALUES ('2000','0', '1', '权限管理', 'menu', '1');
INSERT INTO `sys_resources` (`id`,`parent_id`, `module_id`, `name`,`code`, `type`, `enabled`) VALUES ('2001','2000', '1', '用户管理','/modules/account/list.html', 'menu', '1');
INSERT INTO `sys_resources` (`id`,`parent_id`, `module_id`, `name`,`code`,`type`, `enabled`) VALUES ('2002','2000', '1', '角色管理', '/modules/role/list.html','menu', '1');
INSERT INTO `sys_resources` (`id`,`parent_id`, `module_id`, `name`,`code`,`type`, `enabled`) VALUES ('2003','2000', '1', '权限管理', '/modules/resource/permissions.html','menu', '1');
INSERT INTO `sys_resources` (`id`,`parent_id`, `module_id`, `name`,`code`,`type`, `enabled`) VALUES ('2004','2000', '1', '菜单管理', '/modules/resource/menus.html','menu', '1');
INSERT INTO `sys_resources` (`id`,`parent_id`, `module_id`, `name`, `type`, `enabled`) VALUES ('3000','0', '1', '系统监控', 'menu', '1');
INSERT INTO `sys_resources` (`id`,`parent_id`, `module_id`, `name`,`code`, `type`, `enabled`) VALUES ('3001','3000', '1', '定时任务监控','/modules/monitor/schedule.html', 'menu', '1');
INSERT INTO `sys_resources` (`id`,`parent_id`, `module_id`, `name`,`code`,`type`, `enabled`) VALUES ('3002','3000', '1', 'kafka监控', '/modules/monitor/kafka.html','menu', '1');
INSERT INTO `sys_resources` (`id`,`parent_id`, `module_id`, `name`, `type`, `enabled`) VALUES ('4000','0', '2', '通用服务', 'menu', '1');
INSERT INTO `sys_resources` (`id`,`parent_id`, `module_id`, `name`,`code`, `type`, `enabled`) VALUES ('4001','4000', '2', '文件管理','/modules/common/files.html', 'menu', '1');


INSERT INTO `sys_account_roles` (`account_id`, `role_id`) VALUES ('1', '1000');
INSERT INTO `sys_role_resources` (`role_id`,`resource_id`) VALUES ('1000', '1001');
INSERT INTO `sys_role_resources` (`role_id`,`resource_id`) VALUES ('1000', '1002');
INSERT INTO `sys_role_resources` (`role_id`,`resource_id`) VALUES ('1000', '2001');
INSERT INTO `sys_role_resources` (`role_id`,`resource_id`) VALUES ('1000', '2002');
INSERT INTO `sys_role_resources` (`role_id`,`resource_id`) VALUES ('1000', '2003');
INSERT INTO `sys_role_resources` (`role_id`,`resource_id`) VALUES ('1000', '2004');
INSERT INTO `sys_role_resources` (`role_id`,`resource_id`) VALUES ('1000', '3001');
INSERT INTO `sys_role_resources` (`role_id`,`resource_id`) VALUES ('1000', '3002');
INSERT INTO `sys_role_resources` (`role_id`,`resource_id`) VALUES ('1000', '4001');
