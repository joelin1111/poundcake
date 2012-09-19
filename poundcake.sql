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
-- Table structure for table `antenna_types`
--

DROP TABLE IF EXISTS `antenna_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `antenna_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `antenna_types`
--

LOCK TABLES `antenna_types` WRITE;
/*!40000 ALTER TABLE `antenna_types` DISABLE KEYS */;
INSERT INTO `antenna_types` VALUES (1,'16 dBi AirMax Sector'),(2,'30 dBi RocketDish'),(3,'34 dBi RocketDish'),(4,'17 dBi AirMax Sector');
/*!40000 ALTER TABLE `antenna_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `build_items`
--

DROP TABLE IF EXISTS `build_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `quantity` int(10) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `build_items`
--

LOCK TABLES `build_items` WRITE;
/*!40000 ALTER TABLE `build_items` DISABLE KEYS */;
INSERT INTO `build_items` VALUES (1,125,'Zip ties / Cable Ties'),(4,100,'RJ45, Indoor'),(5,100,'RJ45, Shielded, Toughconnector'),(6,25,'Ring Connectors'),(7,50,'Fork Connectors');
/*!40000 ALTER TABLE `build_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `change_logs`
--

DROP TABLE IF EXISTS `change_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `change_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `version` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `release_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `change_logs`
--

LOCK TABLES `change_logs` WRITE;
/*!40000 ALTER TABLE `change_logs` DISABLE KEYS */;
INSERT INTO `change_logs` VALUES (1,'1.0','Initial release!','2012-09-13 00:00:00'),(2,'1.1','Added:\r\n- SwitchType\r\n- RadioType\r\n- Dynamic attach of Switch/Radio/Router on Site add/edit\r\n- Bugfixes','2012-09-18 00:00:00');
/*!40000 ALTER TABLE `change_logs` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
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
-- Table structure for table `install_teams`
--

DROP TABLE IF EXISTS `install_teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `install_teams` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `install_teams`
--

LOCK TABLES `install_teams` WRITE;
/*!40000 ALTER TABLE `install_teams` DISABLE KEYS */;
INSERT INTO `install_teams` VALUES (1,'Not Assigned'),(2,'Red Team'),(3,'Blue Team'),(4,'Green Team');
/*!40000 ALTER TABLE `install_teams` ENABLE KEYS */;
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
INSERT INTO `locations` VALUES (8,'\0\0\0\0\0\0\0\'É£‰’Ÿ2@ºW≠LÚQ¿'),(2,'\0\0\0\0\0\0\0ÿ\r€e3@âÔƒ¨R¿'),(12,'\0\0\0\0\0\0\0#k$]2@uÂ≥<:R¿'),(13,'\0\0\0\0\0\0\0∑]™ Î2@éòì;	R¿'),(15,'\0\0\0\0\0\0\0Èbg\nı2@$EdX≈R¿'),(16,'\0\0\0\0\0\0\0∞Áå(Ì2@–≥Yıπ\"R¿'),(17,'\0\0\0\0\0\0\0`ÕÇ9Z2@ƒZ|\nÄ%R¿'),(18,'\0\0\0\0\0\0\0õ8πﬂ°∏3@\nÙâ<IR¿'),(19,'\0\0\0\0\0\0\0ÖwπàÔ¥3@≤∫’R¿'),(20,'\0\0\0\0\0\0\0ºË+H33@`ù∫Ú-R¿'),(21,'\0\0\0\0\0\0\0\nø‘œõB3@…Yÿ”!R¿'),(22,'\0\0\0\0\0\0\0v28J^M3@…<Ú\'R¿'),(23,'\0\0\0\0\0\0\0m±&3@•⁄ß„1\'R¿'),(24,'\0\0\0\0\0\0\0‚í„NÈ 3@eﬂ¡ˇ\"R¿'),(25,'\0\0\0\0\0\0\0»$#ga3@4∫ÉÿôR¿'),(26,'\0\0\0\0\0\0\0Zd;ﬂO\r3@˝jÃR¿'),(27,'\0\0\0\0\0\0\0Õí\05µ,3@\np	R¿'),(28,'\0\0\0\0\0\0\0<1Î≈PV3@HƒîH¢R¿'),(29,'\0\0\0\0\0\0\0∞˛œaæ‘2@»Ôm˙≥˚Q¿'),(30,'\0\0\0\0\0\0\0‘‘≤µÊ2@{Ic¥éˆQ¿'),(31,'\0\0\0\0\0\0\05òÜ·#™3@3˘fõ#R¿'),(32,'\0\0\0\0\0\0\0æMˆ#%3@ÆG·z\0R¿'),(33,'\0\0\0\0\0\0\0Hm‚‰~3@!v¶–yR¿'),(34,'\0\0\0\0\0\0\0è™&à∫Á2@;ﬂOçóR¿'),(35,'\0\0\0\0\0\0\0¿x\r˝Î2@ß∆K7	R¿'),(36,'\0\0\0\0\0\0\0^hÆ”H”2@{⁄·Ø…R¿'),(37,'\0\0\0\0\0\0\0fffff3@wÑ”ÇR¿'),(38,'\0\0\0\0\0\0\0¥é™&à*3@,+MJAR¿'),(39,'\0\0\0\0\0\0\0øeNó≈D2@ªa€¢*R¿'),(40,'\0\0\0\0\0\0\0Î≈PN¥;2@ú·|~R¿'),(41,'\0\0\0\0\0\0\0¥´êÚìä2@◊˙\"°-%R¿'),(42,'\0\0\0\0\0\0\0∏ÃÈ≤òp2@¥Â\\ä´R¿'),(49,'\0\0\0\0\0\0\0CêÉfÇ2@ÑGG¨\'R¿'),(51,'\0\0\0\0\0\0\0tCäÖÂ2@≠ÊÅ˛R¿'),(52,'\0\0\0\0\0\0\0ƒ_ì5ÍÅ2@GZ*oGR¿'),(53,'\0\0\0\0\0\0\0Ûu˛”Ö2@4Ü9Aõ%R¿'),(54,'\0\0\0\0\0\0\0≥{Ú∞P”2@ÕÃÃÃÃR¿'),(55,'\0\0\0\0\0\0\0ÖBBµ2@m ﬁÂ\nR¿'),(56,'\0\0\0\0\0\0\0—\"€˘~B3@Lâ$z!R¿'),(57,'\0\0\0\0\0\0\0Ëü‡bEm2@)–\'Ú$3R¿'),(58,'\0\0\0\0\0\0\0M÷®áh¨3@∑zNzﬂ*R¿'),(59,'\0\0\0\0\0\0\0`ÕÇ9ä2@V-\"R¿'),(60,'\0\0\0\0\0\0\0Åõ:è*3@;≈™AR¿'),(61,'\0\0\0\0\0\0\0È&1¨$3@I∫fÚÕ\0R¿'),(62,'\0\0\0\0\0\0\0$÷‚S\0‹3@—ı-s0R¿'),(63,'\0\0\0\0\0\0\0@Ë,ı$22@~}cær$R¿'),(64,'\0\0\0\0\0\0\0ówJ˜2@ØÎÏÜR¿'),(169,'\0\0\0\0\0\0\0Îêõ·‹3@É4c—t0R¿'),(98,'\0\0\0\0\0\0\0ºtì÷2@Y›Í˚Q¿'),(99,'\0\0\0\0\0\0\0∫Jw◊ŸD2@àht±*R¿'),(100,'\0\0\0\0\0\0\0)ﬂ\\ëÇ2@áÅr(R¿'),(101,'\0\0\0\0\0\0\0Q†O‰IZ2@≥Ôä‡%R¿'),(120,'\0\0\0\0\0\0\0øHhÀπL3@Ãó`\'R¿'),(121,'\0\0\0\0\0\0\0cŸ=y 3@fk}ë–\"R¿'),(122,'\0\0\0\0\0\0\0Wï}W¥3@«F ^◊R¿'),(123,'\0\0\0\0\0\0\0‘+e‚∞3@ö|≥ÕçR¿'),(124,'\0\0\0\0\0\0\0jMÛéS<2@˝jÃR¿'),(125,'\0\0\0\0\0\0\0Û“o_3@ÃHø}R¿'),(126,'\0\0\0\0\0\0\0p‹µ∆ò,3@,îTøıR¿'),(127,'\0\0\0\0\0\0\0>p|äo’2@‚Ì9óøR¿'),(128,'\0\0\0\0\0\0\0∏ÖÎQp2@ç—:™öR¿'),(129,'\0\0\0\0\0\0\0Bã≈U3@lßµÇâR¿'),(130,'\0\0\0\0\0\0\0_)À«™3@ñ®©e#R¿'),(161,'\0\0\0\0\0\0\0÷nª–\\3@¶ÚvÑ”R¿'),(162,'\0\0\0\0\0\0\0ˆb(\'⁄%3@õèkC\'R¿'),(163,'\0\0\0\0\0\0\0oCŒÛé“2@U&„µ\rR¿'),(164,'\0\0\0\0\0\0\0üÂypw3@hÆ”HK-R¿'),(165,'\0\0\0\0\0\0\0vOj\r3@∂€.4◊R¿'),(166,'\0\0\0\0\0\0\0°[ÿhsC2@∞ë˙≠R¿'),(167,'\0\0\0\0\0\0\0pÎnûÍ∏3@ Fè6R¿');
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
  `radio_type_id` int(10) DEFAULT NULL,
  `antenna_type_id` int(10) DEFAULT NULL,
  `link_distance` int(10) DEFAULT NULL,
  `true_azimuth` int(10) DEFAULT NULL,
  `mag_azimuth` int(10) DEFAULT NULL,
  `elevation` smallint(6) DEFAULT NULL,
  `frequency` int(10) DEFAULT NULL,
  `ssid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=180 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `network_radios`
--

LOCK TABLES `network_radios` WRITE;
/*!40000 ALTER TABLE `network_radios` DISABLE KEYS */;
INSERT INTO `network_radios` VALUES (9,'BAYCT-BELDR',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,'BAYCT-CBRIT',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,'BAYCT-HINCH',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,'BELDR-BAYCT',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,'BELVU-BARO',12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,'BELVU-BERNA',12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,'BELVU-BRACH',12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,'BELVU-GGOAV',12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,'BELVU-OBLEO',12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,'BCARE-BOSIO',13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,'BAYCT-020',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,'BAYCT-140',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,'BERNA-BELVU',101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,'BERNA-JACML',101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,'BOSIO-BCARE',51,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(27,'BOSIO-MIBAL',51,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(28,'BOUTL-GRESS',52,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(29,'BOUTL-OBLEO',52,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(30,'BOUTL-RADIUS',52,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(31,'BRACH-BELVU',53,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(32,'BRACH-GRESS',53,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(33,'BRACH-LEOGN',53,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(34,'CARML-CBRIT',54,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(35,'CARML-JANVI',54,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(36,'CARML-MIBAL',54,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(37,'CBRIT-BAYCT',55,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(38,'CBRIT-CARML',55,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(39,'CBRIT-OBLEO',55,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(40,'DESAL-LESTR',56,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(41,'GGOAV-BELVU',57,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(42,'GMORN-HTPTN',58,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(43,'GRESS-BOUTL',59,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(44,'GRESS-BRACH',59,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(45,'HILRE-HINCH',60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(46,'HILRE-JANVI',60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(47,'HILRE-LESTR',60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(48,'HILRE-MARML',60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(49,'HILRE-MASDE',60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(50,'HILRE-OBLEO',60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(51,'HILRE-PIGNO',60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(52,'HILRE-STMRC',60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(53,'HINCH-BAYCT',61,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(54,'HINCH-HILRE',60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(55,'HINCH-MARML',61,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(56,'HTPTN-GMORN',62,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(57,'HTPTN-MARML',62,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(58,'JACML-BERNA',63,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(59,'JACML-MARIG',63,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(60,'JACML-OBLEO',63,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(61,'JACML-VERJN',63,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(62,'JANVI-CARML',64,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(63,'JANVI-HILRE',64,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(64,'LASCB-BELDR',98,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(65,'LAVLE-VERJN',99,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(66,'LEOGN-BRACH',100,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(67,'LESTR-DESAL',120,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(68,'LESTR-HILRE',120,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(69,'LIANC-HILRE',121,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(70,'LIMB2-LIMBE',122,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(71,'LIMBE-LIMB2',123,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(72,'LIMBE-VERTI',123,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(73,'MARIG-JACML',125,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(74,'MARML-HILRE',125,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(75,'MARML-HINCH',125,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(76,'MARML-HTPTN',125,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(77,'MARML-PILAT',125,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(78,'MARML-VERTI',125,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(79,'MASDE-HILRE',126,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(80,'MIBAL-BOSIO',127,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(81,'MIBAL-CARML',127,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(82,'MIBAL-SODO',127,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(83,'OBLEO-BELVU',128,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(84,'OBLEO-BOUTL',128,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(85,'OBLEO-CBRIT',128,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(86,'OBLEO-HILRE',128,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(87,'OBLEO-JACML',128,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(88,'PIGNO-HILRE',129,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(89,'PILAT-MARML',130,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(90,'PRIVA-HILRE',161,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(91,'PSOND-HILRE',162,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(92,'SODO-MIBAL',163,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(93,'STMRC-HILRE',164,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(94,'VERET-HILRE',165,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(95,'VERJN-JACML',166,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(96,'VERJN-LAVLE',166,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(97,'VERTI-LIMBE',167,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(98,'VERTI-MARML',167,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(99,'WFPL-BRACH',49,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(100,'WFPL-STCRX',49,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(101,'BOSIO-070',51,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(102,'BOSIO-150',51,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(103,'BOSIO-320',51,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(104,'BRACH-040',53,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(105,'BRACH-160',53,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(106,'BRACH-280',53,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(107,'DESAL-070',56,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(108,'DESAL-130',56,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(109,'DESAL-250',56,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(110,'GGOAV-120',57,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(111,'GGOAV-240',57,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(112,'GMORN-000',58,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(113,'GMORN-120',58,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(114,'GMORN-240',58,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(115,'GRESS-000',59,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(116,'GRESS-120',59,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(117,'GRESS-240',59,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(118,'HILRE-270',60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(119,'HINCH-090',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(120,'HINCH-210',61,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(121,'HINCH-330',61,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(122,'JANVI-052',64,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(123,'JANVI-172',64,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(124,'JANVI-292',64,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(125,'LASCB-000',98,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(126,'LASCB-120',98,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(127,'LASCB-240',98,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(128,'LAVLE-000',99,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(129,'LAVLE-120',99,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(130,'LAVLE-240',99,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(131,'LEOGN-000',100,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(132,'LEOGN-120',100,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(133,'LEOGN-240',100,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(134,'LESTR-110',120,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(135,'LESTR-230',120,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(136,'LESTR-350',120,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(137,'LIANC-040',121,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(138,'LIANC-160',121,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(139,'LIANC-280',121,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(140,'LIMB2-020',122,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(141,'LIMB2-140',122,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(142,'LIMB2-260',122,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(143,'LIMBE-080',123,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(144,'LIMBE-200',123,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(145,'LIMBE-320',123,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(146,'MARIG-000',124,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(147,'MARIG-120',124,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(148,'MARIG-240',124,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(149,'MASDE-070',126,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(150,'MASDE-293',126,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(151,'MIBAL-050',127,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(152,'MIBAL-170',127,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(153,'MIBAL-290',127,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(154,'PIGNO-080',129,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(155,'PIGNO-200',129,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(156,'PIGNO-320',129,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(157,'PILAT-000',130,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(158,'PILAT-120',130,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(159,'PILAT-240',130,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(160,'PRIVA-060',161,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(161,'PRIVA-200',161,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(162,'PRIVA-290',161,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(163,'PSOND-100',162,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(164,'PSOND-340',162,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(165,'SODO-095',163,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(166,'SODO-185',163,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(167,'STMRC-032',164,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(168,'VERET-020',165,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(169,'VERET-140',165,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(170,'VERET-260',165,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(171,'VERJN-000',166,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(172,'VERJN-120',166,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(173,'VERJN-240',166,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(174,'WFPL-090',49,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(175,'WFPL-270',49,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(176,'FOOR1',169,5,1,NULL,NULL,NULL,NULL,NULL,NULL),(177,'FOOR2',169,5,2,NULL,NULL,NULL,NULL,NULL,NULL),(178,'FOOR3',169,6,3,NULL,NULL,NULL,NULL,NULL,NULL),(179,'FOOR4',169,6,1,NULL,NULL,NULL,NULL,NULL,NULL);
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
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
-- Table structure for table `radio_types`
--

DROP TABLE IF EXISTS `radio_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `radio_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `radio_types`
--

LOCK TABLES `radio_types` WRITE;
/*!40000 ALTER TABLE `radio_types` DISABLE KEYS */;
INSERT INTO `radio_types` VALUES (1,'RocketM5'),(2,'NanoBridgeM5'),(3,'NanoStationM5'),(4,'NanoStationM2'),(5,'NanoBridgeM2'),(6,'RocketM2'),(7,'RocketM5 Titanium'),(8,'RocketM2 Titanium');
/*!40000 ALTER TABLE `radio_types` ENABLE KEYS */;
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
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
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
  `img_size` varchar(255) DEFAULT NULL,
  `img_data` mediumblob,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_states`
