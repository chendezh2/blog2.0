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

	//获取重复的字符串
	public static function repeat($str, $times)
	{
		$times = intval($times);
		$times = ($times < 0) ? 0 : $times;
		$return = '';

		for($i=1;$i<=$times;$i++)
		{
			$return .= $str;
		}
		return $return;
	}
}