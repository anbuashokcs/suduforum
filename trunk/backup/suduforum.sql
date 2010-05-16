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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_bookmarks`
--

LOCK TABLES `jforum_bookmarks` WRITE;
/*!40000 ALTER TABLE `jforum_bookmarks` DISABLE KEYS */;
INSERT INTO `jforum_bookmarks` VALUES (1,4,4,2,1,'他以为他很厉害呢','test'),(2,4,29,2,0,'黑点凝视 去掉 这个是基础训练，需要长期进行',''),(3,4,30,2,1,'加训练建议 ','');
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
INSERT INTO `jforum_categories` VALUES (1,'速读资料',1,1,0),(2,'训练讨论',2,0,0),(3,'自由讨论',3,0,0);
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
INSERT INTO `jforum_config` VALUES ('most.users.ever.online','3',1),('most.users.ever.online.date','1274018335500',2);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_forums`
--

LOCK TABLES `jforum_forums` WRITE;
/*!40000 ALTER TABLE `jforum_forums` DISABLE KEYS */;
INSERT INTO `jforum_forums` VALUES (1,1,'新手快速入门','如果你是速读新手，请从这里大概了解速读的基础知识',1,1,46,1),(2,1,'心得经验分享','这里聚集众多读友成功的经验和失败的教训',2,0,0,1),(3,1,'速读资料下载','速读及速读相关资料免费下载 (如有侵权，请立即警告本站)',3,0,0,1),(4,2,'基础训练','基础训练交流区：集中注意力、视点移动、视幅扩展、焦点移动',4,0,0,0),(5,2,'实战训练','实战训练交流区：消除读音、消除回跳、提高理解率、提高速度',5,0,0,0),(6,2,'辅助训练','辅助训练交流区：奇像记忆、思维导图、曼陀罗、3D图像',6,0,0,0),(7,3,'建议意见','请留下您宝贵的建议意见',7,43,70,0),(8,3,'海阔天空','闲聊',8,0,0,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_groups`
--

LOCK TABLES `jforum_groups` WRITE;
/*!40000 ALTER TABLE `jforum_groups` DISABLE KEYS */;
INSERT INTO `jforum_groups` VALUES (1,'普通用户','普通注册用户，采用SSO，论坛的用户验证都委托主站完成',0),(2,'管理员','系统管理',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_moderation_log`
--

LOCK TABLES `jforum_moderation_log` WRITE;
/*!40000 ALTER TABLE `jforum_moderation_log` DISABLE KEYS */;
INSERT INTO `jforum_moderation_log` VALUES (1,2,'test','<p>test</p>','2010-05-16 11:28:01',1,16,0,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_posts`
--

LOCK TABLES `jforum_posts` WRITE;
/*!40000 ALTER TABLE `jforum_posts` DISABLE KEYS */;
INSERT INTO `jforum_posts` VALUES (1,1,7,4,'2010-05-14 23:15:34','192.168.18.101',1,0,1,1,'2010-05-14 23:15:34',0,1,0,0),(2,2,7,4,'2010-05-14 23:16:16','192.168.18.101',1,0,1,1,'2010-05-14 23:16:16',0,1,0,0),(3,3,7,4,'2010-05-14 23:16:53','192.168.18.101',1,0,1,1,'2010-05-14 23:16:53',0,1,0,0),(4,3,7,4,'2010-05-14 23:17:46','192.168.18.101',1,0,1,1,'2010-05-14 23:17:46',0,1,0,0),(5,4,7,4,'2010-05-14 23:18:50','192.168.18.101',1,1,1,1,'2010-05-16 22:27:35',2,1,0,0),(6,5,7,4,'2010-05-14 23:27:07','192.168.18.101',1,1,1,1,'2010-05-14 23:27:07',0,1,0,0),(7,6,7,3,'2010-05-15 22:07:27','127.0.0.1',1,0,1,1,'2010-05-15 22:07:27',0,1,0,0),(8,7,7,3,'2010-05-15 22:08:19','127.0.0.1',1,1,1,1,'2010-05-15 22:08:19',0,1,0,0),(9,8,7,3,'2010-05-15 22:08:56','127.0.0.1',1,1,1,1,'2010-05-15 22:08:56',0,1,0,0),(10,9,7,3,'2010-05-15 22:09:31','127.0.0.1',1,1,1,1,'2010-05-15 22:09:31',0,1,0,0),(11,10,7,3,'2010-05-15 22:15:02','127.0.0.1',1,1,1,1,'2010-05-15 22:15:02',0,1,0,0),(12,11,7,3,'2010-05-15 22:15:57','127.0.0.1',1,1,1,1,'2010-05-15 22:15:57',0,1,0,0),(13,12,7,3,'2010-05-15 22:18:21','127.0.0.1',1,1,1,1,'2010-05-15 22:18:21',0,1,0,0),(14,13,7,3,'2010-05-15 22:20:26','127.0.0.1',1,1,1,1,'2010-05-15 22:20:26',0,1,0,0),(15,14,7,3,'2010-05-15 22:21:35','127.0.0.1',1,1,1,1,'2010-05-15 22:21:35',0,1,0,0),(17,14,7,2,'2010-05-16 11:29:42','127.0.0.1',1,0,1,1,'2010-05-16 11:29:42',0,1,0,0),(18,13,7,2,'2010-05-16 11:32:57','192.168.18.168',1,0,1,1,'2010-05-16 11:32:57',0,1,0,0),(19,12,7,2,'2010-05-16 11:33:48','192.168.18.168',1,1,1,1,'2010-05-16 11:33:48',0,1,0,0),(20,12,7,2,'2010-05-16 11:34:27','192.168.18.168',1,1,1,1,'2010-05-16 11:34:28',0,1,0,0),(21,12,7,2,'2010-05-16 11:35:51','192.168.18.168',1,1,1,1,'2010-05-16 11:35:51',0,1,0,0),(22,12,7,2,'2010-05-16 11:40:25','192.168.18.168',1,1,1,1,'2010-05-16 11:40:25',0,1,0,0),(23,12,7,2,'2010-05-16 18:04:38','192.168.18.168',1,1,1,1,'2010-05-16 18:04:38',0,1,0,0),(24,12,7,2,'2010-05-16 18:09:41','192.168.18.168',1,0,1,1,'2010-05-16 18:09:41',0,1,0,0),(25,11,7,2,'2010-05-16 18:11:13','192.168.18.168',1,0,1,1,'2010-05-16 18:11:13',0,1,0,0),(26,10,7,2,'2010-05-16 18:16:26','127.0.0.1',1,0,1,1,'2010-05-16 18:16:26',0,1,0,0),(27,9,7,2,'2010-05-16 18:16:54','127.0.0.1',1,0,1,1,'2010-05-16 18:16:54',0,1,0,0),(28,8,7,2,'2010-05-16 18:17:37','127.0.0.1',1,0,1,1,'2010-05-16 18:17:37',0,1,0,0),(29,7,7,2,'2010-05-16 18:17:59','127.0.0.1',1,0,1,1,'2010-05-16 18:17:59',0,1,0,0),(30,6,7,2,'2010-05-16 18:18:18','127.0.0.1',1,1,1,1,'2010-05-16 18:18:18',0,1,0,0),(31,5,7,2,'2010-05-16 18:18:41','127.0.0.1',1,0,1,1,'2010-05-16 18:18:41',0,1,0,0),(32,4,7,2,'2010-05-16 18:21:36','127.0.0.1',1,0,1,1,'2010-05-16 18:21:36',0,1,0,0),(33,2,7,2,'2010-05-16 18:21:59','127.0.0.1',1,0,1,1,'2010-05-16 18:21:59',0,1,0,0),(34,1,7,2,'2010-05-16 18:22:15','127.0.0.1',1,1,1,1,'2010-05-16 18:22:15',0,1,0,0),(35,1,7,2,'2010-05-16 18:22:35','127.0.0.1',1,1,1,1,'2010-05-16 18:22:35',0,1,0,0),(36,3,7,2,'2010-05-16 18:23:12','127.0.0.1',1,0,1,1,'2010-05-16 18:23:12',0,1,0,0),(37,3,7,3,'2010-05-16 18:26:22','127.0.0.1',1,0,1,1,'2010-05-16 18:26:22',0,1,0,0),(38,15,7,3,'2010-05-16 20:32:43','127.0.0.1',1,1,1,1,'2010-05-16 20:32:43',0,1,0,0),(39,16,7,3,'2010-05-16 20:37:40','127.0.0.1',1,1,1,1,'2010-05-16 20:37:40',0,1,0,0),(40,17,7,3,'2010-05-16 20:38:24','127.0.0.1',1,1,1,1,'2010-05-16 20:38:24',0,1,0,0),(41,18,7,3,'2010-05-16 20:39:45','127.0.0.1',1,1,1,1,'2010-05-16 20:39:45',0,1,0,0),(42,19,7,3,'2010-05-16 20:41:14','127.0.0.1',1,1,1,1,'2010-05-16 20:41:14',0,1,0,0),(43,20,7,3,'2010-05-16 20:42:51','127.0.0.1',1,1,1,1,'2010-05-16 20:42:51',0,1,0,0),(44,21,7,3,'2010-05-16 20:43:43','127.0.0.1',1,1,1,1,'2010-05-16 20:43:43',0,1,0,0),(45,22,7,3,'2010-05-16 21:51:55','127.0.0.1',1,1,1,1,'2010-05-16 21:51:55',0,1,0,0),(46,23,1,5,'2010-05-16 21:57:29','192.168.18.101',1,0,1,1,'2010-05-16 21:57:29',0,1,0,1),(47,24,7,3,'2010-05-16 22:01:27','127.0.0.1',1,1,1,1,'2010-05-16 22:01:27',0,1,0,0),(48,25,7,5,'2010-05-16 22:05:50','192.168.18.101',1,1,1,1,'2010-05-16 22:05:50',0,1,0,0),(49,26,7,3,'2010-05-16 22:08:10','127.0.0.1',1,1,1,1,'2010-05-16 22:08:10',0,1,0,0),(50,27,7,3,'2010-05-16 22:09:09','127.0.0.1',1,1,1,1,'2010-05-16 22:09:09',0,1,0,0),(51,28,7,3,'2010-05-16 22:11:00','127.0.0.1',1,1,1,1,'2010-05-16 22:11:00',0,1,0,0),(52,29,7,3,'2010-05-16 22:14:09','127.0.0.1',1,1,1,1,'2010-05-16 22:14:09',0,1,0,0),(53,4,7,4,'2010-05-16 22:15:43','192.168.18.101',1,0,1,1,'2010-05-16 22:15:43',0,1,0,0),(54,4,7,4,'2010-05-16 22:16:35','192.168.18.101',1,1,1,1,'2010-05-16 22:16:35',0,1,0,0),(55,30,7,3,'2010-05-16 22:17:49','127.0.0.1',1,1,1,1,'2010-05-16 22:17:49',0,1,0,0),(56,30,7,4,'2010-05-16 22:18:25','192.168.18.101',1,1,1,1,'2010-05-16 22:18:25',0,1,0,0),(57,31,7,3,'2010-05-16 22:19:38','127.0.0.1',1,1,1,1,'2010-05-16 22:19:38',0,1,0,0),(58,32,7,3,'2010-05-16 22:21:17','127.0.0.1',1,1,1,1,'2010-05-16 22:21:17',0,1,0,0),(59,33,7,4,'2010-05-16 22:21:53','192.168.18.101',1,0,1,1,'2010-05-16 22:22:16',1,1,0,0),(60,34,7,4,'2010-05-16 22:25:49','192.168.18.101',1,1,1,1,'2010-05-16 22:25:49',0,1,0,0),(61,35,7,3,'2010-05-16 22:26:43','127.0.0.1',1,1,1,1,'2010-05-16 22:26:43',0,1,0,0),(62,36,7,3,'2010-05-16 22:27:12','127.0.0.1',1,1,1,1,'2010-05-16 22:27:12',0,1,0,0),(63,37,7,3,'2010-05-16 22:28:13','127.0.0.1',1,1,1,1,'2010-05-16 22:28:13',0,1,0,0),(64,38,7,3,'2010-05-16 22:29:04','127.0.0.1',1,1,1,1,'2010-05-16 22:29:04',0,1,0,0),(65,39,7,3,'2010-05-16 22:29:41','127.0.0.1',1,1,1,1,'2010-05-16 22:29:41',0,1,0,0),(66,40,7,4,'2010-05-16 22:30:24','192.168.18.101',1,1,1,1,'2010-05-16 22:30:24',0,1,0,0),(67,41,7,3,'2010-05-16 22:30:43','127.0.0.1',1,1,1,1,'2010-05-16 22:30:43',0,1,0,0),(68,42,7,3,'2010-05-16 22:35:52','127.0.0.1',1,1,1,1,'2010-05-16 22:35:52',0,1,0,0),(69,43,7,3,'2010-05-16 22:54:02','127.0.0.1',1,1,1,1,'2010-05-16 22:54:02',0,1,0,0),(70,44,7,3,'2010-05-16 22:55:50','127.0.0.1',1,1,1,1,'2010-05-16 22:55:50',0,1,0,0);
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
INSERT INTO `jforum_posts_text` VALUES (1,'论坛登录时的用户名 出现乱码.','论坛----乱码问题'),(2,'如题。','发表新主题----表情符号图片不显示'),(3,'fasdfasdf','test1_one'),(4,'tests','test1_one'),(5,':oops: <p>哈哈</p>笑一个','和你开玩笑的'),(6,'<img     />','发表新主题----test'),(7,'后台管理－意见建议 后一页 错误','后台管理－意见建议'),(8,'刚发布的怎么就两次浏览了 如题','刚发布的怎么就两次浏览了'),(9,'如题','查看次数好像集体不对'),(10,'如题','浏览次数怎么算的'),(11,':( :D :-) :)如题','主站footer的意见建议list UI有问题'),(12,'<img     />&nbsp; 点这里的表情也可以用','发帖时表情要启用html功能后才能用'),(13,'就是这个输入框上面那个','这里的表情符号不能正常显示'),(14,'如题','点论坛上的logo怎么转到登录页面了'),(15,'如题','发帖的问题还真多，如果内容为空点发送，提示出错后标题也被清空了'),(17,'done, 是message focus时会刷新page','发帖的问题还真多，如果内容为空点发送，提示出错后标题也被清空了'),(18,'done;\r\n<a href=\"http://192.168.18.168:8080/suduforum/\">会走一下sso，发现没登录就转到login page；','点论坛上的logo怎么转到登录页面了'),(19,'测试表情<img     />预览是就不好了','回复:这里的表情符号不能正常显示'),(20,'<p>[quote=Admin]测试表情<img  />预览是就不好了[/quote]</p><p>&nbsp;</p><p>&lt;img&nbsp;&nbsp;&nbsp;&nbsp; /&gt;预览是就不好了</p>','回复:这里的表情符号不能正常显示'),(21,'<p>分两个问题：</p><p>1， 左边的表情在去掉html功能是不能用；</p><p>2， 上边的表情，图片没显示；</p>','回复:这里的表情符号不能正常显示'),(22,':(','回复:这里的表情符号不能正常显示'),(23,'<p>要有选中才有效</p>','回复:这里的表情符号不能正常显示'),(24,'aaa<img src=\"../../../templates/default/editors/tiny_mce/plugins/emotions/images/smiley-frown.gif\" border=\"0\" alt=\"皱眉\" title=\"皱眉\" />','回复:这里的表情符号不能正常显示'),(25,'这个问题暂缓','发帖时表情要启用html功能后才能用'),(26,'done','主站footer的意见建议list UI有问题'),(27,'除了首发算两次 其他好像也没问题','浏览次数怎么算的'),(28,'次数好像没大问题，但排序不知道怎么算的','查看次数好像集体不对'),(29,'小问题，不管了','刚发布的怎么就两次浏览了'),(30,'ok','后台管理－意见建议'),(31,'表情问题，暂缓','发表新主题----test'),(32,'准备独立战斗','他以为他很厉害呢'),(33,'表情问题 暂缓','发表新主题----表情符号图片不显示'),(34,'done','论坛----乱码问题'),(35,'快速回复 怎么不行了','论坛----乱码问题'),(36,'换个不是admin的 快速回复试试','test1_one'),(37,'try again.','test1_one'),(38,'如题','首页 知识改变命运 几个字太顶了'),(39,'<p>up</p><p>&nbsp;</p>','光荣榜的总人数不对'),(40,'up','主站IE tab中没ico logo'),(41,'up','系统介绍的内容不够详细，加为什么速度等'),(42,'up','训练课程再加个总导图 '),(43,'up','文章搜索的风格修改'),(44,'up','每篇文章调整，并更新初始数据'),(45,'up','丹田呼吸中 继续呼吸 改成 继续吸气'),(46,' :twisted: :D :D :D  :?','test3'),(47,'up','黑点凝视 这个是基础训练，需要长期训练。  去掉'),(48,'是否需要在论坛上重新添加用户信息？','论坛的用户信息和速度主系统的数据不一致'),(49,'rt','黑点移动 眼略睁大面对展开的训练图 改成 眼睛睁大'),(50,'rt','黑点移动 让视点循线上下慢慢移动。 这句句号太多'),(51,'RT','黑点凝视 视点循训练图上下往复移动  这句不是很通顺'),(52,'如题','黑点凝视 去掉 这个是基础训练，需要长期进行'),(53,'和你开玩笑的呢，自尊心这么强！！！','他以为他很厉害呢'),(54,'<p>[quote=Admin]准备独立战斗[/quote]没菜吃了。</p>','他以为他很厉害呢'),(55,'<p>前期按照训练课程的内容按部就班的训练；</p><p>熟悉后再准对自己的情况，选课程重点训练</p>','加训练建议 '),(56,'[quote=vincent] <p>前期按照训练课程的内容按部就班的训练；</p><p>熟悉后再准对自己的情况，选课程重点训练</p>[/quote]哦，明白了！','加训练建议 '),(57,'如题','视点横/纵向移动  训练时间是一分钟的 但后面的统计都按2分钟计算'),(58,'如题','视点横/纵向移动  与菜单的显示不一致'),(59,'如题。 :(','论坛-管理中心-回复通知：  下面的语句太长，以致显示成两行，不太好看'),(60,'不按照输入条件yyyy-mm-dd，也可以输入，而且没有错误信息。','论坛-管理中心-出生年月日 对输入的数据没有限制。'),(61,'如题','视点书页连结 改成 视点书页连接'),(62,'如题','训练单元中 有空间的地方 标题与下面的内容都要有空隙'),(63,'如题','视点书页连接 鼻梁对训练图中丸与训练团距离约30一40厘米。  改成 训练图'),(64,'如题','训练书页连接 视点从训练图的右上开始 改成 左上开始'),(65,'如题','视点书页连接  跟从波形曲钱移动。 改成 波形线'),(66,'最好是把&ldquo;论坛首页&rdquo;的链接加在工具栏里，与管理中心，我的主题，我的书签等放在一起。','在“我的主题”页面上，没有可以直接进入论坛首页的链接'),(67,'如题','视点书页连结  这个也是一分钟'),(68,'如题','有很多训练单元的时间都是一分钟的  统计要改 确认训练退出是否也是一分钟'),(69,'如题',' 二分钟后自动退出训练模式或双击直接退出训练模式   风格不一致'),(70,'如题','测到舒特尔');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_privmsgs`
--

LOCK TABLES `jforum_privmsgs` WRITE;
/*!40000 ALTER TABLE `jforum_privmsgs` DISABLE KEYS */;
INSERT INTO `jforum_privmsgs` VALUES (1,2,'短信发送测试',4,5,'2010-05-16 22:08:10','',1,1,1,1),(2,0,'短信发送测试',4,5,'2010-05-16 22:08:10','',1,1,1,1),(3,2,'回复:短信发送测试',5,4,'2010-05-16 22:09:47','',1,1,1,1);
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
INSERT INTO `jforum_privmsgs_text` VALUES (1,'test'),(2,'test'),(3,'<p>测试成功！恭喜</p>');
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_ranks`
--

LOCK TABLES `jforum_ranks` WRITE;
/*!40000 ALTER TABLE `jforum_ranks` DISABLE KEYS */;
INSERT INTO `jforum_ranks` VALUES (1,'新兵',0,0,NULL),(2,'列兵',5,0,NULL),(3,'上等兵',10,0,NULL),(4,'下士',30,0,NULL),(5,'中士',60,0,NULL),(6,'上士',100,0,NULL),(7,'军士',150,0,NULL),(8,'少尉',200,0,NULL),(9,'中尉',300,0,NULL),(10,'上尉',400,0,NULL),(11,'准校',500,0,NULL),(12,'少校',600,0,NULL),(13,'中校',700,0,NULL),(14,'上校',800,0,NULL),(15,'大校',900,0,NULL),(16,'准将',1000,0,NULL),(17,'少将',2000,0,NULL),(18,'中将',3000,0,NULL),(19,'上将',4000,0,NULL),(20,'五星上将',5000,0,NULL);
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
INSERT INTO `jforum_role_values` VALUES (81,'1'),(85,'4'),(85,'5'),(85,'7'),(85,'2'),(85,'1'),(85,'8'),(85,'6'),(85,'3'),(87,'4'),(87,'5'),(87,'7'),(87,'2'),(87,'1'),(87,'8'),(87,'6'),(87,'3'),(88,'4'),(88,'5'),(88,'7'),(88,'2'),(88,'1'),(88,'8'),(88,'6'),(88,'3'),(92,'4'),(92,'5'),(92,'7'),(92,'2'),(92,'1'),(92,'8'),(92,'6'),(92,'3'),(94,'1'),(95,'4'),(95,'5'),(95,'7'),(95,'2'),(95,'1'),(95,'8'),(95,'6'),(95,'3'),(96,'1'),(96,'2'),(96,'3'),(97,'1'),(106,'4'),(106,'5'),(106,'7'),(106,'2'),(106,'1'),(106,'8'),(106,'6'),(106,'3'),(107,'1'),(108,'4'),(108,'5'),(108,'7'),(108,'2'),(108,'1'),(108,'8'),(108,'6'),(108,'3'),(110,'4'),(110,'5'),(110,'7'),(110,'2'),(110,'1'),(110,'8'),(110,'6'),(110,'3'),(115,'4'),(115,'5'),(115,'7'),(115,'2'),(115,'1'),(115,'8'),(115,'6'),(115,'3'),(118,'1'),(119,'4'),(119,'5'),(119,'7'),(119,'2'),(119,'1'),(119,'8'),(119,'6'),(119,'3'),(120,'1'),(120,'2'),(120,'3');
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
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_roles`
--

LOCK TABLES `jforum_roles` WRITE;
/*!40000 ALTER TABLE `jforum_roles` DISABLE KEYS */;
INSERT INTO `jforum_roles` VALUES (81,1,'perm_attachments_enabled'),(82,1,'perm_create_poll'),(83,1,'perm_create_sticky_announcement_topics'),(84,1,'perm_bookmarks_enabled'),(85,1,'perm_anonymous_post'),(86,1,'perm_moderation_forums'),(87,1,'perm_forum'),(88,1,'perm_html_disabled'),(89,1,'perm_vote'),(90,1,'perm_attachments_download'),(91,1,'perm_karma_enabled'),(92,1,'perm_reply_only'),(93,1,'perm_moderation_log'),(94,1,'perm_reply_without_moderation'),(95,1,'perm_read_only_forums'),(96,1,'perm_category'),(97,2,'perm_attachments_enabled'),(98,2,'perm_create_poll'),(99,2,'perm_moderation_post_edit'),(100,2,'perm_create_sticky_announcement_topics'),(101,2,'perm_full_moderation_log'),(102,2,'perm_moderation'),(103,2,'perm_moderation_topic_lockUnlock'),(104,2,'perm_bookmarks_enabled'),(105,2,'perm_administration'),(106,2,'perm_anonymous_post'),(107,2,'perm_moderation_forums'),(108,2,'perm_forum'),(109,2,'perm_moderation_post_remove'),(110,2,'perm_html_disabled'),(111,2,'perm_vote'),(112,2,'perm_attachments_download'),(113,2,'perm_karma_enabled'),(114,2,'perm_moderation_approve_messages'),(115,2,'perm_reply_only'),(116,2,'perm_moderation_log'),(117,2,'perm_moderation_topic_move'),(118,2,'perm_reply_without_moderation'),(119,2,'perm_read_only_forums'),(120,2,'perm_category');
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
INSERT INTO `jforum_sessions` VALUES ('0A8A3159DC90E193043C2CBE8126DEEE',3,'2010-05-16 21:48:12',0,'',0,NULL),('4A15144AF6EA9EB8AB95B3EA1D3F941D',4,'2010-05-16 22:10:17',0,'',0,NULL),('35968064D6A545813C78BDFF1E69373B',2,'2010-05-16 18:25:25',0,'',0,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_topics`
--

LOCK TABLES `jforum_topics` WRITE;
/*!40000 ALTER TABLE `jforum_topics` DISABLE KEYS */;
INSERT INTO `jforum_topics` VALUES (1,7,'论坛----乱码问题',4,'2010-05-14 23:15:34',10,2,0,0,0,1,35,0,0),(2,7,'发表新主题----表情符号图片不显示',4,'2010-05-14 23:16:16',7,1,0,0,0,2,33,0,0),(3,7,'test1_one',4,'2010-05-14 23:16:53',14,3,0,0,0,3,37,0,0),(4,7,'和你开玩笑的',4,'2010-05-14 23:18:50',19,3,0,0,0,5,54,0,0),(5,7,'发表新主题----test',4,'2010-05-14 23:27:07',7,1,0,0,0,6,31,0,0),(6,7,'后台管理－意见建议',3,'2010-05-15 22:07:27',8,1,0,0,0,7,30,0,0),(7,7,'刚发布的怎么就两次浏览了',3,'2010-05-15 22:08:19',7,1,0,0,0,8,29,0,0),(8,7,'查看次数好像集体不对',3,'2010-05-15 22:08:56',6,1,0,0,0,9,28,0,0),(9,7,'浏览次数怎么算的',3,'2010-05-15 22:09:31',6,1,0,0,0,10,27,0,0),(10,7,'主站footer的意见建议list UI有问题',3,'2010-05-15 22:15:02',7,1,0,0,0,11,26,0,0),(11,7,'发帖时表情要启用html功能后才能用',3,'2010-05-15 22:15:57',6,1,0,0,0,12,25,0,0),(12,7,'这里的表情符号不能正常显示',3,'2010-05-15 22:18:21',20,6,0,0,0,13,24,0,0),(13,7,'点论坛上的logo怎么转到登录页面了',3,'2010-05-15 22:20:26',6,1,0,0,0,14,18,0,0),(14,7,'发帖的问题还真多，如果内容为空点发送，提示出错后标题也被清空了',3,'2010-05-15 22:21:35',7,1,0,0,0,15,17,0,0),(15,7,'首页 知识改变命运 几个字太顶了',3,'2010-05-16 20:32:43',4,0,0,0,0,38,38,0,0),(16,7,'光荣榜的总人数不对',3,'2010-05-16 20:37:40',3,0,0,0,0,39,39,0,0),(17,7,'主站IE tab中没ico logo',3,'2010-05-16 20:38:24',3,0,0,0,0,40,40,0,0),(18,7,'系统介绍的内容不够详细，加为什么速度等',3,'2010-05-16 20:39:45',4,0,0,0,0,41,41,0,0),(19,7,'训练课程再加个总导图 ',3,'2010-05-16 20:41:14',3,0,0,0,0,42,42,0,0),(20,7,'文章搜索的风格修改',3,'2010-05-16 20:42:51',3,0,0,0,0,43,43,0,0),(21,7,'每篇文章调整，并更新初始数据',3,'2010-05-16 20:43:43',4,0,0,0,0,44,44,0,0),(22,7,'丹田呼吸中 继续呼吸 改成 继续吸气',3,'2010-05-16 21:51:55',3,0,0,0,0,45,45,0,0),(23,1,'test3',5,'2010-05-16 21:57:29',1,0,0,0,0,46,0,0,1),(24,7,'黑点凝视 这个是基础训练，需要长期训练。  去掉',3,'2010-05-16 22:01:27',3,0,0,0,0,47,47,0,0),(25,7,'论坛的用户信息和速度主系统的数据不一致',5,'2010-05-16 22:05:50',3,0,0,0,0,48,48,0,0),(26,7,'黑点移动 眼略睁大面对展开的训练图 改成 眼睛睁大',3,'2010-05-16 22:08:10',3,0,0,0,0,49,49,0,0),(27,7,'黑点移动 让视点循线上下慢慢移动。 这句句号太多',3,'2010-05-16 22:09:09',3,0,0,0,0,50,50,0,0),(28,7,'黑点凝视 视点循训练图上下往复移动  这句不是很通顺',3,'2010-05-16 22:11:00',3,0,0,0,0,51,51,0,0),(29,7,'黑点凝视 去掉 这个是基础训练，需要长期进行',3,'2010-05-16 22:14:09',4,0,0,0,0,52,52,0,0),(30,7,'加训练建议 ',3,'2010-05-16 22:17:49',8,1,0,0,0,55,56,0,0),(31,7,'视点横/纵向移动  训练时间是一分钟的 但后面的统计都按2分钟计算',3,'2010-05-16 22:19:38',3,0,0,0,0,57,57,0,0),(32,7,'视点横/纵向移动  与菜单的显示不一致',3,'2010-05-16 22:21:17',3,0,0,0,0,58,58,0,0),(33,7,'论坛-管理中心-回复通知：  下面的语句太长，以致显示成两行，不太好看',4,'2010-05-16 22:21:53',5,0,0,0,0,59,59,0,0),(34,7,'论坛-管理中心-出生年月日 对输入的数据没有限制。',4,'2010-05-16 22:25:49',4,0,0,0,0,60,60,0,0),(35,7,'视点书页连结 改成 视点书页连接',3,'2010-05-16 22:26:43',3,0,0,0,0,61,61,0,0),(36,7,'训练单元中 有空间的地方 标题与下面的内容都要有空隙',3,'2010-05-16 22:27:12',4,0,0,0,0,62,62,0,0),(37,7,'视点书页连接 鼻梁对训练图中丸与训练团距离约30一40厘米。  改成 训练图',3,'2010-05-16 22:28:13',3,0,0,0,0,63,63,0,0),(38,7,'训练书页连接 视点从训练图的右上开始 改成 左上开始',3,'2010-05-16 22:29:04',3,0,0,0,0,64,64,0,0),(39,7,'视点书页连接  跟从波形曲钱移动。 改成 波形线',3,'2010-05-16 22:29:41',3,0,0,0,0,65,65,0,0),(40,7,'在“我的主题”页面上，没有可以直接进入论坛首页的链接',4,'2010-05-16 22:30:24',7,0,0,0,0,66,66,0,0),(41,7,'视点书页连结  这个也是一分钟',3,'2010-05-16 22:30:43',3,0,0,0,0,67,67,0,0),(42,7,'有很多训练单元的时间都是一分钟的  统计要改 确认训练退出是否也是一分钟',3,'2010-05-16 22:35:52',3,0,0,0,0,68,68,0,0),(43,7,' 二分钟后自动退出训练模式或双击直接退出训练模式   风格不一致',3,'2010-05-16 22:54:02',3,0,0,0,0,69,69,0,0),(44,7,'测到舒特尔',3,'2010-05-16 22:55:50',3,0,0,0,0,70,70,0,0);
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
INSERT INTO `jforum_topics_watch` VALUES (1,4,0),(2,4,0),(3,4,0),(4,4,1),(5,4,0),(6,3,0),(7,3,0),(8,3,0),(9,3,0),(10,3,0),(11,3,0),(12,3,0),(13,3,0),(14,3,0),(14,2,1),(13,2,1),(12,2,1),(11,2,1),(10,2,1),(9,2,1),(8,2,1),(7,2,1),(6,2,1),(5,2,1),(4,2,0),(2,2,1),(1,2,1),(3,2,0),(3,3,1),(15,3,1),(16,3,1),(17,3,1),(18,3,1),(19,3,1),(20,3,1),(21,3,1),(22,3,1),(23,5,1),(24,3,1),(25,5,1),(26,3,1),(27,3,1),(28,3,1),(29,3,1),(30,3,0),(30,4,1),(31,3,1),(32,3,1),(33,4,1),(34,4,1),(35,3,1),(36,3,1),(37,3,1),(38,3,1),(39,3,1),(40,4,1),(41,3,1),(42,3,1),(43,3,1),(44,3,1);
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
INSERT INTO `jforum_user_groups` VALUES (1,1),(2,2),(1,3),(1,4),(1,5);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_users`
--

LOCK TABLES `jforum_users` WRITE;
/*!40000 ALTER TABLE `jforum_users` DISABLE KEYS */;
INSERT INTO `jforum_users` VALUES (1,NULL,'Anonymous','nopass',0,0,NULL,'2010-05-13 16:38:00',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,0,NULL),(2,NULL,'Admin','21232f297a57a5a743894a0e4a801fc3',0,0,NULL,'2010-05-13 16:38:00',NULL,21,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,0,NULL,NULL,0,NULL),(3,NULL,'vincent','sso ',0,0,NULL,'2010-05-14 22:24:39',NULL,35,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'sso@user',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,0,NULL),(4,NULL,'test1','sso ',0,0,'2010-05-16 22:19:30','2010-05-14 22:33:04',NULL,12,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,'a87ff679a2f3e71d9181a67b7542122c.jpg',0,'sso@user','','http://test ','','',NULL,'','test','','','','',NULL,NULL,0,NULL,1,NULL,NULL,NULL,'12345678',0,'8922-12-12 00:00:00'),(5,NULL,'test3','sso ',0,0,'2010-05-16 22:02:50','2010-05-16 21:55:11',NULL,1,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'sso@user','111','','','',NULL,'','','','','','',NULL,NULL,0,NULL,1,NULL,NULL,NULL,'22',0,NULL);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_vote_desc`
--

LOCK TABLES `jforum_vote_desc` WRITE;
/*!40000 ALTER TABLE `jforum_vote_desc` DISABLE KEYS */;
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

-- Dump completed on 2010-05-16 14:56:40
