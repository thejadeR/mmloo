-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: mmloo
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add good',7,'add_good'),(20,'Can change good',7,'change_good'),(21,'Can delete good',7,'delete_good'),(22,'Can add lunbo',8,'add_lunbo'),(23,'Can change lunbo',8,'change_lunbo'),(24,'Can delete lunbo',8,'delete_lunbo'),(25,'Can add user info',9,'add_userinfo'),(26,'Can change user info',9,'change_userinfo'),(27,'Can delete user info',9,'delete_userinfo'),(28,'Can add cart',10,'add_cart'),(29,'Can change cart',10,'change_cart'),(30,'Can delete cart',10,'delete_cart'),(31,'Can add detail',11,'add_detail'),(32,'Can change detail',11,'change_detail'),(33,'Can delete detail',11,'delete_detail'),(34,'Can add order',12,'add_order'),(35,'Can change order',12,'change_order'),(36,'Can delete order',12,'delete_order'),(37,'Can add order goods',13,'add_ordergoods'),(38,'Can change order goods',13,'change_ordergoods'),(39,'Can delete order goods',13,'delete_ordergoods');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$36000$42XMeylPk7rZ$L5D6oE6JmWscf9tWWw5Zg/YIrjNHwHQN/bsQFRRKPrc=','2018-12-12 13:11:00.107528',1,'mmloo','','','mmloo@mail.com',1,1,'2018-12-11 02:45:43.586752');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2018-12-11 03:07:39.470485','1','图片详情:123-创建时间:2018-12-11 03:07:39.442484+00:00-最后修改时间:2018-12-11 03:07:39.442484+00:00-图片名字:lunboimg/u14977927973763193612fm111gp0.jpg',1,'[{\"added\": {}}]',8,1),(2,'2018-12-11 03:16:22.986212','2','图片详情:666-创建时间:2018-12-11 03:16:22.966211+00:00-最后修改时间:2018-12-11 03:16:22.966211+00:00-图片名字:uploadfiles/lunboimg/u7186103533390032869fm27gp0_h4rI4Su.jpg',1,'[{\"added\": {}}]',8,1),(3,'2018-12-11 03:18:04.368933','3','图片详情:把握时机-创建时间:2018-12-11 03:18:04.364933+00:00-最后修改时间:2018-12-11 03:18:04.364933+00:00-图片名字:uploadfiles/lunboimg/lunbo1.png',1,'[{\"added\": {}}]',8,1),(4,'2018-12-11 03:18:22.437807','4','图片详情:满0减10-创建时间:2018-12-11 03:18:22.409805+00:00-最后修改时间:2018-12-11 03:18:22.409805+00:00-图片名字:uploadfiles/lunboimg/lunbo2.jpg',1,'[{\"added\": {}}]',8,1),(5,'2018-12-11 03:18:34.887949','5','图片详情:360全景相机-创建时间:2018-12-11 03:18:34.848947+00:00-最后修改时间:2018-12-11 03:18:34.848947+00:00-图片名字:uploadfiles/lunboimg/lunbo3.jpg',1,'[{\"added\": {}}]',8,1),(6,'2018-12-11 03:18:49.573194','6','图片详情:纸尿裤特价-创建时间:2018-12-11 03:18:49.465187+00:00-最后修改时间:2018-12-11 03:18:49.465187+00:00-图片名字:uploadfiles/lunboimg/lunbo4.jpg',1,'[{\"added\": {}}]',8,1),(7,'2018-12-11 03:19:07.151427','7','图片详情:年货节-创建时间:2018-12-11 03:19:07.125425+00:00-最后修改时间:2018-12-11 03:19:07.126426+00:00-图片名字:uploadfiles/lunboimg/lunbo5.jpg',1,'[{\"added\": {}}]',8,1),(8,'2018-12-11 03:19:22.397238','8','图片详情:beats耳机-创建时间:2018-12-11 03:19:22.383237+00:00-最后修改时间:2018-12-11 03:19:22.383237+00:00-图片名字:uploadfiles/lunboimg/lunbo6.png',1,'[{\"added\": {}}]',8,1),(9,'2018-12-11 03:34:34.119832','8','图片详情:把握时机-创建时间:2018-12-11 03:19:22.383237+00:00-最后修改时间:2018-12-11 03:34:34.074829+00:00-图片名字:uploadfiles/lunboimg/lunbo6.png',2,'[{\"changed\": {\"fields\": [\"db_img_detail\"]}}]',8,1),(10,'2018-12-11 03:35:48.226344','4','图片详情:满50减10-创建时间:2018-12-11 03:18:22.409805+00:00-最后修改时间:2018-12-11 03:35:48.205342+00:00-图片名字:uploadfiles/lunboimg/lunbo2.jpg',2,'[{\"changed\": {\"fields\": [\"db_img_detail\"]}}]',8,1),(11,'2018-12-11 03:36:12.401760','8','图片详情:Beats耳机-创建时间:2018-12-11 03:19:22.383237+00:00-最后修改时间:2018-12-11 03:36:12.345757+00:00-图片名字:uploadfiles/lunboimg/lunbo6.png',2,'[{\"changed\": {\"fields\": [\"db_img_detail\"]}}]',8,1),(12,'2018-12-12 13:29:53.465352','2','得力(deli)7083 安全石墨铅芯素描 绘图HB铅笔/学生铅笔',1,'[{\"added\": {}}]',7,1),(13,'2018-12-12 13:36:04.098551','3','苹果（APPLE）iPhone 6s 32G 公开版 玫瑰金',1,'[{\"added\": {}}]',7,1),(14,'2018-12-12 13:37:49.199562','4','Deli/得力 7063水彩笔三角笔杆18色大容量可水洗 学生绘',1,'[{\"added\": {}}]',7,1),(15,'2018-12-12 13:42:33.636831','5','得力（deli）7702 便签纸/便条纸(147×101mm) 单本装',1,'[{\"added\": {}}]',7,1),(16,'2018-12-12 13:43:28.192952','6','得力（deli）7702 便签纸/便条纸(147×101mm) 单本装',1,'[{\"added\": {}}]',7,1),(17,'2018-12-12 13:45:22.934515','5','得力（deli） 7151 便签纸/便签本/便利贴/百事贴/易事贴',2,'[{\"changed\": {\"fields\": [\"good_detail\", \"good_price\", \"market_price\"]}}]',7,1),(18,'2018-12-12 14:09:23.033884','6','得力（deli）7702 便签纸/便条纸(147×101mm) 单本装',2,'[{\"changed\": {\"fields\": [\"goodid\"]}}]',7,1),(19,'2018-12-12 14:09:41.129919','2','得力(deli)7083 安全石墨铅芯素描 绘图HB铅笔/学生铅笔',2,'[{\"changed\": {\"fields\": [\"goodid\"]}}]',7,1),(20,'2018-12-12 14:09:49.223381','4','Deli/得力 7063水彩笔三角笔杆18色大容量可水洗 学生绘',2,'[{\"changed\": {\"fields\": [\"goodid\"]}}]',7,1),(21,'2018-12-12 14:10:15.785901','5','得力（deli） 7151 便签纸/便签本/便利贴/百事贴/易事贴',2,'[{\"changed\": {\"fields\": [\"goodid\"]}}]',7,1),(22,'2018-12-13 01:04:33.033710','3','苹果（APPLE）iPhone 6s 32G 公开版 玫瑰金',2,'[{\"changed\": {\"fields\": [\"good_price\", \"market_price\"]}}]',7,1),(23,'2018-12-13 01:20:49.777577','3','苹果（APPLE）iPhone 6s 32G 公开版 玫瑰金',2,'[{\"changed\": {\"fields\": [\"good_fffarther\", \"good_ffarther\", \"good_farther\", \"good_explain\", \"good_comment\", \"good_freight\"]}}]',7,1),(24,'2018-12-13 01:22:32.288440','6','得力（deli）7702 便签纸/便条纸(147×101mm) 单本装',2,'[{\"changed\": {\"fields\": [\"good_fffarther\", \"good_ffarther\", \"good_farther\", \"good_explain\", \"good_comment\"]}}]',7,1),(25,'2018-12-13 01:24:25.245901','5','得力（deli） 7151 便签纸/便签本/便利贴/百事贴/易事贴',2,'[{\"changed\": {\"fields\": [\"good_fffarther\", \"good_ffarther\", \"good_farther\", \"good_explain\", \"good_comment\"]}}]',7,1),(26,'2018-12-13 01:25:49.497720','5','得力（deli） 7151 便签纸/便签本/便利贴/百事贴/易事贴',2,'[{\"changed\": {\"fields\": [\"good_explain\", \"good_comment\"]}}]',7,1),(27,'2018-12-13 01:25:49.597725','5','得力（deli） 7151 便签纸/便签本/便利贴/百事贴/易事贴',2,'[{\"changed\": {\"fields\": [\"good_explain\", \"good_comment\"]}}]',7,1),(28,'2018-12-13 01:26:44.145845','4','Deli/得力 7063水彩笔三角笔杆18色大容量可水洗 学生绘',2,'[{\"changed\": {\"fields\": [\"good_fffarther\", \"good_ffarther\", \"good_farther\", \"good_explain\", \"good_comment\"]}}]',7,1),(29,'2018-12-13 01:27:58.456096','6','得力（deli）7702 便签纸/便条纸(147×101mm) 单本装',2,'[{\"changed\": {\"fields\": [\"good_explain\", \"good_comment\"]}}]',7,1),(30,'2018-12-13 01:28:36.470270','2','得力(deli)7083 安全石墨铅芯素描 绘图HB铅笔/学生铅笔',2,'[{\"changed\": {\"fields\": [\"good_fffarther\", \"good_ffarther\", \"good_farther\", \"good_explain\", \"good_comment\"]}}]',7,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(10,'mmloo_shop','cart'),(11,'mmloo_shop','detail'),(7,'mmloo_shop','good'),(8,'mmloo_shop','lunbo'),(12,'mmloo_shop','order'),(13,'mmloo_shop','ordergoods'),(9,'mmloo_shop','userinfo'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-12-11 02:39:27.446208'),(2,'auth','0001_initial','2018-12-11 02:40:08.214548'),(3,'admin','0001_initial','2018-12-11 02:40:13.519834'),(4,'admin','0002_logentry_remove_auto_add','2018-12-11 02:40:13.651441'),(5,'contenttypes','0002_remove_content_type_name','2018-12-11 02:40:18.591658'),(6,'auth','0002_alter_permission_name_max_length','2018-12-11 02:40:20.519888'),(7,'auth','0003_alter_user_email_max_length','2018-12-11 02:40:24.094610'),(8,'auth','0004_alter_user_username_opts','2018-12-11 02:40:24.317416'),(9,'auth','0005_alter_user_last_login_null','2018-12-11 02:40:25.288040'),(10,'auth','0006_require_contenttypes_0002','2018-12-11 02:40:25.470447'),(11,'auth','0007_alter_validators_add_error_messages','2018-12-11 02:40:25.628654'),(12,'auth','0008_alter_user_username_max_length','2018-12-11 02:40:26.973860'),(13,'mmloo_shop','0001_initial','2018-12-11 02:40:28.779498'),(14,'sessions','0001_initial','2018-12-11 02:40:29.492918'),(15,'mmloo_shop','0002_auto_20181211_1116','2018-12-11 03:16:09.089973'),(16,'mmloo_shop','0003_auto_20181211_1401','2018-12-11 06:01:09.038022'),(17,'mmloo_shop','0004_remove_userinfo_db_uname','2018-12-11 06:34:13.806920'),(18,'mmloo_shop','0005_auto_20181211_1552','2018-12-11 07:53:31.094235'),(19,'mmloo_shop','0006_auto_20181212_1325','2018-12-12 05:25:51.050861'),(20,'mmloo_shop','0007_auto_20181212_2109','2018-12-12 13:10:20.355254'),(21,'mmloo_shop','0008_auto_20181212_2118','2018-12-12 13:18:50.931457'),(22,'mmloo_shop','0009_auto_20181212_2119','2018-12-12 13:19:39.952261'),(23,'mmloo_shop','0010_good_goodid','2018-12-12 14:08:24.318525'),(24,'mmloo_shop','0011_auto_20181213_0918','2018-12-13 01:18:34.065814'),(25,'mmloo_shop','0012_auto_20181213_0930','2018-12-13 01:30:35.043052'),(26,'mmloo_shop','0013_auto_20181213_1557','2018-12-13 07:57:04.482412');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('oo10ogg66vytznfbt7z9wqdodxwm1mrs','MDczZWJkNTZiN2Y1ZGY0YTQ1OWI0YTY4MGRiM2M4NDAxYjA5MGM2Nzp7InRva2VuIjoiZmU1YWViOGU3ZDU1Njg5ZTgzYTUwMjVjMzYwMzVhNmQifQ==','2018-12-27 09:18:38.671344'),('sms7ukpdv6hhrdz5t2qccpxdylc9eaqo','MWZhMGMyMzE0NmRlMWU0YzZmM2JkYzYyOGI4MTgzZDIyZjk3N2E3OTp7InRva2VuIjoiZDM2ZDhhMmQ1OGMwYTg1ODNjMDkwNGI0OTU2MDJkNGEifQ==','2018-12-27 12:05:23.158567');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmloo_carts`
--

DROP TABLE IF EXISTS `mmloo_carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmloo_carts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) NOT NULL,
  `isselect` tinyint(1) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mmloo_carts_goods_id_520cccfd_fk_mmloo_goods_id` (`goods_id`),
  KEY `mmloo_carts_user_id_30c27d33_fk_mmloo_userinfos_id` (`user_id`),
  CONSTRAINT `mmloo_carts_goods_id_520cccfd_fk_mmloo_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `mmloo_goods` (`id`),
  CONSTRAINT `mmloo_carts_user_id_30c27d33_fk_mmloo_userinfos_id` FOREIGN KEY (`user_id`) REFERENCES `mmloo_userinfos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmloo_carts`
--

LOCK TABLES `mmloo_carts` WRITE;
/*!40000 ALTER TABLE `mmloo_carts` DISABLE KEYS */;
/*!40000 ALTER TABLE `mmloo_carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmloo_goods`
--

DROP TABLE IF EXISTS `mmloo_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmloo_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `good_img` varchar(255) NOT NULL,
  `good_detail` varchar(100) NOT NULL,
  `good_price` decimal(10,2) NOT NULL,
  `market_price` decimal(10,2) NOT NULL,
  `picture1` varchar(255) NOT NULL,
  `picture2` varchar(255) NOT NULL,
  `picture3` varchar(255) NOT NULL,
  `picture4` varchar(255) NOT NULL,
  `goodid` int(11) NOT NULL,
  `good_comment` int(11) NOT NULL,
  `good_explain` varchar(255) NOT NULL,
  `good_farther` varchar(15) NOT NULL,
  `good_ffarther` varchar(15) NOT NULL,
  `good_fffarther` varchar(15) NOT NULL,
  `good_freight` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmloo_goods`
--

LOCK TABLES `mmloo_goods` WRITE;
/*!40000 ALTER TABLE `mmloo_goods` DISABLE KEYS */;
INSERT INTO `mmloo_goods` VALUES (2,'uploadfiles/detailimg/blackpen.jpg','得力(deli)7083 安全石墨铅芯素描 绘图HB铅笔/学生铅笔',8.80,12.00,'uploadfiles/detailimg/childrenpen.jpg','uploadfiles/detailimg/办公文具.png','uploadfiles/detailimg/blackpen_RRjTF9F.jpg','uploadfiles/detailimg/blackpen_TaePR2M.jpg',2,9999,'好用的铅笔，画画必备！','办公文具','办公耗材','电脑办公',0.00),(3,'uploadfiles/detailimg/jin1.png','苹果（APPLE）iPhone 6s 32G 公开版 玫瑰金',4299.00,4599.00,'uploadfiles/detailimg/jin1_3bptisS.png','uploadfiles/detailimg/jin2.jpg','uploadfiles/detailimg/samgsun.jpg','uploadfiles/detailimg/huawei.jpg',1,60,'至大之作，至薄之作，不仅大，更加大放异彩，大有动力，大有能效，改变摄像，有颠覆摄像，全凭指尖~','IPhone','手机通讯','手机数码',10.00),(4,'uploadfiles/detailimg/childrenpen_L55zZjP.jpg','Deli/得力 7063水彩笔三角笔杆18色大容量可水洗 学生绘',14.80,19.00,'uploadfiles/detailimg/childrenpen_rTvQV3i.jpg','uploadfiles/detailimg/childrenpen_rpMvumR.jpg','uploadfiles/detailimg/childrenpen_KeRiyeK.jpg','uploadfiles/detailimg/childrenpen_p1BSecQ.jpg',3,456,'好用又实惠的彩笔，各种颜色应有尽有~','办公文具','办公耗材','电脑办公',0.00),(5,'uploadfiles/detailimg/bianlitie.jpg','得力（deli） 7151 便签纸/便签本/便利贴/百事贴/易事贴',9.90,15.00,'uploadfiles/detailimg/bianlitie_1SpssM0.jpg','uploadfiles/detailimg/bianlitie_9jY6xa9.jpg','uploadfiles/detailimg/bianlitie_f3H4VwC.jpg','uploadfiles/detailimg/bianlitie_D4OQOzZ.jpg',4,666,'方便实惠','办公文具','办公耗材','电脑办公',0.00),(6,'uploadfiles/detailimg/zhihe.jpg','得力（deli）7702 便签纸/便条纸(147×101mm) 单本装',5.90,11.00,'uploadfiles/detailimg/zhihe_mwWYxsz.jpg','uploadfiles/detailimg/zhihe_pUyzGwZ.jpg','uploadfiles/detailimg/zhihe_t4IwqV7.jpg','uploadfiles/detailimg/zhihe_5581Xpn.jpg',5,123,'轻巧，方便','办公文具','办公耗材','电脑办公',0.00);
/*!40000 ALTER TABLE `mmloo_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmloo_lunbos`
--

DROP TABLE IF EXISTS `mmloo_lunbos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmloo_lunbos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `db_img` varchar(100) NOT NULL,
  `db_img_detail` varchar(100) NOT NULL,
  `db_img_firsttime` datetime(6) NOT NULL,
  `db_img_lasttime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmloo_lunbos`
--

LOCK TABLES `mmloo_lunbos` WRITE;
/*!40000 ALTER TABLE `mmloo_lunbos` DISABLE KEYS */;
INSERT INTO `mmloo_lunbos` VALUES (3,'uploadfiles/lunboimg/lunbo1.png','把握时机','2018-12-11 03:18:04.364933','2018-12-11 03:18:04.364933'),(4,'uploadfiles/lunboimg/lunbo2.jpg','满50减10','2018-12-11 03:18:22.409805','2018-12-11 03:35:48.205342'),(5,'uploadfiles/lunboimg/lunbo3.jpg','360全景相机','2018-12-11 03:18:34.848947','2018-12-11 03:18:34.848947'),(6,'uploadfiles/lunboimg/lunbo4.jpg','纸尿裤特价','2018-12-11 03:18:49.465187','2018-12-11 03:18:49.465187'),(7,'uploadfiles/lunboimg/lunbo5.jpg','年货节','2018-12-11 03:19:07.125425','2018-12-11 03:19:07.126426'),(8,'uploadfiles/lunboimg/lunbo6.png','Beats耳机','2018-12-11 03:19:22.383237','2018-12-11 03:36:12.345757');
/*!40000 ALTER TABLE `mmloo_lunbos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmloo_shop_order`
--

DROP TABLE IF EXISTS `mmloo_shop_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmloo_shop_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createtime` datetime(6) NOT NULL,
  `status` int(11) NOT NULL,
  `identifier` varchar(256) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mmloo_shop_order_user_id_1531b4c9_fk_mmloo_userinfos_id` (`user_id`),
  CONSTRAINT `mmloo_shop_order_user_id_1531b4c9_fk_mmloo_userinfos_id` FOREIGN KEY (`user_id`) REFERENCES `mmloo_userinfos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmloo_shop_order`
--

LOCK TABLES `mmloo_shop_order` WRITE;
/*!40000 ALTER TABLE `mmloo_shop_order` DISABLE KEYS */;
INSERT INTO `mmloo_shop_order` VALUES (1,'2018-12-13 07:32:36.004420',0,'931915446863561086',13),(2,'2018-12-13 07:35:23.609006',0,'108915446865232344',13),(3,'2018-12-13 07:35:24.024030',0,'928115446865246503',13),(4,'2018-12-13 09:19:26.948105',0,'544915446927662128',13),(5,'2018-12-13 10:47:24.543966',0,'151015446980443737',13),(6,'2018-12-13 11:03:57.488759',0,'297815446990379544',13),(7,'2018-12-13 12:06:04.732945',0,'192815447027646743',13);
/*!40000 ALTER TABLE `mmloo_shop_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmloo_shop_ordergoods`
--

DROP TABLE IF EXISTS `mmloo_shop_ordergoods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmloo_shop_ordergoods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mmloo_shop_ordergoods_goods_id_63589bfc_fk_mmloo_goods_id` (`goods_id`),
  KEY `mmloo_shop_ordergoods_order_id_bb7b764e_fk_mmloo_shop_order_id` (`order_id`),
  CONSTRAINT `mmloo_shop_ordergoods_goods_id_63589bfc_fk_mmloo_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `mmloo_goods` (`id`),
  CONSTRAINT `mmloo_shop_ordergoods_order_id_bb7b764e_fk_mmloo_shop_order_id` FOREIGN KEY (`order_id`) REFERENCES `mmloo_shop_order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmloo_shop_ordergoods`
--

LOCK TABLES `mmloo_shop_ordergoods` WRITE;
/*!40000 ALTER TABLE `mmloo_shop_ordergoods` DISABLE KEYS */;
INSERT INTO `mmloo_shop_ordergoods` VALUES (1,5,4,1),(2,12,3,1),(3,36,6,1),(4,3,3,4),(5,1,3,5),(6,1,4,6),(7,1,2,6),(8,1,3,7);
/*!40000 ALTER TABLE `mmloo_shop_ordergoods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmloo_userinfos`
--

DROP TABLE IF EXISTS `mmloo_userinfos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmloo_userinfos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `db_headimg` varchar(150) NOT NULL,
  `db_utel` varchar(20) NOT NULL,
  `db_upassword` varchar(256) NOT NULL,
  `db_token` varchar(256) NOT NULL,
  `db_uFirstTime` datetime(6) NOT NULL,
  `db_uLastTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `db_utel` (`db_utel`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmloo_userinfos`
--

LOCK TABLES `mmloo_userinfos` WRITE;
/*!40000 ALTER TABLE `mmloo_userinfos` DISABLE KEYS */;
INSERT INTO `mmloo_userinfos` VALUES (9,'person.png','13512345678','bba2667530c0b08b7d3012edfb8f0083','68ed2121b7a2ee485071d15369e4210b','2018-12-11 09:25:47.269008','2018-12-11 09:25:47.270008'),(11,'person.png','13523456789','5d03cd5eea99cf695743d24576c5a99f','5b9fe67d608997f84f353f589ee1dc3a','2018-12-11 10:56:27.866193','2018-12-11 10:56:27.867193'),(12,'person.png','15123456789','bba2667530c0b08b7d3012edfb8f0083','b2b874352d495e0899e710c4a0295e9c','2018-12-11 11:39:22.670463','2018-12-11 11:39:22.671463'),(13,'13-zhihe.jpg','15212345678','2293d78635b64c648ecf8d1be5fa638d','d36d8a2d58c0a8583c0904b495602d4a','2018-12-13 12:05:23.049561','2018-12-11 12:43:18.489859');
/*!40000 ALTER TABLE `mmloo_userinfos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-13 20:55:03
