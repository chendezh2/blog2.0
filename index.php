<?php
include_once('init.php');
$title = '首页';
$include_script = array();
$include_css = array();
$insert_script = '';

//获取全部分类树
$categoryList = Category::getChildrenTree();

$search_current_page = isset($_POST['page']) ? intval($_POST['page']) : (isset($_GET['page']) ? intval($_GET['page']) : 1);
$search_categoryId = isset($_POST['category']) ? intval($_POST['category']) : 0;
$search_title = isset($_POST['title']) ? $_POST['title'] : '';
$search_content = isset($_POST['content']) ? $_POST['content'] : '';
$blogList = Blog::getBlogList($search_current_page, $search_categoryId, $search_title, $search_content, 0);

$pageData = $pageClass->getPageArr();
//使用模板类
//include_once(ROOT_PATH.'templete/index.php');