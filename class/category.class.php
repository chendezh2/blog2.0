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

		$_children = $db->getAll("select id,name from category where parent_id=".$category_id." and is_deleted=0");
		foreach($_children as $_child)
		{
			$children[$_child['id']] = array('name' => $_child['name']);
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
}