<?php
class Blog
{
	//获取单篇博客
	public static function getBlog($id)
	{
		//获取数据库对象
		global $db;

		$id = intval($id);
		$blog = $db->getRow("select * from blog where id=".$id." and is_deleted=0");
		//如果找到了博客但分类已被删除
		if($blog && !$db->getOne("select id from category where is_deleted=0 and id=".$blog['category_id']))
		{
			$blog = array();
		}
		//如果存在附件
		if($blog && $blog['attachments']>0)
		{
			$blog['attachmentList'] = $db->getAll("select * from attachment where blog_id=".$id);
		}
		return $blog;
	}

	/* 
	 * 获取博客列表
	 * $is_deleted 0:未删除 1:已删除 -1:全部
	 */
	public static function getBlogList($currentPage=1, $categoryId=0, $title='', $content='', $is_deleted=-1)
	{
		//获取数据库对象和分页类对象
		global $db,$pageClass;

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
		$count = $db->getOne($sql);
		$pageClass->setCount($count);
		$pageClass->setCurrent($currentPage);
		$limit = $pageClass->getLimit();
		$sql = "select b.*,c.name from blog as b inner join category as c on b.category_id=c.id and c.is_deleted=0".$where.' order by b.creation_time desc limit '.$limit[1].','.$limit[0];
		return $db->getAll($sql);
	}

	//添加一篇博客
	public static function insertBlog()
	{
		$categoryId = intval($GLOBALS['_POST']['category_id']);
		$category = Category::getCategory(array('id' => $categoryId, 'is_deleted' => '0'));
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
							$GLOBALS['db']->query("insert into attachment(blog_id, path, origin_name, creation_time) values(".$blogId.", '".$_name['new_name']."', '".$_name['origin_name']."', ".time().")");
						}
						$GLOBALS['db']->query("update category set blogs = blogs + 1 where id=".$categoryId);
						return array(true, '添加成功');
					}
					else
					{
						$upload_path = ROOT_PATH . Config::ATTACHMENT_PATH;
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

	//更新一篇博客
	public static function updateBlog($id)
	{
		$id = intval($id);
		$_blog = self::getBlog($id);
		if(empty($_blog))
		{
			return array(false, '博客id错误');
		}
		$categoryId = intval($GLOBALS['_POST']['category_id']);
		$category = Category::getCategory(array('id' => $categoryId, 'is_deleted' => '0'));
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
							$GLOBALS['db']->query("insert into attachment(blog_id, path, origin_name, creation_time) values(".$id.", '".$_name['new_name']."', '".$_name['origin_name']."', ".time().")");
						}
						return array(true, '修改成功');
					}
					else
					{
						$upload_path = ROOT_PATH . Config::ATTACHMENT_PATH;
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
}