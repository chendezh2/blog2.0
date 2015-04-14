<?php
class Mysql
{
	private static $instance = null;
	private $link_id = null;
	private $dbConfig = null;

	public static function getInstance($dbConfig)
	{
		if(empty(self::$instance))
		{
			self::$instance = new self($dbConfig);
		}
		return self::$instance;
	}

	private function Mysql($dbConfig)
	{
		$this->dbConfig = $dbConfig;
		$this->connect();
	}

	private function connect()
	{
		if(empty($this->link_id))
		{
			$dbConfig = $this->dbConfig;
			$this->link_id = mysql_connect($dbConfig['host'], $dbConfig['user'], $dbConfig['pwd']);
			$this->query('SET character_set_connection=utf8, character_set_results=utf8, character_set_client=binary');
			mysql_select_db($dbConfig['database'], $this->link_id);
		}
	}

	public function query($sql)
	{
		if(empty($this->link_id))
		{
			$this->connect();
		}
		$res = mysql_query($sql, $this->link_id);
		if($res === false)
		{
			echo 'sql语句执行错误:'.$sql;
			exit;
		}
		return $res;
	}

	public function getOne($sql)
	{
		$res = $this->query($sql);
		if($res !== false)
        {
            if($row = mysql_fetch_row($res))
            {
                return $row[0];
            }
        }
		return array();
	}

	public function getRow($sql)
	{
		$res = $this->query($sql);
		if($res !== false)
        {
            if($row = mysql_fetch_assoc($res))
            {
                return $row;
            }
        }
		return array();
	}

	public function getAll($sql)
	{
		$res = $this->query($sql);
        if($res !== false)
        {
            $arr = array();
            while($row = mysql_fetch_assoc($res))
            {
                $arr[] = $row;
            }
            return $arr;
        }
        else
        {
            return array();
        }
	}

	public function insert_id()
	{
		if(empty($this->link_id))
		{
			return 0;
		}
		else
		{
			return mysql_insert_id($this->link_id);
		}
	}

	public function close()
	{
		mysql_close($this->link_id);
	}
}