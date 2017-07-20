#appapi使用的app和secret机制的表，并插入一条当前使用的记录
CREATE TABLE `appapi` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(50) NOT NULL COMMENT 'app名称',
	`secret` VARCHAR(50) NOT NULL COMMENT 'app密钥',
	`create_time` INT(11) NOT NULL COMMENT '创建时间',
	PRIMARY KEY (`id`),
	INDEX `idx_name` (`name`)
)
COMMENT='appapi应用使用的app列表'
COLLATE='utf8_general_ci'
ENGINE=InnoDB;

INSERT INTO `appapi` (`id`, `name`, `secret`, `create_time`) VALUES (1, 'hjb9472', 'baf3d1c607bac8620dfaadbf2803dafc', 1471189810);

#member表添加一个字段，用于自动登录时的认证
ALTER TABLE `member` ADD COLUMN `auth_key` VARCHAR(32) NOT NULL DEFAULT '' COMMENT '自动登录的认证key' AFTER `password`;

#错误日志表添加一些字段，记录详细信息
ALTER TABLE `error_log`
	ADD COLUMN `app` VARCHAR(50) NOT NULL COMMENT '请求的app' AFTER `content`,
	ADD COLUMN `url` VARCHAR(500) NOT NULL COMMENT '请求地址' AFTER `app`,
	ADD COLUMN `get` TEXT NOT NULL COMMENT 'get参数' AFTER `url`,
	ADD COLUMN `post` LONGTEXT NOT NULL COMMENT 'post参数' AFTER `get`,
	ADD COLUMN `cookie` TEXT NOT NULL COMMENT 'cookie参数' AFTER `post`;

#已删除的用户表
CREATE TABLE `member_deleted` (
	`id` INT(11) NOT NULL,
	`name` VARCHAR(50) NOT NULL COMMENT '用户名(手机号)',
	`password` VARCHAR(32) NOT NULL COMMENT '登录密码',
	`auth_key` VARCHAR(32) NOT NULL DEFAULT '' COMMENT '自动登录的认证key',
	`email` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '用户email',
	`status` ENUM('1','2') NOT NULL DEFAULT '1' COMMENT '用户状态：1-关闭、2-活动',
	`desc` VARCHAR(255) NOT NULL DEFAULT '' COMMENT '用户说明',
	`location` VARCHAR(20) NOT NULL DEFAULT '' COMMENT '所在城市',
	`create_time` INT(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
	`last_login_time` INT(11) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
	`delete_time` INT(11) NOT NULL DEFAULT '0' COMMENT '删除时间',
	PRIMARY KEY (`id`),
	INDEX `idx_name` (`name`)
)
COMMENT='已删除的用户表'
COLLATE='utf8_general_ci'
ENGINE=InnoDB;

#该功能暂时不做，表先大概设计一下
#后台管理员操作日志表
CREATE TABLE `admin_log` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`admin_id` INT(11) NOT NULL COMMENT '管理员ID',
	`category` INT(3) NOT NULL COMMENT '操作种类(操作的表名对应的数字标记)',
	`type` INT(3) NOT NULL COMMENT '操作类型(create、delete、login等等对应的数字标记)',
	`record_id` INT(11) NOT NULL COMMENT '操作的记录对应的ID',
	`record_name` VARCHAR(500) NOT NULL COMMENT '操作的记录对应的名称类型的字段',
	`content` TEXT NOT NULL COMMENT '操作内容',
	`create_time` INT(11) NOT NULL COMMENT '操作时间',
	PRIMARY KEY (`id`),
	INDEX `idx_admin_id` (`admin_id`),
	INDEX `idx_category_record_id` (`category`, `record_id`)
)
COMMENT='管理员操作日志表'
COLLATE='utf8_general_ci'
ENGINE=InnoDB;








