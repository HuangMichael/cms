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
-- Table structure for table `t_app`
--

DROP TABLE IF EXISTS `t_app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_app` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `app_desc` varchar(50) NOT NULL,
  `table_config_id` bigint(20) DEFAULT NULL,
  `sort_no` varchar(20) DEFAULT NULL,
  `status` varchar(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_dka4vtlp3vmt99em1kyvtx9i3` (`table_config_id`),
  CONSTRAINT `FK_dka4vtlp3vmt99em1kyvtx9i3` FOREIGN KEY (`table_config_id`) REFERENCES `t_table_config` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_app`
--

LOCK TABLES `t_app` WRITE;
/*!40000 ALTER TABLE `t_app` DISABLE KEYS */;
INSERT INTO `t_app` VALUES (1,'message','留言管理',1,'1','1'),(2,'template','模板管理',NULL,'1','1'),(3,'review','初审列表',NULL,'1','1'),(4,'media','多媒体管理',NULL,'1','1'),(5,'member','会员管理',NULL,'1','1'),(6,'memberWorks','会员作品',26,NULL,'1'),(7,'site','站点管理',NULL,'1','1'),(8,'columns','栏目管理',NULL,'1','1'),(9,'tableConfig','数据表配置',NULL,'1','1'),(10,'tableColumnConfig','数据列配置',12,NULL,'1'),(11,'columnsContent','栏目内容',2,'1','1'),(12,'pavilionAuthor','展馆作者',3,'1','1'),(13,'pavilionWorks','展馆作品',28,NULL,'1'),(14,'columns','栏目信息',23,NULL,'1'),(15,'columnsContent','栏目内容',24,NULL,'1'),(16,'member','会员信息',25,NULL,'1'),(17,'pavilionAuthor','作品作者',27,NULL,'1');
/*!40000 ALTER TABLE `t_app` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_app_search`
--

DROP TABLE IF EXISTS `t_app_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_app_search` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `has_auth_key` varchar(1) DEFAULT NULL,
  `search_desc` varchar(20) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `app_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_m3ytk74yhn3b1unquidlmaohg` (`app_id`),
  CONSTRAINT `FK_m3ytk74yhn3b1unquidlmaohg` FOREIGN KEY (`app_id`) REFERENCES `t_app` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_app_search`
--

LOCK TABLES `t_app_search` WRITE;
/*!40000 ALTER TABLE `t_app_search` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_app_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_base_menu`
--

DROP TABLE IF EXISTS `t_base_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_base_menu` (
  `id` bigint(20) NOT NULL DEFAULT '0' COMMENT '序号',
  `resource_code` varchar(20) NOT NULL COMMENT '资源编号',
  `app_name` varchar(50) DEFAULT NULL COMMENT '应用名称',
  `resource_level` bigint(20) DEFAULT NULL COMMENT '级别',
  `resource_name` varchar(20) NOT NULL COMMENT '资源名称',
  `resource_url` varchar(100) NOT NULL COMMENT '资源路径',
  `static_flag` varchar(1) DEFAULT NULL COMMENT '静态标识',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上级节点',
  `icon_class` varchar(50) DEFAULT NULL COMMENT '图标',
  `sort_no` bigint(20) DEFAULT NULL COMMENT '排序',
  `status` varchar(1) DEFAULT NULL COMMENT '启用状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_base_menu`
--

LOCK TABLES `t_base_menu` WRITE;
/*!40000 ALTER TABLE `t_base_menu` DISABLE KEYS */;
INSERT INTO `t_base_menu` VALUES (96,'050401','ROLE',3,'新建记录','onclick=\'add()\'','0',7,'glyphicon glyphicon-plus',1,'1'),(97,'050402','ROLE',3,'编辑记录','onclick=\'edit()\'','0',7,'glyphicon glyphicon-edit',2,'1'),(98,'050403','ROLE',3,'保存记录','onclick=\'save()\'','0',7,'glyphicon glyphicon-save',3,'1'),(99,'050404','ROLE',3,'删除记录','onclick=\'del()\'','0',7,'glyphicon glyphicon-remove',4,'1'),(100,'050405','ROLE',3,'上一条','onclick=\'backwards()\'','0',7,'glyphicon glyphicon-backward',5,'1'),(101,'050406','ROLE',3,'下一条','onclick=\'forwards()\'','0',7,'glyphicon glyphicon-forward',6,'1');
/*!40000 ALTER TABLE `t_base_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_basic_menu`
--

DROP TABLE IF EXISTS `t_basic_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_basic_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(100) DEFAULT NULL,
  `icon_class` varchar(100) DEFAULT NULL,
  `menu_code` varchar(10) NOT NULL,
  `menu_level` bigint(20) DEFAULT NULL,
  `menu_name` varchar(20) NOT NULL,
  `menu_url` varchar(100) DEFAULT NULL,
  `sort_no` bigint(20) DEFAULT NULL,
  `static_flag` bit(1) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_mjbo9sao6qrm3y69u3w21uwck` (`parent_id`),
  CONSTRAINT `FK_mjbo9sao6qrm3y69u3w21uwck` FOREIGN KEY (`parent_id`) REFERENCES `t_basic_menu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_basic_menu`
--

LOCK TABLES `t_basic_menu` WRITE;
/*!40000 ALTER TABLE `t_basic_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_basic_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_budget`
--

DROP TABLE IF EXISTS `t_budget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_budget` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `accessory_name` varchar(50) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `applicant` varchar(50) DEFAULT NULL,
  `apply_date` varchar(20) DEFAULT NULL,
  `apply_dep` varchar(50) DEFAULT NULL,
  `approver` varchar(10) DEFAULT NULL,
  `auth_key` varchar(20) DEFAULT NULL,
  `handler` varchar(10) DEFAULT NULL,
  `purpose` varchar(50) DEFAULT NULL,
  `receiver` varchar(10) DEFAULT NULL,
  `specifications` varchar(50) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `eq_class_id` bigint(20) DEFAULT NULL,
  `location_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_8cutfbty5bsvrtg2i05gfpjw4` (`eq_class_id`),
  KEY `FK_7al2v1etp24kqmxcmbad0idmt` (`location_id`),
  CONSTRAINT `FK_7al2v1etp24kqmxcmbad0idmt` FOREIGN KEY (`location_id`) REFERENCES `t_location` (`id`),
  CONSTRAINT `FK_8cutfbty5bsvrtg2i05gfpjw4` FOREIGN KEY (`eq_class_id`) REFERENCES `t_eq_class` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_budget`
--

LOCK TABLES `t_budget` WRITE;
/*!40000 ALTER TABLE `t_budget` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_budget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_cangwei`
--

DROP TABLE IF EXISTS `t_cangwei`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_cangwei` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bdbl` double DEFAULT NULL,
  `cgs` bigint(20) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `gdmc` varchar(20) DEFAULT NULL,
  `gdxz` varchar(20) DEFAULT NULL,
  `gflx` varchar(20) DEFAULT NULL,
  `mc` bigint(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `rq` varchar(20) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `zj` bigint(20) DEFAULT NULL,
  `zltgbcgbl` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_cangwei`
--

LOCK TABLES `t_cangwei` WRITE;
/*!40000 ALTER TABLE `t_cangwei` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_cangwei` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_columns`
--

DROP TABLE IF EXISTS `t_columns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_columns` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `name` varchar(20) NOT NULL COMMENT '栏目名称',
  `col_desc` varchar(20) NOT NULL COMMENT '栏目描述',
  `begin_time` varchar(20) DEFAULT NULL COMMENT '开始时间',
  `end_time` varchar(20) DEFAULT NULL COMMENT '结束时间',
  `type` varchar(20) NOT NULL COMMENT '栏目类型',
  `site_id` bigint(20) DEFAULT NULL COMMENT '所属站点',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上级栏目',
  `sort_no` varchar(20) DEFAULT NULL COMMENT '排序',
  `status` varchar(1) NOT NULL COMMENT '状态',
  `auth_key` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_h4ro9kvk9hk6qs2q73efm992x` (`site_id`),
  KEY `FK_3e3xu81rwknifer9r8339bvr9` (`parent_id`),
  CONSTRAINT `FK_3e3xu81rwknifer9r8339bvr9` FOREIGN KEY (`parent_id`) REFERENCES `t_columns` (`id`),
  CONSTRAINT `FK_h4ro9kvk9hk6qs2q73efm992x` FOREIGN KEY (`site_id`) REFERENCES `t_site` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_columns`
--

LOCK TABLES `t_columns` WRITE;
/*!40000 ALTER TABLE `t_columns` DISABLE KEYS */;
INSERT INTO `t_columns` VALUES (1,'首页','1','2018-03-04 16:11:02','2018-03-04 16:11:02','1',1,NULL,'1','1','BJ10'),(2,'协会大事','1','2018-03-04 16:11:02','2018-03-04 16:11:02','1',1,NULL,'1','1','BJ10'),(6,'首页','首页','2018-01-02','2018-03-09','1',1,NULL,NULL,'1','BJ10');
/*!40000 ALTER TABLE `t_columns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_columns_content`
--

DROP TABLE IF EXISTS `t_columns_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_columns_content` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `title` varchar(20) NOT NULL COMMENT '标题',
  `content` longtext NOT NULL COMMENT '内容',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `focus_pic_url` varchar(100) NOT NULL COMMENT '焦点图片',
  `columns_id` bigint(20) DEFAULT NULL COMMENT '所属栏目',
  `site_id` bigint(20) DEFAULT NULL COMMENT '站点',
  `create_time` varchar(20) NOT NULL COMMENT '创建时间',
  `release_time` varchar(20) NOT NULL COMMENT '发布时间',
  `audit_status` varchar(10) NOT NULL COMMENT '审核状态',
  `status` varchar(1) NOT NULL COMMENT '状态',
  `sort_no` bigint(20) DEFAULT NULL COMMENT '排序',
  `auth_key` varchar(20) DEFAULT NULL COMMENT '授权码',
  PRIMARY KEY (`id`),
  KEY `FK_5ybls0nate0ir21ermfjrgqwg` (`columns_id`),
  KEY `FK_diio7v78wh31aqf3xdw5w0dy9` (`site_id`),
  CONSTRAINT `FK_5ybls0nate0ir21ermfjrgqwg` FOREIGN KEY (`columns_id`) REFERENCES `t_columns` (`id`),
  CONSTRAINT `FK_diio7v78wh31aqf3xdw5w0dy9` FOREIGN KEY (`site_id`) REFERENCES `t_site` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_columns_content`
--

LOCK TABLES `t_columns_content` WRITE;
/*!40000 ALTER TABLE `t_columns_content` DISABLE KEYS */;
INSERT INTO `t_columns_content` VALUES (1,'十九大闭幕','十九大闭幕','huangbin','1',1,1,'','','2','1',NULL,NULL),(2,'兰州房价调控涨幅下降','兰州房价调控涨幅下降','huangbin','1',1,1,'','','1','1',NULL,NULL),(3,'雁滩公园元宵灯会','雁滩公园元宵灯会','huangbin','1',1,1,'','','1','1',NULL,NULL),(4,'十九大闭幕','十九大闭幕','huangbin','1',1,1,'','','1','1',NULL,NULL),(5,'兰州房价调控涨幅下降','兰州房价调控涨幅下降','huangbin','1',1,1,'','','0','1',NULL,NULL),(6,'雁滩公园元宵灯会','雁滩公园元宵灯会','huangbin','1',1,1,'','','1','1',NULL,NULL);
/*!40000 ALTER TABLE `t_columns_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_ec_budget`
--

DROP TABLE IF EXISTS `t_ec_budget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_ec_budget` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amount` varchar(20) DEFAULT NULL,
  `applicant` varchar(20) DEFAULT NULL,
  `apply_date` varchar(20) DEFAULT NULL,
  `audit_date` varchar(20) DEFAULT NULL,
  `auditor` varchar(20) DEFAULT NULL,
  `auth_key` varchar(20) DEFAULT NULL,
  `confirm_reason` varchar(20) DEFAULT NULL,
  `ec_name` varchar(20) DEFAULT NULL,
  `fix_advice` varchar(20) DEFAULT NULL,
  `leader_advice` varchar(20) DEFAULT NULL,
  `permitted` varchar(20) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `update_reason` varchar(20) DEFAULT NULL,
  `location_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_5lycjy91j4hjfxk42btp2mj67` (`location_id`),
  CONSTRAINT `FK_5lycjy91j4hjfxk42btp2mj67` FOREIGN KEY (`location_id`) REFERENCES `t_location` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_ec_budget`
--

LOCK TABLES `t_ec_budget` WRITE;
/*!40000 ALTER TABLE `t_ec_budget` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_ec_budget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_eq_class`
--

DROP TABLE IF EXISTS `t_eq_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_eq_class` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `class_level` bigint(20) DEFAULT NULL,
  `has_child` varchar(1) DEFAULT NULL,
  `limit_hours` bigint(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `sort_no` bigint(20) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_4ldxl2aq8lxus75q9c38hg9an` (`parent_id`),
  CONSTRAINT `FK_4ldxl2aq8lxus75q9c38hg9an` FOREIGN KEY (`parent_id`) REFERENCES `t_eq_class` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_eq_class`
--

LOCK TABLES `t_eq_class` WRITE;
/*!40000 ALTER TABLE `t_eq_class` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_eq_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_equipment`
--

DROP TABLE IF EXISTS `t_equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_equipment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `auth_key` varchar(20) DEFAULT NULL,
  `description` varchar(20) DEFAULT NULL,
  `eam_no` varchar(20) DEFAULT NULL,
  `eq_code` varchar(20) DEFAULT NULL,
  `eq_model` varchar(50) DEFAULT NULL,
  `expected_year` bigint(20) DEFAULT NULL,
  `maintainer` varchar(20) DEFAULT NULL,
  `manage_level` bigint(20) DEFAULT NULL,
  `manager` varchar(20) DEFAULT NULL,
  `net_value` double DEFAULT NULL,
  `original_value` double DEFAULT NULL,
  `product_date` varchar(255) DEFAULT NULL,
  `product_factory` varchar(50) DEFAULT NULL,
  `purchase_date` varchar(255) DEFAULT NULL,
  `purchase_price` double DEFAULT NULL,
  `run_date` varchar(255) DEFAULT NULL,
  `running` varchar(1) DEFAULT NULL,
  `setup_date` varchar(255) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `warranty_period` varchar(255) DEFAULT NULL,
  `eq_class_id` bigint(20) DEFAULT NULL,
  `location_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_r5ya4ap66cuujml9n8o6y0kqv` (`eq_code`),
  KEY `FK_jau1cw3ijvgyp4fh43rnvbw3e` (`eq_class_id`),
  KEY `FK_sji9a9yy9du7u9gwc6ndu41gq` (`location_id`),
  CONSTRAINT `FK_jau1cw3ijvgyp4fh43rnvbw3e` FOREIGN KEY (`eq_class_id`) REFERENCES `t_eq_class` (`id`),
  CONSTRAINT `FK_sji9a9yy9du7u9gwc6ndu41gq` FOREIGN KEY (`location_id`) REFERENCES `t_location` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_equipment`
--

LOCK TABLES `t_equipment` WRITE;
/*!40000 ALTER TABLE `t_equipment` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_equipment` ENABLE KEYS */;
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
-- Table structure for table `t_location`
--

DROP TABLE IF EXISTS `t_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_location` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `auth_key` varchar(20) NOT NULL,
  `loc_code` varchar(30) DEFAULT NULL,
  `loc_desc` varchar(100) DEFAULT NULL,
  `loc_level` bigint(20) NOT NULL,
  `loc_name` varchar(100) DEFAULT NULL,
  `loc_type` varchar(1) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `status` varchar(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_location`
--

LOCK TABLES `t_location` WRITE;
/*!40000 ALTER TABLE `t_location` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_material_cost`
--

DROP TABLE IF EXISTS `t_material_cost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_material_cost` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amount` int(11) DEFAULT NULL,
  `applicant` varchar(20) DEFAULT NULL,
  `apply_date` varchar(20) DEFAULT NULL,
  `auth_key` varchar(20) DEFAULT NULL,
  `ec_name` varchar(50) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `location_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_56f1jxo272d2v1ujnnkamkm5q` (`location_id`),
  CONSTRAINT `FK_56f1jxo272d2v1ujnnkamkm5q` FOREIGN KEY (`location_id`) REFERENCES `t_location` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_material_cost`
--

LOCK TABLES `t_material_cost` WRITE;
/*!40000 ALTER TABLE `t_material_cost` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_material_cost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_media`
--

DROP TABLE IF EXISTS `t_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_media` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `auth_key` varchar(10) NOT NULL,
  `file_absolute_url` varchar(200) DEFAULT NULL,
  `file_name` varchar(50) NOT NULL,
  `file_relative_url` varchar(200) NOT NULL,
  `file_size` bigint(20) NOT NULL,
  `memo` varchar(100) DEFAULT NULL,
  `status` varchar(1) NOT NULL,
  `thumb_nail_url` varchar(200) DEFAULT NULL,
  `upload_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_media`
--

LOCK TABLES `t_media` WRITE;
/*!40000 ALTER TABLE `t_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_member`
--

DROP TABLE IF EXISTS `t_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `card_no` varchar(20) NOT NULL COMMENT '会员卡号',
  `name` varchar(20) NOT NULL COMMENT '会员姓名',
  `create_time` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `enter_date` varchar(20) DEFAULT NULL COMMENT '加入时间',
  `has_photo` varchar(1) DEFAULT NULL COMMENT '是否有照片',
  `photo_url` varchar(255) DEFAULT NULL COMMENT '照片路径',
  `member_type` varchar(1) DEFAULT NULL COMMENT '会员类型',
  `sort_no` bigint(20) DEFAULT NULL COMMENT '排序',
  `status` varchar(1) DEFAULT NULL COMMENT '状态',
  `auth_key` varchar(20) DEFAULT NULL COMMENT '授权码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='会员信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_member`
--

LOCK TABLES `t_member` WRITE;
/*!40000 ALTER TABLE `t_member` DISABLE KEYS */;
INSERT INTO `t_member` VALUES (1,'01','黄斌','2010-01-01 00:00:00','2030-01-01 00:00:00','1','/upload/member/2018031111040497086.jpg','1',1,'1','BJ10'),(2,'02','张超','2010-01-01 00:00:00','2030-01-01 00:00:00','1','upload/member/2018031111040497086.jpg','1',2,'1','BJ10'),(4,'04','李永成','2010-01-01 00:00:00','2030-01-01 00:00:00','1','upload/member/头像.jpg','1',4,'1','BJ10'),(6,'06','张品忠','2010-01-01 00:00:00','2030-01-01 00:00:00','1','upload/member/2018031111040497086.jpg','1',6,'1','BJ10'),(7,'07','顾晓英','2010-01-01 00:00:00','2030-01-01 00:00:00','1','/upload/member/女士.jpg','1',7,'1','BJ10'),(8,'00012','张三','2018-02-28','2018-03-15',NULL,NULL,'1',NULL,'1','BJ10'),(9,'00012','招商银行深圳分行','2018-03-01','2018-02-27',NULL,NULL,'1',NULL,'1','BJ10');
/*!40000 ALTER TABLE `t_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_member_works`
--

DROP TABLE IF EXISTS `t_member_works`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_member_works` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `name` varchar(50) NOT NULL COMMENT '作品名称',
  `photo_url` varchar(200) DEFAULT NULL COMMENT '作品照片路径',
  `is_focus` varchar(1) NOT NULL COMMENT '是否焦点',
  `release_time` varchar(20) DEFAULT NULL COMMENT '发布时间',
  `upload_time` varchar(20) DEFAULT NULL COMMENT '上传时间',
  `works_type` varchar(1) DEFAULT NULL COMMENT '作品类型',
  `member_id` bigint(20) DEFAULT NULL COMMENT '会员',
  `unit_id` bigint(20) DEFAULT NULL COMMENT '协会',
  `sort_no` bigint(20) DEFAULT NULL COMMENT '排序',
  `status` varchar(1) NOT NULL COMMENT '状态',
  `auth_key` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_auc66en6ynpj7yg3f6fs8u5g8` (`unit_id`),
  CONSTRAINT `FK_auc66en6ynpj7yg3f6fs8u5g8` FOREIGN KEY (`unit_id`) REFERENCES `t_unit` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_member_works`
--

LOCK TABLES `t_member_works` WRITE;
/*!40000 ALTER TABLE `t_member_works` DISABLE KEYS */;
INSERT INTO `t_member_works` VALUES (4,'招商银行深圳分行','1','1','2018-02-26','2018-02-27','1',1,1,1,'1','BJ10'),(6,'文艺评论家协会','1','1','2018-02-26','2018-02-27','1',1,1,1,'1','BJ10');
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
-- Table structure for table `t_message`
--

DROP TABLE IF EXISTS `t_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_message` (
  `id` int(11) NOT NULL,
  `content` varchar(45) DEFAULT NULL,
  `sort_no` int(11) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `columns_id` bigint(20) DEFAULT NULL,
  `site_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_jj94v6e80f3toxannglpi587o` (`columns_id`),
  KEY `FK_l1brnj4pgfjehneq941r92v6x` (`site_id`),
  CONSTRAINT `FK_jj94v6e80f3toxannglpi587o` FOREIGN KEY (`columns_id`) REFERENCES `t_columns` (`id`),
  CONSTRAINT `FK_l1brnj4pgfjehneq941r92v6x` FOREIGN KEY (`site_id`) REFERENCES `t_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_message`
--

LOCK TABLES `t_message` WRITE;
/*!40000 ALTER TABLE `t_message` DISABLE KEYS */;
INSERT INTO `t_message` VALUES (1,'12312312',1,'1',NULL,NULL),(2,'1231231x3',1,'1',NULL,NULL),(3,'123123123123',1,'1',NULL,NULL);
/*!40000 ALTER TABLE `t_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_operate_log`
--

DROP TABLE IF EXISTS `t_operate_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_operate_log` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='t_operate_log';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_operate_log`
--

LOCK TABLES `t_operate_log` WRITE;
/*!40000 ALTER TABLE `t_operate_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_operate_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_pavilion_author`
--

DROP TABLE IF EXISTS `t_pavilion_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_pavilion_author` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `name` varchar(20) NOT NULL COMMENT '作者姓名',
  `has_photo` varchar(1) DEFAULT NULL COMMENT '是否有照片',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `photo_url` varchar(255) DEFAULT NULL COMMENT '作者照片',
  `status` varchar(1) NOT NULL COMMENT '状态',
  `sort_no` bigint(20) DEFAULT NULL COMMENT '排序',
  `auth_key` varchar(20) DEFAULT NULL COMMENT '授权码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_pavilion_author`
--

LOCK TABLES `t_pavilion_author` WRITE;
/*!40000 ALTER TABLE `t_pavilion_author` DISABLE KEYS */;
INSERT INTO `t_pavilion_author` VALUES (1,'黄斌','1','2012-01-01 00:00:00','/upload/pavilionAuthor/头像.jpg','1',1,NULL),(2,'张三','1','2012-01-01 00:00:00','/upload/pavilionAuthor/头像.jpg','1',1,NULL),(3,'李四','1','2012-01-01 00:00:00','/upload/pavilionAuthor/头像.jpg','1',1,NULL),(4,'王五','0','2012-01-01 00:00:00',NULL,'1',1,NULL),(5,'郭六','0','2012-01-01 00:00:00',NULL,'1',1,NULL),(6,'姚九','0','2012-01-01 00:00:00',NULL,'1',1,NULL);
/*!40000 ALTER TABLE `t_pavilion_author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_pavilion_works`
--

DROP TABLE IF EXISTS `t_pavilion_works`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_pavilion_works` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `name` varchar(20) NOT NULL COMMENT '作者姓名',
  `photo_url` varchar(200) DEFAULT NULL COMMENT '照片',
  `release_time` varchar(20) DEFAULT NULL COMMENT '发布时间',
  `upload_time` varchar(20) DEFAULT NULL COMMENT '上传时间',
  `author_id` bigint(20) DEFAULT NULL COMMENT '作者',
  `columns_id` bigint(20) DEFAULT NULL COMMENT '栏目',
  `has_photo` varchar(1) DEFAULT NULL COMMENT '是否有照片',
  `is_focus` varchar(1) DEFAULT NULL COMMENT '是否焦点图片',
  `sort_no` bigint(20) DEFAULT NULL COMMENT '排序',
  `status` varchar(1) DEFAULT NULL COMMENT '状态',
  `auth_key` varchar(20) DEFAULT NULL COMMENT '授权码',
  PRIMARY KEY (`id`),
  KEY `FK_gkonxccpja969nvfbkhlkkwo0` (`columns_id`),
  KEY `FK_l5n62fkr1qbqbmu5r4luuceo6` (`author_id`),
  CONSTRAINT `FK_gkonxccpja969nvfbkhlkkwo0` FOREIGN KEY (`columns_id`) REFERENCES `t_columns` (`id`),
  CONSTRAINT `FK_l5n62fkr1qbqbmu5r4luuceo6` FOREIGN KEY (`author_id`) REFERENCES `t_pavilion_author` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_pavilion_works`
--

LOCK TABLES `t_pavilion_works` WRITE;
/*!40000 ALTER TABLE `t_pavilion_works` DISABLE KEYS */;
INSERT INTO `t_pavilion_works` VALUES (2,'招商银行深圳分行',NULL,'2018-02-26','2018-02-27',NULL,NULL,'1','1',NULL,'1','BJ10');
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
-- Table structure for table `t_pre_maint`
--

DROP TABLE IF EXISTS `t_pre_maint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_pre_maint` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `auth_key` varchar(20) DEFAULT NULL,
  `create_by` varchar(20) DEFAULT NULL,
  `create_time` varchar(20) DEFAULT NULL,
  `description` varchar(20) DEFAULT NULL,
  `pm_code` varchar(20) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `equipment_id` bigint(20) DEFAULT NULL,
  `unit_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_1eg6hp76y5iliaiu6tvphq5wr` (`equipment_id`),
  KEY `FK_2rxlu7msfve5wp1smfq32367e` (`unit_id`),
  CONSTRAINT `FK_1eg6hp76y5iliaiu6tvphq5wr` FOREIGN KEY (`equipment_id`) REFERENCES `t_equipment` (`id`),
  CONSTRAINT `FK_2rxlu7msfve5wp1smfq32367e` FOREIGN KEY (`unit_id`) REFERENCES `t_unit` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_pre_maint`
--

LOCK TABLES `t_pre_maint` WRITE;
/*!40000 ALTER TABLE `t_pre_maint` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_pre_maint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_pre_maint_plan`
--

DROP TABLE IF EXISTS `t_pre_maint_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_pre_maint_plan` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `auth_key` varchar(20) DEFAULT NULL,
  `cron` varchar(20) DEFAULT NULL,
  `exe_state` varchar(1) DEFAULT NULL,
  `plan_code` varchar(20) DEFAULT NULL,
  `plan_desc` varchar(20) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_en9x5sx4jklggbvv5rseh6yt2` (`plan_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_pre_maint_plan`
--

LOCK TABLES `t_pre_maint_plan` WRITE;
/*!40000 ALTER TABLE `t_pre_maint_plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_pre_maint_plan` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='系统资源信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_resource`
--

LOCK TABLES `t_resource` WRITE;
/*!40000 ALTER TABLE `t_resource` DISABLE KEYS */;
INSERT INTO `t_resource` VALUES (1,'0',NULL,0,'网站内容发布系统','','1',NULL,NULL,1,'1'),(2,'01',NULL,1,'统计分析','','1',1,'fa fa-tachometer fa-fw',1,'1'),(3,'0101',NULL,2,'发稿统计','href=\'/portal/index\'','1',2,NULL,3,'1'),(4,'02',NULL,1,'系统管理','','1',1,'fa fa-group fa-fw',2,'1'),(5,'0201',NULL,2,'用户信息','data-url=\'/user/list\'','1',4,NULL,1,'1'),(6,'0202',NULL,2,'人员信息','data-url=\'/person/list\'','1',4,NULL,2,'1'),(7,'0203',NULL,2,'角色信息','data-url=\'/role/list\'','1',4,NULL,3,'1'),(8,'0204',NULL,2,'应用授权','data-url=\'/authority/list\'','1',4,NULL,4,'1'),(9,'03',NULL,1,'站点管理','','1',1,'fa fa-file-text fa-fw',3,'1'),(10,'0301',NULL,2,'站点信息','data-url=\'/site/list\'','1',9,NULL,1,'1'),(11,'0302',NULL,2,'栏目信息','data-url=\'/columns/list\'','1',9,NULL,2,'1'),(12,'04',NULL,1,'会员管理','','1',1,'fa fa-table fa-fw',5,'1'),(13,'0401',NULL,2,'会员简介','data-url=\'/member/list\'','1',12,NULL,1,'1'),(14,'0402',NULL,2,'会员作品','data-url=\'/memberWorks/list\'','1',12,NULL,2,'1'),(32,'0501','USER',3,'新建记录','onclick=\'add()\'','1',5,'glyphicon glyphicon-plus',1,'1'),(33,'0502','USER',3,'编辑记录','onclick=\'edit()\'','1',5,'glyphicon glyphicon-edit',2,'1'),(34,'0503','USER',3,'保存记录','onclick=\'saveUser()\'','1',5,'glyphicon glyphicon-save',3,'1'),(38,'1201','',2,'资源管理','data-url=\'resource/list\'','0',4,'',5,'1'),(40,'3801','RESOURCE',3,'新建记录','onclick=\'add()\'','0',38,'glyphicon glyphicon-plus',1,'1'),(41,'3802','RESOURCE',3,'编辑记录','onclick=\'edit()\'','0',38,'glyphicon glyphicon-edit',2,'1'),(42,'3803','RESOURCE',3,'保存记录','onclick=\'save()\'','0',38,'glyphicon glyphicon-save',3,'1'),(43,'3804','RESOURCE',3,'删除记录','onclick=\'del()\'','0',38,'glyphicon glyphicon-remove',4,'1'),(56,'56',NULL,1,'网上展馆','','1',1,'fa fa-star fa-fw',6,'1'),(63,'56',NULL,2,'展馆作者','data-url=\'/pavilionAuthor/list\'','1',56,'fa fa-tachometer fa-fw',1,'1'),(64,'56',NULL,2,'展馆作品','data-url=\'/pavilionWorks/list\'','1',56,'fa fa-tachometer fa-fw',2,'1'),(71,'601','PERSON',3,'新建记录','onclick=\'add()\'','0',6,'glyphicon glyphicon-plus',1,'1'),(72,'602','PERSON',3,'编辑记录','onclick=\'edit()\'','0',6,'glyphicon glyphicon-edit',2,'1'),(73,'603','PERSON',3,'保存记录','onclick=\'save()\'','0',6,'glyphicon glyphicon-save',3,'1'),(74,'604','PERSON',3,'删除记录','onclick=\'del()\'','0',6,'glyphicon glyphicon-remove',4,'1'),(96,'050401','ROLE',3,'新建记录','onclick=\'add()\'','0',7,'glyphicon glyphicon-plus',1,'1'),(97,'050402','ROLE',3,'编辑记录','onclick=\'edit()\'','0',7,'glyphicon glyphicon-edit',2,'1'),(98,'050403','ROLE',3,'保存记录','onclick=\'save()\'','0',7,'glyphicon glyphicon-save',3,'1'),(99,'050404','ROLE',3,'删除记录','onclick=\'del()\'','0',7,'glyphicon glyphicon-remove',4,'1'),(102,'102',NULL,1,'审核发布','','1',1,'fa fa-tachometer fa-fw',7,'1'),(103,'56',NULL,2,'审核列表','data-url=\'review/list\'','1',102,'fa fa-tachometer fa-fw',1,'1'),(112,'56',NULL,2,'复审列表','data-url=\'review/list\'','1',102,'fa fa-tachometer fa- tables',2,'1'),(116,'105',NULL,2,'内容信息','data-url=\'columnsContent/list\'','1',9,'fa fa-tachometer fa-fw',3,'1'),(131,'1001','SITE',3,'新建记录','onclick=\'add()\'','1',10,'glyphicon glyphicon-plus',1,'1'),(159,'0206','',2,'数据授权','data-url=\'authorityData/list\'','0',4,NULL,6,'1'),(160,'020601','AUTHORITYDATA',3,'添加人员','onClick=\'grant()\'','0',159,'glyphicon glyphicon-user',1,'1'),(161,'08','',1,'数据导入','数据导入','0',1,'fa fa-group fa-fw',8,'1'),(162,'0801','',2,'数据导入表信息','data-url=\'/etlTable/list\'','0',161,'1',1,'1'),(163,'0802','',2,'导入表配置','data-url=\'/etl/list\'','0',161,'1',2,'1'),(164,'080101','ETLTABLE',3,'新建记录','onclick=\'add()\'','0',162,'glyphicon glyphicon-plus',1,'1'),(165,'080102','ETLTABLE',3,'编辑记录','onclick=\'edit()\'','0',162,'glyphicon glyphicon-edit',2,'1'),(166,'080103','ETLTABLE',3,'保存记录','onclick=\'save()\'','0',162,'glyphicon glyphicon-save',3,'1'),(167,'080104','ETLTABLE',3,'删除记录','onclick=\'del()\'','0',162,'glyphicon glyphicon-remove',4,'1'),(170,'080107','ETLTABLE',3,'提取配置项','onclick=\'extractConfig()\'','0',162,'glyphicon glyphicon-import',7,'1'),(171,'02',NULL,1,'开发管理','','1',1,'fa fa-group fa-fw',9,'1'),(172,'0201',NULL,2,'应用配置','data-url=\'/app/list\'','1',171,NULL,1,'1'),(173,'020101','APP',3,'新建记录','onclick=\'add()\'','0',172,'glyphicon glyphicon-plus',1,'1'),(174,'020102','APP',3,'编辑记录','onclick=\'edit()\'','0',172,'glyphicon glyphicon-edit',2,'1'),(175,'020103','APP',3,'保存记录','onclick=\'save()\'','0',172,'glyphicon glyphicon-save',3,'1'),(176,'020104','APP',3,'删除记录','onclick=\'del()\'','0',172,'glyphicon glyphicon-remove',4,'1'),(179,'020107','APP',3,'生成应用','onclick=\'genApp()\'','0',172,'glyphicon glyphicon-import',7,'1'),(181,'0202',NULL,2,'模板管理','data-url=\'/template/list\'','1',171,NULL,2,'1'),(182,'0403',NULL,2,'多媒体管理','data-url=\'/media/list\'','1',12,NULL,3,'1'),(183,'0203',NULL,2,'数据表配置','data-url=\'/tableConfig/list\'','1',171,NULL,3,'1'),(184,'050401','MEMBER',3,'新建记录','onclick=\'add()\'','0',12,'glyphicon glyphicon-plus',1,'1'),(190,'050401','MEMBERWORKS',3,'新建记录','onclick=\'add()\'','0',14,'glyphicon glyphicon-plus',1,'1'),(196,'56',NULL,2,'终审列表','data-url=\'review/list\'','1',102,'fa fa-tachometer fa-fw',3,'1'),(197,'050402','REVIEW',3,'提交复审','onclick=\'edit()\'','0',103,'glyphicon glyphicon-edit',2,'1'),(198,'050403','REVIEW',3,'提交发布','onclick=\'save()\'','0',103,'glyphicon glyphicon-save',3,'1'),(199,'050404','REVIEW',3,'退回','onclick=\'del()\'','0',103,'glyphicon glyphicon-remove',4,'1'),(200,'050405','REVIEW',3,'转报','onclick=\'backwards()\'','0',103,'glyphicon glyphicon-backward',5,'1'),(201,'050406','REVIEW',3,'已初审列表','onclick=\'forwards()\'','0',103,'glyphicon glyphicon-forward',6,'1'),(202,'050402','REVIEW',3,'提交复审','onclick=\'edit()\'','0',112,'glyphicon glyphicon-edit',2,'1'),(203,'050403','REVIEW',3,'提交发布','onclick=\'save()\'','0',112,'glyphicon glyphicon-save',3,'1'),(204,'050404','REVIEW',3,'退回','onclick=\'del()\'','0',112,'glyphicon glyphicon-remove',4,'1'),(205,'050405','REVIEW',3,'转报','onclick=\'backwards()\'','0',112,'glyphicon glyphicon-backward',5,'1'),(206,'050406','COLUMNSCONTENT',3,'新建记录','onclick=\'forwards()\'','0',112,'glyphicon glyphicon-forward',6,'1'),(207,'050402','COLUMNSCONTENT',3,'添加焦点图片','onclick=\'edit()\'','0',116,'glyphicon glyphicon-edit',2,'1'),(208,'050403','COLUMNSCONTENT',3,'推荐|取消推荐','onclick=\'save()\'','0',116,'glyphicon glyphicon-save',3,'1'),(209,'050404','COLUMNSCONTENT',3,'撤销发布','onclick=\'del()\'','0',116,'glyphicon glyphicon-remove',4,'1'),(210,'050405','COLUMNSCONTENT',3,'转报','onclick=\'backwards()\'','0',116,'glyphicon glyphicon-backward',5,'1'),(211,'050406','COLUMNSCONTENT',3,'导出','onclick=\'forwards()\'','0',116,'glyphicon glyphicon-forward',6,'1'),(212,'050401','COLUMNS',3,'新建记录','onclick=\'add()\'','0',11,'glyphicon glyphicon-plus',1,'1'),(216,'050401','PAVILIONAUTHOR',3,'新建记录','onclick=\'add()\'','0',63,'glyphicon glyphicon-plus',1,'1'),(220,'050401','PAVILIONWORKS',3,'新建记录','onclick=\'add()\'','0',64,'glyphicon glyphicon-plus',1,'1'),(224,'050401','COLUMNSCONTENT',3,'新建记录','onclick=\'add()\'','0',116,'glyphicon glyphicon-plus',1,'1'),(247,'050401','TABLECONFIG',3,'新建记录','onclick=\'add()\'','0',171,'glyphicon glyphicon-plus',1,'1'),(248,'0203',NULL,2,'数据项配置','data-url=\'/tableColumnConfig/list\'','0',171,NULL,4,'1'),(249,'56',NULL,2,'应用查询配置','data-url=\'appSearch/list\'','0',171,'fa fa-tachometer fa-fw',5,'1'),(250,'050401','TABLECONFIG',3,'新建记录','onclick=\'add()\'','0',171,'glyphicon glyphicon-plus',1,'1');
/*!40000 ALTER TABLE `t_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_review`
--

DROP TABLE IF EXISTS `t_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_review` (
  `id` int(11) NOT NULL,
  `column_id` int(11) DEFAULT NULL,
  `sort_no` int(11) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='信息审核列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_review`
--

LOCK TABLES `t_review` WRITE;
/*!40000 ALTER TABLE `t_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_review` ENABLE KEYS */;
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
INSERT INTO `t_role_resource` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,14),(1,32),(1,33),(1,34),(1,38),(1,40),(1,41),(1,42),(1,43),(1,56),(1,63),(1,64),(1,71),(1,72),(1,73),(1,74),(1,96),(1,97),(1,98),(1,99),(1,102),(1,103),(1,116),(1,131),(1,159),(1,160),(1,161),(1,162),(1,163),(1,164),(1,165),(1,166),(1,167),(1,170),(1,171),(1,172),(1,173),(1,174),(1,175),(1,176),(1,179),(1,181),(1,182),(1,183),(1,184),(1,190),(1,197),(1,198),(1,199),(1,200),(1,201),(1,207),(1,208),(1,209),(1,210),(1,211),(1,212),(1,216),(1,220),(1,224),(1,247),(1,248),(1,249),(1,250);
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
-- Table structure for table `t_sanhu`
--

DROP TABLE IF EXISTS `t_sanhu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_sanhu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mark` varchar(200) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_sanhu`
--

LOCK TABLES `t_sanhu` WRITE;
/*!40000 ALTER TABLE `t_sanhu` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_sanhu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_search_config`
--

DROP TABLE IF EXISTS `t_search_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_search_config` (
  `search_id` bigint(20) NOT NULL,
  `config_id` bigint(20) NOT NULL,
  PRIMARY KEY (`search_id`,`config_id`),
  KEY `FK_imj52rur0vxcrrne3jmwi11s2` (`config_id`),
  CONSTRAINT `FK_1ynq7xqk25jyvqilqs6o0p7b9` FOREIGN KEY (`search_id`) REFERENCES `t_app_search` (`id`),
  CONSTRAINT `FK_imj52rur0vxcrrne3jmwi11s2` FOREIGN KEY (`config_id`) REFERENCES `t_table_column_config` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_search_config`
--

LOCK TABLES `t_search_config` WRITE;
/*!40000 ALTER TABLE `t_search_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_search_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_site`
--

DROP TABLE IF EXISTS `t_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_site` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `domain_name` varchar(20) NOT NULL,
  `begin_time` varchar(20) DEFAULT NULL,
  `end_time` varchar(20) DEFAULT NULL,
  `deploy_host` varchar(20) NOT NULL,
  `sort_no` varchar(20) DEFAULT NULL,
  `status` varchar(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_site`
--

LOCK TABLES `t_site` WRITE;
/*!40000 ALTER TABLE `t_site` DISABLE KEYS */;
INSERT INTO `t_site` VALUES (1,'文艺评论家协会','www.pljxh.com','2014-04-20 00:00:00','2024-04-20 00:00:00','1','1','1'),(2,'十九大','www.shijiuda.com','2017-10-31 00:00:00','2027-10-31 00:00:00','1','1','1'),(3,'甘肃省文联网','www.wlweb.com','2011-11-28 00:00:00','2016-11-28 00:00:00','http://192.168.0.1','1','1'),(4,'甘肃省戏剧家协会','www.xjxh.com','2011-12-08 00:00:00','2021-12-08 00:00:00','1','1','1'),(5,'甘肃省作家协会','www.zjjxh.com','2011-12-08 00:00:00','2021-12-08 00:00:00','1','1','1'),(6,'甘肃省美术家协会','www.msjxh.com','2011-12-08 00:00:00','2021-12-08 00:00:00','1','1','1'),(7,'甘肃省杂技家协会','www.zjaxh.com','2011-12-08 00:00:00','2021-12-08 00:00:00','1','1','1'),(8,'甘肃省音乐家协会','www.yyjxh.com','2011-12-08 00:00:00','2021-12-08 00:00:00','1','1','1'),(9,'甘肃省舞蹈家协会','www.wdjxh.com','2011-12-08 00:00:00','2021-12-08 00:00:00','1','1','1'),(10,'甘肃省曲艺家协会','www.qyjxh.com','2011-12-08 00:00:00','2021-12-08 00:00:00','1','1','1'),(11,'甘肃省民间文艺家协会','www.mjwyjxh.com','2011-12-08 00:00:00','2021-12-08 00:00:00','1','1','1'),(12,'甘肃省书法家协会','www.fsjxh.com','2011-12-08 00:00:00','2021-12-08 00:00:00','1','1','1'),(13,'甘肃省电影家协会','www.dyjxh.com','2011-12-08 00:00:00','2021-12-08 00:00:00','1','1','1'),(14,'甘肃省电视家协会','www.dsjxh.com','2011-12-08 00:00:00','2021-12-08 00:00:00','1','1','1'),(15,'甘肃省摄影家协会','www.syjxh.com','2011-12-08 00:00:00','2021-12-08 00:00:00','1','1','1'),(16,'理论研究室','www.llyjs.com','2011-12-08 00:00:00','2021-12-08 00:00:00','1','1','1'),(17,'甘肃省文学院','www.wxy.com','2011-12-08 00:00:00','2021-12-08 00:00:00','1','1','1'),(18,'测试数据','www.ftbjb.com','2011-12-08 00:00:00','2021-12-08 00:00:00','1','1','1');
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
INSERT INTO `t_sys_info` VALUES (1,'system_name','网站发布系统','/img/logo/logo.png',1,'1'),(2,'pre_maint_auto_schedule','是否自动调度',NULL,2,'1');
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
-- Table structure for table `t_table_column_config`
--

DROP TABLE IF EXISTS `t_table_column_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_table_column_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `class_type` varchar(100) NOT NULL,
  `col_desc` varchar(100) NOT NULL COMMENT '列描述',
  `col_name` varchar(50) NOT NULL COMMENT '列名',
  `data_type` varchar(50) NOT NULL COMMENT '数据类型',
  `length` bigint(20) DEFAULT NULL COMMENT '字段长度',
  `sort_no` bigint(20) DEFAULT NULL COMMENT '排序',
  `status` varchar(1) NOT NULL COMMENT '状态',
  `table_id` bigint(20) NOT NULL COMMENT '数据表',
  `converter` varchar(50) DEFAULT NULL COMMENT '格式转换器',
  `formatter` varchar(50) DEFAULT NULL COMMENT '菜单格式器',
  `is_null` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_g1jw2eob5dg8nf2ww47dyg455` (`table_id`),
  CONSTRAINT `FK_g1jw2eob5dg8nf2ww47dyg455` FOREIGN KEY (`table_id`) REFERENCES `t_table_config` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=283 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_table_column_config`
--

LOCK TABLES `t_table_column_config` WRITE;
/*!40000 ALTER TABLE `t_table_column_config` DISABLE KEYS */;
INSERT INTO `t_table_column_config` VALUES (1,'int(11)','序号','id','int',NULL,1,'1',5,NULL,NULL,'\0'),(2,'varchar(30)','位置编码','loCode','varchar',30,2,'1',5,NULL,NULL,'\0'),(3,'varchar(100)','位置名称','locName','varchar',100,3,'1',5,NULL,NULL,'\0'),(4,'varchar(100)','位置描述','locDesc','varchar',100,4,'1',5,NULL,NULL,'\0'),(5,'bigint(20)','位置级别','locLevel','bigint',NULL,5,'1',5,NULL,NULL,'\0'),(6,'varchar(1)','位置类型','locType','varchar',1,6,'1',5,NULL,NULL,'\0'),(7,'bigint(20)','上级位置','parentId','bigint',NULL,7,'1',5,NULL,NULL,'\0'),(8,'varchar(1)','状态','status','varchar',1,8,'1',5,NULL,NULL,'\0'),(9,'Long','序号','id','bigint',NULL,1,'1',6,'1','1','\0'),(10,'String','分类名称','name','varchar',20,2,'1',6,'1','1','\0'),(11,'Long','分类级别','classLevel','bigint',NULL,3,'1',6,'1','1','\0'),(12,'String','是否有子分类','hasChild','varchar',1,4,'1',6,'showYes','1','\0'),(13,'Long','维修时限','limitHours','bigint',NULL,5,'1',6,'1','1','\0'),(14,'Long','上级分类','parentId','bigint',NULL,6,'1',6,'1','1','\0'),(15,'Long','排序','sortNo','bigint',NULL,7,'1',6,'1','1','\0'),(16,'String','状态','status','varchar',1,8,'1',6,'showStatus','1','\0'),(17,'bigint(20)','序号','id','bigint',NULL,1,'1',1,'1','1','\0'),(18,'varchar(20)','应用名称','name','varchar',20,2,'1',1,'1','1','\0'),(19,'varchar(50)','应用描述','appDesc','varchar',50,3,'1',1,'1','1','\0'),(20,'bigint(20)','配置表','table_config_id','bigint',NULL,4,'1',1,'1','1','\0'),(21,'varchar(20)','排序','sortNo','varchar',20,5,'1',1,'1','1','\0'),(22,'varchar(1)','状态','status','varchar',1,6,'1',1,'1','1','\0'),(23,'bigint(20)','序号','id','bigint',NULL,1,'1',7,'','','\0'),(24,'varchar(50)','单位名称','name','varchar',50,2,'1',7,'','','\0'),(25,'varchar(200)','单位描述','unitDesc','varchar',200,3,'1',7,'','','\0'),(26,'varchar(20)','联系人','contact','varchar',20,4,'1',7,'','','\0'),(27,'varchar(20)','联系电话','telephone','varchar',20,5,'1',7,'','','\0'),(28,'varchar(1)','工作值','workDays','varchar',1,6,'1',7,'','','\0'),(29,'varchar(20)','排序','sortNo','varchar',20,7,'1',7,'','','\0'),(30,'varchar(1)','状态','status','varchar',1,8,'1',7,'showStatus','','\0'),(31,'int(11)','序号','id','int',NULL,1,'1',8,'','','\0'),(32,'varchar(20)','设备编号','eqCode','varchar',20,2,'1',8,'','','\0'),(33,'varchar(20)','资产编号','eamNo','varchar',20,3,'1',8,'','','\0'),(34,'varchar(20)','描述','description','varchar',20,4,'1',8,'','','\0'),(35,'varchar(50)','设备型号','eqModel','varchar',50,5,'1',8,'','','\0'),(36,'bigint(20)','预计年限','expectedYear','bigint',NULL,6,'1',8,'','','\0'),(37,'varchar(20)','维修人员','maintainer','varchar',20,7,'1',8,'','','\0'),(38,'bigint(20)','管理等级','manageLevel','bigint',NULL,8,'1',8,'','','\0'),(39,'varchar(20)','管理人员','manager','varchar',20,9,'1',8,'','','\0'),(40,'double','净值','netValue','double',NULL,10,'1',8,'','','\0'),(41,'double','原值','originalValue','double',NULL,11,'1',8,'','','\0'),(42,'varchar(255)','出厂日期','productDate','varchar',255,12,'1',8,'','','\0'),(43,'varchar(50)','生产厂家','productFactory','varchar',50,13,'1',8,'','','\0'),(44,'varchar(255)','购置日期','purchaseDate','varchar',255,14,'1',8,'','','\0'),(45,'double','购置价格','purchasePrice','double',NULL,15,'1',8,'','','\0'),(46,'varchar(255)','运行日期','runDate','varchar',255,16,'1',8,'','','\0'),(47,'varchar(255)','安装日期','setupDate','varchar',255,17,'1',8,'','','\0'),(48,'varchar(255)','保修期限','warrantyPeriod','varchar',255,18,'1',8,'','','\0'),(49,'bigint(20)','设备分类','eq_class_id','bigint',NULL,19,'1',8,'','','\0'),(50,'bigint(20)','所属位置','location_id','bigint',NULL,20,'1',8,'','','\0'),(51,'varchar(20)','授权码','authKey','varchar',20,21,'1',8,'','','\0'),(52,'bigint(20)','序号','id','bigint',NULL,1,'1',9,'','','\0'),(53,'varchar(20)','报修行号','orderLine_no','varchar',20,2,'1',9,'','','\0'),(54,'varchar(200)','工单描述','orderDesc','varchar',200,3,'1',9,'','','\0'),(55,'varchar(20)','报修人','reporter','varchar',20,4,'1',9,'','','\0'),(56,'varchar(1)','报修方式','reportType','varchar',1,5,'1',9,'','','\0'),(57,'varchar(255)','报修时间','reportTime','varchar',255,6,'1',9,'','','\0'),(58,'varchar(20)','记录人','creator','varchar',20,7,'1',9,'','','\0'),(59,'varchar(20)','维修期限','deadline','varchar',20,8,'1',9,'','','\0'),(60,'bigint(20)','设备','equipmentId','bigint',NULL,9,'1',9,'','','\0'),(61,'bigint(20)','维修单位','unitId','bigint',NULL,10,'1',9,'','','\0'),(62,'bit(1)','是否延期','expired','bit',NULL,11,'1',9,'','','\0'),(63,'varchar(1)','状态','status','varchar',1,12,'1',9,'','','\0'),(64,'varchar(20)','授权码','authKey','varchar',20,13,'1',9,'','','\0'),(65,'bigint(20)','序号','id','bigint',NULL,1,'1',10,'','','\0'),(66,'varchar(20)','申请日期','applyDate','varchar',20,2,'1',10,'','','\0'),(67,'varchar(50)',' 申请人','applicant','varchar',50,3,'1',10,'','','\0'),(68,'varchar(50)','申请部门','applyDep','varchar',50,4,'1',10,'','','\0'),(69,'varchar(50)','配件名称','accessoryName','varchar',50,5,'1',10,'','','\0'),(70,'int(11)','数量','amount','int',NULL,6,'1',10,'','','\0'),(71,'varchar(50)','规格','specifications','varchar',50,7,'1',10,'','','\0'),(72,'varchar(10)','批准人','approver','varchar',10,8,'1',10,'','','\0'),(73,'varchar(10)','经手人','handler','varchar',10,9,'1',10,'','','\0'),(74,'varchar(50)','申请原因','purpose','varchar',50,10,'1',10,'','','\0'),(75,'varchar(10)','接收人','receiver','varchar',10,11,'1',10,'','','\0'),(76,'bigint(20)','设备分类','eqClass_id','bigint',NULL,12,'1',10,'','','\0'),(77,'bigint(20)','设备位置','locationId','bigint',NULL,13,'1',10,'','','\0'),(78,'varchar(1)','状态','status','varchar',1,14,'1',10,'showStatus','','\0'),(79,'varchar(20)','授权码','authKey','varchar',20,15,'1',10,'','','\0'),(80,'bigint(20)','','id','bigint',NULL,1,'1',3,'','','\0'),(81,'varchar(20)','','amount','varchar',20,2,'1',3,'','','\0'),(82,'varchar(20)','','applicant','varchar',20,3,'1',3,'','','\0'),(83,'varchar(20)','','applyDate','varchar',20,4,'1',3,'','','\0'),(84,'varchar(20)','','auditDate','varchar',20,5,'1',3,'','','\0'),(85,'varchar(20)','','auditor','varchar',20,6,'1',3,'','','\0'),(86,'varchar(20)','','authKey','varchar',20,7,'1',3,'','','\0'),(87,'varchar(20)','','confirmReason','varchar',20,8,'1',3,'','','\0'),(88,'varchar(20)','','eCname','varchar',20,9,'1',3,'','','\0'),(89,'varchar(20)','','fixAdvice','varchar',20,10,'1',3,'','','\0'),(90,'varchar(20)','','leaderAdvice','varchar',20,11,'1',3,'','','\0'),(91,'varchar(20)','','permitted','varchar',20,12,'1',3,'','','\0'),(92,'varchar(1)','','status','varchar',1,13,'1',3,'','','\0'),(93,'varchar(20)','','updateReason','varchar',20,14,'1',3,'','','\0'),(94,'bigint(20)','','locationId','bigint',NULL,15,'1',3,'','','\0'),(95,'bigint(20)','序号','id','bigint',NULL,1,'1',4,'','','\0'),(96,'varchar(50)','易耗品名称','ecName','varchar',50,2,'1',4,'','','\0'),(97,'tinyblob','位置','location','tinyblob',255,3,'1',4,'','','\0'),(98,'int(11)','数量','amount','int',NULL,4,'1',4,'','','\0'),(99,'varchar(20)','申请人','applicant','varchar',20,5,'1',4,'','','\0'),(100,'varchar(20)','申请日期','applyDate','varchar',20,6,'1',4,'','','\0'),(101,'varchar(20)','授权码','authKey','varchar',20,7,'1',4,'','','\0'),(102,'varchar(1)','状态','status','varchar',1,8,'1',4,'showStatus','','\0'),(103,'bigint(20)','序号','id','bigint',NULL,1,'1',11,'','','\0'),(104,'varchar(50)','物料名称','matName','varchar',50,2,'1',11,'','','\0'),(105,'double','单价','matPrice','double',NULL,3,'1',11,'','','\0'),(106,'bigint(20)','数量','matAmount','bigint',NULL,4,'1',11,'','','\0'),(107,'varchar(30)','型号','matModel','varchar',30,5,'1',11,'','','\0'),(108,'bigint(20)','工单','workOrder_id','bigint',NULL,6,'1',11,'','','\0'),(109,'varchar(20)','授权码','authKey','varchar',20,7,'1',11,'','','\0'),(110,'varchar(1)','状态','status','varchar',1,8,'1',11,'','','\0'),(111,'bigint(20)','','id','bigint',NULL,1,'1',2,'','','\0'),(112,'varchar(100)','','domain_name','varchar',100,2,'1',2,'','','\0'),(113,'varchar(100)','','repository_name','varchar',100,3,'1',2,'','','\0'),(114,'varchar(100)','','search_service_name','varchar',100,4,'1',2,'','','\0'),(115,'varchar(100)','','service_name','varchar',100,5,'1',2,'','','\0'),(116,'bigint(20)','','sort_no','bigint',NULL,6,'1',2,'','','\0'),(117,'varchar(1)','','status','varchar',1,7,'1',2,'','','\0'),(118,'varchar(100)','','table_desc','varchar',100,8,'1',2,'','','\0'),(119,'varchar(50)','','table_name','varchar',50,9,'1',2,'','','\0'),(120,'varchar(50)','','short_name','varchar',50,10,'1',2,'','','\0'),(121,'Long','序号','id','bigint',NULL,1,'1',12,'','','\0'),(122,'String','','classType','varchar',100,2,'1',12,'','','\0'),(123,'String','列描述','colDesc','varchar',100,3,'1',12,'','','\0'),(124,'String','列名','colName','varchar',50,4,'1',12,'','','\0'),(125,'String','数据类型','dataType','varchar',50,5,'1',12,'','','\0'),(126,'String','是否为空','isNull','varchar',1,6,'1',12,'','','\0'),(127,'Long','字段长度','length','bigint',NULL,7,'1',12,'','','\0'),(128,'Long','排序','sortNo','bigint',NULL,8,'1',12,'','','\0'),(129,'String','状态','status','varchar',1,9,'1',12,'','','\0'),(130,'Long','数据表','tableId','bigint',NULL,10,'1',12,'','','\0'),(131,'String','格式转换器','converter','varchar',50,11,'1',12,'','','\0'),(132,'String','菜单格式器','formatter','varchar',50,12,'1',12,'','','\0'),(133,'Long','序号','id','bigint',NULL,1,'1',13,'','','\0'),(134,'String','编号','pmCode','varchar',20,2,'1',13,'','',''),(135,'String','创建人','createBy','varchar',20,3,'1',13,'','',''),(136,'String','创建时间','createTime','varchar',20,4,'1',13,'','',''),(137,'String','描述','description','varchar',20,5,'1',13,'','',''),(138,'Long','设备','equipmentId','bigint',NULL,6,'1',13,'','',''),(139,'Long','外委单位','unitId','bigint',NULL,7,'1',13,'','',''),(140,'String','状态','status','varchar',20,8,'1',13,'','',''),(141,'String','授权码','authKey','varchar',20,9,'1',13,'','',''),(142,'Long','序号','id','bigint',NULL,1,'1',14,'','','\0'),(143,'String','计划编号','planCode','varchar',20,2,'1',14,'','','\0'),(144,'String','计划名称','planDesc','varchar',20,3,'1',14,'','','\0'),(145,'String','执行状态','exeState','varchar',1,4,'1',14,'','','\0'),(146,'String','周期表达式','cron','varchar',20,5,'1',14,'','','\0'),(147,'String','授权码','authKey','varchar',20,6,'1',14,'','',''),(148,'String','状态','status','varchar',1,7,'1',14,'','','\0'),(149,'Long','序号','id','bigint',NULL,1,'1',15,'','','\0'),(150,'String','资源编号','resourceCode','varchar',20,2,'1',15,'','','\0'),(151,'String','应用名称','appName','varchar',50,3,'1',15,'','',''),(152,'Long','级别','resourceLevel','bigint',NULL,4,'1',15,'','',''),(153,'String','资源名称','resourceName','varchar',20,5,'1',15,'','','\0'),(154,'String','资源路径','resourceUrl','varchar',100,6,'1',15,'','','\0'),(155,'Long','上级节点','parentId','bigint',NULL,7,'1',15,'','',''),(156,'String','图标','iconClass','varchar',50,8,'1',15,'','',''),(157,'Long','排序','sortNo','bigint',NULL,9,'1',15,'','',''),(158,'String','启用状态','status','varchar',1,10,'1',15,'','',''),(159,'Boolean','','staticFlag','bit',NULL,11,'1',15,'','',''),(160,'Long','序号','id','bigint',NULL,1,'1',16,'','','\0'),(161,'String','角色名称','roleName','varchar',20,2,'1',16,'','','\0'),(162,'String','角色描述','roleDesc','varchar',50,3,'1',16,'','','\0'),(163,'Long','排序','sortNo','bigint',NULL,4,'1',16,'','',''),(164,'String','状态','status','varchar',1,5,'1',16,'showStatus','','\0'),(165,'Long','序号','id','bigint',NULL,1,'1',17,'','','\0'),(166,'String','内容','content','varchar',200,2,'1',17,'','',''),(167,'String','工单状态','orderState','varchar',1,3,'1',17,'','',''),(168,'String','工单状态时间','orderState_time','varchar',20,4,'1',17,'','',''),(169,'Long','工单','workOrder_id','bigint',NULL,5,'1',17,'','',''),(170,'String','创建人','creator','varchar',20,6,'1',17,'','',''),(171,'Long','排序','sortNo','bigint',NULL,7,'1',17,'','',''),(172,'String','状态','status','varchar',1,8,'1',17,'','',''),(173,'String','授权','authKey','varchar',20,9,'1',17,'','',''),(174,'Long','序号','id','int',NULL,1,'1',18,'','','\0'),(175,'String','申请人','applicant','varchar',50,2,'1',18,'','',''),(176,'String','申请日期','applyDate','varchar',20,3,'1',18,'','',''),(177,'String','申请部门','applyDep','varchar',50,4,'1',18,'','',''),(178,'String','批准人','approver','varchar',10,5,'1',18,'','',''),(179,'String','经手人','handler','varchar',10,6,'1',18,'','',''),(180,'String','原因','purpose','varchar',50,7,'1',18,'','',''),(181,'String','接收人','receiver','varchar',10,8,'1',18,'','',''),(182,'Long','设备','equipmentId','bigint',NULL,9,'1',18,'','',''),(183,'String','状态','status','varchar',1,10,'1',18,'','',''),(184,'Long','序号','id','bigint',NULL,1,'1',19,'','','\0'),(185,'String','申请人','applicant','varchar',50,2,'1',19,'','',''),(186,'String','申请日期','applyDate','varchar',20,3,'1',19,'','',''),(187,'String','申请部门','applyDep','varchar',50,4,'1',19,'','',''),(188,'String','批准人','approver','varchar',10,5,'1',19,'','',''),(189,'String','经办人','handler','varchar',10,6,'1',19,'','',''),(190,'String','申请原因','purpose','varchar',50,7,'1',19,'','',''),(191,'String','接收人','receiver','varchar',10,8,'1',19,'','',''),(192,'Long','设备','equipmentId','bigint',NULL,9,'1',19,'','',''),(193,'String','授权码','authKey','varchar',20,10,'1',19,'','',''),(194,'String','状态','status','varchar',1,11,'1',19,'','',''),(195,'Long','序号','id','bigint',NULL,1,'1',20,'','','\0'),(196,'String','查询描述','searchDesc','varchar',20,2,'1',20,'','',''),(197,'Long','所属应用','appId','bigint',NULL,3,'1',20,'','',''),(198,'String','是否有授权码','hasAuth_key','varchar',1,4,'1',20,'','',''),(199,'String','状态','status','varchar',1,5,'1',20,'','',''),(200,'Long','序号','id','bigint',NULL,1,'1',21,'','','\0'),(201,'String','散户名称','name','varchar',20,2,'1',21,'','',''),(202,'String','备注','mark','varchar',200,3,'1',21,'','',''),(203,'String','状态','status','varchar',1,4,'1',21,'','',''),(204,'Long','序号','id','bigint',NULL,1,'1',22,'','','\0'),(205,'String',' 日期','rq','varchar',20,2,'1',22,'','',''),(206,'String','股票代码','code','varchar',20,3,'1',22,'','',''),(207,'String','股票名称','name','varchar',20,4,'1',22,'','',''),(208,'Long','持股数','cgs','int',NULL,5,'1',22,'','',''),(209,'Long','名次','mc','int',NULL,6,'1',22,'','',''),(210,'String','股票名称','gdmc','varchar',20,7,'1',22,'','',''),(211,'Double','变动比例','bdbl','double',NULL,8,'1',22,'','',''),(212,'Long','增减','zj','bigint',NULL,9,'1',22,'','',''),(213,'String','股份类型','gflx','varchar',1,10,'1',22,'','',''),(214,'Double','流通股东持股比例','zltgbcgbl','double',NULL,11,'1',22,'','',''),(215,'String','股东性质','gdxz','varchar',1,12,'1',22,'','',''),(216,'String','状态','status','varchar',1,13,'1',22,'','',''),(217,'Long','序号','id','bigint',NULL,1,'1',23,'','','\0'),(218,'String','栏目名称','name','varchar',20,2,'1',23,'','','\0'),(219,'String','栏目描述','colDesc','varchar',20,3,'1',23,'','','\0'),(220,'String','开始时间','beginTime','varchar',20,4,'1',23,'','',''),(221,'String','结束时间','endTime','varchar',20,5,'1',23,'','',''),(222,'String','栏目类型','type','varchar',20,6,'1',23,'','','\0'),(223,'Long','所属站点','siteId','bigint',NULL,7,'1',23,'','',''),(224,'Long','上级栏目','parentId','bigint',NULL,8,'1',23,'','',''),(225,'String','排序','sortNo','varchar',20,9,'1',23,'','','\0'),(226,'String','状态','status','varchar',1,10,'1',23,'','','\0'),(227,'Long','序号','id','bigint',NULL,1,'1',24,'','','\0'),(228,'String','标题','title','varchar',20,2,'1',24,'','','\0'),(229,'longtext','内容','content','longtext',4294967295,3,'1',24,'','','\0'),(230,'String','创建人','creator','varchar',20,4,'1',24,'','',''),(231,'String','焦点图片','focusPic_url','varchar',100,5,'1',24,'','','\0'),(232,'Long','所属栏目','columnsId','bigint',NULL,6,'1',24,'','',''),(233,'Long','站点','siteId','bigint',NULL,7,'1',24,'','',''),(234,'String','创建时间','createTime','varchar',20,8,'1',24,'','','\0'),(235,'String','发布时间','releaseTime','varchar',20,9,'1',24,'','','\0'),(236,'String','审核状态','auditStatus','varchar',10,10,'1',24,'','','\0'),(237,'String','状态','status','varchar',1,11,'1',24,'','','\0'),(238,'Long','排序','sortNo','bigint',NULL,12,'1',24,'','',''),(239,'String','授权码','authKey','varchar',20,13,'1',24,'','',''),(240,'Long','序号','id','int',NULL,1,'1',25,'','','\0'),(241,'String','会员卡号','cardNo','varchar',20,2,'1',25,'','','\0'),(242,'String','会员姓名','name','varchar',20,3,'1',25,'','','\0'),(243,'String','创建时间','createTime','varchar',20,4,'1',25,'','',''),(244,'String','加入时间','enterDate','varchar',20,5,'1',25,'','',''),(245,'String','是否有照片','hasPhoto','varchar',1,6,'1',25,'','',''),(246,'String','照片路径','photoUrl','varchar',255,7,'1',25,'','',''),(247,'String','会员类型','memberType','varchar',1,8,'1',25,'','',''),(248,'Long','排序','sortNo','bigint',NULL,9,'1',25,'','',''),(249,'String','状态','status','varchar',1,10,'1',25,'','',''),(250,'String','授权码','authKey','varchar',20,11,'1',25,'','',''),(251,'Long','序号','id','bigint',NULL,1,'1',26,'','','\0'),(252,'String','作品名称','name','varchar',50,2,'1',26,'','','\0'),(253,'String','作品照片路径','photoUrl','varchar',200,3,'1',26,'','',''),(254,'String','是否焦点','isFocus','varchar',1,4,'1',26,'','','\0'),(255,'String','发布时间','releaseTime','varchar',20,5,'1',26,'','',''),(256,'String','上传时间','uploadTime','varchar',20,6,'1',26,'','',''),(257,'String','作品类型','worksType','varchar',1,7,'1',26,'','',''),(258,'Long','会员','memberId','bigint',NULL,8,'1',26,'','',''),(259,'Long','协会','unitId','bigint',NULL,9,'1',26,'','',''),(260,'Long','排序','sortNo','bigint',NULL,10,'1',26,'','',''),(261,'String','状态','status','varchar',1,11,'1',26,'','','\0'),(262,'Long','序号','id','bigint',NULL,1,'1',27,'','','\0'),(263,'String','作者姓名','name','varchar',20,2,'1',27,'','','\0'),(264,'String','是否有照片','hasPhoto','varchar',1,3,'1',27,'','',''),(265,'datetime','创建时间','createTime','datetime',NULL,4,'1',27,'','',''),(266,'String','作者照片','photoUrl','varchar',255,5,'1',27,'','',''),(267,'String','状态','status','varchar',1,6,'1',27,'','','\0'),(268,'Long','排序','sortNo','bigint',NULL,7,'1',27,'','',''),(269,'String','授权码','authKey','varchar',20,8,'1',27,'','',''),(270,'Long','','id','bigint',NULL,1,'1',28,'','','\0'),(271,'Long','序号','id','bigint',NULL,1,'1',28,'','','\0'),(272,'String','作者姓名','name','varchar',20,2,'1',28,'','','\0'),(273,'String','照片','photoUrl','varchar',200,3,'1',28,'','',''),(274,'String','发布时间','releaseTime','varchar',20,4,'1',28,'','',''),(275,'String','上传时间','uploadTime','varchar',20,5,'1',28,'','',''),(276,'Long','作者','authorId','bigint',NULL,6,'1',28,'','',''),(277,'Long','栏目','columnsId','bigint',NULL,7,'1',28,'','',''),(278,'String','是否有照片','hasPhoto','varchar',1,8,'1',28,'','',''),(279,'String','是否焦点图片','isFocus','varchar',1,9,'1',28,'','',''),(280,'Long','排序','sortNo','bigint',NULL,10,'1',28,'','',''),(281,'String','状态','status','varchar',1,11,'1',28,'','',''),(282,'String','授权码','authKey','varchar',20,12,'1',28,'','','');
/*!40000 ALTER TABLE `t_table_column_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_table_config`
--

DROP TABLE IF EXISTS `t_table_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_table_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `domain_name` varchar(100) NOT NULL,
  `repository_name` varchar(100) NOT NULL,
  `search_service_name` varchar(100) NOT NULL,
  `service_name` varchar(100) NOT NULL,
  `sort_no` bigint(20) DEFAULT NULL,
  `status` varchar(1) NOT NULL,
  `table_desc` varchar(100) NOT NULL,
  `table_name` varchar(50) NOT NULL,
  `short_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_table_config`
--

LOCK TABLES `t_table_config` WRITE;
/*!40000 ALTER TABLE `t_table_config` DISABLE KEYS */;
INSERT INTO `t_table_config` VALUES (1,'com.subway.app.App','com.subway.app.AppRepository','com.subway.app.AppSearchService','com.subway.app.AppService',1,'1','应用信息','t_app','App'),(2,'com.subway.tableConfig.TableConfig','com.subway.tableConfig.TableConfigRepository','com.subway.tableConfig.TableConfigSearchService','com.subway.tableConfig.TableConfigService',1,'1','数据配置','t_table_config','TableConfig'),(3,'com.subway.ecBudget.EcBudget','com.subway.ecBudget.EcBudgetRepository','com.subway.ecBudget.EcBudgetSearchService','com.subway.ecBudget.EcBudgetService',1,'1','易耗品采购申请','t_ec_budget','EcBudget'),(4,'com.subway.materialCost.MaterialCost','com.subway.materialCost.MaterialCostRepository','com.subway.materialCost.MaterialCostSearchService','com.subway.materialCost.MaterialCostService',1,'1','物料消耗','t_material_cost','MaterialCost'),(5,'com.subway.location.Location','com.subway.location.LocationRepository','com.subway.pavilionWorks.location.LocationSearchService','com.subway.location.LocationService',1,'1','位置信息','t_location','Location'),(6,'com.subway.eqClass.EqClass','com.subway.eqClass.EqClassRepository','com.subway.eqClass.EqClassSearchService','com.subway.eqClass.EqClassService',1,'1','设备分类','t_eq_class','EqClass'),(7,'com.subway.unit.Unit','com.subway.unit.UnitRepository','com.subway.unit.UnitSearchService','com.subway.unit.UnitService',1,'1','外委单位','t_unit','Unit'),(8,'com.subway.equipment.Equipment','com.subway.equipment.EquipmentRepository','com.subway.equipment.EquipmentSearchService','com.subway.equipment.EquipmentService',1,'1','设备信息','t_equipment','Equipment'),(9,'com.subway.workOrder.WorkOrder','com.subway.workOrder.WorkOrderRepository','com.subway.workOrder.WorkOrderSearchService','com.subway.workOrder.WorkOrderService',1,'1','工单信息','t_work_order','WorkOrder'),(10,'com.subway.budget.Budget','com.subway.budget.BudgetRepository','com.subway.budget.BudgetSearchService','com.subway.budget.BudgetService',1,'1','采购申请','t_budget','Budget'),(11,'com.subway.woMaterialCost.WoMaterialCost','com.subway.woMaterialCost.WoMaterialCostRepository','com.subway.woMaterialCost.WoMaterialCostSearchService','com.subway.woMaterialCost.WoMaterialCostService',1,'1','工单物料消耗','t_wo_material_cost','WoMaterialCost'),(12,'com.subway.tableColumnConfig.TableColumnConfig','com.subway.tableColumnConfig.TableColumnConfigRepository','com.subway.tableColumnConfig.TableColumnConfigSearchService','com.subway.tableColumnConfig.TableColumnConfigService',1,'1','数据字段配置','t_table_column_config','TableColumnConfig'),(13,'com.subway.preMaint.PreMaint','com.subway.preMaint.PreMaintRepository','com.subway.preMaint.PreMaintSearchService','com.subway.preMaint.PreMaintService',1,'1','预防性维护','t_pre_maint','PreMaint'),(14,'com.subway.preMaintPlan.PreMaintPlan','com.subway.preMaintPlan.PreMaintPlanRepository','com.subway.preMaintPlan.PreMaintPlanSearchService','com.subway.preMaintPlan.PreMaintPlanService',1,'1','预防性维护计划','t_pre_maint_plan','PreMaintPlan'),(15,'com.subway.resource.Resource','com.subway.resource.ResourceRepository','com.subway.resource.ResourceSearchService','com.subway.resource.ResourceService',1,'1','菜单资源','t_resource','Resource'),(16,'com.subway.role.Role','com.subway.role.RoleRepository','com.subway.role.RoleSearchService','com.subway.role.RoleService',1,'1','角色信息','t_role','Role'),(17,'com.subway.workOrderLog.WorkOrderLog','com.subway.workOrderLog.WorkOrderLogRepository','com.subway.workOrderLog.WorkOrderLogSearchService','com.subway.workOrderLog.WorkOrderLogService',1,'1','工单日志信息','t_work_order_log','WorkOrderLog'),(18,'com.subway.eqUpdate.EqUpdate','com.subway.eqUpdate.EqUpdateRepository','com.subway.eqUpdate.EqUpdateSearchService','com.subway.eqUpdate.EqUpdateService',NULL,'1','设备更新表','t_eq_update','EqUpdate'),(19,'com.subway.eqAppend.EqAppend','com.subway.eqAppend.EqAppendRepository','com.subway.eqAppend.EqAppendSearchService','com.subway.eqAppend.EqAppendService',NULL,'1','设备新置申请表','t_eq_append','EqAppend'),(20,'com.subway.appSearch.AppSearch','com.subway.appSearch.AppSearchRepository','com.subway.appSearch.AppSearchSearchService','com.subway.appSearch.AppSearchService',NULL,'1','应用查询配置表','t_app_search','AppSearch'),(21,'com.stock.sanhu.Sanhu','com.stock.sanhu.SanhuRepository','com.stock.sanhu.SanhuSearchService','com.stock.sanhu.SanhuService',NULL,'1','散户信息表','t_sanhu','Sanhu'),(22,'com.subway.cangwei.Cangwei','com.subway.cangwei.CangweiRepository','com.subway.cangwei.CangweiSearchService','com.subway.cangwei.CangweiService',NULL,'1','仓位信息表','t_cangwei','Cangwei'),(23,'com.subway.columns.Columns','com.subway.columns.ColumnsRepository','com.subway.columns.ColumnsSearchService','com.subway.columns.ColumnsService',NULL,'1','栏目信息','t_columns','Columns'),(24,'com.subway.columnsContent.ColumnsContent','com.subway.columnsContent.ColumnsContentRepository','com.subway.columnsContent.ColumnsContentSearchService','com.subway.columnsContent.ColumnsContentService',NULL,'1','栏目内容','t_columns_content','ColumnsContent'),(25,'com.subway.member.Member','com.subway.member.MemberRepository','com.subway.member.MemberSearchService','com.subway.member.MemberService',NULL,'1','会员信息表','t_member','Member'),(26,'com.subway.memberWorks.MemberWorks','com.subway.memberWorks.MemberWorksRepository','com.subway.memberWorks.MemberWorksSearchService','com.subway.memberWorks.MemberWorksService',NULL,'1','设备更新表','t_member_works','MemberWorks'),(27,'com.subway.pavilionAuthor.PavilionAuthor','com.subway.pavilionAuthor.PavilionAuthorRepository','com.subway.pavilionAuthor.PavilionAuthorSearchService','com.subway.pavilionAuthor.PavilionAuthorService',NULL,'1','展馆作者表','t_pavilion_author','PavilionAuthor'),(28,'com.subway.pavilionWorks.PavilionWorks','com.subway.pavilionWorks.PavilionWorksRepository','com.subway.pavilionWorks.PavilionWorksSearchService','com.subway.pavilionWorks.PavilionWorksService',NULL,'1','展馆作品','t_pavilion_works','PavilionWorks');
/*!40000 ALTER TABLE `t_table_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_template`
--

DROP TABLE IF EXISTS `t_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_template` (
  `id` int(11) NOT NULL COMMENT 'id',
  `name` varchar(200) DEFAULT NULL COMMENT '模板名称',
  `file_name` varchar(200) DEFAULT NULL COMMENT '生成文件名称',
  `file_url` varchar(200) DEFAULT NULL COMMENT '生成文件路径',
  `sort_no` int(11) DEFAULT NULL COMMENT '排序',
  `status` varchar(1) DEFAULT NULL COMMENT '状态',
  `template_desc` varchar(200) NOT NULL,
  `template_name` varchar(200) NOT NULL,
  `template_url` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='模板信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_template`
--

LOCK TABLES `t_template` WRITE;
/*!40000 ALTER TABLE `t_template` DISABLE KEYS */;
INSERT INTO `t_template` VALUES (1,'控制器模板','Controller.java','E:\\dev\\gscms\\src\\main\\resources\\templates\\controllerTemplate.ftl',1,'1','生成控制器','controllerTemplate.ftl','E:\\dev\\gscms\\src\\main\\resources\\templates\\controllerTemplate.ftl');
/*!40000 ALTER TABLE `t_template` ENABLE KEYS */;
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
  `contact` varchar(20) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `unit_desc` varchar(200) DEFAULT NULL,
  `work_days` varchar(1) DEFAULT NULL,
  `auth_key` varchar(20) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_sbog8tj4q4j0kdb4rwl9e7qql` (`parent_id`),
  CONSTRAINT `FK_sbog8tj4q4j0kdb4rwl9e7qql` FOREIGN KEY (`parent_id`) REFERENCES `t_unit` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_unit`
--

LOCK TABLES `t_unit` WRITE;
/*!40000 ALTER TABLE `t_unit` DISABLE KEYS */;
INSERT INTO `t_unit` VALUES (1,'01','甘肃省文联','1','1','1','1','1','甘肃省文联','5','BJ10',NULL);
/*!40000 ALTER TABLE `t_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_unit_class`
--

DROP TABLE IF EXISTS `t_unit_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_unit_class` (
  `class_id` bigint(20) NOT NULL,
  `unit_id` bigint(20) NOT NULL,
  PRIMARY KEY (`class_id`,`unit_id`),
  KEY `FK_4dintw17y80ytrc3r8bfknt3b` (`unit_id`),
  CONSTRAINT `FK_4dintw17y80ytrc3r8bfknt3b` FOREIGN KEY (`unit_id`) REFERENCES `t_unit` (`id`),
  CONSTRAINT `FK_o05kln4ffdjuyha77pd29sd5g` FOREIGN KEY (`class_id`) REFERENCES `t_eq_class` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_unit_class`
--

LOCK TABLES `t_unit_class` WRITE;
/*!40000 ALTER TABLE `t_unit_class` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_unit_class` ENABLE KEYS */;
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
  `auth_key` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `birth_date` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `gender` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  `id_card` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `person_name` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `photo_url` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `telephone` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `location_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_unique_index` (`user_name`),
  KEY `fk_person_index` (`person_id`),
  KEY `FK_pqruggwygaub5g1v2bbx6eaeq` (`location_id`),
  CONSTRAINT `FK_lu3rofbmhofhefs57m4uxc27j` FOREIGN KEY (`person_id`) REFERENCES `t_person` (`id`),
  CONSTRAINT `FK_pqruggwygaub5g1v2bbx6eaeq` FOREIGN KEY (`location_id`) REFERENCES `t_location` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user`
--

LOCK TABLES `t_user` WRITE;
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT INTO `t_user` VALUES (1,'huangbin','e10adc3949ba59abbe56e057f20f883e',1,1,1,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'line2','e10adc3949ba59abbe56e057f20f883e',2,2,2,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'line8','e10adc3949ba59abbe56e057f20f883e',3,3,3,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'line10','e10adc3949ba59abbe56e057f20f883e',4,4,4,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'line13','e10adc3949ba59abbe56e057f20f883e',5,5,5,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'xzm','e10adc3949ba59abbe56e057f20f883e',6,411,2,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,'panyu','e10adc3949ba59abbe56e057f20f883e',8,4,1,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,'guodandan','e10adc3949ba59abbe56e057f20f883e',15,NULL,1,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=385 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user_log`
--

LOCK TABLES `t_user_log` WRITE;
/*!40000 ALTER TABLE `t_user_log` DISABLE KEYS */;
INSERT INTO `t_user_log` VALUES (1,'0:0:0:0:0:0:0:1','登录','2018-02-27 07:39:09','登录成功','huangbin'),(2,'0:0:0:0:0:0:0:1','登录','2018-02-27 07:53:01','登录成功','huangbin'),(3,'0:0:0:0:0:0:0:1','登录','2018-02-27 07:53:26','登录成功','huangbin'),(4,'0:0:0:0:0:0:0:1','登录','2018-02-27 07:54:59','登录成功','huangbin'),(5,'0:0:0:0:0:0:0:1','登录','2018-02-27 07:57:40','登录成功','huangbin'),(6,'0:0:0:0:0:0:0:1','登录','2018-02-27 08:01:50','登录成功','huangbin'),(7,'0:0:0:0:0:0:0:1','登录','2018-02-27 08:02:11','登录成功','huangbin'),(8,'0:0:0:0:0:0:0:1','登录','2018-02-27 08:47:36','登录成功','huangbin'),(9,'0:0:0:0:0:0:0:1','登录','2018-02-27 08:54:17','登录成功','huangbin'),(10,'0:0:0:0:0:0:0:1','登录','2018-02-27 08:55:50','登录成功','huangbin'),(11,'0:0:0:0:0:0:0:1','登录','2018-02-27 10:26:32','登录成功','huangbin'),(12,'0:0:0:0:0:0:0:1','登录','2018-02-27 20:24:10','登录成功','huangbin'),(13,'0:0:0:0:0:0:0:1','登录','2018-02-27 20:37:10','登录成功','huangbin'),(14,'0:0:0:0:0:0:0:1','登录','2018-02-27 21:54:41','登录成功','huangbin'),(15,'0:0:0:0:0:0:0:1','登录','2018-02-27 22:05:37','登录成功','huangbin'),(16,'0:0:0:0:0:0:0:1','登录','2018-02-28 13:23:11','登录成功','huangbin'),(17,'0:0:0:0:0:0:0:1','登录','2018-02-28 13:32:13','登录成功','huangbin'),(18,'0:0:0:0:0:0:0:1','登录','2018-02-28 14:05:47','登录成功','huangbin'),(19,'0:0:0:0:0:0:0:1','登录','2018-02-28 14:08:45','登录成功','huangbin'),(20,'0:0:0:0:0:0:0:1','鐧诲綍','2018-02-28 14:13:43','鐧诲綍鎴愬姛','huangbin'),(21,'0:0:0:0:0:0:0:1','登录','2018-02-28 14:16:25','登录成功','huangbin'),(22,'0:0:0:0:0:0:0:1','登录','2018-02-28 14:18:32','登录成功','huangbin'),(23,'0:0:0:0:0:0:0:1','登录','2018-02-28 14:27:55','登录成功','huangbin'),(24,'0:0:0:0:0:0:0:1','登录','2018-02-28 14:36:57','登录成功','huangbin'),(25,'0:0:0:0:0:0:0:1','登录','2018-02-28 14:40:27','登录成功','huangbin'),(26,'0:0:0:0:0:0:0:1','登录','2018-02-28 14:44:46','登录成功','huangbin'),(27,'0:0:0:0:0:0:0:1','登录','2018-02-28 14:48:11','登录成功','huangbin'),(28,'0:0:0:0:0:0:0:1','登录','2018-02-28 14:50:58','登录成功','huangbin'),(29,'0:0:0:0:0:0:0:1','登录','2018-02-28 14:56:02','登录成功','huangbin'),(30,'0:0:0:0:0:0:0:1','登录','2018-02-28 15:07:21','登录成功','huangbin'),(31,'0:0:0:0:0:0:0:1','登录','2018-02-28 15:10:01','登录成功','huangbin'),(32,'0:0:0:0:0:0:0:1','登录','2018-02-28 15:25:51','登录成功','huangbin'),(33,'0:0:0:0:0:0:0:1','登录','2018-02-28 15:30:19','登录成功','huangbin'),(34,'0:0:0:0:0:0:0:1','登录','2018-02-28 15:35:10','登录成功','huangbin'),(35,'0:0:0:0:0:0:0:1','登录','2018-02-28 15:40:13','登录成功','huangbin'),(36,'0:0:0:0:0:0:0:1','登录','2018-02-28 15:42:01','登录成功','huangbin'),(37,'0:0:0:0:0:0:0:1','登录','2018-02-28 15:45:47','登录成功','huangbin'),(38,'0:0:0:0:0:0:0:1','登录','2018-02-28 15:48:55','登录成功','huangbin'),(39,'0:0:0:0:0:0:0:1','登录','2018-02-28 15:53:54','登录成功','huangbin'),(40,'0:0:0:0:0:0:0:1','登录','2018-02-28 16:02:07','登录成功','huangbin'),(41,'0:0:0:0:0:0:0:1','登录','2018-02-28 16:08:35','登录成功','huangbin'),(42,'0:0:0:0:0:0:0:1','登录','2018-02-28 16:12:47','登录成功','huangbin'),(43,'0:0:0:0:0:0:0:1','登录','2018-02-28 16:16:31','登录成功','huangbin'),(44,'0:0:0:0:0:0:0:1','登录','2018-02-28 16:21:17','登录成功','huangbin'),(45,'0:0:0:0:0:0:0:1','登录','2018-03-01 08:39:20','登录成功','huangbin'),(46,'0:0:0:0:0:0:0:1','登录','2018-03-01 08:55:08','登录成功','huangbin'),(47,'0:0:0:0:0:0:0:1','登录','2018-03-01 09:04:59','登录成功','huangbin'),(48,'0:0:0:0:0:0:0:1','登录','2018-03-01 09:08:35','登录成功','huangbin'),(49,'0:0:0:0:0:0:0:1','登录','2018-03-01 09:11:12','登录成功','huangbin'),(50,'0:0:0:0:0:0:0:1','登录','2018-03-01 09:22:53','登录成功','huangbin'),(51,'0:0:0:0:0:0:0:1','登录','2018-03-01 09:28:32','登录成功','huangbin'),(52,'0:0:0:0:0:0:0:1','登录','2018-03-01 09:35:12','登录成功','huangbin'),(53,'0:0:0:0:0:0:0:1','登录','2018-03-01 09:40:37','登录成功','huangbin'),(54,'0:0:0:0:0:0:0:1','登录','2018-03-01 09:50:09','登录成功','huangbin'),(55,'0:0:0:0:0:0:0:1','登录','2018-03-01 09:58:39','登录成功','huangbin'),(56,'0:0:0:0:0:0:0:1','登录','2018-03-01 10:00:20','登录成功','huangbin'),(57,'0:0:0:0:0:0:0:1','登录','2018-03-01 10:07:38','登录成功','huangbin'),(58,'0:0:0:0:0:0:0:1','登录','2018-03-01 10:12:00','登录成功','huangbin'),(59,'0:0:0:0:0:0:0:1','登录','2018-03-01 10:14:26','登录成功','huangbin'),(60,'0:0:0:0:0:0:0:1','登录','2018-03-01 10:26:40','登录成功','huangbin'),(61,'0:0:0:0:0:0:0:1','登录','2018-03-01 10:28:43','登录成功','huangbin'),(62,'0:0:0:0:0:0:0:1','登录','2018-03-01 10:41:38','登录成功','huangbin'),(63,'0:0:0:0:0:0:0:1','登录','2018-03-01 10:45:42','登录成功','huangbin'),(64,'0:0:0:0:0:0:0:1','登录','2018-03-01 10:51:24','登录成功','huangbin'),(65,'0:0:0:0:0:0:0:1','登录','2018-03-01 11:10:45','登录成功','huangbin'),(66,'0:0:0:0:0:0:0:1','登录','2018-03-01 11:13:17','登录成功','huangbin'),(67,'0:0:0:0:0:0:0:1','登录','2018-03-01 11:19:50','登录成功','huangbin'),(68,'0:0:0:0:0:0:0:1','登录','2018-03-01 11:24:09','登录成功','huangbin'),(69,'0:0:0:0:0:0:0:1','登录','2018-03-01 11:26:01','登录成功','huangbin'),(70,'0:0:0:0:0:0:0:1','登录','2018-03-01 11:29:19','登录成功','huangbin'),(71,'0:0:0:0:0:0:0:1','登录','2018-03-01 11:34:14','登录成功','huangbin'),(72,'0:0:0:0:0:0:0:1','登录','2018-03-01 11:37:54','登录成功','huangbin'),(73,'0:0:0:0:0:0:0:1','登录','2018-03-01 11:40:13','登录成功','huangbin'),(74,'0:0:0:0:0:0:0:1','登录','2018-03-01 11:47:00','登录成功','huangbin'),(75,'0:0:0:0:0:0:0:1','登录','2018-03-01 11:50:52','登录成功','huangbin'),(76,'0:0:0:0:0:0:0:1','登录','2018-03-01 20:00:22','登录成功','huangbin'),(77,'0:0:0:0:0:0:0:1','登录','2018-03-01 20:04:38','登录成功','huangbin'),(78,'0:0:0:0:0:0:0:1','登录','2018-03-01 20:08:55','登录成功','huangbin'),(79,'0:0:0:0:0:0:0:1','登录','2018-03-01 20:12:20','登录成功','huangbin'),(80,'0:0:0:0:0:0:0:1','登录','2018-03-01 20:16:35','登录成功','huangbin'),(81,'0:0:0:0:0:0:0:1','登录','2018-03-01 20:22:58','登录成功','huangbin'),(82,'0:0:0:0:0:0:0:1','登录','2018-03-01 20:28:03','登录成功','huangbin'),(83,'0:0:0:0:0:0:0:1','登录','2018-03-01 20:40:04','登录成功','huangbin'),(84,'0:0:0:0:0:0:0:1','登录','2018-03-01 20:48:16','登录成功','huangbin'),(85,'0:0:0:0:0:0:0:1','登录','2018-03-01 21:11:59','登录成功','huangbin'),(86,'0:0:0:0:0:0:0:1','登录','2018-03-01 21:20:34','登录失败','huangbin'),(87,'0:0:0:0:0:0:0:1','登录','2018-03-01 21:20:37','登录成功','huangbin'),(88,'0:0:0:0:0:0:0:1','登录','2018-03-01 21:25:40','登录成功','huangbin'),(89,'0:0:0:0:0:0:0:1','登录','2018-03-01 21:30:19','登录成功','huangbin'),(90,'0:0:0:0:0:0:0:1','登录','2018-03-01 21:41:42','登录失败','huangbin'),(91,'0:0:0:0:0:0:0:1','登录','2018-03-01 21:41:45','登录成功','huangbin'),(92,'0:0:0:0:0:0:0:1','登录','2018-03-01 21:51:15','登录成功','huangbin'),(93,'0:0:0:0:0:0:0:1','登录','2018-03-01 22:05:38','登录成功','huangbin'),(94,'0:0:0:0:0:0:0:1','登录','2018-03-01 22:13:59','登录成功','huangbin'),(95,'0:0:0:0:0:0:0:1','登录','2018-03-01 22:14:19','登录成功','huangbin'),(96,'0:0:0:0:0:0:0:1','登录','2018-03-01 22:18:34','登录成功','huangbin'),(97,'0:0:0:0:0:0:0:1','登录','2018-03-02 13:34:46','登录成功','huangbin'),(98,'0:0:0:0:0:0:0:1','登录','2018-03-02 13:40:21','登录成功','huangbin'),(99,'0:0:0:0:0:0:0:1','登录','2018-03-02 13:49:46','登录成功','huangbin'),(100,'0:0:0:0:0:0:0:1','登录','2018-03-02 13:54:21','登录成功','huangbin'),(101,'0:0:0:0:0:0:0:1','登录','2018-03-02 13:58:48','登录成功','huangbin'),(102,'0:0:0:0:0:0:0:1','登录','2018-03-02 14:02:39','登录成功','huangbin'),(103,'0:0:0:0:0:0:0:1','登录','2018-03-02 14:16:06','登录成功','huangbin'),(104,'0:0:0:0:0:0:0:1','登录','2018-03-02 14:17:37','登录成功','huangbin'),(105,'0:0:0:0:0:0:0:1','登录','2018-03-02 14:19:34','登录成功','huangbin'),(106,'0:0:0:0:0:0:0:1','登录','2018-03-02 14:34:58','登录成功','huangbin'),(107,'0:0:0:0:0:0:0:1','登录','2018-03-02 14:37:56','登录成功','huangbin'),(108,'0:0:0:0:0:0:0:1','登录','2018-03-02 14:46:40','登录成功','huangbin'),(109,'0:0:0:0:0:0:0:1','登录','2018-03-02 20:47:55','登录成功','huangbin'),(110,'0:0:0:0:0:0:0:1','登录','2018-03-02 20:49:04','登录成功','huangbin'),(111,'0:0:0:0:0:0:0:1','登录','2018-03-02 21:13:30','登录成功','huangbin'),(112,'0:0:0:0:0:0:0:1','登录','2018-03-02 21:23:08','登录成功','huangbin'),(113,'0:0:0:0:0:0:0:1','登录','2018-03-02 22:03:15','登录成功','huangbin'),(114,'0:0:0:0:0:0:0:1','登录','2018-03-02 22:05:02','登录成功','huangbin'),(115,'0:0:0:0:0:0:0:1','登录','2018-03-02 22:10:33','登录成功','huangbin'),(116,'0:0:0:0:0:0:0:1','登录','2018-03-02 22:14:45','登录成功','huangbin'),(117,'0:0:0:0:0:0:0:1','登录','2018-03-02 22:15:52','登录成功','huangbin'),(118,'0:0:0:0:0:0:0:1','登录','2018-03-02 22:17:19','登录成功','huangbin'),(119,'0:0:0:0:0:0:0:1','登录','2018-03-02 22:25:47','登录成功','huangbin'),(120,'0:0:0:0:0:0:0:1','登录','2018-03-02 22:29:10','登录成功','huangbin'),(121,'0:0:0:0:0:0:0:1','登录','2018-03-02 22:43:18','登录成功','huangbin'),(122,'0:0:0:0:0:0:0:1','登录','2018-03-02 22:48:19','登录成功','huangbin'),(123,'0:0:0:0:0:0:0:1','登录','2018-03-02 23:19:04','登录成功','huangbin'),(124,'0:0:0:0:0:0:0:1','登录','2018-03-02 23:22:35','登录成功','huangbin'),(125,'0:0:0:0:0:0:0:1','登录','2018-03-02 23:25:37','登录成功','huangbin'),(126,'0:0:0:0:0:0:0:1','登录','2018-03-02 23:29:28','登录成功','huangbin'),(127,'0:0:0:0:0:0:0:1','登录','2018-03-03 07:19:48','登录成功','huangbin'),(128,'0:0:0:0:0:0:0:1','登录','2018-03-03 07:33:01','登录成功','huangbin'),(129,'0:0:0:0:0:0:0:1','登录','2018-03-03 07:35:17','登录成功','huangbin'),(130,'0:0:0:0:0:0:0:1','登录','2018-03-03 07:42:52','登录成功','huangbin'),(131,'0:0:0:0:0:0:0:1','登录','2018-03-03 07:49:06','登录成功','huangbin'),(132,'0:0:0:0:0:0:0:1','登录','2018-03-03 07:52:04','登录成功','huangbin'),(133,'0:0:0:0:0:0:0:1','登录','2018-03-03 07:56:21','登录成功','huangbin'),(134,'0:0:0:0:0:0:0:1','登录','2018-03-03 10:07:07','登录成功','huangbin'),(135,'0:0:0:0:0:0:0:1','登录','2018-03-03 10:11:31','登录成功','huangbin'),(136,'0:0:0:0:0:0:0:1','登录','2018-03-03 10:17:38','登录成功','huangbin'),(137,'0:0:0:0:0:0:0:1','登录','2018-03-03 10:25:32','登录成功','huangbin'),(138,'0:0:0:0:0:0:0:1','登录','2018-03-03 10:27:50','登录成功','huangbin'),(139,'0:0:0:0:0:0:0:1','登录','2018-03-03 11:53:35','登录成功','huangbin'),(140,'0:0:0:0:0:0:0:1','登录','2018-03-03 11:59:14','登录成功','huangbin'),(141,'0:0:0:0:0:0:0:1','登录','2018-03-03 12:01:33','登录成功','huangbin'),(142,'0:0:0:0:0:0:0:1','登录','2018-03-03 12:05:46','登录成功','huangbin'),(143,'0:0:0:0:0:0:0:1','登录','2018-03-03 12:08:45','登录成功','huangbin'),(144,'0:0:0:0:0:0:0:1','登录','2018-03-03 12:09:45','登录成功','huangbin'),(145,'0:0:0:0:0:0:0:1','登录','2018-03-03 14:32:12','登录成功','huangbin'),(146,'0:0:0:0:0:0:0:1','登录','2018-03-03 14:37:10','登录成功','huangbin'),(147,'0:0:0:0:0:0:0:1','登录','2018-03-03 14:43:33','登录成功','huangbin'),(148,'0:0:0:0:0:0:0:1','登录','2018-03-03 14:45:43','登录成功','huangbin'),(149,'0:0:0:0:0:0:0:1','登录','2018-03-03 14:49:04','登录成功','huangbin'),(150,'0:0:0:0:0:0:0:1','登录','2018-03-03 14:50:53','登录成功','huangbin'),(151,'0:0:0:0:0:0:0:1','登录','2018-03-03 14:56:15','登录成功','huangbin'),(152,'0:0:0:0:0:0:0:1','登录','2018-03-03 14:58:19','登录成功','huangbin'),(153,'0:0:0:0:0:0:0:1','登录','2018-03-03 15:00:43','登录成功','huangbin'),(154,'0:0:0:0:0:0:0:1','登录','2018-03-03 15:02:26','登录成功','huangbin'),(155,'0:0:0:0:0:0:0:1','登录','2018-03-03 15:06:46','登录成功','huangbin'),(156,'0:0:0:0:0:0:0:1','登录','2018-03-03 15:10:45','登录成功','huangbin'),(157,'0:0:0:0:0:0:0:1','登录','2018-03-03 15:13:30','登录成功','huangbin'),(158,'0:0:0:0:0:0:0:1','登录','2018-03-03 15:18:50','登录成功','huangbin'),(159,'0:0:0:0:0:0:0:1','登录','2018-03-03 15:20:02','登录成功','huangbin'),(160,'0:0:0:0:0:0:0:1','登录','2018-03-03 15:22:33','登录成功','huangbin'),(161,'0:0:0:0:0:0:0:1','登录','2018-03-03 15:27:53','登录成功','huangbin'),(162,'0:0:0:0:0:0:0:1','登录','2018-03-03 15:39:06','登录成功','huangbin'),(163,'0:0:0:0:0:0:0:1','登录','2018-03-03 16:06:29','登录成功','huangbin'),(164,'0:0:0:0:0:0:0:1','登录','2018-03-03 16:10:10','登录成功','huangbin'),(165,'0:0:0:0:0:0:0:1','登录','2018-03-03 16:19:46','登录成功','huangbin'),(166,'0:0:0:0:0:0:0:1','登录','2018-03-03 16:22:15','登录成功','huangbin'),(167,'0:0:0:0:0:0:0:1','登录','2018-03-03 16:23:58','登录成功','huangbin'),(168,'0:0:0:0:0:0:0:1','登录','2018-03-03 17:12:22','登录成功','huangbin'),(169,'0:0:0:0:0:0:0:1','登录','2018-03-03 17:21:33','登录成功','huangbin'),(170,'0:0:0:0:0:0:0:1','登录','2018-03-03 17:24:31','登录成功','huangbin'),(171,'0:0:0:0:0:0:0:1','登录','2018-03-03 17:29:27','登录成功','huangbin'),(172,'127.0.0.1','登录','2018-03-03 17:48:40','登录成功','huangbin'),(173,'0:0:0:0:0:0:0:1','登录','2018-03-03 17:55:57','登录成功','huangbin'),(174,'0:0:0:0:0:0:0:1','登录','2018-03-03 17:59:29','登录成功','huangbin'),(175,'0:0:0:0:0:0:0:1','登录','2018-03-03 17:59:42','登录成功','huangbin'),(176,'0:0:0:0:0:0:0:1','登录','2018-03-03 19:55:27','登录成功','huangbin'),(177,'0:0:0:0:0:0:0:1','登录','2018-03-03 20:40:28','登录成功','huangbin'),(178,'0:0:0:0:0:0:0:1','登录','2018-03-03 20:56:14','登录成功','huangbin'),(179,'0:0:0:0:0:0:0:1','登录','2018-03-03 21:08:31','登录成功','huangbin'),(180,'0:0:0:0:0:0:0:1','登录','2018-03-03 21:11:51','登录成功','huangbin'),(181,'0:0:0:0:0:0:0:1','登录','2018-03-03 21:41:30','登录成功','huangbin'),(182,'0:0:0:0:0:0:0:1','登录','2018-03-03 21:46:43','登录成功','huangbin'),(183,'0:0:0:0:0:0:0:1','登录','2018-03-04 07:35:27','登录成功','huangbin'),(184,'0:0:0:0:0:0:0:1','登录','2018-03-04 08:02:28','登录成功','huangbin'),(185,'0:0:0:0:0:0:0:1','登录','2018-03-04 14:51:56','登录成功','huangbin'),(186,'0:0:0:0:0:0:0:1','登录','2018-03-04 15:03:27','登录成功','huangbin'),(187,'0:0:0:0:0:0:0:1','登录','2018-03-04 15:18:02','登录成功','huangbin'),(188,'0:0:0:0:0:0:0:1','登录','2018-03-04 15:27:43','登录成功','huangbin'),(189,'0:0:0:0:0:0:0:1','登录','2018-03-04 15:39:13','登录成功','huangbin'),(190,'0:0:0:0:0:0:0:1','登录','2018-03-04 15:41:57','登录成功','huangbin'),(191,'0:0:0:0:0:0:0:1','登录','2018-03-04 15:42:26','登录成功','huangbin'),(192,'0:0:0:0:0:0:0:1','登录','2018-03-04 15:46:26','登录成功','huangbin'),(193,'0:0:0:0:0:0:0:1','登录','2018-03-04 15:48:12','登录成功','huangbin'),(194,'0:0:0:0:0:0:0:1','登录','2018-03-04 15:52:11','登录成功','huangbin'),(195,'0:0:0:0:0:0:0:1','登录','2018-03-04 15:53:54','登录成功','huangbin'),(196,'0:0:0:0:0:0:0:1','登录','2018-03-04 16:00:09','登录成功','huangbin'),(197,'0:0:0:0:0:0:0:1','登录','2018-03-04 16:16:39','登录成功','huangbin'),(198,'0:0:0:0:0:0:0:1','登录','2018-03-04 16:19:19','登录成功','huangbin'),(199,'0:0:0:0:0:0:0:1','登录','2018-03-04 16:30:04','登录成功','huangbin'),(200,'0:0:0:0:0:0:0:1','登录','2018-03-04 17:20:57','登录成功','huangbin'),(201,'0:0:0:0:0:0:0:1','登录','2018-03-04 17:22:50','登录成功','huangbin'),(202,'0:0:0:0:0:0:0:1','登录','2018-03-04 17:34:02','登录成功','huangbin'),(203,'0:0:0:0:0:0:0:1','登录','2018-03-04 17:37:02','登录成功','huangbin'),(204,'0:0:0:0:0:0:0:1','登录','2018-03-04 17:38:53','登录成功','huangbin'),(205,'0:0:0:0:0:0:0:1','登录','2018-03-04 17:46:34','登录成功','huangbin'),(206,'0:0:0:0:0:0:0:1','登录','2018-03-04 17:52:20','登录成功','huangbin'),(207,'0:0:0:0:0:0:0:1','登录','2018-03-04 20:41:09','登录成功','huangbin'),(208,'0:0:0:0:0:0:0:1','登录','2018-03-04 20:48:55','登录成功','huangbin'),(209,'0:0:0:0:0:0:0:1','登录','2018-03-04 20:55:57','登录成功','huangbin'),(210,'0:0:0:0:0:0:0:1','登录','2018-03-04 20:58:13','登录成功','huangbin'),(211,'0:0:0:0:0:0:0:1','登录','2018-03-04 21:00:05','登录成功','huangbin'),(212,'0:0:0:0:0:0:0:1','登录','2018-03-04 21:06:02','登录成功','huangbin'),(213,'0:0:0:0:0:0:0:1','登录','2018-03-05 07:09:07','登录成功','huangbin'),(214,'0:0:0:0:0:0:0:1','登录','2018-03-05 07:14:30','登录成功','huangbin'),(215,'0:0:0:0:0:0:0:1','登录','2018-03-05 07:51:30','登录成功','huangbin'),(216,'0:0:0:0:0:0:0:1','登录','2018-03-05 07:55:56','登录成功','huangbin'),(217,'0:0:0:0:0:0:0:1','登录','2018-03-08 08:46:43','登录成功','huangbin'),(218,'0:0:0:0:0:0:0:1','登录','2018-03-08 09:10:09','登录成功','huangbin'),(219,'0:0:0:0:0:0:0:1','登录','2018-03-08 09:13:35','登录成功','huangbin'),(220,'0:0:0:0:0:0:0:1','登录','2018-03-08 09:17:33','登录成功','huangbin'),(221,'0:0:0:0:0:0:0:1','登录','2018-03-08 09:25:54','登录成功','huangbin'),(222,'0:0:0:0:0:0:0:1','登录','2018-03-08 09:30:58','登录成功','huangbin'),(223,'0:0:0:0:0:0:0:1','登录','2018-03-08 09:34:48','登录成功','huangbin'),(224,'0:0:0:0:0:0:0:1','登录','2018-03-08 09:38:16','登录成功','huangbin'),(225,'0:0:0:0:0:0:0:1','登录','2018-03-08 09:44:38','登录成功','huangbin'),(226,'0:0:0:0:0:0:0:1','登录','2018-03-08 09:46:23','登录成功','huangbin'),(227,'0:0:0:0:0:0:0:1','登录','2018-03-08 09:47:41','登录成功','huangbin'),(228,'0:0:0:0:0:0:0:1','登录','2018-03-08 09:50:57','登录成功','huangbin'),(229,'0:0:0:0:0:0:0:1','登录','2018-03-08 18:06:28','登录成功','huangbin'),(230,'0:0:0:0:0:0:0:1','登录','2018-03-08 18:13:00','登录成功','huangbin'),(231,'0:0:0:0:0:0:0:1','登录','2018-03-08 18:22:12','登录成功','huangbin'),(232,'0:0:0:0:0:0:0:1','登录','2018-03-09 08:21:59','登录成功','huangbin'),(233,'0:0:0:0:0:0:0:1','登录','2018-03-09 08:27:03','登录成功','huangbin'),(234,'0:0:0:0:0:0:0:1','登录','2018-03-09 08:32:14','登录成功','huangbin'),(235,'0:0:0:0:0:0:0:1','登录','2018-03-09 08:39:02','登录成功','huangbin'),(236,'0:0:0:0:0:0:0:1','登录','2018-03-09 08:43:32','登录成功','huangbin'),(237,'0:0:0:0:0:0:0:1','登录','2018-03-09 08:50:08','登录成功','huangbin'),(238,'0:0:0:0:0:0:0:1','登录','2018-03-09 09:02:07','登录成功','huangbin'),(239,'0:0:0:0:0:0:0:1','登录','2018-03-09 09:18:12','登录成功','huangbin'),(240,'0:0:0:0:0:0:0:1','登录','2018-03-09 09:24:55','登录成功','huangbin'),(241,'0:0:0:0:0:0:0:1','登录','2018-03-09 09:38:13','登录成功','huangbin'),(242,'0:0:0:0:0:0:0:1','登录','2018-03-09 09:40:54','登录成功','huangbin'),(243,'0:0:0:0:0:0:0:1','登录','2018-03-09 09:52:15','登录成功','huangbin'),(244,'0:0:0:0:0:0:0:1','登录','2018-03-09 10:03:01','登录成功','huangbin'),(245,'0:0:0:0:0:0:0:1','登录','2018-03-09 10:07:36','登录成功','huangbin'),(246,'0:0:0:0:0:0:0:1','登录','2018-03-09 10:10:31','登录成功','huangbin'),(247,'0:0:0:0:0:0:0:1','登录','2018-03-09 10:20:15','登录成功','huangbin'),(248,'0:0:0:0:0:0:0:1','登录','2018-03-09 10:27:18','登录成功','huangbin'),(249,'0:0:0:0:0:0:0:1','登录','2018-03-09 10:33:43','登录成功','huangbin'),(250,'0:0:0:0:0:0:0:1','登录','2018-03-09 10:45:28','登录成功','huangbin'),(251,'0:0:0:0:0:0:0:1','登录','2018-03-09 10:51:15','登录成功','huangbin'),(252,'0:0:0:0:0:0:0:1','登录','2018-03-09 14:05:54','登录成功','huangbin'),(253,'0:0:0:0:0:0:0:1','登录','2018-03-09 14:40:06','登录成功','huangbin'),(254,'0:0:0:0:0:0:0:1','登录','2018-03-09 14:42:48','登录成功','huangbin'),(255,'0:0:0:0:0:0:0:1','登录','2018-03-09 14:50:09','登录成功','huangbin'),(256,'0:0:0:0:0:0:0:1','登录','2018-03-09 15:02:42','登录成功','huangbin'),(257,'0:0:0:0:0:0:0:1','登录','2018-03-09 15:03:38','登录成功','huangbin'),(258,'0:0:0:0:0:0:0:1','登录','2018-03-09 15:24:25','登录成功','huangbin'),(259,'0:0:0:0:0:0:0:1','登录','2018-03-09 16:00:07','登录成功','huangbin'),(260,'0:0:0:0:0:0:0:1','登录','2018-03-09 16:00:36','登录成功','huangbin'),(261,'0:0:0:0:0:0:0:1','登录','2018-03-09 16:04:40','登录成功','huangbin'),(262,'0:0:0:0:0:0:0:1','登录','2018-03-09 16:04:56','登录成功','huangbin'),(263,'0:0:0:0:0:0:0:1','登录','2018-03-09 16:06:37','登录成功','huangbin'),(264,'0:0:0:0:0:0:0:1','登录','2018-03-09 16:11:17','登录成功','huangbin'),(265,'0:0:0:0:0:0:0:1','登录','2018-03-11 20:58:45','登录成功','huangbin'),(266,'0:0:0:0:0:0:0:1','登录','2018-03-11 21:33:13','登录成功','huangbin'),(267,'0:0:0:0:0:0:0:1','登录','2018-03-11 21:33:59','登录成功','huangbin'),(268,'0:0:0:0:0:0:0:1','登录','2018-03-11 21:36:26','登录成功','huangbin'),(269,'0:0:0:0:0:0:0:1','登录','2018-03-11 21:38:56','登录成功','huangbin'),(270,'0:0:0:0:0:0:0:1','登录','2018-03-11 21:44:21','登录成功','huangbin'),(271,'0:0:0:0:0:0:0:1','登录','2018-03-11 21:50:08','登录成功','huangbin'),(272,'0:0:0:0:0:0:0:1','登录','2018-03-11 21:59:30','登录成功','huangbin'),(273,'0:0:0:0:0:0:0:1','登录','2018-03-11 22:09:39','登录失败','huangbin'),(274,'0:0:0:0:0:0:0:1','登录','2018-03-11 22:09:42','登录成功','huangbin'),(275,'0:0:0:0:0:0:0:1','登录','2018-03-11 22:18:44','登录成功','huangbin'),(276,'0:0:0:0:0:0:0:1','登录','2018-03-11 22:34:11','登录成功','huangbin'),(277,'0:0:0:0:0:0:0:1','登录','2018-03-11 22:45:26','登录成功','huangbin'),(278,'0:0:0:0:0:0:0:1','登录','2018-03-11 22:48:48','登录成功','huangbin'),(279,'0:0:0:0:0:0:0:1','登录','2018-03-11 23:01:10','登录成功','huangbin'),(280,'0:0:0:0:0:0:0:1','登录','2018-03-11 23:04:37','登录成功','huangbin'),(281,'0:0:0:0:0:0:0:1','登录','2018-03-11 23:07:38','登录成功','huangbin'),(282,'0:0:0:0:0:0:0:1','登录','2018-03-11 23:10:22','登录成功','huangbin'),(283,'0:0:0:0:0:0:0:1','登录','2018-03-12 07:42:35','登录成功','huangbin'),(284,'0:0:0:0:0:0:0:1','登录','2018-03-12 07:55:07','登录成功','huangbin'),(285,'0:0:0:0:0:0:0:1','登录','2018-03-12 07:56:37','登录成功','huangbin'),(286,'0:0:0:0:0:0:0:1','登录','2018-03-12 08:01:12','登录成功','huangbin'),(287,'0:0:0:0:0:0:0:1','登录','2018-03-12 08:07:44','登录成功','huangbin'),(288,'0:0:0:0:0:0:0:1','登录','2018-03-12 08:09:43','登录成功','huangbin'),(289,'0:0:0:0:0:0:0:1','登录','2018-03-12 08:12:10','登录成功','huangbin'),(290,'0:0:0:0:0:0:0:1','登录','2018-03-12 08:13:20','登录成功','huangbin'),(291,'0:0:0:0:0:0:0:1','登录','2018-03-12 08:16:13','登录成功','huangbin'),(292,'0:0:0:0:0:0:0:1','登录','2018-03-12 08:22:39','登录成功','huangbin'),(293,'0:0:0:0:0:0:0:1','登录','2018-03-12 08:27:32','登录成功','huangbin'),(294,'0:0:0:0:0:0:0:1','登录','2018-03-12 09:44:16','登录成功','huangbin'),(295,'0:0:0:0:0:0:0:1','登录','2018-03-12 10:00:24','登录成功','huangbin'),(296,'0:0:0:0:0:0:0:1','登录','2018-03-12 10:03:50','登录成功','huangbin'),(297,'0:0:0:0:0:0:0:1','登录','2018-03-12 10:12:22','登录成功','huangbin'),(298,'0:0:0:0:0:0:0:1','登录','2018-03-12 10:29:42','登录成功','huangbin'),(299,'0:0:0:0:0:0:0:1','登录','2018-03-12 10:39:26','登录成功','huangbin'),(300,'0:0:0:0:0:0:0:1','登录','2018-03-12 10:43:09','登录成功','huangbin'),(301,'0:0:0:0:0:0:0:1','登录','2018-03-12 10:46:25','登录成功','huangbin'),(302,'0:0:0:0:0:0:0:1','登录','2018-03-12 10:53:44','登录成功','huangbin'),(303,'0:0:0:0:0:0:0:1','登录','2018-03-12 11:00:12','登录成功','huangbin'),(304,'0:0:0:0:0:0:0:1','登录','2018-03-12 11:04:39','登录成功','huangbin'),(305,'0:0:0:0:0:0:0:1','登录','2018-03-12 11:14:22','登录成功','huangbin'),(306,'0:0:0:0:0:0:0:1','登录','2018-03-12 11:38:42','登录成功','huangbin'),(307,'0:0:0:0:0:0:0:1','登录','2018-03-12 11:49:05','登录成功','huangbin'),(308,'0:0:0:0:0:0:0:1','登录','2018-03-12 11:51:55','登录成功','huangbin'),(309,'0:0:0:0:0:0:0:1','登录','2018-03-12 14:21:41','登录成功','huangbin'),(310,'0:0:0:0:0:0:0:1','登录','2018-03-12 14:28:19','登录成功','huangbin'),(311,'0:0:0:0:0:0:0:1','登录','2018-03-12 14:31:19','登录成功','huangbin'),(312,'0:0:0:0:0:0:0:1','登录','2018-03-12 14:32:53','登录成功','huangbin'),(313,'0:0:0:0:0:0:0:1','登录','2018-03-12 14:37:39','登录成功','huangbin'),(314,'0:0:0:0:0:0:0:1','登录','2018-03-12 14:45:16','登录成功','huangbin'),(315,'0:0:0:0:0:0:0:1','登录','2018-03-12 14:59:44','登录成功','huangbin'),(316,'0:0:0:0:0:0:0:1','登录','2018-03-12 15:20:56','登录成功','huangbin'),(317,'0:0:0:0:0:0:0:1','登录','2018-03-12 15:29:59','登录成功','huangbin'),(318,'0:0:0:0:0:0:0:1','登录','2018-03-12 15:43:30','登录成功','huangbin'),(319,'0:0:0:0:0:0:0:1','登录','2018-03-12 15:45:38','登录成功','huangbin'),(320,'0:0:0:0:0:0:0:1','登录','2018-03-12 15:53:57','登录成功','huangbin'),(321,'0:0:0:0:0:0:0:1','登录','2018-03-12 15:57:10','登录成功','huangbin'),(322,'0:0:0:0:0:0:0:1','登录','2018-03-12 16:08:39','登录成功','huangbin'),(323,'0:0:0:0:0:0:0:1','登录','2018-03-12 16:21:45','登录成功','huangbin'),(324,'0:0:0:0:0:0:0:1','登录','2018-03-12 16:38:20','登录成功','huangbin'),(325,'0:0:0:0:0:0:0:1','登录','2018-03-12 16:42:57','登录成功','huangbin'),(326,'0:0:0:0:0:0:0:1','登录','2018-03-12 16:58:25','登录成功','huangbin'),(327,'0:0:0:0:0:0:0:1','登录','2018-03-12 17:05:42','登录成功','huangbin'),(328,'0:0:0:0:0:0:0:1','登录','2018-03-12 17:09:00','登录成功','huangbin'),(329,'0:0:0:0:0:0:0:1','登录','2018-03-12 17:16:59','登录成功','huangbin'),(330,'0:0:0:0:0:0:0:1','登录','2018-03-12 17:29:40','登录成功','huangbin'),(331,'0:0:0:0:0:0:0:1','登录','2018-03-12 17:47:52','登录成功','huangbin'),(332,'0:0:0:0:0:0:0:1','登录','2018-03-12 17:58:41','登录成功','huangbin'),(333,'0:0:0:0:0:0:0:1','登录','2018-03-12 18:04:51','登录成功','huangbin'),(334,'0:0:0:0:0:0:0:1','登录','2018-03-12 18:09:08','登录成功','huangbin'),(335,'0:0:0:0:0:0:0:1','登录','2018-03-12 20:04:24','登录成功','huangbin'),(336,'0:0:0:0:0:0:0:1','登录','2018-03-24 08:37:26','登录成功','huangbin'),(337,'0:0:0:0:0:0:0:1','登录','2018-03-24 14:56:43','登录成功','huangbin'),(338,'0:0:0:0:0:0:0:1','登录','2018-03-24 15:01:34','登录成功','huangbin'),(339,'0:0:0:0:0:0:0:1','登录','2018-03-24 15:11:12','登录成功','huangbin'),(340,'0:0:0:0:0:0:0:1','登录','2018-03-24 15:17:14','登录成功','huangbin'),(341,'0:0:0:0:0:0:0:1','登录','2018-03-24 15:25:19','登录成功','huangbin'),(342,'0:0:0:0:0:0:0:1','登录','2018-03-24 15:27:59','登录成功','huangbin'),(343,'0:0:0:0:0:0:0:1','登录','2018-03-24 15:31:11','登录成功','huangbin'),(344,'0:0:0:0:0:0:0:1','登录','2018-03-24 15:38:50','登录成功','huangbin'),(345,'0:0:0:0:0:0:0:1','登录','2018-03-24 16:01:08','登录成功','huangbin'),(346,'0:0:0:0:0:0:0:1','登录','2018-03-24 16:17:34','登录成功','huangbin'),(347,'0:0:0:0:0:0:0:1','登录','2018-03-24 16:21:00','登录成功','huangbin'),(348,'0:0:0:0:0:0:0:1','登录','2018-03-24 16:22:55','登录成功','huangbin'),(349,'0:0:0:0:0:0:0:1','登录','2018-03-24 16:31:49','登录成功','huangbin'),(350,'0:0:0:0:0:0:0:1','登录','2018-03-24 16:42:22','登录成功','huangbin'),(351,'0:0:0:0:0:0:0:1','登录','2018-03-24 16:49:06','登录成功','huangbin'),(352,'0:0:0:0:0:0:0:1','登录','2018-03-24 16:54:56','登录成功','huangbin'),(353,'0:0:0:0:0:0:0:1','登录','2018-03-24 17:02:49','登录成功','huangbin'),(354,'0:0:0:0:0:0:0:1','登录','2018-03-24 17:09:42','登录成功','huangbin'),(355,'0:0:0:0:0:0:0:1','登录','2018-03-24 17:15:11','登录成功','huangbin'),(356,'0:0:0:0:0:0:0:1','登录','2018-03-24 18:58:33','登录成功','huangbin'),(357,'0:0:0:0:0:0:0:1','登录','2018-03-24 19:11:27','登录成功','huangbin'),(358,'0:0:0:0:0:0:0:1','登录','2018-03-24 19:17:43','登录成功','huangbin'),(359,'0:0:0:0:0:0:0:1','登录','2018-03-24 19:23:04','登录成功','huangbin'),(360,'0:0:0:0:0:0:0:1','登录','2018-03-24 19:26:58','登录成功','huangbin'),(361,'0:0:0:0:0:0:0:1','登录','2018-03-24 20:59:14','登录成功','huangbin'),(362,'0:0:0:0:0:0:0:1','登录','2018-03-24 21:06:31','登录成功','huangbin'),(363,'0:0:0:0:0:0:0:1','登录','2018-03-24 21:12:36','登录成功','huangbin'),(364,'0:0:0:0:0:0:0:1','登录','2018-03-24 22:10:37','登录成功','huangbin'),(365,'0:0:0:0:0:0:0:1','登录','2018-03-24 22:11:59','登录成功','huangbin'),(366,'0:0:0:0:0:0:0:1','登录','2018-03-24 22:19:25','登录成功','huangbin'),(367,'0:0:0:0:0:0:0:1','登录','2018-03-24 22:26:25','登录成功','huangbin'),(368,'0:0:0:0:0:0:0:1','登录','2018-03-24 22:32:29','登录成功','huangbin'),(369,'0:0:0:0:0:0:0:1','登录','2018-03-24 22:41:50','登录成功','huangbin'),(370,'0:0:0:0:0:0:0:1','登录','2018-03-24 22:44:37','登录成功','huangbin'),(371,'0:0:0:0:0:0:0:1','登录','2018-03-24 22:51:00','登录失败','liyao'),(372,'0:0:0:0:0:0:0:1','登录','2018-03-24 22:51:05','登录成功','huangbin'),(373,'0:0:0:0:0:0:0:1','登录','2018-03-24 22:56:08','登录成功','huangbin'),(374,'0:0:0:0:0:0:0:1','登录','2018-03-24 23:00:01','登录成功','huangbin'),(375,'0:0:0:0:0:0:0:1','登录','2018-03-24 23:08:54','登录成功','huangbin'),(376,'0:0:0:0:0:0:0:1','登录','2018-03-24 23:24:55','登录成功','huangbin'),(377,'0:0:0:0:0:0:0:1','登录','2018-03-24 23:30:31','登录成功','huangbin'),(378,'0:0:0:0:0:0:0:1','登录','2018-03-24 23:39:16','登录成功','huangbin'),(379,'0:0:0:0:0:0:0:1','登录','2018-03-24 23:44:08','登录成功','huangbin'),(380,'0:0:0:0:0:0:0:1','登录','2018-03-24 23:58:43','登录成功','huangbin'),(381,'0:0:0:0:0:0:0:1','登录','2018-03-25 00:05:05','登录成功','huangbin'),(382,'0:0:0:0:0:0:0:1','登录','2018-03-25 00:11:52','登录成功','huangbin'),(383,'0:0:0:0:0:0:0:1','登录','2018-03-25 00:18:50','登录成功','huangbin'),(384,'0:0:0:0:0:0:0:1','登录','2018-03-25 00:22:52','登录成功','huangbin');
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
-- Table structure for table `t_wo_material_cost`
--

DROP TABLE IF EXISTS `t_wo_material_cost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_wo_material_cost` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `auth_key` varchar(20) DEFAULT NULL,
  `mat_amount` bigint(20) DEFAULT NULL,
  `mat_model` varchar(30) DEFAULT NULL,
  `mat_name` varchar(50) DEFAULT NULL,
  `mat_price` double DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `work_order_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_47q5kby5n8e8tviypjkny4be1` (`work_order_id`),
  CONSTRAINT `FK_47q5kby5n8e8tviypjkny4be1` FOREIGN KEY (`work_order_id`) REFERENCES `t_work_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_wo_material_cost`
--

LOCK TABLES `t_wo_material_cost` WRITE;
/*!40000 ALTER TABLE `t_wo_material_cost` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_wo_material_cost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_work_flow`
--

DROP TABLE IF EXISTS `t_work_flow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_work_flow` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(50) DEFAULT NULL,
  `name` varchar(20) NOT NULL,
  `sort_no` bigint(20) NOT NULL,
  `status` varchar(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_work_flow`
--

LOCK TABLES `t_work_flow` WRITE;
/*!40000 ALTER TABLE `t_work_flow` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_work_flow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_work_flow_event`
--

DROP TABLE IF EXISTS `t_work_flow_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_work_flow_event` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(50) DEFAULT NULL,
  `is_auto` bit(1) NOT NULL,
  `name` varchar(20) NOT NULL,
  `sort_no` bigint(20) NOT NULL,
  `status` varchar(1) NOT NULL,
  `trigger_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_work_flow_event`
--

LOCK TABLES `t_work_flow_event` WRITE;
/*!40000 ALTER TABLE `t_work_flow_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_work_flow_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_work_flow_instance`
--

DROP TABLE IF EXISTS `t_work_flow_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_work_flow_instance` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(50) DEFAULT NULL,
  `name` varchar(20) NOT NULL,
  `sort_no` bigint(20) NOT NULL,
  `status` varchar(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_work_flow_instance`
--

LOCK TABLES `t_work_flow_instance` WRITE;
/*!40000 ALTER TABLE `t_work_flow_instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_work_flow_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_work_flow_node`
--

DROP TABLE IF EXISTS `t_work_flow_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_work_flow_node` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `node_desc` varchar(50) DEFAULT NULL,
  `node_index` bigint(20) DEFAULT NULL,
  `sort_no` bigint(20) NOT NULL,
  `status` varchar(1) NOT NULL,
  `work_flow_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_9fn1behkr9u1cb92502v0e8hc` (`work_flow_id`),
  CONSTRAINT `FK_9fn1behkr9u1cb92502v0e8hc` FOREIGN KEY (`work_flow_id`) REFERENCES `t_work_flow` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_work_flow_node`
--

LOCK TABLES `t_work_flow_node` WRITE;
/*!40000 ALTER TABLE `t_work_flow_node` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_work_flow_node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_work_flow_node_comment`
--

DROP TABLE IF EXISTS `t_work_flow_node_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_work_flow_node_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment` varchar(200) NOT NULL,
  `sort_no` bigint(20) NOT NULL,
  `status` varchar(1) NOT NULL,
  `work_flow_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ppyfhwuxnl66mhoj16bea1qwn` (`work_flow_id`),
  CONSTRAINT `FK_ppyfhwuxnl66mhoj16bea1qwn` FOREIGN KEY (`work_flow_id`) REFERENCES `t_work_flow` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_work_flow_node_comment`
--

LOCK TABLES `t_work_flow_node_comment` WRITE;
/*!40000 ALTER TABLE `t_work_flow_node_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_work_flow_node_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_work_order`
--

DROP TABLE IF EXISTS `t_work_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_work_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `auth_key` varchar(20) DEFAULT NULL,
  `creator` varchar(20) DEFAULT NULL,
  `deadline` varchar(20) DEFAULT NULL,
  `expired` bit(1) DEFAULT NULL,
  `order_desc` varchar(200) DEFAULT NULL,
  `order_line_no` varchar(20) NOT NULL,
  `order_state` varchar(1) DEFAULT NULL,
  `report_time` varchar(255) DEFAULT NULL,
  `report_type` varchar(1) DEFAULT NULL,
  `reporter` varchar(20) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `eq_class_id` bigint(20) DEFAULT NULL,
  `equipment_id` bigint(20) DEFAULT NULL,
  `location_id` bigint(20) DEFAULT NULL,
  `unit_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_tcoxj627n0epl2lx2hn6d6nh3` (`order_line_no`),
  KEY `FK_10w4ypnular8c3q8031h6qgg3` (`eq_class_id`),
  KEY `FK_a8l8xr88dnnc325v04ddyraf` (`equipment_id`),
  KEY `FK_7pf71kl93j7iypvbrjqaogxtm` (`location_id`),
  KEY `FK_4iuwkrbjxgnsthtf1lwx0q7tb` (`unit_id`),
  CONSTRAINT `FK_10w4ypnular8c3q8031h6qgg3` FOREIGN KEY (`eq_class_id`) REFERENCES `t_eq_class` (`id`),
  CONSTRAINT `FK_4iuwkrbjxgnsthtf1lwx0q7tb` FOREIGN KEY (`unit_id`) REFERENCES `t_unit` (`id`),
  CONSTRAINT `FK_7pf71kl93j7iypvbrjqaogxtm` FOREIGN KEY (`location_id`) REFERENCES `t_location` (`id`),
  CONSTRAINT `FK_a8l8xr88dnnc325v04ddyraf` FOREIGN KEY (`equipment_id`) REFERENCES `t_equipment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_work_order`
--

LOCK TABLES `t_work_order` WRITE;
/*!40000 ALTER TABLE `t_work_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_work_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_work_order_log`
--

DROP TABLE IF EXISTS `t_work_order_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_work_order_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `auth_key` varchar(20) DEFAULT NULL,
  `content` varchar(200) DEFAULT NULL,
  `creator` varchar(20) DEFAULT NULL,
  `order_state` varchar(1) DEFAULT NULL,
  `order_state_time` varchar(20) DEFAULT NULL,
  `sort_no` bigint(20) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `work_order_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_23dvvwd3e0ilslxdmwhe81nq9` (`work_order_id`),
  CONSTRAINT `FK_23dvvwd3e0ilslxdmwhe81nq9` FOREIGN KEY (`work_order_id`) REFERENCES `t_work_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_work_order_log`
--

LOCK TABLES `t_work_order_log` WRITE;
/*!40000 ALTER TABLE `t_work_order_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_work_order_log` ENABLE KEYS */;
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
/*!50001 VIEW `v_role_auth_view` AS select `r`.`id` AS `id`,`r`.`resource_code` AS `resource_code`,`r`.`resource_level` AS `resource_level`,`r`.`resource_name` AS `resource_name`,`r`.`resource_name` AS `resource_desc`,`r`.`icon_class` AS `icon_class`,`rr`.`role_id` AS `role_id`,`r`.`parent_id` AS `parent_id`,`r`.`app_name` AS `app_name`,`r`.`resource_url` AS `resource_url`,`r`.`sort_no` AS `sort_no` from (`t_resource` `r` left join `t_role_resource` `rr` on((`r`.`id` = `rr`.`resource_id`))) order by `rr`.`role_id`,`r`.`resource_code` */;
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

-- Dump completed on 2018-03-25  0:24:02
