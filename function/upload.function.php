<?php
function uploadAttachment()
{
	if(isset($GLOBALS['_FILES']['attachment']))
	{
		foreach($GLOBALS['_FILES']['attachment']['error'] as $k => $v)
		{
			if($v != 0 && $v != 4)
			{
				return array(false, $GLOBALS['_FILES']['attachment']['name'][$k].' 上传发生错误：'.$GLOBALS['uploadError'][$v]);
			}
		}
		$upload_path_absolute = ROOT_PATH . Config::ATTACHMENT_PATH;
		$newNameArr = array();
		foreach($GLOBALS['_FILES']['attachment']['name'] as $k => $v)
		{
			$ext = substr($v, strrpos($v, '.')+1);
			$newName = getUploadFileName().'.'.$ext;
			move_uploaded_file($GLOBALS['_FILES']['attachment']['tmp_name'][$k], $upload_path_absolute.$newName);
			$newNameArr[] = array('new_name' => $newName, 'origin_name' => $GLOBALS['_FILES']['attachment']['name'][$k]);
		}
		return array(true, $newNameArr);
	}
	else
	{
		return array(true, array());
	}
}
//生成上传文件的文件名
function getUploadFileName()
{
	return time().'_'.rand(1,999999);
}