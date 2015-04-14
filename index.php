<?php
include_once('init.php');
$x = Category::getChildrenTree();
print_r($x);