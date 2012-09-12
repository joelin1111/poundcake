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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES (1,'Clark','Ritchie','+1 (503) 936-2575','clarkritchie','critchie@inveneo.org',1,2),(2,'Andris','Bjornson','+1 (415) 205-7802','andris.bjornson','abjornson@inveneo.org',4,NULL),(3,'Jen','Overgaag','+1 (805) 440-9423','wyojeno','jovergaag@inveneo.org',1,NULL),(4,'foo','bar','1111','x','clarkritchie@yahoo.com',4,1),(5,'Tech','Bar','15039362575','andris.bjornson','clarkritchie@yahoo.com',1,NULL);
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
) ENGINE=MyISAM AUTO_INCREMENT=169 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (8,'\0\0\0\0\0\0\0\'É£‰’Ÿ2@ºW≠LÚQ¿'),(2,'\0\0\0\0\0\0\0ÿ\r€e3@âÔƒ¨R¿'),(12,'\0\0\0\0\0\0\0#k$]2@uÂ≥<:R¿'),(13,'\0\0\0\0\0\0\0∑]™ Î2@éòì;	R¿'),(15,'\0\0\0\0\0\0\0Èbg\nı2@$EdX≈R¿'),(16,'\0\0\0\0\0\0\0∞Áå(Ì2@–≥Yıπ\"R¿'),(17,'\0\0\0\0\0\0\0`ÕÇ9Z2@ƒZ|\nÄ%R¿'),(18,'\0\0\0\0\0\0\0õ8πﬂ°∏3@\nÙâ<IR¿'),(19,'\0\0\0\0\0\0\0ÖwπàÔ¥3@≤∫’R¿'),(20,'\0\0\0\0\0\0\0ºË+H33@`ù∫Ú-R¿'),(21,'\0\0\0\0\0\0\0\nø‘œõB3@…Yÿ”!R¿'),(22,'\0\0\0\0\0\0\0v28J^M3@…<Ú\'R¿'),(23,'\0\0\0\0\0\0\0m±&3@•⁄ß„1\'R¿'),(24,'\0\0\0\0\0\0\0‚í„NÈ 3@eﬂ¡ˇ\"R¿'),(25,'\0\0\0\0\0\0\0»$#ga3@4∫ÉÿôR¿'),(26,'\0\0\0\0\0\0\0Zd;ﬂO\r3@˝jÃR¿'),(27,'\0\0\0\0\0\0\0Õí\05µ,3@\np	R¿'),(28,'\0\0\0\0\0\0\0<1Î≈PV3@HƒîH¢R¿'),(29,'\0\0\0\0\0\0\0∞˛œaæ‘2@»Ôm˙≥˚Q¿'),(30,'\0\0\0\0\0\0\0‘‘≤µÊ2@{Ic¥éˆQ¿'),(31,'\0\0\0\0\0\0\05òÜ·#™3@3˘fõ#R¿'),(32,'\0\0\0\0\0\0\0æMˆ#%3@ÆG·z\0R¿'),(33,'\0\0\0\0\0\0\0Hm‚‰~3@!v¶–yR¿'),(34,'\0\0\0\0\0\0\0è™&à∫Á2@;ﬂOçóR¿'),(35,'\0\0\0\0\0\0\0¿x\r˝Î2@ß∆K7	R¿'),(36,'\0\0\0\0\0\0\0^hÆ”H”2@{⁄·Ø…R¿'),(37,'\0\0\0\0\0\0\0fffff3@wÑ”ÇR¿'),(38,'\0\0\0\0\0\0\0¥é™&à*3@,+MJAR¿'),(39,'\0\0\0\0\0\0\0øeNó≈D2@ªa€¢*R¿'),(40,'\0\0\0\0\0\0\0Î≈PN¥;2@ú·|~R¿'),(41,'\0\0\0\0\0\0\0¥´êÚìä2@◊˙\"°-%R¿'),(42,'\0\0\0\0\0\0\0∏ÃÈ≤òp2@¥Â\\ä´R¿'),(49,'\0\0\0\0\0\0\0CêÉfÇ2@ÑGG¨\'R¿'),(51,'\0\0\0\0\0\0\0tCäÖÂ2@≠ÊÅ˛R¿'),(52,'\0\0\0\0\0\0\0ƒ_ì5ÍÅ2@GZ*oGR¿'),(53,'\0\0\0\0\0\0\0Ûu˛”Ö2@4Ü9Aõ%R¿'),(54,'\0\0\0\0\0\0\0≥{Ú∞P”2@ÕÃÃÃÃR¿'),(55,'\0\0\0\0\0\0\0ÖBBµ2@m ﬁÂ\nR¿'),(56,'\0\0\0\0\0\0\0—\"€˘~B3@Lâ$z!R¿'),(57,'\0\0\0\0\0\0\0Ëü‡bEm2@)–\'Ú$3R¿'),(58,'\0\0\0\0\0\0\0M÷®áh¨3@∑zNzﬂ*R¿'),(59,'\0\0\0\0\0\0\0`ÕÇ9ä2@V-\"R¿'),(60,'\0\0\0\0\0\0\0Åõ:è*3@;≈™AR¿'),(61,'\0\0\0\0\0\0\0È&1¨$3@I∫fÚÕ\0R¿'),(62,'\0\0\0\0\0\0\0$÷‚S\0‹3@—ı-s0R¿'),(63,'\0\0\0\0\0\0\0@Ë,ı$22@~}cær$R¿'),(64,'\0\0\0\0\0\0\0ówJ˜2@ØÎÏÜR¿'),(65,'\0\0\0\0\0\0\0•Ω¡¶2@)?©ˆÈàR¿'),(98,'\0\0\0\0\0\0\0ºtì÷2@Y›Í˚Q¿'),(99,'\0\0\0\0\0\0\0∫Jw◊ŸD2@àht±*R¿'),(100,'\0\0\0\0\0\0\0)ﬂ\\ëÇ2@áÅr(R¿'),(101,'\0\0\0\0\0\0\0Q†O‰IZ2@≥Ôä‡%R¿'),(120,'\0\0\0\0\0\0\0øHhÀπL3@Ãó`\'R¿'),(121,'\0\0\0\0\0\0\0cŸ=y 3@fk}ë–\"R¿'),(122,'\0\0\0\0\0\0\0Wï}W¥3@«F ^◊R¿'),(123,'\0\0\0\0\0\0\0‘+e‚∞3@ö|≥ÕçR¿'),(124,'\0\0\0\0\0\0\0jMÛéS<2@˝jÃR¿'),(125,'\0\0\0\0\0\0\0Û“o_3@ÃHø}R¿'),(126,'\0\0\0\0\0\0\0p‹µ∆ò,3@,îTøıR¿'),(127,'\0\0\0\0\0\0\0>p|äo’2@‚Ì9óøR¿'),(128,'\0\0\0\0\0\0\0∏ÖÎQp2@ç—:™öR¿'),(129,'\0\0\0\0\0\0\0Bã≈U3@lßµÇâR¿'),(130,'\0\0\0\0\0\0\0_)À«™3@ñ®©e#R¿'),(161,'\0\0\0\0\0\0\0÷nª–\\3@¶ÚvÑ”R¿'),(162,'\0\0\0\0\0\0\0ˆb(\'⁄%3@õèkC\'R¿'),(163,'\0\0\0\0\0\0\0oCŒÛé“2@U&„µ\rR¿'),(164,'\0\0\0\0\0\0\0üÂypw3@hÆ”HK-R¿'),(165,'\0\0\0\0\0\0\0vOj\r3@∂€.4◊R¿'),(166,'\0\0\0\0\0\0\0°[ÿhsC2@∞ë˙≠R¿'),(167,'\0\0\0\0\0\0\0pÎnûÍ∏3@ Fè6R¿');
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
) ENGINE=MyISAM AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `network_radios`
--

