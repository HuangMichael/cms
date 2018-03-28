CREATE DATABASE  IF NOT EXISTS `gscms` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `gscms`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: gscms
-- ------------------------------------------------------
-- Server version	5.7.15-log

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
-- Table structure for table `t_columns`
--

DROP TABLE IF EXISTS `t_columns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_columns` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `begin_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `name` varchar(20) NOT NULL,
  `sort_no` varchar(20) NOT NULL,
  `status` varchar(1) NOT NULL,
  `type` varchar(20) NOT NULL,
  `site_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_h4ro9kvk9hk6qs2q73efm992x` (`site_id`),
  CONSTRAINT `FK_h4ro9kvk9hk6qs2q73efm992x` FOREIGN KEY (`site_id`) REFERENCES `t_site` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_columns`
--

LOCK TABLES `t_columns` WRITE;
/*!40000 ALTER TABLE `t_columns` DISABLE KEYS */;
INSERT INTO `t_columns` VALUES (1,'2012-01-01 00:00:00','2012-01-01 00:00:00','网站首页','1','1','1',1),(2,'2012-01-01 00:00:00','2012-01-01 00:00:00','文联简介','1','1','1',1),(3,'2012-01-01 00:00:00','2012-01-01 00:00:00','文联领导','1','1','1',1),(4,'2012-01-01 00:00:00','2012-01-01 00:00:00','文联新闻','1','1','1',1),(5,'2012-01-01 00:00:00','2012-01-01 00:00:00','文艺志愿','1','1','1',1),(6,'2012-01-01 00:00:00','2012-01-01 00:00:00','文艺评论','1','1','1',1);
/*!40000 ALTER TABLE `t_columns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_etl_media`
--

DROP TABLE IF EXISTS `t_etl_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_etl_media` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `file_absolute_url` varchar(100) NOT NULL,
  `file_name` varchar(50) NOT NULL,
  `file_relative_url` varchar(100) NOT NULL,
  `file_size` bigint(20) NOT NULL,
  `memo` varchar(100) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `etl_table_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_2ifnjpxuqksqrfm50jlg42jdu` (`etl_table_id`),
  CONSTRAINT `FK_2ifnjpxuqksqrfm50jlg42jdu` FOREIGN KEY (`etl_table_id`) REFERENCES `t_etl_table` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_etl_media`
--

LOCK TABLES `t_etl_media` WRITE;
/*!40000 ALTER TABLE `t_etl_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_etl_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_etl_table`
--

DROP TABLE IF EXISTS `t_etl_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_etl_table` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `base_table_name` varchar(50) NOT NULL,
  `domain_name` varchar(100) DEFAULT NULL,
  `drop_status` varchar(1) NOT NULL,
  `service_table_name` varchar(50) NOT NULL,
  `status` varchar(1) NOT NULL,
  `table_desc` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_etl_table`
--

LOCK TABLES `t_etl_table` WRITE;
/*!40000 ALTER TABLE `t_etl_table` DISABLE KEYS */;
INSERT INTO `t_etl_table` VALUES (1,'t_base_equipments','com.subway.domain.equipments.Equipments','1','t_equipments','1','设备信息表'),(2,'t_location','com.subway.domain','1','t_location','1','位置信息');
/*!40000 ALTER TABLE `t_etl_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_etl_table_config`
--

DROP TABLE IF EXISTS `t_etl_table_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_etl_table_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `base_col_desc` varchar(100) NOT NULL,
  `base_col_name` varchar(50) DEFAULT NULL,
  `class_type` varchar(100) DEFAULT NULL,
  `data_type` varchar(50) NOT NULL,
  `is_null` varchar(1) NOT NULL,
  `length` bigint(20) DEFAULT NULL,
  `reference_col_name` varchar(20) DEFAULT NULL,
  `reference_table` varchar(20) DEFAULT NULL,
  `reference_type` varchar(1) DEFAULT NULL,
  `service_col_name` varchar(50) DEFAULT NULL,
  `sort_no` bigint(20) DEFAULT NULL,
  `status` varchar(1) NOT NULL,
  `table_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_fsumbiilv16asdguxajcsne33` (`table_id`),
  CONSTRAINT `FK_fsumbiilv16asdguxajcsne33` FOREIGN KEY (`table_id`) REFERENCES `t_etl_table` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_etl_table_config`
--

LOCK TABLES `t_etl_table_config` WRITE;
/*!40000 ALTER TABLE `t_etl_table_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_etl_table_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_member`
--

DROP TABLE IF EXISTS `t_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_member` (
  `id` int(11) NOT NULL,
  `card_no` varchar(20) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `enter_date` datetime DEFAULT NULL,
  `has_photo` varchar(1) DEFAULT NULL,
  `member_type` varchar(1) DEFAULT NULL,
  `name` varchar(20) NOT NULL,
  `sort_no` bigint(20) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_member`
--

LOCK TABLES `t_member` WRITE;
/*!40000 ALTER TABLE `t_member` DISABLE KEYS */;
INSERT INTO `t_member` VALUES (1,'01','2010-01-01 00:00:00','2030-01-01 00:00:00','1','1','黄斌',1,'1'),(2,'02','2010-01-01 00:00:00','2030-01-01 00:00:00','1','1','张超',2,'1'),(3,'03','2010-01-01 00:00:00','2030-01-01 00:00:00','1','1','董存辉',3,'1'),(4,'04','2010-01-01 00:00:00','2030-01-01 00:00:00','1','1','李永成',4,'1'),(5,'05','2010-01-01 00:00:00','2030-01-01 00:00:00','1','1','魏小源',5,'1'),(6,'06','2010-01-01 00:00:00','2030-01-01 00:00:00','1','1','张品忠',6,'1'),(7,'07','2010-01-01 00:00:00','2030-01-01 00:00:00','1','1','顾晓英',7,'1'),(8,'08','2010-01-01 00:00:00','2030-01-01 00:00:00','1','1','魏晶晶',8,'1');
/*!40000 ALTER TABLE `t_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_member_works`
--

DROP TABLE IF EXISTS `t_member_works`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_member_works` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_focus` varchar(1) NOT NULL,
  `member_type` varchar(1) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `release_time` datetime DEFAULT NULL,
  `sort_no` bigint(20) DEFAULT NULL,
  `status` varchar(1) NOT NULL,
  `upload_time` datetime DEFAULT NULL,
  `member_id` bigint(20) DEFAULT NULL,
  `unit_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_auc66en6ynpj7yg3f6fs8u5g8` (`unit_id`),
  CONSTRAINT `FK_auc66en6ynpj7yg3f6fs8u5g8` FOREIGN KEY (`unit_id`) REFERENCES `t_unit` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_member_works`
--

LOCK TABLES `t_member_works` WRITE;
/*!40000 ALTER TABLE `t_member_works` DISABLE KEYS */;
INSERT INTO `t_member_works` VALUES (1,'1','1','万里江山','2012-01-01 00:00:00',1,'1','2012-01-01 00:00:00',NULL,NULL),(2,'1','1','清明上河图','2012-01-01 00:00:00',1,'1','2012-01-01 00:00:00',NULL,NULL),(3,'1','1','丽人行','2012-01-01 00:00:00',1,'1','2012-01-01 00:00:00',NULL,NULL),(4,'1','1','林海雪原','2012-01-01 00:00:00',1,'1','2012-01-01 00:00:00',NULL,NULL),(5,'1','1','江南春晓','2012-01-01 00:00:00',1,'1','2012-01-01 00:00:00',NULL,NULL),(6,'1','1','长城秋色','2012-01-01 00:00:00',1,'1','2012-01-01 00:00:00',NULL,NULL),(7,'1','1','万里江山','2012-01-01 00:00:00',1,'1','2012-01-01 00:00:00',NULL,NULL),(8,'1','1','万里江山','2012-01-01 00:00:00',1,'1','2012-01-01 00:00:00',NULL,NULL);
/*!40000 ALTER TABLE `t_member_works` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_menu`
--

DROP TABLE IF EXISTS `t_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `icon_class` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `menu_desc` varchar(20) COLLATE utf8_bin NOT NULL,
  `menu_name` varchar(20) COLLATE utf8_bin NOT NULL,
  `sort_no` bigint(20) DEFAULT NULL,
  `status` varchar(1) COLLATE utf8_bin NOT NULL,
  `url` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_56r8tk50cond0r1oo2x2s9weg` (`menu_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_menu`
--

LOCK TABLES `t_menu` WRITE;
/*!40000 ALTER TABLE `t_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_pavilion_author`
--

DROP TABLE IF EXISTS `t_pavilion_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_pavilion_author` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `has_photo` varchar(1) DEFAULT NULL,
  `name` varchar(20) NOT NULL,
  `sort_no` bigint(20) DEFAULT NULL,
  `status` varchar(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_pavilion_author`
--

LOCK TABLES `t_pavilion_author` WRITE;
/*!40000 ALTER TABLE `t_pavilion_author` DISABLE KEYS */;
INSERT INTO `t_pavilion_author` VALUES (1,'2012-01-01 00:00:00','1','黄斌',1,'1');
/*!40000 ALTER TABLE `t_pavilion_author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_pavilion_works`
--

DROP TABLE IF EXISTS `t_pavilion_works`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_pavilion_works` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `col_name` varchar(20) NOT NULL,
  `has_photo` varchar(1) DEFAULT NULL,
  `is_focus` varchar(1) DEFAULT NULL,
  `name` varchar(20) NOT NULL,
  `release_time` datetime DEFAULT NULL,
  `sort_no` bigint(20) DEFAULT NULL,
  `status` varchar(1) NOT NULL,
  `upload_time` datetime DEFAULT NULL,
  `author_id` bigint(20) DEFAULT NULL,
  `columns_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_l5n62fkr1qbqbmu5r4luuceo6` (`author_id`),
  KEY `FK_gkonxccpja969nvfbkhlkkwo0` (`columns_id`),
  CONSTRAINT `FK_gkonxccpja969nvfbkhlkkwo0` FOREIGN KEY (`columns_id`) REFERENCES `t_columns` (`id`),
  CONSTRAINT `FK_l5n62fkr1qbqbmu5r4luuceo6` FOREIGN KEY (`author_id`) REFERENCES `t_pavilion_author` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_pavilion_works`
--

LOCK TABLES `t_pavilion_works` WRITE;
/*!40000 ALTER TABLE `t_pavilion_works` DISABLE KEYS */;
INSERT INTO `t_pavilion_works` VALUES (1,'1','1','1','1','2018-01-01 00:00:00',1,'1','2018-01-01 00:00:00',1,NULL);
/*!40000 ALTER TABLE `t_pavilion_works` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_person`
--

DROP TABLE IF EXISTS `t_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_person` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `person_no` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '人员编号',
  `person_name` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '人员姓名',
  `birth_date` date DEFAULT NULL COMMENT '出生日期',
  `email` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '电子邮箱',
  `telephone` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '联系电话',
  `sort_no` bigint(20) DEFAULT NULL COMMENT '排序',
  `status` varchar(1) CHARACTER SET utf8 DEFAULT '1' COMMENT '启用状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='人员信息表 ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_person`
--

LOCK TABLES `t_person` WRITE;
/*!40000 ALTER TABLE `t_person` DISABLE KEYS */;
INSERT INTO `t_person` VALUES (1,'004143','管理员','1989-04-01','huangbin10025@126.com','19993101300',1,'1'),(2,'002244','肖纯','1989-04-01','','',1,'1'),(3,'003322','张成飞','1989-04-01','','',1,'1'),(4,'004433','李国庆','1989-04-01','afgafadf@qq.com','18890989098',1,'1'),(5,'005133','李瑶','1989-04-01','','',1,'1'),(6,'006443','李琪','1989-04-01','','',1,'1'),(7,'007112','李莹',NULL,'876301469@qq.com','18810197978',1,'1'),(8,'007113','潘瑜',NULL,'panyu@163.com','18789098987',11,'1'),(9,'007114','赵婉',NULL,'zhaowan@163.com','18789098987',2,'1'),(10,'007115','李如意',NULL,'ruyi@163.com','18789098987',14,'1'),(11,'000909','张超',NULL,'zhangchao@qq.com','1568908909',19,'1'),(12,'000910','董存辉',NULL,'zhangchao@qq.com','1568908909',20,'1'),(13,'000920','张品忠',NULL,'zhangchao@qq.com','1568908909',21,'1'),(14,'000921','肖成',NULL,'zhangchao@qq.com','1568908909',22,NULL),(15,'000923','郭丹丹',NULL,'guodandan@qq.com','1568908909',24,'1');
/*!40000 ALTER TABLE `t_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_resource`
--

DROP TABLE IF EXISTS `t_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `resource_code` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT '资源编号',
  `app_name` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '应用名称',
  `description` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '描述',
  `resource_level` bigint(20) DEFAULT NULL COMMENT '级别',
  `resource_name` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT '资源名称',
  `resource_url` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT '资源路径',
  `static_flag` varchar(1) CHARACTER SET utf8 DEFAULT NULL COMMENT '静态标识',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上级节点',
  `icon_class` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '图标',
  `sort_no` bigint(20) DEFAULT NULL COMMENT '排序',
  `status` varchar(1) CHARACTER SET utf8 DEFAULT NULL COMMENT '启用状态',
  PRIMARY KEY (`id`),
  KEY `FK_m48cgw8i5tfw17pfqfvtf24ef` (`parent_id`),
  CONSTRAINT `FK_m48cgw8i5tfw17pfqfvtf24ef` FOREIGN KEY (`parent_id`) REFERENCES `t_resource` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='系统资源信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_resource`
--

LOCK TABLES `t_resource` WRITE;
/*!40000 ALTER TABLE `t_resource` DISABLE KEYS */;
INSERT INTO `t_resource` VALUES (1,'0',NULL,'网站内容发布系统',0,'网站内容发布系统','','1',NULL,NULL,1,'1'),(2,'01',NULL,'统计分析',1,'统计分析','','1',1,'fa fa-tachometer fa-fw',1,'1'),(3,'0101',NULL,'发稿统计',2,'发稿统计','href=\'/portal/index\'','1',2,NULL,3,'1'),(4,'02',NULL,'系统管理',1,'系统管理','','1',1,'fa fa-group fa-fw',2,'1'),(5,'0201',NULL,'用户信息',2,'用户信息','data-url=\'/user/list\'','1',4,NULL,1,'1'),(6,'0202',NULL,'人员信息',2,'人员信息','data-url=\'/person/list\'','1',4,NULL,2,'1'),(7,'0203',NULL,'角色信息',2,'角色信息','data-url=\'/role/list\'','1',4,NULL,3,'1'),(8,'0204',NULL,'应用授权',2,'应用授权','data-url=\'/authority/list\'','1',4,NULL,4,'1'),(9,'03',NULL,'站点管理',1,'站点管理','','1',1,'fa fa-file-text fa-fw',3,'1'),(10,'0301',NULL,'站点信息',2,'站点信息','data-url=\'/site/list\'','1',9,NULL,1,'1'),(11,'0302',NULL,'栏目信息',2,'栏目信息','data-url=\'/columns/list\'','1',9,NULL,2,'1'),(12,'04',NULL,'会员管理',1,'会员管理','','1',1,'fa fa-table fa-fw',5,'1'),(13,'0401',NULL,'会员简介',2,'会员简介','data-url=\'/member/list\'','1',12,NULL,1,'1'),(14,'0402',NULL,'会员作品',2,'会员作品','data-url=\'/memberWorks/list\'','1',12,NULL,2,'1'),(15,'0403',NULL,'调度台信息',2,'调度台信息','data-url=\'/workOrderDispatch/list\'','1',12,NULL,3,'0'),(16,'0404',NULL,'维修单查询',2,'维修单查询','data-url=\'/workOrderFix/list\'','1',12,NULL,4,'0'),(17,'05',NULL,'基础数据',1,'基础数据','','1',1,'fa fa-briefcase fa-fw',4,'1'),(18,'0501',NULL,'设备分类管理',2,'设备分类管理','data-url=\'/equipmentsClassification/list\'','1',17,NULL,1,'1'),(19,'0502',NULL,'外委单位管理',2,'外委单位管理','data-url=\'/units/list\'','0',17,NULL,2,NULL),(20,'0503',NULL,'线路管理',2,'线路管理','data-url=\'/line/list\'','1',17,NULL,3,'1'),(21,'0504',NULL,'车站管理',2,'车站管理','data-url=\'/station/list\'','1',17,NULL,4,'1'),(22,'1101','EQUIPMENT','新建记录',3,'新建记录','onclick=\'add()\'','1',11,'glyphicon glyphicon-plus',1,'1'),(23,'1102','EQUIPMENT','编辑记录',3,'编辑记录','onclick=\'edit()\'','1',11,'glyphicon glyphicon-edit',2,'1'),(24,'1103','EQUIPMENT','保存记录',3,'保存记录','onclick=\'save()\'','1',11,'glyphicon glyphicon-save',3,'1'),(25,'1104','EQUIPMENT','删除记录',3,'删除记录','onclick=\'del()\'','1',11,'glyphicon glyphicon-remove',4,'1'),(26,'1105','EQUIPMENT','上一条',3,'上一条','onclick=\'backwards()\'','1',11,'glyphicon glyphicon-backward',5,'1'),(27,'1106','EQUIPMENT','下一条',3,'下一条','onclick=\'forwards()\'','1',11,'glyphicon glyphicon-forward',6,'1'),(32,'0501','USER','新建记录',3,'新建记录','onclick=\'add()\'','1',5,'glyphicon glyphicon-plus',1,'1'),(33,'0502','USER','编辑记录',3,'编辑记录','onclick=\'edit()\'','1',5,'glyphicon glyphicon-edit',2,'1'),(34,'0503','USER','保存记录',3,'保存记录','onclick=\'saveUser()\'','1',5,'glyphicon glyphicon-save',3,'1'),(36,'0505','USER','上一条',3,'上一条','onclick=\'backwards()\'','1',5,'glyphicon glyphicon-backward',4,'1'),(37,'0506','USER','下一条',3,'下一条','onclick=\'forwards()\'','1',5,'glyphicon glyphicon-forward',5,'1'),(38,'1201','','资源管理',2,'资源管理','data-url=\'resource/list\'','0',4,'',5,'1'),(40,'3801','RESOURCE','新建记录',3,'新建记录','onclick=\'add()\'','0',38,'glyphicon glyphicon-plus',1,'1'),(41,'3802','RESOURCE','编辑记录',3,'编辑记录','onclick=\'edit()\'','0',38,'glyphicon glyphicon-edit',2,'1'),(42,'3803','RESOURCE','保存记录',3,'保存记录','onclick=\'save()\'','0',38,'glyphicon glyphicon-save',3,'1'),(43,'3804','RESOURCE','删除记录',3,'删除记录','onclick=\'del()\'','0',38,'glyphicon glyphicon-remove',4,'1'),(44,'050401','STATION','新建记录',3,'新建记录','onclick=\'add()\'','0',21,'glyphicon glyphicon-plus',1,'1'),(45,'050402','STATION','编辑记录',3,'编辑记录','onclick=\'edit()\'','0',21,'glyphicon glyphicon-edit',2,'1'),(46,'050403','STATION','保存记录',3,'保存记录','onclick=\'save()\'','0',21,'glyphicon glyphicon-save',3,'1'),(47,'050404','STATION','删除记录',3,'删除记录','onclick=\'de()\'','0',21,'glyphicon glyphicon-remove',4,'1'),(48,'050301','LINE','新建记录',3,'新建记录','onclick=\'add()\'','1',20,'glyphicon glyphicon-plus',1,'1'),(49,'050302','LINE','编辑记录',3,'编辑记录','onclick=\'edit()\'','1',20,'glyphicon glyphicon-edit',2,'1'),(50,'050303','LINE','保存记录',3,'保存记录','onclick=\'save()\'','1',20,'glyphicon glyphicon-save',3,'1'),(51,'050304','LINE','删除记录',3,'删除记录','onclick=\'del()\'','1',20,'glyphicon glyphicon-remove',4,'1'),(53,'050201','UNITS','新建记录',3,'新建记录','onclick=\'add()\'','0',19,'glyphicon glyphicon-plus',1,'1'),(54,'050405','STATION','上一条',3,'上一条','onclick=\'backwards()\'','1',21,'glyphicon glyphicon-backward',5,'1'),(55,'050406','STATION','下一条',3,'下一条','onclick=\'forwards()\'','1',21,'glyphicon glyphicon-forward',6,'1'),(56,'56',NULL,'网上展馆',1,'网上展馆','','1',1,'fa fa-star fa-fw',6,'1'),(57,'050401','BUDGET','新建记录',3,'新建记录','onclick=\'add()\'','0',63,'glyphicon glyphicon-plus',1,'1'),(58,'050402','BUDGET','编辑记录',3,'编辑记录','onclick=\'edit()\'','0',63,'glyphicon glyphicon-edit',2,'1'),(59,'050403','BUDGET','保存记录',3,'保存记录','onclick=\'save()\'','0',63,'glyphicon glyphicon-save',3,'1'),(60,'050404','BUDGET','删除记录',3,'删除记录','onclick=\'del()\'','0',63,'glyphicon glyphicon-remove',4,'1'),(61,'050405','BUDGET','上一条',3,'上一条','onclick=\'backwards()\'','0',63,'glyphicon glyphicon-backward',5,'1'),(62,'050406','BUDGET','下一条',3,'下一条','onclick=\'forwards()\'','0',63,'glyphicon glyphicon-forward',6,'1'),(63,'56',NULL,'展馆作者',2,'展馆作者','data-url=\'/pavilionAuthor/list\'','1',56,'fa fa-tachometer fa-fw',1,'1'),(64,'56',NULL,'展馆作品',2,'展馆作品','data-url=\'/pavilionWorks/list\'','1',56,'fa fa-tachometer fa-fw',2,'1'),(65,'050401','ECBUDGET','新建记录',3,'新建记录','onclick=\'add()\'','0',64,'glyphicon glyphicon-plus',1,'1'),(66,'050402','ECBUDGET','编辑记录',3,'编辑记录','onclick=\'edit()\'','0',64,'glyphicon glyphicon-edit',2,'1'),(67,'050403','ECBUDGET','保存记录',3,'保存记录','onclick=\'save()\'','0',64,'glyphicon glyphicon-save',3,'1'),(68,'050404','ECBUDGET','删除记录',3,'删除记录','onclick=\'del()\'','0',64,'glyphicon glyphicon-remove',4,'1'),(69,'050405','ECBUDGET','上一条',3,'上一条','onclick=\'backwards()\'','0',64,'glyphicon glyphicon-backward',5,'1'),(70,'050406','ECBUDGET','下一条',3,'下一条','onclick=\'forwards()\'','0',64,'glyphicon glyphicon-forward',6,'1'),(71,'601','PERSON','新建记录',3,'新建记录','onclick=\'add()\'','0',6,'glyphicon glyphicon-plus',1,'1'),(72,'602','PERSON','编辑记录',3,'编辑记录','onclick=\'edit()\'','0',6,'glyphicon glyphicon-edit',2,'1'),(73,'603','PERSON','保存记录',3,'保存记录','onclick=\'save()\'','0',6,'glyphicon glyphicon-save',3,'1'),(74,'604','PERSON','删除记录',3,'删除记录','onclick=\'del()\'','0',6,'glyphicon glyphicon-remove',4,'1'),(75,'605','PERSON','上一条',3,'上一条','onclick=\'backwards()\'','0',6,'glyphicon glyphicon-backward',5,'1'),(76,'607','PERSON','下一条',3,'下一条','onclick=\'forwards()\'','0',6,'glyphicon glyphicon-forward',6,'1'),(77,'1801','EQUIPMENTSCLASSIFICATION','新建记录',3,'新建记录','onclick=\'add()\'','0',18,'glyphicon glyphicon-plus',1,'1'),(78,'1802','EQUIPMENTSCLASSIFICATION','编辑记录',3,'编辑记录','onclick=\'edit()\'','0',18,'glyphicon glyphicon-edit',2,'1'),(79,'1803','EQUIPMENTSCLASSIFICATION','保存记录',3,'保存记录','onclick=\'save()\'','0',18,'glyphicon glyphicon-save',3,'1'),(80,'1804','EQUIPMENTSCLASSIFICATION','删除记录',3,'删除记录','onclick=\'del()\'','0',18,'glyphicon glyphicon-remove',4,'1'),(81,'56',NULL,'设备更新申请1',2,'设备更新申请','data-url=\'eqUpdateBill/list\'','1',56,'fa fa-tachometer fa-fw',2,'1'),(82,'050401','EQUPDATEBILL','新建记录',3,'新建记录','onclick=\'add()\'','0',81,'glyphicon glyphicon-plus',1,'1'),(83,'050402','EQUPDATEBILL','编辑记录',3,'编辑记录','onclick=\'edit()\'','0',81,'glyphicon glyphicon-edit',2,'1'),(84,'050403','EQUPDATEBILL','保存记录',3,'保存记录','onclick=\'save()\'','0',81,'glyphicon glyphicon-save',3,'1'),(85,'050404','EQUPDATEBILL','删除记录',3,'删除记录','onclick=\'del()\'','0',81,'glyphicon glyphicon-remove',4,'1'),(86,'050405','EQUPDATEBILL','上一条',3,'上一条','onclick=\'backwards()\'','0',81,'glyphicon glyphicon-backward',5,'1'),(87,'050406','EQUPDATEBILL','下一条',3,'下一条','onclick=\'forwards()\'','0',81,'glyphicon glyphicon-forward',6,'1'),(88,'56',NULL,'设备新置申请',2,'设备新置申请','data-url=\'eqAddBill/list\'','1',56,'fa fa-tachometer fa-fw',2,'1'),(89,'050401','EQADDBILL','新建记录',3,'新建记录','onclick=\'add()\'','0',88,'glyphicon glyphicon-plus',1,'1'),(90,'050402','EQADDBILL','编辑记录',3,'编辑记录','onclick=\'edit()\'','0',88,'glyphicon glyphicon-edit',2,'1'),(91,'050403','EQADDBILL','保存记录',3,'保存记录','onclick=\'save()\'','0',88,'glyphicon glyphicon-save',3,'1'),(92,'050404','EQADDBILL','删除记录',3,'删除记录','onclick=\'del()\'','0',88,'glyphicon glyphicon-remove',4,'1'),(93,'050405','EQADDBILL','上一条',3,'上一条','onclick=\'backwards()\'','0',88,'glyphicon glyphicon-backward',5,'1'),(94,'050406','EQADDBILL','下一条',3,'下一条','onclick=\'forwards()\'','0',88,'glyphicon glyphicon-forward',6,'1'),(96,'050401','ROLE','新建记录',3,'新建记录','onclick=\'add()\'','0',7,'glyphicon glyphicon-plus',1,'1'),(97,'050402','ROLE','编辑记录',3,'编辑记录','onclick=\'edit()\'','0',7,'glyphicon glyphicon-edit',2,'1'),(98,'050403','ROLE','保存记录',3,'保存记录','onclick=\'save()\'','0',7,'glyphicon glyphicon-save',3,'1'),(99,'050404','ROLE','删除记录',3,'删除记录','onclick=\'del()\'','0',7,'glyphicon glyphicon-remove',4,'1'),(100,'050405','ROLE','上一条',3,'上一条','onclick=\'backwards()\'','0',7,'glyphicon glyphicon-backward',5,'1'),(101,'050406','ROLE','下一条',3,'下一条','onclick=\'forwards()\'','0',7,'glyphicon glyphicon-forward',6,'1'),(102,'102',NULL,'审核发布',1,'审核发布','','1',1,'fa fa-tachometer fa-fw',7,'1'),(103,'56',NULL,'初审列表',2,'初审列表','data-url=\'matCost/list\'','1',102,'fa fa-tachometer fa-fw',1,'1'),(106,'050401','PREMAINT','新建记录',3,'新建记录','onclick=\'add()\'','0',116,'glyphicon glyphicon-plus',1,'1'),(107,'050402','PREMAINT','编辑记录',3,'编辑记录','onclick=\'edit()\'','0',116,'glyphicon glyphicon-edit',2,'1'),(108,'050403','PREMAINT','保存记录',3,'保存记录','onclick=\'save()\'','0',116,'glyphicon glyphicon-save',3,'1'),(109,'050404','PREMAINT','删除记录',3,'删除记录','onclick=\'del()\'','0',116,'glyphicon glyphicon-remove',4,'1'),(110,'050405','PREMAINT','上一条',3,'上一条','onclick=\'backwards()\'','0',116,'glyphicon glyphicon-backward',5,'1'),(111,'050406','PREMAINT','下一条',3,'下一条','onclick=\'forwards()\'','0',116,'glyphicon glyphicon-forward',6,'1'),(112,'56',NULL,'复审列表',2,'复审列表','data-url=\'workOrderMatCost/list\'','1',102,'fa fa-tachometer fa- tables',2,'1'),(113,'11301','WORKORDERMATCOST','下载模板',3,'下载模板','onclick=\'downExcel()\'','0',112,'glyphicon glyphicon-download',1,'1'),(114,'11302','WORKORDERMATCOST','导入Excel',3,'导入Excel','onclick=\'importExcel()\'','0',112,'glyphicon glyphicon-upload',2,'1'),(115,'104',NULL,'内容管理',1,'内容管理','','1',1,'fa fa-file-text fa-fw',8,'1'),(116,'105',NULL,'信息维护',2,'信息维护','data-url=\'preMaint/list\'','1',115,'fa fa-tachometer fa-fw',2,'1'),(117,'107',NULL,'信息上报',2,'信息上报','data-url=\'preMaintDispatcher/list\'','1',115,'fa fa-tachometer fa-fw',2,'1'),(129,'0102','UNITSSTATISTICS','外委单位统计',2,'外委单位统计','href=\'/unitsStatistics/list\'','0',2,'fa fa-tachometer fa-fw',2,'1'),(131,'1001','LOCATION','新建记录',3,'新建记录','onclick=\'add()\'','1',10,'glyphicon glyphicon-plus',1,'1'),(132,'1002','LOCATION','保存记录',3,'保存记录','onclick=\'save()\'','1',10,'glyphicon glyphicon-save',2,'1'),(133,'1002','LOCATION','编辑记录',3,'编辑记录','onclick=\'edit()\'','1',10,'glyphicon glyphicon-edit',3,'1'),(134,'1003','LOCATION','删除记录',3,'删除记录','onclick=\'del()\'','1',10,'glyphicon glyphicon-remove',4,'1'),(135,'1004','LOCATION','位置报修',3,'位置报修','onclick=\'reportByLocation()\'','1',10,'glyphicon glyphicon-warning-sign',5,'1'),(136,'050407','PREMAINT','生成调度',3,'生成调度','onclick=\'popGen()\'','0',116,'glyphicon glyphicon-download',7,'1'),(137,'050305','LINE','上一条',3,'上一条','onclick=\'backwards()\'','1',20,'glyphicon glyphicon-backward',5,'1'),(138,'050306','LINE','下一条',3,'下一条','onclick=\'forwards()\'','1',20,'glyphicon glyphicon-forward',6,'1'),(139,'1601','WORKORDERFIX','暂停',3,'暂停','onclick=\'pause()\'','1',16,'glyphicon glyphicon-pause',1,'1'),(140,'1602','WORKORDERFIX','完工',3,'完工','onclick=\'finish()\'','1',16,'glyphicon glyphicon-ok-circle',2,'1'),(141,'1603','WORKORDERFIX','取消',3,'取消','onclick=\'abort()\'','1',16,'glyphicon glyphicon-remove',3,'1'),(142,'050202','UNITS','编辑记录',3,'编辑记录','onclick=\'edit()\'','0',19,'glyphicon glyphicon-edit',2,'1'),(143,'050203','UNITS','保存记录',3,'保存记录','onclick=\'save()\'','0',19,'glyphicon glyphicon-save',3,'1'),(144,'050204','UNITS','删除记录',3,'删除记录','onclick=\'del()\'','0',19,'glyphicon glyphicon-remove',4,'1'),(145,'050205','UNITS','上一条',3,'上一条','onclick=\'backwards()\'','0',19,'glyphicon glyphicon-backward',5,'1'),(146,'050206','UNITS','下一条',3,'下一条','onclick=\'forwards()\'','0',19,'glyphicon glyphicon-forward',6,'1'),(147,'050105','EQUIPMENTSCLASSIFICATION','导入数据',3,'导入数据','onclick=\'importClass()\'','0',18,'glyphicon glyphicon-forward',5,'1'),(148,'1005','LOCATION','导入数据',3,'导入数据','onclick=\'importLoc()\'','0',10,'glyphicon glyphicon-forward',5,'1'),(149,'1604','WORKORDERFIX','批量完工',3,'批量完工','onclick=\'finishOrderBatch()\'','1',16,'glyphicon glyphicon-ok-circle',4,'1'),(150,'1243','','设备批量更新',2,'设备批量更新','data-url=\'/eqBatchUpdate/list\'','1',56,'fa fa-tachometer fa-fw',5,'1'),(151,'1245','EQBATCHUPDATE','设备更新上报',3,'设备更新上报','onclick=\'batchUpdateReport()\'','1',150,'glyphicon glyphicon-ok-circle',1,'1'),(152,'1246','','设备更新申请单',2,'设备更新申请单','data-url=\'/eqBatchUpdateBill/list\'','1',56,'glyphicon glyphicon-ok-circle',6,'1'),(153,'1246','EQBATCHUPDATEBILL','设备更新',3,'设备更新','data-url=\'/eqBatchUpdateBill/ue\'','1',152,'glyphicon glyphicon-ok-circle',1,'1'),(154,'123','','设备更新申请2',2,'设备更新申请','data-url=\'eqBatchUpdateBill/list\'','0',56,NULL,5,'1'),(155,'0090','WORKORDERFIX','批量更新',3,'批量更新','onClick=\'updateOrderBatch()\'','0',16,NULL,5,'1'),(156,'0307','EQUIPMENT','设备更新',3,'设备更新','onClick=\'eqBatchUpdate()\'','0',11,NULL,7,'1'),(157,'123123','EQBATCHUPDATEBILL','申请通过',3,'申请通过','onClick=\'approve()\'','0',154,NULL,1,'1'),(158,'0102','EQUIIPMENT','设备批量更新',3,'设备批量更新','onClick=\'eqBatchUpdate()\'','0',11,NULL,5,'1'),(159,'0206','','数据授权',2,'数据授权','data-url=\'authorityData/list\'','0',4,NULL,6,'1'),(160,'020601','AUTHORITYDATA','添加人员',3,'添加人员','onClick=\'grant()\'','0',159,'glyphicon glyphicon-user',1,'1'),(161,'08','','数据导入',1,'数据导入','数据导入','0',1,'glyphicon glyphicon-list',8,'1'),(162,'0801','','元数据表信息',2,'元数据表信息','data-url=\'/etlTable/list\'','0',161,'1',1,'1'),(163,'0802','','基础数据导入',2,'基础数据导入','data-url=\'/etl/list\'','0',161,'1',2,'1'),(164,'080101','ETLTABLE','新建记录',3,'新建记录','onclick=\'add()\'','0',162,'glyphicon glyphicon-plus',1,'1'),(165,'080102','ETLTABLE','编辑记录',3,'编辑记录','onclick=\'edit()\'','0',162,'glyphicon glyphicon-edit',2,'1'),(166,'080103','ETLTABLE','保存记录',3,'保存记录','onclick=\'save()\'','0',162,'glyphicon glyphicon-save',3,'1'),(167,'080104','ETLTABLE','删除记录',3,'删除记录','onclick=\'del()\'','0',162,'glyphicon glyphicon-remove',4,'1'),(168,'080105','ETLTABLE','上一条',3,'上一条','onclick=\'backwards()\'','0',162,'glyphicon glyphicon-backward',5,'1'),(169,'080107','ETLTABLE','下一条',3,'下一条','onclick=\'forwards()\'','0',162,'glyphicon glyphicon-forward',6,'1'),(170,'080107','ETLTABLE','提取配置项',3,'提取配置项','onclick=\'extractConfig()\'','0',162,'glyphicon glyphicon-import',7,'1');
/*!40000 ALTER TABLE `t_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_role`
--

DROP TABLE IF EXISTS `t_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `role_desc` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '角色描述',
  `role_name` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT '角色名称',
  `sort_no` bigint(20) DEFAULT NULL COMMENT '排序',
  `status` varchar(1) CHARACTER SET utf8 NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ovncscj4f7ddi1sjqawayb6t5` (`role_desc`),
  UNIQUE KEY `UK_bojr4duyesjymks0ty5yjwhx3` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_role`
--

LOCK TABLES `t_role` WRITE;
/*!40000 ALTER TABLE `t_role` DISABLE KEYS */;
INSERT INTO `t_role` VALUES (1,'管理员','admin',1,'1'),(2,'只读角色','游客',0,'1'),(3,'甘肃文联','wl',0,'1'),(4,'作家协会','zjxh',0,'1'),(5,'role1111','role',0,'1');
/*!40000 ALTER TABLE `t_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_role_resource`
--

DROP TABLE IF EXISTS `t_role_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_role_resource` (
  `role_id` bigint(20) NOT NULL COMMENT '角色',
  `resource_id` bigint(20) NOT NULL COMMENT '资源',
  KEY `FK_hvd3v1xf4men57mo38osb4ih1` (`resource_id`),
  KEY `FK_qie95ky0tnqn6cl36rd606yxo` (`role_id`),
  CONSTRAINT `FK_hvd3v1xf4men57mo38osb4ih1` FOREIGN KEY (`resource_id`) REFERENCES `t_resource` (`id`),
  CONSTRAINT `FK_qie95ky0tnqn6cl36rd606yxo` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色资源信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_role_resource`
--

LOCK TABLES `t_role_resource` WRITE;
/*!40000 ALTER TABLE `t_role_resource` DISABLE KEYS */;
INSERT INTO `t_role_resource` VALUES (2,1),(2,2),(2,3),(2,9),(2,10),(2,11),(2,26),(2,27),(2,12),(2,14),(3,1),(3,2),(3,3),(3,4),(3,5),(3,9),(3,10),(3,11),(3,12),(3,14),(3,26),(3,27),(3,36),(3,37),(3,6),(3,18),(3,71),(3,72),(3,73),(3,74),(3,75),(3,76),(3,77),(3,78),(3,79),(3,7),(3,19),(3,20),(3,21),(3,38),(3,54),(3,55),(3,56),(3,61),(3,62),(3,63),(3,64),(3,69),(3,70),(3,86),(3,87),(3,88),(3,93),(3,94),(3,100),(3,101),(3,102),(3,103),(3,110),(3,111),(3,112),(3,115),(3,116),(3,117),(1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,14),(1,18),(1,19),(1,20),(1,21),(1,22),(1,23),(1,24),(1,25),(1,26),(1,27),(1,32),(1,33),(1,34),(1,36),(1,37),(1,38),(1,40),(1,41),(1,42),(1,43),(1,44),(1,45),(1,46),(1,47),(1,48),(1,49),(1,50),(1,51),(1,53),(1,54),(1,55),(1,56),(1,57),(1,58),(1,59),(1,60),(1,61),(1,62),(1,63),(1,64),(1,65),(1,66),(1,67),(1,68),(1,69),(1,70),(1,71),(1,72),(1,73),(1,74),(1,75),(1,76),(1,77),(1,78),(1,79),(1,80),(1,96),(1,97),(1,98),(1,99),(1,100),(1,101),(1,102),(1,103),(1,106),(1,107),(1,108),(1,109),(1,110),(1,111),(1,112),(1,113),(1,114),(1,115),(1,116),(1,117),(1,131),(1,132),(1,133),(1,134),(1,135),(1,136),(1,137),(1,138),(1,139),(1,140),(1,141),(1,142),(1,143),(1,144),(1,145),(1,146),(1,147),(1,148),(1,149),(1,155),(1,156),(1,158),(1,159),(1,160);
/*!40000 ALTER TABLE `t_role_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_role_user`
--

DROP TABLE IF EXISTS `t_role_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_role_user` (
  `role_id` bigint(20) NOT NULL COMMENT '角色',
  `user_id` bigint(20) NOT NULL COMMENT '用户',
  KEY `FK_5jg9sj3cv5ews49641tu2hitf` (`user_id`),
  KEY `FK_jkq2lfs3kx3cexyr5raqtrgg0` (`role_id`),
  CONSTRAINT `FK_5jg9sj3cv5ews49641tu2hitf` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `FK_jkq2lfs3kx3cexyr5raqtrgg0` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_role_user`
--

LOCK TABLES `t_role_user` WRITE;
/*!40000 ALTER TABLE `t_role_user` DISABLE KEYS */;
INSERT INTO `t_role_user` VALUES (1,2),(1,6),(1,5),(1,4),(1,3),(1,7),(2,2),(1,1);
/*!40000 ALTER TABLE `t_role_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_site`
--

DROP TABLE IF EXISTS `t_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_site` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `begin_time` datetime DEFAULT NULL,
  `deploy_host` varchar(20) NOT NULL,
  `domain_name` varchar(20) NOT NULL,
  `end_time` datetime DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `sort_no` varchar(20) NOT NULL,
  `status` varchar(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_site`
--

LOCK TABLES `t_site` WRITE;
/*!40000 ALTER TABLE `t_site` DISABLE KEYS */;
INSERT INTO `t_site` VALUES (1,'2012-01-01 00:00:00','202.201.48.114','www.baidu.com','2022-01-01 00:00:00','甘肃文联网','1','1'),(2,'2012-01-01 00:00:00','202.201.48.114','www.baidu.com','2022-01-01 00:00:00','作家协会','1','1'),(3,'2012-01-01 00:00:00','202.201.48.114','www.baidu.com','2022-01-01 00:00:00','舞蹈家协会','1','1'),(4,'2012-01-01 00:00:00','202.201.48.114','www.baidu.com','2022-01-01 00:00:00','书法家协会','1','1'),(5,'2012-01-01 00:00:00','202.201.48.114','www.baidu.com','2022-01-01 00:00:00','摄影协会','1','1'),(6,'2012-01-01 00:00:00','202.201.48.114','www.baidu.com','2022-01-01 00:00:00','雕塑家协会','1','1'),(7,'2012-01-01 00:00:00','202.201.48.114','www.baidu.com','2022-01-01 00:00:00','作家之家','1','1'),(8,'2012-01-01 00:00:00','202.201.48.114','www.baidu.com','2022-01-01 00:00:00','文联协会','1','1');
/*!40000 ALTER TABLE `t_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_sys_info`
--

DROP TABLE IF EXISTS `t_sys_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_sys_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `sys_name` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '参数名称',
  `description` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '描述',
  `logo_url` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT 'logo图标',
  `sort_no` bigint(20) DEFAULT NULL COMMENT '排序',
  `status` varchar(1) CHARACTER SET utf8 DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_594nbbdvvwwqa3yft4p5jxbcd` (`sys_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='系统配置信息表 ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_sys_info`
--

LOCK TABLES `t_sys_info` WRITE;
/*!40000 ALTER TABLE `t_sys_info` DISABLE KEYS */;
INSERT INTO `t_sys_info` VALUES (1,'system_name','网站内容发布系统','/img/logo/logo.png',1,'1'),(2,'pre_maint_auto_schedule','是否自动调度',NULL,2,'1');
/*!40000 ALTER TABLE `t_sys_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_sys_log`
--

DROP TABLE IF EXISTS `t_sys_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `user_name` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户',
  `remote_ip` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '访问ip地址',
  `request_time` datetime DEFAULT NULL COMMENT '请求时间',
  `url` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '请求路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='系统日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_sys_log`
--

LOCK TABLES `t_sys_log` WRITE;
/*!40000 ALTER TABLE `t_sys_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_sys_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_unit`
--

DROP TABLE IF EXISTS `t_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_unit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `parent` varchar(20) NOT NULL,
  `sort_no` varchar(20) NOT NULL,
  `status` varchar(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_unit`
--

LOCK TABLES `t_unit` WRITE;
/*!40000 ALTER TABLE `t_unit` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user`
--

DROP TABLE IF EXISTS `t_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `user_name` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '密码',
  `person_id` bigint(20) DEFAULT NULL COMMENT '人员',
  `vlocations_id` bigint(20) DEFAULT NULL COMMENT '位置',
  `sort_no` bigint(20) DEFAULT NULL COMMENT '排序',
  `status` varchar(1) CHARACTER SET utf8 NOT NULL DEFAULT '1' COMMENT '启用状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_unique_index` (`user_name`),
  KEY `fk_person_index` (`person_id`),
  CONSTRAINT `FK_lu3rofbmhofhefs57m4uxc27j` FOREIGN KEY (`person_id`) REFERENCES `t_person` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user`
--

LOCK TABLES `t_user` WRITE;
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT INTO `t_user` VALUES (1,'huangbin','e10adc3949ba59abbe56e057f20f883e',1,1,1,'1'),(2,'line2','e10adc3949ba59abbe56e057f20f883e',2,2,2,'1'),(3,'line8','e10adc3949ba59abbe56e057f20f883e',3,3,3,'1'),(4,'line10','e10adc3949ba59abbe56e057f20f883e',4,4,4,'1'),(5,'line13','e10adc3949ba59abbe56e057f20f883e',5,5,5,'1'),(6,'xzm','e10adc3949ba59abbe56e057f20f883e',6,411,2,'1'),(7,'panyu','e10adc3949ba59abbe56e057f20f883e',8,4,1,'1'),(8,'guodandan','e10adc3949ba59abbe56e057f20f883e',15,NULL,1,'1');
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user_log`
--

DROP TABLE IF EXISTS `t_user_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_user_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `login_ip` varchar(20) DEFAULT NULL,
  `operation` varchar(20) DEFAULT NULL,
  `operation_time` datetime DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `user_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=217 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user_log`
--

LOCK TABLES `t_user_log` WRITE;
/*!40000 ALTER TABLE `t_user_log` DISABLE KEYS */;
INSERT INTO `t_user_log` VALUES (1,'0:0:0:0:0:0:0:1','登录','2017-08-20 21:32:48','登录成功','huangbin'),(2,'0:0:0:0:0:0:0:1','登录','2017-08-20 21:32:50','登录成功','huangbin'),(3,'0:0:0:0:0:0:0:1','登录','2017-08-20 21:32:56','登录成功','huangbin'),(4,'0:0:0:0:0:0:0:1','登录','2017-08-20 21:32:58','登录成功','huangbin'),(5,'0:0:0:0:0:0:0:1','登录','2017-08-20 21:32:59','登录成功','huangbin'),(6,'0:0:0:0:0:0:0:1','登录','2017-08-20 21:34:20','登录成功','huangbin'),(7,'0:0:0:0:0:0:0:1','登录','2017-08-20 21:36:01','登录成功','huangbin'),(8,'0:0:0:0:0:0:0:1','登录','2017-08-20 21:40:08','登录成功','huangbin'),(9,'0:0:0:0:0:0:0:1','登录','2017-08-20 21:41:09','登录成功','huangbin'),(10,'0:0:0:0:0:0:0:1','登录','2017-08-20 21:43:54','登录成功','huangbin'),(11,'0:0:0:0:0:0:0:1','登录','2017-08-20 21:43:56','登录成功','huangbin'),(12,'0:0:0:0:0:0:0:1','登录','2017-08-20 21:46:14','登录成功','huangbin'),(13,'0:0:0:0:0:0:0:1','登录','2017-08-20 21:46:16','登录成功','huangbin'),(14,'0:0:0:0:0:0:0:1','登录','2017-08-20 21:46:17','登录成功','huangbin'),(15,'0:0:0:0:0:0:0:1','登录','2017-08-20 21:47:18','登录成功','huangbin'),(16,'0:0:0:0:0:0:0:1','登录','2017-08-20 21:51:06','登录成功','huangbin'),(17,'0:0:0:0:0:0:0:1','登录','2017-08-20 21:52:34','登录成功','line2'),(18,'0:0:0:0:0:0:0:1','登录','2017-08-20 21:58:48','登录成功','huangbin'),(19,'0:0:0:0:0:0:0:1','登录','2017-08-20 22:00:52','登录成功','huangbin'),(20,'0:0:0:0:0:0:0:1','登录','2017-08-20 22:04:40','登录成功','huangbin'),(21,'0:0:0:0:0:0:0:1','登录','2017-08-20 22:06:23','登录成功','huangbin'),(22,'0:0:0:0:0:0:0:1','登录','2017-08-23 10:55:31','登录成功','huangbin'),(23,'0:0:0:0:0:0:0:1','登录','2017-08-27 09:21:18','登录成功','huangbin'),(24,'0:0:0:0:0:0:0:1','登录','2017-08-27 09:39:26','登录成功','huangbin'),(25,'0:0:0:0:0:0:0:1','登录','2017-08-27 15:20:29','登录成功','huangbin'),(26,'0:0:0:0:0:0:0:1','登录','2017-08-27 15:25:34','登录成功','huangbin'),(27,'0:0:0:0:0:0:0:1','登录','2017-08-27 15:28:22','登录成功','huangbin'),(28,'0:0:0:0:0:0:0:1','登录','2017-08-27 15:32:15','登录成功','huangbin'),(29,'0:0:0:0:0:0:0:1','登录','2017-08-27 15:33:14','登录成功','huangbin'),(30,'0:0:0:0:0:0:0:1','登录','2017-08-27 15:44:05','登录成功','huangbin'),(31,'0:0:0:0:0:0:0:1','登录','2017-08-27 15:46:10','登录成功','huangbin'),(32,'0:0:0:0:0:0:0:1','登录','2017-08-28 19:20:03','登录成功','huangbin'),(33,'0:0:0:0:0:0:0:1','登录','2017-08-28 19:28:38','登录成功','huangbin'),(34,'0:0:0:0:0:0:0:1','登录','2017-08-28 19:34:18','登录成功','huangbin'),(35,'0:0:0:0:0:0:0:1','登录','2017-08-28 19:36:55','登录成功','huangbin'),(36,'0:0:0:0:0:0:0:1','登录','2017-08-29 20:01:12','登录成功','huangbin'),(37,'0:0:0:0:0:0:0:1','登录','2017-08-29 20:03:22','登录失败',' huangbin'),(38,'0:0:0:0:0:0:0:1','登录','2017-08-29 20:03:26','登录失败',' huangbin'),(39,'0:0:0:0:0:0:0:1','登录','2017-08-29 20:03:32','登录失败',' huangbin'),(40,'0:0:0:0:0:0:0:1','登录','2017-08-29 20:03:48','登录成功','huangbin'),(41,'0:0:0:0:0:0:0:1','登录','2017-08-29 20:05:01','登录成功','panyu'),(42,'0:0:0:0:0:0:0:1','登录','2017-08-29 20:15:48','登录成功','huangbin'),(43,'0:0:0:0:0:0:0:1','登录','2017-09-02 14:10:19','登录成功','huangbin'),(44,'0:0:0:0:0:0:0:1','登录','2017-09-02 15:00:06','登录成功','huangbin'),(45,'0:0:0:0:0:0:0:1','登录','2017-09-02 15:17:29','登录成功','huangbin'),(46,'0:0:0:0:0:0:0:1','登录','2017-09-02 15:19:39','登录成功','huangbin'),(47,'0:0:0:0:0:0:0:1','登录','2017-09-02 15:22:37','登录成功','huangbin'),(48,'0:0:0:0:0:0:0:1','登录','2017-09-02 15:41:27','登录成功','huangbin'),(49,'0:0:0:0:0:0:0:1','登录','2017-09-02 15:57:09','登录成功','huangbin'),(50,'0:0:0:0:0:0:0:1','登录','2017-09-02 16:07:07','登录成功','huangbin'),(51,'0:0:0:0:0:0:0:1','登录','2017-09-03 06:37:43','登录成功','huangbin'),(52,'0:0:0:0:0:0:0:1','登录','2017-09-03 06:39:43','登录成功','huangbin'),(53,'0:0:0:0:0:0:0:1','登录','2017-09-03 06:43:30','登录成功','huangbin'),(54,'0:0:0:0:0:0:0:1','登录','2017-09-03 06:53:31','登录失败',' huangbin'),(55,'0:0:0:0:0:0:0:1','登录','2017-09-03 06:53:35','登录失败',' huangbin'),(56,'0:0:0:0:0:0:0:1','登录','2017-09-03 06:53:46','登录成功','huangbin'),(57,'0:0:0:0:0:0:0:1','登录','2017-09-03 06:58:11','登录成功','huangbin'),(58,'0:0:0:0:0:0:0:1','登录','2017-09-03 07:01:20','登录成功','huangbin'),(59,'0:0:0:0:0:0:0:1','登录','2017-09-03 07:03:06','登录成功','huangbin'),(60,'0:0:0:0:0:0:0:1','登录','2017-09-03 07:05:38','登录成功','huangbin'),(61,'0:0:0:0:0:0:0:1','登录','2017-09-03 07:55:29','登录成功','huangbin'),(62,'0:0:0:0:0:0:0:1','登录','2017-09-03 08:12:13','登录成功','huangbin'),(63,'0:0:0:0:0:0:0:1','登录','2017-09-03 08:15:23','登录成功','huangbin'),(64,'0:0:0:0:0:0:0:1','登录','2017-09-03 08:16:55','登录成功','huangbin'),(65,'0:0:0:0:0:0:0:1','登录','2017-09-03 08:21:36','登录成功','huangbin'),(66,'0:0:0:0:0:0:0:1','登录','2017-09-04 16:09:57','登录成功','huangbin'),(67,'0:0:0:0:0:0:0:1','登录','2017-09-04 16:32:05','登录成功','huangbin'),(68,'0:0:0:0:0:0:0:1','登录','2017-09-04 16:32:22','登录失败','admin'),(69,'0:0:0:0:0:0:0:1','登录','2017-09-04 16:33:35','登录成功','huangbin'),(70,'0:0:0:0:0:0:0:1','登录','2017-09-04 21:01:15','登录失败','admin'),(71,'0:0:0:0:0:0:0:1','登录','2017-09-04 21:01:25','登录成功','huangbin'),(72,'0:0:0:0:0:0:0:1','登录','2017-09-04 21:04:33','登录成功','huangbin'),(73,'0:0:0:0:0:0:0:1','登录','2017-09-04 21:13:54','登录成功','huangbin'),(74,'0:0:0:0:0:0:0:1','登录','2017-09-04 21:18:03','登录成功','huangbin'),(75,'0:0:0:0:0:0:0:1','登录','2017-09-04 21:20:15','登录成功','huangbin'),(76,'0:0:0:0:0:0:0:1','登录','2017-09-04 21:26:48','登录成功','huangbin'),(77,'0:0:0:0:0:0:0:1','登录','2017-09-04 21:43:23','登录成功','huangbin'),(78,'0:0:0:0:0:0:0:1','登录','2017-09-04 21:50:33','登录成功','huangbin'),(79,'0:0:0:0:0:0:0:1','登录','2017-09-04 21:53:34','登录成功','huangbin'),(80,'0:0:0:0:0:0:0:1','登录','2017-10-25 18:48:15','登录成功','huangbin'),(81,'0:0:0:0:0:0:0:1','登录','2017-10-25 19:01:09','登录成功','huangbin'),(82,'0:0:0:0:0:0:0:1','登录','2017-10-25 19:04:01','登录成功','huangbin'),(83,'0:0:0:0:0:0:0:1','登录','2017-10-25 19:12:06','登录成功','huangbin'),(84,'0:0:0:0:0:0:0:1','登录','2017-10-25 19:13:14','登录成功','huangbin'),(85,'0:0:0:0:0:0:0:1','登录','2017-10-25 19:20:16','登录成功','huangbin'),(86,'0:0:0:0:0:0:0:1','登录','2017-10-25 19:23:36','登录成功','huangbin'),(87,'0:0:0:0:0:0:0:1','登录','2017-10-25 19:29:10','登录成功','huangbin'),(88,'0:0:0:0:0:0:0:1','登录','2017-10-25 19:31:04','登录成功','huangbin'),(89,'0:0:0:0:0:0:0:1','登录','2017-10-25 19:44:47','登录成功','huangbin'),(90,'0:0:0:0:0:0:0:1','登录','2017-09-13 13:59:30','登录成功','huangbin'),(91,'0:0:0:0:0:0:0:1','登录','2017-09-13 14:02:23','登录成功','huangbin'),(92,'0:0:0:0:0:0:0:1','登录','2017-12-13 14:04:05','登录成功','huangbin'),(93,'0:0:0:0:0:0:0:1','登录','2017-12-13 14:12:06','登录成功','huangbin'),(94,'0:0:0:0:0:0:0:1','登录','2017-12-13 14:15:44','登录成功','huangbin'),(95,'0:0:0:0:0:0:0:1','登录','2017-12-13 14:21:52','登录成功','huangbin'),(96,'0:0:0:0:0:0:0:1','登录','2017-12-13 14:22:58','登录成功','huangbin'),(97,'0:0:0:0:0:0:0:1','登录','2017-12-16 18:46:12','登录成功','huangbin'),(98,'0:0:0:0:0:0:0:1','登录','2017-12-24 16:27:49','登录成功','huangbin'),(99,'0:0:0:0:0:0:0:1','登录','2017-09-01 18:37:44','登录成功','huangbin'),(100,'0:0:0:0:0:0:0:1','登录','2017-09-01 18:42:24','登录成功','huangbin'),(101,'0:0:0:0:0:0:0:1','登录','2017-09-01 20:34:12','登录成功','huangbin'),(102,'0:0:0:0:0:0:0:1','登录','2017-09-08 12:46:00','登录成功','huangbin'),(103,'0:0:0:0:0:0:0:1','登录','2017-12-31 12:48:24','登录成功','huangbin'),(104,'0:0:0:0:0:0:0:1','登录','2017-12-31 15:30:39','登录成功','huangbin'),(105,'0:0:0:0:0:0:0:1','登录','2018-02-25 15:18:08','登录失败','admin'),(106,'0:0:0:0:0:0:0:1','登录','2018-02-25 15:18:17','登录成功','huangbin'),(107,'0:0:0:0:0:0:0:1','登录','2018-02-25 15:24:47','登录成功','huangbin'),(108,'0:0:0:0:0:0:0:1','登录','2018-02-25 15:34:31','登录成功','huangbin'),(109,'0:0:0:0:0:0:0:1','登录','2018-02-25 15:38:54','登录成功','huangbin'),(110,'0:0:0:0:0:0:0:1','登录','2018-02-25 15:40:47','登录成功','huangbin'),(111,'0:0:0:0:0:0:0:1','登录','2018-02-25 15:46:58','登录成功','huangbin'),(112,'0:0:0:0:0:0:0:1','登录','2018-02-25 15:47:25','登录成功','huangbin'),(113,'0:0:0:0:0:0:0:1','登录','2018-02-25 15:50:55','登录成功','huangbin'),(114,'0:0:0:0:0:0:0:1','登录','2018-02-25 15:53:15','登录成功','huangbin'),(115,'0:0:0:0:0:0:0:1','登录','2018-02-25 15:59:45','登录成功','huangbin'),(116,'0:0:0:0:0:0:0:1','登录','2018-02-25 16:01:10','登录成功','huangbin'),(117,'0:0:0:0:0:0:0:1','登录','2018-02-25 16:12:21','登录成功','huangbin'),(118,'0:0:0:0:0:0:0:1','登录','2018-02-25 16:22:02','登录成功','huangbin'),(119,'0:0:0:0:0:0:0:1','登录','2018-02-25 16:25:25','登录成功','huangbin'),(120,'0:0:0:0:0:0:0:1','登录','2018-02-25 16:27:35','登录成功','huangbin'),(121,'0:0:0:0:0:0:0:1','登录','2018-02-25 16:59:20','登录成功','huangbin'),(122,'0:0:0:0:0:0:0:1','登录','2018-02-25 17:02:03','登录成功','huangbin'),(123,'0:0:0:0:0:0:0:1','登录','2018-02-25 17:07:54','登录成功','huangbin'),(124,'0:0:0:0:0:0:0:1','登录','2018-02-25 17:17:20','登录成功','huangbin'),(125,'0:0:0:0:0:0:0:1','登录','2018-02-25 17:20:31','登录成功','huangbin'),(126,'0:0:0:0:0:0:0:1','登录','2018-02-25 17:23:44','登录成功','huangbin'),(127,'0:0:0:0:0:0:0:1','登录','2018-02-25 17:54:00','登录成功','huangbin'),(128,'0:0:0:0:0:0:0:1','登录','2018-02-25 19:52:22','登录成功','huangbin'),(129,'0:0:0:0:0:0:0:1','登录','2018-02-25 19:55:55','登录成功','huangbin'),(130,'0:0:0:0:0:0:0:1','登录','2018-02-25 19:58:33','登录成功','huangbin'),(131,'0:0:0:0:0:0:0:1','登录','2018-02-25 20:02:28','登录成功','huangbin'),(132,'0:0:0:0:0:0:0:1','登录','2018-02-25 20:12:27','登录成功','huangbin'),(133,'0:0:0:0:0:0:0:1','登录','2018-02-25 20:13:43','登录失败','huangbin'),(134,'0:0:0:0:0:0:0:1','登录','2018-02-25 20:13:48','登录成功','huangbin'),(135,'0:0:0:0:0:0:0:1','登录','2018-02-25 20:17:16','登录成功','huangbin'),(136,'0:0:0:0:0:0:0:1','登录','2018-02-25 20:19:30','登录成功','huangbin'),(137,'0:0:0:0:0:0:0:1','登录','2018-02-25 20:21:58','登录成功','huangbin'),(138,'0:0:0:0:0:0:0:1','登录','2018-02-25 20:36:19','登录成功','huangbin'),(139,'0:0:0:0:0:0:0:1','登录','2018-02-25 20:56:33','登录成功','huangbin'),(140,'0:0:0:0:0:0:0:1','登录','2018-02-25 20:58:05','登录成功','huangbin'),(141,'0:0:0:0:0:0:0:1','登录','2018-02-25 21:02:27','登录成功','huangbin'),(142,'0:0:0:0:0:0:0:1','登录','2018-02-25 21:07:47','登录成功','huangbin'),(143,'0:0:0:0:0:0:0:1','登录','2018-02-25 21:46:39','登录成功','huangbin'),(144,'0:0:0:0:0:0:0:1','登录','2018-02-25 21:51:36','登录成功','huangbin'),(145,'0:0:0:0:0:0:0:1','登录','2018-02-25 22:08:23','登录成功','huangbin'),(146,'0:0:0:0:0:0:0:1','登录','2018-02-26 13:23:08','登录成功','huangbin'),(147,'0:0:0:0:0:0:0:1','登录','2018-02-26 13:36:05','登录成功','huangbin'),(148,'0:0:0:0:0:0:0:1','登录','2018-02-26 13:39:17','登录成功','huangbin'),(149,'0:0:0:0:0:0:0:1','登录','2018-02-26 13:52:53','登录成功','huangbin'),(150,'0:0:0:0:0:0:0:1','登录','2018-02-26 13:59:38','登录成功','huangbin'),(151,'0:0:0:0:0:0:0:1','登录','2018-02-26 15:02:12','登录失败',' huangbin'),(152,'0:0:0:0:0:0:0:1','登录','2018-02-26 15:02:15','登录失败',' huangbin'),(153,'0:0:0:0:0:0:0:1','登录','2018-02-26 15:02:21','登录失败',' huangbin'),(154,'0:0:0:0:0:0:0:1','登录','2018-02-26 15:03:41','登录失败',' huangbin'),(155,'0:0:0:0:0:0:0:1','登录','2018-02-26 15:04:09','登录成功','huangbin'),(156,'0:0:0:0:0:0:0:1','登录','2018-02-26 17:22:50','登录成功','huangbin'),(157,'0:0:0:0:0:0:0:1','登录','2018-02-26 17:30:59','登录成功','huangbin'),(158,'0:0:0:0:0:0:0:1','登录','2018-02-26 17:42:15','登录成功','huangbin'),(159,'0:0:0:0:0:0:0:1','登录','2018-02-26 17:47:28','登录成功','huangbin'),(160,'0:0:0:0:0:0:0:1','登录','2018-02-26 17:49:17','登录成功','huangbin'),(161,'0:0:0:0:0:0:0:1','登录','2018-02-26 17:50:43','登录成功','huangbin'),(162,'0:0:0:0:0:0:0:1','登录','2018-02-26 17:56:29','登录成功','huangbin'),(163,'0:0:0:0:0:0:0:1','登录','2018-02-26 17:58:24','登录成功','huangbin'),(164,'0:0:0:0:0:0:0:1','登录','2018-02-26 18:04:56','登录成功','huangbin'),(165,'0:0:0:0:0:0:0:1','登录','2018-02-26 18:08:09','登录成功','huangbin'),(166,'0:0:0:0:0:0:0:1','登录','2018-02-26 18:26:30','登录成功','huangbin'),(167,'0:0:0:0:0:0:0:1','登录','2018-02-26 20:09:34','登录成功','huangbin'),(168,'0:0:0:0:0:0:0:1','登录','2018-02-26 20:12:59','登录成功','huangbin'),(169,'0:0:0:0:0:0:0:1','登录','2018-02-26 20:15:01','登录成功','huangbin'),(170,'0:0:0:0:0:0:0:1','登录','2018-02-26 20:20:16','登录成功','huangbin'),(171,'0:0:0:0:0:0:0:1','登录','2018-02-26 20:36:40','登录成功','huangbin'),(172,'0:0:0:0:0:0:0:1','登录','2018-02-26 22:07:00','登录成功','huangbin'),(173,'0:0:0:0:0:0:0:1','登录','2018-02-26 22:09:45','登录成功','huangbin'),(174,'0:0:0:0:0:0:0:1','登录','2018-02-26 22:12:31','登录成功','huangbin'),(175,'0:0:0:0:0:0:0:1','登录','2018-02-26 22:21:13','登录成功','huangbin'),(176,'0:0:0:0:0:0:0:1','登录','2018-02-26 22:22:54','登录成功','huangbin'),(177,'0:0:0:0:0:0:0:1','登录','2018-02-26 22:24:09','登录成功','huangbin'),(178,'0:0:0:0:0:0:0:1','登录','2018-02-26 22:26:19','登录成功','huangbin'),(179,'0:0:0:0:0:0:0:1','登录','2018-02-26 22:28:27','登录成功','huangbin'),(180,'0:0:0:0:0:0:0:1','登录','2018-02-26 22:31:09','登录成功','huangbin'),(181,'0:0:0:0:0:0:0:1','登录','2018-02-26 22:31:24','登录成功','huangbin'),(182,'0:0:0:0:0:0:0:1','登录','2018-02-26 22:40:43','登录成功','huangbin'),(183,'0:0:0:0:0:0:0:1','登录','2018-02-26 22:43:23','登录成功','huangbin'),(184,'0:0:0:0:0:0:0:1','登录','2018-02-26 22:45:07','登录成功','huangbin'),(185,'0:0:0:0:0:0:0:1','登录','2018-02-26 22:47:54','登录成功','huangbin'),(186,'0:0:0:0:0:0:0:1','登录','2018-02-26 22:53:14','登录成功','huangbin'),(187,'0:0:0:0:0:0:0:1','登录','2018-02-27 06:11:11','登录成功','huangbin'),(188,'0:0:0:0:0:0:0:1','登录','2018-02-27 06:20:35','登录成功','huangbin'),(189,'0:0:0:0:0:0:0:1','登录','2018-02-27 06:23:09','登录成功','huangbin'),(190,'0:0:0:0:0:0:0:1','登录','2018-02-27 06:28:37','登录成功','huangbin'),(191,'0:0:0:0:0:0:0:1','登录','2018-02-27 06:30:10','登录成功','huangbin'),(192,'0:0:0:0:0:0:0:1','登录','2018-02-27 06:32:59','登录成功','huangbin'),(193,'0:0:0:0:0:0:0:1','登录','2018-02-27 06:40:21','登录成功','huangbin'),(194,'0:0:0:0:0:0:0:1','登录','2018-02-27 06:40:37','登录成功','huangbin'),(195,'0:0:0:0:0:0:0:1','登录','2018-02-27 06:42:32','登录成功','huangbin'),(196,'0:0:0:0:0:0:0:1','登录','2018-02-27 06:45:30','登录成功','huangbin'),(197,'0:0:0:0:0:0:0:1','登录','2018-02-27 06:46:53','登录成功','huangbin'),(198,'0:0:0:0:0:0:0:1','登录','2018-02-27 06:48:25','登录成功','huangbin'),(199,'0:0:0:0:0:0:0:1','登录','2018-02-27 06:49:11','登录成功','huangbin'),(200,'0:0:0:0:0:0:0:1','登录','2018-02-27 06:49:27','登录成功','huangbin'),(201,'0:0:0:0:0:0:0:1','登录','2018-02-27 06:50:34','登录成功','huangbin'),(202,'0:0:0:0:0:0:0:1','登录','2018-02-27 06:52:17','登录成功','huangbin'),(203,'0:0:0:0:0:0:0:1','登录','2018-02-27 06:52:32','登录成功','huangbin'),(204,'0:0:0:0:0:0:0:1','登录','2018-02-27 06:54:55','登录成功','huangbin'),(205,'0:0:0:0:0:0:0:1','登录','2018-02-27 06:56:53','登录成功','huangbin'),(206,'0:0:0:0:0:0:0:1','登录','2018-02-27 06:58:52','登录成功','huangbin'),(207,'0:0:0:0:0:0:0:1','登录','2018-02-27 07:03:06','登录成功','huangbin'),(208,'0:0:0:0:0:0:0:1','登录','2018-02-27 07:06:57','登录成功','huangbin'),(209,'0:0:0:0:0:0:0:1','登录','2018-02-27 07:15:30','登录成功','huangbin'),(210,'0:0:0:0:0:0:0:1','登录','2018-02-27 07:17:07','登录成功','huangbin'),(211,'0:0:0:0:0:0:0:1','登录','2018-02-27 07:17:22','登录成功','huangbin'),(212,'0:0:0:0:0:0:0:1','登录','2018-02-27 07:19:02','登录成功','huangbin'),(213,'0:0:0:0:0:0:0:1','登录','2018-02-27 07:21:34','登录成功','huangbin'),(214,'0:0:0:0:0:0:0:1','登录','2018-02-27 07:25:36','登录成功','huangbin'),(215,'0:0:0:0:0:0:0:1','登录','2018-02-27 07:29:52','登录成功','huangbin'),(216,'0:0:0:0:0:0:0:1','登录','2018-02-27 07:31:50','登录成功','huangbin');
/*!40000 ALTER TABLE `t_user_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user_role`
--

DROP TABLE IF EXISTS `t_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户',
  `role_id` bigint(20) NOT NULL COMMENT '角色',
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FK_4uvv76e86ms8ru0kk9s01d3s2` (`role_id`),
  CONSTRAINT `FK_4uvv76e86ms8ru0kk9s01d3s2` FOREIGN KEY (`role_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `FK_kefwen29p9h9ilvry31mgyc94` FOREIGN KEY (`user_id`) REFERENCES `t_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户角色信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user_role`
--

LOCK TABLES `t_user_role` WRITE;
/*!40000 ALTER TABLE `t_user_role` DISABLE KEYS */;
INSERT INTO `t_user_role` VALUES (1,1),(2,1);
/*!40000 ALTER TABLE `t_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `v_etl_table_tree`
--

DROP TABLE IF EXISTS `v_etl_table_tree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_etl_table_tree` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `p_id` bigint(20) DEFAULT NULL,
  `t` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `v_etl_table_tree`
--

LOCK TABLES `v_etl_table_tree` WRITE;
/*!40000 ALTER TABLE `v_etl_table_tree` DISABLE KEYS */;
/*!40000 ALTER TABLE `v_etl_table_tree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_role_auth_view`
--

DROP TABLE IF EXISTS `v_role_auth_view`;
/*!50001 DROP VIEW IF EXISTS `v_role_auth_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_role_auth_view` AS SELECT 
 1 AS `id`,
 1 AS `resource_code`,
 1 AS `resource_level`,
 1 AS `resource_name`,
 1 AS `resource_desc`,
 1 AS `icon_class`,
 1 AS `role_id`,
 1 AS `parent_id`,
 1 AS `app_name`,
 1 AS `resource_url`,
 1 AS `sort_no`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `v_role_auth_view`
--

/*!50001 DROP VIEW IF EXISTS `v_role_auth_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_role_auth_view` AS select `r`.`id` AS `id`,`r`.`resource_code` AS `resource_code`,`r`.`resource_level` AS `resource_level`,`r`.`resource_name` AS `resource_name`,`r`.`description` AS `resource_desc`,`r`.`icon_class` AS `icon_class`,`rr`.`role_id` AS `role_id`,`r`.`parent_id` AS `parent_id`,`r`.`app_name` AS `app_name`,`r`.`resource_url` AS `resource_url`,`r`.`sort_no` AS `sort_no` from (`t_resource` `r` left join `t_role_resource` `rr` on((`r`.`id` = `rr`.`resource_id`))) order by `rr`.`role_id`,`r`.`resource_code` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-27  7:36:28
