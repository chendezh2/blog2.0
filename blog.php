<?php
include_once('init.php');
$title = '博客';
$include_script = array();
$include_css = array();
$insert_script = '';
//显示 templete/blog.php 模板
$templete = 'blog';

$id = isset($_GET['id']) ? intval($_GET['id']) : 0;
$blog = Blog::getBlog($id);
if($blog)
{
	$title .= ' - '.$blog['title'];
}

include_once(ROOT_PATH.'templete/layout.php');