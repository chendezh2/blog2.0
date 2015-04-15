<?php if($blog): ?>
<div class="title"><?php echo $blog['title']; ?></div>
<div class="desc"><?php echo $blog['content']; ?></div>
<?php else: ?>
<div class="title">博客id错误</div>
<?php endif; ?>