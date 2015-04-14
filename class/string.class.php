<?php
class String
{
	public static function addslashes_deep($value)
	{
		if (empty($value))
		{
			return $value;
		}
		else
		{
			return is_array($value) ? array_map(array('String', 'addslashes_deep'), $value) : addslashes($value);
		}
	}
}