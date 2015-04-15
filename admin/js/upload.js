//添加一个附件
function addAttachmentInput()
{
	var $html = $('<tr><td><input type="file" name="attachment[]" /><span class="pointer" onclick="delAttachmentInput($(this));">删除</span></td></tr>');
	$html.insertBefore('#addFlog');
}
//删除一个附件
function delAttachmentInput($this)
{
	$this.parents('tr').remove();
}