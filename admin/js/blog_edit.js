//从服务器上删除一个附件
function delAttachment(id, $this)
{
	id = parseInt(id);
	$.post(
		'/admin/del_attachment.php',
		{'id' : id},
		function(data)
		{
			data = strToJson(data);
			if(data.err == 0)
			{
				var _html = $this.html();
				if(_html == '删除')
				{
					_html = '恢复';
				}
				else
				{
					_html = '删除';
				}
				$this.html(_html);
			}
			alert(data.msg);
		}
	);
}