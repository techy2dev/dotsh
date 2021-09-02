-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: localhost    Database: vpn
-- ------------------------------------------------------
-- Server version	5.7.27-0ubuntu0.18.04.1

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
-- Table structure for table `bulk_counter`
--

DROP TABLE IF EXISTS `bulk_counter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bulk_counter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prefix` varchar(200) NOT NULL,
  `count` int(255) NOT NULL,
  `created_date` date DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bulk_counter`
--

LOCK TABLES `bulk_counter` WRITE;
/*!40000 ALTER TABLE `bulk_counter` DISABLE KEYS */;
INSERT INTO `bulk_counter` VALUES (2,'rr',2,'2019-10-10',2),(3,'de',3,'2019-10-11',3),(4,'ok',3,'2019-10-11',3),(5,'do',2,'2019-10-11',3),(6,'bit',1,'2019-10-11',3),(7,'ee',100,'2019-10-11',1),(8,'Do',10,'2019-10-11',1);
/*!40000 ALTER TABLE `bulk_counter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history_table`
--

DROP TABLE IF EXISTS `history_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `a_id` int(11) DEFAULT NULL,
  `r_id` int(11) DEFAULT NULL,
  `s_id` int(11) DEFAULT NULL,
  `user_name` varchar(100) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `credit` int(11) DEFAULT '0',
  `action` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=100 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history_table`
--

LOCK TABLES `history_table` WRITE;
/*!40000 ALTER TABLE `history_table` DISABLE KEYS */;
INSERT INTO `history_table` VALUES (96,2,NULL,NULL,'','2019-10-09 21:00:00',1,'Insert  1 User '),(97,1,NULL,NULL,'','2019-10-10 21:00:00',1,'Insert  1 User '),(98,1,NULL,NULL,'','2019-10-10 21:00:00',1,'Insert  1 User '),(99,1,NULL,NULL,'','2019-10-10 21:00:00',1,'Insert  1 User ');
/*!40000 ALTER TABLE `history_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice_table`
--

DROP TABLE IF EXISTS `notice_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notice_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notice` varchar(500) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice_table`
--

