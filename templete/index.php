<div class="search">
	<form action="" method="post" name="theForm" id="theForm">
		<span>分类:</span>
		<select name="category">
			<option value="0"<?php if($search_categoryId==0){echo ' selected';} ?>>所有分类</option>
			<?php
			foreach($categoryList as $_categoryList)
			{
				$_categoryList['id'] = intval($_categoryList['id']);
				if($search_categoryId == $_categoryList['id'])
				{
					echo '<option value="'.$_categoryList['id'].'" selected>'.$_categoryList['name'].'</option>';
				}
				else
				{
					echo '<option value="'.$_categoryList['id'].'">'.$_categoryList['name'].'</option>';
				}
			}
			?>
		</select>
		<span>标题:</span>
		<input type="text" name="title" value="<?php echo $search_title; ?>" />
		<span>内容:</span>
		<input type="text" name="content" value="<?php echo $search_content; ?>" />
		<input type="hidden" name="page" value="1" />
		<input type="submit" value="搜索" />
	</form>
</div>
<div>
	<?php foreach($blogList as $_blogList): ?>
	<div class="item">
		<div class="title">
			<table border="0" cellspacing="0" cellpadding="0" height="16">
				<tr>
					<td>
						<a class="one" href="/blog.php?id=<?php echo $_blogList['id']; ?>"><?php echo $_blogList['title']; ?></a>
					</td>
					<?php if($_blogList['attachments'] > 0): ?>
					<td class="attachment">
						<img src="/images/attachment.png" />
					</td>
					<?php endif; ?>
				</tr>
			</table>
		</div>
		<div class="abstract">
			<a class="one" href="/blog.php?id=<?php echo $_blogList['id']; ?>">
				<?php echo mb_substr(strip_tags($_blogList['content']),0,100); ?>
			</a>
		</div>
	</div>
	<?php endforeach; ?>
</div>
<div class="page">
	<?php include_once(ROOT_PATH.'templete/page.php'); ?>
	<div class="clearfix"></div>
</div>