<?php
class Config
{
	//数据库配置
	private static $db = array(
		'host' => 'localhost:6352',
		'user' => 'root',
		'pwd' => 'c114js',
		'database' => 'blog'
	);
	//全体页面背景色
	const BG_COLOR = '#cce8cf';
	//博客图片目录
	const BLOG_IMG_PATH = '';
	//附件目录
	const ATTACHMENT_PATH = '';

	public static function getDbConfig()
	{
		return self::$db;
	}
}