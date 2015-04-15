DROP TABLE IF EXISTS `attachment`;
CREATE TABLE `attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blog_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属博客id',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '附件路径',
  `origin_name` VARCHAR(255) NOT NULL DEFAULT '' COMMENT '原始文件名',
  `creation_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `modification_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `is_deleted` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否被删除',
  PRIMARY KEY (`id`),
  KEY `blog_id` (`blog_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表';

DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '博客标题',
  `content` text NOT NULL COMMENT '博客正文',
  `attachments` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '拥有的附件数量',
  `creation_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `modification_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `is_deleted` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否被删除',
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='博客表';

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '分类名称',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '父分类id',
  `level` int(2) NOT NULL DEFAULT '1' COMMENT '几级分类,顶级分类为1',
  `blogs` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '分类下包含的博客数量',
  `creation_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `modification_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `is_deleted` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否被删除',
  PRIMARY KEY (`id`),
  INDEX `parent_id` (`parent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='博文分类';