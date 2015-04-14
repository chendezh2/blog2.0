<?php
include_once('init.php');
$title = '首页';
$include_script = array();
$include_css = array();
$insert_script = '';
//显示 templete/index.php 模板
$templete = 'index';

//获取全部分类树
$categoryList = Category::getChildrenLine();

$search_current_page = isset($_POST['page']) ? intval($_POST['page']) : (isset($_GET['page']) ? intval($_GET['page']) : 1);
$search_categoryId = isset($_POST['category']) ? intval($_POST['category']) : 0;
$search_title = isset($_POST['title']) ? $_POST['title'] : '';
$search_content = isset($_POST['content']) ? $_POST['content'] : '';
$blogList = Blog::getBlogList($search_current_page, $search_categoryId, $search_title, $search_content, 0);

$pageData = $pageClass->getPageArr();

include_once(ROOT_PATH.'templete/layout.php');