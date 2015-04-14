<?php if(isset($pageData)): ?>
<ul id="pageUl">
	<?php foreach($pageData as $_pageData): ?>
	<li class="<?php if($_pageData[1]=='y'){echo 'y';} ?>" rel="<?php echo isset($_pageData[2]) ? intval($_pageData[2]) : ''; ?>">
		<?php echo $_pageData[0]; ?>
	</li>
	<?php endforeach; ?>
</ul>
<?php endif; ?>
<script type="text/javascript">
$(
	function()
	{
		$('#pageUl .y').click(
			function()
			{
				var $form = $('#theForm');
				var current_page = $(this).attr('rel');
				current_page = parseInt(current_page);
				$form.find('input[name=page]').val(current_page);
				$form.submit();
			}
		);
	}
);
</script>