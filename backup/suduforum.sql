-- MySQL dump 10.11
--
-- Host: localhost    Database: suduforum
-- ------------------------------------------------------
-- Server version	5.0.51b-community-nt

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
-- Table structure for table `jforum_api`
--

DROP TABLE IF EXISTS `jforum_api`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jforum_api` (
  `api_id` int(11) NOT NULL auto_increment,
  `api_key` varchar(32) NOT NULL,
  `api_validity` datetime NOT NULL,
  PRIMARY KEY  (`api_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_api`
--

LOCK TABLES `jforum_api` WRITE;
/*!40000 ALTER TABLE `jforum_api` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_api` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_attach`
--

DROP TABLE IF EXISTS `jforum_attach`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jforum_attach` (
  `attach_id` int(11) NOT NULL auto_increment,
  `post_id` int(11) default NULL,
  `privmsgs_id` int(11) default NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY  (`attach_id`),
  KEY `idx_att_post` (`post_id`),
  KEY `idx_att_priv` (`privmsgs_id`),
  KEY `idx_att_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_attach`
--

LOCK TABLES `jforum_attach` WRITE;
/*!40000 ALTER TABLE `jforum_attach` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_attach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_attach_desc`
--

DROP TABLE IF EXISTS `jforum_attach_desc`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jforum_attach_desc` (
  `attach_desc_id` int(11) NOT NULL auto_increment,
  `attach_id` int(11) NOT NULL,
  `physical_filename` varchar(255) NOT NULL,
  `real_filename` varchar(255) NOT NULL,
  `download_count` int(11) default NULL,
  `description` varchar(255) default NULL,
  `mimetype` varchar(50) default NULL,
  `filesize` int(11) default NULL,
  `upload_time` datetime default NULL,
  `thumb` tinyint(1) default '0',
  `extension_id` int(11) default NULL,
  PRIMARY KEY  (`attach_desc_id`),
  KEY `idx_att_d_att` (`attach_id`),
  KEY `idx_att_d_ext` (`extension_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_attach_desc`
--

LOCK TABLES `jforum_attach_desc` WRITE;
/*!40000 ALTER TABLE `jforum_attach_desc` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_attach_desc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_attach_quota`
--

DROP TABLE IF EXISTS `jforum_attach_quota`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jforum_attach_quota` (
  `attach_quota_id` int(11) NOT NULL auto_increment,
  `group_id` int(11) NOT NULL,
  `quota_limit_id` int(11) NOT NULL,
  PRIMARY KEY  (`attach_quota_id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_attach_quota`
--

LOCK TABLES `jforum_attach_quota` WRITE;
/*!40000 ALTER TABLE `jforum_attach_quota` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_attach_quota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_banlist`
--

DROP TABLE IF EXISTS `jforum_banlist`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jforum_banlist` (
  `banlist_id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `banlist_ip` varchar(15) default NULL,
  `banlist_email` varchar(255) default NULL,
  PRIMARY KEY  (`banlist_id`),
  KEY `idx_user` (`user_id`),
  KEY `banlist_ip` (`banlist_ip`),
  KEY `banlist_email` (`banlist_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_banlist`
--

LOCK TABLES `jforum_banlist` WRITE;
/*!40000 ALTER TABLE `jforum_banlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_banlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_banner`
--

DROP TABLE IF EXISTS `jforum_banner`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jforum_banner` (
  `banner_id` int(11) NOT NULL auto_increment,
  `banner_name` varchar(90) default NULL,
  `banner_placement` int(11) NOT NULL default '0',
  `banner_description` varchar(250) default NULL,
  `banner_clicks` int(11) NOT NULL default '0',
  `banner_views` int(11) NOT NULL default '0',
  `banner_url` varchar(250) default NULL,
  `banner_weight` tinyint(1) NOT NULL default '50',
  `banner_active` tinyint(1) NOT NULL default '0',
  `banner_comment` varchar(250) default NULL,
  `banner_type` int(11) NOT NULL default '0',
  `banner_width` int(11) NOT NULL default '0',
  `banner_height` int(11) NOT NULL default '0',
  PRIMARY KEY  (`banner_id`),
  KEY `banner_id` (`banner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_banner`
--

LOCK TABLES `jforum_banner` WRITE;
/*!40000 ALTER TABLE `jforum_banner` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_bookmarks`
--

DROP TABLE IF EXISTS `jforum_bookmarks`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jforum_bookmarks` (
  `bookmark_id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `relation_id` int(11) NOT NULL,
  `relation_type` int(11) NOT NULL,
  `public_visible` int(11) default '1',
  `title` varchar(255) default NULL,
  `description` varchar(255) default NULL,
  PRIMARY KEY  (`bookmark_id`),
  KEY `book_idx_relation` (`relation_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_bookmarks`
--

LOCK TABLES `jforum_bookmarks` WRITE;
/*!40000 ALTER TABLE `jforum_bookmarks` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_bookmarks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_categories`
--

DROP TABLE IF EXISTS `jforum_categories`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jforum_categories` (
  `categories_id` int(11) NOT NULL auto_increment,
  `title` varchar(100) NOT NULL default '',
  `display_order` int(11) NOT NULL default '0',
  `moderated` tinyint(1) default '0',
  `parent_id` int(11) default '0',
  PRIMARY KEY  (`categories_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_categories`
--

LOCK TABLES `jforum_categories` WRITE;
/*!40000 ALTER TABLE `jforum_categories` DISABLE KEYS */;
INSERT INTO `jforum_categories` VALUES (1,'速读资料',1,0,0),(2,'训练讨论',2,0,0),(3,'自由讨论',3,0,0);
/*!40000 ALTER TABLE `jforum_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_config`
--

DROP TABLE IF EXISTS `jforum_config`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jforum_config` (
  `config_name` varchar(255) NOT NULL default '',
  `config_value` varchar(255) NOT NULL default '',
  `config_id` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_config`
--

LOCK TABLES `jforum_config` WRITE;
/*!40000 ALTER TABLE `jforum_config` DISABLE KEYS */;
INSERT INTO `jforum_config` VALUES ('most.users.ever.online','5',1),('most.users.ever.online.date','1244553522937',2);
/*!40000 ALTER TABLE `jforum_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_extension_groups`
--

DROP TABLE IF EXISTS `jforum_extension_groups`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jforum_extension_groups` (
  `extension_group_id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  `allow` tinyint(1) default '1',
  `upload_icon` varchar(100) default NULL,
  `download_mode` tinyint(1) default '1',
  PRIMARY KEY  (`extension_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_extension_groups`
--

LOCK TABLES `jforum_extension_groups` WRITE;
/*!40000 ALTER TABLE `jforum_extension_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_extension_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_extensions`
--

DROP TABLE IF EXISTS `jforum_extensions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jforum_extensions` (
  `extension_id` int(11) NOT NULL auto_increment,
  `extension_group_id` int(11) NOT NULL,
  `description` varchar(100) default NULL,
  `upload_icon` varchar(100) default NULL,
  `extension` varchar(10) default NULL,
  `allow` tinyint(1) default '1',
  PRIMARY KEY  (`extension_id`),
  KEY `extension_group_id` (`extension_group_id`),
  KEY `extension` (`extension`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_extensions`
--

LOCK TABLES `jforum_extensions` WRITE;
/*!40000 ALTER TABLE `jforum_extensions` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_extensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_forums`
--

DROP TABLE IF EXISTS `jforum_forums`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jforum_forums` (
  `forum_id` int(11) NOT NULL auto_increment,
  `categories_id` int(11) NOT NULL default '1',
  `forum_name` varchar(150) NOT NULL default '',
  `forum_desc` varchar(255) default NULL,
  `forum_order` int(11) default '1',
  `forum_topics` int(11) NOT NULL default '0',
  `forum_last_post_id` int(11) NOT NULL default '0',
  `moderated` tinyint(1) default '0',
  PRIMARY KEY  (`forum_id`),
  KEY `categories_id` (`categories_id`),
  KEY `idx_forums_cats` (`categories_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_forums`
--

LOCK TABLES `jforum_forums` WRITE;
/*!40000 ALTER TABLE `jforum_forums` DISABLE KEYS */;
INSERT INTO `jforum_forums` VALUES (1,1,'新手快速入门','如果你是速读新手，请从这里开始',1,5,33,1),(2,1,'心得经验分享','这里聚集众多读友成功的经验和失败的教训',2,0,0,1),(4,1,'速读资料下载','海量速读、速记、右脑开发资料免费下载 (如有侵权，请立即警告本站)',3,0,0,1),(5,2,'基础训练','',4,0,0,0),(6,2,'实战训练','',5,0,0,0),(7,2,'思维导图','',6,0,0,0),(8,2,'速记训练','',7,0,0,0),(9,2,'右脑开发','',8,0,0,0),(10,3,'建议意见','',9,4,38,0),(11,3,'海阔天空','',10,9,34,0);
/*!40000 ALTER TABLE `jforum_forums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_forums_watch`
--

DROP TABLE IF EXISTS `jforum_forums_watch`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jforum_forums_watch` (
  `forum_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  KEY `idx_fw_forum` (`forum_id`),
  KEY `idx_fw_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_forums_watch`
--

LOCK TABLES `jforum_forums_watch` WRITE;
/*!40000 ALTER TABLE `jforum_forums_watch` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_forums_watch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_groups`
--

DROP TABLE IF EXISTS `jforum_groups`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jforum_groups` (
  `group_id` int(11) NOT NULL auto_increment,
  `group_name` varchar(40) NOT NULL default '',
  `group_description` varchar(255) default NULL,
  `parent_id` int(11) default '0',
  PRIMARY KEY  (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_groups`
--

LOCK TABLES `jforum_groups` WRITE;
/*!40000 ALTER TABLE `jforum_groups` DISABLE KEYS */;
INSERT INTO `jforum_groups` VALUES (1,'注册用户','General Users',0),(2,'系统管理员','Admin Users',0),(3,'栏目管理员','',2),(4,'游客','未注册、未登录用户',0);
/*!40000 ALTER TABLE `jforum_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_karma`
--

DROP TABLE IF EXISTS `jforum_karma`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jforum_karma` (
  `karma_id` int(11) NOT NULL auto_increment,
  `post_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `post_user_id` int(11) NOT NULL,
  `from_user_id` int(11) NOT NULL,
  `points` int(11) NOT NULL,
  `rate_date` datetime default NULL,
  PRIMARY KEY  (`karma_id`),
  KEY `post_id` (`post_id`),
  KEY `topic_id` (`topic_id`),
  KEY `post_user_id` (`post_user_id`),
  KEY `from_user_id` (`from_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_karma`
--

LOCK TABLES `jforum_karma` WRITE;
/*!40000 ALTER TABLE `jforum_karma` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_karma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_mail_integration`
--

DROP TABLE IF EXISTS `jforum_mail_integration`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jforum_mail_integration` (
  `forum_id` int(11) NOT NULL,
  `forum_email` varchar(100) NOT NULL,
  `pop_username` varchar(100) NOT NULL,
  `pop_password` varchar(100) NOT NULL,
  `pop_host` varchar(100) NOT NULL,
  `pop_port` int(11) default '110',
  `pop_ssl` tinyint(4) default '0',
  KEY `forum_id` (`forum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_mail_integration`
--

LOCK TABLES `jforum_mail_integration` WRITE;
/*!40000 ALTER TABLE `jforum_mail_integration` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_mail_integration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_moderation_log`
--

DROP TABLE IF EXISTS `jforum_moderation_log`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jforum_moderation_log` (
  `log_id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `log_description` text NOT NULL,
  `log_original_message` text,
  `log_date` datetime NOT NULL,
  `log_type` tinyint(4) default '0',
  `post_id` int(11) default '0',
  `topic_id` int(11) default '0',
  `post_user_id` int(11) default '0',
  PRIMARY KEY  (`log_id`),
  KEY `user_id` (`user_id`),
  KEY `post_user_id` (`post_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_moderation_log`
--

LOCK TABLES `jforum_moderation_log` WRITE;
/*!40000 ALTER TABLE `jforum_moderation_log` DISABLE KEYS */;
INSERT INTO `jforum_moderation_log` VALUES (1,3,'new','[b][color=blue][size=18]Congratulations :!: [/size][/color][/b]\nYou have completed the installation, and JForum is up and running. \n\nTo start administering the board, login as [i]Admin / <the password you supplied in the installer>[/i] and access the [b][url=/admBase/login.page]Admin Control Panel[/url][/b] using the link that shows up in the bottom of the page. There you will be able to create Categories, Forums and much more  :D  \n\nFor more information and support, please refer to the following pages:\n\n:arrow: Community forum: http://www.jforum.net/community.jsp\n:arrow: Documentation: http://www.jforum.net/doc\n\nThank you for choosing JForum.\n\n[url=http://www.jforum.net/doc/Team]The JForum Team[/url]\n\n','2009-06-09 21:32:33',2,1,1,2),(2,3,'new','<p>&nbsp;</p>&lt;h3&gt;&lt;span style=\"font-size: 10.5pt\"&gt;什么是快速阅读&lt;/span&gt;&lt;/h3&gt;<p>&lt;span style=\"font-size: 10.5pt\"&gt;什么是快速阅读呢？快速阅读是从文字读物中迅速提取有用信息的高效读书方法。充分开发快速阅读者扩大&lt;strong&gt;视觉感知能力&lt;/strong&gt;和&lt;strong&gt;左右脑协调处理视觉信息&lt;/strong&gt;的巨大潜 能，以&lt;strong&gt;眼脑直映&lt;/strong&gt;的信息全新处理方式取代传统阅读中大脑的视觉中枢，语言中枢，听觉中枢对文字信息处理的环节从而达到&lt;strong&gt;眼看脑记&lt;/strong&gt;，&lt;strong&gt;眼脑同步&lt;/strong&gt;的快速阅读法。&lt;/span&gt;</p><p>&lt;span style=\"font-size: 10.5pt\"&gt;经过训练的普通人可以在一分钟内快速阅读分辨&lt;span&gt;12&lt;/span&gt;万个字母，可以说快速阅读训练是传统阅读的一种补充，一种飞跃，一种革命。&lt;/span&gt;</p><p>&lt;span style=\"font-size: 10.5pt\"&gt;&lt;span style=\"font-size: 10.5pt; font-family: \'Times New Roman\'\"&gt;<img   />&lt;/span&gt;&lt;/span&gt;</p>','2009-06-09 21:33:32',2,1,1,2),(3,3,'test','<p>&nbsp;</p>&lt;h3&gt;&lt;span style=\"font-size: 10.5pt\"&gt;什么是快速阅读&lt;/span&gt;&lt;/h3&gt;<p>&lt;span style=\"font-size: 10.5pt\"&gt;什么是快速阅读呢？快速阅读是从文字读物中迅速提取有用信息的高效读书方法。充分开发快速阅读者扩大&lt;strong&gt;视觉感知能力&lt;/strong&gt;和&lt;strong&gt;左右脑协调处理视觉信息&lt;/strong&gt;的巨大潜 能，以&lt;strong&gt;眼脑直映&lt;/strong&gt;的信息全新处理方式取代传统阅读中大脑的视觉中枢，语言中枢，听觉中枢对文字信息处理的环节从而达到&lt;strong&gt;眼看脑记&lt;/strong&gt;，&lt;strong&gt;眼脑同步&lt;/strong&gt;的快速阅读法。&lt;/span&gt;</p><p>&lt;span style=\"font-size: 10.5pt\"&gt;经过训练的普通人可以在一分钟内快速阅读分辨&lt;span&gt;12&lt;/span&gt;万个字母，可以说快速阅读训练是传统阅读的一种补充，一种飞跃，一种革命。&lt;/span&gt;</p><p>&nbsp;</p>','2009-06-09 21:33:53',2,1,1,2),(4,3,'test','<p>&lt;h3&gt;&lt;span style=&quot;font-size: 10.5pt&quot;&gt;什么是快速阅读&lt;/span&gt;&lt;/h3&gt; </p><p>&lt;span style=&quot;font-size: 10.5pt&quot;&gt;什么是快速阅读呢？快速阅读是从文字读物中迅速提取有用信息的高效读书方法。充分开发快速阅读者扩大&lt;strong&gt;视觉感知能力&lt;/strong&gt;和&lt;strong&gt;左右脑协调处理视觉信息&lt;/strong&gt;的巨大潜 能，以&lt;strong&gt;眼脑直映&lt;/strong&gt;的信息全新处理方式取代传统阅读中大脑的视觉中枢，语言中枢，听觉中枢对文字信息处理的环节从而达到&lt;strong&gt;眼看脑记&lt;/strong&gt;，&lt;strong&gt;眼脑同步&lt;/strong&gt;的快速阅读法。&lt;/span&gt;</p><p>&lt;span style=&quot;font-size: 10.5pt&quot;&gt;经过训练的普通人可以在一分钟内快速阅读分辨&lt;span&gt;12&lt;/span&gt;万个字母，可以说快速阅读训练是传统阅读的一种补充，一种飞跃，一种革命。&lt;/span&gt;</p>','2009-06-09 21:34:07',2,1,1,2),(5,3,'e','<h3><span style=\"font-size: 10.5pt\">什么是快速阅读</span></h3>\r\n<span style=\"font-size: 10.5pt\">什么是快速阅读呢？快速阅读是从文字读物中迅速提取有用信息的高效读书方法。充分开发快速阅读者扩大<strong>视觉感知能力</strong>和<strong>左右脑协调处理视觉信息</strong>的巨大潜 能，以<strong>眼脑直映</strong>的信息全新处理方式取代传统阅读中大脑的视觉中枢，语言中枢，听觉中枢对文字信息处理的环节从而达到<strong>眼看脑记</strong>，<strong>眼脑同步</strong>的快速阅读法。</span>\r\n\r\n<span style=\"font-size: 10.5pt\">经过训练的普通人可以在一分钟内快速阅读分辨<span>12</span>万个字母，可以说快速阅读训练是传统阅读的一种补充，一种飞跃，一种革命。</span>\r\n','2009-06-09 21:34:34',2,1,1,2),(6,3,'test','&lt;h3&gt;&lt;span style=\"font-size: 10.5pt\"&gt;什么是快速阅读&lt;/span&gt;&lt;/h3&gt;&lt;span style=\"font-size: 10.5pt\"&gt;什么是快速阅读呢？快速阅读是从文字读物中迅速提取有用信息的高效读书方法。充分开发快速阅读者扩大&lt;strong&gt;视觉感知能力&lt;/strong&gt;和&lt;strong&gt;左右脑协调处理视觉信息&lt;/strong&gt;的巨大潜 能，以&lt;strong&gt;眼脑直映&lt;/strong&gt;的信息全新处理方式取代传统阅读中大脑的视觉中枢，语言中枢，听觉中枢对文字信息处理的环节从而达到&lt;strong&gt;眼看脑记&lt;/strong&gt;，&lt;strong&gt;眼脑同步&lt;/strong&gt;的快速阅读法。&lt;/span&gt; &lt;span style=\"font-size: 10.5pt\"&gt;经过训练的普通人可以在一分钟内快速阅读分辨&lt;span&gt;12&lt;/span&gt;万个字母，可以说快速阅读训练是传统阅读的一种补充，一种飞跃，一种革命。&lt;/span&gt; ','2009-06-09 21:35:20',2,1,1,2),(7,3,'html','<html>\r\n<head>\r\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\r\n<meta http-equiv=\"Pragma\" content=\"no-cache\" />\r\n<meta http-equiv=\"Expires\" content=\"-1\" />\r\n<title>发表新主题</title>\r\n<style type=\"text/css\">@import url( /suduforum/templates/default/styles/style.css?1244557154906 );</style>\r\n<style type=\"text/css\">@import url( /suduforum/templates/default/styles/zh_CN.css?1244557154906 );</style>\r\n<style type=\"text/css\">\r\nbody{margin:1px;padding:0;}\r\n#topline{height:21px;cursor:pointer;text-align:right;margin:0px 4px 0px 0;}\r\n#topline ul{margin:0;padding:0;list-style-type:none;height:20px;}\r\n#topline li{margin:0 ;padding:3px 0  0 0;line-height:18px;width:60px;text-align:center;float:right;font-size:12px;background-image:url(/suduforum/templates/default/images/cellpic1.gif);}\r\n#toploginform{margin-top:0px;margin-bottom:0px;font-size:12px;}\r\n#toploginform input[type=\"text\"] {margin-top:0px;border-bottom:1px solid #000000; border-right:0;border-left:0;border-top:0;width:60px;}\r\n.input_text{margin-top:0px;border:1px solid #CCCCCC;width:60px;}\r\n.input_text2{margin-top:0px;border-bottom:1px solid #000000; border-right:0;border-left:0;border-top:0;width:60px;}\r\n#toploginform button{margin:0px;padding:1px 0 0 0;border:1px solid #CCCCCC; background-color:#FFFFFF;height:18px;}\r\n.infoMacro {list-style-type:decimal;font-size:12px;BORDER-RIGHT: #3c78b5 1px solid; BORDER-TOP: #3c78b5 1px solid; BORDER-LEFT: #3c78b5 1px solid; BORDER-BOTTOM: #3c78b5 1px solid; BACKGROUND-COLOR: #FFFFFF;}\r\n.olstyle{margin-top:5px;margin-bottom:5px;}\r\n.olstyle li{margin:3px;}\r\n</style>\r\n<!-- #include \"lightbox.htm\"/ -->\r\n<script type=\"text/javascript\" src=\"/suduforum/templates/default/js/popupmenu.js\"> </script>\r\n<script type=\"text/javascript\">\r\n    window.onload=function(){\r\n  var langPopup = new PopupMenu();\r\n  langPopup.add(\'<img src=\"/suduforum/templates/default/images/pt_BR/lang.gif\" border=\"0\" alt=\"lang\"> 葡萄牙文(巴西)\', function(target) {\r\n   document.forms[\'frm_changlang\'].elements[\'lang\'].value = \"pt_BR\";document.forms[\'frm_changlang\'].submit();\r\n   });\r\n  langPopup.add(\'<img src=\"/suduforum/templates/default/images/pt_PT/lang.gif\" border=\"0\" alt=\"lang\"> 葡萄牙文(葡萄牙)\', function(target) {\r\n   document.forms[\'frm_changlang\'].elements[\'lang\'].value = \"pt_PT\";document.forms[\'frm_changlang\'].submit();\r\n   });\r\n  langPopup.add(\'<img src=\"/suduforum/templates/default/images/zh_CN/lang.gif\" border=\"0\" alt=\"lang\"> 简体中文\', function(target) {\r\n   });\r\n  langPopup.add(\'<img src=\"/suduforum/templates/default/images/it_IT/lang.gif\" border=\"0\" alt=\"lang\"> 意大利\', function(target) {\r\n   document.forms[\'frm_changlang\'].elements[\'lang\'].value = \"it_IT\";document.forms[\'frm_changlang\'].submit();\r\n   });\r\n  langPopup.add(\'<img src=\"/suduforum/templates/default/images/hu_HU/lang.gif\" border=\"0\" alt=\"lang\"> 匈牙利文\', function(target) {\r\n   document.forms[\'frm_changlang\'].elements[\'lang\'].value = \"hu_HU\";document.forms[\'frm_changlang\'].submit();\r\n   });\r\n  langPopup.add(\'<img src=\"/suduforum/templates/default/images/zh_TW/lang.gif\" border=\"0\" alt=\"lang\"> 繁体中文\', function(target) {\r\n   document.forms[\'frm_changlang\'].elements[\'lang\'].value = \"zh_TW\";document.forms[\'frm_changlang\'].submit();\r\n   });\r\n  langPopup.add(\'<img src=\"/suduforum/templates/default/images/nb_NO/lang.gif\" border=\"0\" alt=\"lang\"> 挪威文\', function(target) {\r\n   document.forms[\'frm_changlang\'].elements[\'lang\'].value = \"nb_NO\";document.forms[\'frm_changlang\'].submit();\r\n   });\r\n  langPopup.add(\'<img src=\"/suduforum/templates/default/images/de_DE/lang.gif\" border=\"0\" alt=\"lang\"> 德文\', function(target) {\r\n   document.forms[\'frm_changlang\'].elements[\'lang\'].value = \"de_DE\";document.forms[\'frm_changlang\'].submit();\r\n   });\r\n  langPopup.add(\'<img src=\"/suduforum/templates/default/images/en_US/lang.gif\" border=\"0\" alt=\"lang\"> 英文 (美国)\', function(target) {\r\n   document.forms[\'frm_changlang\'].elements[\'lang\'].value = \"en_US\";document.forms[\'frm_changlang\'].submit();\r\n   });\r\n  langPopup.setSize(200, 0);\r\n  langPopup.bind(\'langDispArea\',true); // target is this pre block\r\n    }\r\n</script>\r\n</head>\r\n<body class=\"zh_CN\">\r\n<!--\r\nOriginal theme from phpBB (http://www.phpbb.com) subSilver\r\nCreated by subBlue design\r\nhttp://www.subBlue.com\r\n\r\nModifications by JForum Team & www.trydone.com\r\n-->\r\n<div style=\"padding:12px 1px 1px 1px;margin:0 4px;background-image:url(/suduforum/templates/default/topbg.gif);\">\r\n<div style=\"width:100%;height:85px;overflow:auto;text-align:left;clear:both;top:0;margin-bottom:0px;background-color:#FFFFFF;\">\r\n<span id=\"topleftlogo\" style=\"width:200px;clear:none;float:left;\"><a href=\"http://192.168.18.168:8080/sudusoft\"><img src=\"/suduforum/templates/default/images/logo.jpg\"  vspace=\"1\" border=\"0\" alt=\"[Logo]\" /></a></span>\r\n<div id=\"topright\" style=\"width:450px;float:right;text-align:right;clear:none;margin:8px 8px 8px 0px;\">\r\n <span id=\"topforumtitle\" class=\"maintitle\">全脑速读训练论坛</span>\r\n<br/>\r\n<img src=\"/suduforum/templates/default/images/icon_mini_search.gif\" alt=\"[Search]\"/>\r\n<a id=\"search\" rel=\"lightbox\"  class=\"mainmenu\" href=\"/suduforum/search/filters.page\"><b>搜索</b></a>\r\n<img src=\"/suduforum/templates/default/images/icon_mini_members.gif\" alt=\"[Members]\" />\r\n<a id=\"latest2\" class=\"mainmenu\" href=\"/suduforum/user/list.page\">会员列表</a>\r\n<img src=\"/suduforum/templates/default/images/icon_mini_groups.gif\" alt=\"[Groups]\" />&nbsp;<a id=\"backtosite\" class=\"mainmenu\" href=\"http://192.168.18.168:8080/sudusoft\">返回首页</a>\r\n<br>\r\n<img src=\"/suduforum/templates/default/images/icon_mini_recentTopics.gif\" alt=\"[Hottest Topics]\" />\r\n<a id=\"hottest\" class=\"mainmenu\" href=\"/suduforum/hottestTopics/list.page\">热门主题</a>\r\n<img src=\"/suduforum/templates/default/images/icon_mini_recentTopics.gif\" alt=\"[Recent Topics]\" />\r\n<a id=\"latest\" class=\"mainmenu\" href=\"/suduforum/recentTopics/list.page\">最新主题</a>\r\n<img src=\"/suduforum/templates/default/images/icon_mini_members.gif\" alt=\"[Moderation Log]\" />\r\n<a id=\"moderationlog\" class=\"mainmenu\" href=\"/suduforum/moderation/showActivityLog.page\">管理日志</a>\r\n</div>\r\n</div>\r\n<div style=\"clear:both;text-align:left;padding:1px;background-color:#FFFFFF;margin:3px 0 0 0;height:23px;overflow:hidden;\">\r\n<form action=\"\" method=\"post\" name=\"frm_changlang\" style=\"display:none;\"><input type=\"hidden\" name=\"lang\" value=\"zh_CN\"/></form>\r\n<span id=\"top_userinfo\" style=\"float:left;\"><img id=\"langDispArea\" style=\"margin:5px;clear:none;float:left;clear:none;cursor:pointer;\" src=\"/suduforum/templates/default/images/zh_CN/lang.gif\" border=\"0\" alt=\"简体中文\">\r\n</span>\r\n<form action=\"/suduforum/jforum.page\" style=\"float:left;clear:none;margin-left:0;padding-left:0;\" method=\"post\" name=\"toploginform\" id=\"toploginform\" accept-charset=\"UTF-8\">\r\n<input type=\"hidden\" name=\"module\" value=\"user\" />\r\n<input type=\"hidden\" name=\"returnPath\" value=\"/suduforum/forums/list.page\" />\r\n<input type=\"hidden\" name=\"action\" value=\"validateLogin\" />\r\n会员名称:<input class=\"input_text\" maxlength=\"40\" size=\"25\" name=\"username\" />\r\n登入密码:<input class=\"input_text\" type=\"password\" maxlength=\"25\" size=\"25\" name=\"password\" />\r\n<label for=\"topautologin\">自动登入: </label><input type=\"checkbox\" id=\"topautologin\" name=\"autologin\" />\r\n<button type=\"submit\"> 登入 </button>\r\n<!--<a id=\"login\"  rel=\"lightbox\"  class=\"mainmenu\" href=\"/suduforum/user/login.page\"><img src=\"/suduforum/templates/default/images/icon_mini_login.gif\" border=\"0\" alt=\"[Login]\" /> 登入</a>-->\r\n<a id=\"register\"  rel=\"lightbox\"  class=\"mainmenu\" href=\"/suduforum/user/insert.page\"><img src=\"/suduforum/templates/default/images/icon_mini_register.gif\" border=\"0\" alt=\"[Register]\" /> 注册</a>\r\n<a href=\"/suduforum/user/lostPassword.page\">忘记密码</a>\r\n<a href=\"/suduforum/user/activateManual.page\">启用我的帐号</a>\r\n</form>\r\n<script type=\"text/javascript\">\r\nif(self.location.href.indexOf(\"/suduforum/user/login.page\")==-1&&self.location.href.indexOf(\"/suduforum/jforum.page\")==-1){\r\ndocument.forms[\"toploginform\"].elements[\"returnPath\"].value=self.location.href;\r\n}\r\n</script>\r\n  <br clear=\"all\"/>\r\n</div>\r\n</div>\r\n<table width=\"100%\" border=\"0\" id=\"maintable\">\r\n<tr>\r\n  <td><script type=\"text/javascript\">\r\nvar CONTEXTPATH = \"/suduforum\";\r\nvar SERVLET_EXTENSION  = \".page\";\r\n</script>\r\n<style type=\"text/css\">@import url( /suduforum/templates/default/styles/tabs.css?1244557154906 );</style>\r\n<style type=\"text/css\">@import url( /suduforum/templates/default/styles/SyntaxHighlighter.css?1244557154906 );</style>\r\n<script type=\"text/javascript\" src=\"/suduforum/templates/default/js/jquery.js?1244557154906\"></script>\r\n<script type=\"text/javascript\" src=\"/suduforum/templates/default/js/post.js?1244557154906\"></script>\r\n<script language=\"javascript\" type=\"text/javascript\" src=\"/suduforum/templates/default/editors/tiny_mce/tiny_mce.js\"></script>\r\n<script language=\"javascript\" type=\"text/javascript\">\r\ntinyMCE.init({\r\n		mode:\"exact\",elements : \"_id_content\"   ,\r\n		theme : \"advanced\",\r\n		language:\"zh_cn_utf8\",\r\n				plugins : \"table,advhr,advimage,advlink,emotions,insertdatetime,preview,contextmenu,paste,fullscreen\",\r\n		theme_advanced_buttons1_add_before : \"newdocument,separator\",\r\n		theme_advanced_buttons1_add : \"fontsizeselect\",\r\n		theme_advanced_buttons2_add : \"\",\r\n		theme_advanced_buttons2_add_before: \"cut,copy,paste,pastetext,pasteword,separator\",\r\n		theme_advanced_buttons3_add_before : \"separator,forecolor,backcolor\",\r\n		theme_advanced_buttons3_add : \"emotions,advhr,separator,ltr,rtl,separator,fullscreen,insertdate,inserttime,preview\",\r\n		theme_advanced_toolbar_location : \"top\",\r\n		theme_advanced_toolbar_align : \"left\",\r\n		theme_advanced_statusbar_location : \"bottom\",\r\n        content_css : \"/suduforum/templates/default/editors/tiny_mce_content.css\",\r\n	    plugi2n_insertdate_dateFormat : \"%Y-%m-%d\",\r\n  	    plugi2n_insertdate_timeFormat : \"%H:%M:%S\",\r\n		external_link_list_url : \"example_link_list.js\",\r\n		external_image_list_url : \"example_image_list.js\",\r\n		media_external_list_url : \"example_media_list.js\",\r\n		file_browser_callback : \"fileBrowserCallBack\",\r\n		paste_use_dialog : false,\r\n		theme_advanced_resizing : true,\r\n		theme_advanced_resize_horizontal : false,\r\n		theme_advanced_link_targets : \"_something=My somthing;_something2=My somthing2;_something3=My somthing3;\",\r\n		paste_auto_cleanup_on_paste : true,\r\n		paste_convert_headers_to_strong : false,\r\n		paste_strip_class_attributes : \"all\",\r\n		paste_remove_spans : false,\r\n		paste_remove_styles : false\r\n	});\r\n    function fileBrowserCallBack(field_name, url, type, win) {\r\n      	alert(\"TODO :Filebrowser callback: field_name: \" + field_name + \", url: \" + url + \", type: \" + type);\r\n     	win.document.forms[0].elements[field_name].value = \"someurl.htm\";\r\n    }\r\n    var swEditor=function (f){\r\n	    var elm = document.getElementById(\'_id_content\');\r\n        var elementId = elm.name ? elm.name : elm.id;\r\n        if(f){\r\n            tinyMCE.addMCEControl(elm, elementId);\r\n	    	document.getElementById(\'bbcode_content\').style.display=\'none\';\r\n        }else{ \r\n            tinyMCE.removeMCEControl(elementId);\r\n            document.getElementById(\'bbcode_content\').style.display=\'\';\r\n	    }\r\n    }\r\n</script>\r\n<script type=\"text/javascript\">\r\n// Helpline messages\r\nb_help = \"粗体: [b]文本[/b]  (alt+b)\";\r\ni_help = \"斜体: [i]文本[/i]  (alt+i)\";\r\nu_help = \"下滑线: [u]文本[/u]  (alt+u)\";\r\nq_help = \"引言回复: [quote]文本[/quote]  (alt+q)\";\r\nc_help = \"程序代码: [code]程序代码[/code]  (alt+c)\";\r\nl_help = \"列表: [list]文本[/list] (alt+l)\";\r\np_help = \"插入图片: [img]http://wwww.xxxx.com/img.ext[/img]  (alt+p)\";\r\nw_help = \"插入 URL: [url]http://url[/url] / [url=http://url]URL加下滑线[/url]  (alt+w)\";\r\na_help = \"关闭所有开启的 BBCode 标签\";\r\ns_help = \"文字颜色: [color=red]文本[/color]  提示: 也可使用 color=#FF0000\";\r\nf_help = \"字型大小: [size=x-small]小号文件[/size]\";\r\ng_help = \"Google: [google]一个搜索关键词[/google]\";\r\ny_help = \"Youtube: [youtube]Youtube视屏地址 或 Flash(SWF)[/youtube]\";\r\nk_help = \"Flash: [flash]Flash动画地址[/flash]\";\r\nv_help = \"WMV: [wmv]WMV/MPG/MPEG/AVI 视屏地址[/wmv]\";\r\nfunction showEmail(beforeAt, afterAt)\r\n{\r\n	return beforeAt + \"@\" + afterAt;\r\n}\r\n\r\nvar starOn = new Image();\r\nstarOn.src = \"/suduforum/templates/default/images/star_on.gif\";\r\n\r\nvar starOff = new Image();\r\nstarOff.src = \"/suduforum/templates/default/images/star_off.gif\";\r\n\r\nfunction writeStars(q, postId)\r\n{\r\n	for (var i = 0; i < 5; i++) {\r\n		var name = \"star\" + postId + \"_\" + i;\r\n		document.write(\"<img name=\'\" + name + \"\' alt=\'*\' />\");\r\n		document.images[name].src = q > i ? starOn.src : starOff.src;\r\n	}\r\n}\r\n\r\nfunction addBookmark(relationType, relationId)\r\n{\r\n	var w = window.open(\'/suduforum/bookmarks/insert/\' + relationType + \'/\' + relationId + \'.page\', \'bookmark_add\', \'width=700, height=200, scrollbars=auto, resizable=true\');\r\n	w.focus();\r\n}\r\nvar panelOpen = false;\r\nvar total = 0;\r\nvar ignoreStart = false;\r\nvar maxAttachments = 0;\r\nvar counter = 0;\r\n\r\n\r\n</script>\r\n\r\n<script type=\"text/javascript\">\r\nfunction validatePostForm(f){\r\n	alert(\"aaaa\");\r\n	return false;\r\n}\r\n<!--\r\nfunction newCaptcha()\r\n{\r\n	document.getElementById(\"captcha_img\").src = \"/suduforum/jforum.page?module=captcha&action=generate&timestamp=\" + new Date().getTime();\r\n}\r\n\r\nfunction validatePostForm(f)\r\n{\r\n	var he=document.getElementById(\'disable_html\');\r\n	if(!he.checked){\r\n	    if(tinyMCE!=undefined){\r\n	        tinyMCE.triggerSave();\r\n		}\r\n	}\r\n	if (f.subject.value == \"\") {\r\n		alert(\"发表新主题必须要有文章标题\");\r\n		f.subject.focus();\r\n		\r\n		return false;\r\n	}\r\n	\r\n	if (f.message.value.replace(/^\\s*|\\s*$/g, \"\").length == 0) {\r\n		alert(\"发表文章必须要有文章内容\");\r\n		f.message.focus();\r\n		\r\n		return false;\r\n	}\r\n\r\n\r\n	\r\n	$(\"#icon_saving\").css(\"display\", \"inline\");\r\n	$(\"#btnPreview\").attr(\"disabled\", \"disabled\");\r\n	$(\"#btnSubmit\").attr(\"disabled\", \"disabled\").val(\"保存中...\");\r\n	\r\n	return true;\r\n}\r\n\r\nfunction openFindUserWindow()\r\n{\r\n	var w = window.open(\"/suduforum/pm/findUser.page\", \"_findUser\", \"height=250,resizable=yes,width=400\");\r\n	w.focus();\r\n}\r\n\r\nfunction smiliePopup()\r\n{\r\n	var w = window.open(\"/suduforum/posts/listSmilies.page\", \"smilies\", \"width=300, height=300, toolbars=no, scrollbars=yes\");\r\n	w.focus();\r\n}\r\n\r\n-->\r\n</script>\r\n\r\n\r\n\r\n\r\n\r\n\r\n<form action=\"/suduforum/jforum.page\" method=\"post\" enctype=\"multipart/form-data\" name=\"post\" id=\"post\" onsubmit=\"return validatePostForm(this)\">\r\n<input type=\"hidden\" name=\"action\" value=\"insertSave\" />\r\n<input type=\"hidden\" name=\"module\" value=\"posts\" />\r\n<input type=\"hidden\" name=\"preview\" value=\"0\"/>\r\n<input type=\"hidden\" name=\"forum_id\" value=\"11\" />\r\n<input type=\"hidden\" name=\"start\" value=\"\" />\r\n\r\n\r\n\r\n<table cellspacing=\"0\" cellpadding=\"10\" width=\"100%\" align=\"center\" border=\"0\">\r\n	<tr>\r\n		<td class=\"bodyline\">\r\n			\r\n			<!-- Preview message -->\r\n			<a name=\"preview\"></a>\r\n			<table class=\"forumline\" width=\"100%\" cellspacing=\"1\" cellpadding=\"4\" border=\"0\" style=\"display: none\" id=\"previewTable\">\r\n				<tr>\r\n					<th height=\"25\" class=\"thhead\">预览</th>\r\n				</tr>\r\n				<tr>\r\n					<td class=\"row1\">\r\n						<img src=\"/suduforum/templates/default/images/icon_minipost.gif\" alt=\"Post\" />\r\n						<span class=\"postdetails\" id=\"previewSubject\"> 主题: </span>\r\n					</td>\r\n				</tr>\r\n				<tr>\r\n					<td class=\"row1\" height=\"100%\">\r\n						<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"height:100%\">\r\n							<tr>\r\n								<td><span id=\"previewMessage\" class=\"postbody\"></span></td>\r\n							</tr>\r\n						</table>\r\n					</td>\r\n				</tr>\r\n				<tr>\r\n					<td class=\"spacerow\" height=\"1\"><img src=\"/suduforum/templates/default/images/spacer.gif\" alt=\"\" width=\"1\" height=\"1\" /></td>\r\n				</tr>\r\n			</table>\r\n			<br clear=\"all\" />\r\n\r\n			<table cellspacing=\"2\" cellpadding=\"2\" width=\"100%\" align=\"center\" border=\"0\">\r\n				<tr>\r\n					<td align=\"left\">\r\n						<span class=\"nav\">\r\n							<a class=\"nav\" href=\"/suduforum/forums/list.page\">论坛首页</a>\r\n\r\n							&raquo; <a class=\"nav\" href=\"/suduforum/forums/show/11.page\">海阔天空</a>\r\n						</span>\r\n					</td>\r\n				</tr>\r\n			</table>\r\n		\r\n			<table class=\"forumline\" cellspacing=\"1\" cellpadding=\"3\" width=\"100%\" border=\"0\">\r\n				<tr>\r\n					<th class=\"thhead\" colspan=\"2\" height=\"25\">\r\n						<b>\r\n								发表新主题\r\n						</b>\r\n					</th>\r\n				</tr>\r\n\r\n\r\n\r\n				<tr>\r\n					<td class=\"row1\" width=\"15%\"><span class=\"gen\"><b>主题</b></span></td>\r\n					<td class=\"row2\" width=\"85%\">\r\n						<span class=\"gen\">\r\n							<input class=\"subject\" type=\"text\" tabindex=\"2\" maxlength=\"100\" name=\"subject\" value=\"\" /> \r\n						</span>\r\n					</td>\r\n				</tr>\r\n\r\n				<tr>\r\n					<!-- Smilies -->\r\n					<td class=\"row1\" valign=\"top\">\r\n						<span class=\"gen\"><b>文章内容</b></span>\r\n\r\n						<table cellspacing=\"0\" cellpadding=\"1\" border=\"0\" align=\"center\">\r\n							<tr>\r\n								<td valign=\"middle\" align=\"center\">\r\n									<br />\r\n									<table cellspacing=\"0\" cellpadding=\"5\" width=\"100\" border=\"0\">\r\n										<tr align=\"center\">\r\n											<td class=\"gensmall\" colspan=\"4\"><b>表情符号</b></td>\r\n										</tr>\r\n\r\n															<tr>\r\n														<td><a href=\"javascript:emoticon(\':)\');\"><img src=\"http://192.168.18.168:8080/suduforum//images/smilies/3b63d1616c5dfcf29f8a7a031aaa7cad.gif\" /></a></td>\r\n														<td><a href=\"javascript:emoticon(\':-)\');\"><img src=\"http://192.168.18.168:8080/suduforum//images/smilies/3b63d1616c5dfcf29f8a7a031aaa7cad.gif\"/></a></td>\r\n														<td><a href=\"javascript:emoticon(\':D\');\"><img src=\"http://192.168.18.168:8080/suduforum//images/smilies/283a16da79f3aa23fe1025c96295f04f.gif\" /></a></td>\r\n														<td><a href=\"javascript:emoticon(\':(\');\"><img src=\"http://192.168.18.168:8080/suduforum//images/smilies/9d71f0541cff0a302a0309c5079e8dee.gif\" /></a></td>\r\n															</tr>\r\n															<tr>\r\n														<td><a href=\"javascript:emoticon(\':mrgreen:\');\"><img src=\"http://192.168.18.168:8080/suduforum//images/smilies/ed515dbff23a0ee3241dcc0a601c9ed6.gif\" /></a></td>\r\n														<td><a href=\"javascript:emoticon(\':-o\');\"><img src=\"http://192.168.18.168:8080/suduforum//images/smilies/47941865eb7bbc2a777305b46cc059a2.gif\"  /></a></td>\r\n														<td><a href=\"javascript:emoticon(\':shock:\');\"><img src=\"http://192.168.18.168:8080/suduforum//images/smilies/385970365b8ed7503b4294502a458efa.gif\" /></a></td>\r\n														<td><a href=\"javascript:emoticon(\':?:\');\"><img src=\"http://192.168.18.168:8080/suduforum//images/smilies/0a4d7238daa496a758252d0a2b1a1384.gif\" /></a></td>\r\n															</tr>\r\n															<tr>\r\n														<td><a href=\"javascript:emoticon(\'8)\');\"><img src=\"http://192.168.18.168:8080/suduforum//images/smilies/b2eb59423fbf5fa39342041237025880.gif\"  /></a></td>\r\n														<td><a href=\"javascript:emoticon(\':lol:\');\"><img src=\"http://192.168.18.168:8080/suduforum//images/smilies/97ada74b88049a6d50a6ed40898a03d7.gif\" /></a></td>\r\n														<td><a href=\"javascript:emoticon(\':x\');\"><img src=\"http://192.168.18.168:8080/suduforum//images/smilies/1069449046bcd664c21db15b1dfedaee.gif\"  /></a></td>\r\n														<td><a href=\"javascript:emoticon(\':P\');\"><img src=\"http://192.168.18.168:8080/suduforum//images/smilies/69934afc394145350659cd7add244ca9.gif\" /></a></td>\r\n															</tr>\r\n															<tr>\r\n														<td><a href=\"javascript:emoticon(\':oops:\');\"><img src=\"http://192.168.18.168:8080/suduforum//images/smilies/499fd50bc713bfcdf2ab5a23c00c2d62.gif\" /></a></td>\r\n														<td><a href=\"javascript:emoticon(\':cry:\');\"><img src=\"http://192.168.18.168:8080/suduforum//images/smilies/c30b4198e0907b23b8246bdd52aa1c3c.gif\" /></a></td>\r\n														<td><a href=\"javascript:emoticon(\':evil:\');\"><img src=\"http://192.168.18.168:8080/suduforum//images/smilies/2e207fad049d4d292f60607f80f05768.gif\" /></a></td>\r\n														<td><a href=\"javascript:emoticon(\':twisted:\');\"><img src=\"http://192.168.18.168:8080/suduforum//images/smilies/908627bbe5e9f6a080977db8c365caff.gif\" /></a></td>\r\n															</tr>\r\n															<tr>\r\n														<td><a href=\"javascript:emoticon(\':roll:\');\"><img src=\"http://192.168.18.168:8080/suduforum//images/smilies/2786c5c8e1a8be796fb2f726cca5a0fe.gif\" /></a></td>\r\n														<td><a href=\"javascript:emoticon(\':wink:\');\"><img src=\"http://192.168.18.168:8080/suduforum//images/smilies/8a80c6485cd926be453217d59a84a888.gif\" /></a></td>\r\n														<td><a href=\"javascript:emoticon(\':!:\');\"><img src=\"http://192.168.18.168:8080/suduforum//images/smilies/9293feeb0183c67ea1ea8c52f0dbaf8c.gif\" /></a></td>\r\n														<td><a href=\"javascript:emoticon(\':?\');\"><img src=\"http://192.168.18.168:8080/suduforum//images/smilies/136dd33cba83140c7ce38db096d05aed.gif\" /></a></td>\r\n															</tr>\r\n\r\n										<tr align=\"center\">\r\n											<td colspan=\"4\">\r\n												<span class=\"nav\"><a href=\"#\" onclick=\"smiliePopup();return false;\">更多表情符号</a></span>\r\n											</td>\r\n										</tr>\r\n									</table>\r\n								</td>\r\n							</tr>\r\n						</table>\r\n					</td>\r\n\r\n					<!-- BB Codes, textarea -->\r\n					<td class=\"row2\" valign=\"top\">\r\n						<div class=\"gen\">\r\n							<table cellspacing=\"0\" cellpadding=\"2\" border=\"0\" width=\"100%\">\r\n                                <tbody id=\"bbcode_content\"> \r\n                                <!-- bb code -->\r\n								<tr valign=\"middle\">\r\n									<td>\r\n										<input class=\"button\" onmouseover=\"helpline(\'b\')\" style=\"FONT-WEIGHT: bold; WIDTH: 30px\" accesskey=\"b\" onclick=\"bbstyle(0)\" type=\"button\" value=\" B \" name=\"addbbcode0\" /> \r\n										<input class=\"button\" onmouseover=\"helpline(\'i\')\" style=\"WIDTH: 30px; FONT-STYLE: italic\" accesskey=\"i\" onclick=\"bbstyle(2)\" type=\"button\" value=\" i \" name=\"addbbcode2\" /> \r\n										<input class=\"button\" onmouseover=\"helpline(\'u\')\" style=\"WIDTH: 30px; TEXT-DECORATION: underline\" accesskey=\"u\" onclick=\"bbstyle(4)\" type=\"button\" value=\" u \" name=\"addbbcode4\" />\r\n										<input class=\"button\" onmouseover=\"helpline(\'q\')\" style=\"WIDTH: 50px\" accesskey=\"q\" onclick=\"bbstyle(6)\" type=\"button\" value=\"Quote\" name=\"addbbcode6\" /> \r\n										<input class=\"button\" onmouseover=\"helpline(\'c\')\" style=\"WIDTH: 40px\" accesskey=\"c\" onclick=\"bbstyle(8)\" type=\"button\" value=\"Code\" name=\"addbbcode8\" />\r\n										<input class=\"button\" onmouseover=\"helpline(\'l\')\" style=\"WIDTH: 40px\" accesskey=\"l\" onclick=\"bbstyle(10)\" type=\"button\" value=\"List\" name=\"addbbcode10\" />\r\n										<input class=\"button\" onmouseover=\"helpline(\'p\')\" style=\"WIDTH: 40px\" accesskey=\"p\" onclick=\"bbstyle(12)\" type=\"button\" value=\"Img\" name=\"addbbcode12\" />\r\n										<input class=\"button\" onmouseover=\"helpline(\'w\')\" style=\"WIDTH: 40px\" accesskey=\"w\" onclick=\"bbstyle(14)\" type=\"button\" value=\"URL\" name=\"addbbcode14\" />\r\n										<input class=\"button\" onmouseover=\"helpline(\'g\')\" style=\"WIDTH: 50px\" accesskey=\"g\" onclick=\"bbstyle(16)\" type=\"button\" value=\"Google\" name=\"addbbcode16\" />\r\n										<input class=\"button\" onmouseover=\"helpline(\'y\')\" style=\"WIDTH: 60px\" accesskey=\"y\" onclick=\"bbstyle(18)\" type=\"button\" value=\"Youtube\" name=\"addbbcode18\" />\r\n										<input class=\"button\" onmouseover=\"helpline(\'k\')\" style=\"WIDTH: 40px\" accesskey=\"k\" onclick=\"bbstyle(20)\" type=\"button\" value=\"Flash\" name=\"addbbcode20\" />\r\n                                        <input class=\"button\" onmouseover=\"helpline(\'v\')\" style=\"WIDTH: 40px\" accesskey=\"v\" onclick=\"bbstyle(22)\" type=\"button\" value=\"WMV\" name=\"addbbcode22\" />\r\n                                         \r\n                                        <div>\r\n\r\n<!-- for heightlight codes (by pinke @ trydone )-->\r\n<script type=\"text/javascript\">\r\nvar appendStr=function(b){\r\n   var text= \"[code=\"+b.value+\"][/code]\";//text;\r\n     var he=document.getElementById(\'disable_html\');\r\n   if(!he.checked){\r\n	  if(tinyMCE!=undefined){\r\n		  if(tinyMCE.execCommand)\r\n		  { tinyMCE.execCommand(\'mceFocus\');\r\n		     tinyMCE.execCommand(\'mceInsertContent\',true,text);\r\n		  }\r\n	  }\r\n     return ;\r\n  }\r\n\r\n    var txtarea=document.forms[\'post\'].elements[\'message\'];//.value+=\"[code=\"+b.value+\"][/code]\";\r\n    if (txtarea.createTextRange && txtarea.caretPos) {\r\n        var caretPos = txtarea.caretPos;\r\n\r\n        caretPos.text = caretPos.text.charAt(caretPos.text.length - 1) == \' \' ? \"[code=\"+b.value+\"]\"+caretPos.text + \"[/code]\"  + \' \' : \"[code=\"+b.value+\"]\"+caretPos.text + \"[/code]\";\r\n\r\n        txtarea.focus();\r\n    } else if (txtarea.selectionStart || txtarea.selectionStart == \'0\') {\r\n        var startPos = txtarea.selectionStart;\r\n        var endPos = txtarea.selectionEnd;\r\n        txtarea.value = txtarea.value.substring(0, startPos)\r\n                      + \"[code=\"+b.value+\"]\"+txtarea.value.substring(startPos,endPos)+\"[/code]\"\r\n                      + txtarea.value.substring(endPos, txtarea.value.length);\r\n        txtarea.focus();\r\n        txtarea.selectionStart = startPos + text.length;\r\n        txtarea.selectionEnd = startPos + text.length;\r\n    } else {\r\n        txtarea.value  += \"[code=\"+b.value+\"][/code]\";//text;\r\n        txtarea.focus();\r\n    }\r\n}\r\n</script>\r\n<script type=\"text/javascript\">\r\n	var str=\'<span class=\"genmed\"><input onmouseover=\"helpline(\\\'c\\\')\" class=\"button\" type=\"button\" value=\"_langName_\" name=\"btn_code__langName_\" onclick=\"appendStr(this)\"/> \';\r\n//    var langs=\"CSharp,Php,JScript,Java,Vb,Sql,Xml,Delphi,Python,Ruby,Css,Cpp,html\".split(\",\"); //too many\r\n    var langs=\"java,html,xml,csharp,php,jscript,vb,sql,ruby,css,cpp\".split(\",\");\r\n	for(i in langs){document.write(str.replace(/_langName_/g,langs[i]));}\r\n</script>\r\n<!-- for heightlight codes end -->\r\n                                        </div>\r\n                                    </td>\r\n								</tr>\r\n								\r\n								<!-- Color, Fonts -->\r\n								<tr>\r\n									<td>\r\n										<span class=\"genmed\">&nbsp;字型颜色: \r\n										<select onmouseover=\"helpline(\'s\')\" onchange=\"bbfontstyle(\'[color=\' + this.form.addbbcode24.options[this.form.addbbcode24.selectedIndex].value + \']\', \'[/color]\')\" name=\"addbbcode24\"> \r\n											<option class=\"genmed\" style=\"COLOR: black; BACKGROUND-COLOR: #fafafa\" value=\"#444444\" selected=\"selected\">默认值</option> \r\n											<option class=\"genmed\" style=\"COLOR: darkred; BACKGROUND-COLOR: #fafafa\" value=\"darkred\">深红色</option> \r\n											<option class=\"genmed\" style=\"COLOR: red; BACKGROUND-COLOR: #fafafa\" value=\"red\">红色</option> \r\n											<option class=\"genmed\" style=\"COLOR: orange; BACKGROUND-COLOR: #fafafa\" value=\"orange\">橙色</option> \r\n											<option class=\"genmed\" style=\"COLOR: brown; BACKGROUND-COLOR: #fafafa\" value=\"brown\">棕色</option> \r\n											<option class=\"genmed\" style=\"COLOR: yellow; BACKGROUND-COLOR: #fafafa\" value=\"yellow\">黄色</option> \r\n											<option class=\"genmed\" style=\"COLOR: green; BACKGROUND-COLOR: #fafafa\" value=\"green\">绿色</option> \r\n											<option class=\"genmed\" style=\"COLOR: olive; BACKGROUND-COLOR: #fafafa\" value=\"olive\">橄榄色</option> \r\n											<option class=\"genmed\" style=\"COLOR: cyan; BACKGROUND-COLOR: #fafafa\" value=\"cyan\">青绿色</option> \r\n											<option class=\"genmed\" style=\"COLOR: blue; BACKGROUND-COLOR: #fafafa\" value=\"blue\">蓝色</option> \r\n											<option class=\"genmed\" style=\"COLOR: darkblue; BACKGROUND-COLOR: #fafafa\" value=\"darkblue\">深蓝色</option> \r\n											<option class=\"genmed\" style=\"COLOR: violet; BACKGROUND-COLOR: #fafafa\" value=\"violet\">紫色</option> \r\n											<option class=\"genmed\" style=\"COLOR: white; BACKGROUND-COLOR: #fafafa\" value=\"white\">白色</option>\r\n\r\n\r\n	','2009-06-09 22:45:22',2,22,11,1),(8,3,'a','1， 地址栏的logo是tomcat的图标，没有改成自己的。','2009-06-09 23:12:11',2,9,7,5),(9,3,'a','2，下拉列表时的标题和发帖人的字体、颜色没有区别开来。','2009-06-09 23:14:02',2,10,7,5);
/*!40000 ALTER TABLE `jforum_moderation_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_posts`
--

DROP TABLE IF EXISTS `jforum_posts`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jforum_posts` (
  `post_id` int(11) NOT NULL auto_increment,
  `topic_id` int(11) NOT NULL default '0',
  `forum_id` int(11) NOT NULL default '0',
  `user_id` int(11) NOT NULL default '0',
  `post_time` datetime default NULL,
  `poster_ip` varchar(15) default NULL,
  `enable_bbcode` tinyint(1) NOT NULL default '1',
  `enable_html` tinyint(1) NOT NULL default '1',
  `enable_smilies` tinyint(1) NOT NULL default '1',
  `enable_sig` tinyint(1) NOT NULL default '1',
  `post_edit_time` datetime default NULL,
  `post_edit_count` int(11) NOT NULL default '0',
  `status` tinyint(1) default '1',
  `attach` tinyint(1) default '0',
  `need_moderate` tinyint(1) default '0',
  PRIMARY KEY  (`post_id`),
  KEY `user_id` (`user_id`),
  KEY `topic_id` (`topic_id`),
  KEY `forum_id` (`forum_id`),
  KEY `post_time` (`post_time`),
  KEY `need_moderate` (`need_moderate`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_posts`
--

LOCK TABLES `jforum_posts` WRITE;
/*!40000 ALTER TABLE `jforum_posts` DISABLE KEYS */;
INSERT INTO `jforum_posts` VALUES (1,1,1,2,'2005-01-04 16:59:54','127.0.0.1',1,0,1,1,'2009-06-09 21:35:20',6,1,0,0),(2,2,11,2,'2009-06-09 20:46:24','127.0.0.1',1,0,1,1,'2009-06-09 20:46:24',0,1,0,0),(3,3,10,2,'2009-06-09 20:47:55','127.0.0.1',1,0,1,1,'2009-06-09 20:47:55',0,1,0,0),(4,4,10,2,'2009-06-09 20:48:10','127.0.0.1',1,0,1,1,'2009-06-09 20:48:10',0,1,0,0),(5,4,10,3,'2009-06-09 20:49:34','127.0.0.1',1,0,1,1,'2009-06-09 20:49:34',0,1,0,0),(6,4,10,3,'2009-06-09 20:50:12','127.0.0.1',1,0,1,1,'2009-06-09 20:50:12',0,1,0,0),(7,5,11,1,'2009-06-09 20:57:32','127.0.0.1',1,1,1,0,'2009-06-09 20:57:32',0,1,0,0),(8,6,11,3,'2009-06-09 21:05:45','127.0.0.1',1,0,1,1,'2009-06-09 21:05:45',0,1,0,0),(9,7,10,5,'2009-06-09 21:06:10','192.168.18.104',1,0,1,1,'2009-06-09 23:12:11',1,1,0,0),(10,7,10,5,'2009-06-09 21:07:25','192.168.18.104',1,0,1,1,'2009-06-09 23:14:02',1,1,0,0),(11,7,10,5,'2009-06-09 21:07:53','192.168.18.104',1,0,1,1,'2009-06-09 21:07:53',0,1,0,0),(12,8,11,3,'2009-06-09 21:08:39','127.0.0.1',1,0,1,1,'2009-06-09 21:08:39',0,1,0,0),(13,7,10,5,'2009-06-09 21:09:33','192.168.18.104',1,0,1,1,'2009-06-09 21:09:33',0,1,0,0),(14,7,10,5,'2009-06-09 21:14:23','192.168.18.104',1,0,1,1,'2009-06-09 21:14:23',0,1,0,0),(15,2,11,3,'2009-06-09 21:38:56','127.0.0.1',1,0,1,1,'2009-06-09 21:49:22',1,1,0,0),(17,2,11,3,'2009-06-09 21:49:31','127.0.0.1',1,0,1,1,'2009-06-09 21:49:31',0,1,0,0),(18,2,11,3,'2009-06-09 21:49:49','127.0.0.1',1,0,1,1,'2009-06-09 21:49:49',0,1,0,0),(19,2,11,1,'2009-06-09 22:20:07','127.0.0.1',1,0,1,0,'2009-06-09 22:20:07',0,1,0,0),(21,10,11,1,'2009-06-09 22:34:15','127.0.0.1',1,0,1,0,'2009-06-09 22:34:15',0,1,0,0),(22,11,11,1,'2009-06-09 22:44:09','127.0.0.1',1,0,1,0,'2009-06-09 22:45:22',1,1,0,0),(23,11,11,3,'2009-06-09 22:46:01','127.0.0.1',1,1,1,1,'2009-06-09 22:46:01',0,1,0,0),(24,11,11,3,'2009-06-09 22:46:36','127.0.0.1',1,0,1,1,'2009-06-09 22:46:36',0,1,0,0),(25,12,11,3,'2009-06-09 22:56:34','127.0.0.1',1,0,1,1,'2009-06-09 22:56:48',1,1,0,0),(26,13,11,3,'2009-06-09 22:57:25','127.0.0.1',1,0,1,1,'2009-06-09 22:57:25',0,1,0,0),(27,13,11,3,'2009-06-09 22:58:07','127.0.0.1',1,0,1,1,'2009-06-09 22:58:07',0,1,0,0),(28,12,11,6,'2009-06-09 22:59:21','127.0.0.1',1,0,1,1,'2009-06-09 22:59:21',0,1,0,0),(29,14,1,1,'2009-06-09 23:03:15','127.0.0.1',1,0,1,0,'2009-06-09 23:00:57',0,1,0,0),(30,15,1,6,'2009-06-09 23:03:14','127.0.0.1',1,0,1,1,'2009-06-09 23:01:29',0,1,0,0),(32,17,1,3,'2009-06-09 23:02:40','127.0.0.1',1,0,1,1,'2009-06-09 23:02:40',0,1,0,0),(33,18,1,3,'2009-06-09 23:05:35','127.0.0.1',1,0,1,1,'2009-06-09 23:05:35',0,1,0,0),(34,19,11,3,'2009-06-09 23:08:27','127.0.0.1',1,0,1,1,'2009-06-09 23:08:27',0,1,0,0),(35,7,10,3,'2009-06-09 23:15:01','127.0.0.1',1,0,1,1,'2009-06-09 23:15:01',0,1,0,0),(36,7,10,1,'2009-06-09 23:15:17','127.0.0.1',1,0,1,0,'2009-06-09 23:15:17',0,1,0,0),(37,7,10,6,'2009-06-09 23:15:32','127.0.0.1',1,0,1,1,'2009-06-09 23:15:32',0,1,0,0),(38,20,10,6,'2009-06-09 23:17:03','127.0.0.1',1,0,1,1,'2009-06-09 23:17:03',0,1,0,0);
/*!40000 ALTER TABLE `jforum_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_posts_text`
--

DROP TABLE IF EXISTS `jforum_posts_text`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jforum_posts_text` (
  `post_id` int(11) NOT NULL,
  `post_text` text,
  `post_subject` varchar(100) default NULL,
  PRIMARY KEY  (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_posts_text`
--

LOCK TABLES `jforum_posts_text` WRITE;
/*!40000 ALTER TABLE `jforum_posts_text` DISABLE KEYS */;
INSERT INTO `jforum_posts_text` VALUES (1,'什么是快速阅读\r\n什么是快速阅读呢？快速阅读是从文字读物中迅速提取有用信息的高效读书方法。充分开发快速阅读者扩大视觉感知能力和左右脑协调处理视觉信息的巨大潜 能，以眼脑直映的信息全新处理方式取代传统阅读中大脑的视觉中枢，语言中枢，听觉中枢对文字信息处理的环节从而达到眼看脑记，眼脑同步的快速阅读法。\r\n经过训练的普通人可以在一分钟内快速阅读分辨12万个字母，可以说快速阅读训练是传统阅读的一种补充，一种飞跃，一种革命。\r\n','什么是快速阅读'),(2,'大事','托尔斯泰'),(3,'对方卅分','test1'),(4,'碟阀','test2'),(5,'没事不要乱发贴   :oops:','回复:test2'),(6,'谁家的野猫 头好大','test2'),(7,'测试','游客发帖置顶'),(8,'没事测测看','调查'),(9,'1， 地址栏的logo是tomcat的图标，没有改成自己的。\r\n\r\n[color=red]江南传道士：记在美工的帐上了[/color]','缺点与不足'),(10,'2，下拉列表时的标题和发帖人的字体、颜色没有区别开来。\r\n\r\n[color=red]江南传道士：哪个下拉列表？[/color]','缺点与不足'),(11,'[quote=han]1， 地址栏的logo是tomcat的图标，没有改成自己的。[/quote]\r\ntest','缺点与不足'),(12,'你信仰什么','信什么'),(13,'3，首页的 “版面”所占比例太宽。','缺点与不足'),(14,'4，预览的时候图片无法预览。','缺点与不足'),(15,'delete','托尔斯泰'),(17,'test','托尔斯泰'),(18,'也是四个','托尔斯泰'),(19,'<html>\r\n<head>\r\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\r\n<meta http-equiv=\"Pragma\" content=\"no-cache\" />\r\n<meta http-equiv=\"Expires\" content=\"-1\" />\r\n<title>托尔斯泰</title>\r\n<style type=\"text/css\">@import url( /suduforum/templates/default/styles/style.css?1244557154906 );</style>\r\n<style type=\"text/css\">@import url( /suduforum/templates/default/styles/zh_CN.css?1244557154906 );</style>\r\n<style type=\"text/css\">\r\nbody{margin:1px;padding:0;}\r\n#topline{height:21px;cursor:pointer;text-align:right;margin:0px 4px 0px 0;}\r\n#topline ul{margin:0;padding:0;list-style-type:none;height:20px;}\r\n#topline li{margin:0 ;padding:3px 0  0 0;line-height:18px;width:60px;text-align:center;float:right;font-size:12px;background-image:url(/suduforum/templates/default/images/cellpic1.gif);}\r\n#toploginform{margin-top:0px;margin-bottom:0px;font-size:12px;}\r\n#toploginform input[type=\"text\"] {margin-top:0px;border-bottom:1px solid #000000; border-right:0;border-left:0;border-top:0;width:60px;}\r\n.input_text{margin-top:0px;border:1px solid #CCCCCC;width:60px;}\r\n.input_text2{margin-top:0px;border-bottom:1px solid #000000; border-right:0;border-left:0;border-top:0;width:60px;}\r\n#toploginform button{margin:0px;padding:1px 0 0 0;border:1px solid #CCCCCC; background-color:#FFFFFF;height:18px;}\r\n.infoMacro {list-style-type:decimal;font-size:12px;BORDER-RIGHT: #3c78b5 1px solid; BORDER-TOP: #3c78b5 1px solid; BORDER-LEFT: #3c78b5 1px solid; BORDER-BOTTOM: #3c78b5 1px solid; BACKGROUND-COLOR: #FFFFFF;}\r\n.olstyle{margin-top:5px;margin-bottom:5px;}\r\n.olstyle li{margin:3px;}\r\n</style>\r\n<!-- #include \"lightbox.htm\"/ -->\r\n<script type=\"text/javascript\" src=\"/suduforum/templates/default/js/popupmenu.js\"> </script>\r\n<script type=\"text/javascript\">\r\n    window.onload=function(){\r\n  var langPopup = new PopupMenu();\r\n  langPopup.add(\'<img src=\"/suduforum/templates/default/images/pt_BR/lang.gif\" border=\"0\" alt=\"lang\"> 葡萄牙文(巴西)\', function(target) {\r\n   document.forms[\'frm_changlang\'].elements[\'lang\'].value = \"pt_BR\";document.forms[\'frm_changlang\'].submit();\r\n   });\r\n  langPopup.add(\'<img src=\"/suduforum/templates/default/images/pt_PT/lang.gif\" border=\"0\" alt=\"lang\"> 葡萄牙文(葡萄牙)\', function(target) {\r\n   document.forms[\'frm_changlang\'].elements[\'lang\'].value = \"pt_PT\";document.forms[\'frm_changlang\'].submit();\r\n   });\r\n  langPopup.add(\'<img src=\"/suduforum/templates/default/images/zh_CN/lang.gif\" border=\"0\" alt=\"lang\"> 简体中文\', function(target) {\r\n   });\r\n  langPopup.add(\'<img src=\"/suduforum/templates/default/images/it_IT/lang.gif\" border=\"0\" alt=\"lang\"> 意大利\', function(target) {\r\n   document.forms[\'frm_changlang\'].elements[\'lang\'].value = \"it_IT\";document.forms[\'frm_changlang\'].submit();\r\n   });\r\n  langPopup.add(\'<img src=\"/suduforum/templates/default/images/hu_HU/lang.gif\" border=\"0\" alt=\"lang\"> 匈牙利文\', function(target) {\r\n   document.forms[\'frm_changlang\'].elements[\'lang\'].value = \"hu_HU\";document.forms[\'frm_changlang\'].submit();\r\n   });\r\n  langPopup.add(\'<img src=\"/suduforum/templates/default/images/zh_TW/lang.gif\" border=\"0\" alt=\"lang\"> 繁体中文\', function(target) {\r\n   document.forms[\'frm_changlang\'].elements[\'lang\'].value = \"zh_TW\";document.forms[\'frm_changlang\'].submit();\r\n   });\r\n  langPopup.add(\'<img src=\"/suduforum/templates/default/images/nb_NO/lang.gif\" border=\"0\" alt=\"lang\"> 挪威文\', function(target) {\r\n   document.forms[\'frm_changlang\'].elements[\'lang\'].value = \"nb_NO\";document.forms[\'frm_changlang\'].submit();\r\n   });\r\n  langPopup.add(\'<img src=\"/suduforum/templates/default/images/de_DE/lang.gif\" border=\"0\" alt=\"lang\"> 德文\', function(target) {\r\n   document.forms[\'frm_changlang\'].elements[\'lang\'].value = \"de_DE\";document.forms[\'frm_changlang\'].submit();\r\n   });\r\n  langPopup.add(\'<img src=\"/suduforum/templates/default/images/en_US/lang.gif\" border=\"0\" alt=\"lang\"> 英文 (美国)\', function(target) {\r\n   document.forms[\'frm_changlang\'].elements[\'lang\'].value = \"en_US\";document.forms[\'frm_changlang\'].submit();\r\n   });\r\n  langPopup.setSize(200, 0);\r\n  langPopup.bind(\'langDispArea\',true); // target is this pre block\r\n    }\r\n</script>\r\n</head>\r\n<body class=\"zh_CN\">\r\n<!--\r\nOriginal theme from phpBB (http://www.phpbb.com) subSilver\r\nCreated by subBlue design\r\nhttp://www.subBlue.com\r\n\r\nModifications by JForum Team & www.trydone.com\r\n-->\r\n<div style=\"padding:12px 1px 1px 1px;margin:0 4px;background-image:url(/suduforum/templates/default/topbg.gif);\">\r\n<div style=\"width:100%;height:85px;overflow:auto;text-align:left;clear:both;top:0;margin-bottom:0px;background-color:#FFFFFF;\">\r\n<span id=\"topleftlogo\" style=\"width:200px;clear:none;float:left;\"><a href=\"http://192.168.18.168:8080/sudusoft\"><img src=\"/suduforum/templates/default/images/logo.jpg\"  vspace=\"1\" border=\"0\" alt=\"[Logo]\" /></a></span>\r\n<div id=\"topright\" style=\"width:450px;float:right;text-align:right;clear:none;margin:8px 8px 8px 0px;\">\r\n <span id=\"topforumtitle\" class=\"maintitle\">全脑速读训练论坛</span>\r\n<br/>\r\n<img src=\"/suduforum/templates/default/images/icon_mini_search.gif\" alt=\"[Search]\"/>\r\n<a id=\"search\" rel=\"lightbox\"  class=\"mainmenu\" href=\"/suduforum/search/filters.page\"><b>搜索</b></a>\r\n<img src=\"/suduforum/templates/default/images/icon_mini_members.gif\" alt=\"[Members]\" />\r\n<a id=\"latest2\" class=\"mainmenu\" href=\"/suduforum/user/list.page\">会员列表</a>\r\n<img src=\"/suduforum/templates/default/images/icon_mini_groups.gif\" alt=\"[Groups]\" />&nbsp;<a id=\"backtosite\" class=\"mainmenu\" href=\"http://192.168.18.168:8080/sudusoft\">返回首页</a>\r\n<br>\r\n<img src=\"/suduforum/templates/default/images/icon_mini_recentTopics.gif\" alt=\"[Hottest Topics]\" />\r\n<a id=\"hottest\" class=\"mainmenu\" href=\"/suduforum/hottestTopics/list.page\">热门主题</a>\r\n<img src=\"/suduforum/templates/default/images/icon_mini_recentTopics.gif\" alt=\"[Recent Topics]\" />\r\n<a id=\"latest\" class=\"mainmenu\" href=\"/suduforum/recentTopics/list.page\">最新主题</a>\r\n<img src=\"/suduforum/templates/default/images/icon_mini_members.gif\" alt=\"[Moderation Log]\" />\r\n<a id=\"moderationlog\" class=\"mainmenu\" href=\"/suduforum/moderation/showActivityLog.page\">管理日志</a>\r\n</div>\r\n</div>\r\n<div style=\"clear:both;text-align:left;padding:1px;background-color:#FFFFFF;margin:3px 0 0 0;height:23px;overflow:hidden;\">\r\n<form action=\"\" method=\"post\" name=\"frm_changlang\" style=\"display:none;\"><input type=\"hidden\" name=\"lang\" value=\"zh_CN\"/></form>\r\n<span id=\"top_userinfo\" style=\"float:left;\"><img id=\"langDispArea\" style=\"margin:5px;clear:none;float:left;clear:none;cursor:pointer;\" src=\"/suduforum/templates/default/images/zh_CN/lang.gif\" border=\"0\" alt=\"简体中文\">\r\n</span>\r\n<form action=\"/suduforum/jforum.page\" style=\"float:left;clear:none;margin-left:0;padding-left:0;\" method=\"post\" name=\"toploginform\" id=\"toploginform\" accept-charset=\"UTF-8\">\r\n<input type=\"hidden\" name=\"module\" value=\"user\" />\r\n<input type=\"hidden\" name=\"returnPath\" value=\"/suduforum/forums/list.page\" />\r\n<input type=\"hidden\" name=\"action\" value=\"validateLogin\" />\r\n会员名称:<input class=\"input_text\" maxlength=\"40\" size=\"25\" name=\"username\" />\r\n登入密码:<input class=\"input_text\" type=\"password\" maxlength=\"25\" size=\"25\" name=\"password\" />\r\n<label for=\"topautologin\">自动登入: </label><input type=\"checkbox\" id=\"topautologin\" name=\"autologin\" />\r\n<button type=\"submit\"> 登入 </button>\r\n<!--<a id=\"login\"  rel=\"lightbox\"  class=\"mainmenu\" href=\"/suduforum/user/login.page\"><img src=\"/suduforum/templates/default/images/icon_mini_login.gif\" border=\"0\" alt=\"[Login]\" /> 登入</a>-->\r\n<a id=\"register\"  rel=\"lightbox\"  class=\"mainmenu\" href=\"/suduforum/user/insert.page\"><img src=\"/suduforum/templates/default/images/icon_mini_register.gif\" border=\"0\" alt=\"[Register]\" /> 注册</a>\r\n<a href=\"/suduforum/user/lostPassword.page\">忘记密码</a>\r\n<a href=\"/suduforum/user/activateManual.page\">启用我的帐号</a>\r\n</form>\r\n<script type=\"text/javascript\">\r\nif(self.location.href.indexOf(\"/suduforum/user/login.page\")==-1&&self.location.href.indexOf(\"/suduforum/jforum.page\")==-1){\r\ndocument.forms[\"toploginform\"].elements[\"returnPath\"].value=self.location.href;\r\n}\r\n</script>\r\n  <br clear=\"all\"/>\r\n</div>\r\n</div>\r\n<table width=\"100%\" border=\"0\" id=\"maintable\">\r\n<tr>\r\n  <td>\r\n<script type=\"text/javascript\" src=\"/suduforum/templates/default/js/jquery.js?1244557154906\"></script>\r\n<script type=\"text/javascript\" src=\"/suduforum/templates/default/js/jquery.jeditable.pack.js?1244557154906\"></script>\r\n<script type=\"text/javascript\" src=\"/suduforum/templates/default/js/post_show.js?1244557154906\"></script>\r\n<script type=\"text/javascript\" src=\"/suduforum/templates/default/js/post.js?1244557154906\"></script>\r\n<script type=\"text/javascript\" src=\"/suduforum/templates/default/js/pagination.js?1244557154906\"></script>\r\n\r\n\r\n<script type=\"text/javascript\">\r\n<!--\r\n	function karmaVote(s, postId) {\r\n		if (s.selectedIndex == 0) {\r\n			return;\r\n		}\r\n\r\n		if (confirm(\"确认您的选择？\")) {\r\n			document.location = \"/suduforum/karma/insert/0/\" + postId + \"/\" + s.value + \".page\";\r\n		}\r\n		else {\r\n			s.selectedIndex = 0;\r\n		}\r\n	}\r\n\r\n	function karmaPointsCombo(postId)\r\n	{\r\n		document.write(\'<select name=\"karma\" onchange=\"karmaVote(this,\' + postId + \')\">\');\r\n		document.write(\'<option value=\"\">评分</option>\');\r\n\r\n		for (var i = 1; i <= 5; i++) {\r\n			document.write(\'<option value=\"\' + i + \'\">\' + i + \'</option>\');\r\n		}\r\n\r\n		document.write(\'</select>\');\r\n	}\r\nfunction showEmail(beforeAt, afterAt)\r\n{\r\n	return beforeAt + \"@\" + afterAt;\r\n}\r\n\r\nvar starOn = new Image();\r\nstarOn.src = \"/suduforum/templates/default/images/star_on.gif\";\r\n\r\nvar starOff = new Image();\r\nstarOff.src = \"/suduforum/templates/default/images/star_off.gif\";\r\n\r\nfunction writeStars(q, postId)\r\n{\r\n	for (var i = 0; i < 5; i++) {\r\n		var name = \"star\" + postId + \"_\" + i;\r\n		document.write(\"<img name=\'\" + name + \"\' alt=\'*\' />\");\r\n		document.images[name].src = q > i ? starOn.src : starOff.src;\r\n	}\r\n}\r\n\r\nfunction addBookmark(relationType, relationId)\r\n{\r\n	var w = window.open(\'/suduforum/bookmarks/insert/\' + relationType + \'/\' + relationId + \'.page\', \'bookmark_add\', \'width=700, height=200, scrollbars=auto, resizable=true\');\r\n	w.focus();\r\n}\r\n\r\n\r\n-->\r\n</script>\r\n\r\n\r\n<table cellspacing=\"0\" cellpadding=\"10\" width=\"100%\" align=\"center\" border=\"0\">\r\n	<tr>\r\n		<td class=\"bodyline\">\r\n			<table cellspacing=\"2\" cellpadding=\"2\" width=\"100%\" border=\"0\">\r\n				<tr>\r\n					<td valign=\"middle\" align=\"left\" colspan=\"2\">\r\n						<span class=\"maintitle\"><a href=\"/suduforum/posts/list/2.page\" name=\"top\" class=\"fmaintitle\" id=\"top\">托尔斯泰</a></span>\r\n						&nbsp;<a href=\"/suduforum/rss/topicPosts/2.page\"><img src=\"/suduforum/templates/default/images/xml_button.gif\" border=\"0\" alt=\"XML\" /></a>\r\n					</td>\r\n				</tr>\r\n			</table>\r\n			\r\n			<table cellspacing=\"2\" cellpadding=\"2\" width=\"100%\" border=\"0\">\r\n				<tr>\r\n						<td valign=\"middle\" align=\"left\" width=\"50\">\r\n							<a href=\"/suduforum/jforum.page?module=posts&amp;action=insert&amp;forum_id=11\" rel=\"nofollow\" class=\"icon_new_topic\"><img src=\"/suduforum/images/transp.gif\" alt=\"\" /></a>\r\n						</td>\r\n					<td width=\"8%\" align=\"left\" valign=\"bottom\" nowrap=\"nowrap\">\r\n								<a href=\"/suduforum/posts/reply/0/2.page\" rel=\"nofollow\" class=\"icon_reply nav\"><img src=\"/suduforum/images/transp.gif\" alt=\"\" /></a>\r\n					</td>\r\n\r\n					<td valign=\"middle\" align=\"left\" colspan=\"0\">\r\n						<span class=\"nav\">\r\n						<a class=\"nav\" href=\"/suduforum/forums/list.page\">论坛首页 </a>\r\n&raquo;<a class=cattitle href=/suduforum/forums/categories/3.page>自由讨论</a>&raquo; <a class=nav href=/suduforum/forums/show/11.page>海阔天空</a>\r\n</span>\r\n					</td>\r\n					<td valign=\"middle\" align=\"right\"></td>\r\n				</tr>\r\n			</table>\r\n\r\n			<table class=\"forumline\" cellspacing=\"1\" cellpadding=\"3\" width=\"100%\" border=\"0\">\r\n				\r\n				<tr>\r\n					<th class=\"thleft\" nowrap=\"nowrap\" width=\"150\" height=\"26\">发表人</th>\r\n					<th class=\"thright\" nowrap=\"nowrap\" width=\"100%\">内容</th>\r\n				</tr>\r\n\r\n				<!-- POST LISTING --> \r\n	\r\n					<tr>\r\n						<td colspan=\"2\">\r\n<div class=\"postinfo\">\r\n	<div class=\"date','托尔斯泰'),(21,'fadfafadf','fadfa'),(22,'默认html去掉','fadfa'),(23,'<p>&lt;strong&gt;这样是不是更容易&lt;/strong&gt;</p><p>&lt;strong&gt;&lt;em&gt;下一月&lt;/em&gt;&lt;/strong&gt;</p>','回复:fadfa'),(24,'[b]有问题的[/b]','回复:fadfa'),(25,'捡到手机一部','公告注意'),(26,'在公告下？','置顶的'),(27,'果然好用','回复:置顶的'),(28,'注册用过 到公告中的回复','回复:公告注意'),(29,'怎么审核？','游客发的贴'),(30,'要审核通过','注册用户发的贴'),(32,'也要审核？','管理员发贴'),(33,'能刷新出来吗？','发了新贴'),(34,'投票能置顶？','投票能置顶'),(35,'快速回复测试1','缺点与不足'),(36,'快速回复测试2','缺点与不足'),(37,'快速回复测试3','缺点与不足'),(38,'看的到吗？ :)    我这里能看到的','头像预览');
/*!40000 ALTER TABLE `jforum_posts_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_privmsgs`
--

DROP TABLE IF EXISTS `jforum_privmsgs`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jforum_privmsgs` (
  `privmsgs_id` int(11) NOT NULL auto_increment,
  `privmsgs_type` tinyint(4) NOT NULL default '0',
  `privmsgs_subject` varchar(255) NOT NULL default '',
  `privmsgs_from_userid` int(11) NOT NULL default '0',
  `privmsgs_to_userid` int(11) NOT NULL default '0',
  `privmsgs_date` datetime default NULL,
  `privmsgs_ip` varchar(15) NOT NULL default '',
  `privmsgs_enable_bbcode` tinyint(1) NOT NULL default '1',
  `privmsgs_enable_html` tinyint(1) NOT NULL default '0',
  `privmsgs_enable_smilies` tinyint(1) NOT NULL default '1',
  `privmsgs_attach_sig` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`privmsgs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_privmsgs`
--

LOCK TABLES `jforum_privmsgs` WRITE;
/*!40000 ALTER TABLE `jforum_privmsgs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_privmsgs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_privmsgs_text`
--

DROP TABLE IF EXISTS `jforum_privmsgs_text`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jforum_privmsgs_text` (
  `privmsgs_id` int(11) NOT NULL,
  `privmsgs_text` text,
  PRIMARY KEY  (`privmsgs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_privmsgs_text`
--

LOCK TABLES `jforum_privmsgs_text` WRITE;
/*!40000 ALTER TABLE `jforum_privmsgs_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_privmsgs_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_quota_limit`
--

DROP TABLE IF EXISTS `jforum_quota_limit`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jforum_quota_limit` (
  `quota_limit_id` int(11) NOT NULL auto_increment,
  `quota_desc` varchar(50) NOT NULL,
  `quota_limit` int(11) NOT NULL,
  `quota_type` tinyint(1) default '1',
  PRIMARY KEY  (`quota_limit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_quota_limit`
--

LOCK TABLES `jforum_quota_limit` WRITE;
/*!40000 ALTER TABLE `jforum_quota_limit` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_quota_limit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_ranks`
--

DROP TABLE IF EXISTS `jforum_ranks`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jforum_ranks` (
  `rank_id` int(11) NOT NULL auto_increment,
  `rank_title` varchar(50) NOT NULL default '',
  `rank_min` int(11) NOT NULL default '0',
  `rank_special` tinyint(1) default NULL,
  `rank_image` varchar(255) default NULL,
  PRIMARY KEY  (`rank_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_ranks`
--

LOCK TABLES `jforum_ranks` WRITE;
/*!40000 ALTER TABLE `jforum_ranks` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_ranks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_role_values`
--

DROP TABLE IF EXISTS `jforum_role_values`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jforum_role_values` (
  `role_id` int(11) NOT NULL,
  `role_value` varchar(255) default NULL,
  KEY `idx_role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_role_values`
--

LOCK TABLES `jforum_role_values` WRITE;
/*!40000 ALTER TABLE `jforum_role_values` DISABLE KEYS */;
INSERT INTO `jforum_role_values` VALUES (25,'1'),(27,'1'),(29,'1'),(31,'1'),(33,'1'),(35,'1'),(37,'1'),(39,'1'),(40,'1'),(41,'2'),(29,'2'),(42,'2'),(41,'3'),(29,'3'),(42,'3'),(43,'2'),(25,'2'),(44,'2'),(27,'2'),(45,'2'),(31,'2'),(46,'2'),(37,'2'),(47,'2'),(33,'2'),(43,'4'),(25,'4'),(44,'4'),(27,'4'),(45,'4'),(31,'4'),(46,'4'),(37,'4'),(47,'4'),(33,'4'),(43,'5'),(25,'5'),(44,'5'),(27,'5'),(45,'5'),(31,'5'),(46,'5'),(37,'5'),(47,'5'),(33,'5'),(43,'6'),(25,'6'),(44,'6'),(27,'6'),(45,'6'),(31,'6'),(46,'6'),(37,'6'),(47,'6'),(33,'6'),(43,'7'),(25,'7'),(44,'7'),(27,'7'),(45,'7'),(31,'7'),(46,'7'),(37,'7'),(47,'7'),(33,'7'),(43,'8'),(25,'8'),(44,'8'),(27,'8'),(45,'8'),(31,'8'),(46,'8'),(37,'8'),(47,'8'),(33,'8'),(43,'9'),(25,'9'),(44,'9'),(27,'9'),(45,'9'),(31,'9'),(46,'9'),(37,'9'),(47,'9'),(33,'9'),(43,'10'),(25,'10'),(44,'10'),(27,'10'),(45,'10'),(31,'10'),(46,'10'),(37,'10'),(47,'10'),(33,'10'),(43,'11'),(25,'11'),(44,'11'),(27,'11'),(45,'11'),(31,'11'),(46,'11'),(37,'11'),(47,'11'),(33,'11'),(48,'1'),(51,'9'),(51,'5'),(51,'6'),(51,'10'),(51,'2'),(51,'7'),(51,'1'),(51,'11'),(51,'8'),(51,'4'),(53,'9'),(53,'5'),(53,'6'),(53,'10'),(53,'2'),(53,'7'),(53,'1'),(53,'11'),(53,'8'),(53,'4'),(54,'9'),(54,'5'),(54,'6'),(54,'10'),(54,'2'),(54,'7'),(54,'1'),(54,'11'),(54,'8'),(54,'4'),(58,'9'),(58,'5'),(58,'6'),(58,'10'),(58,'2'),(58,'7'),(58,'1'),(58,'11'),(58,'8'),(58,'4'),(60,'1'),(61,'9'),(61,'5'),(61,'6'),(61,'10'),(61,'2'),(61,'7'),(61,'1'),(61,'11'),(61,'8'),(61,'4'),(62,'1'),(62,'2'),(62,'3');
/*!40000 ALTER TABLE `jforum_role_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_roles`
--

DROP TABLE IF EXISTS `jforum_roles`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jforum_roles` (
  `role_id` int(11) NOT NULL auto_increment,
  `group_id` int(11) default '0',
  `name` varchar(255) NOT NULL,
  PRIMARY KEY  (`role_id`),
  KEY `idx_group` (`group_id`),
  KEY `idx_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_roles`
--

LOCK TABLES `jforum_roles` WRITE;
/*!40000 ALTER TABLE `jforum_roles` DISABLE KEYS */;
INSERT INTO `jforum_roles` VALUES (9,2,'perm_administration'),(10,2,'perm_moderation'),(11,2,'perm_moderation_post_remove'),(12,2,'perm_moderation_post_edit'),(13,2,'perm_moderation_topic_move'),(14,2,'perm_moderation_topic_lockUnlock'),(15,2,'perm_moderation_approve_messages'),(16,2,'perm_create_sticky_announcement_topics'),(17,2,'perm_vote'),(18,2,'perm_create_poll'),(19,2,'perm_karma_enabled'),(20,2,'perm_bookmarks_enabled'),(21,2,'perm_attachments_download'),(22,2,'perm_moderation_log'),(23,2,'perm_full_moderation_log'),(25,2,'perm_forum'),(27,2,'perm_anonymous_post'),(29,2,'perm_category'),(31,2,'perm_read_only_forums'),(33,2,'perm_html_disabled'),(35,2,'perm_attachments_enabled'),(37,2,'perm_reply_only'),(39,2,'perm_reply_without_moderation'),(40,2,'perm_moderation_forums'),(41,4,'perm_category'),(42,3,'perm_category'),(43,4,'perm_forum'),(44,4,'perm_anonymous_post'),(45,4,'perm_read_only_forums'),(46,4,'perm_reply_only'),(47,4,'perm_html_disabled'),(48,1,'perm_attachments_enabled'),(49,1,'perm_create_poll'),(50,1,'perm_bookmarks_enabled'),(51,1,'perm_anonymous_post'),(52,1,'perm_moderation_forums'),(53,1,'perm_forum'),(54,1,'perm_html_disabled'),(55,1,'perm_vote'),(56,1,'perm_attachments_download'),(57,1,'perm_karma_enabled'),(58,1,'perm_reply_only'),(59,1,'perm_moderation_log'),(60,1,'perm_reply_without_moderation'),(61,1,'perm_read_only_forums'),(62,1,'perm_category');
/*!40000 ALTER TABLE `jforum_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_sessions`
--

DROP TABLE IF EXISTS `jforum_sessions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jforum_sessions` (
  `session_id` varchar(150) NOT NULL default '',
  `session_user_id` int(11) NOT NULL default '0',
  `session_start` datetime default NULL,
  `session_time` bigint(20) default '0',
  `session_ip` varchar(15) NOT NULL default '',
  `session_page` int(11) NOT NULL default '0',
  `session_logged_int` tinyint(1) default NULL,
  KEY `idx_sessions_users` (`session_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_sessions`
--

LOCK TABLES `jforum_sessions` WRITE;
/*!40000 ALTER TABLE `jforum_sessions` DISABLE KEYS */;
INSERT INTO `jforum_sessions` VALUES ('53B6D2E9964968790CFEC047BA0F4116',6,'2009-06-09 23:01:12',56031,'',0,NULL),('A72168C1DCBD09461A8ACA26C3B080FD',2,'2009-06-09 20:27:12',0,'',0,NULL),('53B6D2E9964968790CFEC047BA0F4116',3,'2009-06-09 23:02:15',770375,'',0,NULL),('2A6183CA02340013BD21F759479C1E1D',5,'2009-06-09 21:04:28',0,'',0,NULL);
/*!40000 ALTER TABLE `jforum_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_smilies`
--

DROP TABLE IF EXISTS `jforum_smilies`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jforum_smilies` (
  `smilie_id` int(11) NOT NULL auto_increment,
  `code` varchar(50) NOT NULL default '',
  `url` varchar(100) default NULL,
  `disk_name` varchar(255) default NULL,
  PRIMARY KEY  (`smilie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_smilies`
--

LOCK TABLES `jforum_smilies` WRITE;
/*!40000 ALTER TABLE `jforum_smilies` DISABLE KEYS */;
INSERT INTO `jforum_smilies` VALUES (1,':)','<img src=\"#CONTEXT#/images/smilies/3b63d1616c5dfcf29f8a7a031aaa7cad.gif\" />','3b63d1616c5dfcf29f8a7a031aaa7cad.gif'),(2,':-)','<img src=\"#CONTEXT#/images/smilies/3b63d1616c5dfcf29f8a7a031aaa7cad.gif\"/>','3b63d1616c5dfcf29f8a7a031aaa7cad.gif'),(3,':D','<img src=\"#CONTEXT#/images/smilies/283a16da79f3aa23fe1025c96295f04f.gif\" />','283a16da79f3aa23fe1025c96295f04f.gif'),(4,':-D','<img src=\"#CONTEXT#/images/smilies/283a16da79f3aa23fe1025c96295f04f.gif\" />','283a16da79f3aa23fe1025c96295f04f.gif'),(5,':(','<img src=\"#CONTEXT#/images/smilies/9d71f0541cff0a302a0309c5079e8dee.gif\" />','9d71f0541cff0a302a0309c5079e8dee.gif'),(6,':mrgreen:','<img src=\"#CONTEXT#/images/smilies/ed515dbff23a0ee3241dcc0a601c9ed6.gif\" />','ed515dbff23a0ee3241dcc0a601c9ed6.gif'),(7,':-o','<img src=\"#CONTEXT#/images/smilies/47941865eb7bbc2a777305b46cc059a2.gif\"  />','47941865eb7bbc2a777305b46cc059a2.gif'),(8,':shock:','<img src=\"#CONTEXT#/images/smilies/385970365b8ed7503b4294502a458efa.gif\" />','385970365b8ed7503b4294502a458efa.gif'),(9,':?:','<img src=\"#CONTEXT#/images/smilies/0a4d7238daa496a758252d0a2b1a1384.gif\" />','0a4d7238daa496a758252d0a2b1a1384.gif'),(10,'8)','<img src=\"#CONTEXT#/images/smilies/b2eb59423fbf5fa39342041237025880.gif\"  />','b2eb59423fbf5fa39342041237025880.gif'),(11,':lol:','<img src=\"#CONTEXT#/images/smilies/97ada74b88049a6d50a6ed40898a03d7.gif\" />','97ada74b88049a6d50a6ed40898a03d7.gif'),(12,':x','<img src=\"#CONTEXT#/images/smilies/1069449046bcd664c21db15b1dfedaee.gif\"  />','1069449046bcd664c21db15b1dfedaee.gif'),(13,':P','<img src=\"#CONTEXT#/images/smilies/69934afc394145350659cd7add244ca9.gif\" />','69934afc394145350659cd7add244ca9.gif'),(14,':-P','<img src=\"#CONTEXT#/images/smilies/69934afc394145350659cd7add244ca9.gif\" />','69934afc394145350659cd7add244ca9.gif'),(15,':oops:','<img src=\"#CONTEXT#/images/smilies/499fd50bc713bfcdf2ab5a23c00c2d62.gif\" />','499fd50bc713bfcdf2ab5a23c00c2d62.gif'),(16,':cry:','<img src=\"#CONTEXT#/images/smilies/c30b4198e0907b23b8246bdd52aa1c3c.gif\" />','c30b4198e0907b23b8246bdd52aa1c3c.gif'),(17,':evil:','<img src=\"#CONTEXT#/images/smilies/2e207fad049d4d292f60607f80f05768.gif\" />','2e207fad049d4d292f60607f80f05768.gif'),(18,':twisted:','<img src=\"#CONTEXT#/images/smilies/908627bbe5e9f6a080977db8c365caff.gif\" />','908627bbe5e9f6a080977db8c365caff.gif'),(19,':roll:','<img src=\"#CONTEXT#/images/smilies/2786c5c8e1a8be796fb2f726cca5a0fe.gif\" />','2786c5c8e1a8be796fb2f726cca5a0fe.gif'),(20,':wink:','<img src=\"#CONTEXT#/images/smilies/8a80c6485cd926be453217d59a84a888.gif\" />','8a80c6485cd926be453217d59a84a888.gif'),(21,';)','<img src=\"#CONTEXT#/images/smilies/8a80c6485cd926be453217d59a84a888.gif\" />','8a80c6485cd926be453217d59a84a888.gif'),(22,';-)','<img src=\"#CONTEXT#/images/smilies/8a80c6485cd926be453217d59a84a888.gif\" />','8a80c6485cd926be453217d59a84a888.gif'),(23,':!:','<img src=\"#CONTEXT#/images/smilies/9293feeb0183c67ea1ea8c52f0dbaf8c.gif\" />','9293feeb0183c67ea1ea8c52f0dbaf8c.gif'),(24,':?','<img src=\"#CONTEXT#/images/smilies/136dd33cba83140c7ce38db096d05aed.gif\" />','136dd33cba83140c7ce38db096d05aed.gif'),(25,':idea:','<img src=\"#CONTEXT#/images/smilies/8f7fb9dd46fb8ef86f81154a4feaada9.gif\" />','8f7fb9dd46fb8ef86f81154a4feaada9.gif'),(26,':arrow:','<img src=\"#CONTEXT#/images/smilies/d6741711aa045b812616853b5507fd2a.gif\" />','d6741711aa045b812616853b5507fd2a.gif'),(27,':hunf:','<img src=\"#CONTEXT#/images/smilies/0320a00cb4bb5629ab9fc2bc1fcc4e9e.gif\" />','0320a00cb4bb5629ab9fc2bc1fcc4e9e.gif'),(28,':-(','<img src=\"#CONTEXT#/images/smilies/9d71f0541cff0a302a0309c5079e8dee.gif\"  />','9d71f0541cff0a302a0309c5079e8dee.gif'),(29,':XD:','<img src=\"#CONTEXT#/images/smilies/49869fe8223507d7223db3451e5321aa.gif\" />','49869fe8223507d7223db3451e5321aa.gif'),(30,':thumbup:','<img src=\"#CONTEXT#/images/smilies/e8a506dc4ad763aca51bec4ca7dc8560.gif\" />','e8a506dc4ad763aca51bec4ca7dc8560.gif'),(31,':thumbdown:','<img src=\"#CONTEXT#/images/smilies/e78feac27fa924c4d0ad6cf5819f3554.gif\" />','e78feac27fa924c4d0ad6cf5819f3554.gif'),(32,':|','<img src=\"#CONTEXT#/images/smilies/1cfd6e2a9a2c0cf8e74b49b35e2e46c7.gif\" />','1cfd6e2a9a2c0cf8e74b49b35e2e46c7.gif');
/*!40000 ALTER TABLE `jforum_smilies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_themes`
--

DROP TABLE IF EXISTS `jforum_themes`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jforum_themes` (
  `themes_id` int(11) NOT NULL auto_increment,
  `template_name` varchar(30) NOT NULL default '',
  `style_name` varchar(30) NOT NULL default '',
  PRIMARY KEY  (`themes_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_themes`
--

LOCK TABLES `jforum_themes` WRITE;
/*!40000 ALTER TABLE `jforum_themes` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_themes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_topics`
--

DROP TABLE IF EXISTS `jforum_topics`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jforum_topics` (
  `topic_id` int(11) NOT NULL auto_increment,
  `forum_id` int(11) NOT NULL default '0',
  `topic_title` varchar(100) NOT NULL default '',
  `user_id` int(11) NOT NULL default '0',
  `topic_time` datetime default NULL,
  `topic_views` int(11) default '1',
  `topic_replies` int(11) default '0',
  `topic_status` tinyint(3) default '0',
  `topic_vote_id` int(11) NOT NULL default '0',
  `topic_type` tinyint(3) default '0',
  `topic_first_post_id` int(11) default '0',
  `topic_last_post_id` int(11) NOT NULL default '0',
  `topic_moved_id` int(11) default '0',
  `moderated` tinyint(1) default '0',
  PRIMARY KEY  (`topic_id`),
  KEY `forum_id` (`forum_id`),
  KEY `user_id` (`user_id`),
  KEY `topic_first_post_id` (`topic_first_post_id`),
  KEY `topic_last_post_id` (`topic_last_post_id`),
  KEY `topic_moved_id` (`topic_moved_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_topics`
--

LOCK TABLES `jforum_topics` WRITE;
/*!40000 ALTER TABLE `jforum_topics` DISABLE KEYS */;
INSERT INTO `jforum_topics` VALUES (1,1,'什么是快速阅读',2,'2005-01-04 16:59:54',14,0,0,0,0,1,1,0,1),(2,11,'托尔斯泰',2,'2009-06-09 20:46:24',22,4,0,0,0,2,19,0,0),(3,10,'test1',2,'2009-06-09 20:47:55',3,0,0,0,0,3,3,0,0),(4,10,'test2',2,'2009-06-09 20:48:10',10,2,0,0,0,4,6,0,0),(5,11,'游客发帖置顶',1,'2009-06-09 20:57:32',10,0,0,0,2,7,7,0,0),(6,11,'调查',3,'2009-06-09 21:05:45',9,0,0,1,0,8,8,0,0),(7,10,'缺点与不足',5,'2009-06-09 21:06:10',39,7,0,0,0,9,37,0,0),(8,11,'信什么',3,'2009-06-09 21:08:39',14,0,0,2,0,12,12,0,0),(10,11,'fadfa',1,'2009-06-09 22:34:15',3,0,0,0,0,21,21,0,0),(11,11,'fadfa',1,'2009-06-09 22:44:09',9,2,0,0,0,22,24,0,0),(12,11,'公告注意',3,'2009-06-09 22:56:34',8,1,0,0,2,25,28,0,0),(13,11,'置顶的',3,'2009-06-09 22:57:25',6,1,0,0,1,26,27,0,0),(14,1,'游客发的贴',1,'2009-06-09 23:00:57',3,0,0,0,0,29,29,0,1),(15,1,'注册用户发的贴',6,'2009-06-09 23:01:29',2,0,0,0,0,30,30,0,1),(17,1,'管理员发贴',3,'2009-06-09 23:02:40',3,0,0,0,0,32,32,0,0),(18,1,'发了新贴',3,'2009-06-09 23:05:35',3,0,0,0,0,33,33,0,0),(19,11,'投票能置顶',3,'2009-06-09 23:08:27',5,0,0,3,0,34,34,0,0),(20,10,'头像预览',6,'2009-06-09 23:17:03',4,0,0,0,0,38,38,0,0);
/*!40000 ALTER TABLE `jforum_topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_topics_watch`
--

DROP TABLE IF EXISTS `jforum_topics_watch`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jforum_topics_watch` (
  `topic_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_read` tinyint(1) default '1',
  KEY `idx_topic` (`topic_id`),
  KEY `idx_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_topics_watch`
--

LOCK TABLES `jforum_topics_watch` WRITE;
/*!40000 ALTER TABLE `jforum_topics_watch` DISABLE KEYS */;
INSERT INTO `jforum_topics_watch` VALUES (2,2,0),(3,2,1),(4,2,0),(4,3,1),(6,3,1),(7,5,0),(8,3,1),(2,3,1),(11,3,1),(12,3,0),(13,3,1),(12,6,1),(15,6,0),(17,3,1),(18,3,1),(19,3,1),(7,3,0),(7,6,1),(20,6,1);
/*!40000 ALTER TABLE `jforum_topics_watch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_user_groups`
--

DROP TABLE IF EXISTS `jforum_user_groups`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jforum_user_groups` (
  `group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  KEY `idx_group` (`group_id`),
  KEY `idx_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_user_groups`
--

LOCK TABLES `jforum_user_groups` WRITE;
/*!40000 ALTER TABLE `jforum_user_groups` DISABLE KEYS */;
INSERT INTO `jforum_user_groups` VALUES (2,2),(2,3),(3,4),(1,1),(1,5),(1,6);
/*!40000 ALTER TABLE `jforum_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_users`
--

DROP TABLE IF EXISTS `jforum_users`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jforum_users` (
  `user_id` int(11) NOT NULL auto_increment,
  `user_active` tinyint(1) default NULL,
  `username` varchar(50) NOT NULL default '',
  `user_password` varchar(32) NOT NULL default '',
  `user_session_time` bigint(20) default '0',
  `user_session_page` int(11) NOT NULL default '0',
  `user_lastvisit` datetime default NULL,
  `user_regdate` datetime default NULL,
  `user_level` tinyint(4) default NULL,
  `user_posts` int(11) NOT NULL default '0',
  `user_timezone` varchar(5) NOT NULL default '',
  `user_style` tinyint(4) default NULL,
  `user_lang` varchar(255) NOT NULL default '',
  `user_dateformat` varchar(20) NOT NULL default '%d/%M/%Y %H:%i',
  `user_new_privmsg` int(11) NOT NULL default '0',
  `user_unread_privmsg` int(11) NOT NULL default '0',
  `user_last_privmsg` datetime default NULL,
  `user_emailtime` datetime default NULL,
  `user_viewemail` tinyint(1) default '0',
  `user_attachsig` tinyint(1) default '1',
  `user_allowhtml` tinyint(1) default '0',
  `user_allowbbcode` tinyint(1) default '1',
  `user_allowsmilies` tinyint(1) default '1',
  `user_allowavatar` tinyint(1) default '1',
  `user_allow_pm` tinyint(1) default '1',
  `user_allow_viewonline` tinyint(1) default '1',
  `user_notify` tinyint(1) default '1',
  `user_notify_always` tinyint(1) default '0',
  `user_notify_text` tinyint(1) default '0',
  `user_notify_pm` tinyint(1) default '1',
  `user_popup_pm` tinyint(1) default '1',
  `rank_id` int(11) default '0',
  `user_avatar` varchar(100) default NULL,
  `user_avatar_type` tinyint(4) NOT NULL default '0',
  `user_email` varchar(255) NOT NULL default '',
  `user_icq` varchar(15) default NULL,
  `user_website` varchar(255) default NULL,
  `user_from` varchar(100) default NULL,
  `user_sig` text,
  `user_sig_bbcode_uid` varchar(10) default NULL,
  `user_aim` varchar(255) default NULL,
  `user_yim` varchar(255) default NULL,
  `user_msnm` varchar(255) default NULL,
  `user_occ` varchar(100) default NULL,
  `user_interests` varchar(255) default NULL,
  `user_biography` text,
  `user_actkey` varchar(32) default NULL,
  `gender` char(1) default NULL,
  `themes_id` int(11) default NULL,
  `deleted` tinyint(1) default NULL,
  `user_viewonline` tinyint(1) default '1',
  `security_hash` varchar(32) default NULL,
  `user_karma` double default NULL,
  `user_authhash` varchar(32) default NULL,
  `user_qq` varchar(15) default NULL,
  `user_sex` tinyint(4) default '0',
  `user_birthday` datetime default NULL,
  PRIMARY KEY  (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_users`
--

LOCK TABLES `jforum_users` WRITE;
/*!40000 ALTER TABLE `jforum_users` DISABLE KEYS */;
INSERT INTO `jforum_users` VALUES (1,NULL,'Anonymous','nopass',0,0,NULL,'2009-06-08 23:44:55',NULL,6,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,0,NULL),(2,NULL,'Admin','21232f297a57a5a743894a0e4a801fc3',0,0,NULL,'2009-06-08 23:44:55',NULL,4,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,0,NULL),(3,1,'江南传道士','1a1dc91c907325c69271ddf0c944bc72',0,0,'2009-06-09 20:30:09','2009-06-09 20:29:16',NULL,16,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,-1,'eccbc87e4b5ce2fe28308fd9f2a7baf3.png',0,'vin@gmail.com','','','','江南传道士: 以宣扬成功之道为己任！',NULL,'','','','','','',NULL,NULL,0,NULL,1,NULL,NULL,NULL,'',0,NULL),(4,1,'vincent','1a1dc91c907325c69271ddf0c944bc72',0,0,NULL,'2009-06-09 20:30:44',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'vin1@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,0,NULL),(5,1,'han','81dc9bdb52d04dc20036dbd8313ed055',0,0,'2009-06-09 21:16:49','2009-06-09 21:04:28',NULL,5,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,'e4da3b7fbbce2345d7772b0674a318d5.png',0,'han@xiao.com','','','','',NULL,'','','','','','',NULL,NULL,0,NULL,1,NULL,NULL,NULL,'',0,NULL),(6,1,'con','1a1dc91c907325c69271ddf0c944bc72',0,0,'2009-06-09 22:58:56','2009-06-09 22:51:46',NULL,4,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,'1679091c5a880faf6fb5e6087eb1b2dc.jpg',0,'con@a.com','','','','',NULL,'','','','','','',NULL,NULL,0,NULL,1,NULL,NULL,NULL,'',0,NULL);
/*!40000 ALTER TABLE `jforum_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_vote_desc`
--

DROP TABLE IF EXISTS `jforum_vote_desc`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jforum_vote_desc` (
  `vote_id` int(11) NOT NULL auto_increment,
  `topic_id` int(11) NOT NULL default '0',
  `vote_text` varchar(255) NOT NULL default '',
  `vote_start` datetime NOT NULL,
  `vote_length` int(11) NOT NULL default '0',
  PRIMARY KEY  (`vote_id`),
  KEY `topic_id` (`topic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_vote_desc`
--

LOCK TABLES `jforum_vote_desc` WRITE;
/*!40000 ALTER TABLE `jforum_vote_desc` DISABLE KEYS */;
INSERT INTO `jforum_vote_desc` VALUES (1,6,'要哪个','2009-06-09 21:05:45',1),(2,8,'信仰选择','2009-06-09 21:08:39',2),(3,19,'投票能置顶','2009-06-09 23:08:27',0);
/*!40000 ALTER TABLE `jforum_vote_desc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_vote_results`
--

DROP TABLE IF EXISTS `jforum_vote_results`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jforum_vote_results` (
  `vote_id` int(11) NOT NULL default '0',
  `vote_option_id` tinyint(4) NOT NULL default '0',
  `vote_option_text` varchar(255) NOT NULL default '',
  `vote_result` int(11) NOT NULL default '0',
  KEY `vote_id` (`vote_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_vote_results`
--

LOCK TABLES `jforum_vote_results` WRITE;
/*!40000 ALTER TABLE `jforum_vote_results` DISABLE KEYS */;
INSERT INTO `jforum_vote_results` VALUES (1,1,'西瓜',1),(1,2,'土豆',0),(1,3,'飞机',0),(2,1,'神',0),(2,2,'佛',1),(2,3,'主',0),(2,4,'自己',0),(2,5,'黄金',1),(3,1,'能',0),(3,2,'不能',1);
/*!40000 ALTER TABLE `jforum_vote_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_vote_voters`
--

DROP TABLE IF EXISTS `jforum_vote_voters`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jforum_vote_voters` (
  `vote_id` int(11) NOT NULL default '0',
  `vote_user_id` int(11) NOT NULL default '0',
  `vote_user_ip` varchar(15) NOT NULL default '',
  KEY `vote_id` (`vote_id`),
  KEY `vote_user_id` (`vote_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_vote_voters`
--

LOCK TABLES `jforum_vote_voters` WRITE;
/*!40000 ALTER TABLE `jforum_vote_voters` DISABLE KEYS */;
INSERT INTO `jforum_vote_voters` VALUES (1,3,'127.0.0.1'),(2,3,'127.0.0.1'),(2,5,'192.168.18.104'),(3,3,'127.0.0.1');
/*!40000 ALTER TABLE `jforum_vote_voters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_words`
--

DROP TABLE IF EXISTS `jforum_words`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jforum_words` (
  `word_id` int(11) NOT NULL auto_increment,
  `word` varchar(100) NOT NULL default '',
  `replacement` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`word_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_words`
--

LOCK TABLES `jforum_words` WRITE;
/*!40000 ALTER TABLE `jforum_words` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_words` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2009-06-09 15:21:58