--

LOCK TABLES `site_states` WRITE;
/*!40000 ALTER TABLE `site_states` DISABLE KEYS */;
INSERT INTO `site_states` VALUES (20,'Decommissioned','tower-r.png','image/png','1945','âPNG\r\n\Z\n\0\0\0\rIHDR\0\0\0 \0\0\0%\0\0\0#∑ÎG\0\0`IDATXÖµó}lSÂ«?˜≠˜ˆeÎË:pCó¡ ˚â¸BêåH–°”DLFÇæ\Z—5∆»–ƒ®¸∑ƒ‘ÑMçòò`\"∆òòŒÖëêÖòelS	 `CEÎ⁄ÆΩ˜∂Ω◊?z[∫≠ñ‡INÓmü˚úÔÁyŒyn{€∂hiiëp9Wô[k¿L¿\ná√\0¡∂Ìº∏–w9\0‚-∑\0–7√·pFÖByqPÈ\\5˛õ–Å$sÆf~ïö#æ∞´ªªÔœ∞ŒPhùskô‚≠˜tuw˜5‘◊„Òx–4Ìñ\nÎ∫N2ô§´ªªØ3˙?N\ZäO¯|hnw… V6K6ù&möàíÑëH  2≤¢ê…d®»f2HÚ‹Ïi^/àÖí ◊ô(ìÀuﬁ—|æ9ìm€&≠Î§b1“¢H6@®©¡∆µj¢◊ãqÏ)Qƒex´´QTu.ƒµÿÕ<Íµj/AüI•àG£ò55h<Ä´∂◊Í’Hµµ(ÀñaÙı·}Ï1Ã·aíüN‚∑ﬂ.[ÜÍı\"àeíò\'ôií4cÂF<Œ’—Qhh†Ú˘Áq∑∂b\'ì ÀΩΩLÒû∂6dø◊ö5¯vÌ\"“ﬁŒï˛~µµxÉ¡r\0≥V^ºé€Ç@ÙØøêöõ©˛‰º€∑ì>{ñËõoÚœ⁄µLÏﬁMzxòâ;∏ºq#˙è?bÎ:5Gè‚Ÿ≤Ö…±1L]üÛ∆\0äRD$B⁄∂©⁄∑µπôÿá2æy3∆…ì¯û~ö⁄”ßqoŸÇzœ=x∂mcb«¢ØΩÜçRı˛˚Hw›≈’∞%ÈZ‹ŸÎ-ó€≤à_∫ÑwÁN‘uÎà<H‚‡Aº€∂·˝uès`\0yÒbºÔΩGÊ‚Eîï+ô|·êeÇá¯Ë#.o⁄DZ◊qUTîL¡\\\0gõÃ…I≤¶I≈sœëπxëÿ;Ô -ZÑˇ≠∑∞¢Q¢ØºÇ˛˝˜π)ççT:D≈3œê!æ?©Ì€q∑¥†¨XArb◊Ç% ¶¿H$p57#/]JÍ€o…˛ÒﬁßûBæ˝vbÔæKˆÔø©7Í\r±∫ö»„èì>wéäó^B˚I|¸1\0ÓáBüò(õÇπ\0CC04Dzl◊ö5≤L˙◊_º^<mmËΩΩ$ø¸ﬂO¶>¯ÄÏÿÒêÎÍPõõ1˚˚P◊Ø\'è‚ﬁ¿1€∂=\0≤WÆ x<HÅ\0ôÛÁs+km-<Î∫˚n‰∆F2##\0Huud#lÀB–4Ú?˘•¨,Ä$Id/_Œ›ﬂqV,F6A^æ¡ÎÂÍÓ›Ög#;wb≈bh˜ﬂü˛ÛO§`A±\"Aò?Ä¢(?˝Ävﬂ}`ò\'N†›{/,YÇﬁ”C:ùŒ=ª|9V4äß≠çÙ0∆©S∏VØ¿8yπƒ˘œ[ŸUU…ú9C˙¸y‘\r, ˛Ÿg§1Q∑nEør•Æé ={òz˚mb{˜BUÇ¶QÒ‚ãX…$˙â∏K¸.îﬂIIB—4$Yf˙a§@ÄÍ#G»ˆÙ ˙)ñm„€µãä∫:\0YfZH˜Ro/ûˆv¥\r–√a≤ó.·ˆzqoPÙ&Ù9«)s·ôﬂGíetA@¥m¸--\0d\"¶¶¶ÓﬂèaàSS«èc[â√áqÈ:≤€=èc®™˜-\\à8=MºΩù¯´Ø\"k\Z©hWk+¢(2™(ú©©a|Ô^jû}\0óﬂO˙ó_Hut†ˇÅ@Ó4Â„Œ≤π5PÙê§™‘45°»2æ¶&UÂÏ©S‘ut‰ËESíX≤vmnÇ êJ$66‚\Z\"ÿ–ÄVUu›Sp]\0†«BQU&&&ê-ﬂÉPo,GZ∏\0ˇæ}LΩÒıÎ◊‡πÌ∂≤¬yõõM+Î…sÁê6n,¨H◊uƒ J√»ÏŸ@:õ-ßÄU¯∆Ì.Èñ,wª©?zîd2…Ö+˜˚9ÁvÛèﬂO¸¿\0Ñ•KôéD ∆)2r)»9∫i¢˘˝sI›n*ÖÀﬂ|ÉŸ—ÅëJ±tÛføü…”ßô|˘e≤##T>˘$ûææŸbπõö ﬂ4eÆµK:@2UE´™ö1Ÿ2M2öF]O-‚õ6∆Î÷!ÉX«è#¯|L\'T9o¬Çx4öãÌ|t4-!\nπ\0P≈u\ZìÜñMM•ÜÊÿ’≥g\ráKé9ç…8˘–…µK8MCqk&tÖ√\'Qwﬁy}Ò3g\ráÈÖ÷;_ÂÎkvk¶÷Õ4ßÖˇ]››˝\r?L`Â “‚?ˇÃË±ctÜBkòY[Âõ”¥Á˘kq˚6–∞u+ÅU´fä2˙ı◊tÜB´ùUÊÛ\\P∫=øû9`\Zπ:Ò9É\rè<B¿)¥´å~ıù°–*G<·∏û*g7(·ÎÍÓhxÙQ\0Fè…Ø<¡<ƒo\Z†D•—‰sû W\\7->/ÄY«]ŒêInÎìÛü7@Dæ(ÛG5ƒÃ˘à¸ï≠JŸ^{\0\0\0\0IENDÆB`Ç'),(19,'Equipment Recovered','tower-y.png','image/png','1873','âPNG\r\n\Z\n\0\0\0\rIHDR\0\0\0 \0\0\0%\0\0\0#∑ÎG\0\0IDATXÖµó€oW«?;∑ùŸª◊^ßµ„ds±Í:i⁄»äB⁄§BÕFjÄó6<V¿‚uˇdÒäƒC@ÇáRƒ äÏ\0AjU‘D!ilÀNºv|øÌ’sŸπÒ∞;\'ﬁul)¸§£3ª3sæüﬂÔ¸Œ9Û˘æ¿ï+W$@\0îf/ÒrÕ<†x„„„@»˜˝@\\‘fSö\0¬K˜ö\0u¿l∂˙¯¯∏ ÂrÅxH4{ïˇOL@*Õæx©6≈{GGo˛˚%?c˘|ÓBÛ“úP.óã5≈”££7Ôg≥\"U_™∞i∫Ë∫K°†ìœÁﬁ\0∂Ä ŒƒS\"Um}œÛq]€vÀ≤Ñí$‚8.Ò∏ÜÎzà‚Ó‘iåÈ–à|+œâ∆\\\rUUwΩÏ˚>∂Ì`Ü!P*%0Õ—ËïJ◊\r”ﬂábQ&ë∞âF5dy∑;kiˇÏ@ﬁ˝¢„ÿîÀu÷÷lnû∆4ST´G1ÕÜ—K*5√““‚Ò˙˚?#€†ßßõpX!\nµçf†Ÿ&÷OˇÚ}À2Ÿ⁄⁄§T 0?ôıı∑Ñ:æ/íNO“◊˜9´´#ÿvÑJ%À¬¬%Œû˝%é3G&ì \ZçuË‡Ó3\0≈bÖµµLOüjı0…‰,áˇãÓÓáHí¡∆∆iz{Ô¢™%&&ÆQ,rÁŒO8uÍwH“mdYCQ¬PZWµ⁄&Ü·33sïr˘«é˝ç„«ˇBΩû`a·]ﬂ°´ködÚ1æ/pÊÃØX^>«ÙÙ˜¯Í´—¥%$iÉCá≤ß¢c|ﬂßZ›biÈ\"•“I˛…¿¿-VWœÒË—wp]ÖdrÀJ15ı™∫I≠÷œ«¯æ»É11ÒŒù˚9∂Ì†(⁄¡\0Íı\Z∂Ì2?ˇ™∫I6{ÀJ0=˝]dYghË˜d2ˇ@◊3‹øˇ_\'Y\'õcy˘klnû¢VÎC◊´(Jº-@õΩ^,À§R9ÜadËÌΩã¶m±∏¯.ñ’E6{Ép∏ƒÿÿu∆∆ÆSØ«9sÊ:ö∂∆‹‹l[„·[\0¨Øü¡4k≠q˜p∏çmœS.gÒ}ëht«	≥≤2BW◊$}}ˇaqÒù÷◊–¥Mé˘ñï¢\\>F29@©4àÎ÷Z„Ó†aæÆ€ Vî\nÆ´‡8Q\"ëç¶go∂û≠Vè¢Î\"ë5\0,+Ö,Wœìiû¯m≠#Ä(ÜáÀ\0òf7íd ÀU∂∑·8aNù˙mÎŸ”ßç(ölm\r†™El;»rïŒ{—\0≤…‰,\0≈‚ ¢Ë–›=E©4H•“Mw˜∂m†Îáêeù’’‚Ò\'$ìè©Té\0–’5ÛtømcoÖ√!b±e4mù≠≠!l;¬´Ø~N29O4∫Ã£GgÒ˝êavˆõú<˘gÜáˇÄaƒ<ôππÇ`—’5E∏Û>‘.\" \"À¢˝˝ü‚8QÓ›˚1}}√˜}/¢(\0|_§ZÈÔøÀâ˜X^>O±8DOœC¬·ö&∂∆›Ä“j±ò¬¿¿-4mùhtQ0MA\0]?›¿´îÀe¶ß?¿≤|¢QÉtzËÔˇîx‹@í¬tZÜm¶‡Èqã)loó∏tÈH“\ní§`.KK√Ç@.˜C™Uòú<«∆∆èÄèQçx|â∑ﬂ˛\rë»í…Ç A&÷ˆ äê…(»≤Äm˜\"ÀSS¨¨\\nÑOÄzb±a e˝Ü·—”ìf``√H°™⁄^GÚﬁ\0–X\rAøππç$Aπ¸°åç]Gñ+ÿvÄôô´˛ë#GNâ¥ﬂˇwZõàtl∫æ ‚‚âñG¶i‚∫\Zñe0;˚-\0l[‹cúˆûÿmûÁP≠Fx¸¯ßË∫Œ≈ã?£ßgÀEÅ……yÚ‰=*ïC$UR©Æ9Ô\0ŒéÜi˙®jt◊”Ç\0öítõ˜ﬂˇ√pyÂïÛ»rÑbqö◊_ˇÑtzÉ’’ºˆ⁄J[GLs;∏liJ<-óL\0]Ø\Z™˙ÏßîÁŸÑBqÆ][g~æó°°ë÷Ωt˙-$©õDbAà≤ΩΩM*5Ùúx≠9v„gS”Âr9à)ˆ(L≤ŸÛ§”G€›⁄e[[s\n_¥Ω◊,L÷ÄP\"`“(óÇ¢agi&\0åéﬁ¸d“È„/L°˘|.8ØÉ¸zæ43o?≈iÎ~tÙÊóŸÏe“È¡‚”\n\'üœçlnu.N_Pû}\0Ωy7õ˝ÈÙ–s‚ì\n7»Ásgõ^Ûº†}yæó5¡T\ZykB‹ÀføM:=‹H°WÚ˘‹õMÒZ≥ôÅP\'{!@àX#W(˛x^„\0‚˚hëhB|	s^£ë\\˚?¿s¡æ\ZúØu\Z°◊\"~`ÄARK5XbıÉà¸G∑ÿ{ã∆\0\0\0\0IENDÆB`Ç'),(18,'Deactivated','tower-y.png','image/png','1873','âPNG\r\n\Z\n\0\0\0\rIHDR\0\0\0 \0\0\0%\0\0\0#∑ÎG\0\0IDATXÖµó€oW«?;∑ùŸª◊^ßµ„ds±Í:i⁄»äB⁄§BÕFjÄó6<V¿‚uˇdÒäƒC@ÇáRƒ äÏ\0AjU‘D!ilÀNºv|øÌ’sŸπÒ∞;\'ﬁul)¸§£3ª3sæüﬂÔ¸Œ9Û˘æ¿ï+W$@\0îf/ÒrÕ<†x„„„@»˜˝@\\‘fSö\0¬K˜ö\0u¿l∂˙¯¯∏ ÂrÅxH4{ïˇOL@*Õæx©6≈{GGo˛˚%?c˘|ÓBÛ“úP.óã5≈”££7Ôg≥\"U_™∞i∫Ë∫K°†ìœÁﬁ\0∂Ä ŒƒS\"Um}œÛq]€vÀ≤Ñí$‚8.Ò∏ÜÎzà‚Ó‘iåÈ–à|+œâ∆\\\rUUwΩÏ˚>∂Ì`Ü!P*%0Õ—ËïJ◊\r”ﬂábQ&ë∞âF5dy∑;kiˇÏ@ﬁ˝¢„ÿîÀu÷÷lnû∆4ST´G1ÕÜ—K*5√““‚Ò˙˚?#€†ßßõpX!\nµçf†Ÿ&÷OˇÚ}À2Ÿ⁄⁄§T 0?ôıı∑Ñ:æ/íNO“◊˜9´´#ÿvÑJ%À¬¬%Œû˝%é3G&ì \ZçuË‡Ó3\0≈bÖµµLOüjı0…‰,áˇãÓÓáHí¡∆∆iz{Ô¢™%&&ÆQ,rÁŒO8uÍwH“mdYCQ¬PZWµ⁄&Ü·33sïr˘«é˝ç„«ˇBΩû`a·]ﬂ°´ködÚ1æ/pÊÃØX^>«ÙÙ˜¯Í´—¥%$iÉCá≤ß¢c|ﬂßZ›biÈ\"•“I˛…¿¿-VWœÒË—wp]ÖdrÀJ15ı™∫I≠÷œ«¯æ»É11ÒŒù˚9∂Ì†(⁄¡\0Íı\Z∂Ì2?ˇ™∫I6{ÀJ0=˝]dYghË˜d2ˇ@◊3‹øˇ_\'Y\'õcy˘klnû¢VÎC◊´(Jº-@õΩ^,À§R9ÜadËÌΩã¶m±∏¯.ñ’E6{Ép∏ƒÿÿu∆∆ÆSØ«9sÊ:ö∂∆‹‹l[„·[\0¨Øü¡4k≠q˜p∏çmœS.gÒ}ëht«	≥≤2BW◊$}}ˇaqÒù÷◊–¥Mé˘ñï¢\\>F29@©4àÎ÷Z„Ó†aæÆ€ Vî\nÆ´‡8Q\"ëç¶go∂û≠Vè¢Î\"ë5\0,+Ö,Wœìiû¯m≠#Ä(ÜáÀ\0òf7íd ÀU∂∑·8aNù˙mÎŸ”ßç(ölm\r†™El;»rïŒ{—\0≤…‰,\0≈‚ ¢Ë–›=E©4H•“Mw˜∂m†Îáêeù’’‚Ò\'$ìè©Té\0–’5ÛtømcoÖ√!b±e4mù≠≠!l;¬´Ø~N29O4∫Ã£GgÒ˝êavˆõú<˘gÜáˇÄaƒ<ôππÇ`—’5E∏Û>‘.\" \"À¢˝˝ü‚8QÓ›˚1}}√˜}/¢(\0|_§ZÈÔøÀâ˜X^>O±8DOœC¬·ö&∂∆›Ä“j±ò¬¿¿-4mùhtQ0MA\0]?›¿´îÀe¶ß?¿≤|¢QÉtzËÔˇîx‹@í¬tZÜm¶‡Èqã)loó∏tÈH“\ní§`.KK√Ç@.˜C™Uòú<«∆∆èÄèQçx|â∑ﬂ˛\rë»í…Ç A&÷ˆ äê…(»≤Äm˜\"ÀSS¨¨\\nÑOÄzb±a e˝Ü·—”ìf``√H°™⁄^GÚﬁ\0–X\rAøππç$Aπ¸°åç]Gñ+ÿvÄôô´˛ë#GNâ¥ﬂˇwZõàtl∫æ ‚‚âñG¶i‚∫\Zñe0;˚-\0l[‹cúˆûÿmûÁP≠Fx¸¯ßË∫Œ≈ã?£ßgÀEÅ……yÚ‰=*ïC$UR©Æ9Ô\0ŒéÜi˙®jt◊”Ç\0öítõ˜ﬂˇ√pyÂïÛ»rÑbqö◊_ˇÑtzÉ’’ºˆ⁄J[GLs;∏liJ<-óL\0]Ø\Z™˙ÏßîÁŸÑBqÆ][g~æó°°ë÷Ωt˙-$©õDbAà≤ΩΩM*5Ùúx≠9v„gS”Âr9à)ˆ(L≤ŸÛ§”G€›⁄e[[s\n_¥Ω◊,L÷ÄP\"`“(óÇ¢agi&\0åéﬁ¸d“È„/L°˘|.8ØÉ¸zæ43o?≈iÎ~tÙÊóŸÏe“È¡‚”\n\'üœçlnu.N_Pû}\0Ωy7õ˝ÈÙ–s‚ì\n7»Ásgõ^Ûº†}yæó5¡T\ZykB‹ÀføM:=‹H°WÚ˘‹õMÒZ≥ôÅP\'{!@àX#W(˛x^„\0‚˚hëhB|	s^£ë\\˚?¿s¡æ\ZúØu\Z°◊\"~`ÄARK5XbıÉà¸G∑ÿ{ã∆\0\0\0\0IENDÆB`Ç'),(17,'HRBN Install Complete','tower-y.png','image/png','1873','âPNG\r\n\Z\n\0\0\0\rIHDR\0\0\0 \0\0\0%\0\0\0#∑ÎG\0\0IDATXÖµó€oW«?;∑ùŸª◊^ßµ„ds±Í:i⁄»äB⁄§BÕFjÄó6<V¿‚uˇdÒäƒC@ÇáRƒ äÏ\0AjU‘D!ilÀNºv|øÌ’sŸπÒ∞;\'ﬁul)¸§£3ª3sæüﬂÔ¸Œ9Û˘æ¿ï+W$@\0îf/ÒrÕ<†x„„„@»˜˝@\\‘fSö\0¬K˜ö\0u¿l∂˙¯¯∏ ÂrÅxH4{ïˇOL@*Õæx©6≈{GGo˛˚%?c˘|ÓBÛ“úP.óã5≈”££7Ôg≥\"U_™∞i∫Ë∫K°†ìœÁﬁ\0∂Ä ŒƒS\"Um}œÛq]€vÀ≤Ñí$‚8.Ò∏ÜÎzà‚Ó‘iåÈ–à|+œâ∆\\\rUUwΩÏ˚>∂Ì`Ü!P*%0Õ—ËïJ◊\r”ﬂábQ&ë∞âF5dy∑;kiˇÏ@ﬁ˝¢„ÿîÀu÷÷lnû∆4ST´G1ÕÜ—K*5√““‚Ò˙˚?#€†ßßõpX!\nµçf†Ÿ&÷OˇÚ}À2Ÿ⁄⁄§T 0?ôıı∑Ñ:æ/íNO“◊˜9´´#ÿvÑJ%À¬¬%Œû˝%é3G&ì \ZçuË‡Ó3\0≈bÖµµLOüjı0…‰,áˇãÓÓáHí¡∆∆iz{Ô¢™%&&ÆQ,rÁŒO8uÍwH“mdYCQ¬PZWµ⁄&Ü·33sïr˘«é˝ç„«ˇBΩû`a·]ﬂ°´ködÚ1æ/pÊÃØX^>«ÙÙ˜¯Í´—¥%$iÉCá≤ß¢c|ﬂßZ›biÈ\"•“I˛…¿¿-VWœÒË—wp]ÖdrÀJ15ı™∫I≠÷œ«¯æ»É11ÒŒù˚9∂Ì†(⁄¡\0Íı\Z∂Ì2?ˇ™∫I6{ÀJ0=˝]dYghË˜d2ˇ@◊3‹øˇ_\'Y\'õcy˘klnû¢VÎC◊´(Jº-@õΩ^,À§R9ÜadËÌΩã¶m±∏¯.ñ’E6{Ép∏ƒÿÿu∆∆ÆSØ«9sÊ:ö∂∆‹‹l[„·[\0¨Øü¡4k≠q˜p∏çmœS.gÒ}ëht«	≥≤2BW◊$}}ˇaqÒù÷◊–¥Mé˘ñï¢\\>F29@©4àÎ÷Z„Ó†aæÆ€ Vî\nÆ´‡8Q\"ëç¶go∂û≠Vè¢Î\"ë5\0,+Ö,Wœìiû¯m≠#Ä(ÜáÀ\0òf7íd ÀU∂∑·8aNù˙mÎŸ”ßç(ölm\r†™El;»rïŒ{—\0≤…‰,\0≈‚ ¢Ë–›=E©4H•“Mw˜∂m†Îáêeù’’‚Ò\'$ìè©Té\0–’5ÛtømcoÖ√!b±e4mù≠≠!l;¬´Ø~N29O4∫Ã£GgÒ˝êavˆõú<˘gÜáˇÄaƒ<ôππÇ`—’5E∏Û>‘.\" \"À¢˝˝ü‚8QÓ›˚1}}√˜}/¢(\0|_§ZÈÔøÀâ˜X^>O±8DOœC¬·ö&∂∆›Ä“j±ò¬¿¿-4mùhtQ0MA\0]?›¿´îÀe¶ß?¿≤|¢QÉtzËÔˇîx‹@í¬tZÜm¶‡Èqã)loó∏tÈH“\ní§`.KK√Ç@.˜C™Uòú<«∆∆èÄèQçx|â∑ﬂ˛\rë»í…Ç A&÷ˆ äê…(»≤Äm˜\"ÀSS¨¨\\nÑOÄzb±a e˝Ü·—”ìf``√H°™⁄^GÚﬁ\0–X\rAøππç$Aπ¸°åç]Gñ+ÿvÄôô´˛ë#GNâ¥ﬂˇwZõàtl∫æ ‚‚âñG¶i‚∫\Zñe0;˚-\0l[‹cúˆûÿmûÁP≠Fx¸¯ßË∫Œ≈ã?£ßgÀEÅ……yÚ‰=*ïC$UR©Æ9Ô\0ŒéÜi˙®jt◊”Ç\0öítõ˜ﬂˇ√pyÂïÛ»rÑbqö◊_ˇÑtzÉ’’ºˆ⁄J[GLs;∏liJ<-óL\0]Ø\Z™˙ÏßîÁŸÑBqÆ][g~æó°°ë÷Ωt˙-$©õDbAà≤ΩΩM*5Ùúx≠9v„gS”Âr9à)ˆ(L≤ŸÛ§”G€›⁄e[[s\n_¥Ω◊,L÷ÄP\"`“(óÇ¢agi&\0åéﬁ¸d“È„/L°˘|.8ØÉ¸zæ43o?≈iÎ~tÙÊóŸÏe“È¡‚”\n\'üœçlnu.N_Pû}\0Ωy7õ˝ÈÙ–s‚ì\n7»Ásgõ^Ûº†}yæó5¡T\ZykB‹ÀføM:=‹H°WÚ˘‹õMÒZ≥ôÅP\'{!@àX#W(˛x^„\0‚˚hëhB|	s^£ë\\˚?¿s¡æ\ZúØu\Z°◊\"~`ÄARK5XbıÉà¸G∑ÿ{ã∆\0\0\0\0IENDÆB`Ç'),(16,'Power Complete','tower-o.png','image/png','1983','âPNG\r\n\Z\n\0\0\0\rIHDR\0\0\0 \0\0\0%\0\0\0#∑ÎG\0\0ÜIDATXÖµó{lïı«?ÔÌú˜‹{;ß–ñ[•’*π*Ã1–√\0E2ÑπÖ0„Õå»0Yì±dfq®ô›a»èÈ¬ñÖ≈E\\`mI`0ÖU∂µÅñ”=˜˜ú˜úÛÓès°•=î&ÏIûº˜ﬂ˜Û{ûÁóﬂ˚Üa\0∞lŸ2SÊ(sg-§Ä8êjllL\0Üad≈MÄöqS@ºC‚©@–2ollL^Ø7+núô£ ˇ\'\Zôc<;K5#Ó©Îi:qáÖáYΩ«ª0söCCo≠Îi:1µ ç’f¬b5›Q·h$N$ßÆ≠ÈDΩ«[K&\rCO∞:≠y≈S©	]GèÎH¢à’ê$IQHÍ	Ö.íâ$í,ç¯÷‚êA e5[g¢L:◊Y«b∑é¯ÿ0ÙXåH0D√·Frπâvú≈Z9üîj#x|\Zf‰D{Aäy‰$,ˆ@N3{\'WÌÇ4í^◊4Ç˛ 	«DúÛó£óa≠öÉRRÜZ^EË´S¸˝ßàvú°ˇ_Ô∫ÿÅgÍdL¢òw!âYíõnﬂ∏eZ(Dˇ’´»•ïx÷l∆µËqR±(Ç$¸‚\r{(Xº…Ê¬z˜<J€H«o÷“€zö¬R7ˆ¬¬|\0πP7i@2…†œáz˜Éî?ˇ;,ïµÑ/|NﬂÅwúj 	‡\\∞Ç¡c¢˜w1È•ÿg.¶Ú∑˚π≤cü˛≈j√lô÷º\0Ç¨‰ŒÉΩΩË)ë)œæÜÌû\\˚˚tÔyπ–É{’Û≠xöŸcÑ[NÇ$”˘˙\nó˛ò≤çØS±i—Œ.∑3±Ê>Ñ<©»õ√0¯|Ø|˚}ãË›ˇ6Ω˚wQ¯èò∏·D’J¥Ì4JI9õ∂˜]¬RYÀÂ∑^@êd¶n˝+ì∂Ï¢ÌÂ%ƒcqÃ6˚¯R¯IÍ	‹?xë∏Ô◊ˆæâR4Å≤ün#∫ŒÂ∑N‡‰«\0òÀ¶3eÎ‹èˇåÿ’vzﬁˇEﬁ\r8Á/Gùr/ëÎ◊1;FAR$ÖX(Ñ≠fÊ≤ª<˛!zœ∑?ˆ&wæΩo¢˜w1Á∞¡ú√≤´ÑŒmÎ—Æ∂·Y˜2í≠Äﬁªp-\\E‘=7Óò\0âãÕ$.6Û}ãµzÇ$£u∂ ™v\nØMW~”ﬂ(^˛tÓõIõw˜u“˚¡NL%ÂXk˘˙\0ˆës„é	ê5√0’tıÍÉ=à™ŸYL¨ªÄÇE´sÔZ´Áb.õN¨´\0•∏åÑø#ïB0©d∑¸—,/Ä$	Ë◊\00y&ìH¯{1WT#™v.˝~cÓ›Œ7~B2¿1˚·4pÔdW	Ç(í˜!¬¯E!r·3\0Ï3cË\Z°/è‚®˝.RÈ4ÇˇmB◊u\0Ã’$CÉ.^G¥„·ñìX´Á\0>wYŒˇ[ëwœ7õe.µÎ˙«˝KêEÙzèh{3·ˆØp.yíË@Ji9÷ˇíÓøºB◊;ø@¥!òT<k∑ê“¬ø¯Û(˚B˛ààäŸå$âÙ|ŸYÃ¥_Ô%⁄‹Äﬁ∞ãT2E… gpññÈïâôü‹OÚlEè¨«qˇRß\Z–˚ª∞X’‹∏c»¶ú€]zÏ&÷›AÏJ+í$£È2¢%, >ÿáﬂÔgÚÊ∑à≈tà¯	6ÇëJ—w]‰DYµ‹w,\0A1Á‹QRå†∏˙Í\Z∫ˇ¥Y5çÑq,zQ9µT‡∏◊MÁÓ:&?˘B:u;ZÁ9z∂?K‡≥C8\núH™%7Êà˘éê{®@ie%ä9Ö≠≤≈l‚¸ŒQÛƒ¶4ΩÒ8îœ| Û±H4≈=eÚ•œqOöà’ÈºÂ*YÑä:¸2s≠(*}›É»2.X¿ú√˙uJa)\0eœl£ÎœøbÍ‹y\0ÿJ,yÖ≥62&K^è¯.¢Œ^íõë¶iH6\'±XÄ	Î∑êH\Zy«»Å‘PÄ—,ïHå9X¯⁄>\"ë6Œﬂyb10´/n«≥Ê%‰â’Ñ(öV<÷‰SYÄƒG”X\\éoKfp	\\˘d?‹H$î§˙ë•òÏ˙.úÂ ŒÕƒª⁄pØ|\n˘Î#Êëâ˙ÉŸ”ú¶ÃçvI¢†®X\n\\√quùÑa«u·üÿ ®}Ù°‹3˜¨Q\nJâü9ådqç(æg÷pÒAzÏ¥iÕî‡ızMÄ(‡ç…Ù•ﬂ£§ÍÆ—Éyìıµ}C˚ë££>À4&=¿  F@#›.ëi\ZÜ∂f\"@›ë¶„»2ÓÍÍ[ä˜∂∂“~‰(ıÔw2∑≤ıusk¶©€iNsˇu=Mß´V¨ƒ]S3∫¯˘Û¥:HΩ«;ó·µïø9£=œá∂oÕU´V„æw∆pÒñs¥}¸ıÔÏÃ,≥y\n0z{~+ÀÄ©§ÎƒûÅ¯≤zı∏g‘¶≈œù•ı£}‘{º≥2‚°åkY°|6&@{]OSsıö–˙¡˚Ÿôáá¯må·Ã@ú≤9ë.Æ€¿M÷åg˜◊8È–G∆#>nÄ!Ÿ¢Ã.’ÏãèG‡z∂Œe˛Á\0\0\0\0IENDÆB`Ç'),(15,'Active','tower-g.png','image/png','2029','âPNG\r\n\Z\n\0\0\0\rIHDR\0\0\0 \0\0\0%\0\0\0#∑ÎG\0\0¥IDATXÖµóyl˜«?sÏÓÏ¨Ω∆æq\r6F@8 Q\nxihj(î&Å–\n9i@4§Wîê\nµRhõTQs“4U)%Am‘í∆êõ%\'1`L¿`s˚XüÎΩœˆœ,6x1TÙ≠û~;øﬂÃ˚~ﬂ˜˜FøyB4\Z`Ò‚≈2 f}îπ∑4 hïïï\0!\Zç\Z‡f@—›¨Ô∏¶›Cïïï¡·p‡*`◊GÖˇè¿ÙÍc»»R—¡”´ ‘‹c‡AÊ®(ù≠ˇ’Ä»@È’™≤5âc∆!´	»VıûG¸>\">Uej•ì–∑a`·)\0äÕélµ\rD”˙ËãÑÈáDâP¿ã(…H≤	-Fµß†ıE•[wOVâ\"Ó˛K£ŒD£⁄\rGQÌ»Ç4»%D¥Po7∏}‰Ñ(ééBıiÃ3O`±y*ÓÓvËË¡ÁÍ\"\Zâ‹C$’„c∏A5VÌ≤ ›¬>ˆp˜ê\'§±${!Ÿ÷¶•L&[Õdl‚∑eÌòUúÍ9√_õv”xÌ<Yò-*¢˜E\r&É•nLE£Q¸~7NÁe∆™£xr\\9ÀrÔ«Òce>i´fg”ﬂYô∑î$ìùí‘©î¨a≈°uk;IRZââ©Òƒ§∏â¿\r˙¥›ùÕÃM.ÊÖ‚-LJû¿ëéZﬁ∫7ˆ∑§7ÏfI÷\"ˆ\\›G≥øïWK~À¸ÙŸº?\'è>√Ó+{∞öm( –5ìa†ôSÃ›Ωù»}\Z[ß>«Ã¥iº|ˆO,˘xáú_x·ZNó}∆ÚQ0g‰˙⁄É¨9ºûßkMO»≈´%øar“x⁄úëêb1ÔXÅhT£≥ªô««¨aŒ»º—∞ùm\r€˘~˛r∂‹˜3¨≤ï/ªÎ»Q≥x•d+óΩ◊òî<ÅıG~Å,Hº=w€fº»Ç™Ô	Pïƒª€∑ﬂç÷f„∏u\\ˆ^„≈˙◊»T“y~ ≥tá\\l:˛K*ÆÔ†0a4;Áº¡c¿Öﬁ&^:˚G÷å˛˜g/dB“8úûNÏ÷w∂f¡ÑY0{òô:çÇÑ|ˆ\\›«ﬂu+|î\\5õÎ_£Ÿ◊JtµìËj\'iJ\nèTˇàÛÓ&~2~=#Lvﬁ<øÄ≤úo·ˆv«‚K‡òßûcûzÆxØRí:Yî9„:GÇlcEﬁR>i´ÊùKÔÒ√Çábœº>„w\\Ú^Âıs!GÕdf⁄4éuù\0`ﬁ»Y∏CÓX‹a	çFQ%+\0Œ@™d%’íLì˚\0ÀróƒÓùû2Ö¬Ñ—\\p_ €öIG†ãæ®Ü\"Y@?Úá≤∏I¢5‡ œñKoÿM{†ì\"{	≤çÚœüä›˚hız√neŒ‡öØô4%IÈvÅ ¸L&ét~	¿¸ÙŸ¥ ùá˘F˙◊≠‰R’˙)·pÄ\"{=a+Ûñq≤ÁüwgZÚd\0µÅ «?Ÿ„ÆàgZ\Zht_bA∆\\RÃ#ÿ—¯.µ=u‘wùf’®Â8=Ì‰$gÛÃƒMl9ı?=Ò+“‰$…¬S„ü¿Òq∞≠\Z—bπs$˝g2)íÃˆ∆]§ZíŸ=Ôœ|‘˛)/µÏB”˙XW∏öú‰l\0L¢åŸbOÀ¯†ßöGÚW∞0c.˚[“ÏkE∂⁄bqá%`M1∑$&ÒÊ˘4y.”‡nDîdL°à\"ãÛ–·ÔƒÂrÒÚÃﬂ£ÉÙhn>n˝-™±Ωq.)àb∂∆bªähæA&i$ûF j÷—–uãöHÿÁÂÅÏ%à¢àv\Z∏›<V¥Å∑`C›s®V;ßØüeÌâüÛQÛ”s∞»VÑ8Öx[àf≤räòLdYã0ô,\\¨;Ã∆9Â˙∫!ôY˘%∫úüáÙÃ—TÎI…»Cµçàá¿‡ÇQÙR,<Ìm K,…- ∫⁄IõøùÎH\0ûü∫ôÕ\'∂2æ®ˇ≥œjœåÀÒÊ	´®ƒıf◊§Õèe∞õ	É\0<;q\0BDã#ûö1°q@§/åÍ’¯Áäù¯|>Jˆ}ìØÇó!D∞(ºR≤ïè+ß»ñOoo)ÈE√%Ø\"- ¡6ƒ…%)»IIºÓﬂîüzö>üõ9ìÀ∞)vŒ∂ú‚…cõ9ÎΩ»⁄¬á˘–U∫5è∑\'ñè·27⁄•\0@–ÎBÕ$⁄R=Óc’˛°’ê!\'1cˆ™ÿ⁄¥‹Y§)©TvVì`≤·	{ôê5e–ÛnoAØÀ∏Ëòö‡p8Ã@0Ç€4&≥\'}á¸¨	Cjy≥]j9CM›ﬁ!◊Ù∆ƒ	Ù\0CÅ\0˝Ìz”0∞5™ÿ[md\n≤Ôª-xcÛijÍˆ‚®(ù´Oıusk\0¥;iNcﬂUeé/û≤í¢ú¡Ú\Z÷p˝$ï\'ﬂ√QQ:ù¡µø9¶=7∆ÅÌ[Ì∑ãf|NÒ ØÆ◊ÚaÌª8*Jãı,ç}H`Ëˆ¸v¶SËØìùƒ…•≈kòò;Ä˙k«˘†ˆ•StpèÓ(û\rK âÑ™≤µN_¿øéÔ42˜p‡wL`vùƒq¿ÿs˝≈u«‡wE‡&™Ó∆…¢_zﬂ›Äﬂ5Å$å¢4^U„›\r8¿äµ\ZJU\0\0\0\0IENDÆB`Ç'),(22,'Killer Bee Infestation','tower_l.png','image/png','1867','âPNG\r\n\Z\n\0\0\0\rIHDR\0\0\0 \0\0\0%\0\0\0#∑ÎG\0\0IDATXÖµóYo€ÿ«\\EQ¥º€ÚÀôƒâÎ&N‚Ã4qÅq‚m(˙–◊æÊ‰yÔË{ﬂ\nÙiÄ®;u–fô∆…di∂i3i‚}◊FëER}•»±«@zÅÉKJ‰˘ˇÓπÁﬁÀ#îJ%\0Æ\\π\"\"†ÜΩÃßm\0.ÃÕÕy\0B©T™à´Äö\ZàüH<\\¿	ÕùõõÛÑôôôä∏ƒ√^„ˇ∞ÄlÿªïQj°x◊‰ÙÏ›O,ºß-Ã_ˇIx\0^mËı…ÈŸª…‰b∫N4™}Ra€v»[0{wa˛˙8·4‘&û`ç≈É ¿Û|\\∑à(ä8NYë$ﬂ˜à«õ}IíˆΩ´«4ÑwU…3Q¶<◊#¶Ô/ïJ∏në|ﬁ&<9@ïE“∂C¢KCë=~xk·πà\nÒ¶™™ÏÛS„ª™YI¥*õ ˚^t›\"ô¨â\"πå\Zƒb2›\Z1]¶µYeu√Ê‰±f∂w\n<˚OÜ•eìæﬁN\"ë¢∏ﬂ_≠ÊæLØ’/ïJÿvÅçÕ]db¨çë#E/@ñ÷,ûˇ;√±dU!—©1>⁄Ã◊]e}cãéˆ6‚ÒX#Äj(ˆb’\0¯AâÌÌ4]Ì*?˝ºìŒ∂Î[O^§y≥ú«u}Ü^Ω…ë∑<¶/t”ﬂ£Û´üı1{ìÔ_Ô¢E4M=@Õ÷≥õ ·˚E¶&ÙtEπ˜páªﬂm£G%~<⁄¬ÿÒfV÷-÷6DnÃØq|§â©Ûù|y°ãÌî√˙ÊGÜàu¶∂.@ÂπR©ƒn*«ÿ±fzQ=KÒËyä„#M|q¶EŸ‹.–SΩ\'kzt¥E¯Ê÷¢ ãKΩ\\ûJ«Øﬂ‚∫E¢\r¢–¿≤xûœÈ±V≤π\"èwàEe.ûÎ§‡‹º≥∆Î≈<\0-qÖüO˜rÍd+È¨ÀÉ\')N|Á»ÄA{kÑ\\÷Bè÷ÿ∑◊ã¢Ä(\nÿ∂KOWîñ∏¬´79r¶«¯âföÖÖG;òñ«µ´£\\ª:JTì¯Û7´§2.g«€à®\"è_§H\ZòyªÍ˜@ÄT& ï	»Ê\\∫;5DQ`\'Â¢»ü\r«YZÕÛ‚Uñ±cÕ’w.]Lê5ã<zñ¬à)$∫¢ll9\0Ù%¢\\øÍ˜@ÄJ+ïJ»rôÿr<dY$™Id≤E\0FÜö™œvwj¥ƒ“\0Có±?Ù!R9ÚÎµÜ\0í$aY>\0qC¡-ÿ∂GK≥ä\"¸ÂÔk’go¸mïÇ0–W^Ûπ|ë®&!∂„◊›‹PÖµMÄ˛ﬂ/±ºn”ﬂ£cƒDW,ä≈r4Z[T\nÆœ±·&∂w¨mÿtwî∑›ï5Yn|≤7àD\"Ï¶]“Yó˛-\"ÚÙeö€˜wÿÿ≤ÍS»ôÂy>∫ù Ä‹€Ê·”í,rfºïb1`iÕ\"â|<Ä îMU$I‚ÈÀQM‚´À},Øª¸∞X\"∆G[hk-ÁAy’XºYvÿÿÅG„Ù∆xªú«Ã{Ëz¥Í˜@\0QxgÒ&É\'/Rd≤ERIíp]Q9:‹\nÄe…d2\\ûÍ°P(‡˘ã+yJ•OøO#à\n™\"W}æﬂˆo≈5GysãAŒÃs„Êõ€∫ÆaY6…AQ˘›ÔüìÀÂòk‚◊ø<…ùt]ey9≈Õo”¸w)Oww\'≤\"÷}]\0©Se˙˚ªPU3PÖ«O^Ú’•·0Ù\"ÆÎr4Ÿ[}\'ü∑ÈÈÈ¿¥#$±ËWAÄΩ˜—àRÌ77wêeô‰Py∫vuîºuîò^v35Ÿ…≠Ö-N†ÂÄ£Í‰Ä$5∂T&O_B≠é»q\"™H°P\0‡¸D;\0ûWlË£Q™{§$’óÔXñ…o~{\ZÀ≤¯√üﬁê∑À‚ëHÑÈ]L¸®ç∏!ë…ÊÈI¥4¯†‡’éccƒ¢˚I%ë÷ñf˛ı|ç[˜MÚyá≥#D5ï•ï]ÊÔlí…˘åüh%ùã ◊≠ô∑+óUMôwÂí`öí\0Ü±¬˜|øàÂˆ¢»9æú:Y˝ox∞]ìY€ÚPe◊3Ë›”¥1M´rÎÑöÅ033£–¬\nìâSI˙{€Î∆Ú˝∂º∫√√«ØÎ˛&õ@\Z0+p(óKÑECmi&ÍÏmQÑÅæC,≠î≈ÊØ_™‰◊˚•ôSúVø·\'ßgLûI2ÿﬂQW|qyõÖÔ^≥0˝,{s´qqz@y^ÈkÀ∑áüüK24∞‚Ì“6ˇºˇöÖ˘Î·(+Û\\Pø<ˇP¡4 ybÑèø8ó‰»`‚Õ‚6ﬂñ≈OÖ‚fhNE®Q;†Ñ19=˚¬˘$\0wÓUGnrÒè®!\0ï97)\'◊Gã\n‡==¥ ∑∂K9Ù÷aƒ\rPQI  R≠,1˜0‚\0ˇõÖ[Üñák\0\0\0\0IENDÆB`Ç'),(21,'Planned','tower-b.png','image/png','1813','âPNG\r\n\Z\n\0\0\0\rIHDR\0\0\0 \0\0\0%\0\0\0#∑ÎG\0\0‹IDATXÖµólg«?æ;€ÁI◊éì¶ÕØ∂i¬»≤h+K;ñµ[⁄N∆PŸ:6iï∑!§±HÄ@’@Äÿ@ùÑ4§µÇvÎA0!Ñ•a´J€¨YSí•Iõ¥M⁄ÿulüÔ¸„é?|óπYú4Sy•WØ}Ô{Ô˜Û<ÔÛæ˜>6√0\0ÿ∫u´Ä√l%nn…:êÙûûû,ÄÕ0K‹»fuò\0¬M◊MÄ4†ö5›””ìµuvvZ‚n†‘le˛?Pò5€¥e•läWÙ·˛õ,|]È∞ÿh˛‘Ål°Î›}F∏øÆÆ∑€ç,À7UXUUE°o,‹ﬂa;–ÇπÖÅ\'ãäÎ∫N.ó#ì… ö¶!í$ëÕf)))!óÀ!ä‚Gﬁù7ßgÇÌV]P‹0“È4Òxúå\Z\'‡N”XëE2R¥’ä¥Øòùù%ùú…è…d4†`Ó9M+–çˆl6ãíåSÂ≥±•uïÂ2-ı%Ñ¸2ıïnéùΩ∆C˜¨‰˝Ò8ø˚ÁE∆ß¶8ùNl6[±iã§h1M”àD\"‘áú<y\r€Ôí“tD—Fˇ˚^Ôª»gÔQÊëhm(Â—{WÒ‘ãßù¡S‚√„Ò,&±4@,vç\rç%|Á—FökºúâÒ⁄ﬂ\'xs`Ü∏íeÀméõf*¢Ú|∏ôˆÊr~Î6æ˝Î!˜Oa∑€q8 ëH`rÏŸµé∂µeÏ{cîü¸~î@©É«Ó[≈ÆÕ’º;Â¯pI¥—µˇ=>ø©ígY«√MO$æ!\n]ä¢\0Üaè«yºs%÷˚8¯óÛºÚ◊|ncàoÏ\\ÉÀ)20:KeπìÁvØgÚ™J”j/œ˛Í¢`cﬂ3-Ï}≤ôù?8F&ì)ÍÖ¢\0Èt\Zùˆ\Z&Æ¶x˘Aüì=ª÷1õÃΩWÜ¯€ÆPrÒ“W[x|ÎjŒ]V¯≈ü«Ÿywõ[4ÆÚr!™(\Z˝ö¶—∂∂î⁄êã#«¶ôúQyÏﬁjVÆê˘È·1¶¢\Zì›€òÏﬁÜø‘¡”˚8wY·+;j)uKÍô\0†Ûˆ ™™ì)ê…dhm(C˛;ëƒÌŸ—^…ø#¸·≠K<|Oı‹ÿÖõô∏¢r‡»y*˝2mkÀ85\Z‡SÎ}‰rπÂÜÅÀô?—fbi\\NërØùÒiÄmwÁ∆ﬁ⁄PJ]»≈πÀ˘æPπìH<ÉÆ»vÎìø,\0Qôæ¶PêI§≤ÃÃ¶i®Ú‡vä|ÛÁÉscªˆøG<ï„”üÙpiF≈_bGlD‚ô≈£‚\0vªù#y7∂7ó£et˛}& ùMÂ‘ÜdéûéÃç]SÂf6ôaG{à3Áé—R_\n¿;g£HRÒ›^¥«Èt2<a|Ja„-~|âÓﬁINè%¯  ;VKf(ÛÿyÊ¡z~¸˙<ˇ⁄eŸ!Âœ‘¢h9˙£8ùŒèÁQ˘mÔ$Â^;?˚Z+Gc¸Êhå\\NÁK[™)ÛÿÛVàiM°ÁDÑ∑áæpWõnÒÛÊ¿U.G5\\.◊Ú\0º^/áz.0>ùbÙbQQUA∏˚÷|F˘/ﬂﬁ\'–4çòb÷`]7ËÓùDÕ\nã.¡í\0	\rûxqêÔ\ZAí$R©l o¡™áè∞˙°7x°{òßh¿·ppˆBÇØˇrÑﬁì3∏=%BqôEDQ$¢Ë^Ç¡ ~øüD\"¡ÓÌ5˘ó!ù¶6îw±Õ©Tä@ ¿;#Y ˝+êey—]∞‰≈”n∑œµ—ô$I¢£e\0ì›€∏”ñÂÉlœÆµº–=BMM–Ìv/5˝ÚÆ›	Ea˚Ü Îûï∏>¥°Î¡Ä¢7¢Öäı∂æ‘@]◊Q‚qˆwm`S◊?øíE”4dŸ…sªõx‚˛\Zj+úDìI|>ﬂíSZ\0ŸÇä™™ﬁA†¢¬GÔ…iû~È4©TäÜÜÜ¸“D£|˜‡C*èlYÕ´}…>Jsö¶K*Ä¢‰œÛ˘∫ÆK§Ÿ˚«Üa–‘‘4◊Á˜˚ë$â?ΩAt]ˇà¨kπı◊‘‘mùùù¿¯X$1©´´√Ô˜/hŸ¸âD[∞œLL¶Åk@¬ÚÄJ>]¬L\Z\nS3†o,¸∂eÌçàwÿ‹e>≤‚k~j¶˙ç$ßsw¯>#||1OàﬂŒı±U<9]\"=∑⁄¬ÙÌƒB‚m¶ï÷:,úû/VL0ô|úxMàSÖ‚≠¶x¬¨™%T¨,	P¬ky(¥<¡2ƒo`àR‚8`≠yÇ|p›∞¯≤\0ÊA∏Õj›µ”‰]Ø,G|Ÿ\0VPZ[’⁄bÈÂà¸9\0ÜÁPÇØ\0\0\0\0IENDÆB`Ç');
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
  `install_team_id` int(10) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
