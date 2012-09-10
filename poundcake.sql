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
  `type` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES (1,'Clark','Ritchie','+1 (503) 936-2575','clarkritchie','critchie@inveneo.org',1,0),(2,'Andris','Bjornson','+1 (415) 205-7802','andris.bjornson','abjornson@inveneo.org',4,1),(3,'Jen','Overgaag','+1 (805) 440-9423','wyojeno','jovergaag@inveneo.org',1,1);
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
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (8,'\0\0\0\0\0\0\0\'ƒ£äÕÙ2@¼W­LòQÀ'),(2,'\0\0\0\0\0\0\0Ø\rÛe3@‰ïÄ¬RÀ'),(12,'\0\0\0\0\0\0\0#ðk$]2@uå³<:RÀ'),(13,'\0\0\0\0\0\0\0·]ªÊë2@Ž˜“;	RÀ'),(15,'\0\0\0\0\0\0\0ébg\nõ2@$EdXÅRÀ'),(16,'\0\0\0\0\0\0\0°çŒ(í2@Ð³Yõ¹\"RÀ'),(17,'\0\0\0\0\0\0\0`Í‚9Z2@ÄZ|\n€%RÀ'),(18,'\0\0\0\0\0\0\0›8¹ß¡¸3@\nô‰<IRÀ'),(19,'\0\0\0\0\0\0\0…w¹ˆï´3@²ºÕRÀ'),(20,'\0\0\0\0\0\0\0¼è+H33@`ºò-RÀ'),(21,'\0\0\0\0\0\0\0\n¿ÔÏ›B3@ÉYØÓ!RÀ'),(22,'\0\0\0\0\0\0\0v28J^M3@É<ò\'RÀ'),(23,'\0\0\0\0\0\0\0m±&3@¥Ú§ã1\'RÀ'),(24,'\0\0\0\0\0\0\0â’ãNé 3@eßÁÿ\"RÀ'),(25,'\0\0\0\0\0\0\0È$#ga3@4ºƒØ™RÀ'),(26,'\0\0\0\0\0\0\0Zd;ßO\r3@ýjÌRÀ'),(27,'\0\0\0\0\0\0\0Í’\05µ,3@\np	RÀ'),(28,'\0\0\0\0\0\0\0<1ëÅPV3@HÄ”H¢RÀ'),(29,'\0\0\0\0\0\0\0°þÏa¾Ô2@Èïmú³ûQÀ'),(30,'\0\0\0\0\0\0\0ÔÔ²µæ2@{Ic´ŽöQÀ'),(31,'\0\0\0\0\0\0\05˜†á#ª3@3ùf›#RÀ'),(32,'\0\0\0\0\0\0\0¾Mö#%3@®Gáz\0RÀ'),(33,'\0\0\0\0\0\0\0Hmâä~3@!v¦ÐyRÀ'),(34,'\0\0\0\0\0\0\0ª&ˆºç2@;ßO—RÀ'),(35,'\0\0\0\0\0\0\0Àx\rýë2@ð§ÆK7	RÀ'),(36,'\0\0\0\0\0\0\0^h®ÓHÓ2@{Úá¯ÉRÀ'),(37,'\0\0\0\0\0\0\0fffff3@w„Ó‚RÀ'),(38,'\0\0\0\0\0\0\0´Žª&ˆ*3@,+MJARÀ'),(39,'\0\0\0\0\0\0\0¿eN—ÅD2@»aÛ¢*RÀ'),(40,'\0\0\0\0\0\0\0ëÅPN´;2@œá|~RÀ'),(41,'\0\0\0\0\0\0\0´«ò“Š2@×ú\"¡-%RÀ'),(42,'\0\0\0\0\0\0\0¸Ìé²˜p2@´å\\Š«RÀ');
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
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `network_radios`
--

LOCK TABLES `network_radios` WRITE;
/*!40000 ALTER TABLE `network_radios` DISABLE KEYS */;
INSERT INTO `network_radios` VALUES (9,'BAYCT-BELDR',2),(11,'BAYCT-CBRIT',2),(12,'BAYCT-HINCH',2),(13,'BELDR-BAYCT',8),(14,'BELVU-BARO',12),(15,'BELVU-BERNA',12),(16,'BELVU-BRACH',12),(17,'BELVU-GGOAV',12),(18,'BELVU-OBLEO',12),(19,'BCARE-BOSIO',13),(20,'BAYCT-020',2),(21,'BAYCT-140',2);
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
-- Table structure for table `road_types`
--

DROP TABLE IF EXISTS `road_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `road_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `road_types`
--