LOCK TABLES `notice_table` WRITE;
/*!40000 ALTER TABLE `notice_table` DISABLE KEYS */;
INSERT INTO `notice_table` VALUES (1,'Notice For Reseller',1),(4,'notice',0);
/*!40000 ALTER TABLE `notice_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reseller_details`
--

DROP TABLE IF EXISTS `reseller_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reseller_details` (
  `user_name` varchar(500) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `reseller_bal` int(11) DEFAULT '0',
  `password` varchar(100) NOT NULL,
  `phone_number` varchar(100) DEFAULT NULL,
  `number_of_users` int(11) DEFAULT NULL,
  `status` enum('0','1') DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL,
  `comments` varchar(500) DEFAULT NULL,
  `login_date` date DEFAULT NULL,
  `created_on` date DEFAULT NULL,
  `types` varchar(225) DEFAULT 'reseller',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reseller_details`
--

LOCK TABLES `reseller_details` WRITE;
/*!40000 ALTER TABLE `reseller_details` DISABLE KEYS */;
INSERT INTO `reseller_details` VALUES ('AdminResellers',NULL,121,'123456',NULL,10,'0',1,2,NULL,'2019-09-30','2019-09-30','Admin'),('AdminSubsellers',NULL,100,'1',NULL,10,'0',2,2,NULL,NULL,'2019-09-30','reseller'),('test',NULL,89,'1234',NULL,0,'0',3,2,NULL,'2019-10-03','2019-10-03','reseller'),('',NULL,0,'asd',NULL,10,'0',4,2,NULL,NULL,'2019-10-10','reseller'),('',NULL,0,'ddd',NULL,10,'0',5,2,NULL,NULL,'2019-10-10','reseller'),('',NULL,0,'sad',NULL,10,'0',6,2,NULL,NULL,'2019-10-10','reseller'),('okvpn',NULL,0,'1234',NULL,1,'0',7,3,NULL,NULL,'2019-10-11','reseller'),('ccccccc',NULL,0,'ccccc',NULL,0,'0',8,1,NULL,NULL,'2019-10-11','reseller');
/*!40000 ALTER TABLE `reseller_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servers`
--

DROP TABLE IF EXISTS `servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servers` (
  `server_ip` int(225) NOT NULL AUTO_INCREMENT,
  `server_name` varchar(500) DEFAULT NULL,
  `user_name` varchar(100) NOT NULL,
  `password` varchar(500) NOT NULL,
  `linux_distro` varchar(100) NOT NULL,
  `vpn_type` varchar(100) NOT NULL,
  PRIMARY KEY (`server_ip`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servers`
--

LOCK TABLES `servers` WRITE;
/*!40000 ALTER TABLE `servers` DISABLE KEYS */;
/*!40000 ALTER TABLE `servers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subreseller_detail`
--

DROP TABLE IF EXISTS `subreseller_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subreseller_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `r_id` int(11) DEFAULT NULL,
  `subseller_id` int(11) DEFAULT NULL,
  `user_name` varchar(125) NOT NULL,
  `email` varchar(125) DEFAULT NULL,
  `subseller_bal` varchar(500) DEFAULT NULL,
  `password` varchar(125) NOT NULL,
  `phone_number` int(15) DEFAULT NULL,
  `number_of_user` int(15) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `comments` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subreseller_detail`
--

LOCK TABLES `subreseller_detail` WRITE;
/*!40000 ALTER TABLE `subreseller_detail` DISABLE KEYS */;
INSERT INTO `subreseller_detail` VALUES (1,1,NULL,'AdminSubsellers',NULL,'8','1',NULL,NULL,0,NULL),(2,1,NULL,'AdminResellers',NULL,NULL,'1',NULL,NULL,0,NULL),(3,2,NULL,'ASubSeller',NULL,'100','1',NULL,NULL,0,NULL),(4,1,NULL,'dd',NULL,NULL,'1',NULL,NULL,0,NULL),(5,1,NULL,'aa',NULL,'11','1',NULL,NULL,0,NULL),(6,1,NULL,'qq',NULL,'12','1',NULL,NULL,0,NULL),(7,1,NULL,'subSeller',NULL,'0','1',NULL,NULL,0,NULL),(8,1,NULL,'ss',NULL,'10','q',NULL,NULL,0,NULL),(9,2,NULL,'uu',NULL,NULL,'2',NULL,NULL,0,NULL),(10,2,NULL,'ee',NULL,'22','2',NULL,NULL,0,NULL),(11,NULL,1,'subNew',NULL,'1','1',NULL,NULL,0,NULL),(12,NULL,1,'subqq',NULL,'1','1',NULL,NULL,0,NULL),(13,2,NULL,'sub123',NULL,'11','1',NULL,NULL,0,NULL),(14,2,NULL,'sub12',NULL,NULL,'1',NULL,NULL,0,NULL),(15,1,NULL,'sub13',NULL,'0','1',NULL,NULL,0,NULL),(16,1,NULL,'sub14',NULL,'11','1',NULL,NULL,0,NULL);
/*!40000 ALTER TABLE `subreseller_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_logins`
--

DROP TABLE IF EXISTS `user_logins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_logins` (
  `user_name` varchar(500) NOT NULL,
  `password` varchar(100) NOT NULL,
  `crd` int(11) NOT NULL DEFAULT '1',
  `sts` varchar(500) DEFAULT '0',
  `online` varchar(500) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `added_by` int(11) NOT NULL,
  `added_id` int(11) DEFAULT NULL,
  `comments` varchar(500) DEFAULT NULL,
  `login_date` date DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `expire_after` int(3) DEFAULT NULL,
  `bulk_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_logins`
--

LOCK TABLES `user_logins` WRITE;
/*!40000 ALTER TABLE `user_logins` DISABLE KEYS */;
INSERT INTO `user_logins` VALUES ('ssssssddddddddd','test',1,'0',NULL,70,298,NULL,NULL,NULL,'2019-10-09 00:00:00',NULL,1,NULL),('rr_6953','8926',1,'1',NULL,74,2,NULL,NULL,NULL,'2019-10-10 00:00:00',NULL,1,2),('rr_5704','1746',1,'1',NULL,75,2,NULL,NULL,NULL,'2019-10-10 00:00:00',NULL,1,2),('aaa','aaaa',1,'1','1',76,2,NULL,NULL,NULL,'2019-10-10 00:00:00',NULL,1,NULL),('de_8769','4321',1,'1',NULL,77,3,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,3),('de_1260','7349',1,'1',NULL,78,3,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,3),('de_3457','5406',1,'1',NULL,79,3,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,3),('ok_7495','9640',1,'1',NULL,80,3,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,4),('ok_7601','1843',1,'1',NULL,81,3,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,4),('ok_6720','4587',1,'1',NULL,82,3,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,4),('do_3107','9528',1,'1',NULL,83,3,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,5),('do_0513','7065',1,'1',NULL,84,3,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,5),('bit6835','0521',1,'1','0',85,3,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,6),('aaa','aaa',1,'1','1',86,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,NULL),('ffff','fff',1,'1',NULL,87,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,NULL),('1111111','111',1,'0',NULL,88,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,NULL),('ee5834','0453',1,'1',NULL,89,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee0941','3975',1,'1',NULL,90,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee7415','9364',1,'1',NULL,91,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee6097','5971',1,'1',NULL,92,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee3465','7843',1,'1',NULL,93,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee3054','4651',1,'1',NULL,94,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee0132','8057',1,'1',NULL,95,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee6352','5120',1,'1',NULL,96,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee5634','9032',1,'1',NULL,97,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee9026','6308',1,'1',NULL,98,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee0398','3592',1,'1',NULL,99,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee8073','3617',1,'1',NULL,100,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee8196','3260',1,'1',NULL,101,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee3215','0596',1,'1',NULL,102,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee0973','7241',1,'1',NULL,103,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee3068','5917',1,'1',NULL,104,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee5632','7912',1,'1',NULL,105,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee1078','2643',1,'1',NULL,106,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee1785','0418',1,'1',NULL,107,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee6395','9372',1,'1',NULL,108,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee0167','3526',1,'1',NULL,109,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee7850','0376',1,'1',NULL,110,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee3482','3978',1,'1',NULL,111,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee5067','9524',1,'1',NULL,112,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee6143','3517',1,'1',NULL,113,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee0457','3915',1,'1',NULL,114,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee2495','5768',1,'1',NULL,115,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee1453','3520',1,'1',NULL,116,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee7843','3946',1,'1',NULL,117,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee0714','9741',1,'1',NULL,118,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee5164','5802',1,'1',NULL,119,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee0248','1602',1,'1',NULL,120,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee9687','3851',1,'1',NULL,121,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee2697','6913',1,'1',NULL,122,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee7134','0976',1,'1',NULL,123,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee1058','7561',1,'1',NULL,124,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee8695','8694',1,'1',NULL,125,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee8435','8376',1,'1',NULL,126,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee5416','0457',1,'1',NULL,127,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee8916','3601',1,'1',NULL,128,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee7985','8654',1,'1',NULL,129,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee7260','0526',1,'1',NULL,130,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee2730','1209',1,'1',NULL,131,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee3509','9652',1,'1',NULL,132,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee9264','9584',1,'1',NULL,133,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee5014','0398',1,'1',NULL,134,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee3421','4185',1,'1',NULL,135,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee3172','3965',1,'1',NULL,136,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee6128','3764',1,'1',NULL,137,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee4820','1230',1,'1',NULL,138,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee5829','3981',1,'1',NULL,139,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee2975','7406',1,'1',NULL,140,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee3480','1547',1,'1',NULL,141,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee1924','3147',1,'1',NULL,142,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee3654','8654',1,'1',NULL,143,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee7439','9461',1,'1',NULL,144,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee6143','2306',1,'1',NULL,145,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee6137','1738',1,'1',NULL,146,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee9473','5162',1,'1',NULL,147,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee2981','5864',1,'1',NULL,148,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee8391','5482',1,'1',NULL,149,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee6754','7486',1,'1',NULL,150,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee1089','8349',1,'1',NULL,151,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee5718','0965',1,'1',NULL,152,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee2941','7025',1,'1',NULL,153,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee2694','8056',1,'1',NULL,154,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee3025','8413',1,'1',NULL,155,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee5394','4806',1,'1',NULL,156,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee6578','0843',1,'1',NULL,157,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee2370','4176',1,'1',NULL,158,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee9840','5862',1,'1',NULL,159,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee2817','0964',1,'1',NULL,160,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee3954','8519',1,'1',NULL,161,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee6904','2170',1,'1',NULL,162,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee6972','5291',1,'1',NULL,163,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee6293','5023',1,'1',NULL,164,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee6980','3492',1,'1',NULL,165,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee6391','9278',1,'1',NULL,166,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee0659','0896',1,'1',NULL,167,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee0864','7163',1,'1',NULL,168,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee6814','2861',1,'1',NULL,169,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee1657','9827',1,'1',NULL,170,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee0247','0231',1,'1',NULL,171,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee5169','4265',1,'1',NULL,172,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee9207','5906',1,'1',NULL,173,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee2739','6305',1,'1',NULL,174,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee1036','6307',1,'1',NULL,175,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee4975','7346',1,'1',NULL,176,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee1826','2875',1,'1',NULL,177,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee1046','6257',1,'1',NULL,178,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee6792','9806',1,'1',NULL,179,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee0463','7018',1,'1',NULL,180,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee4625','2394',1,'1',NULL,181,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee5976','2869',1,'1',NULL,182,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee2495','6850',1,'1',NULL,183,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee8796','6328',1,'1',NULL,184,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee3590','8153',1,'1',NULL,185,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee8104','6213',1,'1',NULL,186,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee3274','6239',1,'1',NULL,187,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7),('ee6970','1403',1,'1',NULL,188,1,NULL,NULL,NULL,'2019-10-11 00:00:00',NULL,1,7);
/*!40000 ALTER TABLE `user_logins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'Admin','admin@admin.com','12345678',NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-13 15:19:49
