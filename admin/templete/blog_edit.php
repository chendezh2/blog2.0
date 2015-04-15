<center>
	<form action="/admin/blog_edit.php?id=<?php echo $id; ?>" method="post" enctype="multipart/form-data">
		<table border="0" cellspacing="12" cellpadding="0" class="main_table">
		<?php if(isset($blog) && !empty($blog)): ?>
			<tr>
				<td>
					分类：
					<select name="category_id">
						<?php foreach($categoryList as $_categoryList): ?>
						<?php if($_categoryList['id'] == $blog['category_id']): ?>
						<option value="<?php echo $_categoryList['id']; ?>" selected><?php echo String::repeat('&nbsp;&nbsp;&nbsp;&nbsp;', $_categoryList['level']-1).$_categoryList['name']; ?></option>
						<?php else: ?>
						<option value="<?php echo $_categoryList['id']; ?>"><?php echo String::repeat('&nbsp;&nbsp;&nbsp;&nbsp;', $_categoryList['level']-1).$_categoryList['name']; ?></option>
						<?php endif; ?>
						<?php endforeach; ?>
					</select>
				</td>
			</tr>
			<tr>
				<td>
					标题：
					<input type="text" name="title" style="width:700px;" value="<?php echo htmlspecialchars($blog['title']); ?>" />
				</td>
			</tr>
			<tr>
				<td>内容：</td>
			</tr>
			<tr>
				<td>
					<textarea rows="30" cols="50" name="content"><?php echo htmlspecialchars($blog['content']); ?></textarea>
				</td>
			</tr>
			<tr>
				<td>附件：&nbsp;&nbsp;&nbsp;&nbsp;<span class="pointer" onclick="addAttachmentInput();">添加附件</span></td>
			</tr>
			<?php if(isset($blog['attachmentList'])): ?>
			<?php foreach($blog['attachmentList'] as $_attachment): ?>
			<tr>
				<td>
					<?php echo $_attachment['path']; ?>
					<span class="attachment_del" onclick="delAttachment(<?php echo $_attachment['id']; ?>, $(this));"><?php if($_attachment['is_deleted']==1){echo '恢复';}else{echo '删除';} ?></span>
				</td>
			</tr>
			<?php endforeach; ?>
			<?php endif; ?>
			<tr id="addFlog">
				<td align="center"><input type="submit" value="提交" /></td>
			</tr>
		<?php else: ?>
			<tr>
				<td>博客id错误</td>
			</tr>
		<?php endif; ?>
		</table>
	</form>
</center>