LOCK TABLES `road_types` WRITE;
/*!40000 ALTER TABLE `road_types` DISABLE KEYS */;
INSERT INTO `road_types` VALUES (1,'Unpaved, Poor'),(2,'Unpaved, Fair'),(3,'Unpaved, Good'),(4,'Paved, Poor'),(5,'Paved, Fair'),(6,'Paved, Good'),(7,'Road?  LOLs');
/*!40000 ALTER TABLE `road_types` ENABLE KEYS */;
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
INSERT INTO `roles` VALUES (1,'admin','admin'),(2,'View Only User','view'),(3,'Inveneo','edit'),(4,'Kicheko','edit'),(5,'Creative Associates','edit'),(6,'TZ MoE','edit'),(7,'UhuruOne','edit'),(8,'Zantel','edit'),(9,'Agile Learning','edit'),(10,'IYF','edit');
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
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_states`
--

LOCK TABLES `site_states` WRITE;
/*!40000 ALTER TABLE `site_states` DISABLE KEYS */;
INSERT INTO `site_states` VALUES (1,'Install Need Identified'),(2,'Prerequisites Verified'),(3,'ISP Installation Complete'),(4,'Work Order Created'),(5,'Installation Scheduled/Team Assigned'),(6,'Team Pulls Equipment from Regional Hub'),(7,'Install in Progress'),(8,'Install Complete'),(9,'Spot-check by Inveneo'),(10,'School Accepted'),(11,'Site Complete'),(12,'Open Support Issue'),(13,'Third Tier Support From ICT IPs');
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
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
INSERT INTO `sites` VALUES (2,'Baycite','BAYCT',19.05623000000000,-72.01707000000000,NULL,NULL,2,1,1,1,6,1,10,NULL,'Transversal installed weather-tight enclosure for Inveneo router-switch board March 2012. Was cabinet.','Standard triangular Voila tower. Platform?','Beam clamps','Steep, rough dirt road. High clearance 4x4 required. Key no longer needed for access to Inveneo equipment on site.','Cyber-training center of George/Pierre in Hinche','L\'Hermitage Pandiassou hotel just outside of Hinche (call ahead)','(Old notes - done?) Need to move CBRIT dish to other side of tower. When you are up there, switch HINCH radio to sta to get a link up'),(12,'Bellevue','BELVU',18.36383700000000,-72.90718000000000,NULL,NULL,9,1,1,1,2,1,10,NULL,'','','','','','',''),(8,'Belladere','BELDR',18.85092000000000,-71.78593000000000,NULL,NULL,2,1,1,1,6,1,12,NULL,'','','','','','',''),(13,'Boucan CarrÃ©','BCARE',18.92106118000000,-72.14426114000000,NULL,NULL,2,1,1,1,6,1,11,NULL,'','','','','','',''),(15,'','HDC225',18.95719000000000,-72.37142000000000,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,'','DELPECHE',18.92640000000000,-72.54260000000000,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,'','HDS007',18.35244000000000,-72.58594000000000,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,'','HDN008',19.72122000000000,-72.22322000000000,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,'','HDN208',19.70678000000000,-72.40367000000000,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,'','HDC004',19.08672000000000,-72.71794000000000,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,'','HDC260',19.26019000000000,-72.51653000000000,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,'','HDC274',19.30222000000000,-72.60956000000000,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,'','HDC263',19.15114000000000,-72.61242000000000,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,'','HDC264',19.12856000000000,-72.54686000000000,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,'','HDC280',19.12258000000000,-72.47814000000000,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,'','HDC267',19.05200000000000,-72.46558000000000,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(27,'','HDC220',19.17464000000000,-72.14114000000000,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(28,'','HDN216',19.33717000000000,-72.11928000000000,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(29,'','HDC203',18.83103000000000,-71.93286000000000,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(30,'','HDC318',18.90121000000000,-71.85246000000000,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(31,'','HDN210',19.66461000000000,-72.54856000000000,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(32,'','HDC200',19.14508000000000,-72.00750000000000,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(33,'','SDH009',19.49803000000000,-72.33556000000000,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(34,'','HDC212',18.90519000000000,-72.07175000000000,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(35,'','HDC230',18.92183000000000,-72.14400000000000,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(36,'','HDC201',18.82533000000000,-72.10606000000000,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(37,'','SDH017',19.05625000000000,-72.01706000000000,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(38,'','SDH010',19.16614000000000,-72.36336000000000,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(39,'','HDS300',18.26864000000000,-72.66619000000000,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(40,'','HDS017',18.23322000000000,-72.38272000000000,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(41,'','HDO386',18.54132000000000,-72.58091000000000,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(42,'','SDH011',18.43983000000000,-72.29172000000000,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
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
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zones`
--

LOCK TABLES `zones` WRITE;
/*!40000 ALTER TABLE `zones` DISABLE KEYS */;
INSERT INTO `zones` VALUES (1,'Zone 1'),(2,'Zone 2'),(6,'Zone 3'),(7,'Zone 4'),(8,'Zone 5'),(9,'Zone 0');
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

-- Dump completed on 2012-09-10 16:46:22
