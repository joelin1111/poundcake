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
-- Table structure for table `areas`
--

DROP TABLE IF EXISTS `areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `areas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `catchment_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `areas`
--

LOCK TABLES `areas` WRITE;
/*!40000 ALTER TABLE `areas` DISABLE KEYS */;
INSERT INTO `areas` VALUES (1,'Unguja',1),(2,'Pemba',1),(3,'Mtwara',2);
/*!40000 ALTER TABLE `areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catchments`
--

DROP TABLE IF EXISTS `catchments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catchments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catchments`
--

LOCK TABLES `catchments` WRITE;
/*!40000 ALTER TABLE `catchments` DISABLE KEYS */;
INSERT INTO `catchments` VALUES (1,'Zanzibar'),(2,'Mtwara');
/*!40000 ALTER TABLE `catchments` ENABLE KEYS */;
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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connectivity_types`
--

LOCK TABLES `connectivity_types` WRITE;
/*!40000 ALTER TABLE `connectivity_types` DISABLE KEYS */;
INSERT INTO `connectivity_types` VALUES (1,'Vsat'),(2,'GSM'),(3,'P2P Wireless'),(4,'CDMA ');
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
  `trc_id` int(10) DEFAULT NULL,
  `school_id` int(10) DEFAULT NULL,
  `district_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES (1,'Clark','Ritchie','+1 (503) 936-2575','clarkritchie','critchie.org',5,4,NULL),(2,'Andris','Bjornson','+1 (415) 205-7802','andris.bjornson','abjornson.org',2,1,NULL),(3,'Jen','Overgaag','+1 (805) 440-9423','wyojeno','jovergaag.org',2,5,NULL);
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `districts`
--

DROP TABLE IF EXISTS `districts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `districts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `area_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `districts`
--

LOCK TABLES `districts` WRITE;
/*!40000 ALTER TABLE `districts` DISABLE KEYS */;
INSERT INTO `districts` VALUES (1,'Central',1),(2,'North A',1),(3,'North B',1),(4,'Chake Chake',2),(5,'Wete',2),(6,'Micheweni',2),(7,'Mkoani',2),(8,'South',1),(9,'West',1),(10,'Urban',1),(11,'Newala',3),(12,'Masasi',3),(13,'Tandahimba',3),(14,'Mtwara MC',3),(15,'Mtwara DC',3),(16,'Nanyumbu',3);
/*!40000 ALTER TABLE `districts` ENABLE KEYS */;
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
-- Table structure for table `installation_types`
--

DROP TABLE IF EXISTS `installation_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `installation_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `installation_types`
--

LOCK TABLES `installation_types` WRITE;
/*!40000 ALTER TABLE `installation_types` DISABLE KEYS */;
INSERT INTO `installation_types` VALUES (1,'Bridge IT (B)'),(2,'EMIS Only (E)'),(3,'Mobile Lab (M)'),(4,'Unknown (Bp)'),(5,'Desktop Lab (?)'),(6,'District Office (?)'),(7,'Regional Office (?)');
/*!40000 ALTER TABLE `installation_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `installationtypes`
--

DROP TABLE IF EXISTS `installationtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `installationtypes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `installationtypes`
--

LOCK TABLES `installationtypes` WRITE;
/*!40000 ALTER TABLE `installationtypes` DISABLE KEYS */;
INSERT INTO `installationtypes` VALUES (1,'B - Bridge IT'),(2,'E- EMIS Only'),(3,'M - Mobile Lab'),(4,'Bp - Unknown'),(5,'?? - Desktop Lab'),(6,'?? - District Office'),(7,'?? - Regional Office');
/*!40000 ALTER TABLE `installationtypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `installtypes`
--

DROP TABLE IF EXISTS `installtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `installtypes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `installtypes`
--

LOCK TABLES `installtypes` WRITE;
/*!40000 ALTER TABLE `installtypes` DISABLE KEYS */;
INSERT INTO `installtypes` VALUES (1,'B - Bridge IT'),(2,'E- EMIS Only'),(3,'M - Mobile Lab'),(4,'Bp - Uknown'),(5,'?? - Desktop Lab'),(6,'?? - District Office'),(7,'?? - Regional Office');
/*!40000 ALTER TABLE `installtypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `intervention_types`
--

DROP TABLE IF EXISTS `intervention_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `intervention_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `intervention_types`
--

LOCK TABLES `intervention_types` WRITE;
/*!40000 ALTER TABLE `intervention_types` DISABLE KEYS */;
INSERT INTO `intervention_types` VALUES (1,'Bridge IT (B)'),(2,'EMIS Only (E)'),(3,'Mobile Lab (M)'),(4,'Unknown (Bp)'),(5,'Desktop Lab (?)'),(6,'District Office (?)'),(7,'Regional Office (?)');
/*!40000 ALTER TABLE `intervention_types` ENABLE KEYS */;
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
-- Table structure for table `power_types`
--

DROP TABLE IF EXISTS `power_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `power_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `power_types`
--

LOCK TABLES `power_types` WRITE;
/*!40000 ALTER TABLE `power_types` DISABLE KEYS */;
INSERT INTO `power_types` VALUES (1,'Grid'),(2,'Solar');
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
-- Table structure for table `schools`
--

DROP TABLE IF EXISTS `schools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schools` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catchment_id` int(10) NOT NULL,
  `area_id` int(10) NOT NULL,
  `district_id` int(10) NOT NULL,
  `school_name` varchar(50) NOT NULL,
  `school_code` varchar(10) NOT NULL,
  `status` varchar(2) DEFAULT NULL,
  `trc_id` int(10) NOT NULL,
  `intervention_type_id` int(10) NOT NULL,
  `location` point DEFAULT NULL,
  `power_type_id` int(10) NOT NULL,
  `connectivity_type_id` int(10) NOT NULL,
  `warning` varchar(2) DEFAULT NULL,
  `install_date` datetime DEFAULT NULL,
  `access_instruction` text,
  `site_state_id` int(10) NOT NULL,
  `service_provider_id` int(10) NOT NULL,
  `road_type_id` int(10) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=867 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schools`
--

