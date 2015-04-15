<?php
class Category
{
	//获取指定分类下的子分类树，$category_id=0将获取全部分类树
	public static function getChildrenTree($category_id = 0)
	{
		//获取数据库对象
		global $db;
		//初始化返回值
		$children = array();

		//验证参数
		$category_id = intval($category_id);
		if($category_id < 0)
		{
			return $children;
		}

		$_children = $db->getAll("select id,name,level from category where parent_id=".$category_id." and is_deleted=0");
		foreach($_children as $_child)
		{
			$children[$_child['id']] = array('name' => $_child['name'], 'level' => $_child['level']);
		}
		foreach($children as $id => $name)
		{
			$_child = self::getChildrenTree($id);
			if(count($_child) > 0)
			{
				$children[$id]['children'] = $_child;
			}
		}

		return $children;
	}

	//获取指定分类下的子分类组成的一维数组，$category_id=0将获取全部分类树的一维数组
	public static function getChildrenLine($category_id = 0)
	{
		//获取数据库对象
		global $db;
		//初始化返回值
		$children = array();

		//验证参数
		$category_id = intval($category_id);
		if($category_id < 0)
		{
			return $children;
		}

		$_children = $db->getAll("select id,name,level from category where parent_id=".$category_id." and is_deleted=0");
		foreach($_children as $child)
		{
			$children[] = $child;
			$childRows = self::getChildrenLine($child['id']);
			foreach($childRows as $childRow)
			{
				$children[] = $childRow;
			}
		}

		return $children;
	}

	//获取指定的分类
	public static function getCategory($filter = array())
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
}