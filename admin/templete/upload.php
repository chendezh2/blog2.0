<center>
	<form action="/admin/upload.php" method="post" enctype="multipart/form-data">
		<table border="0" cellspacing="12" cellpadding="0" class="main_table">
			<tr>
				<td>
					分类：
					<select name="category_id">
						<?php foreach($categoryList as $_categoryList): ?>
						<option value="<?php echo $_categoryList['id']; ?>"><?php echo String::repeat('&nbsp;&nbsp;&nbsp;&nbsp;', $_categoryList['level']-1).$_categoryList['name']; ?></option>
						<?php endforeach; ?>
					</select>
				</td>
			</tr>
			<tr>
				<td>
					标题：
					<input type="text" name="title" style="width:700px;" />
				</td>
			</tr>
			<tr>
				<td>内容：</td>
			</tr>
			<tr>
				<td>
					<textarea rows="30" cols="50" name="content"></textarea>
				</td>
			</tr>
			<tr>
				<td>附件：&nbsp;&nbsp;&nbsp;&nbsp;<span class="pointer" onclick="addAttachmentInput();">添加附件</span></td>
			</tr>
			<tr id="addFlog">
				<td align="center"><input type="submit" value="提交" /></td>
			</tr>
		</table>
	</form>
</center>