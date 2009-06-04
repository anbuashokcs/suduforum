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
  PRIMARY KEY  (`categories_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_categories`
--

LOCK TABLES `jforum_categories` WRITE;
/*!40000 ALTER TABLE `jforum_categories` DISABLE KEYS */;
INSERT INTO `jforum_categories` VALUES (1,'Category Test',1,0);
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
INSERT INTO `jforum_config` VALUES ('most.users.ever.online','2',1),('most.users.ever.online.date','1244097134208',2);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_forums`
--

LOCK TABLES `jforum_forums` WRITE;
/*!40000 ALTER TABLE `jforum_forums` DISABLE KEYS */;
INSERT INTO `jforum_forums` VALUES (1,1,'Test Forum','This is a test forum',1,1,1,0);
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
INSERT INTO `jforum_groups` VALUES (1,'注册用户','注册用户',0),(2,'管理员','论坛管理员',0);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_moderation_log`
--

LOCK TABLES `jforum_moderation_log` WRITE;
/*!40000 ALTER TABLE `jforum_moderation_log` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_posts`
--

LOCK TABLES `jforum_posts` WRITE;
/*!40000 ALTER TABLE `jforum_posts` DISABLE KEYS */;
INSERT INTO `jforum_posts` VALUES (1,1,1,2,'2005-01-04 16:59:54','127.0.0.1',1,0,1,1,NULL,0,1,0,0);
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
INSERT INTO `jforum_posts_text` VALUES (1,'[b][color=blue][size=18]Congratulations :!: [/size][/color][/b]\nYou have completed the installation, and JForum is up and running. \n\nTo start administering the board, login as [i]Admin / <the password you supplied in the installer>[/i] and access the [b][url=/admBase/login.page]Admin Control Panel[/url][/b] using the link that shows up in the bottom of the page. There you will be able to create Categories, Forums and much more  :D  \n\nFor more information and support, please refer to the following pages:\n\n:arrow: Community forum: http://www.jforum.net/community.jsp\n:arrow: Documentation: http://www.jforum.net/doc\n\nThank you for choosing JForum.\n\n[url=http://www.jforum.net/doc/Team]The JForum Team[/url]\n\n','Welcome to JForum');
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
INSERT INTO `jforum_role_values` VALUES (41,'1'),(50,'1'),(51,'1'),(52,'1'),(54,'1'),(59,'1'),(62,'1'),(63,'1'),(64,'1'),(65,'1'),(69,'1'),(71,'1'),(72,'1'),(76,'1'),(78,'1'),(79,'1'),(80,'1');
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
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_roles`
--

LOCK TABLES `jforum_roles` WRITE;
/*!40000 ALTER TABLE `jforum_roles` DISABLE KEYS */;
INSERT INTO `jforum_roles` VALUES (41,2,'perm_attachments_enabled'),(42,2,'perm_create_poll'),(43,2,'perm_moderation_post_edit'),(44,2,'perm_create_sticky_announcement_topics'),(45,2,'perm_full_moderation_log'),(46,2,'perm_moderation'),(47,2,'perm_moderation_topic_lockUnlock'),(48,2,'perm_bookmarks_enabled'),(49,2,'perm_administration'),(50,2,'perm_anonymous_post'),(51,2,'perm_moderation_forums'),(52,2,'perm_forum'),(53,2,'perm_moderation_post_remove'),(54,2,'perm_html_disabled'),(55,2,'perm_vote'),(56,2,'perm_attachments_download'),(57,2,'perm_karma_enabled'),(58,2,'perm_moderation_approve_messages'),(59,2,'perm_reply_only'),(60,2,'perm_moderation_log'),(61,2,'perm_moderation_topic_move'),(62,2,'perm_reply_without_moderation'),(63,2,'perm_read_only_forums'),(64,2,'perm_category'),(65,1,'perm_attachments_enabled'),(66,1,'perm_create_poll'),(67,1,'perm_create_sticky_announcement_topics'),(68,1,'perm_bookmarks_enabled'),(69,1,'perm_anonymous_post'),(70,1,'perm_moderation_forums'),(71,1,'perm_forum'),(72,1,'perm_html_disabled'),(73,1,'perm_vote'),(74,1,'perm_attachments_download'),(75,1,'perm_karma_enabled'),(76,1,'perm_reply_only'),(77,1,'perm_moderation_log'),(78,1,'perm_reply_without_moderation'),(79,1,'perm_read_only_forums'),(80,1,'perm_category');
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
INSERT INTO `jforum_sessions` VALUES ('59BDE9C93ED929C237C77DB44A29DF53',2,'2009-06-04 15:03:10',616797,'',0,NULL),('F2139336A9FC0587BC2BE142641F383E',3,'2009-06-04 13:56:54',133378,'',0,NULL),('59BDE9C93ED929C237C77DB44A29DF53',4,'2009-06-04 14:31:10',0,'',0,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_topics`
--

LOCK TABLES `jforum_topics` WRITE;
/*!40000 ALTER TABLE `jforum_topics` DISABLE KEYS */;
INSERT INTO `jforum_topics` VALUES (1,1,'Welcome to JForum',2,'2005-01-04 16:59:54',1,0,0,0,0,1,1,0,0);
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
INSERT INTO `jforum_user_groups` VALUES (1,1),(2,2),(2,3),(1,4);
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
  PRIMARY KEY  (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jforum_users`
--

LOCK TABLES `jforum_users` WRITE;
/*!40000 ALTER TABLE `jforum_users` DISABLE KEYS */;
INSERT INTO `jforum_users` VALUES (1,NULL,'Anonymous','nopass',0,0,NULL,'2009-06-04 13:18:15',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(2,NULL,'Admin','21232f297a57a5a743894a0e4a801fc3',0,0,NULL,'2009-06-04 13:18:15',NULL,1,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(3,1,'vincent','1a1dc91c907325c69271ddf0c944bc72',0,0,'2009-06-04 13:53:25','2009-06-04 13:51:53',NULL,0,'',NULL,'zh_CN','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,-1,'eccbc87e4b5ce2fe28308fd9f2a7baf3.jpg',0,'vincentc@hz.webex.com','','','','系统管理员－－江南传道士',NULL,'','','','','','',NULL,NULL,0,NULL,1,NULL,NULL,NULL),(4,1,'con','1a1dc91c907325c69271ddf0c944bc72',0,0,'2009-06-04 14:31:34','2009-06-04 14:31:10',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,'a87ff679a2f3e71d9181a67b7542122c.jpg',0,'con@pass.com','','','','',NULL,'','','','','','',NULL,NULL,0,NULL,1,NULL,NULL,NULL);
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

-- Dump completed on 2009-06-04 12:51:33
