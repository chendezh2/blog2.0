<?php
set_time_limit(0);
error_reporting(E_ALL);
date_default_timezone_set('Asia/Shanghai');
//date_default_timezone_set('Etc/GMT');
ini_set('memory_limit','1024M');
header("Content-type:text/html;charset=utf-8");

mb_internal_encoding("UTF-8");//设置内部字符编码为UTF-8
//echo mb_internal_encoding();//显示内部字符编码

define('ROOT_PATH', str_replace('init.php', '', str_replace('\\', '/', __FILE__)));
define('ADMIN_PATH', ROOT_PATH.'admin/');

//载入配置类
include_once(ROOT_PATH.'class/config.class.php');
//载入数据库类
include_once(ROOT_PATH.'class/mysql.class.php');
$db = mysql::getInstance(Config::getDbConfig());
//载入基本类
include_once(ROOT_PATH.'class/string.class.php');
//载入分页类
include_once(ROOT_PATH.'class/page.class.php');
$pageClass = new Page();
//载入博客分类的相关类文件
include_once(ROOT_PATH.'class/category.class.php');

//载入数据函数文件
include_once(ROOT_PATH.'function/mysql.function.php');
//载入文件上传函数文件
include_once(ROOT_PATH.'function/upload.function.php');

/* 对用户传入的变量进行转义操作。*/
if (!get_magic_quotes_gpc())
{
    if (!empty($_GET))
    {
        $_GET  = String::addslashes_deep($_GET);
    }
    if (!empty($_POST))
    {
        $_POST = String::addslashes_deep($_POST);
    }

    $_COOKIE   = String::addslashes_deep($_COOKIE);
    $_REQUEST  = String::addslashes_deep($_REQUEST);
}
//全体页面背景色
define('BG_COLOR', Config::BG_COLOR);

//模板必须要赋值的变量
$templete_var = array(
	'title',//页面标题
	'include_script',//头部载入的js文件
	'include_css',//头部载入的css文件
	'insert_script'//直接生成的js脚本
);

//上传文件错误代码转成文字
$uploadError = array(
	1 => '文件大小超出了服务器的空间大小',
	2 => '要上传的文件大小超出浏览器限制',
	3 => '文件仅部分被上传',
	5 => '服务器临时文件夹丢失',
	6 => '文件写入到临时文件夹出错'
);