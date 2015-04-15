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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='博客表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog`
--

LOCK TABLES `blog` WRITE;
/*!40000 ALTER TABLE `blog` DISABLE KEYS */;
INSERT INTO `blog` VALUES (1,2,'jquery 停止动画 stop的几种用法','<p>&lt;!DOCTYPE html PUBLIC &quot;-//W3C//DTD XHTML 1.0 Transitional//EN&quot; &quot;http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd&quot;&gt;<br />\r\n&lt;html xmlns=&quot;http://www.w3.org/1999/xhtml&quot;&gt;<br />\r\n&lt;head&gt;<br />\r\n&lt;meta http-equiv=&quot;Content-Type&quot; content=&quot;text/html; charset=utf-8&quot; /&gt;<br />\r\n&lt;title&gt;Panel&lt;/title&gt;<br />\r\n&lt;style type=&quot;text/css&quot;&gt;<br />\r\n* {<br />\r\n&nbsp;&nbsp;&nbsp; margin: 0;<br />\r\n&nbsp;&nbsp;&nbsp; padding: 0;<br />\r\n}<br />\r\nbody {<br />\r\n&nbsp;&nbsp;&nbsp; font-size: 13px;<br />\r\n&nbsp;&nbsp;&nbsp; line-height: 130%;<br />\r\n&nbsp;&nbsp;&nbsp; padding: 60px<br />\r\n}<br />\r\n#panel {<br />\r\n&nbsp;&nbsp;&nbsp; width: 60px;<br />\r\n&nbsp;&nbsp;&nbsp; border: 1px solid #0050D0;<br />\r\n&nbsp;&nbsp;&nbsp; height: 22px;<br />\r\n&nbsp;&nbsp;&nbsp; overflow: hidden;<br />\r\n}<br />\r\n.head {<br />\r\n&nbsp;&nbsp;&nbsp; padding: 5px;<br />\r\n&nbsp;&nbsp;&nbsp; background: #96E555;<br />\r\n&nbsp;&nbsp;&nbsp; cursor: pointer;<br />\r\n&nbsp;&nbsp;&nbsp; width: 300px;<br />\r\n}<br />\r\n.content {<br />\r\n&nbsp;&nbsp;&nbsp; padding: 10px;<br />\r\n&nbsp;&nbsp;&nbsp; text-indent: 2em;<br />\r\n&nbsp;&nbsp;&nbsp; border-top: 1px solid #0050D0;<br />\r\n&nbsp;&nbsp;&nbsp; display: block;<br />\r\n&nbsp;&nbsp;&nbsp; width: 280px;<br />\r\n}<br />\r\n&lt;/style&gt;<br />\r\n&lt;script src=&quot;jquery-1.9.1.min.js&quot; type=&quot;text/javascript&quot;&gt;&lt;/script&gt;<br />\r\n&lt;script type=&quot;text/javascript&quot;&gt;<br />\r\n$(function(){<br />\r\n&nbsp;&nbsp;&nbsp; $(&quot;button:eq(0)&quot;).click(function(){<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(&quot;#panel&quot;).animate({height:&quot;150&quot; }, 1000)<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; .animate({width:&quot;300&quot; }, 1000)<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; .hide(2000)<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; .animate({height:&quot;show&quot;, width:&quot;show&quot;, opacity:&quot;show&quot;}, 1000)<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; .animate({height:&quot;500&quot;}, 1000);<br />\r\n&nbsp;&nbsp;&nbsp; });<br />\r\n&nbsp;&nbsp; &nbsp;//stop([clearQueue][,gotoEnd]);<br />\r\n//语法结构<br />\r\n&nbsp;&nbsp;&nbsp; $(&quot;button:eq(1)&quot;).click(function(){<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(&quot;#panel&quot;).stop();//停止当前动画，继续下一个动画<br />\r\n&nbsp;&nbsp;&nbsp; });<br />\r\n&nbsp;&nbsp;&nbsp; $(&quot;button:eq(2)&quot;).click(function(){<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(&quot;#panel&quot;).stop(true);//清除元素的所有动画<br />\r\n&nbsp;&nbsp;&nbsp; });<br />\r\n&nbsp;&nbsp;&nbsp; $(&quot;button:eq(3)&quot;).click(function(){<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(&quot;#panel&quot;).stop(false, true);//让当前动画直接到达末状态 ，继续下一个动画<br />\r\n&nbsp;&nbsp;&nbsp; });<br />\r\n&nbsp;&nbsp;&nbsp; $(&quot;button:eq(4)&quot;).click(function(){<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(&quot;#panel&quot;).stop(true, true);//清除元素的所有动画，让当前动画直接到达末状态<br />\r\n&nbsp;&nbsp;&nbsp; });<br />\r\n});<br />\r\n&lt;/script&gt;<br />\r\n&lt;/head&gt;<br />\r\n&lt;body&gt;<br />\r\n&lt;button&gt;开始一连串动画&lt;/button&gt;<br />\r\n&lt;button&gt;stop()&lt;/button&gt;<br />\r\n&lt;button&gt;stop(true)&lt;/button&gt;<br />\r\n&lt;button&gt;stop(false,true)&lt;/button&gt;<br />\r\n&lt;button&gt;stop(true,true)&lt;/button&gt;</p>\r\n\r\n<p>&lt;div id=&quot;panel&quot;&gt;<br />\r\n&nbsp;&nbsp;&nbsp; &lt;h5 class=&quot;head&quot;&gt;什么是jQuery?&lt;/h5&gt;</p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp; &lt;div class=&quot;content&quot;&gt;<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; jQuery是继Prototype之后又一个优秀的JavaScript库，它是一个由 John Resig 创建于2006年1月的开源项目。jQuery凭借简洁的语法和跨平台的兼容性，极大地简化了JavaScript开发人员遍历HTML文档、操作DOM、处理事件、执行动画和开发Ajax。它独特而又优雅的代码风格改变了JavaScript程序员的设计思路和编写程序的方式。<br />\r\n&nbsp;&nbsp;&nbsp; &lt;/div&gt;<br />\r\n&lt;/div&gt;</p>\r\n\r\n<p>&lt;/body&gt;<br />\r\n&lt;/html&gt;</p>\r\n',1,1429088064,1429088443,0),(2,4,'CSS阴影效果（兼容N多浏览器）','<p>一、无关紧要碎碎念<br />\r\n在web页面的ui表现中，投影效果可以说是非常常见的一种表现效果了。例如开心网的头像修饰效果：</p>\r\n\r\n<p><img alt=\"\" src=\"/data/pic/20150415171240293194.jpg\" style=\"height:179px; width:467px\" /></p>\r\n\r\n<p>然而，在CSS2的时代，我们多半使用图片实现类似效果，或是使用CSS其他属性模拟阴影效果，但是，现在，CSS3的崛起使得这个问题已经不再是是个问题了，本文就将展示如何实现跨浏览器的盒阴影效果。</p>\r\n\r\n<p>二、标准方法<br />\r\n标准方法当然就是指使用CSS3的方法了，这个应该不少同行应该知道，参见如下代码：<br />\r\n.shadow{<br />\r\n&nbsp;&nbsp; &nbsp;-moz-box-shadow: 3px 3px 4px #000;<br />\r\n&nbsp;&nbsp; &nbsp;-webkit-box-shadow: 3px 3px 4px #000;<br />\r\n&nbsp;&nbsp; &nbsp;box-shadow: 3px 3px 4px #000;<br />\r\n}<br />\r\n释义为：横向偏移3像素，纵向偏移3像素，模糊4像素，颜色为纯黑。<br />\r\n如果我们把含上面样式的这个class shadow应用到图片上，就会产生如下的效果（截自Firefox3.6）：</p>\r\n\r\n<p><img alt=\"\" src=\"/data/pic/20150415171413206649.jpg\" style=\"height:250px; width:320px\" /></p>\r\n\r\n<p>三、那么IE浏览器呢？<br />\r\n对于目前对CSS3支持如狗屎的孤芳自赏的IE浏览器怎么办呢？box-shadow属性对于IE浏览器就像是圣诞树上的彩灯&mdash;&mdash;装饰而已。<br />\r\n好在IE浏览器有个IE <a href=\"http://msdn.microsoft.com/en-us/library/ms533086%28VS.85%29.aspx\">shadow滤镜</a>，是IE浏览器私有的一个东西，可以模拟还凑合的盒阴影效果，使用类似于下面的代码：<br />\r\n.shadow {<br />\r\n&nbsp;&nbsp; &nbsp;/* For IE 8 */<br />\r\n&nbsp;&nbsp; &nbsp;-ms-filter: &quot;progid:DXImageTransform.Microsoft.Shadow(Strength=4, Direction=135, Color=&#39;#000000&#39;)&quot;;<br />\r\n&nbsp;&nbsp; &nbsp;/* For IE 5.5 - 7 */<br />\r\n&nbsp;&nbsp; &nbsp;filter: progid:DXImageTransform.Microsoft.Shadow(Strength=4, Direction=135, Color=&#39;#000000&#39;);<br />\r\n}<br />\r\n将shadow这个class应用到图片上，结果如下（截自IE6浏览器）：</p>\r\n\r\n<p><img alt=\"\" src=\"/data/pic/20150415171529546704.jpg\" style=\"height:247px; width:297px\" /></p>\r\n\r\n<p>虽然效果不及Firefox，chrome等现代浏览器，但是还能凑合着用用。</p>\r\n\r\n<p>四、样式综合<br />\r\n如下代码：<br />\r\n.shadow{<br />\r\n&nbsp;&nbsp; &nbsp;-moz-box-shadow: 3px 3px 4px #000;<br />\r\n&nbsp;&nbsp; &nbsp;-webkit-box-shadow: 3px 3px 4px #000;<br />\r\n&nbsp;&nbsp; &nbsp;box-shadow: 3px 3px 4px #000;<br />\r\n&nbsp;&nbsp; &nbsp;/* For IE 8 */<br />\r\n&nbsp;&nbsp; &nbsp;-ms-filter: &quot;progid:DXImageTransform.Microsoft.Shadow(Strength=4, Direction=135, Color=&#39;#000000&#39;)&quot;;<br />\r\n&nbsp;&nbsp; &nbsp;/* For IE 5.5 - 7 */<br />\r\n&nbsp;&nbsp; &nbsp;filter: progid:DXImageTransform.Microsoft.Shadow(Strength=4, Direction=135, Color=&#39;#000000&#39;);<br />\r\n}<br />\r\n更多CSS3属性的跨浏览器支持可以查阅<a href=\"http://css3please.com\">这里(css3please.com)</a>。</p>\r\n\r\n<p>五、浏览器支持情况<br />\r\n&nbsp;&nbsp;&nbsp; Firefox 3.5+<br />\r\n&nbsp;&nbsp;&nbsp; Safari 3+<br />\r\n&nbsp;&nbsp;&nbsp; Google Chrome<br />\r\n&nbsp;&nbsp;&nbsp; Opera 10.50<br />\r\n&nbsp;&nbsp;&nbsp; Internet Explorer 5.5</p>\r\n',0,1429089609,0,0),(3,6,'谈谈网站静态化','<p><span style=\"font-size:22px\"><strong>写在前头</strong></span><br />\r\n静态化是解决减轻网站压力,提高网站访问速度的常用方案,但在强调交互的We2.0 时代,对静态化提出了更高的要求,静态不仅要能静,还要能动,下面我通过一个项目,谈谈网站静态化后的架构设计方案,同时和大家探讨一下,在开源产品大行其道,言架构必称MemberCache, Nginx,的时代,微软技术在网站架构设计中的运用.</p>\r\n\r\n<p><span style=\"font-size:22px\"><strong>静态化的设计原则和步骤</strong></span><br />\r\n静态化是解决减轻网站压力,但是静态化也会带来一系列的问题,包括开发上复杂度的增加,维护难度的增加,运用不的当,更可能适得其反,而许多替代方案,比如页面缓存,如果运用得当,也能起到很好的效果,所以在开始之前,必须进行详细的考察,确定是否适合静态化,并制定适合的静态化方式,下面先介绍一下</p>\r\n\r\n<p><span style=\"font-size:16px\"><strong>1考查读写比:</strong></span><br />\r\n&nbsp;&nbsp; &nbsp;读写比,准确的说是读写负荷比,是否值得静态化的最终考虑,由于一般写入的压力明显大于读出的压力,如果写入太频繁,或者每次写入消耗的资源太多,都不能达到效果,我觉得读写比例10:1应该是个上限.具体情况需要根据自己的业务逻辑判断</p>\r\n\r\n<p><span style=\"font-size:16px\"><strong>2确定页面呈现的内容是否适合静态化:</strong></span><br />\r\n&nbsp;&nbsp; &nbsp;在设计方案时,必须详细考虑每个原型页面,找到页面上展示的信息,和他的更新方式,更新时机,更新频率,一定要注意那些不起眼的信息,他们可能左右你的设计,<br />\r\n&nbsp;&nbsp; &nbsp;比如:我们以CSDN的论坛的任意一篇帖子为例,进行分析</p>\r\n\r\n<p><br />\r\n<img alt=\"\" src=\"/data/pic/20150415175234417312.jpg\" style=\"height:466px; width:512px\" /></p>\r\n\r\n<p>&nbsp;&nbsp; &nbsp;上面的帖子中呈现的内容主要是这样几块,帖子内容,回复内容,发帖人回复人的用户信息<br />\r\n&nbsp;&nbsp; &nbsp;帖子内容和回复内容在发帖时更新,发帖后用户可以修改其内容,更新频率高<br />\r\n&nbsp;&nbsp; &nbsp;用户信息,用户修改个人信息时可能会发生更改,用户等级增加时也可能发生更改,比如加星,更新频率低<br />\r\n&nbsp;&nbsp; &nbsp;回复数将每次回复后都要更改,更新频率高<br />\r\n&nbsp;&nbsp; &nbsp;设计时要注意细节,如上图中圈出来的部分,这些部分是怎么修改的,频率有多大,一个都不能放过</p>\r\n\r\n<p><span style=\"font-size:16px\"><strong>3确定生成方式:</strong></span><br />\r\n&nbsp;&nbsp; &nbsp;在上面帖子一例中.每次更改都重新生成页面是不可取的,一篇比回复数多的帖子,需要的数据量是巨大的(每层楼的用户信息,回复内容),任何修改,都需要重新取出数据进行生成是不能允许的.一般除非你的页面基本不用更新,或者更新开销极小,(比如一段嵌入的广告代码)才能采用整体更新的方式,不然就需要我们找到合适的更新页面局部区域的方法:<br />\r\n&nbsp;&nbsp; &nbsp;一般有下面两个方法:</p>\r\n\r\n<p>&nbsp;&nbsp; &nbsp;<strong>1)正则修改法:</strong><br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;比如,如果帖子中的回复数,html代码是这样<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&lt;label&gt;回复数&lt;var id=&quot;replyCount&quot;&gt;34&lt;/var&gt;&lt;/label&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;我们可以通过用下面正则来查找并替换计数<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;(?&lt;=id=&quot;replyCount&quot;&gt;)\\d{1,}<br />\r\n&nbsp;&nbsp; &nbsp;<strong>2)页面区域分块:</strong><br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;把页面分成很多小块,在显示时组装起来,比如DotText就采用这个方法</p>\r\n\r\n<p><img alt=\"\" src=\"/data/pic/20150415182538857397.jpg\" style=\"height:441px; width:379px\" /></p>\r\n\r\n<p>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;这是一篇典型的Dottext blog页面,其中红色标定部分是一个独立的文件,而黄色框内的是脚本动态加载,这些部分在最终显示的时候组合起来,最终构成了一篇Blog,具体的组合方法也有多种,可以使用Include,也可以自己来实现.DotText就自己实现了一套加载机制</p>\r\n\r\n<p>&nbsp;&nbsp; &nbsp;上面的两种方法并不孤立,并可以根据需要,配合使用</p>\r\n\r\n<p><span style=\"font-size:16px\"><strong>4确定需要动态加载的信息:</strong></span><br />\r\n&nbsp;&nbsp; &nbsp;页面上总有一些内容看起来不太适合静态化,最典型的是一些统计结果,比如如果你在做一个图书介绍页面,可能就会需要展示图书的当天综合评分,或者书籍排名,这些内容需要用脚本进行动态加载<br />\r\n&nbsp;&nbsp; &nbsp;既然做了静态化,就是希望减少服务器负载,动态加载的数据总是不得已而为之,有的时候在需求允许的情况下,我们在数据在实时性和性能方面做一些妥协,比如上面帖子中的用户星级和昵称,从数据实时性上说,当用户的星级增长,他发言的所有帖子都应该发生变化,所以应该用动态加载.然而其实上这些信息如果不发生变化,也无伤大雅,用户反而能够看到自己在多年前发帖时的级别和昵称.</p>\r\n\r\n<p><span style=\"font-size:22px\"><strong>现实中的项目</strong></span><br />\r\n&nbsp;&nbsp; &nbsp;X网站是大型的电影资讯,电影社区,向外提供电影相关信息服务,以及用户社区,其中信息服务部分, 其中大部分页面属于信息呈现页,读取量比较大,百万级别pv,信息主要由编辑在后台发布,更新较少,但其页面上有大量的交互性的内容,比如评论,收藏列表,同时许多内容允许用户创造,比如上传图片,添加注释.交互内容的数量和交互的频繁程度,都超过了普通的咨询页面,这次调整,准备将其中访问量最大的几块:电影资料页,影人资料页,进行静态化,如果成功,还将运用到更多的频道,基本实现全站静态化<br />\r\n&nbsp;&nbsp; &nbsp;通过对页面设计和前一版本的分析,下面是具有挑战性的地方.这些特点基本使用于大多数web2.0的站点,很具有典型意义</p>\r\n\r\n<p><span style=\"font-size:16px\"><strong>1页面生成的触发条件复杂</strong></span><br />\r\n&nbsp;&nbsp; &nbsp;一般论坛中的帖子或者blog,更新方式比较单一:主要是由回复进行触发还有少数的修改动作,然而该网站一个页面上需要根据不同触发条件就有20多个, 比如光二级菜单:用户发布图片,删除图片,发布或者删除影片信息,发布或者修改视频,后台修改电影信息,都有可能触发</p>\r\n\r\n<p><span style=\"font-size:16px\"><strong>2一个动作触发生成的页面可能很多而且相互交叠</strong></span><br />\r\n&nbsp;&nbsp; &nbsp;每一个动作都会触发一系列的生成,并且不同动作可能都会涉及同一个页面或者区域的生成.<br />\r\n&nbsp;&nbsp; &nbsp;比如:用户给一步电影评分,需要生成评分更多页,评分统计更多页,首页右侧谁还关注此影片小区域,等等.用户收藏一个影片,也需要更新首页右侧谁还关注此影片小区域</p>\r\n\r\n<p><span style=\"font-size:16px\"><strong>3触发频繁</strong></span><br />\r\n&nbsp;&nbsp; &nbsp;虽然不及某些更大规模的网站,但是由于涉及众多用户参与的内容,评论,收藏等等,触发点多,发生频度相当频繁</p>\r\n\r\n<p><span style=\"font-size:16px\"><strong>4页面多,结构复杂,空间占用大</strong></span><br />\r\n&nbsp;&nbsp; &nbsp;通常,需要生成的页面规模是这样粗略估算的,Rn*P,Rn为资源数,P为每个资源的页面数,所谓资源,可以看做一个生成单位,其页面数可以简单看做发布一个资源,就需要生成其所有相关页面数量,比如:发布一个blog,就需要生成一个Blog页,同时还需要生成或者更新个人主页的blog列表,算上个人主页右侧的分类文章数的小块,也就是最多10来个页面或者区域,但是发布一个电影,其相关的页面至少有50个以上,而且有的页面还带有分页,一个信息比较丰富的电影,其页面竟可以达到千个以上,空间10~20M,而且资源总数也不少,电影80000左右,电影人虽然P值较少,但是总量确有几十万之巨,估计静态页面磁盘占用量几百个G</p>\r\n\r\n<p><span style=\"font-size:16px\"><strong>5向下兼容</strong></span><br />\r\n&nbsp;&nbsp; &nbsp;这是一个已有系统,旧系统的框框需要突破,但又没有时间,或者不能完全突破,比如Url,已经被收录到搜索引擎,就不能随便调整,还有一些地方,原本没有为静态生成考虑,另一些地方又需要兼容旧的设计</p>\r\n\r\n<p><span style=\"font-size:16px\"><strong>6多台前端Web</strong></span><br />\r\n&nbsp;&nbsp; &nbsp;这种结构要求生成的文件可能需要分布到多个服务器(另一个方案是放在几台专用的机器上,等前端来取)</p>\r\n\r\n<p><span style=\"font-size:16px\"><strong>7任务紧迫</strong></span><br />\r\n&nbsp;&nbsp; &nbsp;架构讨论结束仪式六月初,离奥运开幕上线只有两月,也就是说所有底层框架实现,页面模板开发,调试测试,动作的整理,必须在7月底全部完成,按我原来估计,光实现这几块的上百个页面模板和填充方法,也需要那么长的时间</p>\r\n\r\n<p>综合考虑上述因素,架构必须要有以下几个方面的特点<br />\r\n1动作可以灵活扩展配置,某个动作对应哪些生成,应该可以配置,并且可以分组<br />\r\n2文件必须有分发机制<br />\r\n3分发和生成必须独立出来,并且支持分布式<br />\r\n4各种的动作,必须转化为消息,发送到生成和分发服务器进行处理<br />\r\n5针对同意资源频繁动作,在变量相同的情况下能够具有合并的能力<br />\r\n6动作必须有记录<br />\r\n7尽量考虑使用已有成熟技术,节省开发时间</p>\r\n\r\n<p><span style=\"font-size:22px\"><strong>下面是设计的第一个架构</strong></span></p>\r\n\r\n<p><img alt=\"\" src=\"/data/pic/20150415183039307888.jpg\" style=\"height:272px; width:554px\" /></p>\r\n\r\n<p>用户的动作经过MSMQ<a href=\"#tar1\">[1]</a>传入到生成分发中心(途中绿色箭头)进行处理,,处理中心接受到消息后,负责生成对应的页面或者页面区域,并将页面分发到各个服务器,负载均衡沿用以前的架构,采用微软的NLB<a href=\"#tar2\">[2]</a></p>\r\n\r\n<p>之所以用MSMQ,就是看上了他提供的完整的消息存储恢复机制,这样我们能确保即使服务器down掉重启后,消息依然能正常处理,碰巧我们cms组的同事MSMQ非常熟悉,并且真准备在另外一个项目中使用类似的架构&mdash;于是一拍即合</p>\r\n\r\n<p>页面采用分块存储,这样能保证生成时目标小,开销小,也能重用性,然后再藉由SSI<a href=\"#tar3\">[3]</a>(shtml include)进行整合,之所以采取这样的方案,而不采用Dottext的整合方式,是因为如果采用Dottext的方式,就必须走IIS和.Net的管道<a href=\"#tar4\">[4]</a>,而据测试,经过管道和直接返回html性能有非常大的差异,而使用ssi,在性能上是一个折中,并且可以Light HTTPd等高性能web服务器</p>\r\n\r\n<p>模板生成方式,采用了XSLT和另外一种自定义的模板(我的同事开发的机制,很有趣, 理论上能把传统模板替换的性能开销全部消除),生成的最终产物是shtml,之所以生成shtml是为了使用其ssi(Server Side Include)的特性,保证一定的灵活性,并实现热点数据的分离:某些页面上的部分可能会频繁更新和生成,而其它地方不变,或者某个部分是所有页面通用的(比如页头和页脚),较之php下常常使用smarty,生成php文件,虽然灵活性不如php,但是性能上不相上下,还略高.</p>\r\n\r\n<p>但是这个设计的问题是动态内容和静态内容没有分开,生成的html页面,和动态页面都放在前端服务器上,通过负载均衡访问,也造成了分发服务器需要分发到多台服务器,网络IO效率较低,而且静态内容需要的磁盘空间很大,且小文件非常多,和动态页面混在一起不便于优化,所以第二个方案对生成的静态内容与动态内容使用不同的服务器</p>\r\n\r\n<p><span style=\"font-size:22px\"><strong>方案二:</strong></span></p>\r\n\r\n<p><img alt=\"\" src=\"/data/pic/20150415183121922381.jpg\" style=\"height:272px; width:554px\" /></p>\r\n\r\n<p>我们把生成的静态文件单独放置,可以看到,前端增加Nginx,作为跳转,把电影,影人资料库的页面转向静态服务器,其他的调用转向动态服务器,这样我们就可以单独为静态服务器进行优化,比如采用更高效的服务器等等.</p>\r\n\r\n<p>同时减少了文件分发的次数(甚至可以只分发到本机),提高生成分发的处理能力</p>\r\n\r\n<p>更进一步,可以把图片服务分到另外一组机器上,使用独立的域名,比如img.xxx.com,这样可以有效的减少带宽</p>\r\n\r\n<p><span style=\"font-size:22px\"><strong>最终完整架构:</strong></span></p>\r\n\r\n<p><img alt=\"\" src=\"/data/pic/20150415183234894284.jpg\" style=\"height:458px; width:554px\" /></p>\r\n\r\n<p><span style=\"font-size:22px\"><strong>文件生成分发中心</strong></span></p>\r\n\r\n<p>下图是文件生成分发中心的工作流程图</p>\r\n\r\n<p><img alt=\"\" src=\"/data/pic/20150415183356348922.jpg\" style=\"height:293px; width:526px\" /></p>\r\n\r\n<p>生成服务对外只有一个输入,就是消息,一个输出:静态文件,内部根据消息,从配置文件中找到对应的生成方法,取出相应的模板,进行数据填充</p>\r\n\r\n<p>分发服务主要吧生成服务产生的文件进行分发,分发到前端的N台服务器上,开始考虑得比较复杂,希望分发服务可以跨越协议(本地文件系统,局域网,http协议),跨越多种存储介质(文件系统,数据库),实际最后定下来基本是本地文件系统或者局域网传输</p>\r\n\r\n<p><strong>注:上图中文件分发的部分也可以通过定制MogileFS,来实现分布式文件系统</strong></p>\r\n\r\n<p><span style=\"font-size:22px\"><strong>马后炮:</strong></span></p>\r\n\r\n<p>总结起来,静态化除了对架构方面的影响,对开发和测试流程也有影响<br />\r\n<span style=\"font-size:16px\"><strong>对测试提出更高的要求:</strong></span><br />\r\n因为一旦上线后,某个页面发现问题,即使是文字的修改,也需要重新生成许多页面,所以测试人员必须非常仔细,测试周期也需要延长</p>\r\n\r\n<p><span style=\"font-size:16px\"><strong>开发人员需要掌握模板语言:</strong></span><br />\r\n需要掌握一种模板预言,无论是Xslt还是自己开发的模板语言,都需要花一定的时间掌握</p>\r\n\r\n<p><span style=\"font-size:16px\"><strong>需要给第一次生成腾出足够时间:</strong></span><br />\r\n如果不是新系统,那么数据迁移和生成的过程就比较痛苦,由于页面众多,第一次生成的过程可能需要以天来计算,在制定上线方案是就需要考虑到这个方面</p>\r\n\r\n<p>Nginx作为前端的跳转,根据其他网站的经验,应该可以达到2-3万并发连接,但是使用之后,常常有卡壳的情况发生,具体症状为在浏览器中访问页面时,连接超时,或者一直不响应,此时Nginx连接数并不高,好在还有第一套方案可以备用,让我们有时间去解决这个问题,如果大家对这个问题有什么心得,欢迎交流<br />\r\n我的联系方式<br />\r\nMSN:yizhu2000@hotmail.com<br />\r\nGtalk:yizhu2005@gmail.com</p>\r\n\r\n<p><span style=\"font-size:22px\"><strong>篇后:</strong></span><br />\r\n在大型web开发上,我感到微软产品结构(包括微软开源社区的成果)在某些方面还存在一些不足:</p>\r\n\r\n<p><span style=\"font-size:16px\"><strong>高性能服务器选择太少</strong></span><br />\r\nLinux下可以采用Light HTTPd,Nginx等诸多服务器,这些服务器在很多方面的表现会让Windows下唯一的选择--IIS相形见绌</p>\r\n\r\n<p><span style=\"font-size:16px\"><strong>分布式文件系统</strong></span><br />\r\n微软及其社区没有比较著名的产品出现,Linux下有MogileFS</p>\r\n\r\n<p><span style=\"font-size:16px\"><strong>微软架构下,文件系统选择太少</strong></span><br />\r\n在Linux下我们可以选择诸如Ext3,ReiserFS,而Windows环境下,NTFS是唯一的选择,不过值得称道的是.NTFS的效率和稳定性都相当不错.</p>\r\n\r\n<p><span style=\"font-size:16px\"><strong>开源技术对windows版本的支持态度不积极</strong></span><br />\r\n诸多在Linux下名声卓著的开源产品,又懒于为Windows提供相应的版本,或者提供的windows版本效果差强人意.使得采用微软服务器的厂商少了很多选择</p>\r\n\r\n<p>现在的Web开发已经进入了各种技术大混合,大整合的时代,任何一个厂商都不可能涵盖所有方面,在后端架构和逻辑方面.Net和Java严谨,良好的编程风格,清晰的设计思路,较高的运行效率,以及稳定的配套服务支持,是其最大的优势,对主要擅长微软技术的Web工程师和架构师而言,应该增进对Linux及开源社区的了解,才能根据需求设计出合理的架构</p>\r\n\r\n<hr />\r\n<p><a id=\"tar1\" name=\"tar1\">[1]</a>Message Queuing: A Scalable, Highly Available Load-Balancing Solution<br />\r\nhttp://msdn.microsoft.com/en-us/library/ms811052.aspx</p>\r\n\r\n<p><a id=\"tar2\" name=\"tar2\">[2]</a>网络负载平衡(NLB)详解,注意文章后给出的参考链接<br />\r\nhttp://blog.chinaitlab.com/user1/563173/archives/2007/132713.html</p>\r\n\r\n<p><a id=\"tar3\" name=\"tar3\">[3]</a>怎样使用ssi,及其语法:<br />\r\nhttp://blog.csdn.net/dadou2007/archive/2008/06/08/2521365.aspx<br />\r\nNginx下的ssimodule<br />\r\nhttp://www.nginx.cn/NginxChsHttpSsiModule</p>\r\n\r\n<p><a id=\"tar4\" name=\"tar4\">[4]</a>asp.net的处理机制http://www.microsoft.com/china/msdn/library/webservices/asp.net/dnvs05Internals.mspx?mfr=true<br />\r\nhtml.asp.aspx运行效率比较<br />\r\nhttp://iamlibai.blogbus.com/logs/2017870.html</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>朱燚的技术博客,转载请注明出处<br />\r\nhttp://yizhu2000.cnblogs.com<br />\r\nhttp://blog.csdn.net/yizhu2000</p>\r\n',0,1429094245,1429094717,0);
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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='博文分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'js',0,1,0,0,0,0),(2,'jquery',1,2,1,0,0,0),(3,'css',0,1,0,0,0,0),(4,'css3',3,2,1,0,0,0),(5,'网站性能',0,1,0,0,0,0),(6,'静态化',5,2,1,0,0,0);
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

-- Dump completed on 2015-04-15 18:46:41
