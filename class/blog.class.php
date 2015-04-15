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
}