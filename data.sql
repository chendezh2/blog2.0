-- MySQL dump 10.13  Distrib 5.5.3-m3, for Win32 (x86)
--
-- Host: localhost    Database: blog
-- ------------------------------------------------------
-- Server version	5.5.3-m3-community

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `attachment`
--

DROP TABLE IF EXISTS `attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blog_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属博客id',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '附件路径',
  `origin_name` varchar(255) NOT NULL DEFAULT '' COMMENT '原始文件名',
  `creation_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `modification_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `is_deleted` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否被删除',
  PRIMARY KEY (`id`),
  KEY `blog_id` (`blog_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='附件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachment`
--

LOCK TABLES `attachment` WRITE;
/*!40000 ALTER TABLE `attachment` DISABLE KEYS */;
INSERT INTO `attachment` VALUES (1,1,'1429088064_965972.rar','测试文件.rar',1429088064,0,0);
/*!40000 ALTER TABLE `attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog`
--

DROP TABLE IF EXISTS `blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '博客标题',
  `content` text NOT NULL COMMENT '博客正文',
  `attachments` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '拥有的附件数量',
  `creation_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `modification_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `is_deleted` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否被删除',
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='博客表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog`
--

LOCK TABLES `blog` WRITE;
/*!40000 ALTER TABLE `blog` DISABLE KEYS */;
INSERT INTO `blog` VALUES (1,2,'jquery 停止动画 stop的几种用法','<p>&lt;!DOCTYPE html PUBLIC &quot;-//W3C//DTD XHTML 1.0 Transitional//EN&quot; &quot;http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd&quot;&gt;<br />\r\n&lt;html xmlns=&quot;http://www.w3.org/1999/xhtml&quot;&gt;<br />\r\n&lt;head&gt;<br />\r\n&lt;meta http-equiv=&quot;Content-Type&quot; content=&quot;text/html; charset=utf-8&quot; /&gt;<br />\r\n&lt;title&gt;Panel&lt;/title&gt;<br />\r\n&lt;style type=&quot;text/css&quot;&gt;<br />\r\n* {<br />\r\n&nbsp;&nbsp;&nbsp; margin: 0;<br />\r\n&nbsp;&nbsp;&nbsp; padding: 0;<br />\r\n}<br />\r\nbody {<br />\r\n&nbsp;&nbsp;&nbsp; font-size: 13px;<br />\r\n&nbsp;&nbsp;&nbsp; line-height: 130%;<br />\r\n&nbsp;&nbsp;&nbsp; padding: 60px<br />\r\n}<br />\r\n#panel {<br />\r\n&nbsp;&nbsp;&nbsp; width: 60px;<br />\r\n&nbsp;&nbsp;&nbsp; border: 1px solid #0050D0;<br />\r\n&nbsp;&nbsp;&nbsp; height: 22px;<br />\r\n&nbsp;&nbsp;&nbsp; overflow: hidden;<br />\r\n}<br />\r\n.head {<br />\r\n&nbsp;&nbsp;&nbsp; padding: 5px;<br />\r\n&nbsp;&nbsp;&nbsp; background: #96E555;<br />\r\n&nbsp;&nbsp;&nbsp; cursor: pointer;<br />\r\n&nbsp;&nbsp;&nbsp; width: 300px;<br />\r\n}<br />\r\n.content {<br />\r\n&nbsp;&nbsp;&nbsp; padding: 10px;<br />\r\n&nbsp;&nbsp;&nbsp; text-indent: 2em;<br />\r\n&nbsp;&nbsp;&nbsp; border-top: 1px solid #0050D0;<br />\r\n&nbsp;&nbsp;&nbsp; display: block;<br />\r\n&nbsp;&nbsp;&nbsp; width: 280px;<br />\r\n}<br />\r\n&lt;/style&gt;<br />\r\n&lt;script src=&quot;jquery-1.9.1.min.js&quot; type=&quot;text/javascript&quot;&gt;&lt;/script&gt;<br />\r\n&lt;script type=&quot;text/javascript&quot;&gt;<br />\r\n$(function(){<br />\r\n&nbsp;&nbsp;&nbsp; $(&quot;button:eq(0)&quot;).click(function(){<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(&quot;#panel&quot;).animate({height:&quot;150&quot; }, 1000)<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; .animate({width:&quot;300&quot; }, 1000)<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; .hide(2000)<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; .animate({height:&quot;show&quot;, width:&quot;show&quot;, opacity:&quot;show&quot;}, 1000)<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; .animate({height:&quot;500&quot;}, 1000);<br />\r\n&nbsp;&nbsp;&nbsp; });<br />\r\n&nbsp;&nbsp; &nbsp;//stop([clearQueue][,gotoEnd]);<br />\r\n//语法结构<br />\r\n&nbsp;&nbsp;&nbsp; $(&quot;button:eq(1)&quot;).click(function(){<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(&quot;#panel&quot;).stop();//停止当前动画，继续下一个动画<br />\r\n&nbsp;&nbsp;&nbsp; });<br />\r\n&nbsp;&nbsp;&nbsp; $(&quot;button:eq(2)&quot;).click(function(){<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(&quot;#panel&quot;).stop(true);//清除元素的所有动画<br />\r\n&nbsp;&nbsp;&nbsp; });<br />\r\n&nbsp;&nbsp;&nbsp; $(&quot;button:eq(3)&quot;).click(function(){<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(&quot;#panel&quot;).stop(false, true);//让当前动画直接到达末状态 ，继续下一个动画<br />\r\n&nbsp;&nbsp;&nbsp; });<br />\r\n&nbsp;&nbsp;&nbsp; $(&quot;button:eq(4)&quot;).click(function(){<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(&quot;#panel&quot;).stop(true, true);//清除元素的所有动画，让当前动画直接到达末状态<br />\r\n&nbsp;&nbsp;&nbsp; });<br />\r\n});<br />\r\n&lt;/script&gt;<br />\r\n&lt;/head&gt;<br />\r\n&lt;body&gt;<br />\r\n&lt;button&gt;开始一连串动画&lt;/button&gt;<br />\r\n&lt;button&gt;stop()&lt;/button&gt;<br />\r\n&lt;button&gt;stop(true)&lt;/button&gt;<br />\r\n&lt;button&gt;stop(false,true)&lt;/button&gt;<br />\r\n&lt;button&gt;stop(true,true)&lt;/button&gt;</p>\r\n\r\n<p>&lt;div id=&quot;panel&quot;&gt;<br />\r\n&nbsp;&nbsp;&nbsp; &lt;h5 class=&quot;head&quot;&gt;什么是jQuery?&lt;/h5&gt;</p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp; &lt;div class=&quot;content&quot;&gt;<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; jQuery是继Prototype之后又一个优秀的JavaScript库，它是一个由 John Resig 创建于2006年1月的开源项目。jQuery凭借简洁的语法和跨平台的兼容性，极大地简化了JavaScript开发人员遍历HTML文档、操作DOM、处理事件、执行动画和开发Ajax。它独特而又优雅的代码风格改变了JavaScript程序员的设计思路和编写程序的方式。<br />\r\n&nbsp;&nbsp;&nbsp; &lt;/div&gt;<br />\r\n&lt;/div&gt;</p>\r\n\r\n<p>&lt;/body&gt;<br />\r\n&lt;/html&gt;</p>\r\n',1,1429088064,1429088443,0),(2,4,'CSS阴影效果（兼容N多浏览器）','<p>一、无关紧要碎碎念<br />\r\n在web页面的ui表现中，投影效果可以说是非常常见的一种表现效果了。例如开心网的头像修饰效果：</p>\r\n\r\n<p><img alt=\"\" src=\"/data/pic/20150415171240293194.jpg\" style=\"height:179px; width:467px\" /></p>\r\n\r\n<p>然而，在CSS2的时代，我们多半使用图片实现类似效果，或是使用CSS其他属性模拟阴影效果，但是，现在，CSS3的崛起使得这个问题已经不再是是个问题了，本文就将展示如何实现跨浏览器的盒阴影效果。</p>\r\n\r\n<p>二、标准方法<br />\r\n标准方法当然就是指使用CSS3的方法了，这个应该不少同行应该知道，参见如下代码：<br />\r\n.shadow{<br />\r\n&nbsp;&nbsp; &nbsp;-moz-box-shadow: 3px 3px 4px #000;<br />\r\n&nbsp;&nbsp; &nbsp;-webkit-box-shadow: 3px 3px 4px #000;<br />\r\n&nbsp;&nbsp; &nbsp;box-shadow: 3px 3px 4px #000;<br />\r\n}<br />\r\n释义为：横向偏移3像素，纵向偏移3像素，模糊4像素，颜色为纯黑。<br />\r\n如果我们把含上面样式的这个class shadow应用到图片上，就会产生如下的效果（截自Firefox3.6）：</p>\r\n\r\n<p><img alt=\"\" src=\"/data/pic/20150415171413206649.jpg\" style=\"height:250px; width:320px\" /></p>\r\n\r\n<p>三、那么IE浏览器呢？<br />\r\n对于目前对CSS3支持如狗屎的孤芳自赏的IE浏览器怎么办呢？box-shadow属性对于IE浏览器就像是圣诞树上的彩灯&mdash;&mdash;装饰而已。<br />\r\n好在IE浏览器有个IE <a href=\"http://msdn.microsoft.com/en-us/library/ms533086%28VS.85%29.aspx\">shadow滤镜</a>，是IE浏览器私有的一个东西，可以模拟还凑合的盒阴影效果，使用类似于下面的代码：<br />\r\n.shadow {<br />\r\n&nbsp;&nbsp; &nbsp;/* For IE 8 */<br />\r\n&nbsp;&nbsp; &nbsp;-ms-filter: &quot;progid:DXImageTransform.Microsoft.Shadow(Strength=4, Direction=135, Color=&#39;#000000&#39;)&quot;;<br />\r\n&nbsp;&nbsp; &nbsp;/* For IE 5.5 - 7 */<br />\r\n&nbsp;&nbsp; &nbsp;filter: progid:DXImageTransform.Microsoft.Shadow(Strength=4, Direction=135, Color=&#39;#000000&#39;);<br />\r\n}<br />\r\n将shadow这个class应用到图片上，结果如下（截自IE6浏览器）：</p>\r\n\r\n<p><img alt=\"\" src=\"/data/pic/20150415171529546704.jpg\" style=\"height:247px; width:297px\" /></p>\r\n\r\n<p>虽然效果不及Firefox，chrome等现代浏览器，但是还能凑合着用用。</p>\r\n\r\n<p>四、样式综合<br />\r\n如下代码：<br />\r\n.shadow{<br />\r\n&nbsp;&nbsp; &nbsp;-moz-box-shadow: 3px 3px 4px #000;<br />\r\n&nbsp;&nbsp; &nbsp;-webkit-box-shadow: 3px 3px 4px #000;<br />\r\n&nbsp;&nbsp; &nbsp;box-shadow: 3px 3px 4px #000;<br />\r\n&nbsp;&nbsp; &nbsp;/* For IE 8 */<br />\r\n&nbsp;&nbsp; &nbsp;-ms-filter: &quot;progid:DXImageTransform.Microsoft.Shadow(Strength=4, Direction=135, Color=&#39;#000000&#39;)&quot;;<br />\r\n&nbsp;&nbsp; &nbsp;/* For IE 5.5 - 7 */<br />\r\n&nbsp;&nbsp; &nbsp;filter: progid:DXImageTransform.Microsoft.Shadow(Strength=4, Direction=135, Color=&#39;#000000&#39;);<br />\r\n}<br />\r\n更多CSS3属性的跨浏览器支持可以查阅<a href=\"http://css3please.com\">这里(css3please.com)</a>。</p>\r\n\r\n<p>五、浏览器支持情况<br />\r\n&nbsp;&nbsp;&nbsp; Firefox 3.5+<br />\r\n&nbsp;&nbsp;&nbsp; Safari 3+<br />\r\n&nbsp;&nbsp;&nbsp; Google Chrome<br />\r\n&nbsp;&nbsp;&nbsp; Opera 10.50<br />\r\n&nbsp;&nbsp;&nbsp; Internet Explorer 5.5</p>\r\n',0,1429089609,0,0);
/*!40000 ALTER TABLE `blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '分类名称',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '父分类id',
  `level` int(2) NOT NULL DEFAULT '1' COMMENT '几级分类,顶级分类为1',
  `blogs` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '分类下包含的博客数量',
  `creation_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `modification_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `is_deleted` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否被删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='博文分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'js',0,1,0,0,0,0),(2,'jquery',1,2,1,0,0,0),(3,'css',0,1,0,0,0,0),(4,'css3',3,2,1,0,0,0);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'blog'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-04-15 17:26:32