LOCK TABLES `schools` WRITE;
/*!40000 ALTER TABLE `schools` DISABLE KEYS */;
INSERT INTO `schools` VALUES (1,1,1,8,'Kikadini','SK/MS/208','',7,2,'\0\0\0\0\0\0\06Â\nÔrQ¿.9Óî∆C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(2,1,1,8,'Jambiani','SK/MS/206','',7,2,'\0\0\0\0\0\0\0Îsµ˚K¿Æÿ_vO∆C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(3,1,1,8,'Kiongoni','SK/MS/56','',7,2,'\0\0\0\0\0\0\0I◊LæŸ¶¿Òùòı∆C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(4,1,1,1,'Charawe','SK/MS/44','',7,1,'\0\0\0\0\0\0\0‚ÃØÊ\0¡¿∆¢ÈÏd∏C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(5,1,1,8,'Paje','SK/MSS/05','',7,2,'\0\0\0\0\0\0\0êN]˘,¿@xÓ=ƒC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(6,1,1,1,'Michamvi','SK/MS/45','',7,3,'\0\0\0\0\0\0\0Ü8÷≈mî¿ïö=–\n¿C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(7,1,1,8,'Kusini','SK/MS/57','',7,2,'\0\0\0\0\0\0\0QN¥´ê≤¿4¢¥7¯∆C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(8,1,1,1,'Pete','SK/MS/107','',7,2,'\0\0\0\0\0\0\0¸„Ωje\"¿ke¬/ı≥C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(9,1,1,8,'Kizimkazi Dimbani','SK/MSK/106','',7,2,'\0\0\0\0\0\0\0»T∆øœ¿ø}8gºC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(10,1,1,1,'Unguja Ukuu','SK/MS/210','',7,2,'\0\0\0\0\0\0\0H3Mg\'¿≥µæHhØC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(11,1,1,1,'Kikungwi','SK/MS/157','',7,2,'\0\0\0\0\0\0\0FB[Œ•¿˘NÃz1¨C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(12,1,1,8,'Miwaleni','SK/MMSK/01','',7,2,'\0\0\0\0\0\0\0Zÿ”≠¿D› µ≈C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(13,1,1,8,'Kitogani','SK/MMS/02','',7,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(14,1,1,1,'Bungi','SK/MS/177','',7,2,'\0\0\0\0\0\0\0u∞˛œa˛¿ò˙ySë™C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(15,1,1,8,'Muungoni','SK/MS/139','',7,2,'\0\0\0\0\0\0\0Æûìﬁ7>¿…væü\Z∑C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(16,1,1,8,'Bwejuu','SK/MSK/70','',7,2,'\0\0\0\0\0\0\0’[[%¯¿Nˆ#EƒC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(17,1,1,8,'Kibuteni','SK/MS/74','',7,2,'\0\0\0\0\0\0\0œNG…´¿sùFZ*øC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(18,1,1,1,'Uzi','SK/MSK/50','',7,2,'\0\0\0\0\0\0\0ﬁT§¬X¿Ú$Èö…≥C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(19,1,1,8,'Kajengwa','SK/MS/55','',7,2,'\0\0\0\0\0\0\0B>ËŸ¨ö¿ “o_∆C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(20,1,1,8,'Mtende','SK/MSK/73','',7,2,'\0\0\0\0\0\0\0[îŸ ìÃ¿—Ëb√C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(21,1,1,8,'Muyuni','SK/MSK/75','',7,2,'\0\0\0\0\0\0\0-œÉª≥v¿—\"€˘~∫C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(22,1,1,8,'Kizimkazi','SK/MSK/74','',7,2,'\0\0\0\0\0\0\0»T∆øœ¿ø}8gºC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(23,1,1,1,'Ukongoroni','SK/MSK/79','',7,2,'\0\0\0\0\0\0\09\n–¿·Ó¨›vΩC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(24,1,1,1,'Bambi','SK/MSK/54','',1,2,'\0\0\0\0\0\0\0›µÑ|–S¿„«òªñ¨C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(25,1,1,1,'Cheju','SK/MSK/122','',1,2,'\0\0\0\0\0\0\0∏‰∏S:ÿ¿7¶\',Ò∞C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(26,1,1,1,'Chwaka','SK/MSK/52','',1,2,'\0\0\0\0\0\0\0”ﬁ‡ì©¿ÄöZ∂÷∑C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(27,1,1,1,'Dunga','SK/MS/194','',1,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(28,1,1,1,'Ghana','SK/MS/99','',1,2,'\0\0\0\0\0\0\0Íï≤q,¿fΩ â¶C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(29,1,1,1,'Kidimni','SK/MS/171','',1,2,'\0\0\0\0\0\0\0ªÚYûw¿Çê,`ßC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(30,1,1,1,'Mwera','SK/MS/128','',1,2,'\0\0\0\0\0\0\0lï`q8ì¿¬£ç#÷¢C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(31,1,1,9,'Regezamwendo','SK/MS/204','',1,3,'\0\0\0\0\0\0\0~:3Pô¿b°÷4Ô†C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(32,1,1,1,'Umbuji','SK/MS/43','',1,2,'\0\0\0\0\0\0\0~:3Py¿ùFZ*oØC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(33,1,1,1,'Ndijani','SK/MS/95','',1,2,'\0\0\0\0\0\0\0K‘‘≤µ¿ˇ[…éç¨C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(34,1,1,1,'Ndijani Mseweni','SK/MMS/07','',1,2,'\0\0\0\0\0\0\0m®Áo¬¿+á≠C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(35,1,1,1,'Uroa','SK/MS/188','',1,2,'\0\0\0\0\0\0\0≠4)›^¿ï‘	h∂C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(36,1,1,1,'Jendele','SK/MS/42','',1,2,'\0\0\0\0\0\0\0IÙ2äÂ∂¿è™&à∫ØC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(37,1,1,1,'Mchangani','SK/MS/76','',1,2,'\0\0\0\0\0\0\0?5^∫I,¿…»Yÿ”™C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(38,1,1,1,'Marumbi','SK/MS/140','',1,1,'\0\0\0\0\0\0\0¬&SÉ¿‡æú3∂C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(39,1,1,1,'Machui','SK/MS/105','',1,2,'\0\0\0\0\0\0\0ù∫ÚYûg¿£@ü»ì§C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(40,1,1,1,'Ubago','SK/MS/77','',1,2,'\0\0\0\0\0\0\0ªÚYûw¿Çê,`ßC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(41,1,1,1,'Kiboje','SK/MS/207','',1,2,'\0\0\0\0\0\0\0lï`q8S¿ºË+HßC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(42,1,1,1,'Tunguu','SK/MS/111','',1,2,'\0\0\0\0\0\0\0uöæ¿ÁêΩﬁ©C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(43,1,1,1,'Kibele','SK/MSK/49','',1,2,'\0\0\0\0\0\0\0B≤Äâ¿\np©C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(44,1,1,1,'Uzini','SK/MS/85','',1,2,'\0\0\0\0\0\0\0D£;àùI¿†7©0™C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(45,1,1,1,'Pagali','SK/MS/154','',1,3,'\0\0\0\0\0\0\0?W[±øl¿∆¢ÈÏd¨C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(46,1,1,1,'Miwani','SK/MS/153','',1,2,'\0\0\0\0\0\0\0≤∫’S¿àKé;•£C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(47,1,1,1,'Pongwe Mwera','SK/MS/147','',1,2,'\0\0\0\0\0\0\0€ä˝e˜§¿‘öÊß§C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(48,1,1,1,'Pongwe Pwani','SK/MMSK/02','',1,1,'\0\0\0\0\0\0\0í\\˛C˙-¿è‰Ú“≥C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(49,1,1,1,'Jumbi','SK/MS/143','',1,2,'\0\0\0\0\0\0\0~8gD…¿Wˇ[…¶C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(50,1,1,9,'Bububu \'a\'','SK/MSK/59','',8,2,'\0\0\0\0\0\0\0x—Wêfl¿π•’ê∏õC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(51,1,1,9,'Bububu \'b\'','SK/MS/104','',8,2,'\0\0\0\0\0\0\0x—Wêfl¿π•’ê∏õC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(52,1,1,3,'Bumbwini','SK/MSK/10','',8,2,'\0\0\0\0\0\0\06Í!\Z›·¿Ö%P6ôC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(53,1,1,10,'Chumbuni','SK/MS/49','',8,2,'\0\0\0\0\0\0\03·ó˙yì¿á3øöõC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(54,1,1,10,'Darajani','SK/MS/15','',8,3,'\0\0\0\0\0\0\0Ú{õ˛Ïß¿çB≤òC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(55,1,1,9,'Dole','SK/MMS/01','',8,3,'\0\0\0\0\0\0\0Ï/ª\'k¿b°÷4Ô†C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(56,1,1,10,'Kajificheni','SK/MS/10','',8,2,'\0\0\0\0\0\0\0.9(a¶¿x¥qƒZòC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(57,1,1,9,'Kibweni','SK/MS/205','',8,2,'\0\0\0\0\0\0\0?∆‹u¿0ª\'ùC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(58,1,1,9,'Kidichi','SK/MS/202','',8,2,'\0\0\0\0\0\0\0™πn`¿“o_ŒùC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(59,1,1,10,'Kilimahewa \'a\'','SK/MS/48','',8,2,'\0\0\0\0\0\0\0á3øö§¿Íï≤qúC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(60,1,1,10,'Kilimahewa \'b\'','SK/MS/152','',8,2,'\0\0\0\0\0\0\0á3øö§¿Íï≤qúC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(61,1,1,9,'Kizimbani','SK/MS/218','',8,2,'\0\0\0\0\0\0\0+¡‚pÊW¿Ö_ÍÁM°C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(62,1,1,10,'Makadara (Makadala)','SK/MS/167','',8,3,'\0\0\0\0\0\0\0ﬁépZ¢¿üÂypwöC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(63,1,1,3,'Makoba','SK/MS/2','',8,2,'\0\0\0\0\0\0\0m≈˛≤{“¿F|\'fΩòC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(64,1,1,3,'Mangapwani','SK/MS/186','',8,2,'\0\0\0\0\0\0\06´>W[Ò¿(\nÙâ<ôC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(65,1,1,9,'Mtoni Kidatu','SK/MS/187','',8,2,'\0\0\0\0\0\0\0ÓÎ¿9#ä¿ˇ>„¬ùC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(66,1,1,9,'Mtopepo \'a\'','SK/MSK/86','',8,2,'\0\0\0\0\0\0\0J“5ìoñ¿ø`7l[úC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(67,1,1,9,'Mtopepo \'b\'','SK/MS/92','',8,1,'\0\0\0\0\0\0\0†7©0ñ¿éHúC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(68,1,1,10,'Rahaleo','SK/MS/19','',8,2,'\0\0\0\0\0\0\0ÒK˝º©®¿N^ÙôC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(69,1,1,10,'Shaurimoyo','SK/MS/18','',8,2,'\0\0\0\0\0\0\0T„•õƒ†¿:íÀHõC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(70,1,1,9,'Welezo','SK/MS/190','',8,2,'\0\0\0\0\0\0\0Åx]ø†¿/˙\n“åùC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(71,1,1,9,'Mwachealale','SK/MS/176','',8,3,'\0\0\0\0\0\0\0¯•~ﬁT$¿}yˆ—°C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(72,1,1,9,'Chuini','SK/MS/69','',8,2,'\0\0\0\0\0\0\0L7âA`E¿cŸ=yúC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(73,1,1,3,'Fujoni','SK/MSK/78','',8,2,'\0\0\0\0\0\0\0Œ¬ûv¯¿ˆb(\'⁄ôC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(74,1,1,9,'Kama','SK/MS/170','',8,1,'\0\0\0\0\0\0\0…&0¿#€˘~júC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(75,1,1,3,'Kiyongwe','SK/MSK/114','',8,2,'\0\0\0\0\0\0\0„«òªñ∞¿0ÿ\r€ôC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(76,1,1,9,'Langoni','SK/MSK/62','',8,2,'\0\0\0\0\0\0\0˘È∑Øc¿«K7âA†C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(77,1,1,9,'Mbuzini','SK/MSK/101','',8,2,'\0\0\0\0\0\0\0°JÕH¿>\"¶DûC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(78,1,1,9,'Mtoni Kigomeni','SK/MS/102','',8,1,'\0\0\0\0\0\0\0˛∑íÅ¿y@Ÿî+úC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(79,1,1,9,'Mwenge','SK/MS/078','',8,1,'\0\0\0\0\0\0\0Îêõ·<¿õ˛ÏGä†C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(80,1,1,10,'Mwembemakumbi','SK/MS/04','',8,3,'\0\0\0\0\0\0\0ºW≠Lò¿%;6ÒöC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(81,1,1,9,'Kianga','SK/MS/97','',8,2,'\0\0\0\0\0\0\0z≈rKã¿øeNó≈†C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(82,1,1,9,'Mfenesini','SK/MSK/63','',8,2,'\0\0\0\0\0\0\0Ï›ÔU+¿≈ ¶\\ùC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(83,1,1,2,'Nungwi','SK/MSK/07','',2,2,'\0\0\0\0\0\0\0|’ Ñ_Í¿(∏XQÉ•C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(84,1,1,2,'Kilindi','SK/MSK/124','',2,2,'\0\0\0\0\0\0\0J{É/L¿S\"â^¶C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(85,1,1,2,'Kigunda','SK/MS/146','',2,2,'\0\0\0\0\0\0\0?:uÂ≥¿|∏‰∏S¶C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(86,1,1,2,'Kidoti','SK/MSK/6','',2,1,'\0\0\0\0\0\0\0C9—ÆB*¿¥é™&à¶C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(87,1,1,2,'Fukuchani ','SK/MS/61','',2,2,'\0\0\0\0\0\0\0∑]hÆ”H¿7TåÛ7•C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(88,1,1,2,'Potoa','SK/MSK/5','',2,2,'\0\0\0\0\0\0\00/¿>:u¿Î9È}„£C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(89,1,1,2,'Mkwajuni ','SK/MS/47','',2,2,'\0\0\0\0\0\0\0ùÙæÒµá¿¯ﬂJvl§C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(90,1,1,2,'Mkokotoni','SK/MS/149','',2,2,'\0\0\0\0\0\0\0s∫,&6¿0ûACˇ†C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(91,1,1,2,'Pale Msingi','SM/MSK/2','',2,2,'\0\0\0\0\0\0\0Ôrﬂâô¿¿	Ö8†C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(92,1,1,2,'Jongowe ','SK/MS/159','',2,2,'\0\0\0\0\0\0\0Ø_∞∂m¿áø&k‘õC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(93,1,1,2,'Tumbatu ','SK/MS/162','',2,2,'\0\0\0\0\0\0\0Ÿ%™∑V¿ßëñ €ùC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(94,1,1,2,'Kibeni','SK/MS/148','',2,2,'\0\0\0\0\0\0\0ç]¢zkÄ¿˛HV•C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(95,1,1,2,'Kibuyuni','SK/MS/72','',2,2,'\0\0\0\0\0\0\0<ÉÜ˛	é¿ä}\"O¶C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(96,1,1,2,'Kijini','SK/MSK/81','',2,1,'\0\0\0\0\0\0\0]˘,œÉ[¿uYLl>™C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(97,1,1,2,'Mbuyu Tende','SK/MS/232','',2,2,'\0\0\0\0\0\0\0?„¬ÅêL¿õ˛ÏGä¨C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(98,1,1,2,'Mfuru Matonga','SK/MS/144','',2,2,'\0\0\0\0\0\0\0Ω„…Ö¿ÙlV}Æ™C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(99,1,1,2,'Matemwe','SK/MSK/09','',2,1,'\0\0\0\0\0\0\0T5A‘}Ä¿æŸÊ∆Ù¨C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(100,1,1,2,'Kigomani','SK/MS/164','',2,1,'\0\0\0\0\0\0\0∏ØÁåh¿o*Ral≠C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(101,1,1,2,'Kilimajuu','SK/MS/231','',2,2,'\0\0\0\0\0\0\0h?RDÜï¿b€¢Ã≠C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(102,1,1,2,'Pwani Mchangani','SK/MSK/64','',2,2,'\0\0\0\0\0\0\0 ¶\\·]Æ¿”¡˙?á≠C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(103,1,1,2,'Gamba','SK/MS/71','',2,2,'\0\0\0\0\0\0\0h\"lxz•¿—?¡≈ä¶C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(104,1,1,2,'Moga','SK/MS/219','',2,2,'\0\0\0\0\0\0\0éuq\r†¿Ë¡›Yª•C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(105,1,1,2,'Chaani ','SK/MS/173','',2,2,'\0\0\0\0\0\0\0Fîˆ_∏¿ß≥ì¡Q¶C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(106,1,1,2,'Kikobweni (Chaani Kikobweni)','SK/MS/141','',2,2,'\0\0\0\0\0\0\0A+0duÀ¿–õäTßC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(107,1,1,2,'Kinyasini','SK/MS/70','',2,2,'\0\0\0\0\0\0\0‚K∫‡¿»=õUßC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(108,1,1,3,'Kilombero','SK/MS/151','',2,2,'\0\0\0\0\0\0\0ûµ€.4¿í\"2¨‚©C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(109,1,1,3,'Upenja','SK/MS/156','',2,2,'\0\0\0\0\0\0\0\0W≤c#¿ı€◊Ås™C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(110,1,1,3,'Kiwengwa','SK/MS/03','',2,2,'\0\0\0\0\0\0\0]m≈˛≤˚¿[Œ•∏™∞C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(111,1,1,2,'Banda Maji','SK/MS/145','',2,2,'\0\0\0\0\0\0\0)?©ˆÈÿ¿ŸBêÉ¶C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(112,1,1,3,'Mgambo','SK/MS/174','',2,2,'\0\0\0\0\0\0\0ùFZ*oÁ¿ÑûÕ™œ•C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(113,1,1,3,'Kinduni','SK/MS/193','',2,2,'\0\0\0\0\0\0\0g¥Cˆ¿ƒ%«ù“°C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(114,1,1,3,'Mahonda','SK/MS/158','',2,2,'\0\0\0\0\0\0\0a√”+e˘¿\\[%X†C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(115,1,1,3,'Kitope','SK/MS/54','',2,2,'\0\0\0\0\0\0\0\0ÊÀ¿Äüq·@†C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(116,1,1,3,'Donge Karange','SK/MS/161','',2,3,'\0\0\0\0\0\0\0—?¡≈ä⁄¿›7‡ÛüC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(117,1,1,3,'Donge Primary','SK/MS/62','',2,1,'\0\0\0\0\0\0\0€‹òû∞ƒ¿Œp>?†C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(118,1,1,3,'Donge Mtambile','SK/MS/163','',2,2,'\0\0\0\0\0\0\0õ”ñ∏¿∆‹µÑ|†C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(119,1,1,3,'Mwanda','SK/MS/125','',2,2,'\0\0\0\0\0\0\0SÆ.±¿_F±‹“ûC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(120,1,1,3,'Donge Kipange','SK/MMS/03','',2,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(121,1,1,2,'Kandwi','SK/MS/169','',2,2,'\0\0\0\0\0\0\0ÿª?ﬁ´∂¿AÇ‚«ò´C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(122,1,1,9,'Bwefum','SK/MSK/60','',9,2,'\0\0\0\0\0\0\0!Y¿n=¿Á5vâÍ•C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(123,1,1,10,'Mkunazini','SK/MS/07','',9,3,'\0\0\0\0\0\0\0µ¶yß¿¯™ï	øòC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(124,1,1,10,'Kisiwandui','SK/MS/11','',9,1,'\0\0\0\0\0\0\0‘Ç}©¿Õ#0òC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(125,1,1,10,'Mwembeshauri','SK/MS/05','',9,2,'\0\0\0\0\0\0\0øïÏÿ®¿ß/˙\nöC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(126,1,1,10,'Muungano','SK/MS/66','',9,2,'\0\0\0\0\0\0\0öû^©¿áP•fõC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(127,1,1,10,'Sebleni','SK/MS/94','',9,2,'\0\0\0\0\0\0\0`vO™¿s¢]ÖîõC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(128,1,1,10,'Nyerere Msingi','SK/MS/93','',9,2,'\0\0\0\0\0\0\0\\Z\râ{¨¿‚X∑—úC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(129,1,1,9,'Kinuni','SK/MS/127','',9,2,'\0\0\0\0\0\0\0éH∞¿œ1 {ΩüC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(130,1,1,9,'Magogoni','SK/MS/229','',9,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(131,1,1,9,'Kijito Upele','SK/MS/160','',9,3,'\0\0\0\0\0\0\0≠˙\\m≈æ¿	˘†g≥ûC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(132,1,1,9,'Fuoni Msingi','SK/MMS/106','',9,1,'\0\0\0\0\0\0\0Eª\n)?…¿`Â–\"€°C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(133,1,1,9,'Kitongani','SK/MMS/04','',9,1,'\0\0\0\0\0\0\0T„•õƒ‡¿6´>W[°C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(134,1,1,9,'Kibondeni','SK/MSK/125','',9,2,'\0\0\0\0\0\0\0ä´ æ+‚¿Ã—„˜6•C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(135,1,1,9,'Dimani','SK/MSK/129','',9,2,'\0\0\0\0\0\0\0˝º©HÖ¿í≥∞ß¢C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(136,1,1,9,'Kombeni','SK/MSK/61','',9,2,'\0\0\0\0\0\0\0~8gD	¿ì„NÈ`°C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(137,1,1,9,'Maungani','SK/MSK/112','',9,3,'\0\0\0\0\0\0\0sÙ¯ΩÌ¿·¥‡EüC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(138,1,1,9,'Kisauni','SK/MS/50','',9,1,'\0\0\0\0\0\0\0¶\nF%u‚¿Ω·¥‡ùC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(139,1,1,10,'Kiembe Samaki ','SK/MSK/04','',9,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(140,1,1,9,'Chukwani','SK/MSK/84','',9,2,'\0\0\0\0\0\0\0Fô\r2…Ë¿è™&à∫õC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(141,1,1,10,'Jang\'ombe Msingi \'a\'','SK/MS/17','',9,2,'\0\0\0\0\0\0\0˙∏6Tå≥¿\'¬ÜßWöC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(142,1,1,10,'Jang\'ombe Msingi \'b\'','SK/MS/235','',9,2,'\0\0\0\0\0\0\0˙∏6Tå≥¿\'¬ÜßWöC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(143,1,1,10,'Kidongochekundu \'a\'','SK/MS/08','',9,2,'\0\0\0\0\0\0\0ã‡+Ÿ±¿Â\'’>õC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(144,1,1,10,'Kidongochekundu \'b\'','SK/MS/108','',9,2,'\0\0\0\0\0\0\0ã‡+Ÿ±¿Â\'’>õC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(145,1,1,9,'Mwanakwerekwe \'b\'','SK/MS/52','',9,1,'\0\0\0\0\0\0\0d;ﬂOç∑¿\\wÛTáúC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(146,1,1,9,'Mwanakwerekwe \'c\'','SK/MS/53','',9,2,'\0\0\0\0\0\0\0¥<ÓŒ∫¿i„àµ¯úC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(147,1,1,9,'Mwanakwerekwe \'d\'','SK/MS/22','',9,2,'\0\0\0\0\0\0\0»^Ô˛∏¿Ò∫~¡núC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(148,1,1,9,'Mwanakwerekwe \'e\'','SK/MS/23','',9,2,'\0\0\0\0\0\0\0◊£p=\n∑¿MuÄúC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(149,1,2,4,'Chanjamjawiri','SK/MS/116','',3,2,'\0\0\0\0\0\0\0nã2d2¿hËü‡b·C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(150,1,2,5,'Uwandani','SK/MS/30','',3,2,'\0\0\0\0\0\0\0≤c#ØÀ¿”á.®oÈC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(151,1,2,4,'Kilindi','SK/MS/150','',3,2,'\0\0\0\0\0\0\0£Ø ÕX¿%Ã¥˝+€C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(152,1,2,4,'Michakaini \'a\' Basic','SK/MS/29','',3,2,'\0\0\0\0\0\0\0ıÑ%Pˆ¿I◊LæŸ‚C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(153,1,2,4,'Vitongoji','SK/MS/138','',3,2,'\0\0\0\0\0\0\0#J{É/Ï¿∂J∞8úÈC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(154,1,2,4,'Wawi','SK/MS/114','',3,2,'\0\0\0\0\0\0\0üé«T¿˜ÈxÃ@ÂC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(155,1,2,5,'Ole','SK/MS/216','',3,2,'\0\0\0\0\0\0\0Ëj+ˆóΩ¿=~o”ÁC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(156,1,2,4,'Wesha','SK/MSK/100','',3,2,'\0\0\0\0\0\0\0ÛìjüéÁ¿ãâÕ«µ›C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(157,1,2,5,'Kangagani','SK/MS/182','',3,2,'\0\0\0\0\0\0\0”jH‹c©¿À«∫∏ÈC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(158,1,2,4,'Matale','SK/MS/209','',3,1,'\0\0\0\0\0\0\0,∑¥\Z7¿d;ﬂOç„C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(159,1,2,4,'Ziwani','SK/MSK/22','',3,3,'\0\0\0\0\0\0\0ƒ¨Cπ¿´x#Û»ÁC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(160,1,2,4,'Furaha','SK/MS/223','',3,2,'\0\0\0\0\0\0\0Íï≤q¿çúÖ=ÌËC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(161,1,2,4,'Shungi','SK/MS/112','',3,2,'\0\0\0\0\0\0\0i©º·¿uÕ‰õmﬁC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(162,1,2,4,'Pembeni','SK/MS/166','',3,2,'\0\0\0\0\0\0\0˛}∆Ö¡¿≤F=D£ﬂC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(163,1,2,4,'Dodo','SK/MS/225','',3,2,'\0\0\0\0\0\0\0∏ÖÎQ8¿˜í∆hÂC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(164,1,2,4,'Ndagoni','SK/MSS/11','',3,2,'\0\0\0\0\0\0\0e«F ^◊¿§à´ÿC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(165,1,2,4,'Michakaini \'b\' Primary','SK/MS/233','',3,1,'\0\0\0\0\0\0\0É4c—tˆ¿Çî0”‚C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(166,1,2,4,'Mbuzini','SK/MS/86','',3,1,'\0\0\0\0\0\0\0œÉª≥vª¿Ã¥˝++ÂC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(167,1,2,4,'Vkunguni','SK/MSK/103','',3,2,'\0\0\0\0\0\0\0z6´>W€¿!Í>\0©ÂC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(168,1,2,4,'Madungu \'b\'','SK/MS/234','',3,2,'\0\0\0\0\0\0\0&pÎn˛¿ﬁT§¬ÿ‚C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(169,1,2,4,'Al-Swadiq','SK/MS/115','',3,2,'\0\0\0\0\0\0\0\\r‹)¿HP¸ÄC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(170,1,2,4,'Madungu \'a\'','SK/MS/31','',3,2,'\0\0\0\0\0\0\0&pÎn˛¿ﬁT§¬ÿ‚C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(171,1,2,4,'Pondeani','SK/MSK/87','',3,2,'\0\0\0\0\0\0\0◊¿V	Á¿å5òÜ·C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(172,1,2,4,'Ng\'ambwa','SK/MS/222','',3,2,'\0\0\0\0\0\0\0±Pköw‹¿£uT5A‰C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(173,1,2,4,'Kwale','SK/MS/28','',3,2,'\0\0\0\0\0\0\0õ=–\nŸ¿m≈˛≤{‚C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(174,1,2,4,'Birikau','SK/MS/134','',3,2,'\0\0\0\0\0\0\0ä‡+Ÿ¿´Ïª\"¯ﬂC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(175,1,2,4,'Pujini','SK/MS/175','',3,2,'\0\0\0\0\0\0\0Á„⁄P1.¿f˜‰a°ÊC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(176,1,2,5,'Mjini Kiuyu','SK/MSK/16','',4,1,'\0\0\0\0\0\0\0¨ˇsò/è¿∏u7OuËC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(177,1,2,5,'Minungwini ','SK/MSK/40','',4,2,'\0\0\0\0\0\0\0¶~ﬁT§¢¿˛ö¨QÁC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(178,1,2,5,'Mchangamdogo ','SK/MS/121','',4,2,'\0\0\0\0\0\0\09Óî÷¿z‰ûÁC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(179,1,2,5,'Jojo','SK/MS/124','',4,2,'\0\0\0\0\0\0\0ﬂlsczÇ¿À«∫∏ÂC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(180,1,2,5,'Chwale ','SK/MSK/97','',4,2,'\0\0\0\0\0\0\0£#π¸áÙ¿á¢@üËC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(181,1,2,5,'Kojani','SK/MSK/88','',4,2,'\0\0\0\0\0\0\0ˆv√∂e¿êkC≈8ÎC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(182,1,2,5,'Shengejuu','SK/MSK/43','',4,2,'\0\0\0\0\0\0\01Bx¥qD¿ñ≤q¨ÁC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(183,1,2,5,'Piki','SK/MSK/42','',4,2,'\0\0\0\0\0\0\0wJÎ¿Ì∂Õu‚C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(184,1,2,5,'Bwagamoyo','SK/MS/79','',4,2,'\0\0\0\0\0\0\0qUŸwEp¿Veﬂ¡ﬂC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(185,1,2,5,'Makongeni','SK/MS/60','',4,2,'\0\0\0\0\0\0\0Q˜Hç¿◊Q’Q€C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(186,1,2,5,'Uondwe ','SK/MSK/44','',4,2,'\0\0\0\0\0\0\0Î®jÇ®[¿d˘ÉÅ€C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(187,1,2,5,'Daya','SK/MS/221','',4,3,'\0\0\0\0\0\0\0ßÀbbÛq¿«K7âA‹C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(188,1,2,5,'Fundo','SK/MS/41','',4,2,'\0\0\0\0\0\0\0TåÛ7°0¿à∫@j”C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(189,1,2,5,'Uvinje','SK/MS/226','',4,3,'\0\0\0\0\0\0\0vOjm¿˛‘xÈ&—C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(190,1,2,5,'Mzambarauni','SK/MS/113','',4,2,'\0\0\0\0\0\0\0lxz•,c¿V}Æ∂b„C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(191,1,2,5,'Mitiulaya ','SK/MS/40','',4,2,'\0\0\0\0\0\0\0Í gy<¿Ñd‹C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(192,1,2,5,'Jadida','SK/MS/39','',4,1,'\0\0\0\0\0\0\0vl‚u=¿®∆K7â›C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(193,1,2,5,'Limbani ','SK/MSK/91','',4,2,'\0\0\0\0\0\0\0◊4Ô8EG¿;‰f∏ﬂC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(194,1,2,5,'Kizimbani ','SK/MS/203','',4,2,'\0\0\0\0\0\0\0b->¿8¿¸˚åﬁC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(195,1,2,5,'Mabatini','SK/MSK/128','',4,3,'\0\0\0\0\0\0\0π¸áÙ€˜¿[”º„ŸC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(196,1,2,5,'Mkote','SK/MS/227','',4,2,'\0\0\0\0\0\0\0~tÍ g¿P«c*€C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(197,1,2,5,'Gando ','SK/MS/181','',4,2,'\0\0\0\0\0\0\0¶\nF%u¿ÿÅsFî⁄C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(198,1,2,5,'Ukunjwi','SK/MSK/45','',4,2,'\0\0\0\0\0\0\0÷VÏ/ª\'¿B≤Ä	ÿC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(199,1,2,5,'Bopwe','SK/MS/129','',4,2,'\0\0\0\0\0\0\0¡=~o3¿€‹òû∞‹C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(200,1,2,6,'Kinyasini ','SK/MSS/06','',4,2,'\0\0\0\0\0\0\0ÑÿôBÁ¿BÏL°ÛﬁC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(201,1,2,5,'Kisiwani','SK/MS/178','',4,2,'\0\0\0\0\0\0\0V+~©ü¿†≤∫·C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(202,1,2,5,'Pandani ','SK/MS/120','',4,2,'\0\0\0\0\0\0\0Ì∂Õu:¿—Ëb„C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(203,1,2,6,'Mgogoni Basic School','SK/MS/58','',4,2,'\0\0\0\0\0\0\0Ú$Èö…˜¿!<⁄8ﬁC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(204,1,2,6,'Shumba Vyamboni','SK/MSK/13','',5,2,'\0\0\0\0\0\0\0àc]‹F¿âA`Â–‚C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(205,1,2,6,'Kiuyu','SK/MSK/16','',5,2,'\0\0\0\0\0\0\0ó≠ıEB€¿=D£;àÌC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(206,1,2,6,'Mtemani','SK/MS/200','',5,2,'\0\0\0\0\0\0\0vT5A‘¿MæŸÊ∆ËC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(207,1,2,6,'Kinowe','SK/MSK/99','',5,2,'\0\0\0\0\0\0\0iUM’¿\'É£‰’·C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(208,1,2,6,'Konde \'b\'','SK/MS/189','',5,2,'\0\0\0\0\0\0\0á·#bJƒ¿˙Dû$]ﬂC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(209,1,2,6,'Kipangani','SK/MS/199','',5,2,'\0\0\0\0\0\0\0ì„NÈ`›¿›$Åï€C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(210,1,2,6,'Karume','SK/MS/191','',5,2,'\0\0\0\0\0\0\0Ü…T¡®‰¿ºëy‰ÍC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(211,1,2,6,'Sizini','SK/MS/59','',5,2,'\0\0\0\0\0\0\0†√|yˆ¿÷®áhtÁC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(212,1,2,6,'Haroun','SK/MS/197','',5,3,'\0\0\0\0\0\0\0˘,œÉª≥¿êà)ëDﬂC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(213,1,2,6,'Msuka','SK/MS/25','',5,2,'\0\0\0\0\0\0\0X®5Õ;Æ¿n¿ÁáﬁC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(214,1,2,6,'Micheweni','SK/MSK/18','',5,2,'\0\0\0\0\0\0\0XŒ¸jÓ¿X9¥»vÍC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(215,1,2,6,'Konde \'a\'','SK/MS/142','',5,2,'\0\0\0\0\0\0\0£í:Mƒ¿¨ZdﬂC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(216,1,2,6,'Tumbe','SK/MS/136','',5,2,'\0\0\0\0\0\0\0–≥Yıπ⁄¿Ô¨›v°ÂC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(217,1,2,6,'Makangale','SM/MSK/15','',5,2,'\0\0\0\0\0\0\0≠Q—ËÆ¿*oG8-ÿC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(218,1,2,6,'Wingwi \'b\'','SK/MS/195','',5,2,'\0\0\0\0\0\0\0_µ2·ó\Z¿ñ	ø‘œÁC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(219,1,2,6,'Wingwi \'a\'','SK/MSK/17','',5,2,'\0\0\0\0\0\0\0_µ2·ó\Z¿$bJ$—ÁC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(220,1,2,6,'Simai','SK/MS/224','',5,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(221,1,2,5,'Finya','SK/MS/81','',5,1,'\0\0\0\0\0\0\0¬&S#¿u<f†2‚C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(222,1,2,6,'Mkiang\'ombe','SK/MS/201','',5,2,'\0\0\0\0\0\0\0¸s◊“¿\\ÊtYLÿC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(223,1,2,7,'Kunguni','SK/MS/179','',6,2,'\0\0\0\0\0\0\0m≠/⁄2¿ë\'I◊L÷C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(224,1,2,7,'Ng\'ombeni \' A\'','SK/MS/215','',6,2,'\0\0\0\0\0\0\02ïÒÔs¿ﬁqäé‰“C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(225,1,2,7,'Ng\'ombeni \'b\'','SK/MS/183','',6,3,'\0\0\0\0\0\0\0g’Áj+v¿Ù√·—“C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(226,1,2,7,'Chokocho','SK/MS/131','',6,1,'\0\0\0\0\0\0\0R∏ÖÎ±¿¿!T©Ÿ”C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(227,1,2,7,'Kengeja','SK/MS/130','',6,2,'\0\0\0\0\0\0\0}Àú.ã©¿⁄|a2›C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(228,1,2,7,'Makombeni','SK/MSK/30','',6,2,'\0\0\0\0\0\0\0 7€‹ò^¿ÒÄ≤)W‘C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(229,1,2,7,'Mtuhaliwa','SK/MS/213','',6,2,'\0\0\0\0\0\0\0ãq˛&Ç¿˚ë\"2¨÷C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(230,1,2,7,'Chwaka','SK/MSK/117','',6,2,'\0\0\0\0\0\0\0^¢zk`ã¿ÀÑ_ÍÁ·C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(231,1,2,7,'Mizingani','SK/MSK/29','',6,2,'\0\0\0\0\0\0\0Œ¸jl¿9πﬂ°(‹C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(232,1,2,7,'Kangani','SK/MS/132','',6,2,'\0\0\0\0\0\0\0!Y¿Æ¿c(\'⁄UÿC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(233,1,2,7,'Mjimbini','SK/MS/211','',6,2,'\0\0\0\0\0\0\0¥<ÓŒö¿Ü˘aÿC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(234,1,2,7,'Mtangani','SK/MS/220','',6,2,'\0\0\0\0\0\0\0ëz6´~¿≤h:;‰C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(235,1,2,7,'Kiwani','SK/MS/117','',6,2,'\0\0\0\0\0\0\0~Wˇ[â¿¬QÚÍﬂC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(236,1,2,7,'Tasini','SK/MS/165','',6,2,'\0\0\0\0\0\0\06Õ;N—ë¿qZ¢Ø‡C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(237,1,2,7,'Kisiwa Paza','SK/MSK/28','',6,2,'\0\0\0\0\0\0\0ŸÎ›Ô’¿‹ùµ€“C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(238,1,2,7,'Mwambe','SK/MSK/35','',6,2,'\0\0\0\0\0\0\0Úµgñ®¿˙õPàÄﬂC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(239,1,2,7,'Mtambile','SK/MSK/37','',6,2,'\0\0\0\0\0\0\0L√1Ö¿≈…˝EŸC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(240,1,2,7,'Mkanyangeni','SK/MSK/33','',6,3,'\0\0\0\0\0\0\0éÈ	K<†¿™`TR\'‘C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(241,1,2,7,'Makoongwe','SK/MS/33','',6,2,'\0\0\0\0\0\0\0ówJá¿û^)ÀÉC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(242,1,2,7,'Tironi','SK/MS/90','',6,3,'\0\0\0\0\0\0\0R’Q˜a¿}i∆¢’C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(243,1,2,7,'Chambani','SK/MSK/27','',6,1,'\0\0\0\0\0\0\0ıúÙæÒU¿ó®ﬁ\Zÿ‚C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(244,1,2,7,'Shamiani - Mwambe','SK/MS/12','',6,2,'\0\0\0\0\0\0\0Ç9z¸æ¿!<⁄8ﬁC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(245,1,2,7,'Ukutini','SK/MS/135','',6,2,'\0\0\0\0\0\0\0Nó≈ƒÊc¿KÕh‚C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(246,1,2,7,'Michenzani','SK/MS/35','',6,2,'\0\0\0\0\0\0\0%#gaOõ¿Á„⁄P1“C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(247,1,2,7,'Wambaa','SK/MSK/31','',6,2,'\0\0\0\0\0\0\0óã¯NÃ:¿´[=\'Ω◊C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(248,1,2,7,'Ngwachani','SK/MSK/32','',6,2,'\0\0\0\0\0\0\0_^Ä}tJ¿–\nY›ﬁC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(249,2,3,11,'Butiama','MT.04/093','',10,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(250,2,3,11,'Chitandi','MT.04/008','',10,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(251,2,3,11,'Julia','MT.04/091','',10,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(252,2,3,11,'Karume','MT.04/014','',10,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(253,2,3,11,'Kiduni','MT.04/015','',10,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(254,2,3,11,'Likuna','MT.04/024','',10,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(255,2,3,11,'Kilidu','MT.04/017','',10,2,'\0\0\0\0\0\0\0Ì°;ê∞%¿¯\'Dæ›C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(256,2,3,11,'Luchingu','MT.04/025','',10,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(257,2,3,11,'Magombo','MT.04/026','',10,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(258,2,3,11,'Makonga','MT.04/031','',10,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(259,2,3,11,'Mkoma       I','MT.04/046','',10,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(260,2,3,11,'Mnaida     I','MT.04/051','',10,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(261,2,3,11,'Mtangalanga','MT.04/067','',10,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(262,2,3,11,'Mwongozo','MT.04/069','',10,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(263,2,3,11,'Nambunga','MT.04/074','',10,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(264,2,3,11,'Mandumba','MT.04/041','',10,3,'\0\0\0\0\0\0\0IS*Œæ%¿wæü\Z/©C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(265,2,3,11,'Nanyonda','MT.04/083','',10,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(266,2,3,11,'Namiyonga   B','MT.04/078','',10,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(267,2,3,11,'Newala','MT.04/084','',10,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(268,2,3,11,'Twendepamoja','MT.04/087','',10,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(269,2,3,11,'Namiyonga     A','MT.04/077','',10,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(270,2,3,11,'Nachitulo','MT.04/071','',10,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(271,2,3,11,'Chihanga','MT.02/108','',11,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(272,2,3,11,'Chihwindi','MT.02/090','',11,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(273,2,3,11,'Chikwaya','MT.02/064','',11,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(274,2,3,11,'Chipitu','MT.04/095','',11,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(275,2,3,11,'Kikuyu','MT.04/016','',11,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(276,2,3,11,'Kipimi','MT.04/020','',11,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(277,2,3,11,'Kiuta','MT.04/021','',11,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(278,2,3,11,'Lidumbe','MT.04/097','',11,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(279,2,3,11,'Magumchila','MT.04/027','',11,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(280,2,3,11,'Mahumbika','MT.04/028','',11,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(281,2,3,11,'Makondeko','MT.04/030','',11,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(282,2,3,11,'Makote','MT.04/032','',11,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(283,2,3,11,'Mapili','MT.04/094','',11,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(284,2,3,11,'Mcholi Ii','MT.04/101','',11,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(285,2,3,11,'Mcholi-Godwin','MT.04/038','',11,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(286,2,3,11,'Mkunya','MT.04/049','',11,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(287,2,3,11,'Mnalale','MT.04/052','',11,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(288,2,3,11,'Mnanje','MT.04/053','',11,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(289,2,3,11,'Mpilipili','MT.04/063','',11,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(290,2,3,11,'Nanguruwe','MT.04/081','',11,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(291,2,3,11,'Nangwanda','MT.04/082','',11,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(292,2,3,11,'Samora','MT.04/085','',11,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(293,2,3,11,'Tawala','MT.04/108','',11,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(294,2,3,11,'Bahati','MT.04/001','',12,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(295,2,3,11,'Chihangu','MT.04/003','',12,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(296,2,3,11,'Chilangala','MT.04/007','',12,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(297,2,3,11,'Chilende','MT.04/118','',12,1,'\0\0\0\0\0\0\0e™`TRÁ$¿>√Æ\0©C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(298,2,3,11,'Hengapano','MT.04/012','',12,3,'\0\0\0\0\0\0\0∆m4Ä∑p%¿°÷4Ô8ëC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(299,2,3,11,'Lihanga','MT.04/023','',12,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(300,2,3,11,'Mahoha','MT.04/090','',12,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(301,2,3,11,'Majembe Juu','MT.04/029','',12,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(302,2,3,11,'Mbonde','MT.04/035','',12,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(303,2,3,11,'Meta','MT.04/040','',12,3,'\0\0\0\0\0\0\0oÉ¿ 1%¿+á°C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(304,2,3,11,'Mikumbi','MT.04/042','',12,1,'\0\0\0\0\0\0\0˝)_Ωw!%¿Æÿ_vOñC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(305,2,3,11,'Miyuyu','MT.04/115','',12,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(306,2,3,11,'Mkalenda','MT.04/055','',12,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(307,2,3,11,'Mkoma     Ii','MT.04/047','',12,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(308,2,3,11,'Mkoma Sokoni','MT.04/089','',12,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(309,2,3,11,'Mkongi','MT.04/048','',12,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(310,2,3,11,'Mnayope','MT.04/054','',12,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(311,2,3,11,'Mnyambe','MT.04/058','',12,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(312,2,3,11,'Namdimba','MT.04/075','',12,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(313,2,3,11,'Namangudu','MT.04/114','',12,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(314,2,3,11,'Nambali','MT.04/073','',12,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(315,2,3,11,'Namihonga','MT.04/076','',12,3,'\0\0\0\0\0\0\0—ë\\˛C∫$¿∞“∏®C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(316,2,3,11,'Chikunda-Lubido','MT.04/110','',13,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(317,2,3,11,'Chiwonga','MT.04/011','',13,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(318,2,3,11,'Kadengwa','MT.04/013','',13,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(319,2,3,11,'Kitangali     B','MT.04/018','',13,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(320,2,3,11,'Kitangali-Mazoezi','MT.04/019','',13,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(321,2,3,11,'Madaba','MT.04/119','',13,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(322,2,3,11,'Mbembele','MT.04/034','',13,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(323,2,3,11,'Mbeya','MT.04/117','',13,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(324,2,3,11,'Mitanga','MT.04/045','',13,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(325,2,3,11,'Mnali','MT.04/061','',13,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(326,2,3,11,'Mnauya','MT.04/113','',13,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(327,2,3,11,'Mning\'aliye','MT.04/056','',13,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(328,2,3,11,'Mmulunga','MT.04/050','',13,1,'\0\0\0\0\0\0\0)\\è¬ı(%¿ê1w-!ØC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(329,2,3,11,'Mnyeu','MT.04/060','',13,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(330,2,3,11,'Mpotola','MT.04/064','',13,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(331,2,3,11,'Mtongwele','MT.04/070','',13,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(332,2,3,11,'Mtopwa','MT.04/068','',13,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(333,2,3,11,'Muungano','MT.04/112','',13,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(334,2,3,11,'Nanda','MT.04/079','',13,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(335,2,3,11,'Nandwahi','MT.04/080','',13,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(336,2,3,11,'Sijaona','MT.04/086','',13,3,'\0\0\0\0\0\0\0Ç¶/q—f%¿µBÙ±C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(337,2,3,11,'Vihokoli','MT.04/088','',13,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(338,2,3,11,'Chikoi','MT.04/005','',14,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(339,2,3,11,'Chitenda','MT.04/010','',14,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(340,2,3,11,'Chitekete','MT.04/009','',14,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(341,2,3,11,'Chiule','MT.04/111','',14,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(342,2,3,11,'Chiuta','MT.04/096','',14,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(343,2,3,11,'Lengo','MT.04/022','',14,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(344,2,3,11,'Makukwe    I','MT.04/098','',14,1,'\0\0\0\0\0\0\0À°E∂Ûç%¿ü<,‘ö≤C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(345,2,3,11,'Makukwe    Ii','MT.04/099','',14,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(346,2,3,11,'Malatu','MT.04/033','',14,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(347,2,3,11,'Mbuyuni','MT.04/100','',14,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(348,2,3,11,'Mchedebwa','MT.04/036','',14,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(349,2,3,11,'Mchemo','MT.04/037','',14,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(350,2,3,11,'Mdimba','MT.04/039','',14,1,'\0\0\0\0\0\0\0Íb…/ñå%¿`Ù∂¨’•C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(351,2,3,11,'Ngongo','MT.04/107','',14,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(352,2,3,11,'Minjale','MT.04/043','',14,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(353,2,3,11,'Mitahu','MT.04/044','',14,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(354,2,3,11,'Mkwedu Tankini','MT.04/102','',14,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(355,2,3,11,'Mnolela','MT.04/057','',14,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(356,2,3,11,'Mnyambachi','MT.04/103','',14,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(357,2,3,11,'Mpalu','MT.04/062','',14,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(358,2,3,11,'Mpwapwa','MT.04/065','',14,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(359,2,3,11,'Mtanda','MT.04/066','',14,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(360,2,3,11,'Mtendachi','MT.04/104','',14,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(361,2,3,11,'Mtunguru','MT.04/105','',14,1,'\0\0\0\0\0\0\0” Ëmâ%¿’xÈ&1¨C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(362,2,3,11,'Mtengachi','MT.04/104','',14,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(363,2,3,11,'Nakahako','MT.04/072','',14,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(364,2,3,11,'Nambudi','MT.04/092','',14,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(365,2,3,11,'Nankong\'o','MT.04/106','',14,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(366,2,3,11,'Tengulengu','MT.04/109','',14,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(367,2,3,12,'Chilimba','MT.03/028','',15,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(368,2,3,12,'Chipembe','MT.03/026','',15,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(369,2,3,12,'Chiungutwa','MT.03/014','',15,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(370,2,3,12,'Huwe','MT.03/016','',15,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(371,2,3,12,'Lipumburu','MT.03/093','',15,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(372,2,3,12,'Lisanje','MT.03/144','',15,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(373,2,3,12,'Lupaso','MT.03/069','',15,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(374,2,3,12,'Makanyama','MT.03/047','',15,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(375,2,3,12,'Masuburu Mtenga','MT.03/056','',15,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(376,2,3,12,'Mbuyuni','MT.05/021','',15,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(377,2,3,12,'Mdibwa (Ndibwa)','MT.03/023','',15,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(378,2,3,12,'Milunda','MT.03/215','',15,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(379,2,3,12,'Mitonji','MT.03/216','',15,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(380,2,3,12,'Miundo','TEMP_0010','',15,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(381,2,3,12,'Mjawara (Njawara)','MT.03/064','',15,1,'\0\0\0\0\0\0\0ÍY\ZÂÜ¸%¿∫I+kC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(382,2,3,12,'Mpeta','MT.03/020','',15,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(383,2,3,12,'Mpulima','MT.03/172','',15,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(384,2,3,12,'Nairombo','MT.03/038','',15,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(385,2,3,12,'Nakachureni','TEMP_0011','',15,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(386,2,3,12,'Nanjota','MT.03/075','',15,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(387,2,3,12,'Nantona','MT.03/171','',15,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(388,2,3,12,'Niesi (Miesi)','MT.03/112','',15,1,'\0\0\0\0\0\0\0‹õÈK\\D&¿ö®#îuC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(389,2,3,12,'Tuleane','MT.03/125','',15,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(390,2,3,12,'Umati','MT.03/237','',15,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(391,2,3,12,'Utimbe','MT.03/065','',15,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(392,2,3,12,'Chikundi Msanga','MT.03/034','',16,3,'\0\0\0\0\0\0\0¨Èpá`%¿1˘≈í_|C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(393,2,3,12,'Chipango','MT.03/131','',16,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(394,2,3,12,'Luagala','MT.03/151','',16,1,'\0\0\0\0\0\0\0…væü\Zø%¿W6ÜèC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(395,2,3,12,'Lulindi (Special Ed)','MT.03/179','',16,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(396,2,3,12,'Lulindi    I','MT.03/008','',16,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(397,2,3,12,'Lulindi      Ii','MT.03/242','',16,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(398,2,3,12,'Majembe','MT.03/009','',16,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(399,2,3,12,'Mbugo','MT.03/217','',16,3,'\0\0\0\0\0\0\0î);så%¿g‰ÕÙ%äC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(400,2,3,12,'Mdwika     I (Ndwika)','MT.03/001','',16,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(401,2,3,12,'Mitesa','MT.03/224','',16,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(402,2,3,12,'Miwale','MT.03/158','',16,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(403,2,3,12,'Mkangaula','MT.03/182','',16,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(404,2,3,12,'Mkolopola','MT.03/115','',16,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(405,2,3,12,'Mkululu','MT.03/048','',16,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(406,2,3,12,'Lusonje','MT.03/027','',16,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(407,2,3,12,'Mtakuja     I','MT.03/114','',16,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(408,2,3,12,'Nagaga','MT.03/031','',16,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(409,2,3,12,'Nakalola','MT.03/059','',16,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(410,2,3,12,'Namalenga','MT.03/021','',16,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(411,2,3,12,'Chikoropola','MT.03/015','',17,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(412,2,3,12,'Luatala','MT.03/017','',17,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(413,2,3,12,'Makong\'onda','MT.03/055','',17,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(414,2,3,12,'Manyuli','MT.03/145','',17,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(415,2,3,12,'Maparawe','MT.03/100','',17,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(416,2,3,12,'Mapili','MT.03/103','',17,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(417,2,3,12,'Mchauru','MT.03/023','',17,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(418,2,3,12,'Mgwagule','MT.03/057','',17,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(419,2,3,12,'Mirewe','MT.03/122','',17,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(420,2,3,12,'Mkachima','MT.03/155','',17,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(421,2,3,12,'Mnavira','MT.03/019','',17,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(422,2,3,12,'Mwitika','MT.03/258','',17,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(423,2,3,12,'Nakarara','MT.03/121','',17,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(424,2,3,12,'Naliongolo','MT.03/110','',17,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(425,2,3,12,'Namyomyo','MT.03/132','',17,3,'\0\0\0\0\0\0\0ıÜÒ≠\"&¿©Ó§ò¶C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(426,2,3,12,'Ng\'uni','MT.03/146','',17,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(427,2,3,12,'Rivango','MT.03/033','',17,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(428,2,3,12,'Sindano','MT.03/063','',17,1,'\0\0\0\0\0\0\0ÏÂd/&¿|RLÀ5äC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(429,2,3,12,'Chidya','MT.03/019','',18,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(430,2,3,12,'Chigugu','MT.03/094','',18,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(431,2,3,12,'Chigumi','MT.03/169','',18,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(432,2,3,12,'Chikundi','MT.03/077','',18,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(433,2,3,12,'Chikukwe','MT.03/141','',18,1,'\0\0\0\0\0\0\0«Ì°j·/%¿Ç´,sC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(434,2,3,12,'Chiwata','MT.03/005','',18,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(435,2,3,12,'Liloya','MT.03/046','',18,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(436,2,3,12,'Liputu','MT.03/138','',18,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(437,2,3,12,'Mandiwa','MT.03/186','',18,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(438,2,3,12,'Mbaju','MT.03/130','',18,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(439,2,3,12,'Mbemba','MT.03/002','',18,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(440,2,3,12,'Mdenga','MT.03/204','',18,3,'\0\0\0\0\0\0\0«Ì°j·/%¿vÄó⁄âC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(441,2,3,12,'Njenga','MT.03/209','',18,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(442,2,3,12,'Mkalapa','MT.03/095','',18,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(443,2,3,12,'Mkang\'u','MT.03/185','',18,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(444,2,3,12,'Mkungu','MT.03/180','',18,1,'\0\0\0\0\0\0\0pí™Ù¿$¿⁄ñ◊7°C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(445,2,3,12,'Mkwera','MT.03/085','',18,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(446,2,3,12,'Mpowora','MT.03/178','',18,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(447,2,3,12,'Mtunungu','MT.03/139','',18,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(448,2,3,12,'Mumburu','MT.03/140','',18,3,'\0\0\0\0\0\0\0\"[åî@›$¿›$ÅïèC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(449,2,3,12,'Mwena','MT.03/156','',18,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(450,2,3,12,'Mwongozo','MT.03/161','',18,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(451,2,3,12,'Nanganga','MT.03/078','',18,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(452,2,3,12,'Nangoo','MT.03/082','',18,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(453,2,3,12,'Ndanda','MT.03/079','',18,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(454,2,3,12,'Chakama','TEMP_0012','',19,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(455,2,3,12,'Chanikanguo','MT.03/159','',19,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(456,2,3,12,'Chipole','MT.03/236','',19,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(457,2,3,12,'Chisegu','MT.03/120','',19,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(458,2,3,12,'Kambarage','MT.03/207','',19,3,'\0\0\0\0\0\0\0ÖÎQ∏Ö$¿ZUUUUD@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(459,2,3,12,'Kanyimbi','MT.03/007','',19,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(460,2,3,12,'Maendeleo','MT.03/206','',19,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(461,2,3,12,'Makulani','MT.03/071','',19,3,'\0\0\0\0\0\0\0z¬a|õ%¿eπFﬁLWC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(462,2,3,12,'Marika','MT.03/010','',19,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(463,2,3,12,'Masasi','MT.03/097','',19,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(464,2,3,12,'Matawale','MT.03/043','',19,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(465,2,3,12,'Mbonde','MT.03/175','',19,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(466,2,3,12,'Migongo','MT.03/073','',19,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(467,2,3,12,'Minjale','MT.03/084','',19,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(468,2,3,12,'Mkapunda','MT.03/167','',19,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(469,2,3,12,'Mkarakate','MT.03/180','',19,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(470,2,3,12,'Mkarango','MT.03/164','',19,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(471,2,3,12,'Mkomaindo','MT.03/012','',19,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(472,2,3,12,'Mkuti','MT.03/148','',19,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(473,2,3,12,'Mlimani','MT.03/208','',19,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(474,2,3,12,'Mlundelunde','MT.03/134','',19,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(475,2,3,12,'Moroko','MT.03/222','',19,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(476,2,3,12,'Mpindimbi','MT.03/013','',19,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(477,2,3,12,'Mtakuja   Ii','MT.03/160','',19,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(478,2,3,12,'Mumbaka','MT.03/136','',19,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(479,2,3,12,'Mwenge Mtapika','MT.03/171','',19,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(480,2,3,12,'Mwiti','MT.03/030','',19,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(481,2,3,12,'Namatunu','MT.03/090','',19,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(482,2,3,12,'Namkungwi','MT.03/108','',19,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(483,2,3,12,'Nangose','MT.03/092','',19,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(484,2,3,12,'Namikunda','MT.03/032','',19,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(485,2,3,12,'Nyasa','MT.03/111','',19,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(486,2,3,12,'Saba Saba','MT.03/205','',19,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(487,2,3,12,'Sululu','MT.03/165','',19,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(488,2,3,12,'Temeke','MT.03/239','',19,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(489,2,3,12,'Tukaewote','MT.03/124','',19,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(490,2,3,12,'Azimio','MT.03/210','',20,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(491,2,3,12,'Chikoweti','MT.03/044','',20,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(492,2,3,12,'Chikunja    I','MT.03/004','',20,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(493,2,3,12,'Chingulungulu','MT.03/066','',20,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(494,2,3,12,'Chipunda','MT.03/225','',20,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(495,2,3,12,'Chiroro','MT.03/128','',20,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(496,2,3,12,'Chiwale','MT.03/113','',20,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(497,2,3,12,'Kisiwani','MT.03/183','',20,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(498,2,3,12,'Lilala','MT.03/203','',20,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(499,2,3,12,'Lukuledi','MT.03/068','',20,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(500,2,3,12,'Lukuledi (Special Ed)','MT.03/223','',20,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(501,2,3,12,'Masiku','MT.03/211','',20,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(502,2,3,12,'Nasindi','MT.03/076','',20,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(503,2,3,12,'Ngalole      A','MT.03/177','',20,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(504,2,3,12,'Ngalole      B','MT.03/213','',20,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(505,2,3,12,'Mihima','MT.03/104','',20,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(506,2,3,12,'Mkwapa','MT.03/168','',20,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(507,2,3,12,'Mlingula','MT.03/150','',20,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(508,2,3,12,'Mnazi Moja','MT.03/188','',20,3,'\0\0\0\0\0\0\0≈¬\ZT¡%¿i~÷ƒ¿C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(509,2,3,12,'Mpanyani','MT.03/199','',20,1,'\0\0\0\0\0\0\0“o_Œ%¿«…ûXC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(510,2,3,12,'Mraushi','MT.03/088','',20,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(511,2,3,12,'Msikisi','MT.03/166','',20,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(512,2,3,12,'Muungano','MT.03/241','',20,3,'\0\0\0\0\0\0\0çónÉ0%¿ãù |\ZVC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(513,2,3,12,'Namalembo','MT.03/089','',20,1,'\0\0\0\0\0\0\0{^†Ñ%¿\nwˆr:C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(514,2,3,12,'Namajani','MT.03/096','',20,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(515,2,3,12,'Namatutwe','MT.03/060','',20,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(516,2,3,12,'Nambawala','MT.03/081','',20,1,'\0\0\0\0\0\0\0«∫∏ç%¿/}âã∂]C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(517,2,3,12,'Namichi','MT.03/212','',20,1,'\0\0\0\0\0\0\0rØπêd%¿ÿ¶ûÚUC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(518,2,3,12,'Nanyindwa','MT.03/041','',20,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(519,2,3,12,'Napata','MT.03/087','',20,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(520,2,3,12,'Ufukoni','MT.03/220','',20,1,'\0\0\0\0\0\0\0Ì\ræ0ô*%¿tµ˚ÀNC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(521,2,3,13,'Chidede','MT.05/002','',16,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(522,2,3,13,'Chaume','MT.05/001','',16,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(523,2,3,13,'Libobe','MT.05/112','',16,3,'\0\0\0\0\0\0\0]0‡R˚$¿≠iﬁqä¬C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(524,2,3,13,'Likolombe','MT.05/018','',16,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(525,2,3,13,'Liponde','MT.05/113','',16,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(526,2,3,13,'Litehu','MT.05/020','',16,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(527,2,3,13,'Luagala','MT.05/022','',16,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(528,2,3,13,'Luagala       B','MT.05/120','',16,1,'\0\0\0\0\0\0\0˚ÀÓ…√%¿¿Ïû<,ºC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(529,2,3,13,'Luheya','MT.05/128','',16,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(530,2,3,13,'Mabeti','MT.05/028','',16,3,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(531,2,3,13,'Machedi','MT.05/135','',16,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(532,2,3,13,'Ngunja','MT.05/104','',16,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(533,2,3,13,'Mikuyu','MT.05/051','',16,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(534,2,3,13,'Mkola Juu','MT.05/133','',16,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(535,2,3,13,'Mkola Tankini','MT.05/061','',16,1,'\0\0\0\0\0\0\0 ˆ+äDÓ$¿üK^ï∫C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(536,2,3,13,'Mkonjowano','MT.05/062','',16,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(537,2,3,13,'Mkuti','MT.05/068','',16,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(538,2,3,13,'Mkwedu Luagala','MT.05/063','',16,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(539,2,3,13,'Mkwiti','MT.05/065','',16,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(540,2,3,13,'Mmeda','MT.05/070','',16,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(541,2,3,13,'Mweru','MT.05/086','',16,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(542,2,3,13,'Namindondi','MT.05/095','',16,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(543,2,3,13,'Namyonga A (Namiyonga A)','MT.04/077','',16,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(544,2,3,13,'Nangombya (Mangombya)','MT.05/038','',16,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(545,2,3,13,'Nannala','MT.05/100','',16,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(546,2,3,13,'Ulodaleo','MT.05/109','',16,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(547,2,3,13,'Chikongo','MT.05/004','',21,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(548,2,3,13,'Chilinda','MT.05/006','',21,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(549,2,3,13,'Dinyeke','MT.05/126','',21,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(550,2,3,13,'Kilidu-Mkoreha','MT.05/014','',21,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(551,2,3,13,'Kitama       I','MT.05/015','',21,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(552,2,3,13,'Michenjele','MT.05/047','',21,1,'\0\0\0\0\0\0\0∑û(È$¿°p©˘C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(553,2,3,13,'Mihambwe','MT.05/048','',21,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(554,2,3,13,'Mitondi','MT.05/056','',21,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(555,2,3,13,'Mitondi          A','MT.05/114','',21,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(556,2,3,13,'Mitumbati','MT.05/057','',21,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(557,2,3,13,'Mkaha','MT.05/129','',21,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(558,2,3,13,'Mmalala','MT.05/069','',21,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(559,2,3,13,'Mnyahi','MT.05/073','',21,1,'\0\0\0\0\0\0\0R∏ÖÎë%¿£#π¸á‡C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(560,2,3,13,'Mpunda','MT.05/132','',21,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(561,2,3,13,'Mwangaza','MT.05/084','',21,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(562,2,3,13,'Mwenge','MT.05/085','',21,1,'\0\0\0\0\0\0\0ÚAœf≈$¿’iù6D@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(563,2,3,13,'Namdwani','MT.05/091','',21,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(564,2,3,13,'Namedi','MT.05/130','',21,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(565,2,3,13,'Namunda','MT.05/118','',21,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(566,2,3,13,'Naputa','MT.05/102','',21,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(567,2,3,13,'Ngongo','MT.05/103','',21,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(568,2,3,13,'Ng\'ongoro','MT.05/123','',21,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(569,2,3,13,'Nyuta','TEMP_0013','',21,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(570,2,3,13,'Ruvuma','MT.05/116','',21,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(571,2,3,13,'Amani','MT.05/119','',22,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(572,2,3,13,'Dinduma','MT.05/124','',22,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(573,2,3,13,'Lienje','MT.05/017','',22,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(574,2,3,13,'Madaba','MT.05/029','',22,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(575,2,3,13,'Mahoha','MT.05/125','',22,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(576,2,3,13,'Malamba','MT.05/036','',22,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(577,2,3,13,'Matogoro','TEMP_0014','',22,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(578,2,3,13,'Mbalala','MT.05/042','',22,3,'\0\0\0\0\0\0\0eLÀ5Úv%¿±œ≠ÃC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(579,2,3,13,'Milongodi','MT.05/053','',22,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(580,2,3,13,'Mitene','MT.05/055','',22,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(581,2,3,13,'Miule','MT.05/058','',22,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(582,2,3,13,'Mtinginda','MT.05/115','',22,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(583,2,3,13,'Nachunyu','MT.05/087','',22,1,'\0\0\0\0\0\0\0 êY–é^%¿±œ≠ÃC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(584,2,3,13,'Nambahu','MT.05/090','',22,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(585,2,3,13,'Namkomolela','MT.05/096','',22,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(586,2,3,13,'Nanhyanga    A','MT.05/097','',22,1,'\0\0\0\0\0\0\0BÙë°%¿Ç‚«òª¬C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(587,2,3,13,'Nanhyanga     B','MT.05/098','',22,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(588,2,3,13,'Nanyuwila','MT.05/101','',22,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(589,2,3,13,'Nivanga (Mivanga)','MT.05/060','',22,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(590,2,3,13,'Njimpya (Mjimpya)','MT.05/117','',22,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(591,2,3,13,'Tandahimba','MT.05/106','',22,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(592,2,3,13,'Ukombozi','MT.05/110','',22,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(593,2,3,13,'Zambia','MT.05/111','',22,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(594,2,3,13,'Chikongola','MT.05/003','',23,3,'\0\0\0\0\0\0\07ﬁ\'46ë$¿:m†”D@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(595,2,3,13,'Chikunda','MT.05/005','',23,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(596,2,3,13,'Chitoholi','MT.05/008','',23,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(597,2,3,13,'Chitoholi A','MT.05/134','',23,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(598,2,3,13,'Chungungwe','MT.05/007','',23,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(599,2,3,13,'Dinembo','MT.05/011','',23,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(600,2,3,13,'Lipalwe','MT.05/019','',23,1,'\0\0\0\0\0\0\0»‚Ô„%¿¯¬d™`ºC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(601,2,3,13,'Lipalwe Chini','MT.05/127','',23,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(602,2,3,13,'Lubangala','MT.05/026','',23,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(603,2,3,13,'Mahuta Bondeni','MT.05/031','',23,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(604,2,3,13,'Mahuta Mjini','MT.05/032','',23,1,'\0\0\0\0\0\0\0®W 2ƒ¡%¿¯¬d™`ºC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(605,2,3,13,'Majengo','MT.05/033','',23,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(606,2,3,13,'Makayaka (Nakayaka)','MT.05/088','',23,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(607,2,3,13,'Mambamba','MT.05/037','',23,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(608,2,3,13,'Mfyatula','MT.05/122','',23,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(609,2,3,13,'Mikunda','MT.05/050','',23,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(610,2,3,13,'Milumba','MT.05/054','',23,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(611,2,3,13,'Mkulung\'ulu','MT.05/066','',23,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(612,2,3,13,'Mkupete','MT.05/067','',23,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(613,2,3,13,'Mndumbwe','MT.05/072','',23,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(614,2,3,13,'Mtandavala','MT.05/077','',23,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(615,2,3,13,'Mtegu','MT.05/078','',23,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(616,2,3,13,'Mtenda','MT.05/079','',23,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(617,2,3,13,'Mtoni','MT.05/081','',23,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(618,2,3,13,'Mnyoma','MT.05/076','',23,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(619,2,3,13,'Chiumo','MT.05/009','',24,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(620,2,3,13,'Ghana','MT.05/012','',24,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(621,2,3,13,'Jangwani','MT.05/013','',24,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(622,2,3,13,'Kunandundu','MT.05/016','',24,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(623,2,3,13,'Litemla','MT.05/021','',24,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(624,2,3,13,'Lukokoda','MT.05/027','',24,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(625,2,3,13,'Maheha','MT.05/030','',24,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(626,2,3,13,'Maundo Juu','MT.05/041','',24,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(627,2,3,13,'Mbuyuni','MT.05/021','',24,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(628,2,3,13,'Mchichira        A','MT.05/044','',24,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(629,2,3,13,'Mnazimmoja','MT.05/071','',24,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(630,2,3,13,'Mnyawa','MT.05/075','',24,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(631,2,3,13,'Mundamkulu','MT.05/083','',24,3,'\0\0\0\0\0\0\0º8˚∆%¿≈è1w-¡C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(632,2,3,13,'Namahonga','MT.05/089','',24,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(633,2,3,13,'Namikupa     I','MT.05/092','',24,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(634,2,3,13,'Nanikupa     Ii','MT.05/093','',24,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(635,2,3,13,'Shangani','MT.05/105','',24,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(636,2,3,14,'Chikongola','MT.01/001','',25,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(637,2,3,14,'Chuno','MT.01/002','',25,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(638,2,3,14,'Kambarage','MT.01/020','',25,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(639,2,3,14,'Likonde','MT.01/004','',25,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(640,2,3,14,'Maendeleo','MT.01/024','',25,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(641,2,3,14,'Majengo','MT.01/008','',25,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(642,2,3,14,'Mangamba','MT.01/009','',25,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(643,2,3,14,'Mazoezi Ligula','MT.01/003','',25,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(644,2,3,14,'Misufini','MT.01/026','',25,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(645,2,3,14,'Mlimani','MT.01/013','',25,3,'\0\0\0\0\0\0\0RÎb∆ë$¿á∂=T-D@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(646,2,3,14,'Mtawanya','MT.01/022','',25,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(647,2,3,14,'Namayanga','MT.01/023','',25,1,'\0\0\0\0\0\0\0áßW 2¥$¿·ì©ÇD@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(648,2,3,14,'Raha Leo','MT.01/016','',25,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(649,2,3,14,'Shangani','MT.01/017','',25,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(650,2,3,14,'Tandika','MT.01/028','',25,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(651,2,3,14,'Lilungu','MT.01/005','',26,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(652,2,3,14,'Lwelu','MT.01/006','',26,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(653,2,3,14,'Magomeni','MT.01/007','',26,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(654,2,3,14,'Mangowela','MT.01/025','',26,3,'\0\0\0\0\0\0\0¢¥7¯¬î$¿PÌ2È‹D@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(655,2,3,14,'Mikindani','MT.01/010','',26,1,'\0\0\0\0\0\0\0˛ë$¿t⁄@ß\rD@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(656,2,3,14,'Mitengo','MT.01/011','',26,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(657,2,3,14,'Mivinjeni','MT.01/027','',26,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(658,2,3,14,'Mkangala','MT.01/012','',26,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(659,2,3,14,'Mwenge','MT.01/021','',26,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(660,2,3,14,'Mnaida','MT.01/014','',26,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(661,2,3,14,'Naliendele','MT.01/015','',26,1,'\0\0\0\0\0\0\0ûÔß∆K∑$¿ï4•‚ÏD@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(662,2,3,14,'Singino','MT.01/018','',26,1,'\0\0\0\0\0\0\0M&x0O4$¿∂‰^s	D@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(663,2,3,14,'Ufukoni','MT.01/019','',26,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(664,2,3,15,'Chemchem','MT.02/062','',27,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(665,2,3,15,'Chihanga','MT.02/108','',27,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(666,2,3,15,'Ilala','TEMP_0015','',27,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(667,2,3,15,'Imekuwa','MT.02/059','',27,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(668,2,3,15,'Kitere','MT.02/011','',27,3,'\0\0\0\0\0\0\0⁄¨˙\\mµ$¿π¸áÙ€„C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(669,2,3,15,'Libobe','MT.02/007','',27,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(670,2,3,15,'Likonde','MT.02/092','',27,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(671,2,3,15,'Lipwidi','MT.02/051','',27,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(672,2,3,15,'Lyowa','MT.02/056','',27,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(673,2,3,15,'Mangopachanne','MT.02/036','',27,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(674,2,3,15,'Mbuo','MT.02/067','',27,1,'\0\0\0\0\0\0\0ã |\Z\nÇ$¿òø3ˇC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(675,2,3,15,'Ndumbwe','MT.02/002','',27,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(676,2,3,15,'Mgao','MT.02/055','',27,3,'\0\0\0\0\0\0\0ÿÅsFîF$¿=åo±˝C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(677,2,3,15,'Mikonye','MT.02/091','',27,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(678,2,3,15,'Mng\'wena','MT.02/100','',27,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(679,2,3,15,'Mnyija','MT.02/061','',27,3,'\0\0\0\0\0\0\09Á±Sôè$¿èDéöúÁC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(680,2,3,15,'Mnima','MT.02/009','',27,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(681,2,3,15,'Mnyundo','MT.02/020','',27,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(682,2,3,15,'Mpapura','MT.02/066','',27,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(683,2,3,15,'Msijute','MT.02/069','',27,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(684,2,3,15,'Mtama','MT.02/076','',27,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(685,2,3,15,'Mtukimango','TEMP_0016','',27,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(686,2,3,15,'Muungano','MT.02/057','',27,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(687,2,3,15,'Mwembetogwa','MT.02/102','',27,3,'\0\0\0\0\0\0\0¡9#J{£$¿øn7Æl\0D@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(688,2,3,15,'Namambi','MT.02/103','',27,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(689,2,3,15,'Namdimba','MT.02/105','',27,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(690,2,3,15,'Namgogoli','MT.02/017','',27,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(691,2,3,15,'Namuhi','MT.02/044','',27,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(692,2,3,15,'Naumbu','MT.02/018','',27,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(693,2,3,15,'Utende','MT.02/065','',27,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(694,2,3,15,'Kihamba','MT.02/073','',28,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(695,2,3,15,'Kihimika','MT.02/079','',28,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(696,2,3,15,'Kilambo','MT.02/080','',28,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(697,2,3,15,'Kilombero','MT.02/029','',28,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(698,2,3,15,'Kitunguli','MT.02/008','',28,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(699,2,3,15,'Kivava','MT.02/094','',28,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(700,2,3,15,'Litembe','MT.02/074','',28,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(701,2,3,15,'Madimba','MT.02/033','',28,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(702,2,3,15,'Mayaya','MT.02/081','',28,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(703,2,3,15,'Mitambo','MT.02/111','',28,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(704,2,3,15,'Mkubiru','MT.02/054','',28,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(705,2,3,15,'Moma','MT.02/038','',28,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(706,2,3,15,'Mngoji','MT.02/060','',28,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(707,2,3,15,'Mnomo','MT.02/097','',28,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(708,2,3,15,'Msangamku','MT.02/019','',28,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(709,2,3,15,'Msimbati','MT.02/014','',28,1,'\0\0\0\0\0\0\0Ù˝‘xÈ∂$¿\'\"\"\"\"6D@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(710,2,3,15,'Mtendachi','MT.02/058','',28,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(711,2,3,15,'Nalingu','MT.02/039','',28,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(712,2,3,15,'Nambeleketela','MT.02/104','',28,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(713,2,3,15,'Tangazo','MT.02/012','',28,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(714,2,3,15,'Ziwani','MT.02/013','',28,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(715,2,3,15,'Bandari','MT.02/048','',29,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(716,2,3,15,'Chawi','MT.02/034','',29,1,'\0\0\0\0\0\0\0v≠≥4 %¿~åπk	\rD@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(717,2,3,15,'Dihimba','MT.02/003','',29,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(718,2,3,15,'Kawawa','MT.02/028','',29,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(719,2,3,15,'Kiromba','MT.02/016','',29,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(720,2,3,15,'Kiromba Chini','MT.02/084','',29,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(721,2,3,15,'Kitaya','MT.02/004','',29,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(722,2,3,15,'Maranje','MT.02/049','',29,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(723,2,3,15,'Makome','MT.02/075','',29,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(724,2,3,15,'Malamba','MT.02/046','',29,1,'\0\0\0\0\0\0\0ùM=Â´G%¿]Õ`y}˚C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(725,2,3,15,'Mayembe Chini','MT.02/053','',29,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(726,2,3,15,'Mayembe Juu','MT.02/086','',29,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(727,2,3,15,'Mbawala','MT.02/010','',29,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(728,2,3,15,'Mchanje','MT.02/091','',29,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(729,2,3,15,'Ngonja','MT.02/096','',29,1,'\0\0\0\0\0\0\0∂¿¯ù)%¿q\'V3D@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(730,2,3,15,'Misufini','MT.02/063','',29,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(731,2,3,15,'Miuta','MT.02/047','',29,3,'\0\0\0\0\0\0\0ìvôtn˝$¿¥J0‡ˆC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(732,2,3,15,'Mkomo','MT.02/095','',29,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(733,2,3,15,'Mkunwa','MT.02/042','',29,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(734,2,3,15,'Mkwajuni','MT.02/043','',29,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(735,2,3,15,'Mpanyani','MT.02/083','',29,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(736,2,3,15,'Mtiniko','MT.02/015','',29,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(737,2,3,15,'Nachenjele','MT.02/087','',29,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(738,2,3,15,'Namahyakata','MT.02/052','',29,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(739,2,3,15,'Namanjele','MT.02/085','',29,1,'\0\0\0\0\0\0\0∑û(È$¿°p©˘C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(740,2,3,15,'Nanguruwe','MT.02/005','',29,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(741,2,3,15,'Navikole','MT.02/077','',29,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(742,2,3,15,'Tumaini','MT.02/114','',29,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(743,2,3,15,'Azimio','MT.02/107','',30,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(744,2,3,15,'Chikwaya','MT.02/064','',30,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(745,2,3,15,'Chiwilo','MT.02/109','',30,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(746,2,3,15,'Chiwindi','MT.02/090','',30,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(747,2,3,15,'Dinyecha','MT.02/065','',30,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(748,2,3,15,'Hinju','MT.02/032','',30,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(749,2,3,15,'Kiwengulo','MT.02/082','',30,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(750,2,3,15,'Kilimahewa','MT.02/098','',30,1,'\0\0\0\0\0\0\0Ì⁄‘Sæö%¿ík‰ÕÙıC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(751,2,3,15,'Kitamabondeni','MT.02/035','',30,1,'\0\0\0\0\0\0\0÷†Bàn%¿\'—l1RﬁC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(752,2,3,15,'Kiyanga','MT.02/041','',30,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(753,2,3,15,'Majengo','MT.02/099','',30,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(754,2,3,15,'Mbambakofi','MT.02/071','',30,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(755,2,3,15,'Mbembaleo','MT.02/022','',30,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(756,2,3,15,'Migombani','MT.02/088','',30,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(757,2,3,15,'Mibobo','MT.02/050','',30,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(758,2,3,15,'Milangominne','MT.02/070','',30,1,'\0\0\0\0\0\0\0¿ó∏h€s%¿ÿˇ⁄‘SÍC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(759,2,3,15,'Miule','TEMP_0017','',30,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(760,2,3,15,'Mkahara','MT.02/101','',30,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(761,2,3,15,'Mnongodi','MT.02/027','',30,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(762,2,3,15,'Mnyahi','MT.02/045','',30,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(763,2,3,15,'Mnyawi','MT.02/031','',30,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(764,2,3,15,'Mtimbwilimbwi','MT.02/023','',30,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(765,2,3,15,'Mtopwa','MT.02/112','',30,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(766,2,3,15,'Mwang\'anga','MT.02/072','',30,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(767,2,3,15,'Nanjedya','MT.02/030','',30,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(768,2,3,15,'Namisangi','MT.02/106','',30,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(769,2,3,15,'Namkuku','MT.02/078','',30,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(770,2,3,15,'Namtumbuka','MT.02/024','',30,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(771,2,3,15,'Nang\'awanga','MT.02/040','',30,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(772,2,3,15,'Nanyamba','MT.02/021','',30,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(773,2,3,15,'Nanyamba      B','MT.02/093','',30,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(774,2,3,15,'Narunga','MT.02/113','',30,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(775,2,3,15,'Nitekela','MT.02/025','',30,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(776,2,3,15,'Niyumba','MT.02/089','',30,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(777,2,3,15,'Njengwa','MT.02/006','',30,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(778,2,3,15,'Nyahi','TEMP_0018','',30,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(779,2,3,15,'Nyundo      B','TEMP_0019','',30,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(780,2,3,15,'Nyundo      Ii','MT.02/026','',30,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(781,2,3,16,'Chitowe','MT.06/083','',31,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(782,2,3,16,'Chungu','MT.06/051','',31,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(783,2,3,16,'Lukula','MT.06/053','',31,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(784,2,3,16,'Lukwika','MT.06/054','',31,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(785,2,3,16,'Makanya','MT.06/070','',31,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(786,2,3,16,'Maneme','MT.06/118','',31,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(787,2,3,16,'Marumba','MT.06/176','',31,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(788,2,3,16,'Masuguru','MT.06/101','',31,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(789,2,3,16,'Mtambaswala','MT.06/218','',31,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(790,2,3,16,'Mbangara-Mbuyuni','MT.06/238','',31,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(791,2,3,16,'Mehiru','MT.06/235','',31,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(792,2,3,16,'Mitumbati','MT.06/187','',31,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(793,2,3,16,'Mtawatawa','MT.06/192','',31,1,'\0\0\0\0\0\0\0&S£í\Z&¿©§N@MC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(794,2,3,16,'Namaromba','MT.06/197','',31,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(795,2,3,16,'Namijati','MT.06/228','',31,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(796,2,3,16,'Nanderu','MT.06/091','',31,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(797,2,3,16,'Nanyumbu     I','MT.06/028','',31,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(798,2,3,16,'Nanyumbu     Ii','MT.06/152','',31,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(799,2,3,16,'Nauru','MT.06/137','',31,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(800,2,3,16,'Njisa','MT.06/126','',31,3,'\0\0\0\0\0\0\0&S£í\Z&¿¸\'Ya\rFC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(801,2,3,16,'Chivirikiti','MT.06/050','',32,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(802,2,3,16,'Holola','MT.06/173','',32,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(803,2,3,16,'Mikuva','MT.06/162','',32,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(804,2,3,16,'Mnanje','MT.06/163','',32,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(805,2,3,16,'Mtalikachau','MT.06/049','',32,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(806,2,3,16,'Nakole','MT.06/080','',32,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(807,2,3,16,'Nandete','MT.06/061','',32,3,'\0\0\0\0\0\0\0‰ÉûÕ™œ%¿WÏ/ª\'gC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(808,2,3,16,'Nandete      B','MT.06/231','',32,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(809,2,3,16,'Ngupe','MT.06/042','',32,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(810,2,3,16,'Ulanga','MT.06/137','',32,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(811,2,3,16,'Chikunja      Ii','MT.06/102','',33,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(812,2,3,16,'Kamundi','MT.06/035','',33,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(813,2,3,16,'Kilosa','MT.06/062','',33,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(814,2,3,16,'Lipupu','MT.06/136','',33,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(815,2,3,16,'Malema','MT.06/072','',33,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(816,2,3,16,'Mikangaula','MT.06/157','',33,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(817,2,3,16,'Nangaramo','MT.06/086','',33,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(818,2,3,16,'Mitimingi','MT.06/045','',33,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(819,2,3,16,'Mkambata','MT.06/196','',33,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(820,2,3,16,'Mkoromwana','MT.06/232','',33,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(821,2,3,16,'Mkwajuni','MT.06/191','',33,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(822,2,3,16,'Namatumbusi','MT.06/185','',33,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(823,2,3,16,'Nahimba','MT.06/006','',33,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(824,2,3,16,'Nawaje','MT.06/200','',33,1,'\0\0\0\0\0\0\0/›$°%¿L(£∑eMC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(825,2,3,16,'Chinyanyila','MT.06/227','',34,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(826,2,3,16,'Chipuputa','MT.06/096','',34,3,'\0\0\0\0\0\0\0q\n!˙»\0&¿»=õU3C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(827,2,3,16,'Chipuputa     B','MT.06/226','',34,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(828,2,3,16,'Kilimanihewa','MT.06/153','',34,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(829,2,3,16,'Magomeni','MT.06/194','',34,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(830,2,3,16,'Mangaka','MT.06/018','',34,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(831,2,3,16,'Mara','MT.06/116','',34,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(832,2,3,16,'Masyalele','MT.06/184','',34,3,'\0\0\0\0\0\0\0hÔÇõüµ%¿òŒ≠˝ä.C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(833,2,3,16,'Mkoma','MT.06/117','',34,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(834,2,3,16,'Mkumbaru','MT.06/109','',34,1,'\0\0\0\0\0\0\0±”rçå%¿z∏C∞óC@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(835,2,3,16,'Mnemeka','MT.06/169','',34,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(836,2,3,16,'Mnonia','MT.06/226','',34,1,'\0\0\0\0\0\0\0I.ˇ!˝∆%¿∑¬\ZT5C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(837,2,3,16,'Mpwahia','MT.06/106','',34,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(838,2,3,16,'Mtokora','MT.06/202','',34,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(839,2,3,16,'Muungano','MT.06/143','',34,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(840,2,3,16,'Mwambani','MT.06/129','',34,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(841,2,3,16,'Nachiura','MT.06/113','',34,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(842,2,3,16,'Nakatete','MT.06/126','',34,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(843,2,3,16,'Namasogo','MT.06/040','',34,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(844,2,3,16,'Nangomba','MT.06/022','',34,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(845,2,3,16,'Nanjisa','MT.06/142','',34,1,'\0\0\0\0\0\0\0&m{®˙%¿∫:&x0/C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(846,2,3,16,'Ndwika        Ii','MT.06/201','',34,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(847,2,3,16,'Rukumbi','MT.06/193','',34,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(848,2,3,16,'Sengenya','MT.06/195','',34,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(849,2,3,16,'Changwale','MT.06/219','',35,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(850,2,3,16,'Chigweje','MT.06/147','',35,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(851,2,3,16,'Chimika','MT.06/170','',35,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(852,2,3,16,'Kazamoyo','MT.06/198','',35,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(853,2,3,16,'Likokona','MT.06/052','',35,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(854,2,3,16,'Lumesule','MT.06/066','',35,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(855,2,3,16,'Makong\'ondera','MT.06/098','',35,1,'\0\0\0\0\0\0\0â˜	ç\r&¿)À«∫†C@',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(856,2,3,16,'Mburusa','MT.06/062','',35,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(857,2,3,16,'Mchenjeuka','MT.06/190','',35,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(858,2,3,16,'Michiga','MT.06/214','',35,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(859,2,3,16,'Michiga        B','MT.06/127','',35,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(860,2,3,16,'Likokona        B','MT.06/221','',35,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(861,2,3,16,'Mpombe','MT.06/036','',35,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(862,2,3,16,'Msinyasi','MT.06/154','',35,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(863,2,3,16,'Nakopi','MT.06/139','',35,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(864,2,3,16,'Namaka','MT.06/229','',35,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(865,2,3,16,'Nandembo','MT.06/074','',35,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0),(866,2,3,16,'Ndechela','MT.06/024','',35,2,'',0,0,'','2012-01-01 00:00:00','',0,0,0,0);
/*!40000 ALTER TABLE `schools` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_providers`
--

DROP TABLE IF EXISTS `service_providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_providers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_providers`
--

LOCK TABLES `service_providers` WRITE;
/*!40000 ALTER TABLE `service_providers` DISABLE KEYS */;
INSERT INTO `service_providers` VALUES (1,'UhuruOne'),(2,'Zantel');
/*!40000 ALTER TABLE `service_providers` ENABLE KEYS */;
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
-- Table structure for table `trcs`
--

DROP TABLE IF EXISTS `trcs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trcs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `trc_name` varchar(50) NOT NULL,
  `trc_code` varchar(10) NOT NULL,
  `status` varchar(2) DEFAULT NULL,
  `intervention_type_id` int(10) NOT NULL,
  `location` point DEFAULT NULL,
  `lat` decimal(17,14) DEFAULT NULL,
  `lon` decimal(17,14) DEFAULT NULL,
  `power_type_id` int(10) NOT NULL,
  `connectivity_type_id` int(10) NOT NULL,
  `warning` varchar(2) DEFAULT NULL,
  `install_date` datetime DEFAULT NULL,
  `access_instruction` text,
  `site_state_id` int(10) NOT NULL,
  `service_provider_id` int(10) NOT NULL,
  `road_type_id` int(10) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trcs`
--

LOCK TABLES `trcs` WRITE;
/*!40000 ALTER TABLE `trcs` DISABLE KEYS */;
INSERT INTO `trcs` VALUES (1,'Kitogani','TRC_0001','',0,'\0\0\0\0\0\0\0KìR–Ìe¿>≥$@M≈C@',NULL,NULL,0,0,'','0000-00-00 00:00:00','',0,0,0,0),(2,'Dunga','TRC_0002','',0,'\0\0\0\0\0\0\0¿ó∏h€s%¿ÿˇ⁄‘SÍC@',NULL,NULL,0,0,'','0000-00-00 00:00:00','',0,0,0,0),(3,'Bububu','TRC_0003','',0,'\0\0\0\0\0\0\0¿ó∏h€s%¿ÿˇ⁄‘SÍC@',NULL,NULL,0,0,'','0000-00-00 00:00:00','',0,0,0,0),(4,'Mkwajuni','TRC_0004','',0,'\0\0\0\0\0\0\0¿ó∏h€s%¿ÿˇ⁄‘SÍC@',NULL,NULL,0,0,'','0000-00-00 00:00:00','',0,0,0,0),(5,'Kiembesamaki','TRC_0005','',0,'\0\0\0\0\0\0\0¿ó∏h€s%¿ÿˇ⁄‘SÍC@',NULL,NULL,0,0,'','0000-00-00 00:00:00','',0,0,0,0),(6,'Michakaini','TRC_0006','',0,'\0\0\0\0\0\0\0¿ó∏h€s%¿ÿˇ⁄‘SÍC@',NULL,NULL,0,0,'','0000-00-00 00:00:00','',0,0,0,0),(7,'Mitiulaya','TRC_0007','',0,'\0\0\0\0\0\0\0¿ó∏h€s%¿ÿˇ⁄‘SÍC@',NULL,NULL,0,0,'','0000-00-00 00:00:00','',0,0,0,0),(8,'Wingwi','TRC_0008','',0,'\0\0\0\0\0\0\0¿ó∏h€s%¿ÿˇ⁄‘SÍC@',NULL,NULL,0,0,'','0000-00-00 00:00:00','',0,0,0,0),(9,'Mizingani','TRC_0009','',0,'\0\0\0\0\0\0\0¿ó∏h€s%¿ÿˇ⁄‘SÍC@',NULL,NULL,0,0,'','0000-00-00 00:00:00','',0,0,0,0),(10,'Luchingu','TRC_0010','',0,'\0\0\0\0\0\0\0¿ó∏h€s%¿ÿˇ⁄‘SÍC@',NULL,NULL,0,0,'','0000-00-00 00:00:00','',0,0,0,0),(11,'Kiuta','TRC_0011','',0,'\0\0\0\0\0\0\0¿ó∏h€s%¿ÿˇ⁄‘SÍC@',NULL,NULL,0,0,'','0000-00-00 00:00:00','',0,0,0,0),(12,'Mikumbi','TRC_0012','',0,'\0\0\0\0\0\0\0¿ó∏h€s%¿ÿˇ⁄‘SÍC@',NULL,NULL,0,0,'','0000-00-00 00:00:00','',0,0,0,0),(13,'Kitangari','TRC_0013','',0,'\0\0\0\0\0\0\0¿ó∏h€s%¿ÿˇ⁄‘SÍC@',NULL,NULL,0,0,'','0000-00-00 00:00:00','',0,0,0,0),(14,'Lengo','TRC_0014','',0,'\0\0\0\0\0\0\0¿ó∏h€s%¿ÿˇ⁄‘SÍC@',NULL,NULL,0,0,'','0000-00-00 00:00:00','',0,0,0,0),(15,'Chiungutwa','TRC_0015','',0,'\0\0\0\0\0\0\0¿ó∏h€s%¿ÿˇ⁄‘SÍC@',NULL,NULL,0,0,'','0000-00-00 00:00:00','',0,0,0,0),(16,'Luagala','TRC_0016','',0,'\0\0\0\0\0\0\0¿ó∏h€s%¿ÿˇ⁄‘SÍC@',NULL,NULL,0,0,'','0000-00-00 00:00:00','',0,0,0,0),(17,'Mwitika','TRC_0017','',0,'\0\0\0\0\0\0\0¿ó∏h€s%¿ÿˇ⁄‘SÍC@',NULL,NULL,0,0,'','0000-00-00 00:00:00','',0,0,0,0),(18,'Mwena','TRC_0018','',0,'\0\0\0\0\0\0\0¿ó∏h€s%¿ÿˇ⁄‘SÍC@',NULL,NULL,0,0,'','0000-00-00 00:00:00','',0,0,0,0),(19,'Mkomaindo','TRC_0019','',0,'\0\0\0\0\0\0\0¿ó∏h€s%¿ÿˇ⁄‘SÍC@',NULL,NULL,0,0,'','0000-00-00 00:00:00','',0,0,0,0),(20,'Lukuledi','TRC_0020','',0,'\0\0\0\0\0\0\0¿ó∏h€s%¿ÿˇ⁄‘SÍC@',NULL,NULL,0,0,'','0000-00-00 00:00:00','',0,0,0,0),(21,'Luagala','TRC_0021','',0,'\0\0\0\0\0\0\0¿ó∏h€s%¿ÿˇ⁄‘SÍC@',NULL,NULL,0,0,'','0000-00-00 00:00:00','',0,0,0,0),(22,'Mihambwe','TRC_0022','',0,'\0\0\0\0\0\0\0¿ó∏h€s%¿ÿˇ⁄‘SÍC@',NULL,NULL,0,0,'','0000-00-00 00:00:00','',0,0,0,0),(23,'Matogoro','TRC_0023','',0,'\0\0\0\0\0\0\0¿ó∏h€s%¿ÿˇ⁄‘SÍC@',NULL,NULL,0,0,'','0000-00-00 00:00:00','',0,0,0,0),(24,'Chikongola','TRC_0024','',0,'\0\0\0\0\0\0\0¿ó∏h€s%¿ÿˇ⁄‘SÍC@',NULL,NULL,0,0,'','0000-00-00 00:00:00','',0,0,0,0),(25,'Mchichira','TRC_0025','',0,'\0\0\0\0\0\0\0¿ó∏h€s%¿ÿˇ⁄‘SÍC@',NULL,NULL,0,0,'','0000-00-00 00:00:00','',0,0,0,0),(26,'Majengo','TRC_0026','',0,'\0\0\0\0\0\0\0¿ó∏h€s%¿ÿˇ⁄‘SÍC@',NULL,NULL,0,0,'','0000-00-00 00:00:00','',0,0,0,0),(27,'Mitengo','TRC_0027','',0,'\0\0\0\0\0\0\0¿ó∏h€s%¿ÿˇ⁄‘SÍC@',NULL,NULL,0,0,'','0000-00-00 00:00:00','',0,0,0,0),(28,'Libobe','TRC_0028','',0,'\0\0\0\0\0\0\0¿ó∏h€s%¿ÿˇ⁄‘SÍC@',NULL,NULL,0,0,'','0000-00-00 00:00:00','',0,0,0,0),(29,'Madimba','TRC_0029','',0,'\0\0\0\0\0\0\0¿ó∏h€s%¿ÿˇ⁄‘SÍC@',NULL,NULL,0,0,'','0000-00-00 00:00:00','',0,0,0,0),(30,'Nanguruwe','TRC_0030','',0,'\0\0\0\0\0\0\0¿ó∏h€s%¿ÿˇ⁄‘SÍC@',NULL,NULL,0,0,'','0000-00-00 00:00:00','',0,0,0,0),(31,'Nanyamba','TRC_0031','',0,'\0\0\0\0\0\0\0¿ó∏h€s%¿ÿˇ⁄‘SÍC@',NULL,NULL,0,0,'','0000-00-00 00:00:00','',0,0,0,0),(32,'Nanyumbu','TRC_0032','',0,'\0\0\0\0\0\0\0¿ó∏h€s%¿ÿˇ⁄‘SÍC@',NULL,NULL,0,0,'','0000-00-00 00:00:00','',0,0,0,0),(33,'Nandete','TRC_0033','',0,'\0\0\0\0\0\0\0¿ó∏h€s%¿ÿˇ⁄‘SÍC@',NULL,NULL,0,0,'','0000-00-00 00:00:00','',0,0,0,0),(34,'Mikangaula','TRC_0034','',0,'\0\0\0\0\0\0\0¿ó∏h€s%¿ÿˇ⁄‘SÍC@',NULL,NULL,0,0,'','0000-00-00 00:00:00','',0,0,0,0),(35,'Mangaka','TRC_0035','',0,'\0\0\0\0\0\0\0¿ó∏h€s%¿ÿˇ⁄‘SÍC@',NULL,NULL,0,0,'','0000-00-00 00:00:00','',0,0,0,0),(36,'Michiga','TRC_0036','',0,'\0\0\0\0\0\0\0¿ó∏h€s%¿ÿˇ⁄‘SÍC@',NULL,NULL,0,0,'','0000-00-00 00:00:00','',0,0,0,0),(37,'foo','',NULL,0,'\0\0\0\0\0\0\0›µÑ|–s%¿^K»=+@',-10.72620000000000,13.55320000000000,0,0,NULL,NULL,NULL,0,0,0,NULL);
/*!40000 ALTER TABLE `trcs` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER insert_location_trcs 
BEFORE INSERT ON trcs
FOR EACH ROW
BEGIN
	
	SET NEW.location = Point(NEW.lat, NEW.lon);
	
	
	
	
	
	
	
	
		
		
		
  	
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-08-17  9:47:32