LOCK TABLES `network_radios` WRITE;
/*!40000 ALTER TABLE `network_radios` DISABLE KEYS */;
INSERT INTO `network_radios` VALUES (9,'BAYCT-BELDR',2),(11,'BAYCT-CBRIT',2),(12,'BAYCT-HINCH',2),(13,'BELDR-BAYCT',8),(14,'BELVU-BARO',12),(15,'BELVU-BERNA',12),(16,'BELVU-BRACH',12),(17,'BELVU-GGOAV',12),(18,'BELVU-OBLEO',12),(19,'BCARE-BOSIO',13),(20,'BAYCT-020',2),(21,'BAYCT-140',2),(24,'BERNA-BELVU',NULL),(25,'BERNA-JACML',NULL),(26,'BOSIO-BCARE',NULL),(27,'BOSIO-MIBAL',NULL),(28,'BOUTL-GRESS',NULL),(29,'BOUTL-OBLEO',NULL),(30,'BOUTL-RADIUS',NULL),(31,'BRACH-BELVU',NULL),(32,'BRACH-GRESS',NULL),(33,'BRACH-LEOGN',NULL),(34,'CARML-CBRIT',NULL),(35,'CARML-JANVI',NULL),(36,'CARML-MIBAL',NULL),(37,'CBRIT-BAYCT',NULL),(38,'CBRIT-CARML',NULL),(39,'CBRIT-OBLEO',NULL),(40,'DESAL-LESTR',NULL),(41,'GGOAV-BELVU',NULL),(42,'GMORN-HTPTN',NULL),(43,'GRESS-BOUTL',NULL),(44,'GRESS-BRACH',NULL),(45,'HILRE-HINCH',NULL),(46,'HILRE-JANVI',NULL),(47,'HILRE-LESTR',NULL),(48,'HILRE-MARML',NULL),(49,'HILRE-MASDE',NULL),(50,'HILRE-OBLEO',NULL),(51,'HILRE-PIGNO',NULL),(52,'HILRE-STMRC',NULL),(53,'HINCH-BAYCT',NULL),(54,'HINCH-HILRE',NULL),(55,'HINCH-MARML',NULL),(56,'HTPTN-GMORN',NULL),(57,'HTPTN-MARML',NULL),(58,'JACML-BERNA',NULL),(59,'JACML-MARIG',NULL),(60,'JACML-OBLEO',NULL),(61,'JACML-VERJN',NULL),(62,'JANVI-CARML',NULL),(63,'JANVI-HILRE',NULL),(64,'LASCB-BELDR',NULL),(65,'LAVLE-VERJN',NULL),(66,'LEOGN-BRACH',NULL),(67,'LESTR-DESAL',NULL),(68,'LESTR-HILRE',NULL),(69,'LIANC-HILRE',NULL),(70,'LIMB2-LIMBE',NULL),(71,'LIMBE-LIMB2',NULL),(72,'LIMBE-VERTI',NULL),(73,'MARIG-JACML',NULL),(74,'MARML-HILRE',NULL),(75,'MARML-HINCH',NULL),(76,'MARML-HTPTN',NULL),(77,'MARML-PILAT',NULL),(78,'MARML-VERTI',NULL),(79,'MASDE-HILRE',NULL),(80,'MIBAL-BOSIO',NULL),(81,'MIBAL-CARML',NULL),(82,'MIBAL-SODO',NULL),(83,'OBLEO-BELVU',NULL),(84,'OBLEO-BOUTL',NULL),(85,'OBLEO-CBRIT',NULL),(86,'OBLEO-HILRE',NULL),(87,'OBLEO-JACML',NULL),(88,'PIGNO-HILRE',NULL),(89,'PILAT-MARML',NULL),(90,'PRIVA-HILRE',NULL),(91,'PSOND-HILRE',NULL),(92,'SODO-MIBAL',NULL),(93,'STMRC-HILRE',NULL),(94,'VERET-HILRE',NULL),(95,'VERJN-JACML',NULL),(96,'VERJN-LAVLE',NULL),(97,'VERTI-LIMBE',NULL),(98,'VERTI-MARML',NULL),(99,'WFPL-BRACH',NULL),(100,'WFPL-STCRX',NULL);
/*!40000 ALTER TABLE `network_radios` ENABLE KEYS */;
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
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `network_switches`
--

