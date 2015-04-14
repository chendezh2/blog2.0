<?php
$db->close();
//验证模板必须的变量是否赋值
foreach($templete_var as $_templete_var)
{
	if(!isset($$_templete_var))
	{
		echo '缺少变量'.$_templete_var;
		exit;
	}
}
?>
<!doctype html>
<html>
<head>
	<title><?php echo $title; ?></title>
	<link href="/css/common.css" rel="stylesheet" type="text/css" />
	<?php
	//载入本文档的css文件
	if(file_exists(ROOT_PATH.'css/'.$templete.'.css'))
	{
		echo '<link href="/css/'.$templete.'.css" rel="stylesheet" type="text/css" />';
	}
	//载入需要的css文件
	foreach($include_css as $_include_css)
	{
		echo '<link href="'.$_include_css.'" rel="stylesheet" type="text/css" />';
	}
	?>
	<style>
	.main{background-color: <?php echo Config::BG_COLOR; ?>;}
	</style>
	<script src="/js/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="/js/common.js" type="text/javascript"></script>
	<?php
	//载入需要的js脚本
	foreach($include_script as $_include_script)
	{
		echo '<script src="'.$_include_script.'" type="text/javascript"></script>';
	}
	//生成需要的js脚本
	if($insert_script)
	{
		echo '<script type="text/javascript">'.$insert_script.'</script>';
	}
	?>
</head>

<body style="background-color: <?php echo Config::BG_COLOR; ?>;">
	<div class="main">
		<div class="header">
			<div class="fl"><a href="/index.php">首页</a></div>
			<div class="fr"><a href="/admin/blog_manager.php">文章管理</a></div>
			<div class="fr p_r_10"><a href="/admin/upload.php">上传文章</a></div>
			<div class="fr p_r_10"><a href="/admin/category.php">分类管理</a></div>
			<div class="clearfix"></div>
		</div>
		<div class="content"><?php include_once(ROOT_PATH.'templete/'.$templete.'.php'); ?></div>
		<div class="footer"></div>
	</div>
</body>
</html>