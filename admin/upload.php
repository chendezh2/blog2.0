<?php
include_once('../init.php');
$title = '上传文章';
$include_script = array('/ckeditor/ckeditor.js', '/admin/js/upload.js');
$include_css = array();
$insert_script = '$(function(){CKEDITOR.replace("content");});';
//显示 admin/templete/upload.php 模板
$templete = 'upload';

//获取全部分类一维数组
$categoryList = Category::getChildrenLine();

if(!empty($_POST))
{
	$include_script[] = '/admin/js/msg.js';
	$rs = Blog::insertBlog();
	$insert_script .= '$(function(){showMsg("'.$rs[1].'");});';
}

include_once(ADMIN_PATH.'templete/layout.php');