<?php
include_once('../init.php');

if(!empty($_POST))
{
	$_POST['id'] = intval($_POST['id']);
	$rs = Blog::delAttachment($_POST['id']);
	if($rs[0])
	{
		echo json_encode(array('err'=>'0', 'msg'=>'操作成功'));
	}
	else
	{
		echo json_encode(array('err'=>'1', 'msg'=>$rs[1]));
	}
}
else
{
	echo json_encode(array('err'=>'1', 'msg'=>'参数错误'));
}