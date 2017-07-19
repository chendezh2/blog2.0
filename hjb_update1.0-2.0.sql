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














