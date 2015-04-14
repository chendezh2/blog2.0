<?php
/* 获取分类列表
 * $is_deleted 0:未删除 1:已删除 -1:全部
 */
function getCategoryList($is_deleted = -1)
{
	$sql = "select id,name,is_deleted from category";
	if($is_deleted != -1)
	{
		if($is_deleted != 0 && $is_deleted != 1)
		{
			$is_deleted = 0;
		}
		$sql .= ' where is_deleted = '.$is_deleted;
	}
	return $GLOBALS['db']->getAll($sql);
}
//获取指定的分类
function getCategory($filter=array())
{
	$sql = "select * from category";
	if($filter)
	{
		$where = array();
		foreach($filter as $k => $v)
		{
			$where[] = $k."='".$v."'";
		}
		$where = implode(' and ', $where);
		$sql = $sql.' where '.$where;
	}
	return $GLOBALS['db']->getAll($sql);
}
/* 获取博客列表
 * $is_deleted 0:未删除 1:已删除 -1:全部
 */
function getBlogList($currentPage=1, $categoryId=0, $title='', $content='', $is_deleted=-1)
{
	$currentPage = intval($currentPage);
	$categoryId = intval($categoryId);
	$where = array();
	if($categoryId > 0)
	{
		$where[] = 'b.category_id='.$categoryId;
	}
	if(!empty($title))
	{
		$where[] = "b.title like '%".$title."%'";
	}
	if(!empty($content))
	{
		$where[] = "b.content like '%".$content."%'";
	}
	if($is_deleted != -1)
	{
		if($is_deleted != 0 && $is_deleted != 1)
		{
			$is_deleted = 0;
		}
		$where[] = "b.is_deleted=".$is_deleted;
	}
	if($where)
	{
		$where = implode(' and ', $where);
		$where = ' where '.$where;
	}
	else
	{
		$where = '';
	}
	$sql = "select count(*) from blog as b inner join category as c on b.category_id=c.id and c.is_deleted=0".$where;
	$count = $GLOBALS['db']->getOne($sql);
	$GLOBALS['pageClass']->setCount($count);
	$GLOBALS['pageClass']->setCurrent($currentPage);
	$limit = $GLOBALS['pageClass']->getLimit();
	$sql = "select b.*,c.name from blog as b inner join category as c on b.category_id=c.id and c.is_deleted=0".$where.' order by b.creation_time desc limit '.$limit[1].','.$limit[0];
	return $GLOBALS['db']->getAll($sql);
}
//获取单篇博客
function getBlog($id)
{
	$id = intval($id);
	$sql = "select * from blog where id=".$id." and is_deleted=0";
	$row = $GLOBALS['db']->getRow($sql);
	if($row && $GLOBALS['db']->getOne("select id from category where is_deleted=0 and id=".$row['category_id']))
	{
		$sql = "select * from attachment where blog_id=".$id;
		$row['attachmentList'] = $GLOBALS['db']->getAll($sql);
		return $row;
	}
	else
	{
		return array();
	}
}
//添加分类
function insertCategory($name)
{
	$name = htmlspecialchars($name);
	$exists = getCategory(array('name'=>$name));
	if(count($exists) == 0)
	{
		$sql = "insert into category(name,creation_time) values('".$name."','".time()."')";
		$rs = $GLOBALS['db']->query($sql);
		if($rs)
		{
			return array(true);
		}
		else
		{
			return array(false, $name.' 添加失败');
		}
	}
	else
	{
		return array(false, $name.' 分类已经存在');
	}
}
//编辑分类
function updateCategory($id, $name)
{
	$id = intval($id);
	$name = htmlspecialchars($name);
	$exists = getCategory(array('id'=>$id));
	if(count($exists) > 0)
	{
		if($exists[0]['name'] != $name)
		{
			$exists = getCategory(array('name'=>$name));
			if(count($exists) == 0)
			{
				$sql = "update category set name='".$name."',modification_time=".time()." where id=".$id;
				$rs = $GLOBALS['db']->query($sql);
				if($rs)
				{
					return array(true);
				}
				else
				{
					return array(false, $name.' 修改失败');
				}
			}
			else
			{
				return array(false, $name.' 分类已经存在');
			}
		}
		else
		{
			return array(true);
		}
	}
	else
	{
		return array(false, $id.' 分类id错误');
	}
}
//删除或恢复分类
function delCategory($id)
{
	$id = intval($id);
	$category = getCategory(array('id' => $id));
	if(count($category) > 0)
	{
		$is_deleted = $category[0]['is_deleted'] ? 0 : 1;
		$sql = "update category set is_deleted=".$is_deleted.",modification_time=".time()." where id=".$id;
		$rs = $GLOBALS['db']->query($sql);
		if($rs)
		{
			return array(true);
		}
		else
		{
			return array(false, $id.' 修改失败');
		}
	}
	else
	{
		return array(false, 'id参数错误');
	}
}
//删除或恢复附件
function delAttachment($id)
{
	$id = intval($id);
	$attachment = $GLOBALS['db']->getRow("select blog_id,is_deleted from attachment where id=".$id);
	if($attachment)
	{
		$is_deleted = $attachment['is_deleted'] ? 0 : 1;
		$sql = "update attachment set is_deleted=".$is_deleted.",modification_time=".time()." where id=".$id;
		$rs = $GLOBALS['db']->query($sql);
		if($rs)
		{
			if($is_deleted)
			{
				$GLOBALS['db']->query("update blog set attachments = attachments - 1 where id=".$attachment['blog_id']);
			}
			else
			{
				$GLOBALS['db']->query("update blog set attachments = attachments + 1 where id=".$attachment['blog_id']);
			}
			return array(true);
		}
		else
		{
			return array(false, $id.' 修改失败');
		}
	}
	else
	{
		return array(false, 'id参数错误');
	}
}
//添加博客文章
function insertBlog()
{
	$categoryId = intval($GLOBALS['_POST']['category_id']);
	$category = getCategory(array('id' => $categoryId, 'is_deleted' => '0'));
	if(!empty($category))
	{
		if(!empty($GLOBALS['_POST']['title']) && !empty($GLOBALS['_POST']['content']))
		{
			$upload = uploadAttachment();
			if($upload[0])
			{
				$upload = $upload[1];
				$sql = "insert into blog(category_id, title, content, attachments, creation_time) values(".$categoryId.",'".htmlspecialchars($GLOBALS['_POST']['title'])."','".$GLOBALS['_POST']['content']."',".count($upload).",".time().")";
				if($rs = $GLOBALS['db']->query($sql))
				{
					$blogId = $GLOBALS['db']->insert_id();
					foreach($upload as $_name)
					{
						$GLOBALS['db']->query("insert into attachment(blog_id, path, creation_time) values(".$blogId.", '".$_name."', ".time().")");
					}
					$GLOBALS['db']->query("update category set blogs = blogs + 1 where id=".$categoryId);
					return array(true, '添加成功');
				}
				else
				{
					$upload_path = ROOT_PATH.'attachment/';
					foreach($upload as $_name)
					{
						unlink($upload_path.$_name);
					}
					return array(false, '写入blog表出错');
				}
			}
			else
			{
				return array(false, $upload[1]);
			}
		}
		else
		{
			return array(false, '标题和内容都不能为空');
		}
	}
	else
	{
		return array(false, '分类id错误');
	}
}
//添加博客文章
function updateBlog($id)
{
	$id = intval($id);
	$_blog = getBlog($id);
	if(empty($_blog))
	{
		return array(false, '博客id错误');
	}
	$categoryId = intval($GLOBALS['_POST']['category_id']);
	$category = getCategory(array('id' => $categoryId, 'is_deleted' => '0'));
	if(!empty($category))
	{
		if(!empty($GLOBALS['_POST']['title']) && !empty($GLOBALS['_POST']['content']))
		{
			$upload = uploadAttachment();
			if($upload[0])
			{
				$upload = $upload[1];
				$sql = "update blog set category_id=".$categoryId.", title='".htmlspecialchars($GLOBALS['_POST']['title'])."', content='".$GLOBALS['_POST']['content']."', attachments=attachments+".count($upload).", modification_time=".time()." where id=".$id;
				if($rs = $GLOBALS['db']->query($sql))
				{
					foreach($upload as $_name)
					{
						$GLOBALS['db']->query("insert into attachment(blog_id, path, creation_time) values(".$id.", '".$_name."', ".time().")");
					}
					return array(true, '修改成功');
				}
				else
				{
					$upload_path = ROOT_PATH.'attachment/';
					foreach($upload as $_name)
					{
						unlink($upload_path.$_name);
					}
					return array(false, '写入blog表出错');
				}
			}
			else
			{
				return array(false, $upload[1]);
			}
		}
		else
		{
			return array(false, '标题和内容都不能为空');
		}
	}
	else
	{
		return array(false, '分类id错误');
	}
}