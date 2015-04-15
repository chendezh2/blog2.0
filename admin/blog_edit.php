<?php
include_once('../init.php');
$title = '文章修改';
$include_script = array('/ckeditor/ckeditor.js', '/admin/js/upload.js', '/admin/js/blog_edit.js');
$include_css = array();
$insert_script = '$(function(){CKEDITOR.replace("content");});';
//显示 admin/templete/blog_edit.php 模板
$templete = 'blog_edit';

$categoryList = Category::getChildrenLine();
$id = isset($_GET['id']) ? intval($_GET['id']) : 0;
if($id > 0)
{
	if(!empty($_POST))
	{
		$include_script[] = '/admin/js/msg.js';
		$rs = Blog::updateBlog($id);
		$insert_script .= '$(function(){showMsg("'.$rs[1].'");});';
	}
	$blog = Blog::getBlog($id);
}

include_once(ADMIN_PATH.'templete/layout.php');