INSERT INTO `sites` VALUES (2,'Baycite','BAYCT',19.05623000000000,-72.01707000000000,'',4,'2012-09-22 00:00:00',2,1,15,1,7,1,10,9,NULL,'Transversal installed weather-tight enclosure for Inveneo router-switch board March 2012. Was cabinet.','Standard triangular Voila tower. Platform?','Beam clamps','Steep, rough dirt road. High clearance 4x4 required. Key no longer needed for access to Inveneo equipment on site.','Cyber-training center of George/Pierre in Hinche','L\'Hermitage Pandiassou hotel just outside of Hinche (call ahead)','(Old notes - done?) Need to move CBRIT dish to other side of tower. When you are up there, switch HINCH radio to sta to get a link up'),(8,'Belladere','BELDR',18.85092000000000,-71.78593000000000,'',NULL,NULL,2,1,15,1,6,1,12,NULL,NULL,'','Standard triangular Voila tower with platform','Existing standoffs, plus 1 pole mounted with beam clamps just below the platform on the NW side. Pole is necessary to get away from a large grill dish (non-Viola) mounted on one of the standoffs.','Short, steep dirt road, 4x4 recommended','','Germain guest house',''),(12,'Bellevue','BELVU',18.36383700000000,-72.90718000000000,'',NULL,NULL,9,1,15,1,5,1,10,NULL,NULL,'','Small, old, very crowded triangular tower','Numerous abandoned round standoffs. Beam clamps may not work due to the large number of other antennas already present. Custom standoffs may be needed.','Foot, donkey or helicopter (verified). Road destroyed in landslide past Chamer?','On site','Bring tent and water.',''),(13,'Boucan Carr√©','BCARE',18.92106118000000,-72.14426114000000,'',NULL,NULL,2,1,15,1,5,1,11,NULL,NULL,'','','Beam clamps','','','','8-port H3C DC switch:\r\n- port 1 (vlan 11) - BCARE-BOSIO\r\n- port 2 (vlan 12) - BCARE-100\r\n- port 3 (vlan 12) - BCARE-340\r\n- port 9 - trunk to Mikrotik'),(15,'HDC225','HDC225',18.95719000000000,-72.37142000000000,'',NULL,NULL,9,0,21,10,7,0,10,NULL,NULL,'','','','','','',''),(16,'','DELPECHE',18.92640000000000,-72.54260000000000,NULL,NULL,NULL,0,0,21,1,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,'HDS007','HDS007',18.35244000000000,-72.58594000000000,'',NULL,NULL,9,0,21,1,7,0,10,NULL,NULL,'','','','','','',''),(18,'HDN008','HDN008',19.72122000000000,-72.22322000000000,'',NULL,NULL,9,0,21,10,7,0,10,NULL,NULL,'','','','','','',''),(19,'HDN208','HDN208',19.70678000000000,-72.40367000000000,'',NULL,NULL,9,0,21,1,7,0,10,NULL,NULL,'','','','','','',''),(20,'HDC004','HDC004',19.08672000000000,-72.71794000000000,'',NULL,NULL,9,0,21,10,7,0,10,NULL,NULL,'','','','','','',''),(21,'HDC260','HDC260',19.26019000000000,-72.51653000000000,'',NULL,NULL,9,0,21,10,7,0,10,NULL,NULL,'','','','','','',''),(22,'HDC274','HDC274',19.30222000000000,-72.60956000000000,'',NULL,NULL,9,0,21,10,7,0,10,NULL,NULL,'','','','','','',''),(23,'HDC263','HDC263',19.15114000000000,-72.61242000000000,'',NULL,NULL,9,0,21,10,7,0,10,NULL,NULL,'','','','','','',''),(24,'HDC264','HDC264',19.12856000000000,-72.54686000000000,'',NULL,NULL,9,0,21,10,7,0,10,NULL,NULL,'','','','','','',''),(25,'HDC280','HDC280',19.12258000000000,-72.47814000000000,'',NULL,NULL,9,0,21,10,7,0,10,NULL,NULL,'','','','','','',''),(26,'HDC267','HDC267',19.05200000000000,-72.46558000000000,'',NULL,NULL,9,0,21,10,7,0,10,NULL,NULL,'','','','','','',''),(27,'HDC220','HDC220',19.17464000000000,-72.14114000000000,'',NULL,NULL,9,0,21,10,7,0,10,NULL,NULL,'','','','','','',''),(28,'','HDN216',19.33717000000000,-72.11928000000000,NULL,NULL,NULL,0,0,21,1,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(29,'HDC203','HDC203',18.83103000000000,-71.93286000000000,'',NULL,NULL,9,0,21,10,7,0,10,NULL,NULL,'','','','','','',''),(30,'HDC318','HDC318',18.90121000000000,-71.85246000000000,'',NULL,NULL,9,0,21,10,5,0,10,NULL,NULL,'','','','','','',''),(31,'HDN210','HDN210',19.66461000000000,-72.54856000000000,'',NULL,NULL,9,0,21,10,7,0,10,NULL,NULL,'','','','','','',''),(32,'HDC200','HDC200',19.14508000000000,-72.00750000000000,'',NULL,NULL,9,0,21,10,7,0,10,NULL,NULL,'','','','','','',''),(33,'SDH009','SDH009',19.49803000000000,-72.33556000000000,'',NULL,NULL,9,0,21,10,5,0,10,NULL,NULL,'','','','','','',''),(34,'HDC212','HDC212',18.90519000000000,-72.07175000000000,'',NULL,NULL,9,0,21,10,7,0,10,NULL,NULL,'','','','','','',''),(35,'HDC230','HDC230',18.92183000000000,-72.14400000000000,'',NULL,NULL,9,0,21,10,7,0,10,NULL,NULL,'','','','','','',''),(36,'HDC201','HDC201',18.82533000000000,-72.10606000000000,'',NULL,'2012-09-13 00:00:00',9,0,21,10,5,0,10,NULL,NULL,'','','','','','',''),(37,'SDH017','SDH017',19.05625000000000,-72.01706000000000,'',NULL,NULL,9,0,21,10,5,0,10,NULL,NULL,'','','','','','',''),(38,'SDH010','SDH010',19.16614000000000,-72.36336000000000,'',NULL,NULL,9,0,21,10,5,0,10,NULL,NULL,'','','','','','',''),(39,'HDS300','HDS300',18.26864000000000,-72.66619000000000,'',NULL,NULL,9,0,21,1,7,0,10,NULL,NULL,'','','','','','',''),(40,'HDS017','HDS017',18.23322000000000,-72.38272000000000,'',NULL,NULL,9,0,21,1,5,0,10,NULL,NULL,'','','','','','',''),(41,'HDO386','HDO386',18.54132000000000,-72.58091000000000,'',NULL,NULL,9,0,21,10,7,0,10,NULL,NULL,'','','','','','',''),(42,'SDH011','SDH011',18.43983000000000,-72.29172000000000,'',NULL,NULL,9,0,21,1,5,0,10,NULL,NULL,'','','','','','',''),(49,'World Food Program - L√©og√¢ne','WFPL',18.50937000000000,-72.61989000000000,'Karen Barsamian, WFPL 3785 7133, karen.barsamian@wfp.‚Äãorg (in PauP) JeanSerge Seide, JeanSerge.Seide@wfp.org, +509 38 82 04 44 (on site in Leogane) At the front gate ask for Frederic. Also, Yves runs operations for WFP in Leogane.',NULL,NULL,1,0,15,9,6,0,10,9,NULL,'','~20m small freestanding angle-iron construction tower with outside foot pegs and diagonal 3/4\" round cross-supports (no horizontal supports anywhere on the tower). Inside equipment is in an air conditioned shipping container adjacent to the tower. Our equipment is along the back wall of the container, mostly attached to the wall via zip ties.','Nanobridge is mounted on a pole attached to one face of the tower with 2 stainless steel hose clamps. sectors are bolted directly to the L-shaped uprights.','In town. Inside the MINUSTAH L√©og√¢ne base near the WFP shelters and adjacent to a 2m satellite dish.','None','None','9 Jan 2012 UPDATE - Network equipment now plugged directly into AC of server-room UPS. (Fixed problem apparently caused by intermittent Phocos charge controller and possibly other components.)\r\n[NOW REMOVED: 110VAC with 12VDC battery backup system (15VDC power supply, 10A Phocos charge controller, (1) sealed 12V battery, and small inverter.]\r\n\r\nIn OpenNMS and on radios: WFPL-090 = leo-base-033, WFPL-270 = leo-base-240 Two 17db sectors'),(51,'Bosiaux','BOSIO',18.89656891000000,-72.09365890000000,'Fedner 3697 3106 or 3443 8656',4,'2012-09-29 00:00:00',2,0,15,1,5,0,10,NULL,NULL,'Cabinet','','1 beam clamp for 25db Nanobridge, plus existing standoffs on top of platform','Very wet, muddy dirt road. 4x4 required.','','','- 25db link to MIBAL\r\n- 30db link to BCARE\r\n- Three 16db sectors'),(52,'Boutilliers','BOUTL',18.50748000000000,-72.31686000000000,'Reggie Chauvet: tel:+509 37010044 (Digicel - preferred), tel:+509 34100044 (Voila), tel:+1 954-205-4606 (US), mailto:rchauvet@haicom.com, or Skype:papiepou',NULL,NULL,9,0,15,4,3,0,10,9,NULL,'The top Inveneo cabinet is Ruralnets / HRBN Network. The bottom Inveneo cabinet is HAICOM / PaP Net / NetHope Network.','Sturdy 60m freestanding triangular tower using round uprights','Rocket dishes and sectors can mount directly on these uprights.','\"Steep paved road (Laboule 12) from Route de Kenscoff at Delimart.\r\nHaicom tower is almost directly across from the scenic overlook site.\r\nLook for the blue gate on the opposite side from the overlook.\"','','','Extensive details in tower notes, see Zone 0 (tower notes) - http://10.0.2.1:8880/node/54.\r\n\r\nThere is an inverter and a UPS in the building.'),(53,'Brache','BRACH',18.52276600000000,-72.58760100000000,'3443-8571 called on last Friday around 3 pm. 3765-0205 (not sure if this one is correct). (Eyleen, March 26, 2012)',NULL,NULL,1,0,15,1,3,0,10,NULL,NULL,'Enclosure','','','Site in the Leogane area (to the east of town immediately before the bridge)','','','110 VAC from shared -48v inverter'),(54,'Morne Carmel (Mirebalais 2)','CARML',18.82545000000000,-72.10625000000000,'\"SonSon\" Lucener 3469 1921',NULL,NULL,2,0,15,1,6,0,10,NULL,NULL,'','','','Short steep dirt road from town, usually in decent condition. 4x4 recommended','','',''),(55,'Cabrits','CBRIT',18.70804000000000,-72.17028000000000,'Larousse 3851 7638 (also arranges storage and transport of materials to the site)',NULL,NULL,2,0,15,2,6,0,10,9,NULL,'','','One existing standoff for JANVI and MIBAL links, pole with U-bolts for CBRIT link','Foot or donkey from Fond Cheval','Small shelter onsite, very limited space; larger space available at start of trail accommodation: bring tent','','\"16-port AC-powered switch:\r\n port1 = vlan11 = CBRIT\r\n port2 = vlan12 = JANVI\r\n port3 = vlan13 = MIBAL\r\nStatus:\r\n - 30db to CBRIT\r\n - 30db to JANVI\r\n - 22db to MIBAL\"'),(56,'Dessalines','DESAL',19.25975000000000,-72.51718000000000,'Ask Jeffrey Carr√© (Transversal) for contact info.',NULL,NULL,6,0,15,1,5,0,10,9,NULL,'Independent enclosure board installed 4 April 2012.','Triangular with platform?','Standoffs were in use already?','In town. Independent enclosure board installed, so key from Voila not needed.','','','-25db dish to LESTR - Signal strength -56 to -57 dB (4 April 2012). Three 16db sectors.'),(57,'Grand Go√¢ve','GGOAV',18.42684000000000,-72.79913000000000,'',NULL,NULL,1,0,15,1,6,0,10,NULL,NULL,'Enclosure','','','','','',''),(58,'Gros Morne','GMORN',19.67347000000000,-72.66989000000000,'',NULL,NULL,8,0,15,1,6,0,10,9,NULL,'','','','','','',''),(59,'Gressier','GRESS',18.53994000000000,-72.53400000000000,NULL,NULL,NULL,1,0,15,1,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(60,'Hilaire','HILRE',19.16624800000000,-72.36338300000000,'24/7 on-site guards who have the shelter keys. No need to call ahead.',NULL,NULL,9,0,15,1,3,0,10,9,NULL,'','Two towers on-site. We are using the square tower.','Beam clamps to 4 poles','Very steep, rough road from Petite Riviere (1hr) - high clearance 4x4 required.','','Bring tent and lots of water to sleep on site. Le Gou-T Hotel in St Marc.','\"More details in tower notes, see Zone0 (tower notes) - http://10.0.2.1:8880/node/54.\r\n24-port AC-powered H3C switch:\r\n Port1 = vlan10 = HILRE-OBLEO\r\n Port2 = vlan11 = HILRE-270\r\n Port3 = vlan12 = HILRE-JANVI\r\n Port4 = vlan13 = HILRE-MASDE\r\n Port5 = vlan14 = HILRE-HINCH\r\n Port6 = vlan15 = HILRE-PIGNO\r\n Port7 = vlan16 = HILRE-STMRC (no cable run, may be replaced)\r\n Port8 = vlan17 = HILRE-GNAIV (no radio, no cable run)\r\n Port9 = vlan18 = HILRE-MARML (no IP configured)\r\n Port24 = vlan1 = administrative access port\r\n Port25 = trunk to Mikrotik\r\n Port26 = administrative trunk port\"'),(61,'Hinche (Hinche2)','HINCH',19.14325000000000,-72.01257000000000,'Mezan 3443 8694 or 3494 4100',NULL,NULL,2,0,15,1,5,0,10,NULL,NULL,'Cabinet','Standard triangular Voila tower with platform','Standoffs on platform','In town','Cyber-training center of George/Pierre in Hinche,.5 or 6 poles still at the tower location (?).','L\'Hermitage Pandiassou Hotel just outside of Hinche (call ahead)','-48 VDC (use 24 VDC converter)\r\n- 30db link to HILRE\r\n- 30db link to BAYCT\r\n- (3) 16db sectors\r\nThis is Hinche2. Contact for Hinche1 (up on the hill) is Ezai 3480 6791 or 3443 8292.'),(62,'Haut Piton','HTPTN',19.85938000000000,-72.75703000000000,'',NULL,NULL,8,0,15,1,6,0,10,9,NULL,'','','','','','',''),(63,'Jacmel (Jacmel 1)','JACML',18.19587643000000,-72.56950340000000,'Michelle Joseph Fosten 3110 9756',NULL,NULL,7,0,15,1,5,0,10,9,NULL,'','Small square tower inside a tiny enclosure with a small adjacent shelter. The tower is extremely crowded with existing antennas. Using a rope on this tower will be very challenging. May want to anchor on the far edge of the roof of the adjacent shelter.','Probably beam clamps on horizontal beams near the top of the tower on the East face. There are some partially free standoffs near the bottom of the tower, but these are probably not appropriate for our use.','In the Bellevue neighborhood past √áa Titi in Jacmel commune. About 1 hour on well maintained dirt roads from Jacmel town. Getting there requires fording the Grande Rivi√®re de Jacmel (up to 3 fordings) and the Petite Rivi√®re de Jacmel (1 fording), both just outside of town. If you are not sure which way to go, ask anyone which way to \"√áa Titi\". Do not attempt crossing during or immediately after rain. 4x4 required.','Minimal storage in crowded shelter','Hotels in Jacmel town. Book 2 weeks ahead for weekend days.','-48VDC and 110VAC currently available. Need to check if the 110VAC is on the main battery stack.'),(64,'Janvier','JANVI',18.96598000000000,-72.36761000000000,'Rosemonde 3632 9562',NULL,NULL,2,0,15,1,5,0,10,NULL,NULL,'Building','','','Rosemonde can be found the second left after the bridge if coming from the tower turnoff.','','',''),(98,'Lascahobas','LASCB',18.83600000000000,-71.93621000000000,'Evanel Isalem 3924 1843, 3699 6881, 3755 2791',NULL,NULL,10,0,15,1,5,0,10,NULL,NULL,'','Standard triangular Voila tower','Several existing standoffs','Steep, dirt and rock path. High clearance 4x4 required.','','Not available',''),(99,'La Vall√©e de Jacmel','LAVLE',18.26894900000000,-72.66705500000000,'',NULL,NULL,7,0,15,1,6,0,10,9,NULL,'','','','Undated note: did not visit as river was too high to cross at the time','','',''),(100,'L√©og√¢ne','LEOGN',18.51003056000000,-72.63198889000000,'Site contact: Wesley 3769 7334 Power technician: Dukens 3636 3761',NULL,NULL,1,0,15,6,6,0,10,9,NULL,'','','','','','',''),(101,'Bernard','BERNA',18.35269000000000,-72.58593000000000,'Denais 3443 8505',NULL,NULL,7,0,15,1,5,0,10,9,NULL,'Enclosure: combination lock 6-22-10','Standard triangular Voila tower with angle-iron construction and platform at top. The outer wall fell down in the earthquake and has no been replaced. The neighbors say that thieves are constantly visiting the site at night to attempt to steal things (diesel fuel perhaps?).','Lots of free standoffs on platform at top','Very short steep unpaved road off highway to Jacmel (towers clearly visible from the road). 4x4 recommended.','None','None',''),(120,'L\'Estere','LESTR',19.29971000000000,-72.61129000000000,'Jean-Baptiste 3473 3279',NULL,NULL,6,0,15,1,5,0,10,9,NULL,'','Very wide, tall, square tower with a platform. Like LESTR but much shorter.','Beam clamps in corners at platform height','In town','','','- 30db dish to HILRE\r\n- 25db dish to DESAL\r\n- Three sectors'),(121,'Liancourt','LIANC',19.12685000000000,-72.54398000000000,'Alfred 3443 8423. Alfred actually follows the rules, so call the Voila NOC in advance for authorization.',NULL,NULL,6,0,15,1,5,0,10,9,NULL,'','Nice large standard triangular tower with platform','Standoffs on platform','In town immediately on the main road','','','- use 24 VDC converter\r\n- 30db dish to HILRE\r\n- Three 16db sectors\"'),(122,'Limb√© 2','LIMB2',19.70446000000000,-72.40377000000000,'',NULL,NULL,8,0,15,1,6,0,10,9,NULL,'Enclosure','','','','','',''),(123,'Limb√© (Limb√© 1)','LIMBE',19.69095000000000,-72.33678000000000,'',NULL,NULL,8,0,15,1,6,0,10,9,NULL,'','','','','','',''),(124,'Marigot','MARIG',18.23565000000000,-72.30933000000000,'Fredo at 3443 8565.  Can also try Cristanne at 3443 8424 (not reached).',NULL,NULL,7,0,15,1,5,0,10,9,NULL,'','Standard triangular Voila tower of angle-irons with a top platform with standoffs','Free standoffs on platform','Short, steep, slightly overgrown road that leaves the main road at 18.23354,-72.31386. 4x4 required.','None','Possibly hotels in Marigot. Recommended hotel in Ti Mouillage is Hotel Kabic (3780 6850 - good Internet!). On weekends you may be stuck at the less comfortable but still clean Hotel l\'Amit√© (3888 9386).',''),(125,'Marmelade','MARML',19.49755000000000,-72.33580000000000,'Molijen Jula 3427 7773',NULL,NULL,8,0,15,1,6,0,10,9,NULL,'','','','The site is approximately 600m from the town of Marmelade. From the welcome statue, veer right up the steep road at 19.517253,-72.362393. You will pass first the Access Haiti tower, then the Digicel tower, then finally you will come to the Voila towers‚Äîa small triangular tower like Janvier, and a medium sized square tower, like Hilaire. The site has perhaps the best view of any site in Haiti. You can see Cap Ha√Øtien from the roof of the shelter, the central plateau, and even as far as Obleon.','','',''),(126,'Ma√Øssade','MASDE',19.17420618000000,-72.13999923000000,'',NULL,NULL,2,0,15,1,5,0,10,NULL,NULL,'','Standard triangular Voila tower with platform','Round standoffs on top platform','In town center','Save the Children','Save the Children guest house (5 minute drive)','- 30db link to HILRE\r\n- Two 17db sectors'),(127,'Mirebalais (Mirebalais 1)','MIBAL',18.83373323000000,-72.10544377000000,'\"SonSon\" Lucener 3469 1921',NULL,NULL,2,0,15,1,3,0,10,NULL,NULL,'Cabinet','','Beam clamps on 3 sides, using one existing standoff at very top of tower for 2 sectors','In town center','Limited storage at WorldVision office in Mirebalais','Mirage Hotel in main town square (convenient) or Wozo Hotel on the road toward Hinche (nice)','16-port H3C AC-powered switch installed\r\n - port 1 (vlan 11) MIBAL-CARML\r\n - port 2 (vlan 12) MIBAL-BOSIO\r\n - port 3 (vlan 13) MIBAL-SODO\r\n - port 4 (vlan 14) MIBAL-050\r\n - port 5 (vlan 14) MIBAL-170\r\n - port 6 (vlan 14) MIBAL-290\r\n - port 18 - trunk to Mikrotik\r\nStatus:\r\n- links to CARML (22db), BOSIO (25db), SODO (30db)\r\n- Three 16db sectors'),(128,'Obleon','OBLEO',18.43875000000000,-72.29069000000000,'Enoch 3441 0218',NULL,NULL,9,0,15,1,3,0,10,9,NULL,'','2 towers on site, one triangular tower with 2-3\" rounds and one new octagonal tower. We are using the old, flimsy triangular tower. There are foot pegs on the outside on one side of the tower.','Direct mounting on the tower rounds. Could use custom standoffs or U-bolts, but the tower is not compatible with beam clamps.','Steep paved road, 1 hour from Petionville. Take the road toward Furcy past Kenscoff and turn right at the first paved road after the Petit Freres et Soeurs sign (on the left). Follow this road until you reach the towers.','On site storage room next to main equipment room','','110VAC via -48v inverter for our use\r\n16-port AC-powered switch installed\r\nport1 - OBLEO-BOUTL\r\nport2 - OBLEO-HILRE \r\nport3 - OBLEO-JACML\r\nport4 - OBLEO-BELVU\r\nport5 - OBLEO-CBRIT'),(129,'Pignon','PIGNO',19.33504552000000,-72.11776798000000,'',NULL,NULL,2,0,15,1,5,0,10,NULL,NULL,'','Standard triangular Voila tower with platform','Round standoffs on top platform','In town center','Haiti Outreach','Haiti Outreach guest house','-48 VDC in cabinet (use 24 VDC/VDC converter)\r\n- 30db link to HILRE\r\n- Three 16db sectors'),(130,'Pilate','PILAT',19.66710000000000,-72.55308000000000,'Junior 3443 8896',NULL,NULL,8,0,15,1,6,0,10,9,NULL,'','','','The town of Pilate is accessible via a bumpy mud and rock road, 45 minutes from Gros Morne, and 1 hour from Plaissance. The site is in the main paved square of Pilate. The tower is a large triangular tower with upper platform. The grounding plate at the base of the tower is quite high off the ground, but otherwise the site is straightforward. The guard lives diagonally across the main square from the tower in the house with the large red gate.','','',''),(161,'Petite Rivi√®re de l\'Artibonite','PRIVA',19.12251000000000,-72.48166000000000,'Ask Jeffrey Carr√© (Transversal) for contact info.',NULL,NULL,6,0,15,1,5,0,10,9,NULL,'','Wide but short square tower with a platform. Like LESTR but much shorter.','Beam clamps in corners at platform height','In town','','',''),(162,'Pont Sond√©','PSOND',19.14786000000000,-72.61349000000000,'Eval 3443 8323',NULL,NULL,6,0,15,1,5,0,10,9,NULL,'','Standard triangular Voila tower with platform','Standoffs on platform','In town near the soccer field','','','-48 VDC (use 24 VDC converter)\r\nEquipment:\r\n- 30db dish to HILRE\r\n - Three 16db sectors\r\nOther:\r\nother:\r\n - 1.5\"\" EMT bars stored on site\r\n - Watch out for the killer bees.'),(163,'Saut d\'Eau','SODO',18.82249378000000,-72.21422652000000,'Jiva 3443 8552',NULL,NULL,2,0,15,1,5,0,10,NULL,NULL,'','Standard triangular Voila tower with platform','Existing standoffs','Take the well-maintained gravel road from town towards the waterfalls and turn right once you are at the same height as the tower.','','Have not tried the $25/night hotel across from the police station.','-48 VDC (use 24 VDC converter)\r\n- 30db link to MIBAL\r\n- Two sectors'),(164,'Saint Marc (St Marc xp)','STMRC',19.08776000000000,-72.70772000000000,'',NULL,NULL,6,0,15,1,3,0,10,9,NULL,'','Not a tower, but the roof of a Voila shelter that had a tower on it. Excellent 270 degree view of Saint Marc bay.','Tripod mounted on roof with a 5\' bar','Just above town. access from just north of La Colline hotel.','On-site storage','Le Gou-T hotel on the north end of town','110VAC via dedicated -48v inverter\r\n- put in a full 10\' bar to raise the antennas higher.\r\n- 30db dish to HILRE-270\r\n- One 17db sector'),(165,'Verrettes','VERET',19.05240000000000,-72.46626000000000,'David 3737 8608',NULL,NULL,6,0,15,1,5,0,10,9,NULL,'','Very short square tower with a large tree growing into the tower on the west side','Beam clamps at the top of the tower','In town','','','-48 VDC (use 24 VDC converter)\r\n- Poor signal\r\n- 30db dish to HILRE\r\n- Three 16db sectors'),(166,'Verjon','VERJN',18.26347976000000,-72.43249369000000,'',NULL,NULL,7,0,15,1,6,0,10,9,NULL,'','','','\"From the main east-west road, turn north on Route des Orangiers (immediately west of the airport), turn right at the \"\"T\"\", then fork right at the Station des Orangiers (18.2558,-72.508126). It is then about 11km to the turn off. The first part of the road after the fork is partially paved and generally a good road, but extremely steep. The last part of the road is a short overgrown dirt track which becomes very steep for the last 200m.\r\nSee: http://www.openstreetmap.org/?lat=18.2557&lon=-72.4765&zoom=14&layers=M\r\nPossible (unverified) option 2 is to turn north at 18.2558,-72.508126 at Ravine Meyer.\r\n4x4 required (with working low-4). Do not try to go via Cayes Jacmel. Even though marked as a proper road on some maps, this road becomes a shoulder-width footpath several km from the tower.\"','','',''),(167,'Verti√®res','VERTI',19.72233000000000,-72.22208000000000,'',NULL,NULL,8,0,15,1,6,0,10,9,NULL,'','','','','','',''),(169,'Foo','FOO',19.85948000000000,-72.75713000000000,'',2,NULL,1,0,22,1,3,0,10,NULL,NULL,'','','','','','','');
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
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tower_owners`
--

LOCK TABLES `tower_owners` WRITE;
/*!40000 ALTER TABLE `tower_owners` DISABLE KEYS */;
INSERT INTO `tower_owners` VALUES (1,'Voila'),(2,'Multilink'),(4,'Haicom'),(6,'Access Haiti'),(9,'World Food Program'),(10,'Digicel');
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
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','157f42bf0d97ffa44c078474279fcbe4f54c3409','1','2012-07-18 20:09:51','2012-07-20 00:25:41'),(6,'viewer','42dc9660acb159c06bd94254705bedf76ac60fd8','2','2012-09-12 22:24:04','2012-09-12 22:24:04'),(3,'sue','ae1a12b6e634352e2a52bdc721da548b713f6cbb','2','2012-07-18 21:56:14','2012-07-18 21:56:14'),(7,'editor','ac2fddad48c843854c8faa5db800593543e4912c','11','2012-09-12 22:24:17','2012-09-12 22:24:17'),(8,'abjornson','d723527d3b223f111590647e6b1cee7464e4a340','1','2012-09-14 14:43:59','2012-09-14 14:43:59'),(10,'sperales','1a01dc897a910650f482568dc8131381f9ed8606','1','2012-09-17 10:34:08','2012-09-17 10:34:08');
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

-- Dump completed on 2012-09-19 11:37:16
