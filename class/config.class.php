<?php
class Config
{
	private static $db = array(
		'host' => 'localhost:6352',
		'user' => 'root',
		'pwd' => 'c114js',
		'database' => 'blog'
	);
	//全体页面背景色
	const BG_COLOR = '#cce8cf';

	public static function getDbConfig()
	{
		return self::$db;
	}
}