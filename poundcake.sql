-- MySQL dump 10.13  Distrib 5.5.25, for osx10.6 (i386)
--
-- Host: localhost    Database: poundcake
-- ------------------------------------------------------
-- Server version	5.5.25

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
-- Table structure for table `connectivity_types`
--

DROP TABLE IF EXISTS `connectivity_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `connectivity_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connectivity_types`
--

LOCK TABLES `connectivity_types` WRITE;
/*!40000 ALTER TABLE `connectivity_types` DISABLE KEYS */;
INSERT INTO `connectivity_types` VALUES (1,'V - Vsat'),(2,'G - GSM'),(3,'P - P2P Wireless'),(4,'C - CDMA ');
/*!40000 ALTER TABLE `connectivity_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_types`
--

DROP TABLE IF EXISTS `contact_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_types`
--

LOCK TABLES `contact_types` WRITE;
/*!40000 ALTER TABLE `contact_types` DISABLE KEYS */;
INSERT INTO `contact_types` VALUES (1,'Commercial Contact'),(2,'Technical Contact');
/*!40000 ALTER TABLE `contact_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `skype` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `tower_owner_id` int(10) DEFAULT NULL,
  `contact_type_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES (1,'Clark','Ritchie','+1 (503) 936-2575','clarkritchie','critchie@inveneo.org',1,2),(2,'Andris','Bjornson','+1 (415) 205-7802','andris.bjornson','abjornson@inveneo.org',4,1),(3,'Jen','Overgaag','+1 (805) 440-9423','wyojeno','jovergaag@inveneo.org',1,2);
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `installation_states`
--

DROP TABLE IF EXISTS `installation_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `installation_states` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `installation_states`
--