LOCK TABLES `network_switches` WRITE;
/*!40000 ALTER TABLE `network_switches` DISABLE KEYS */;
INSERT INTO `network_switches` VALUES (10,'BAYCT-SW'),(11,'BCARE-SW'),(12,'None'),(13,'BELVU-SW');
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
  `rolealias` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','admin'),(2,'View Only User','view');
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
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_states`
--

LOCK TABLES `site_states` WRITE;
/*!40000 ALTER TABLE `site_states` DISABLE KEYS */;
INSERT INTO `site_states` VALUES (20,'Decommissioned'),(19,'Equipment Recovered'),(18,'Deactivated'),(17,'HRBN Install Complete'),(16,'Power Install Complete'),(15,'Active'),(0,'Planned');
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
  `user_id` int(11) DEFAULT NULL,
  `structure_type` text,
  `description` text,
  `mounting` text,
  `access` text,
  `storage` text,
  `accommodations` text,
  `notes` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=169 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
INSERT INTO `sites` VALUES (2,'Baycite','BAYCT',19.05623000000000,-72.01707000000000,'',NULL,2,1,15,1,6,1,10,NULL,'Transversal installed weather-tight enclosure for Inveneo router-switch board March 2012. Was cabinet.','Standard triangular Voila tower. Platform?','Beam clamps','Steep, rough dirt road. High clearance 4x4 required. Key no longer needed for access to Inveneo equipment on site.','Cyber-training center of George/Pierre in Hinche','L\'Hermitage Pandiassou hotel just outside of Hinche (call ahead)','(Old notes - done?) Need to move CBRIT dish to other side of tower. When you are up there, switch HINCH radio to sta to get a link up'),(12,'Bellevue','BELVU',18.36383700000000,-72.90718000000000,NULL,NULL,9,1,15,1,2,1,10,NULL,'','','','','','',''),(8,'Belladere','BELDR',18.85092000000000,-71.78593000000000,NULL,NULL,2,1,15,1,6,1,12,NULL,'','','','','','',''),(13,'Boucan Carr√©','BCARE',18.92106118000000,-72.14426114000000,NULL,NULL,2,1,15,1,6,1,11,NULL,'','','','','','',''),(15,'','HDC225',18.95719000000000,-72.37142000000000,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,'','DELPECHE',18.92640000000000,-72.54260000000000,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,'','HDS007',18.35244000000000,-72.58594000000000,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,'','HDN008',19.72122000000000,-72.22322000000000,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,'','HDN208',19.70678000000000,-72.40367000000000,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,'','HDC004',19.08672000000000,-72.71794000000000,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,'','HDC260',19.26019000000000,-72.51653000000000,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,'','HDC274',19.30222000000000,-72.60956000000000,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,'','HDC263',19.15114000000000,-72.61242000000000,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,'','HDC264',19.12856000000000,-72.54686000000000,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,'','HDC280',19.12258000000000,-72.47814000000000,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,'','HDC267',19.05200000000000,-72.46558000000000,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(27,'','HDC220',19.17464000000000,-72.14114000000000,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(28,'','HDN216',19.33717000000000,-72.11928000000000,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(29,'','HDC203',18.83103000000000,-71.93286000000000,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(30,'','HDC318',18.90121000000000,-71.85246000000000,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(31,'','HDN210',19.66461000000000,-72.54856000000000,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(32,'','HDC200',19.14508000000000,-72.00750000000000,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(33,'','SDH009',19.49803000000000,-72.33556000000000,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(34,'','HDC212',18.90519000000000,-72.07175000000000,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(35,'','HDC230',18.92183000000000,-72.14400000000000,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(36,'','HDC201',18.82533000000000,-72.10606000000000,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(37,'','SDH017',19.05625000000000,-72.01706000000000,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(38,'','SDH010',19.16614000000000,-72.36336000000000,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(39,'','HDS300',18.26864000000000,-72.66619000000000,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(40,'','HDS017',18.23322000000000,-72.38272000000000,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(41,'','HDO386',18.54132000000000,-72.58091000000000,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(42,'','SDH011',18.43983000000000,-72.29172000000000,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(54,'Morne Carmel (Mirebalais 2)','CARML',18.82545000000000,-72.10625000000000,NULL,NULL,2,0,15,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(53,'Brache','BRACH',18.52276600000000,-72.58760100000000,NULL,NULL,1,0,15,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(52,'Boutilliers','BOUTL',18.50748000000000,-72.31686000000000,NULL,NULL,0,0,15,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(51,'Bosiaux','BOSIO',18.89656891000000,-72.09365890000000,NULL,NULL,2,0,15,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(49,'World Food Program - L√©og√¢ne','WFPL',18.50937000000000,-72.61989000000000,NULL,NULL,1,0,15,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(55,'Cabrits','CBRIT',18.70804000000000,-72.17028000000000,NULL,NULL,2,0,15,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(56,'Dessalines','DESAL',19.25975000000000,-72.51718000000000,NULL,NULL,3,0,15,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(57,'Grand Go√¢ve','GGOAV',18.42684000000000,-72.79913000000000,NULL,NULL,1,0,15,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(58,'Gros Morne','GMORN',19.67347000000000,-72.66989000000000,NULL,NULL,5,0,15,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(59,'Gressier','GRESS',18.53994000000000,-72.53400000000000,NULL,NULL,1,0,15,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(60,'Hilaire','HILRE',19.16624800000000,-72.36338300000000,NULL,NULL,0,0,15,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(61,'Hinche (Hinche2)','HINCH',19.14325000000000,-72.01257000000000,NULL,NULL,2,0,15,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(62,'Haut Piton','HTPTN',19.85938000000000,-72.75703000000000,NULL,NULL,5,0,15,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(63,'Jacmel (Jacmel 1)','JACML',18.19587643000000,-72.56950340000000,NULL,NULL,4,0,15,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(64,'Janvier','JANVI',18.96598000000000,-72.36761000000000,NULL,NULL,2,0,15,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(65,'J√©r√©mie A√©roport','JEE',18.64880000000000,-74.13928000000000,'',NULL,10,0,15,1,6,0,10,NULL,'','','','','','',''),(98,'Lascahobas','LASCB',18.83600000000000,-71.93621000000000,NULL,NULL,0,0,15,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(99,'La Vall√©e de Jacmel','LAVLE',18.26894900000000,-72.66705500000000,NULL,NULL,4,0,15,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(100,'L√©og√¢ne','LEOGN',18.51003056000000,-72.63198889000000,NULL,NULL,1,0,15,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(101,'Bernard','BERNA',18.35269000000000,-72.58593000000000,NULL,NULL,4,0,15,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(120,'L\'Estere','LESTR',19.29971000000000,-72.61129000000000,NULL,NULL,3,0,15,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(121,'Liancourt','LIANC',19.12685000000000,-72.54398000000000,NULL,NULL,3,0,15,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(122,'Limb√© 2','LIMB2',19.70446000000000,-72.40377000000000,NULL,NULL,5,0,15,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(123,'Limb√© (Limb√© 1)','LIMBE',19.69095000000000,-72.33678000000000,NULL,NULL,5,0,15,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(124,'Marigot','MARIG',18.23565000000000,-72.30933000000000,NULL,NULL,4,0,15,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(125,'Marmelade','MARML',19.49755000000000,-72.33580000000000,NULL,NULL,5,0,15,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(126,'Ma√Øssade','MASDE',19.17420618000000,-72.13999923000000,NULL,NULL,2,0,15,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(127,'Mirebalais (Mirebalais 1)','MIBAL',18.83373323000000,-72.10544377000000,NULL,NULL,2,0,15,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(128,'Obleon','OBLEO',18.43875000000000,-72.29069000000000,NULL,NULL,0,0,15,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(129,'Pignon','PIGNO',19.33504552000000,-72.11776798000000,NULL,NULL,2,0,15,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(130,'Pilate','PILAT',19.66710000000000,-72.55308000000000,NULL,NULL,5,0,15,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(161,'Petite Rivi√®re de l\'Artibonite','PRIVA',19.12251000000000,-72.48166000000000,NULL,NULL,3,0,15,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(162,'Pont Sond√©','PSOND',19.14786000000000,-72.61349000000000,NULL,NULL,3,0,15,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(163,'Saut d\'Eau','SODO',18.82249378000000,-72.21422652000000,NULL,NULL,2,0,15,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(164,'Saint Marc (St Marc xp)','STMRC',19.08776000000000,-72.70772000000000,NULL,NULL,3,0,15,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(165,'Verrettes','VERET',19.05240000000000,-72.46626000000000,NULL,NULL,3,0,15,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(166,'Verjon','VERJN',18.26347976000000,-72.43249369000000,NULL,NULL,4,0,15,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(167,'Verti√®res','VERTI',19.72233000000000,-72.22208000000000,NULL,NULL,5,0,15,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tower_owners`
--

LOCK TABLES `tower_owners` WRITE;
/*!40000 ALTER TABLE `tower_owners` DISABLE KEYS */;
INSERT INTO `tower_owners` VALUES (1,'Voila'),(2,'Multilink'),(4,'Haicom');
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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','c37948de525341d871f0550a1e0140752a95316a','1','2012-07-18 20:09:51','2012-07-20 00:25:41'),(2,'joe','acf16862470d5ca028de17722a5b72090d6259f4','1','2012-07-18 21:52:44','2012-07-18 21:52:44'),(3,'sue','ae1a12b6e634352e2a52bdc721da548b713f6cbb','2','2012-07-18 21:56:14','2012-07-18 21:56:14'),(4,'z\n','b22cad3fb0a92d967353abbb3ef7399ca5a3034b','2','2012-08-06 18:01:38','2012-08-06 18:01:38'),(5,'zedit','6f0cfe47e87ae75ad5fd224e23656e546791b714','8','2012-08-06 18:01:38','2012-08-06 18:01:38');
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

-- Dump completed on 2012-09-11 17:29:08
