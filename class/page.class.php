<?php
class Page
{
	private $count = 0;
	private $current = 1;
	private $size = 10;

	public function setCount($count)
	{
		$count = intval($count);
		$this->count = $count > 0 ? $count : 0;
	}

	public function getCount()
	{
		return $this->count;
	}

	public function setSize($size)
	{
		$size = abs(intval($size));
		if($size > 0)
		{
			$this->size = $size;
		}
		else
		{
			$this->size = 10;
		}
	}

	public function getSize()
	{
		return $this->size;
	}

	public function setCurrent($current)
	{
		$current = abs(intval($current));
		if($current > 0)
		{
			$max = $this->getMax();
			if($current <= $max)
			{
				$this->current = $current;
			}
			else
			{
				$this->current = $max;
			}
		}
		else
		{
			$this->current = 1;
		}
	}

	public function getCurrent()
	{
		return $this->current;
	}

	public function getMax()
	{
		$max = ceil($this->count/$this->size);
		$max = ($max > 0) ? $max : 1;
		return $max;
	}

	public function getLimit()
	{
		$offset = $this->size * ($this->current - 1);
		return array($this->size, $offset);
	}

	public function getPageArr()
	{
		$return = array();
		$left_start = $this->current - 3;
		$left_end = $this->current - 1;
		$left_start = max(1, $left_start);
		//$left_end = max(1, $left_end);
		//判断上一页
		if($this->current > 1)
		{
			$return[] = array('上一页', 'y', $left_end);
		}
		for($i=$left_start;$i<=$left_end;$i++)
		{
			$return[] = array($i, 'y', $i);
		}
		$return[] = array($this->current, 'n');
		$max = $this->getMax();
		$right_start = $this->current + 1;
		$right_end = $this->current + 3;
		//$right_start = min($max, $right_start);
		$right_end = min($max, $right_end);
		for($i=$right_start;$i<=$right_end;$i++)
		{
			$return[] = array($i, 'y', $i);
		}
		//判断...
		if($right_end < $max-1)
		{
			$return[] = array('...', 'n');
		}
		//判断最后一页
		if($right_end < $max)
		{
			$return[] = array($max, 'y', $max);
		}
		//判断下一页
		if($this->current < $max)
		{
			$return[] = array('下一页', 'y', $right_start);
		}
		return $return;
	}

	//获取最后一页会有几条记录
	public function getLastCount()
	{
		return $this->count - $this->size*($this->getMax()-1);
	}
}