LOCK TABLES `installation_states` WRITE;
/*!40000 ALTER TABLE `installation_states` DISABLE KEYS */;
INSERT INTO `installation_states` VALUES (1,'Install Need Identified'),(2,'Prerequisites Verified'),(3,'ISP Installation Complete'),(4,'Work Order Created'),(5,'Installation Scheduled/Team Assigned'),(6,'Team Pulls Equipment from Regional Hub'),(7,'Install in Progress'),(8,'Install Complete'),(9,'Spot-check by Inveneo'),(10,'School Accepted'),(11,'Site Complete'),(12,'Open Support Issue'),(13,'Third Tier Support From ICT IPs');
/*!40000 ALTER TABLE `installation_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `isps`
--

DROP TABLE IF EXISTS `isps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `isps` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `isps`
--

LOCK TABLES `isps` WRITE;
/*!40000 ALTER TABLE `isps` DISABLE KEYS */;
INSERT INTO `isps` VALUES (1,'UhuruOne'),(2,'Zantel');
/*!40000 ALTER TABLE `isps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `link_types`
--

DROP TABLE IF EXISTS `link_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `link_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `link_types`
--

LOCK TABLES `link_types` WRITE;
/*!40000 ALTER TABLE `link_types` DISABLE KEYS */;
INSERT INTO `link_types` VALUES (1,'V - Vsat'),(2,'G - GSM'),(3,'P - P2P Wireless'),(4,'C - CDMA ');
/*!40000 ALTER TABLE `link_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `linktypes`
--

DROP TABLE IF EXISTS `linktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `linktypes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `linktypes`
--

LOCK TABLES `linktypes` WRITE;
/*!40000 ALTER TABLE `linktypes` DISABLE KEYS */;
INSERT INTO `linktypes` VALUES (1,'Vsat'),(2,'GSM'),(3,'P2P Wireless'),(4,'CDMA ');
/*!40000 ALTER TABLE `linktypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `location` point NOT NULL,
  PRIMARY KEY (`id`),
  SPATIAL KEY `location` (`location`)
) ENGINE=MyISAM AUTO_INCREMENT=170 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (8,'\0\0\0\0\0\0\0\'ƒ£äÕÙ2@¼W­LòQÀ'),(2,'\0\0\0\0\0\0\0Ø\rÛe3@‰ïÄ¬RÀ'),(12,'\0\0\0\0\0\0\0#ğk$]2@uå³<:RÀ'),(13,'\0\0\0\0\0\0\0·]ªÊë2@˜“;	RÀ'),(15,'\0\0\0\0\0\0\0ébg\nõ2@$EdXÅRÀ'),(16,'\0\0\0\0\0\0\0°çŒ(í2@Ğ³Yõ¹\"RÀ'),(17,'\0\0\0\0\0\0\0`Í‚9Z2@ÄZ|\n€%RÀ'),(18,'\0\0\0\0\0\0\0›8¹ß¡¸3@\nô‰<IRÀ'),(19,'\0\0\0\0\0\0\0…w¹ˆï´3@²ºÕRÀ'),(20,'\0\0\0\0\0\0\0¼è+H33@`ºò-RÀ'),(21,'\0\0\0\0\0\0\0\n¿ÔÏ›B3@ÉYØÓ!RÀ'),(22,'\0\0\0\0\0\0\0v28J^M3@É<ò\'RÀ'),(23,'\0\0\0\0\0\0\0m±&3@¥Ú§ã1\'RÀ'),(24,'\0\0\0\0\0\0\0â’ãNé 3@eßÁÿ\"RÀ'),(25,'\0\0\0\0\0\0\0È$#ga3@4ºƒØ™RÀ'),(26,'\0\0\0\0\0\0\0Zd;ßO\r3@ıjÌRÀ'),(27,'\0\0\0\0\0\0\0Í’\05µ,3@\np	RÀ'),(28,'\0\0\0\0\0\0\0<1ëÅPV3@HÄ”H¢RÀ'),(29,'\0\0\0\0\0\0\0°şÏa¾Ô2@Èïmú³ûQÀ'),(30,'\0\0\0\0\0\0\0ÔÔ²µæ2@{Ic´öQÀ'),(31,'\0\0\0\0\0\0\05˜†á#ª3@3ùf›#RÀ'),(32,'\0\0\0\0\0\0\0¾Mö#%3@®Gáz\0RÀ'),(33,'\0\0\0\0\0\0\0Hmâä~3@!v¦ĞyRÀ'),(34,'\0\0\0\0\0\0\0ª&ˆºç2@;ßO—RÀ'),(35,'\0\0\0\0\0\0\0Àx\rıë2@ğ§ÆK7	RÀ'),(36,'\0\0\0\0\0\0\0^h®ÓHÓ2@{Úá¯ÉRÀ'),(37,'\0\0\0\0\0\0\0fffff3@w„Ó‚RÀ'),(38,'\0\0\0\0\0\0\0´ª&ˆ*3@,+MJARÀ'),(39,'\0\0\0\0\0\0\0¿eN—ÅD2@»aÛ¢*RÀ'),(40,'\0\0\0\0\0\0\0ëÅPN´;2@œá|~RÀ'),(41,'\0\0\0\0\0\0\0´«ò“Š2@×ú\"¡-%RÀ'),(42,'\0\0\0\0\0\0\0¸Ìé²˜p2@´å\\Š«RÀ'),(49,'\0\0\0\0\0\0\0Cƒf‚2@„GG¬\'RÀ'),(51,'\0\0\0\0\0\0\0tCŠ…å2@­æşRÀ'),(52,'\0\0\0\0\0\0\0Ä_“5ê2@GZ*oGRÀ'),(53,'\0\0\0\0\0\0\0óuşÓ…2@4†9A›%RÀ'),(54,'\0\0\0\0\0\0\0³{ò°PÓ2@ÍÌÌÌÌRÀ'),(55,'\0\0\0\0\0\0\0…BBµ2@mÊŞå\nRÀ'),(56,'\0\0\0\0\0\0\0Ñ\"Ûù~B3@L‰$z!RÀ'),(57,'\0\0\0\0\0\0\0èŸàbEm2@)Ğ\'ò$3RÀ'),(58,'\0\0\0\0\0\0\0MÖ¨‡h¬3@·zNzß*RÀ'),(59,'\0\0\0\0\0\0\0`Í‚9Š2@V-\"RÀ'),(60,'\0\0\0\0\0\0\0›:*3@;ÅªARÀ'),(61,'\0\0\0\0\0\0\0é&1¬$3@IºfòÍ\0RÀ'),(62,'\0\0\0\0\0\0\0$ÖâS\0Ü3@Ñõ-s0RÀ'),(63,'\0\0\0\0\0\0\0@è,õ$22@~}c¾r$RÀ'),(64,'\0\0\0\0\0\0\0—wJ÷2@¯ëì†RÀ'),(169,'\0\0\0\0\0\0\0ë›áÜ3@ƒ4cÑt0RÀ'),(98,'\0\0\0\0\0\0\0¼t“Ö2@YİêûQÀ'),(99,'\0\0\0\0\0\0\0ºJw×ÙD2@ˆht±*RÀ'),(100,'\0\0\0\0\0\0\0)ß\\‘‚2@‡r(RÀ'),(101,'\0\0\0\0\0\0\0Q OäIZ2@³ïŠà%RÀ'),(120,'\0\0\0\0\0\0\0¿HhË¹L3@Ì—`\'RÀ'),(121,'\0\0\0\0\0\0\0cÙ=y 3@fk}‘Ğ\"RÀ'),(122,'\0\0\0\0\0\0\0W•}W´3@ÇF ^×RÀ'),(123,'\0\0\0\0\0\0\0Ô+eâ°3@š|³ÍRÀ'),(124,'\0\0\0\0\0\0\0jMóS<2@ıjÌRÀ'),(125,'\0\0\0\0\0\0\0óÒo_3@ÌH¿}RÀ'),(126,'\0\0\0\0\0\0\0pÜµÆ˜,3@,”T¿õRÀ'),(127,'\0\0\0\0\0\0\0>p|ŠoÕ2@âí9—¿RÀ'),(128,'\0\0\0\0\0\0\0¸…ëQp2@Ñ:ªšRÀ'),(129,'\0\0\0\0\0\0\0B‹ÅU3@l§µ‚‰RÀ'),(130,'\0\0\0\0\0\0\0_)ËÇª3@–¨©e#RÀ'),(161,'\0\0\0\0\0\0\0Ön»Ğ\\3@¦òv„ÓRÀ'),(162,'\0\0\0\0\0\0\0öb(\'Ú%3@›kC\'RÀ'),(163,'\0\0\0\0\0\0\0oCÎóÒ2@U&ãµ\rRÀ'),(164,'\0\0\0\0\0\0\0Ÿåypw3@h®ÓHK-RÀ'),(165,'\0\0\0\0\0\0\0vOj\r3@¶Û.4×RÀ'),(166,'\0\0\0\0\0\0\0¡[ØhsC2@°‘ú­RÀ'),(167,'\0\0\0\0\0\0\0pënê¸3@ F6RÀ');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `network_radios`
--

DROP TABLE IF EXISTS `network_radios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `network_radios` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `site_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=176 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `network_radios`
--

LOCK TABLES `network_radios` WRITE;
/*!40000 ALTER TABLE `network_radios` DISABLE KEYS */;
INSERT INTO `network_radios` VALUES (9,'BAYCT-BELDR',2),(11,'BAYCT-CBRIT',2),(12,'BAYCT-HINCH',2),(13,'BELDR-BAYCT',8),(14,'BELVU-BARO',12),(15,'BELVU-BERNA',12),(16,'BELVU-BRACH',12),(17,'BELVU-GGOAV',12),(18,'BELVU-OBLEO',12),(19,'BCARE-BOSIO',13),(20,'BAYCT-020',2),(21,'BAYCT-140',2),(24,'BERNA-BELVU',101),(25,'BERNA-JACML',101),(26,'BOSIO-BCARE',51),(27,'BOSIO-MIBAL',51),(28,'BOUTL-GRESS',52),(29,'BOUTL-OBLEO',52),(30,'BOUTL-RADIUS',52),(31,'BRACH-BELVU',53),(32,'BRACH-GRESS',53),(33,'BRACH-LEOGN',53),(34,'CARML-CBRIT',54),(35,'CARML-JANVI',54),(36,'CARML-MIBAL',54),(37,'CBRIT-BAYCT',55),(38,'CBRIT-CARML',55),(39,'CBRIT-OBLEO',55),(40,'DESAL-LESTR',56),(41,'GGOAV-BELVU',57),(42,'GMORN-HTPTN',58),(43,'GRESS-BOUTL',59),(44,'GRESS-BRACH',59),(45,'HILRE-HINCH',60),(46,'HILRE-JANVI',60),(47,'HILRE-LESTR',60),(48,'HILRE-MARML',60),(49,'HILRE-MASDE',60),(50,'HILRE-OBLEO',60),(51,'HILRE-PIGNO',60),(52,'HILRE-STMRC',60),(53,'HINCH-BAYCT',61),(54,'HINCH-HILRE',60),(55,'HINCH-MARML',61),(56,'HTPTN-GMORN',62),(57,'HTPTN-MARML',62),(58,'JACML-BERNA',63),(59,'JACML-MARIG',63),(60,'JACML-OBLEO',63),(61,'JACML-VERJN',63),(62,'JANVI-CARML',64),(63,'JANVI-HILRE',64),(64,'LASCB-BELDR',98),(65,'LAVLE-VERJN',99),(66,'LEOGN-BRACH',100),(67,'LESTR-DESAL',120),(68,'LESTR-HILRE',120),(69,'LIANC-HILRE',121),(70,'LIMB2-LIMBE',122),(71,'LIMBE-LIMB2',123),(72,'LIMBE-VERTI',123),(73,'MARIG-JACML',125),(74,'MARML-HILRE',125),(75,'MARML-HINCH',125),(76,'MARML-HTPTN',125),(77,'MARML-PILAT',125),(78,'MARML-VERTI',125),(79,'MASDE-HILRE',126),(80,'MIBAL-BOSIO',127),(81,'MIBAL-CARML',127),(82,'MIBAL-SODO',127),(83,'OBLEO-BELVU',128),(84,'OBLEO-BOUTL',128),(85,'OBLEO-CBRIT',128),(86,'OBLEO-HILRE',128),(87,'OBLEO-JACML',128),(88,'PIGNO-HILRE',129),(89,'PILAT-MARML',130),(90,'PRIVA-HILRE',161),(91,'PSOND-HILRE',162),(92,'SODO-MIBAL',163),(93,'STMRC-HILRE',164),(94,'VERET-HILRE',165),(95,'VERJN-JACML',166),(96,'VERJN-LAVLE',166),(97,'VERTI-LIMBE',167),(98,'VERTI-MARML',167),(99,'WFPL-BRACH',49),(100,'WFPL-STCRX',49),(101,'BOSIO-070',51),(102,'BOSIO-150',51),(103,'BOSIO-320',51),(104,'BRACH-040',53),(105,'BRACH-160',53),(106,'BRACH-280',53),(107,'DESAL-070',56),(108,'DESAL-130',56),(109,'DESAL-250',56),(110,'GGOAV-120',57),(111,'GGOAV-240',57),(112,'GMORN-000',58),(113,'GMORN-120',58),(114,'GMORN-240',58),(115,'GRESS-000',59),(116,'GRESS-120',59),(117,'GRESS-240',59),(118,'HILRE-270',60),(119,'HINCH-090',NULL),(120,'HINCH-210',61),(121,'HINCH-330',61),(122,'JANVI-052',64),(123,'JANVI-172',64),(124,'JANVI-292',64),(125,'LASCB-000',98),(126,'LASCB-120',98),(127,'LASCB-240',98),(128,'LAVLE-000',99),(129,'LAVLE-120',99),(130,'LAVLE-240',99),(131,'LEOGN-000',100),(132,'LEOGN-120',100),(133,'LEOGN-240',100),(134,'LESTR-110',120),(135,'LESTR-230',120),(136,'LESTR-350',120),(137,'LIANC-040',121),(138,'LIANC-160',121),(139,'LIANC-280',121),(140,'LIMB2-020',122),(141,'LIMB2-140',122),(142,'LIMB2-260',122),(143,'LIMBE-080',123),(144,'LIMBE-200',123),(145,'LIMBE-320',123),(146,'MARIG-000',124),(147,'MARIG-120',124),(148,'MARIG-240',124),(149,'MASDE-070',126),(150,'MASDE-293',126),(151,'MIBAL-050',127),(152,'MIBAL-170',127),(153,'MIBAL-290',127),(154,'PIGNO-080',129),(155,'PIGNO-200',129),(156,'PIGNO-320',129),(157,'PILAT-000',130),(158,'PILAT-120',130),(159,'PILAT-240',130),(160,'PRIVA-060',161),(161,'PRIVA-200',161),(162,'PRIVA-290',161),(163,'PSOND-100',162),(164,'PSOND-340',162),(165,'SODO-095',163),(166,'SODO-185',163),(167,'STMRC-032',164),(168,'VERET-020',165),(169,'VERET-140',165),(170,'VERET-260',165),(171,'VERJN-000',166),(172,'VERJN-120',166),(173,'VERJN-240',166),(174,'WFPL-090',49),(175,'WFPL-270',49);
/*!40000 ALTER TABLE `network_radios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `network_routers`
--

DROP TABLE IF EXISTS `network_routers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `network_routers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `network_routers`
--

LOCK TABLES `network_routers` WRITE;
/*!40000 ALTER TABLE `network_routers` DISABLE KEYS */;
/*!40000 ALTER TABLE `network_routers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `network_switches`
--

DROP TABLE IF EXISTS `network_switches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `network_switches` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `network_switches`
--

LOCK TABLES `network_switches` WRITE;
/*!40000 ALTER TABLE `network_switches` DISABLE KEYS */;
INSERT INTO `network_switches` VALUES (10,'BAYCT-SW'),(11,'BCARE-SW'),(12,'None'),(13,'BELVU-SW'),(14,'BERNA-SW'),(15,'BOUTL-SW'),(16,'BRACH-SW'),(17,'CARML-SW'),(18,'DESAL-SW'),(19,'GGOAV-SW'),(20,'GMORN-SW'),(21,'GRESS-SW'),(22,'HILRE-SW'),(23,'HINCH-SW'),(24,'HTPTN-SW'),(25,'JACML-SW'),(26,'JANVI-SW'),(27,'LASCB-SW'),(28,'LAVLE-SW'),(29,'LEOGN-SW'),(30,'LESTR-SW'),(31,'LIANC-SW'),(32,'LIMB2-SW'),(33,'LIMBE-SW'),(34,'MARIG-SW'),(35,'MARML-SW'),(36,'MIBAL-SW'),(37,'PILAT-SW'),(38,'PRIVA-SW'),(39,'PSOND-SW'),(40,'SODO-SW'),(41,'STMRC-SW'),(42,'VERET-SW'),(43,'VERJN-SW'),(44,'VERTI-SW'),(45,'WFPL-SW');
/*!40000 ALTER TABLE `network_switches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `power_types`
--

DROP TABLE IF EXISTS `power_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `power_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `power_types`
--

LOCK TABLES `power_types` WRITE;
/*!40000 ALTER TABLE `power_types` DISABLE KEYS */;
INSERT INTO `power_types` VALUES (6,'Other'),(2,'Solar'),(3,'120VAC'),(4,'220VAC'),(5,'-48VDC'),(7,'+24VDC');
/*!40000 ALTER TABLE `power_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `rolealias` varchar(50) DEFAULT 'edit',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','admin'),(2,'View Only User','view'),(11,'Editor','edit');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_states`
--

DROP TABLE IF EXISTS `site_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_states` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `img_name` varchar(255) DEFAULT NULL,
  `img_type` varchar(255) DEFAULT NULL,
  `img_size` int(11) DEFAULT NULL,
  `img_data` mediumblob,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_states`
--

LOCK TABLES `site_states` WRITE;
/*!40000 ALTER TABLE `site_states` DISABLE KEYS */;
INSERT INTO `site_states` VALUES (20,'Decommissioned','tower-r.png','image/png',1945,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0 \0\0\0%\0\0\0#·ëG\0\0`IDATX…µ—}lSåÇ?÷­÷öeëè:pC—Á û‰üBŒHĞ¡ÓDLF‚¾\ZÑ5ÆÈĞÄ¨ü·ÄÔ„M˜˜`\"Æ˜˜Î…‘…˜elS	Ê`CEëÚ®½÷¶½×?z[º­–àINîmŸûœïçyÎyn{Û¶hii‘p9W™[kÀLÀ\n‡Ã\0Á¶í¼¸Ğw9\0â-·\0Ğ7ÃápF…ByqPé\\5ş›Ğ$s®f~•š#¾°«»»ïÏ°ÎPhsk™â­÷tuw÷5Ô×ãñxĞ4í–\nëºN2™¤«»»¯3ú?N\ZŠOğø|hnwÉ V6K6&mšˆ’„‘H Ê2²¢Éd¨Èf2HòÜìi^/ˆ…’Ê×™(“ËuŞÑ|¾9“mÛ&­ë¤b1Ò¢H6@¨©ÁÆµj¢×‹qì)QÄex««QTu.ÄµØÍ<êµj/AŸI¥ˆG£˜55h<€«¶×êÕHµµ(Ë–aôõá}ì1Ìáa’ŸNâ·ß.[†êõ\"ˆe’˜\'™i’4cåF<ÎÕÑQhh òùçq·¶b\'“ Ë½½Lñ¶6d¿×š5øví\"ÒŞÎ•ş~µµxƒÁr\0³V^¼Û‚@ô¯¿š›©şä¼Û·“>{–è›oòÏÚµLìŞMzx˜‰;¸¼q#ú?bë:5GâÙ²…É±1L]ŸóÆ\0ŠRğD$BÚ¶©Ú·µ¹™Ø‡2¾y3ÆÉ“ø~šÚÓ§qoÙ‚zÏ=x¶mcbÇ¢¯½†RõşûHwİÅÕ°%éZÜÙë-—Û²ˆ_º„wçNÔuëˆ<HâàA¼Û¶áıus`\0yñb¼ï½GæâE”•+™|áe‚‡øè#.oÚDZ×qUT”LÁ\\\0g›ÌÉI²¦IÅsÏ‘¹x‘Ø;ï -Z„ÿ­·°¢Q¢¯¼‚şı÷¹)T:DÅ3Ï!¾?©íÛq·´ ¬XArb×‚%Ê¦ÀH$p57#/]JêÛoÉşñŞ§B¾ıvbï¾Köï¿©7ê\r±ºšÈã“>wŠ—^BğûI|ü1\0î‡BŸ˜(›‚¹\0CC04Dzl×š5²Lú×_¼^<mmè½½$¿üßO¦>ø€ìØñëêP››1ûûP×¯\'âŞÀ1Û¶=\0²W® x<H\0™óçs+km-<ëºûnäÆF2##\0Huud#lËBĞ4ò?ù¥¬,€$Id/_ÎİßqV,F6A^¾Áëåêîİ…g#;wbÅbh÷ßŸşóO¤`A±\"A˜?€¢(?ı€vß}`˜\'N İ{/,Y‚ŞÓC:Î=»|9V4Š§­ôğ0Æ©S¸V¯À8y¹ÄùÏ[ÙUUÉœ9CúüyÔ\r, şÙg¤1Q·nE¿r¥®Ê={˜zûmb{÷BU‚¦Qñâ‹XÉ$ú‰¸Kü.”ßIIBÑ4$Yfúğa¤@€ê#GÈöô ú)–mãÛµ‹Šº:\0YfZH÷Ro/öv´\rĞÃa²—.áözqoPô&ô9Ç)sá™ßG’etA@´mü--\0d\"¦¦¦îßaˆSSÇc[‰Ã‡qé:²Û=c¨ª÷-\\ˆ8=M¼½ø«¯\"k\Z©hWk+¢(2ª(œ©©a|ï^j}\0—ßOú—_Hut ÿğ@î4åãÎ²¹5Pô¤ªÔ45¡È2¾¦&Uåì©SÔutäèES’X²vmn‚ J$66â\Z\"ØĞ€VUuİSp]\0 ğÇBQU&&&-ßƒPo,GZ¸\0ÿ¾}L½ñõë×à¹í¶²Ây››M+ëÉsç6n,¬H×uÄÊJÃÈìÙ@:›-§€UøÆí.é–,w»©?z”d2É…+÷û9çvóßOüÀ\0„¥K™DÊÆ)2r)È9ºi¢ùısIİn*…Ëß|ƒÙÑ‘J±tóf¿ŸÉÓ§™|ùe²##T>ù$¾¾Ùb¹›šÊß4e®µK:@2UE«ªš1Ù2M2šF]O-â›6ÆëÖ!ƒXÇ#ø|L\'T9oÂ‚x4š‹í|t4-!\n¹\0PÅu\Z“†–MM¥†æØÕ³g\r‡K9É8ùĞÉµK8MCqk&t…Ã\'QwŞy}ñ3g\r‡é…Ö;_åëkvk¦ÖÍ4§…ÿğ]İİı\r?L`åÊÒâ?ÿÌè±ct†Bk˜Y[å›Ó´çùkqû6Ğ°u+U«fŠ2úõ×t†B«Uæó\\Pº=¿9`\Z¹:ñ9ƒ\r<BÀ)´«Œ~õ¡Ğ*G<á¸*g7(áëêîhxôQ\0FÉ¯<Á<Äo\Z D¥Ñäs W\\7->/€YÇ]ÎInë“óŸ7@D¾(óG5ÄÌùˆü•­JÙ^{\0\0\0\0IEND®B`‚'),(19,'Equipment Recovered','tower-y.png','image/png',1873,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0 \0\0\0%\0\0\0#·ëG\0\0IDATX…µ—ÛoWÇ?;·Ù»×^§µãds±ê:iÚÈŠBÚ¤BÍFj€—6<VÀâuÿdñŠÄC@‚‡RÄ Šì\0AjUÔD!ilËN¼v|¿íÕsÙ¹ñ°;\'Şul)ü¤£3»3s¾ŸßïüÎ9óù¾À•+W$@\0”f/ñrÍ< xããã@È÷ı@\\ÔfSš\0ÂK÷š\0uÀl¶úøø¸ÊårxH4{•ÿOL@*Í¾x©6Å{GGoşû%?cù|îBóÒœP.—‹5ÅÓ££7ïg³\"U_ª°iºèºK¡ “ÏçŞ\0¶€ÊÎÄS\"Um}Ïóq]ÛvË²„’$â8.ñ¸†ëzˆâîÔiŒéĞˆ|+Ï‰Æ\\\rUUw½ìû>¶í`†!P*%0ÍÑè•J×\rÓß‡bQ&‘°‰F5dy·;kiÿì@Şı¢ãØ”ËuÖÖlnÆ4ST«G1Í†ÑK*5ÃÒÒâñúû?#Û §§›pX!\nµf Ù&ÖOÿò}Ë2ÙÚÚ¤TÊ0?™õõ·„:¾/’NOÒ×÷9««#Øv„J%ËÂÂ%Îı%3G&“ \Zuèàî3\0Åb…µµLOŸjõ0Éä,‡ÿ‹îî‡H’ÁÆÆiz{ï¢ª%&&®Q,rçÎO8uêwHÒmdYCQÂPZWµÚ&†á33s•rùÇıãÇÿB½`aá]ß¡«kšdò1¾/pæÌ¯X^>Çôô÷øê«Ñ´%$iƒC‡²§¢c|ß§Zİbié\"¥ÒIşÉÀÀ-VWÏñèÑwp]…drËJ15õªºI­ÖÏğğÇø¾Èƒ11ñÎû9¶í (ÚÁ\0êõ\Z¶í2?ÿªºI6{ËJ0=ı]dYghè÷d2ÿ@×3Ü¿ÿ_\'Y\'›cyùkln¢VëC×«(J¼-@›½^,Ë¤R9†adèí½‹¦m±¸ø.–ÕE6{ƒp¸ÄØØuÆÆ®S¯Ç9sæ:š¶ÆÜÜl[ãğá[\0¬¯ŸÁ4k­q÷p¸mÏS.gñ}‘htÇ	³²2BW×$}}ÿaqñÖ×Ğ´Mù–•¢\\>F29@©4ˆëÖZãî a¾®Û V”\n®«à8Q\"‘¦go¶­V¢ë\"‘5\0,+…,WÏ“iøm­#€(†‡Ë\0˜f7’d ËU¶·á8aNúmëÙÓ§(šlm\r ªEl;Èr•Î{Ñ\0²Éä,\0Åâ ¢èĞİ=E©4H¥ÒMw÷¶m ë‡eÕÕâñ\'$“©T\0ĞÕ5ót¿mco…Ã!b±e4m­­!l;Â«¯~N29O4ºÌ£Ggñıavö›œ<ùg†‡ÿ€aÄğ<™¹¹‚`ÑÕ5E¸ó>Ô.\" \"Ë¢ııŸâ8Qîİû1}}Ã÷}/¢(\0|_¤Zéï¿Ë‰÷X^>O±8DOÏCÂáš&¶Æİ€Òj±˜ÂÀÀ-4mhtQ0MA\0]?İÀ«”Ëe¦§?À²|¢Qƒtzğèïÿ”xÜ@’ÂtZ†m¦àéq‹)lo—¸téHÒ\n’¤`.KKÃ‚@.÷CªU˜œ<ÇÆÆ€Qx|‰·ßş\r‘È’É‚ A&Öö ŠÉ(È²€m÷\"ËSS¬¬\\n„O€zb±aÊeğı†áÑÓ“f``ÃH¡ªÚ^GòŞ\0ĞX\rA¿¹¹$A¹ü¡Œ]G–+Øv€™™«ş‘#GN‰´ßÿwZ›ˆtlº¾Êââ‰–G¦iâº\Z–e0;û-\0l[ÜcœöğØmçP­Fxüø§èºÎÅ‹?£§gËEÉÉyòä=*•C$UR©®9ï\0Î†iú¨jt×Ó‚\0š’t›÷ßÿÃpyå•óÈr„bqš×_ÿ„tzƒÕÕ¼öÚJ[GLs;¸liJ<-—L\0]¯\Zªúì§”çÙ„Bq®][g~¾—¡¡‘Ö½tú-$©›DbAˆ²½½M*5ôœx­9vãgSÓår9ˆ)ö(L²Ùó¤ÓGÛİÚe[[s\n_´½×,LÖ€P\"`Ò(—‚¢agi&\0ŒŞüdÒéã/L¡ğù|.8¯ƒüz¾43o?Åië~tôæ—ÙìeÒéÁâÓ\n\'ŸÏğlnu.N_P}\0½y7›ıéôĞsâ“\n7Èçsg›^ó¼ }y¾—5ÁT\ZykBÜËf¿M:=ÜH¡ğWòùÜ›MñZ³™P\'{!@ˆX#W(şx^ã\0âûh‘hB|	s^£‘\\û?ÀsÁ¾\Zœ¯u\Z¡×\"~`€ARK5XbõƒˆüG·Ø{‹Æ\0\0\0\0IEND®B`‚'),(18,'Deactivated','tower-y.png','image/png',1873,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0 \0\0\0%\0\0\0#·ëG\0\0IDATX…µ—ÛoWÇ?;·Ù»×^§µãds±ê:iÚÈŠBÚ¤BÍFj€—6<VÀâuÿdñŠÄC@‚‡RÄ Šì\0AjUÔD!ilËN¼v|¿íÕsÙ¹ñ°;\'Şul)ü¤£3»3s¾ŸßïüÎ9óù¾À•+W$@\0”f/ñrÍ< xããã@È÷ı@\\ÔfSš\0ÂK÷š\0uÀl¶úøø¸ÊårxH4{•ÿOL@*Í¾x©6Å{GGoşû%?cù|îBóÒœP.—‹5ÅÓ££7ïg³\"U_ª°iºèºK¡ “ÏçŞ\0¶€ÊÎÄS\"Um}Ïóq]ÛvË²„’$â8.ñ¸†ëzˆâîÔiŒéĞˆ|+Ï‰Æ\\\rUUw½ìû>¶í`†!P*%0ÍÑè•J×\rÓß‡bQ&‘°‰F5dy·;kiÿì@Şı¢ãØ”ËuÖÖlnÆ4ST«G1Í†ÑK*5ÃÒÒâñúû?#Û §§›pX!\nµf Ù&ÖOÿò}Ë2ÙÚÚ¤TÊ0?™õõ·„:¾/’NOÒ×÷9««#Øv„J%ËÂÂ%Îı%3G&“ \Zuèàî3\0Åb…µµLOŸjõ0Éä,‡ÿ‹îî‡H’ÁÆÆiz{ï¢ª%&&®Q,rçÎO8uêwHÒmdYCQÂPZWµÚ&†á33s•rùÇıãÇÿB½`aá]ß¡«kšdò1¾/pæÌ¯X^>Çôô÷øê«Ñ´%$iƒC‡²§¢c|ß§Zİbié\"¥ÒIşÉÀÀ-VWÏñèÑwp]…drËJ15õªºI­ÖÏğğÇø¾Èƒ11ñÎû9¶í (ÚÁ\0êõ\Z¶í2?ÿªºI6{ËJ0=ı]dYghè÷d2ÿ@×3Ü¿ÿ_\'Y\'›cyùkln¢VëC×«(J¼-@›½^,Ë¤R9†adèí½‹¦m±¸ø.–ÕE6{ƒp¸ÄØØuÆÆ®S¯Ç9sæ:š¶ÆÜÜl[ãğá[\0¬¯ŸÁ4k­q÷p¸mÏS.gñ}‘htÇ	³²2BW×$}}ÿaqñÖ×Ğ´Mù–•¢\\>F29@©4ˆëÖZãî a¾®Û V”\n®«à8Q\"‘¦go¶­V¢ë\"‘5\0,+…,WÏ“iøm­#€(†‡Ë\0˜f7’d ËU¶·á8aNúmëÙÓ§(šlm\r ªEl;Èr•Î{Ñ\0²Éä,\0Åâ ¢èĞİ=E©4H¥ÒMw÷¶m ë‡eÕÕâñ\'$“©T\0ĞÕ5ót¿mco…Ã!b±e4m­­!l;Â«¯~N29O4ºÌ£Ggñıavö›œ<ùg†‡ÿ€aÄğ<™¹¹‚`ÑÕ5E¸ó>Ô.\" \"Ë¢ııŸâ8Qîİû1}}Ã÷}/¢(\0|_¤Zéï¿Ë‰÷X^>O±8DOÏCÂáš&¶Æİ€Òj±˜ÂÀÀ-4mhtQ0MA\0]?İÀ«”Ëe¦§?À²|¢Qƒtzğèïÿ”xÜ@’ÂtZ†m¦àéq‹)lo—¸téHÒ\n’¤`.KKÃ‚@.÷CªU˜œ<ÇÆÆ€Qx|‰·ßş\r‘È’É‚ A&Öö ŠÉ(È²€m÷\"ËSS¬¬\\n„O€zb±aÊeğı†áÑÓ“f``ÃH¡ªÚ^GòŞ\0ĞX\rA¿¹¹$A¹ü¡Œ]G–+Øv€™™«ş‘#GN‰´ßÿwZ›ˆtlº¾Êââ‰–G¦iâº\Z–e0;û-\0l[ÜcœöğØmçP­Fxüø§èºÎÅ‹?£§gËEÉÉyòä=*•C$UR©®9ï\0Î†iú¨jt×Ó‚\0š’t›÷ßÿÃpyå•óÈr„bqš×_ÿ„tzƒÕÕ¼öÚJ[GLs;¸liJ<-—L\0]¯\Zªúì§”çÙ„Bq®][g~¾—¡¡‘Ö½tú-$©›DbAˆ²½½M*5ôœx­9vãgSÓår9ˆ)ö(L²Ùó¤ÓGÛİÚe[[s\n_´½×,LÖ€P\"`Ò(—‚¢agi&\0ŒŞüdÒéã/L¡ğù|.8¯ƒüz¾43o?Åië~tôæ—ÙìeÒéÁâÓ\n\'ŸÏğlnu.N_P}\0½y7›ıéôĞsâ“\n7Èçsg›^ó¼ }y¾—5ÁT\ZykBÜËf¿M:=ÜH¡ğWòùÜ›MñZ³™P\'{!@ˆX#W(şx^ã\0âûh‘hB|	s^£‘\\û?ÀsÁ¾\Zœ¯u\Z¡×\"~`€ARK5XbõƒˆüG·Ø{‹Æ\0\0\0\0IEND®B`‚'),(17,'HRBN Install Complete','tower-y.png','image/png',1873,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0 \0\0\0%\0\0\0#·ëG\0\0IDATX…µ—ÛoWÇ?;·Ù»×^§µãds±ê:iÚÈŠBÚ¤BÍFj€—6<VÀâuÿdñŠÄC@‚‡RÄ Šì\0AjUÔD!ilËN¼v|¿íÕsÙ¹ñ°;\'Şul)ü¤£3»3s¾ŸßïüÎ9óù¾À•+W$@\0”f/ñrÍ< xããã@È÷ı@\\ÔfSš\0ÂK÷š\0uÀl¶úøø¸ÊårxH4{•ÿOL@*Í¾x©6Å{GGoşû%?cù|îBóÒœP.—‹5ÅÓ££7ïg³\"U_ª°iºèºK¡ “ÏçŞ\0¶€ÊÎÄS\"Um}Ïóq]ÛvË²„’$â8.ñ¸†ëzˆâîÔiŒéĞˆ|+Ï‰Æ\\\rUUw½ìû>¶í`†!P*%0ÍÑè•J×\rÓß‡bQ&‘°‰F5dy·;kiÿì@Şı¢ãØ”ËuÖÖlnÆ4ST«G1Í†ÑK*5ÃÒÒâñúû?#Û §§›pX!\nµf Ù&ÖOÿò}Ë2ÙÚÚ¤TÊ0?™õõ·„:¾/’NOÒ×÷9««#Øv„J%ËÂÂ%Îı%3G&“ \Zuèàî3\0Åb…µµLOŸjõ0Éä,‡ÿ‹îî‡H’ÁÆÆiz{ï¢ª%&&®Q,rçÎO8uêwHÒmdYCQÂPZWµÚ&†á33s•rùÇıãÇÿB½`aá]ß¡«kšdò1¾/pæÌ¯X^>Çôô÷øê«Ñ´%$iƒC‡²§¢c|ß§Zİbié\"¥ÒIşÉÀÀ-VWÏñèÑwp]…drËJ15õªºI­ÖÏğğÇø¾Èƒ11ñÎû9¶í (ÚÁ\0êõ\Z¶í2?ÿªºI6{ËJ0=ı]dYghè÷d2ÿ@×3Ü¿ÿ_\'Y\'›cyùkln¢VëC×«(J¼-@›½^,Ë¤R9†adèí½‹¦m±¸ø.–ÕE6{ƒp¸ÄØØuÆÆ®S¯Ç9sæ:š¶ÆÜÜl[ãğá[\0¬¯ŸÁ4k­q÷p¸mÏS.gñ}‘htÇ	³²2BW×$}}ÿaqñÖ×Ğ´Mù–•¢\\>F29@©4ˆëÖZãî a¾®Û V”\n®«à8Q\"‘¦go¶­V¢ë\"‘5\0,+…,WÏ“iøm­#€(†‡Ë\0˜f7’d ËU¶·á8aNúmëÙÓ§(šlm\r ªEl;Èr•Î{Ñ\0²Éä,\0Åâ ¢èĞİ=E©4H¥ÒMw÷¶m ë‡eÕÕâñ\'$“©T\0ĞÕ5ót¿mco…Ã!b±e4m­­!l;Â«¯~N29O4ºÌ£Ggñıavö›œ<ùg†‡ÿ€aÄğ<™¹¹‚`ÑÕ5E¸ó>Ô.\" \"Ë¢ııŸâ8Qîİû1}}Ã÷}/¢(\0|_¤Zéï¿Ë‰÷X^>O±8DOÏCÂáš&¶Æİ€Òj±˜ÂÀÀ-4mhtQ0MA\0]?İÀ«”Ëe¦§?À²|¢Qƒtzğèïÿ”xÜ@’ÂtZ†m¦àéq‹)lo—¸téHÒ\n’¤`.KKÃ‚@.÷CªU˜œ<ÇÆÆ€Qx|‰·ßş\r‘È’É‚ A&Öö ŠÉ(È²€m÷\"ËSS¬¬\\n„O€zb±aÊeğı†áÑÓ“f``ÃH¡ªÚ^GòŞ\0ĞX\rA¿¹¹$A¹ü¡Œ]G–+Øv€™™«ş‘#GN‰´ßÿwZ›ˆtlº¾Êââ‰–G¦iâº\Z–e0;û-\0l[ÜcœöğØmçP­Fxüø§èºÎÅ‹?£§gËEÉÉyòä=*•C$UR©®9ï\0Î†iú¨jt×Ó‚\0š’t›÷ßÿÃpyå•óÈr„bqš×_ÿ„tzƒÕÕ¼öÚJ[GLs;¸liJ<-—L\0]¯\Zªúì§”çÙ„Bq®][g~¾—¡¡‘Ö½tú-$©›DbAˆ²½½M*5ôœx­9vãgSÓår9ˆ)ö(L²Ùó¤ÓGÛİÚe[[s\n_´½×,LÖ€P\"`Ò(—‚¢agi&\0ŒŞüdÒéã/L¡ğù|.8¯ƒüz¾43o?Åië~tôæ—ÙìeÒéÁâÓ\n\'ŸÏğlnu.N_P}\0½y7›ıéôĞsâ“\n7Èçsg›^ó¼ }y¾—5ÁT\ZykBÜËf¿M:=ÜH¡ğWòùÜ›MñZ³™P\'{!@ˆX#W(şx^ã\0âûh‘hB|	s^£‘\\û?ÀsÁ¾\Zœ¯u\Z¡×\"~`€ARK5XbõƒˆüG·Ø{‹Æ\0\0\0\0IEND®B`‚'),(16,'Power Install Complete','tower-o.png','image/png',1983,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0 \0\0\0%\0\0\0#·ëG\0\0†IDATX…µ—{l•õÇ?ïíœ÷Ü{;§Ğ–[¥Õ*¹*Ì1ĞÃ\0E2„¹…0ãÍŒÈ0Y“±dfq¨™İaÈğéÂ–…ÅE\\`mI`0…U¶µ–Ó=÷÷œ÷œóîs¡¥=”&ìI¼÷ß÷ó{ç—ßû†a\0°lÙ2Sæ(sg-¤€8jllL\0†adÅM€šqS@¼Câ©@Ğ2ollL^¯7+nœ™£Êÿ\'\Z™c<;K5#î©ëi:q‡…‡Y½Ç»0sšCCo­ëi:1µÊÕfÂb5İQáh$N$§®­éD½Ç[K&\rCO°:­yÅS©	]GëH¢ˆÕ$IQHê	….’‰$’,øÖâAÊe5[g¢L:×YÇb·øØ0ôXŒH0DÃáFr¹‰vœÅZ9Ÿ”j#x|\ZfäD{AŠyä$,ö@N3{\'Wí‚4’^×4‚ş 	ÇDœó—£—a­šƒRR†Z^Eè«Süı§ˆvœ¡ÿ_ïºØgêdL¢˜w!‰Y’›nß¸eZ(DÿÕ«È¥•xÖlÆµèqR±(‚$üâ\r{(X¼ÉæÂz÷<JÛHÇoÖÒÛzšÂR7öÂÂ|\0¹P7i@2É Ï‡z÷ƒ”?ÿ;,•µ„/|Nßwœj 	à\\°‚Ác¢÷w1é¥Øg.¦ò·û¹²cŸşÅjÃl™Ö¼\0‚¬äÎƒ½½è)‘)Ï¾†í\\ûûtïy¹Ğƒ{Õó­xšğÙc„[N‚$Óùú\n—ş˜²¯S±iÑÎ.·3±æ>„<©È›Ã0ø|¯|û}‹èİÿ6½ûwQøğ˜¸áDÕJ´í4JI9›¶÷]ÂRYËå·^@d¦nı+“¶ì¢íå%ÄcqÌ6ûøRøIê	Ü?x‘¸ï×ö¾‰R4²Ÿn#ºÎå·NàäÇ\0˜Ë¦3eëÜÿŒØÕvzŞÿEŞ\r8ç/Gr/‘ë×1;FAR$…X(„­fæ²»<ş!zÏ·?ö&w¾½o¢÷w1ç°ÁœÃ²«„ÎmëÑ®¶áY÷2’­€Ş»p-\\EÔ=7î˜\0‰‹Í$.6ó}‹µz‚$£u¶ ªv\n¯MW~Óß(^ştî›I›w÷uÒûÁNL%åXkùú\0ö‘sã	5Ã0Õtõêƒ=ˆªÙYL¬»€‚E«sïZ«çb.›N¬«\0¥¸Œ„¿#•B0©d·üÑ,/€$	è×\00y&“Hø{1WT#ªv.ı~cîİÎ7~B2À1ûá4pïdW	‚(’ğ÷!ÂøE!rá3\0ì3cè\Z¡/â¨ı.Ré4‚ÿmB×u\0ÌÕ$Cƒ.^G´ãá–“X«ç\0>wYÎÿ[‘wÏ7›e.µëúÇıKEôzh{3áö¯p.y’è@Ji9Öÿ’î¿¼B×;¿@´!˜T<k·ÒÂ¿øó(ûBşˆˆŠÙŒ$‰ô|ÙYÌ´_ï%ÚÜ€Ş°‹T2EÉÊgp––é•‰™ŸÜOòlE¬ÇqÿR§\ZĞû»°XÕÜ¸cÈ¦œÛ]zì&ÖİAìJ+’$£é2¢%, >Ø‡ßïgòæ·ˆÅtˆø	6‚‘JÑwğ]äDYµÜw,\0A1çÜQRŒ ¸úê\Zºÿ´Y5„q,zQ9µTà¸×Mçî:&?ùB:u;Zç9z¶?Kà³C8\nœHª%7æˆù{¨@ie%Š9…­²ÅlâüÎQóÄ¦4½ñ8”Ï| ó±H4Å=eò¥ÏqOšˆÕé¼å*Y„Š:ü2s­(*}İƒÈ2.XÀœÃúuJa)\0eÏl£ëÏ¿bêÜy\0ØJ,y…³62&K^ø.¢Î^’›‘¦iH6\'±X€	ë·H\ZyÇÈÔP€Ñ,•HŒ9XøÚ>\"‘6Îßyb10«/nÇ³æ%ä‰Õ„(šV<ÖäSY€ÄGÓX\\oKfp	\\ùd?ÜH$”¤ú‘¥˜ìú.œåÊÎÍÄ»Úp¯|\nùë#æ‘‰úƒÙÓœ¦ÌvI¢ ¨X\n\\Ãqu„aÇuáŸØÊ¨}ô¡Ü3÷¬Q\nJ‰Ÿ9Œdq(¾gÖpñAzì´iÍ”àõzM€(àÉô¥ß£¤ê®Ñƒy“õµ}Cû‘££>Ë4&=À ÊF@#İ.‘i\Z†¶f\"@İ‘¦ãÈ2îêê[Š÷¶¶Ò~ä(õïw2·²õusk¦©ÛiNsÿğu=M§«V¬Ä]S3ºøùó´:H½Ç;—áµ•¿9£=Ï‡¶oÍU«Vã¾wÆpñ–s´}üõïìÌ,³y\n0z{~+Ë€©¤ëÄø²zõ¸gÔ¦ÅÏ¥õ£}Ô{¼³2â¡ŒkY¡|6&@{]OSsõšĞúÁûÙ™‡‡ømŒáÌ@œ²9‘.®ÛÀMÖŒg÷×8éĞGÆ#>n€!Ù¢Ì.Õì‹Gàz¶Îeşç\0\0\0\0IEND®B`‚'),(15,'Active','tower-g.png','image/png',2029,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0 \0\0\0%\0\0\0#·ëG\0\0´IDATX…µ—yl÷Ç?sìîì¬½Æ¾q\r6F@8ÊQ\nxihj(”&Ğ\n9i@4¤W”\nµRh›TQsÒ4U)%AmÔ’Æ›%\'1`LÀ`sûXŸë½ÏöÏ,6x1Tô­~;¿ßÌû~ß÷÷F¿yB4\Z`ñâÅ2 f}”¹·4 h•••\0!\Z\Zàf@Ñİ¬ï¸¦İC•••Áápà*`×G…ÿÀôêcÈÈRÑÁÓ«ÊÔÜcàAæ¨(­ÿÕ€È@éÕª²5‰cÆ!«	ÈVõGü>\">Uej¥“Ğ·a`á)\0ŠÍlµ\rDÓúè‹„é‡D‰PÀ‹(ÉH²	-Fµ§ õE¥[wOV‰\"îşK£ÎD£Ú\rGQíÈ‚4È%D´Po7¸}ä„(BõiÌ3O`±y*îîvèèÁçê\"\Z‰ÜC$Õãc¸A5Ví² İÂ>öp÷\'¤±${!ÙÖ¦¥L&[Ídlâ·eí˜Uœê9Ã_›vÓxí<Y˜-*¢÷E\r&ƒ¥nLE£Qü~7NçeÆª£xr\\9ËrïÇñce>i«fgÓßY™·”$“’Ô©”¬aÅ¡uk;IRZ‰‰©ñÄ¤¸‰À\rú´İÍÌM.æ…â-LJÀ‘ZŞºğ7ö·¤7ìfIÖ\"ö\\İG³¿•WK~ËüôÙ¼?\'>Ãî+{°šm(ÊĞ5“a ™SÌİ½È}\Z[§>ÇÌ´i¼|öO,ùx‡œ_ğxáZN—}ÆòQ0gäúÚƒ¬9¼§kMOÈÅ«%¿arÒxÚœ‘b1ïXhT£³»™ÇÇ¬aÎÈ¼Ñ°m\rÛù~şr¶Ü÷3¬²•/»ëÈQ³x¥d+—½×˜”<õG~,H¼=wÛf¼È‚ªï	P•Ä»Û·ßÖfã¸u\\ö^ãÅú×ÈTÒy~Ê³t‡\\l:şK*®ï 0a4;ç¼ÁcÀ…Ş&^:ûGÖŒş÷g/dBÒ8œNìÖw¶fÁ„Y0ğ{˜™:‚„|ö\\İÇßu+|”\\5›ë_£Ù×Jtµ“èj\'iJ\nTÿˆóî&~2~=#LvŞ<¿€²œoáövÇâKà˜§cz®x¯R’:Y”9ã:G‚lcEŞR>i«æKïñÃ‚‡bÏ¼>ãw\\ò^åõs!GÍdfÚ4u\0`ŞÈY¸CîXÜa	FQ%+\0Î@ªd%Õ’L“û\0Ër—Äî2…Â„Ñ\\p_ ÛšIG ‹¾¨†\"Y@?ò‡²¸I¢5à Ï–KoØM{ “\"{	²òÏŸŠİûhõzÃneÎàš¯™4%Iév üL&t~	ÀüôÙ´ ‡ùFú×­äRÕú)áp€\"{=a+ó–q²çŸwgZòd\0µ Ç?Ùã®ˆgZ\Zht_bAÆ\\RÌ#ØÑø.µ=uÔwfÕ¨å8=íä$góÌÄMl9õ?=ñ+Òä$ÉÂSãŸÀñq°­\ZÑb¹s$ıg2)’ÌöÆ]¤Z’Ù=ïÏ|Ôş)/µìBÓúXW¸šœäl\0L¢ŒÙbOËø §šGòW°0c.û[ÒìkE¶Úbq‡%`M1·$&ñæù4y.ÓànD”dL¡ˆ\"‹óĞáïÄårñòÌß£ƒôhn>nı-ª±½q.)ˆb¶Æb»Šh¾A&i$FÊjÖÑĞu‹šHØçåì%ˆ¢ˆğv\Z¸İ<V´·`Cİs¨V;§¯Ÿeí‰ŸóQóÓs°ÈV„8…x[ˆf²rŠ˜LdY‹0™,\\¬;ÌÆ9åúº!™Yù%ºœŸ‡ôÌÑTëIÉÈCµˆ‡Àà‚QôR,<ím K,É- ºÚI›¿ëH\0Ÿº™Í\'¶2¾¨ÿ³ÏjÏŒËñæ	«¨Äõf×¤Íe°›	ƒ\0<;q\0BD‹#š1¡q@¤/ŒêÕøçŠø|>Jö}“¯‚—!D°(¼R²•+§È–Ooo)éEÃ%¯\"- Á6ÄÉ%)ÈII¼îß”Ÿzš>Ÿ›9“Ë°)vÎ¶œâÉc›9ë½ÈÚÂ‡ùĞUº5·\'–á27Ú¥\0@ĞëBÍ$ÚR=îcÕş¡Õ!\'1cöªØÚ´ÜY¤)©TvV“`²á	{™5eĞónoA¯Ë¸è˜šàp8Ì@0‚Û4&³\'}‡ü¬	Cjy³]j9CMİŞ!×ôÆÄ	ô\0C\0ıízÓ0°5ªØ[md\n²ï»-xcóijêöâ¨(«Oõusk\0´;iNcßğUe/²’¢œÁò\ZÖpı$•\'ßÃQQ:Áµ¿9¦=7Æí[í·‹f|Nñ ğ¯®×òaí»8*J‹õ,}H`èöüv¦Sè¯“ÄÉ¥Åk˜˜;€úkÇù ö¥Stpî(\rK ‰„ª²µN_À¿ï42÷pàwL`vÄqÀØsıÅuÇàwEà&ªîÆÉ¢_zßİ€ß5$Œ¢4^Uãİ\r8ÀŠµ\ZJU\0\0\0\0IEND®B`‚'),(24,'Becky','tower-a.png','image/png',1975,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0 \0\0\0%\0\0\0#·ëG\0\0~IDATX…µ—klWÇóÚ™}x½YÛk{íØql\'MÇqUÒ4ª kú!©­Ô¬†GEE	¢À—|@•RU‚B­„ FR)˜´8N;nÇyÛ×õ>ggÃ‡İ®c¯HáHWwwîûÿİsÏ½w`š&\0]]]2 6«–y²–²€dûûûÓ\0‚išyq YÅfˆOH<k€n£¿¿?-¼¸p[µÆÿÇ:ÂVmäg©Yâ¾Óİ=OXx‰úz÷Z?³@ºØõÓİ=\r›°;hvûÖ	ñ8§»{}½íXËPx\Z€Ëé,)ÉfI¥Ó©’(ÕudID‘eÒé4^·›t&ƒ,IËŞu:H‚ÿ›3Q&·Öù‚Ë±\\Ü4Mt#Åb<†”É²N¨²)\\ÇèğzpÊ\"}Á’aE*Üe¨Š²lœ¢±šù@+D»„ÀÃ–H¥X‡©ásµUÔÚ5:×•ã·k´”9˜çÕ¦z†C~wë.WïMÒRSSUÅ’IÌ“,±\"7aš&‘„Î­`\rv•c­y±®šx:ƒ,\nœ™ã÷7ïñRC-åŠÂN¯‡×š8|nÁ™ µ^*ËÊJ\\±ôA@:kr~İëÜü´cí2>ñ›·éŸ\nN§y¡ÖGßÀ4“	;¶²ßçåƒçvñæà¼;…KUq©ê£(â§\0Ó¡0f:ÍO¶mfw…‡Ÿ]ç­‘kø4_oiähÓzÎç9?·€,|ù?C¼Òàç­mOñóm\\YŒps&Èö†zDaùÒ–ğ@®Îš&“!¾ÚTÏŞJ/\'¯ßâ××oñJ£Ÿï·µâ$†Baê\Zï4¶q\'–`«ÇÍ·ş{Yxo\'¿ÜÕÎ3ÿ&i”i+{ayXANè™ßlİÀX‚·ÇÆ©±«ü¨}3!#Å÷.Œò·É\0š]ŞÛÓÉë-ŒGbœ¸:AÏ†zºj«xÚ]Æl$ŠGÓVX¢Š( ˆQ]ç™\n]úîMs7®óÚÆêvŞ»ÁTBÇ8rãÈ!*U¯\\`<ã;›7R®È¼;~€ƒşjæâñÂ¸kGGÜÅÙé-GEÆÂœ²ÄKëk9û`–S·ïs´i}á_ìlçv,Á¯®ßÄïĞØ]áap~€}U^\"Fª0îš\0y3M‡u¢ÍèI’„Wµ1‹ğb]M¡ïo9Í.ã‘\\›ß®1›4Èš&ª$’¿òW²’\0’$1­\'hpÚ	§ÒÌ&\rZ]Nœ²Äë]*ôıÊÀáTšÏTW\0p/®S©Ú¹¤Pb¬\n (\nÏ…\0Ø_UA2›åÃ™9óUĞ¤©œy0K*• Õí$”Jñòz?—CÎÏ-Ğé-à\\pY.}³—PU•±p”‰hŒç}¬³)¼?q—^¾Æğ|ˆ/ø¼ÌÄb\0ßÒB*kr|øN^¿‰&Š¼¹©‰x:ÃÙ™9ÔU¢e\0’U4EA–$ŞŸ¸‹WµqêÙœ™]à·æÉf³|­¹:\0Y	ş:=Ë¿c|qCÏWWÒ?d2¡ã´Ûã®	ß.Š(P^VÆ»ã·¹s-C–$D#	¢H×z?\0³	ÅÅENìj\'™L²˜ÍòÏsdM“÷&î Kv›Rr.[µèöò•»¹rø£a®Ì‡p9ì„â	ÖV!Š\"ò©¿‰DøFK\'ìçÛ£ã”ÛíŒŞŸäá«üc*H½Ï‡C–Kâr€¢ª,³Ù_‹¬(lÖì¨ŠÂù‘QíéÈ¹O1\rƒgš\Z€h,Nsu5ÃÉ|><NÇª»`U\0…\0RU•¹`S–yÁ:Œ#‡˜Ñ“ø¬sşÇÛâÃŸ°¯µ€\Z÷êW1¬vI(YÆÃ>[é)ÌH×uÜŠL2™;/?ÎfR%Ç(ålşVâ&•É`EùÓç»ˆÇãìúû‡ŒiRÉ$6UåmÛÔD³C#Pá«ZkòÙ<@º¨`$tÊe½í¢ˆRîáÏ×nğÆÈ8z<ÎÁö6ÜšÊÅ©|÷Â(7b	672 §°¯0‘Eë/Ö”ù4]Ò¢±š(âyÂÈd°gÒœ1ej$‘{vÚ­÷S¥©œ]ã’e¢é45ÕKŞÅâD­ƒËÒ2€¬l€ğ°JbÒµu›jkVjZf×¦¦é[±ÍJLf€Í{@\'—.a%\rÅ©™ĞOÏ9YØâ_bl2\'èëİg=ÊÇ×Ã©™d%9-|ÃŸîîìîhc«¿vEñ‘É)ú.èëİÉÒØ*œ®‘çëâômèåí[é¨[\nqéş\\!Ğ×ÛiÍ2¿ÎÅ\0+§ç«™¦‘‹—qépg;Ûër÷ÁÅû“üaè2¾ŞK<j=/TÊÖ(á:İİ3ô¥Îm\0œ\Z\ZÎÏ<Êcˆ?2À\nnbÈ¯y”\\p=²øc<á°ŠÍj2È¹>ş8â\rP‘ÊüVÍo1ãqÄşM¦Ôqd\0\0\0\0IEND®B`‚'),(22,'Lavendar','tower_l.png','image/png',1867,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0 \0\0\0%\0\0\0#·ëG\0\0IDATX…µ—YoÛØÇ\\EQ´¼ÛòË™Ä‰ë&NâÌ4qqâm(úĞ×¾æäyïè{ß\nôi€¨;uĞf™ÆÉdi¶i3iâ}×F‘ER}¥È±Ç@zƒKJäùÿî¹çŞË#”J%\0®\\¹\"\" †½Ì§m\0.ÌÍÍy\0B©Tªˆ«€š\ZˆŸH<\\À	Í››ó„™™™Š¸ÄÃ^ãÿ°€lØ»•Qj¡x×äôìİO,¼§-Ì_ÿIx\0^mèõÉéÙ»ÉäbºN4ª}RaÛvÈ[0{waşú8á4Ô&`Åƒ Àó|\\·ˆ(Š8NY‘$ß÷ˆÇ›ğ}I’ö½«Ç4„wUÉ3Q¦<×#¦ï/•J¸n‘|Ş&<9@•EÒ¶C¢KC‘=~xká¹ˆ\nñ¦ªªìóSã»ªYI´*› û^tİ\"™¬‰\"¹Œ\ZÄb2İ\Z1]¦µYeuÃæä±f¶w\n<ûO†¥e“¾ŞN\"‘¢¸ß_­æ¾L¯Õ/•JØvÍ]db¬‘#E/@–Ö,ÿ;Ã±dU!Ñ©1>ÚÌ×]e}c‹ö6âñX#€j(öbÕ\0øA‰íí4]í*?ı¼“Î¶ë[O^¤y³œÇu}†^½É‘·<¦/tÓß£ó«Ÿõ1{“ï_ï¢E4M=@ÍÖ³›ÊáûE¦&ôtE¹÷p‡»ßm£G%~<ÚÂØñfVÖ-Ö6DnÌ¯q|¤‰©ó|y¡‹í”ÃúæG†ˆu¦¶.@å¹R©Än*ÇØ±fzQ=KñèyŠã#M|q¦EÙÜ.ĞS½\'kzt´EøæÖ¢ ğ‹K½\\JğÇ¯ßâºE¢\r¢ĞÀ²xÏé±V²¹\"wˆEe.ë¤àÜ¼³ÆëÅ<\0-q…ŸO÷rêd+é¬Ëƒ\')N|çÈ€A{k„\\ÖBÖØ·×‹¢€(\nØ¶KOW”–¸Â«79r¦Çø‰fš……G;˜–Çµ«£\\»:JT“øó7«¤2.gÇÛˆ¨\"_¤H\Z˜y»ê÷@€T& •	Èæ\\º;5DQ`\'å¢ÈŸ\rÇYZÍóâU–±cÍÕw.]L5‹<z–Âˆ)$º¢ll9\0ô%¢\\¿ê÷@€J+•JÈr™Ør<dY$ªId²E\0F†šªÏvwj´ÄÒ\0C—±?ô!R9òëµ†\0’$aY>\0qCÁ-Ø¶GK³Š\"üåïkÕgoüm•‚0ĞW^ó¹|‘¨&!¶ã×İÜP…µM€şß/±¼nÓß£cÄDW,ŠÅr4Z[T\n®Ï±á&¶w¬mØtw”·İ•5Yn|²7ˆD\"ì¦]ÒY—ş-\"òôešÛ÷wØØ²êSÈ™åy>º €ÜÛæáÓ’,rf¼•b1`iÍ\"‰|<€ ”MU$IâéËQMâ«Ë},¯»ü°X\"ÆG[hk-çAyÕX¼YvØØGãôÆx»œÇÌ{èz´ê÷@\0Qxgñ&ƒ\'/Rd²ERI’p]Q9:Ü\n€eÉd2\\ê¡P(àù‹+yJ¥O¿O#ˆ\nª\"W}¾ßöoÅ5Gys‹AÎÌsãæ›Ûº®aY6ÉAQùİïŸ“Ëå˜kâ×¿<Ét]ey9ÅÍoÓüw)Oww\'²\"Ö}]\0©Seúû»PU3P…ÇO^òÕ¥á0ô\"®ër4Ù[}\'Ÿ·éééÀ´#$±èWA€½÷ÑˆRí77we™äPyºvu”¼u”˜^v35ÙÉ­…-N å€£êä€$5¶T&O_B­Èq\"ªH¡P\0àüD;\0Wlè£Qª{¤$Õ—ïX–Éo~{\ZË²øÃŸŞ·Ëâ‘H„é]Lü¨¸!‘ÉæéI´4ø àÕccÄ¢ûI%‘Ö–fşõ|[÷Mòy‡³#D5•¥•]æïl’ÉùŒŸh%‹ ×­™·+—UM™wå’`š’\0†±Â÷|¿ˆåö¢È9¾œ:Yıox°]“YÛòPe×3èİÓ´1M«rë„š033£ĞÂ\n“‰SIú{ÛëÆòı¶¼ºÃÃÇ¯ëş&›@\Z0+p(—K„ECmi&êìmQ„¾C,­”Åæ¯_ªä×û¥™SœV¿á\'§gLI2ØßQW|qy›…ï^³0ı,{s«qqz@y^ékË·‡ŸŸK24°âíÒ6ÿ¼ÿš…ùëá(+ó\\P¿<ÿPÁ4Êyb„¿8—äÈ`âÍâ6ß–ÅO…âfhNE¨Q; „19=ûğÂù$\0wîUGnrñ¨!\0•97)\'×G‹\nà==´Ê·¶K9ôÖaÄ\rPQIÊÊR­,1÷0â\0ÿ›…[†–‡k\0\0\0\0IEND®B`‚'),(23,'Planned 2','tower-b.png','image/png',1813,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0 \0\0\0%\0\0\0#·ëG\0\0ÜIDATX…µ—lgÇ?¾;ÛçI×“¦Í¯¶iÂÈ²h+K;–µ[ÚNÆPÙ:6i•·!¤±H€@Õ@€Ø@„4¤µ‚vëA0!„¥a«JÛ¬YS’¥I›´MÚØulŸïüã?|—¹Yœ4Sy¥W¯}ï{ï÷ó<ïó¾÷>6Ã0\0Øºu«€Ãl%nnÉ:ô,€Í0KÜÈfu˜\0ÂM×M€4 š5İÓÓ“µuvvZân Ôleş?P˜5Û´e¥lŠWôáş›,|]é°ØhşÔl¡ëİ}F¸¿®®·Û,Ë7UXUUE¡o,Üßa;Ğ‚¹…\'‹ŠëºN.—#“É š¦!’$‘Íf)))!—Ë!ŠâGŞ7§g‚íV]PÜ0Òé4ñxœŒ\Z\'àNÓX‘E2R´ÕŠ´¯˜%œÉÉd4 `î9M+Ğöl6‹’ŒSå³±¥u•å2-õ%„ü2õ•n½ÆC÷¬äıñ8¿ûçEÆ§¦8Nl6[±i‹¤h1MÓˆD\"Ô‡œ<y\rÛï’ÒtDÑFÿû^ï»ÈgïQæ‘hm(åÑ{WñÔ‹§ÁSâÃãñ,&±4@,v\r%|çÑFšk¼œ‰ñÚß\'xs`†¸’eËm›f*¢ò|¸™öær~ë6¾ıë!÷Oa·Ûq8 ‘H`rìÙµ¶µeì{c”Ÿü~”@©ƒÇî[Å®ÍÕ¼;åøpI´Ñµÿ=>¿©’gYÇÃMO$¾!\n]Š¢\0†aÇy¼s%Öû8ø—ó¼ò×|ncˆoì\\ƒË)20:Ke¹“çv¯gòªJÓj/Ïşê¢`cß3-ì}²™?8F&“)ê…¢\0ét\Zğö\Z&®¦xùğAŸ“=»Ö1›Ìğ½W†øÛ®PrñÒW[x|ëjÎ]VøÅŸÇÙyw›[4®òr!ª(\Zıš¦Ñ¶¶”Ú‹#Ç¦™œQyìŞjV®ùéá1¦¢\Z“İÛ˜ìŞ†¿ÔÁÓû8wYá+;j)uKê™\0 óö ªª“)Édhm(Cş;‘ÄíÙÑ^É¿#üá­K<|OõÜØ…›™¸¢ràÈy*ı2mkË85\ZàSë}är¹å†Ë™?Ñfbi\\N‘r¯ñi€mwçÆŞÚPJ]ÈÅ¹Ëù¾P¹“H<ƒ®Èvë“¿,\0Q™¾¦PI¤²ÌÌ¦i¨òàvŠ|óçƒsc»ö¿G<•ãÓŸôpiFÅ_bGlDâ™Å£â\0v»#y7¶7—£etş}&ÊMåÔ†dÌ]Såf6™aG{ˆ3çÑR_\nÀ;g£HRñİ^´Çét2<a|Jaã-~|‰îŞIN%ø Ê;VKf(óØyæÁz~üú<ÿÚeÙ!ğåÏÔ¢h9ú£8ÎçQùmï$å^;?ûZ+GcüæhŒ\\NçK[ª)óØóVˆiM¡çD„·‡¾pW›nñóæÀU.G5\\.×ò\0¼^/‡z.0>bôbQQUA¸ûÖ|Fù/ßŞğ\'Ğ4˜bğÖ`]7èîDÍ\n‹.Á’\0	\rxqï\ZA’$R©lÊoÁª‡°ú¡7x¡{˜§hÀáppöB‚¯ÿr„Ş“3¸=%Bq™EDQ$¢è^‚Á ~¿ŸD\"Áîí5ù—!¦6”w±Í©TŠ@ À;#YÊı+eyÑ]°äÅÓn·ÏµÑ™$I¢£e\0“İÛ¸Ó–åƒlÏ®µ¼Ğ=BMMĞív/5ıò®İ	Eaû†Êë•¸>´¡ëÁ€¢7¢…Šõ¶¾Ô@]×Qâqöwm`S×?¿’EÓ4dÙÉs»›xâş\Zj+œD“I|>ß’SZ\0Ù‚ŠªªŞA ¢ÂGïÉi~é4©TŠ†††üÒD£|÷àC*lYÍ«}É>Jsš¦K*€¢äÏóùº®K¤ÙûÇ†aĞÔÔ4×ç÷û‘$‰?½At]ÿˆ¬k¹õ×ÔÔmÀøX$1©««Ãï÷/hÙü‰D[°ÏLL¦k@Âò€J>]ÂL\Z\nS3 o,ü¶eíˆwØÜe>²âk~j¦ú$§swø>#||1OˆßÎõ±U<9]\"=·ÚÂôíÄBâm¦•Ö:,œ/VL0™|œxMˆS…â­¦xÂ¬ª%T¬,	PÂky(´<Á2Äo`ˆRâ8`­y‚|pİ°ø²\0æA¸ÍjİµÓä]¯,G|Ù\0VPZ[ÕÚbéåˆü9\0†çP‚¯\0\0\0\0IEND®B`‚');
/*!40000 ALTER TABLE `site_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_name` varchar(50) NOT NULL,
  `site_code` varchar(10) NOT NULL,
  `lat` decimal(17,14) DEFAULT NULL,
  `lon` decimal(17,14) DEFAULT NULL,
  `tower_guard` varchar(255) DEFAULT NULL,
  `install_date` datetime DEFAULT NULL,
  `zone_id` int(10) NOT NULL,
  `connectivity_type_id` int(10) NOT NULL,
  `site_state_id` int(10) NOT NULL,
  `tower_owner_id` int(10) NOT NULL,
  `power_type_id` int(10) NOT NULL,
  `road_type_id` int(10) NOT NULL,
  `network_switch_id` int(10) DEFAULT NULL,
  `network_router_id` int(10) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `structure_type` text,
  `description` text,
  `mounting` text,
  `access` text,
  `storage` text,
  `accommodations` text,
  `notes` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=170 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
INSERT INTO `sites` VALUES (2,'Baycite','BAYCT',19.05623000000000,-72.01707000000000,'',NULL,2,1,15,1,7,1,10,9,NULL,'Transversal installed weather-tight enclosure for Inveneo router-switch board March 2012. Was cabinet.','Standard triangular Voila tower. Platform?','Beam clamps','Steep, rough dirt road. High clearance 4x4 required. Key no longer needed for access to Inveneo equipment on site.','Cyber-training center of George/Pierre in Hinche','L\'Hermitage Pandiassou hotel just outside of Hinche (call ahead)','(Old notes - done?) Need to move CBRIT dish to other side of tower. When you are up there, switch HINCH radio to sta to get a link up'),(12,'Bellevue','BELVU',18.36383700000000,-72.90718000000000,'',NULL,9,1,15,1,5,1,10,NULL,NULL,'','Small, old, very crowded triangular tower','Numerous abandoned round standoffs. Beam clamps may not work due to the large number of other antennas already present. Custom standoffs may be needed.','Foot, donkey or helicopter (verified). Road destroyed in landslide past Chamer?','On site','Bring tent and water.',''),(8,'Belladere','BELDR',18.85092000000000,-71.78593000000000,'',NULL,2,1,15,1,6,1,12,NULL,NULL,'','Standard triangular Voila tower with platform','Existing standoffs, plus 1 pole mounted with beam clamps just below the platform on the NW side. Pole is necessary to get away from a large grill dish (non-Viola) mounted on one of the standoffs.','Short, steep dirt road, 4x4 recommended','','Germain guest house',''),(13,'Boucan CarrÃ©','BCARE',18.92106118000000,-72.14426114000000,'',NULL,2,1,15,1,5,1,11,NULL,NULL,'','','Beam clamps','','','','8-port H3C DC switch:\r\n- port 1 (vlan 11) - BCARE-BOSIO\r\n- port 2 (vlan 12) - BCARE-100\r\n- port 3 (vlan 12) - BCARE-340\r\n- port 9 - trunk to Mikrotik'),(15,'','HDC225',18.95719000000000,-72.37142000000000,NULL,NULL,0,0,23,1,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,'','DELPECHE',18.92640000000000,-72.54260000000000,NULL,NULL,0,0,23,1,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,'','HDS007',18.35244000000000,-72.58594000000000,NULL,NULL,0,0,23,1,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,'','HDN008',19.72122000000000,-72.22322000000000,NULL,NULL,0,0,23,1,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,'','HDN208',19.70678000000000,-72.40367000000000,NULL,NULL,0,0,23,1,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,'','HDC004',19.08672000000000,-72.71794000000000,NULL,NULL,0,0,23,1,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,'','HDC260',19.26019000000000,-72.51653000000000,NULL,NULL,0,0,23,1,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,'','HDC274',19.30222000000000,-72.60956000000000,NULL,NULL,0,0,23,1,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,'','HDC263',19.15114000000000,-72.61242000000000,NULL,NULL,0,0,23,1,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,'','HDC264',19.12856000000000,-72.54686000000000,NULL,NULL,0,0,23,1,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,'','HDC280',19.12258000000000,-72.47814000000000,NULL,NULL,0,0,23,1,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,'','HDC267',19.05200000000000,-72.46558000000000,NULL,NULL,0,0,23,1,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(27,'','HDC220',19.17464000000000,-72.14114000000000,NULL,NULL,0,0,23,1,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(28,'','HDN216',19.33717000000000,-72.11928000000000,NULL,NULL,0,0,23,1,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(29,'','HDC203',18.83103000000000,-71.93286000000000,NULL,NULL,0,0,23,1,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(30,'','HDC318',18.90121000000000,-71.85246000000000,NULL,NULL,0,0,23,1,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(31,'','HDN210',19.66461000000000,-72.54856000000000,NULL,NULL,0,0,23,1,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(32,'','HDC200',19.14508000000000,-72.00750000000000,NULL,NULL,0,0,23,1,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(33,'','SDH009',19.49803000000000,-72.33556000000000,NULL,NULL,0,0,23,1,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(34,'','HDC212',18.90519000000000,-72.07175000000000,NULL,NULL,0,0,23,1,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(35,'','HDC230',18.92183000000000,-72.14400000000000,NULL,NULL,0,0,23,1,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(36,'','HDC201',18.82533000000000,-72.10606000000000,NULL,NULL,0,0,23,1,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(37,'','SDH017',19.05625000000000,-72.01706000000000,NULL,NULL,0,0,23,1,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(38,'','SDH010',19.16614000000000,-72.36336000000000,NULL,NULL,0,0,23,1,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(39,'','HDS300',18.26864000000000,-72.66619000000000,NULL,NULL,0,0,23,1,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(40,'','HDS017',18.23322000000000,-72.38272000000000,NULL,NULL,0,0,23,1,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(41,'','HDO386',18.54132000000000,-72.58091000000000,NULL,NULL,0,0,23,1,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(42,'','SDH011',18.43983000000000,-72.29172000000000,NULL,NULL,0,0,23,1,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(54,'Morne Carmel (Mirebalais 2)','CARML',18.82545000000000,-72.10625000000000,'\"SonSon\" Lucener 3469 1921',NULL,2,0,15,1,6,0,10,NULL,NULL,'','','','Short steep dirt road from town, usually in decent condition. 4x4 recommended','','',''),(53,'Brache','BRACH',18.52276600000000,-72.58760100000000,'3443-8571 called on last Friday around 3 pm. 3765-0205 (not sure if this one is correct). (Eyleen, March 26, 2012)',NULL,1,0,15,1,3,0,10,NULL,NULL,'Enclosure','','','Site in the Leogane area (to the east of town immediately before the bridge)','','','110 VAC from shared -48v inverter'),(52,'Boutilliers','BOUTL',18.50748000000000,-72.31686000000000,'Reggie Chauvet: tel:+509 37010044 (Digicel - preferred), tel:+509 34100044 (Voila), tel:+1 954-205-4606 (US), mailto:rchauvet@haicom.com, or Skype:papiepou',NULL,9,0,15,4,3,0,10,9,NULL,'The top Inveneo cabinet is Ruralnets / HRBN Network. The bottom Inveneo cabinet is HAICOM / PaP Net / NetHope Network.','Sturdy 60m freestanding triangular tower using round uprights','Rocket dishes and sectors can mount directly on these uprights.','\"Steep paved road (Laboule 12) from Route de Kenscoff at Delimart.\r\nHaicom tower is almost directly across from the scenic overlook site.\r\nLook for the blue gate on the opposite side from the overlook.\"','','','Extensive details in tower notes, see Zone 0 (tower notes) - http://10.0.2.1:8880/node/54.\r\n\r\nThere is an inverter and a UPS in the building.'),(51,'Bosiaux','BOSIO',18.89656891000000,-72.09365890000000,'Fedner 3697 3106 or 3443 8656',NULL,2,0,15,1,5,0,10,NULL,NULL,'Cabinet','','1 beam clamp for 25db Nanobridge, plus existing standoffs on top of platform','Very wet, muddy dirt road. 4x4 required.','','','- 25db link to MIBAL\r\n- 30db link to BCARE\r\n- Three 16db sectors'),(49,'World Food Program - LÃ©ogÃ¢ne','WFPL',18.50937000000000,-72.61989000000000,'Karen Barsamian, WFPL 3785 7133, karen.barsamian@wfp.â€‹org (in PauP) JeanSerge Seide, JeanSerge.Seide@wfp.org, +509 38 82 04 44 (on site in Leogane) At the front gate ask for Frederic. Also, Yves runs operations for WFP in Leogane.',NULL,1,0,15,9,6,0,10,9,NULL,'','~20m small freestanding angle-iron construction tower with outside foot pegs and diagonal 3/4\" round cross-supports (no horizontal supports anywhere on the tower). Inside equipment is in an air conditioned shipping container adjacent to the tower. Our equipment is along the back wall of the container, mostly attached to the wall via zip ties.','Nanobridge is mounted on a pole attached to one face of the tower with 2 stainless steel hose clamps. sectors are bolted directly to the L-shaped uprights.','In town. Inside the MINUSTAH LÃ©ogÃ¢ne base near the WFP shelters and adjacent to a 2m satellite dish.','None','None','9 Jan 2012 UPDATE - Network equipment now plugged directly into AC of server-room UPS. (Fixed problem apparently caused by intermittent Phocos charge controller and possibly other components.)\r\n[NOW REMOVED: 110VAC with 12VDC battery backup system (15VDC power supply, 10A Phocos charge controller, (1) sealed 12V battery, and small inverter.]\r\n\r\nIn OpenNMS and on radios: WFPL-090 = leo-base-033, WFPL-270 = leo-base-240 Two 17db sectors'),(55,'Cabrits','CBRIT',18.70804000000000,-72.17028000000000,'Larousse 3851 7638 (also arranges storage and transport of materials to the site)',NULL,2,0,15,2,6,0,10,9,NULL,'','','One existing standoff for JANVI and MIBAL links, pole with U-bolts for CBRIT link','Foot or donkey from Fond Cheval','Small shelter onsite, very limited space; larger space available at start of trail accommodation: bring tent','','\"16-port AC-powered switch:\r\n port1 = vlan11 = CBRIT\r\n port2 = vlan12 = JANVI\r\n port3 = vlan13 = MIBAL\r\nStatus:\r\n - 30db to CBRIT\r\n - 30db to JANVI\r\n - 22db to MIBAL\"'),(56,'Dessalines','DESAL',19.25975000000000,-72.51718000000000,'Ask Jeffrey CarrÃ© (Transversal) for contact info.',NULL,6,0,15,1,5,0,10,9,NULL,'Independent enclosure board installed 4 April 2012.','Triangular with platform?','Standoffs were in use already?','In town. Independent enclosure board installed, so key from Voila not needed.','','','-25db dish to LESTR - Signal strength -56 to -57 dB (4 April 2012). Three 16db sectors.'),(57,'Grand GoÃ¢ve','GGOAV',18.42684000000000,-72.79913000000000,'',NULL,1,0,15,1,6,0,10,NULL,NULL,'Enclosure','','','','','',''),(58,'Gros Morne','GMORN',19.67347000000000,-72.66989000000000,'',NULL,8,0,15,1,6,0,10,9,NULL,'','','','','','',''),(59,'Gressier','GRESS',18.53994000000000,-72.53400000000000,NULL,NULL,1,0,15,1,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(60,'Hilaire','HILRE',19.16624800000000,-72.36338300000000,'24/7 on-site guards who have the shelter keys. No need to call ahead.',NULL,9,0,15,1,3,0,10,9,NULL,'','Two towers on-site. We are using the square tower.','Beam clamps to 4 poles','Very steep, rough road from Petite Riviere (1hr) - high clearance 4x4 required.','','Bring tent and lots of water to sleep on site. Le Gou-T Hotel in St Marc.','\"More details in tower notes, see Zone0 (tower notes) - http://10.0.2.1:8880/node/54.\r\n24-port AC-powered H3C switch:\r\n Port1 = vlan10 = HILRE-OBLEO\r\n Port2 = vlan11 = HILRE-270\r\n Port3 = vlan12 = HILRE-JANVI\r\n Port4 = vlan13 = HILRE-MASDE\r\n Port5 = vlan14 = HILRE-HINCH\r\n Port6 = vlan15 = HILRE-PIGNO\r\n Port7 = vlan16 = HILRE-STMRC (no cable run, may be replaced)\r\n Port8 = vlan17 = HILRE-GNAIV (no radio, no cable run)\r\n Port9 = vlan18 = HILRE-MARML (no IP configured)\r\n Port24 = vlan1 = administrative access port\r\n Port25 = trunk to Mikrotik\r\n Port26 = administrative trunk port\"'),(61,'Hinche (Hinche2)','HINCH',19.14325000000000,-72.01257000000000,'Mezan 3443 8694 or 3494 4100',NULL,2,0,15,1,5,0,10,NULL,NULL,'Cabinet','Standard triangular Voila tower with platform','Standoffs on platform','In town','Cyber-training center of George/Pierre in Hinche,.5 or 6 poles still at the tower location (?).','L\'Hermitage Pandiassou Hotel just outside of Hinche (call ahead)','-48 VDC (use 24 VDC converter)\r\n- 30db link to HILRE\r\n- 30db link to BAYCT\r\n- (3) 16db sectors\r\nThis is Hinche2. Contact for Hinche1 (up on the hill) is Ezai 3480 6791 or 3443 8292.'),(62,'Haut Piton','HTPTN',19.85938000000000,-72.75703000000000,'',NULL,8,0,15,1,6,0,10,9,NULL,'','','','','','',''),(63,'Jacmel (Jacmel 1)','JACML',18.19587643000000,-72.56950340000000,'Michelle Joseph Fosten 3110 9756',NULL,7,0,15,1,5,0,10,9,NULL,'','Small square tower inside a tiny enclosure with a small adjacent shelter. The tower is extremely crowded with existing antennas. Using a rope on this tower will be very challenging. May want to anchor on the far edge of the roof of the adjacent shelter.','Probably beam clamps on horizontal beams near the top of the tower on the East face. There are some partially free standoffs near the bottom of the tower, but these are probably not appropriate for our use.','In the Bellevue neighborhood past Ã‡a Titi in Jacmel commune. About 1 hour on well maintained dirt roads from Jacmel town. Getting there requires fording the Grande RiviÃ¨re de Jacmel (up to 3 fordings) and the Petite RiviÃ¨re de Jacmel (1 fording), both just outside of town. If you are not sure which way to go, ask anyone which way to \"Ã‡a Titi\". Do not attempt crossing during or immediately after rain. 4x4 required.','Minimal storage in crowded shelter','Hotels in Jacmel town. Book 2 weeks ahead for weekend days.','-48VDC and 110VAC currently available. Need to check if the 110VAC is on the main battery stack.'),(64,'Janvier','JANVI',18.96598000000000,-72.36761000000000,'Rosemonde 3632 9562',NULL,2,0,15,1,5,0,10,NULL,NULL,'Building','','','Rosemonde can be found the second left after the bridge if coming from the tower turnoff.','','',''),(98,'Lascahobas','LASCB',18.83600000000000,-71.93621000000000,'Evanel Isalem 3924 1843, 3699 6881, 3755 2791',NULL,10,0,15,1,5,0,10,NULL,NULL,'','Standard triangular Voila tower','Several existing standoffs','Steep, dirt and rock path. High clearance 4x4 required.','','Not available',''),(99,'La VallÃ©e de Jacmel','LAVLE',18.26894900000000,-72.66705500000000,'',NULL,7,0,15,1,6,0,10,9,NULL,'','','','Undated note: did not visit as river was too high to cross at the time','','',''),(100,'LÃ©ogÃ¢ne','LEOGN',18.51003056000000,-72.63198889000000,'Site contact: Wesley 3769 7334 Power technician: Dukens 3636 3761',NULL,1,0,15,6,6,0,10,9,NULL,'','','','','','',''),(101,'Bernard','BERNA',18.35269000000000,-72.58593000000000,'Denais 3443 8505',NULL,7,0,15,1,5,0,10,9,NULL,'Enclosure: combination lock 6-22-10','Standard triangular Voila tower with angle-iron construction and platform at top. The outer wall fell down in the earthquake and has no been replaced. The neighbors say that thieves are constantly visiting the site at night to attempt to steal things (diesel fuel perhaps?).','Lots of free standoffs on platform at top','Very short steep unpaved road off highway to Jacmel (towers clearly visible from the road). 4x4 recommended.','None','None',''),(120,'L\'Estere','LESTR',19.29971000000000,-72.61129000000000,'Jean-Baptiste 3473 3279',NULL,6,0,15,1,5,0,10,9,NULL,'','Very wide, tall, square tower with a platform. Like LESTR but much shorter.','Beam clamps in corners at platform height','In town','','','- 30db dish to HILRE\r\n- 25db dish to DESAL\r\n- Three sectors'),(121,'Liancourt','LIANC',19.12685000000000,-72.54398000000000,'Alfred 3443 8423. Alfred actually follows the rules, so call the Voila NOC in advance for authorization.',NULL,6,0,15,1,5,0,10,9,NULL,'','Nice large standard triangular tower with platform','Standoffs on platform','In town immediately on the main road','','','- use 24 VDC converter\r\n- 30db dish to HILRE\r\n- Three 16db sectors\"'),(122,'LimbÃ© 2','LIMB2',19.70446000000000,-72.40377000000000,'',NULL,8,0,15,1,6,0,10,9,NULL,'Enclosure','','','','','',''),(123,'LimbÃ© (LimbÃ© 1)','LIMBE',19.69095000000000,-72.33678000000000,'',NULL,8,0,15,1,6,0,10,9,NULL,'','','','','','',''),(124,'Marigot','MARIG',18.23565000000000,-72.30933000000000,'Fredo at 3443 8565.  Can also try Cristanne at 3443 8424 (not reached).',NULL,7,0,15,1,5,0,10,9,NULL,'','Standard triangular Voila tower of angle-irons with a top platform with standoffs','Free standoffs on platform','Short, steep, slightly overgrown road that leaves the main road at 18.23354,-72.31386. 4x4 required.','None','Possibly hotels in Marigot. Recommended hotel in Ti Mouillage is Hotel Kabic (3780 6850 - good Internet!). On weekends you may be stuck at the less comfortable but still clean Hotel l\'AmitÃ© (3888 9386).',''),(125,'Marmelade','MARML',19.49755000000000,-72.33580000000000,'Molijen Jula 3427 7773',NULL,8,0,15,1,6,0,10,9,NULL,'','','','The site is approximately 600m from the town of Marmelade. From the welcome statue, veer right up the steep road at 19.517253,-72.362393. You will pass first the Access Haiti tower, then the Digicel tower, then finally you will come to the Voila towersâ€”a small triangular tower like Janvier, and a medium sized square tower, like Hilaire. The site has perhaps the best view of any site in Haiti. You can see Cap HaÃ¯tien from the roof of the shelter, the central plateau, and even as far as Obleon.','','',''),(126,'MaÃ¯ssade','MASDE',19.17420618000000,-72.13999923000000,'',NULL,2,0,15,1,5,0,10,NULL,NULL,'','Standard triangular Voila tower with platform','Round standoffs on top platform','In town center','Save the Children','Save the Children guest house (5 minute drive)','- 30db link to HILRE\r\n- Two 17db sectors'),(127,'Mirebalais (Mirebalais 1)','MIBAL',18.83373323000000,-72.10544377000000,'\"SonSon\" Lucener 3469 1921',NULL,2,0,15,1,3,0,10,NULL,NULL,'Cabinet','','Beam clamps on 3 sides, using one existing standoff at very top of tower for 2 sectors','In town center','Limited storage at WorldVision office in Mirebalais','Mirage Hotel in main town square (convenient) or Wozo Hotel on the road toward Hinche (nice)','16-port H3C AC-powered switch installed\r\n - port 1 (vlan 11) MIBAL-CARML\r\n - port 2 (vlan 12) MIBAL-BOSIO\r\n - port 3 (vlan 13) MIBAL-SODO\r\n - port 4 (vlan 14) MIBAL-050\r\n - port 5 (vlan 14) MIBAL-170\r\n - port 6 (vlan 14) MIBAL-290\r\n - port 18 - trunk to Mikrotik\r\nStatus:\r\n- links to CARML (22db), BOSIO (25db), SODO (30db)\r\n- Three 16db sectors'),(128,'Obleon','OBLEO',18.43875000000000,-72.29069000000000,'Enoch 3441 0218',NULL,9,0,15,1,3,0,10,9,NULL,'','2 towers on site, one triangular tower with 2-3\" rounds and one new octagonal tower. We are using the old, flimsy triangular tower. There are foot pegs on the outside on one side of the tower.','Direct mounting on the tower rounds. Could use custom standoffs or U-bolts, but the tower is not compatible with beam clamps.','Steep paved road, 1 hour from Petionville. Take the road toward Furcy past Kenscoff and turn right at the first paved road after the Petit Freres et Soeurs sign (on the left). Follow this road until you reach the towers.','On site storage room next to main equipment room','','110VAC via -48v inverter for our use\r\n16-port AC-powered switch installed\r\nport1 - OBLEO-BOUTL\r\nport2 - OBLEO-HILRE \r\nport3 - OBLEO-JACML\r\nport4 - OBLEO-BELVU\r\nport5 - OBLEO-CBRIT'),(129,'Pignon','PIGNO',19.33504552000000,-72.11776798000000,'',NULL,2,0,15,1,5,0,10,NULL,NULL,'','Standard triangular Voila tower with platform','Round standoffs on top platform','In town center','Haiti Outreach','Haiti Outreach guest house','-48 VDC in cabinet (use 24 VDC/VDC converter)\r\n- 30db link to HILRE\r\n- Three 16db sectors'),(130,'Pilate','PILAT',19.66710000000000,-72.55308000000000,'Junior 3443 8896',NULL,8,0,15,1,6,0,10,9,NULL,'','','','The town of Pilate is accessible via a bumpy mud and rock road, 45 minutes from Gros Morne, and 1 hour from Plaissance. The site is in the main paved square of Pilate. The tower is a large triangular tower with upper platform. The grounding plate at the base of the tower is quite high off the ground, but otherwise the site is straightforward. The guard lives diagonally across the main square from the tower in the house with the large red gate.','','',''),(161,'Petite RiviÃ¨re de l\'Artibonite','PRIVA',19.12251000000000,-72.48166000000000,'Ask Jeffrey CarrÃ© (Transversal) for contact info.',NULL,6,0,15,1,5,0,10,9,NULL,'','Wide but short square tower with a platform. Like LESTR but much shorter.','Beam clamps in corners at platform height','In town','','',''),(162,'Pont SondÃ©','PSOND',19.14786000000000,-72.61349000000000,'Eval 3443 8323',NULL,6,0,15,1,5,0,10,9,NULL,'','Standard triangular Voila tower with platform','Standoffs on platform','In town near the soccer field','','','-48 VDC (use 24 VDC converter)\r\nEquipment:\r\n- 30db dish to HILRE\r\n - Three 16db sectors\r\nOther:\r\nother:\r\n - 1.5\"\" EMT bars stored on site\r\n - Watch out for the killer bees.'),(163,'Saut d\'Eau','SODO',18.82249378000000,-72.21422652000000,'Jiva 3443 8552',NULL,2,0,15,1,5,0,10,NULL,NULL,'','Standard triangular Voila tower with platform','Existing standoffs','Take the well-maintained gravel road from town towards the waterfalls and turn right once you are at the same height as the tower.','','Have not tried the $25/night hotel across from the police station.','-48 VDC (use 24 VDC converter)\r\n- 30db link to MIBAL\r\n- Two sectors'),(164,'Saint Marc (St Marc xp)','STMRC',19.08776000000000,-72.70772000000000,'',NULL,6,0,15,1,3,0,10,9,NULL,'','Not a tower, but the roof of a Voila shelter that had a tower on it. Excellent 270 degree view of Saint Marc bay.','Tripod mounted on roof with a 5\' bar','Just above town. access from just north of La Colline hotel.','On-site storage','Le Gou-T hotel on the north end of town','110VAC via dedicated -48v inverter\r\n- put in a full 10\' bar to raise the antennas higher.\r\n- 30db dish to HILRE-270\r\n- One 17db sector'),(165,'Verrettes','VERET',19.05240000000000,-72.46626000000000,'David 3737 8608',NULL,6,0,15,1,5,0,10,9,NULL,'','Very short square tower with a large tree growing into the tower on the west side','Beam clamps at the top of the tower','In town','','','-48 VDC (use 24 VDC converter)\r\n- Poor signal\r\n- 30db dish to HILRE\r\n- Three 16db sectors'),(166,'Verjon','VERJN',18.26347976000000,-72.43249369000000,'',NULL,7,0,15,1,6,0,10,9,NULL,'','','','\"From the main east-west road, turn north on Route des Orangiers (immediately west of the airport), turn right at the \"\"T\"\", then fork right at the Station des Orangiers (18.2558,-72.508126). It is then about 11km to the turn off. The first part of the road after the fork is partially paved and generally a good road, but extremely steep. The last part of the road is a short overgrown dirt track which becomes very steep for the last 200m.\r\nSee: http://www.openstreetmap.org/?lat=18.2557&lon=-72.4765&zoom=14&layers=M\r\nPossible (unverified) option 2 is to turn north at 18.2558,-72.508126 at Ravine Meyer.\r\n4x4 required (with working low-4). Do not try to go via Cayes Jacmel. Even though marked as a proper road on some maps, this road becomes a shoulder-width footpath several km from the tower.\"','','',''),(167,'VertiÃ¨res','VERTI',19.72233000000000,-72.22208000000000,'',NULL,8,0,15,1,6,0,10,9,NULL,'','','','','','',''),(169,'Foo','FOO1',19.85948000000000,-72.75713000000000,'',NULL,1,0,24,1,3,0,10,NULL,NULL,'','','','','','','');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER location_insert

AFTER INSERT ON sites
FOR EACH ROW
BEGIN
	
	IF ( (NULLIF(NEW.id,'')) AND (NULLIF(NEW.lat,'')) AND (NULLIF(NEW.lon,'')) )
	THEN 
		INSERT INTO locations(id, location)
		VALUES ( NEW.id, POINT(NEW.lat, NEW.lon) );
  	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER location_update
AFTER UPDATE ON sites
FOR EACH ROW
BEGIN
	IF ( (NULLIF(NEW.id,'')) AND (NULLIF(NEW.lat,'')) AND (NULLIF(NEW.lon,'')) )
	THEN
		
		IF ( SELECT EXISTS(SELECT 1 FROM locations WHERE id = NEW.id) ) THEN
			UPDATE locations
			SET location = POINT(NEW.lat, NEW.lon)
			WHERE id = NEW.id;
		ELSE
			INSERT INTO locations(id, location)
			VALUES ( NEW.id, POINT(NEW.lat, NEW.lon) );
		END IF;
  	END IF;	
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER location_delete
BEFORE DELETE ON sites
FOR EACH ROW
BEGIN
	DELETE FROM locations
	WHERE id = OLD.id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tower_owners`
--

DROP TABLE IF EXISTS `tower_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tower_owners` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tower_owners`
--

LOCK TABLES `tower_owners` WRITE;
/*!40000 ALTER TABLE `tower_owners` DISABLE KEYS */;
INSERT INTO `tower_owners` VALUES (1,'Voila'),(2,'Multilink'),(4,'Haicom'),(6,'Access Haiti'),(9,'World Food Program');
/*!40000 ALTER TABLE `tower_owners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `role_id` varchar(20) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','c37948de525341d871f0550a1e0140752a95316a','1','2012-07-18 20:09:51','2012-07-20 00:25:41'),(6,'viewer','42dc9660acb159c06bd94254705bedf76ac60fd8','2','2012-09-12 22:24:04','2012-09-12 22:24:04'),(3,'sue','ae1a12b6e634352e2a52bdc721da548b713f6cbb','2','2012-07-18 21:56:14','2012-07-18 21:56:14'),(7,'editor','ac2fddad48c843854c8faa5db800593543e4912c','11','2012-09-12 22:24:17','2012-09-12 22:24:17');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zones`
--

DROP TABLE IF EXISTS `zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zones` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zones`
--

LOCK TABLES `zones` WRITE;
/*!40000 ALTER TABLE `zones` DISABLE KEYS */;
INSERT INTO `zones` VALUES (1,'Zone 1'),(2,'Zone 2'),(6,'Zone 3'),(7,'Zone 4'),(8,'Zone 5'),(9,'Zone 0'),(10,'Zone 6');
/*!40000 ALTER TABLE `zones` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-09-14 13:32:32
