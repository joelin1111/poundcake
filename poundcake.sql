-- MySQL dump 10.13  Distrib 5.1.63, for debian-linux-gnu (i486)
--
-- Host: localhost    Database: poundcake
-- ------------------------------------------------------
-- Server version	5.1.63-0ubuntu0.10.04.1

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



DROP TABLE IF EXISTS `trcs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trcs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `trcs` WRITE;
/*!40000 ALTER TABLE `trcs` DISABLE KEYS */;
INSERT INTO `trcs` VALUES
(1,'BUBUBU'),
(2,'CHIKONGOLA'),
(3,'CHIUNGUTWA'),
(4,'DUNGA'),
(5,'KIEMBESAMAKI'),
(6,'KITANGARI'),
(7,'KITOGANI'),
(8,'KIUTA'),
(9,'LENGO'),
(10,'LIBOBE'),
(11,'LUAGALA'),
(12,'LUCHINGU'),
(13,'LUKULEDI'),
(14,'MADIMBA'),
(15,'MAJENGO'),
(16,'MANGAKA'),
(17,'MATOGORO'),
(18,'MCHICHIRA'),
(19,'MICHAKAINI'),
(20,'MICHIGA'),
(21,'MIHAMBWE'),
(22,'MIKANGAULA'),
(23,'MIKUMBI'),
(24,'MITENGO'),
(25,'MITIULAYA'),
(26,'MIZINGANI'),
(27,'MKOMAINDO'),
(28,'MKWAJUNI'),
(29,'MWENA'),
(30,'MWITIKA'),
(31,'NANDETE'),
(32,'NANGURUWE'),
(33,'NANYAMBA'),
(34,'NANYUMBU'),
(35,'WINGWI');

/*!40000 ALTER TABLE `trcs` ENABLE KEYS */;
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
INSERT INTO `connectivity_types` VALUES (1,'V - Vsat'),(2,'G - GSM'),(3,'P - P2P Wireless'),(4,'C - CDMA ');
/*!40000 ALTER TABLE `connectivity_types` ENABLE KEYS */;
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
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `districts`
--

LOCK TABLES `districts` WRITE;
/*!40000 ALTER TABLE `districts` DISABLE KEYS */;
INSERT INTO `districts` VALUES
-- Zanzibar areas
-- Pemba ID = 1
-- Unguja ID = 2
(1,'D-Central',1),
(2,'D-Chake Chake',1),
(3,'D-Micheweni',1),
(4,'D-Mkoani',1),
(5,'D-North \'A\'',2),
(6,'D-North \'B\'',2),
(7,'D-South',2),
(8,'D-Urban',2),
(9,'D-West',2),
(10,'D-Wete',2),
-- Mtwara areas
-- Mtwara ID = 3
(11,'D-Newala',3),
(12,'D-Masasi',3),
(13,'D-Tandahimba',3),
(14,'D-Mtwara DC',3),
(15,'D-Mtwara MC',3),
(16,'D-Nanyumbu',3);


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
INSERT INTO `intervention_types` VALUES
(1,'Bridge IT (B)'),
(2,'EMIS Only (E)'),
(3,'Mobile Lab (M)'),
(4,'Unknown (Bp)'),
(5,'Desktop Lab (?)'),
(6,'District Office (?)'),
(7,'Regional Office (?)');
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
INSERT INTO `areas` VALUES
-- Zanzibar ID = 2
-- Mtwara ID = 1
(1,'A-Pemba',1),
(2,'A-Unguja',1),
(3,'A-Mtwara',2);;
/*!40000 ALTER TABLE `areas` ENABLE KEYS */;
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
  `skype` varchar(255),
  `email` varchar(255),
  `trc_id` int(10),
  `school_id` int(10),
  `district_id` int(10),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES
(1,'Clark','Ritchie','+1 (503) 936-2575','clarkritchie','critchie@inveneo.org',5,4,NULL),
(2,'Andris','Bjornson','+1 (415) 205-7802','andris.bjornson','abjornson@inveneo.org',2,1,NULL),
(3,'Jen','Overgaag','+1 (805) 440-9423','wyojeno','jovergaag@inveneo.org',2,5,NULL);
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;


 -- 

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
-- Table structure for table `schools`
--

DROP TABLE IF EXISTS `schools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schools` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_name` varchar(50) NOT NULL,
  `school_code` varchar(10) NOT NULL,
  `location` point NOT NULL,
  `install_date` datetime DEFAULT NULL,
  `access_instruction` TEXT DEFAULT NULL,
  `catchment_id` int(10) NOT NULL,
  `area_id` int(10) NOT NULL,
  `district_id` int(10) NOT NULL,
  `trc_id` int(10) NOT NULL,
  `connectivity_type_id` int(10) NOT NULL,
  `intervention_type_id` int(10) NOT NULL,
  `site_state_id` int(10) NOT NULL,
  `service_provider_id` int(10) NOT NULL,
  `power_type_id` int(10) NOT NULL,
  `road_type_id` int(10) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  SPATIAL INDEX(location)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schools`
--

LOCK TABLES `schools` WRITE;
/*!40000 ALTER TABLE `schools` DISABLE KEYS */;
INSERT INTO `schools` VALUES
(2,'Chitandi','MT.04/008','\0\0\0\0\0\0\02•ñïsÀÞqŠŽäÒC@','01/01/2012','',2,1,3,12,4,4,3,2,2,2,NULL),
(3,'Julia','MT.04/091','\0\0\0\0\0\0\0gÕçj+vÀôÃáÑÒC@','01/01/2012','',1,1,6,5,2,6,1,2,2,2,NULL),
(4,'Karume','MT.04/014','\0\0\0\0\0\0\0R¸…ë±ÀÀ!T©ÙÓC@','01/01/2012','',1,1,14,7,1,2,7,1,1,1,NULL),
(5,'Chikoi','MT.04/005','\0\0\0\0\0\0\0}Ëœ.‹©ÀÚ|a2ÝC@','01/01/2012','',1,1,9,2,4,7,12,1,1,1,NULL),
(6,'Kunguni','MT.04/005','\0\0\0\0\0\0\0LÃð1…ÀÅÉýEÙC@','01/01/2012','',2,1,30,2,3,3,11,1,1,6,NULL),
(7,'Ngombeni A','MT.04/005','\0\0\0\0\0\0\0—wJ‡Àž^)ËƒC@','01/01/2012','',2,1,30,2,3,3,11,1,1,6,NULL),
(8,'Ngombeni B','AA.00/001','\0\0\0\0\0\0\0‚9zü¾À!<Ú8ÞC@','01/01/2012','',2,1,10,4,4,4,5,1,1,3,NULL),
(9,'Chokocho','BB.00/001','\0\0\0\0\0\0\0N—ÅÄæcÀKÍhâC@','01/01/2012','',2,1,1,5,1,1,4,1,2,4,NULL),
(10,'Butiama','MT.04/093','\0\0\0\0\0\0\0%#gaO›ÀçãÚP1ÒC@','01/01/2012','',1,1,6,5,2,2,6,1,1,1,NULL);
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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','c37948de525341d871f0550a1e0140752a95316a',1,'2012-07-18 20:09:51','2012-07-20 00:25:41'),
(2,'joe','acf16862470d5ca028de17722a5b72090d6259f4',1,'2012-07-18 21:52:44','2012-07-18 21:52:44'),
(3,'sue','ae1a12b6e634352e2a52bdc721da548b713f6cbb',2,'2012-07-18 21:56:14','2012-07-18 21:56:14'),
(4,'z
','b22cad3fb0a92d967353abbb3ef7399ca5a3034b',2,'2012-08-06 18:01:38','2012-08-06 18:01:38'),
(5,'zedit','6f0cfe47e87ae75ad5fd224e23656e546791b714',8,'2012-08-06 18:01:38','2012-08-06 18:01:38');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;


DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `rolealias` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES
(1,'admin','admin'),
(2,'View Only User','view'),
(3,'Inveneo','edit'),
(4,'Kicheko','edit'),
(5,'Creative Associates','edit'),
(6,'TZ MoE','edit'),
(7,'UhuruOne','edit'),
(8,'Zantel','edit'),
(9,'Agile Learning','edit'),
(10,'IYF','edit');

/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;





/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-07-20 17:06:07


DROP PROCEDURE IF EXISTS sp_nearby;

-- Switch delimiter so the ; will work in the function body
DELIMITER $$
-- Create the procedure
-- GLength returns in degrees -- so multiply by 111.2 for Kms (69 for miles)
CREATE PROCEDURE sp_nearby(school_id int(10), max_schools int(10))
    BEGIN 
        SELECT id, school_code, site_name, 
        111.2*(GLength(LineStringFromWKB(LineString(location,(select location from schools where ID=school_id)))))
		AS distance,
		X(location) as lat,
		Y(location) as lon
		FROM schools
		ORDER BY distance ASC
		-- limit 1 here to exclude the school we're getting a distance from
		LIMIT 1, max_schools; 
    END $$
-- Switch the delimiter back to ;
DELIMITER ;

-- call sp_nearby(3,7);