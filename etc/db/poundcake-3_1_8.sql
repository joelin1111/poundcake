-- MySQL dump 10.13  Distrib 5.5.29, for osx10.6 (i386)
--
-- Host: localhost    Database: poundcake
-- ------------------------------------------------------
-- Server version	5.5.29

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
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `antenna_types_radio_types`
--

DROP TABLE IF EXISTS `antenna_types_radio_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `antenna_types_radio_types` (
  `antenna_type_id` int(11) NOT NULL,
  `radio_type_id` int(11) NOT NULL,
  PRIMARY KEY (`antenna_type_id`,`radio_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `build_item_types`
--

DROP TABLE IF EXISTS `build_item_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_item_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `build_item_type_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `build_items_projects`
--

DROP TABLE IF EXISTS `build_items_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_items_projects` (
  `build_item_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) NOT NULL,
  PRIMARY KEY (`build_item_id`,`project_id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `configuration_templates`
--

DROP TABLE IF EXISTS `configuration_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuration_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `body` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `configuration_templates_projects`
--

DROP TABLE IF EXISTS `configuration_templates_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuration_templates_projects` (
  `configuration_template_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) NOT NULL,
  PRIMARY KEY (`configuration_template_id`,`project_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Table structure for table `contact_types`
--

DROP TABLE IF EXISTS `contact_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `title` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `skype` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `priority` int(10) DEFAULT '1',
  `organization_id` int(10) DEFAULT NULL,
  `install_team_id` int(10) DEFAULT NULL,
  `contact_type_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `equipment_spaces`
--

DROP TABLE IF EXISTS `equipment_spaces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipment_spaces` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `frequencies`
--

DROP TABLE IF EXISTS `frequencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frequencies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `frequency` int(10) NOT NULL,
  `radio_band_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `install_teams`
--

DROP TABLE IF EXISTS `install_teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `install_teams` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `project_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Table structure for table `ip_addresses`
--

DROP TABLE IF EXISTS `ip_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ip_addresses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` int(10) unsigned DEFAULT '0',
  `project_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ip_spaces`
--

DROP TABLE IF EXISTS `ip_spaces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ip_spaces` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) DEFAULT NULL,
  `lft` int(10) DEFAULT NULL,
  `rght` int(10) DEFAULT NULL,
  `name` varchar(255) DEFAULT '',
  `ip_address` int(10) unsigned DEFAULT '0',
  `cidr` int(11) DEFAULT NULL,
  `project_id` int(10) DEFAULT NULL,
  `gateway_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=870 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM AUTO_INCREMENT=398 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `monitoring_system_types`
--

DROP TABLE IF EXISTS `monitoring_system_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monitoring_system_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `network_interface_ip_spaces`
--

DROP TABLE IF EXISTS `network_interface_ip_spaces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `network_interface_ip_spaces` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `network_interface_type_id` int(10) NOT NULL,
  `if_number` int(10) NOT NULL,
  `network_radio_id` int(10) DEFAULT NULL,
  `network_router_id` int(10) DEFAULT NULL,
  `ip_space_id` int(10) DEFAULT NULL,
  `if_primary` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `network_interface_types`
--

DROP TABLE IF EXISTS `network_interface_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `network_interface_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `network_interfaces`
--

DROP TABLE IF EXISTS `network_interfaces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `network_interfaces` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `network_radios`
--

DROP TABLE IF EXISTS `network_radios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `network_radios` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `serial` varchar(255) DEFAULT NULL,
  `site_id` int(10) DEFAULT NULL,
  `network_switch_id` int(10) DEFAULT NULL,
  `network_router_id` int(10) DEFAULT NULL,
  `radio_type_id` int(10) DEFAULT NULL,
  `antenna_type_id` int(10) DEFAULT NULL,
  `elevation` decimal(3,2) DEFAULT NULL,
  `min_height` int(10) DEFAULT NULL,
  `frequency` int(10) DEFAULT NULL,
  `ssid` varchar(255) DEFAULT NULL,
  `p2mp` tinyint(1) DEFAULT '0',
  `switch_port` int(10) DEFAULT NULL,
  `router_port` int(10) DEFAULT NULL,
  `radio_mode_id` int(10) DEFAULT NULL,
  `sector` tinyint(1) DEFAULT NULL,
  `true_azimuth` double DEFAULT NULL,
  `mag_azimuth` double DEFAULT NULL,
  `snmp_override` tinyint(1) DEFAULT NULL,
  `snmp_type_id` int(10) DEFAULT NULL,
  `snmp_community_name` varchar(255) DEFAULT NULL,
  `configuration_template_id` int(10) DEFAULT NULL,
  `ip_address` int(4) DEFAULT '0',
  `node_id` int(10) DEFAULT NULL,
  `is_down` tinyint(4) DEFAULT NULL,
  `checked` datetime DEFAULT NULL,
  `foreign_id` varchar(255) DEFAULT NULL,
  `provisioned_on` datetime DEFAULT NULL,
  `provisioned_by` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=451 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER tr_network_radio_insert
BEFORE INSERT ON network_radios
FOR EACH ROW
BEGIN
	DECLARE next_id INT;
	DECLARE match_id INT;
	DECLARE link_to INT DEFAULT NULL;
	DECLARE done INT DEFAULT FALSE;
	
	
	
	DECLARE matching_ssids_cursor CURSOR FOR
	SELECT id
	FROM network_radios
	WHERE ssid = NEW.ssid
	AND ssid <> '';
	
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
	
	
	DELETE radios_radios.*
	FROM radios_radios
	LEFT JOIN network_radios ON
	radios_radios.src_radio_id = network_radios.id
	OR radios_radios.dest_radio_id = network_radios.id
	WHERE network_radios.ssid = NEW.ssid;
	   
	
	
	
	SET next_id = ( SELECT AUTO_INCREMENT FROM information_schema.TABLES WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='network_radios' );
	SET NEW.id = next_id;
	
	
	
	
	
	SET link_to = ( SELECT id FROM network_radios WHERE ssid = NEW.ssid AND p2mp > 0 LIMIT 1 );
	
	
	
	IF link_to > 0 THEN
		
		INSERT INTO radios_radios
		VALUES ( link_to, NEW.id, 'insert_case3' ),
		( NEW.id, link_to, 'insert_case4' );
	END IF;
	
	
	
	IF link_to IS NULL OR NEW.p2mp > 0 THEN
		SET link_to = NEW.id;		
	END IF;
	
	
	OPEN matching_ssids_cursor;
	matching_ssids_loop: LOOP
		FETCH matching_ssids_cursor INTO match_id;
		IF done THEN
        	CLOSE matching_ssids_cursor;
        	SET done = TRUE;
        	LEAVE matching_ssids_loop;
    	END IF;
        
		
		IF link_to != match_id THEN
			
			INSERT INTO radios_radios
			VALUES ( link_to, match_id, 'insert_case1' ),
			( match_id, link_to, 'insert_case2' );
		END IF;
		
	END LOOP matching_ssids_loop;
	
	
	SET @next_id = null;
	SET @match_id = null;
	SET @done = null;
	
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER tr_network_radio_update
BEFORE UPDATE ON network_radios
FOR EACH ROW
BEGIN
	
	DECLARE next_id INT;
	DECLARE match_id INT;
	DECLARE link_to INT DEFAULT NULL;
	DECLARE done INT DEFAULT FALSE;
	
	
	
	DECLARE matching_ssids_cursor CURSOR FOR
	SELECT id
	FROM network_radios
	WHERE ssid = NEW.ssid
	AND ssid <> ''
	AND id != NEW.id; 
	
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
	
	
	
	
	DELETE radios_radios.*
	FROM radios_radios
	LEFT JOIN network_radios ON
	radios_radios.src_radio_id = network_radios.id
	OR radios_radios.dest_radio_id = network_radios.id
	WHERE network_radios.ssid = NEW.ssid;
	
	
	
	
	
	SET link_to = ( SELECT id FROM network_radios WHERE ssid = NEW.ssid AND p2mp > 0 LIMIT 1 );
	
	
	
	IF link_to > 0 THEN
		
		IF link_to != NEW.id THEN
			
			INSERT INTO radios_radios
			VALUES ( link_to, NEW.id, 'update_case3' ),
			( NEW.id, link_to, 'update_case4' );
		END IF;
	END IF;
	
	
	
	IF link_to IS NULL OR NEW.p2mp > 0 THEN
		SET link_to = NEW.id;		
	END IF;
	
	
	OPEN matching_ssids_cursor;
	matching_ssids_loop: LOOP
		FETCH matching_ssids_cursor INTO match_id;
		IF done THEN
        	CLOSE matching_ssids_cursor;
        	SET done = TRUE;
        	LEAVE matching_ssids_loop;
    	END IF;
        
        
		IF link_to != match_id THEN
        	
			INSERT INTO radios_radios
			VALUES ( link_to, match_id, 'update_case1' ),
			( match_id, link_to, 'update_case2' );
		END IF;
		
	END LOOP matching_ssids_loop;
	
	
	SET @next_id = null;
	SET @match_id = null;
	SET @done = null;

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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER tr_network_radio_delete
BEFORE DELETE ON network_radios
FOR EACH ROW
BEGIN

	DELETE FROM radios_radios
	WHERE ( src_radio_id = OLD.id ) OR ( dest_radio_id = OLD.id );

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `network_routers`
--

DROP TABLE IF EXISTS `network_routers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `network_routers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `project_id` int(10) DEFAULT NULL,
  `serial` varchar(255) DEFAULT NULL,
  `router_type_id` int(10) DEFAULT NULL,
  `snmp_override` tinyint(1) DEFAULT NULL,
  `snmp_type_id` int(10) DEFAULT NULL,
  `snmp_community_name` varchar(255) DEFAULT NULL,
  `ip_address` int(4) DEFAULT '0',
  `node_id` int(10) DEFAULT NULL,
  `is_down` tinyint(4) DEFAULT NULL,
  `checked` datetime DEFAULT NULL,
  `foreign_id` varchar(255) DEFAULT NULL,
  `provisioned_on` datetime DEFAULT NULL,
  `provisioned_by` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `network_services`
--

DROP TABLE IF EXISTS `network_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `network_services` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `default` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `network_switches`
--

DROP TABLE IF EXISTS `network_switches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `network_switches` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `project_id` int(10) DEFAULT NULL,
  `serial` varchar(255) DEFAULT NULL,
  `switch_type_id` int(10) DEFAULT '1',
  `snmp_override` tinyint(1) DEFAULT NULL,
  `snmp_type_id` int(10) DEFAULT NULL,
  `snmp_community_name` varchar(255) DEFAULT NULL,
  `ip_address` int(4) DEFAULT '0',
  `node_id` int(10) DEFAULT NULL,
  `is_down` tinyint(4) DEFAULT NULL,
  `checked` datetime DEFAULT NULL,
  `foreign_id` varchar(255) DEFAULT NULL,
  `provisioned_on` datetime DEFAULT NULL,
  `provisioned_by` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `message` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `organizations`
--

DROP TABLE IF EXISTS `organizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organizations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `organizations_projects`
--

DROP TABLE IF EXISTS `organizations_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organizations_projects` (
  `organization_id` int(10) NOT NULL,
  `project_id` int(10) NOT NULL,
  PRIMARY KEY (`organization_id`,`project_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `power_types`
--

DROP TABLE IF EXISTS `power_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `power_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `volts` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_memberships`
--

DROP TABLE IF EXISTS `project_memberships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_memberships` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `role_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=151 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `default_lat` decimal(17,14) DEFAULT NULL,
  `default_lon` decimal(17,14) DEFAULT NULL,
  `secure_password` varchar(255) DEFAULT NULL,
  `insecure_password` varchar(255) DEFAULT NULL,
  `workorder_title` varchar(255) DEFAULT NULL,
  `datetime_format` varchar(255) DEFAULT NULL,
  `snmp_type_id` int(10) DEFAULT NULL,
  `snmp_community_name` varchar(255) DEFAULT NULL,
  `snmp_contact` varchar(255) DEFAULT NULL,
  `read_only` tinyint(1) DEFAULT NULL,
  `monitoring_system_username` varchar(255) DEFAULT NULL,
  `monitoring_system_password` varchar(255) DEFAULT NULL,
  `monitoring_system_type_id` int(10) DEFAULT NULL,
  `monitoring_system_url` varchar(255) DEFAULT NULL,
  `dns1` int(10) unsigned DEFAULT NULL,
  `dns2` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `radio_bands`
--

DROP TABLE IF EXISTS `radio_bands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `radio_bands` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `radio_modes`
--

DROP TABLE IF EXISTS `radio_modes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `radio_modes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `inverse_mode_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `radio_type_network_interface_types`
--

DROP TABLE IF EXISTS `radio_type_network_interface_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `radio_type_network_interface_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `network_interface_type_id` int(10) NOT NULL,
  `radio_type_id` int(10) NOT NULL,
  `number` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`network_interface_type_id`,`radio_type_id`,`number`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `radio_types`
--

DROP TABLE IF EXISTS `radio_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `radio_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `manufacturer` varchar(255) DEFAULT NULL,
  `radio_band_id` int(10) DEFAULT NULL,
  `watts` decimal(5,2) DEFAULT NULL,
  `value` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `radios_radios`
--

DROP TABLE IF EXISTS `radios_radios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `radios_radios` (
  `src_radio_id` int(10) NOT NULL,
  `dest_radio_id` int(10) NOT NULL,
  `notes` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Table structure for table `router_type_network_interface_types`
--

DROP TABLE IF EXISTS `router_type_network_interface_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `router_type_network_interface_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `network_interface_type_id` int(10) NOT NULL,
  `router_type_id` int(10) NOT NULL,
  `number` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`network_interface_type_id`,`router_type_id`,`number`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `router_types`
--

DROP TABLE IF EXISTS `router_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `router_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ports` int(10) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `manufacturer` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `watts` decimal(5,2) DEFAULT NULL,
  `value` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `site_state_icons`
--

DROP TABLE IF EXISTS `site_state_icons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_state_icons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `img_name` varchar(255) DEFAULT NULL,
  `img_type` varchar(255) DEFAULT NULL,
  `img_size` varchar(255) DEFAULT NULL,
  `img_data` mediumblob,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `site_states`
--

DROP TABLE IF EXISTS `site_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_states` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `sequence` int(10) DEFAULT NULL,
  `site_state_icon_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `code` varchar(10) DEFAULT NULL,
  `lat` decimal(17,14) DEFAULT NULL,
  `lon` decimal(17,14) DEFAULT NULL,
  `elevation` int(10) DEFAULT NULL,
  `elevation_source` varchar(255) DEFAULT NULL,
  `declination` decimal(17,14) DEFAULT NULL,
  `tower_guard` varchar(255) DEFAULT NULL,
  `install_team_id` int(10) DEFAULT '1',
  `install_date` datetime DEFAULT NULL,
  `zone_id` int(10) NOT NULL,
  `site_state_id` int(10) NOT NULL,
  `organization_id` int(10) DEFAULT NULL,
  `tower_type_id` int(10) DEFAULT NULL,
  `tower_member_id` int(10) DEFAULT NULL,
  `tower_mount_id` int(10) DEFAULT NULL,
  `equipment_space_id` int(10) DEFAULT NULL,
  `power_type_id` int(10) NOT NULL,
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
  `project_id` int(10) DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `is_down` decimal(3,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=398 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER tr_location_insert
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER tr_location_update
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER tr_location_delete
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
-- Table structure for table `snmp_types`
--

DROP TABLE IF EXISTS `snmp_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `snmp_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `switch_types`
--

DROP TABLE IF EXISTS `switch_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `switch_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ports` int(10) DEFAULT '8',
  `name` varchar(255) NOT NULL,
  `manufacturer` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `watts` decimal(5,2) DEFAULT NULL,
  `value` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temp`
--

DROP TABLE IF EXISTS `temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp` (
  `src` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tower_members`
--

DROP TABLE IF EXISTS `tower_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tower_members` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tower_mounts`
--

DROP TABLE IF EXISTS `tower_mounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tower_mounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tower_types`
--

DROP TABLE IF EXISTS `tower_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tower_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `uploads`
--

DROP TABLE IF EXISTS `uploads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uploads` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` char(36) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `filesize` int(11) DEFAULT NULL,
  `filemime` varchar(255) DEFAULT NULL,
  `filedata` mediumblob,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `admin` tinyint(1) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `project_id` int(10) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `ip_address` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Dumping routines for database 'poundcake'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_add_link_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `sp_add_link_id`(src int(10), dest int(10))
BEGIN 
        UPDATE network_radios
        SET link_id = src
        WHERE id = dest;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_count_antennas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `sp_count_antennas`(site_id int(10))
BEGIN 
		SELECT sites.code, antenna_types.name, count(*) AS "count"
		FROM sites, network_radios, antenna_types
		WHERE sites.id = network_radios.site_id
		AND network_radios.antenna_type_id = antenna_types.id
		AND sites.id=site_id
		GROUP BY antenna_type_id;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_count_radios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `sp_count_radios`(site_id int(10))
BEGIN 
        SELECT sites.code, radio_types.name, count(*) AS "count" 
		FROM sites, network_radios, radio_types
		WHERE sites.id = network_radios.site_id
		AND network_radios.radio_type_id = radio_types.id
		AND sites.id=site_id
		GROUP BY radio_type_id;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_remote_links` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `sp_get_remote_links`(radio_id int(10))
BEGIN 
    	SELECT dest_radio_id,
    	network_radios.name,
    	network_radios.ssid,
    	network_radios.is_down,
    	network_radios.frequency,
    	radio_modes.name AS "radio_mode_name"
    	
		FROM radios_radios, network_radios, radio_modes
		WHERE src_radio_id = radio_id
		AND network_radios.id = dest_radio_id
		AND network_radios.radio_mode_id = radio_modes.id;
		
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ip_range` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `sp_ip_range`( id int(10) )
BEGIN
    DECLARE v_num_usable INT;
    DECLARE v_cidr INT;
    DECLARE v_counter INT UNSIGNED DEFAULT 0;
    DECLARE v_ip INT UNSIGNED;
    
    SELECT cidr,ip into v_cidr,v_ip FROM ip_spaces WHERE ID = id;
    insert into tmp3(mydata) values (v_cidr);
	insert into tmp3(mydata) values (v_ip);
	
	
	
	
	
	
	
	
	
	
	
	WHILE v_counter < v_num_usable DO
    	
    	
    	
    	SET v_counter = v_counter + 1;
  	END WHILE;
  	
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_rm_link_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `sp_rm_link_id`(radio_id int(10))
BEGIN 
        UPDATE network_radios
        SET link_id = NULL
        WHERE id = radio_id;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_schedule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `sp_schedule`(install_team_id int(10))
BEGIN
		SELECT sites.id, sites.code, sites.install_date, sites.name, install_teams.name
		FROM sites, install_teams
		WHERE sites.install_team_id = install_team_id
		AND install_teams.id = install_team_id
		ORDER BY sites.install_date ASC;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_touch_all_radios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `sp_touch_all_radios`()
BEGIN
	DECLARE all_done INT DEFAULT FALSE;
	DECLARE z CHAR(16);
  	DECLARE a, b INT;
  	DECLARE cur1 CURSOR FOR SELECT id,site_id FROM poundcake.network_radios;
  	DECLARE CONTINUE HANDLER FOR NOT FOUND SET all_done = TRUE;

  	OPEN cur1;

  	read_loop: LOOP
    	FETCH cur1 INTO a, b;
    	IF all_done THEN
    	  	 LEAVE read_loop;
  	  	END IF;
    	UPDATE poundcake.network_radios
    	SET site_id = b
    	WHERE id = a;
  	END LOOP;

  	CLOSE cur1;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-08-30 10:10:55
-- MySQL dump 10.13  Distrib 5.5.29, for osx10.6 (i386)
--
-- Host: localhost    Database: poundcake
-- ------------------------------------------------------
-- Server version	5.5.29

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
-- Table structure for table `site_states`
--

DROP TABLE IF EXISTS `site_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_states` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `sequence` int(10) DEFAULT NULL,
  `site_state_icon_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_states`
--

LOCK TABLES `site_states` WRITE;
/*!40000 ALTER TABLE `site_states` DISABLE KEYS */;
INSERT INTO `site_states` VALUES (20,1,'Decommissioned',7,3),(23,1,'Ready to Decommission',6,1),(18,1,'Deactivated',5,3),(16,1,'Power Complete',2,5),(15,1,'Active',4,2),(21,1,'Planned',1,6),(24,1,'Minor Repair Required',8,7),(25,7,'Preliminary',1,5),(26,4,'Verified',10,5),(27,4,'Confirmed',11,6),(28,4,'Approved',12,2),(29,4,'Rejected',13,7),(30,3,'Planned',1,6),(31,9,'Decommissioned',1,3),(32,8,'Planned',1,6),(33,4,'Partial Survey',9,4),(34,4,'Pending Design Review',14,1),(37,10,'Prospective',1,5),(36,4,'Canceled',15,3),(38,10,'Selected for Survey',2,4),(39,10,'Survey Complete',3,NULL),(40,10,'Active',5,2),(41,10,'Canceled',6,3),(42,10,'Planned',4,6),(43,3,'Active',2,2),(44,3,'Decommissioned',3,3),(45,3,'Minor Repair Required',4,7),(46,10,'Approximate',1,4),(47,15,'Preliminiary',1,5),(48,15,'Survey Complete',2,6),(49,15,'Active',3,2),(50,15,'Repair Required',4,7),(51,1,'Preliminary',1,5),(52,7,'Active',2,2),(53,7,'Rejected',3,1),(54,16,'Active',1,NULL),(55,16,'Repair Required',2,NULL),(56,17,'Preliminary',1,NULL),(57,17,'Planned',2,NULL),(58,17,'Active',3,NULL),(59,18,'Active',3,2),(60,19,'New',1,5),(61,20,'Preliminary',1,1),(62,20,'Confirmed',2,4),(63,20,'Power Complete',3,5),(64,20,'Active',4,2),(65,20,'Pending Design Review',5,3),(66,21,'Survey Complete',1,1),(67,21,'Active',2,2),(68,21,'Minor Repair Required',3,5),(69,22,'Active',2,2),(70,23,'Prelliminary',1,1),(71,23,'Survey Complete',2,4),(72,23,'Active',3,2),(73,23,'Repair Required',4,5),(74,24,'Planned',1,6),(75,24,'Active',2,2),(76,24,'Decommissioned',3,3),(77,24,'Minor Repair Required',4,7),(78,8,'Active',2,2);
/*!40000 ALTER TABLE `site_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_state_icons`
--

DROP TABLE IF EXISTS `site_state_icons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_state_icons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `img_name` varchar(255) DEFAULT NULL,
  `img_type` varchar(255) DEFAULT NULL,
  `img_size` varchar(255) DEFAULT NULL,
  `img_data` mediumblob,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_state_icons`
--

LOCK TABLES `site_state_icons` WRITE;
/*!40000 ALTER TABLE `site_state_icons` DISABLE KEYS */;
INSERT INTO `site_state_icons` VALUES (1,'wifi_drkblue.png','image/png','1919','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0 \0\0\0%\0\0\0#��G\0\0FIDATX���kl������ه_��Z�1nKJQ�c��P���Q�JB�&�\"���$T|\"����*AD��%)^�h\ZQ����1.�l��ٝ��~؝��wm�葎��ޙ���{�ܝ#ض\r��U�d@��(�h-X@����s\0�mێ��W\n\0�#�\n\0Y@/x���;\'�B!G\\�Q���:�b�1�R-�+���#�d�P�\n- \'�B!_A�:��m@T4$E}��fV�ʦH�$�\\�����(Zyq۲��0DC� �\"�K���P+�X��(IS�eS�t��Sg�L>׎�֦�۶��1�$Ҩ���Z�ٵ�/gi}B���˱w�XJA��\"+���GǝB+V�<C�a��4����j��:����:�\\|�E�͛���d9|8E�@��� �Ǎ \n%w�ќR��_l�&����͍�}{��?�J��2�9��ȑ$7jTTȴ�*tt�ذa��Bm5�*o9��+��$�Ć�,{R���\Z�_��+������tt���c��>���Ä�:�ns�D-��iDnF0��I1gP\\�K���SI[���{c<����ex�U��sX���ҥn�^��}�7ވ�Z��C%?\\$1:4�K��1�,�\\\nl�&:�W[�,]�����8�����U�G��b��se�{�ˍ9-r�m[Y�?r�@5+V��\Zx|J��H��b�L~�k?7n�س\'����wW�X��Z��?�hj�9r���[����x��8��iV���p���FR�+K�M����֦0����i��L�l�2o�̞=1n�2��zl��`PdӦ�]3x�u?��&\0x�Y��^6S\0�_����Z[dY�����ذA��i��GS����x�������g�\\��67.dX��M2n��P4�F���w�h�@M���@��k=�K�,Qhj�������I�������\nP��/e��۷M\0��%b1��wM��e|>�����/�4B,f�������M�`PBFF,�F�\0�\\�?�`�r]�3g�<��JS�D8�/mnv�Zlܨ�u���_fhi�ݹs�_ڦ�q�ח��u�+�TW�|p8�W�zzR����D,��D�|3��]����b�AUv��LZ�9���)+3�$�\n�v�(q�P��\Z��>��S&]d,��W|TU���P�$�N?%�i��ʕ*�N�ܺe\"��b�e�]~&�q�jQ�p�: �re�����޽A02D�|�y˲9t(A$����Ř3��q�����D��<��q\\n+�f��\0\0�0H0��ΝQ�m���S��5x�i>�L��z�b�);^\n`�$��Z▋`�Yqq��\n[��O���ؘ#�`��T};��x��	�T�i���\0�����☊�2�V�ʶ��ˬY����]��oߣ�5��he����S��|�b�\Z�����o�U�dec��fp�,4��G�\0<�� �0���#IC����Y 1�|\0�)�Mp윎�_�T�%���B��ybe#��E��۷G�:\0�78yZ+��d�xx5e��% �N�Q�W1�0,ܾ���ں1Z�}�8���jjf�|z��IƒWN�?qO\'�N9_���%�B!��LӘ������ե�����1Ο,9WhL�\0Q ��N�]r�����w��%�w�����j^<��q�\'���o�t�z���w]\\��|�4ĵ�q��AB��%L������3:pZ8�ui������Wz����AB����t�<�t{>��T�u�+@|�f}�!�.��ɱAB����D�uG���P�w]Z��\0N����!��\0% �������z`��B+���%����h�	NQ:���eF��J�DB\Z�\0\0\0\0IEND�B`�'),(2,'wifi-green.png','image/png','2017','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0 \0\0\0%\0\0\0#��G\0\0�IDATX���yl��s���x����6׎�J\0�\ZP��\n\"@ZB�ҔF1i�I��DUڪ$�H��5G��i�*R		)I^5A\"`R�2���/lc��{̞�?���xc��ҫo滞�=���t]���ZD�oen�D�buuu\0A�u�X�j�ox,N hq\r���E��i���=�Z��x@��\'ކ+-q���\Z���<AJj���1 2��jG��xy��4UF��^�|�-5��%����0>�,\0vUA���n��G���QDI����$�$�F�JO#�\"KҤ��V���j�(3kC���I�u]\'���f�B!���V�9�Walq�L#\"�JOC1M6¦&���4z�.%�=-�=���������*��M_L�R�L�Nκ��f�fZG��Y�i�ic�ÁjVŔI4�LI�ޥ�:^-���~f��xd���[��#&N���*#69�\n{mᥳ�<Ѐ#;�l�=��+&���/�G�\Z�Ҷ�g�~O�m�����{\'���,g5G�?a0��s�⮬����\0�7?���CT�U��:s�y�3���Z�*�2��׎�Q�����|��<X�$g�G9?R�$ȼ|�	������l�[�{�h���QH��!�u���A��x�of.gߕ?�Q׻T;�o��\"Zi=E�R���7��]�Զ�]Mې�W����ﲭ�>��6E��m�H4�#3��/p���w�m.��ҝ�F�����\Z<@��������t�[�{������<@IZ%þ2,�sa�_d��,��i*�K)��rd��j�|��i�-�콴��`�N�z�N�)��6q��_�{�vlr&����޼����ľSh�\Zh�\Z�\rtRa�Be:|�X%�;�����>�X���w��.�+1Ͼ�&O\03��M�;%Ct]�\"��m(ԏET�0��h`e���ܹ�%[������ӣ(�����TR�$�k�>\0\n,��E=�C�R˱J6^��%1������P��\n��`��\\DA�D��0�D\Z=_�(k%���)��ܕ��S	�r�}�g��Fܬ��H��,�Gꙓ��3�G�o�H�!E�j�����������-�Ӵx.��{�!?��\"6�~�=�;x��ҥ̢��g�-����(���)�D$D$�	I�g��d�rع�C\Z<��̳�h,ƺ��pd�Y!�����Ӂ�<P��%��s��a�=�V9����\"f2�-��z��@;��$I$4!����\Z��� ###�X���>�M�п��1>�y��4��dIy\'��,\\�n祛i��u��4c�*�!V�AE��MEO��{�����nQi>Ϯ���_;Da����L�IL��d(-(D1i�ZQL&��y��1��\n�w  ��G�#�A{��y9d��MO�d�2�]QmπY�e���w����8\0�Z��?����Ҋ�S߂�L�EPS�UoU��i�F�l\'���_\0�)�H�X����֊D#��i��b?~���7z�`,���9o���S��s��47{*�c��8%����&�6ː�!��8�k�[���TW,Ǧ�q�������hbm�f\Zc��,L���{�*s�\\�\0<� f�J��>aq8\Z���s�}�D�,M�-���,%�S>�l��R��7a��?��4^�8fLp:�f�dr���9w9������Fi鿄��Xұxa������r�x�0�4\\5��$L�u����j��c��:��2����Lb�R�&��;j\\\'�VTSYP�������(�u.abn�.N�(ύv|�v���5�/��\0~��\"\Z?��ֹ(n������7�81cyb��8�a�z��\\��_���Z��8�7���J�$������uz�\r\0컰߰��4�o�@�8���s/c�u���\"p	5���\Zb����O��8FR\ZG�8b����,�rn(\0\0\0\0IEND�B`�'),(3,'wifi_grey.png','image/png','2012','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0 \0\0\0%\0\0\0#��G\0\0�IDATX���{PT��?ܻ���O`E�JeE$�W��C⳶I�I��Ĩ��8I��L��iM�f�M�M�f�v�Զ)����M0Z�H\0y(\n��c��뾷p�\\VdƜ�3�������;���{���(\0EEE:@\0���Z�\0 RYYH�F����U7�\0�=��\0��z���2�TXX���:�|1�\n�Vǀ�KYOw�yk��(��M�� 42�Fw����p`2�0\Z��TXQ�^/---5V�)5\r#O�X-	�#��`�@ �(�(�DQD��III!\n���g�l1#�����L�1�kͱ��qG�Q�~?CCCD�9V�W�����ȲL�ǧ!\n�p���$��Έ�c�\ZjMĸ}>��.,V3�\n��S�㘃ݞʴ��h�od}�:���8Yq���6f͚ŤI���/������y��F�x=^�]�Fzz:[�mf�W����E���u������c2�pdgQRZ��~����V�L�BJJJ\"�X(F�8�8���Cv���y��/Ϧ�R3��O���(�¢%�||���~���yyx�G/q�7�O�1N�tǂ�Q@�7o��yr������w��y���d6l,��x=��5p��	Qٿ�UV�Y�S�~�gw?CG{���ș��0�\0j\n��(�\'����;��e�-;�굫��c�� I\\n��=����O�t�2;s���\0�(������]���~L&��h�n��`0Ȧ�q:����HMM��\'���r���r擳\0dL�`���M�tuu��#�n�\Z\n0s֗�b��	�N�N�C�*���&#c*5�������b�&�q使���OyE�eXmV^��~��w���[1�L;z��˖�r�b�p����m���8qd;E���NdYf���\\����Կ(*^{f�s;q�8��?ʱ����ɦ�����Q�Jl�q4�F�H��kЅ$KX�nt�\0`كKcs�YdLˠ��\0�=��M$Ao0���e	DQd``\0���Q�\n.���ӧ!�2���k���_yEQȿ/���7�ڬ����&))i�\0z���K�\0,��%���zr�r��>��k	�\0L�1��ˊUr��*�\Z��r����a��k���$Itvt��}���y�-f*NTr��\nW._a����>%�G�:x��>�{Lf��m۷���������\" �  I�(Rq�����_z�����d�p��\rE�OI�����9��Y��\ZX�n5�����y���1\Z��u�ub�m6ǎ~���\\�vQ	��������u�\\�zn\'~��B�Z\"���O��d)��\0z�>��4;~��}?�o<�$K(�²�\"����X������=�\0��B���v���=Grr2�,�ּ��j@�ӏ:���D���x���n�KW  oa\0IIIx=^fΜIG{\'3f��j���-����<��utww���X��������ARR�xbǷx��;�@Z�=��fq)0H���t����؎|>&����#�>@8N�F�Db\0��I\0�P����2���g��8{z���Ȳ��]O�y�&�fL����L�x��h\0�����\Z7�`0���Juտy��Cx<֮[��l����7�8DWw7�%��4�����ۏ�:>o�|\0�!t=6���A��(�M�MFJJKb���a�٨�k@�e|>�sG��\\.�CCکOՌ$\Z\03��\Z��kW��5g�X�n�������ژ8�A��E��p���4�l����t��#�qG�������M��KZ}�ޚ����4��oxw��\\Ɇb���S��R\'�W`��1��7����8�};���R�͟7J����c�`���Ww��y$�����L���\nQ�i�F��������e�X�|Uܣ�OJd�$�0����l�@��e��=L@��ƀ���\0-�����\'p�Qu��&�p蕉�O`�V�ګ��b����j�%���\0\0\0\0IEND�B`�'),(4,'wifi_ltblue.png','image/png','1905','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0 \0\0\0%\0\0\0#��G\0\08IDATX���[l��s���f}�`���ph�MI�(UV�DmIӨ�H�izy��>�)}p�JI��(i��U+U��(�n�R\Z�q(|]{/�sٙ���.{�-�#}:�sΜ��|�o��0`�Ν2 j����V�������aE\\���@�M�A�vd���@IH��qHF����6`٨w+��#�����÷Y����������N��xj��櫓��4���\n�E���(^&�߻	���OPc���  (���� �x��(���LP*�\'��(Is�M_�b�o%�D���9W<C|�ñ���J�g�\"p�r�N�����;$�\"YQEOƐe^��ϊU�\Z�0w�W���X+��j�i5T��TZ\r�΄�{O���a���C��Z\ZQ5\rA�g�Y�s\"}��0q���)�x�+I�J�\"�ph�ᵏ<�ʤ.&ӝRٻ.Σ�Nptt\ZR��Z\0s��x B�S�ܿL��z6ի�txe(ρk6Y/`W���˓�}~�m6k��@�;��ϗ2蚂��5�$\ZU�n�\\�����lo�x�?Yv�q�o��sjw_Xipo��WV�<qx���f�\r���z6\'%&ǦP����=�!ә�Z��&�ߜ˱�|�/����;�0$�2.m�̋�b|R(��N�;G3�\"����}��x�\\C��5\nE���y�+�\'�ϟɲxns7�Ǧ��\r����k;\Z�vg��\\�_���DG�GZ6&��-��\0s�P6�谽Ae]\\f��\"�,����Xi�<&�H�\'��N���FM���&8���ц����Cy\0>�f�/��u8�/��)Y8=��]erp����__���Rw���K�r��2�4�N�\0�ߤQp��T[b���1�ǔ\Z4���\0=mFu궔����P�<�jHL8>~�KD���Zm\0I�Z��ݔ�z�OWB&.�}�:�k�\'�z�]Q�t�-�FMB&�\0����\0�I��u�\0��<Ь�F��Q��\0�J(L{��291��I���rн3��J�K�4NgK\\�{<Ԭ�RE~w!ǳ\'�|4��f��B��tc7��Ȳ�\\]��	\n��C�6h���o	EI��\Z4�?���[>}�d� ����\'���b�7�y쟑x|����u\\�)���q�m���L�$�<��b�Ĺl	Q�P\\D���u\0LK����Bw#8�@��A���<IES��gB}�$�.�t����s��*��:�Udw��(��\\��:u^�\\\'�����r��WOy����܄\"��8���(��5�S\Z�8��0r�,O�5\Z�u�tǚ�;�Ȳ���5H,oD���8sn��*��\Z�Yf��r\n��3Zlc�Q�zns?�p����\0	��pu�7_0��6��x�Q��ȶm���㔏볟*ǅ�{5ר偠\nP�`�~�Y���7`Y�o�rƑ�q4����~W�.S �-���~����,#,��b�|��\"J]�7ώ����o9ܳi-��0t5�3�2���<�>Iќw#�(o�֔�^.�\0�eaH�	�����i�I����c[V�h0ddb�@�+��r��ת�;��t:�q��[&��젽%5�Мv��GN\r�;&c�4��x��\\.U��٥�0H߻�\0kZo\r��HY<��{_t�_7�f6,�8�f����co頳���)�&�߻�c�vq�@y^�+p�`O��G�����!�^��o�&��{w���s�\r0y~����$A��}w#��W�x��0���-�x>2�\"T�-P\">��w�gk\0�Tw�g	��\"A*�<O9�-�$�� ��*��.e�[K_2�,�JPV�j刹K���f��\0\0\0\0IEND�B`�'),(5,'wifi_orange.png','image/png','1982','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0 \0\0\0%\0\0\0#��G\0\0�IDATX���kl������]���v,��8��`�\0j7Z5!DQJQC��I�V���C>T��F�#Q��D\"(�T�$D(M�S�6�\ro��`����zwvvw�<���c����ܙ{���?�Ν#X�@cc����nen�e\00\0���% X��w\0N�6���6�m7ZZZ2BCCC�x����GH\0Q�5r�t��eM���[<Ś#\rk�K�L���hm�	yq�e�ڭ@OfH�eh�hmo�4�a�ar�9\\ͥ�8�i�d�Y��,�(�\'\r$ID�%��,E>7�lI�����2��m.�D��X�ͣMlYi#M\"�$�S�D��/��Ud��F2�F1�x�n��Eh���y�\\�D��ӥO�b�:ig5EK7��*ѪW �*Q�3�Ն���轧9��˝�V��:U��FsL���,��X������u��s��@�1���xI��Z���ڝ����=���p���䥘b�0?��22A�_O��~����d�Q��A��AL=�g�F�\'? 3�G�#���ς�����g�|�ũ�jΛ\'���_ƆIge�����f5��������?����u&y�H2_�y��G��n3󶾂��H�*B�\n��`,�\"\ZS��)���lC���o�6�7=��h�W�D�W���2��e��u��}\ZA�����}��?��02�.����1������\\f��%o�_ ��꾟��\0\0���?|���~�1�A��?�_�8EKD����� �g�\\��� 9$�DW�j�EDO~@z���O������H��Q�ˢn���ҳ�1R	n�%��\'���\0-�z,��wV��cd��a���_� ɤ�� �|�\"~�#�y��{v��Tm{�t����^E�W�YM��\0�E��I����J g�e!:�㖉\r (.dw	F�\0�[��j�W�(\rav\0��*���XfQqb��3ZA�$��^�00S������\"�z�ٙ��=? ���c\0��+H� �(���a�E$�}\0w�~��N�⧸C�!�o\'~��tz�ۮ��b&G�-����#h�+\0�<<��\n>RU�H�R�Nܵ�\\\"�{Я� q�4�叐@	VQ��_s�����+�Av��Lc���������\n�CA���v#�K�~b/�����#f�$P�#��*{�BBw�8�>f��w=��v=��I���������y�x�D�x#܅q��,��DJ�\Z0baFGG���gR)�!~��X��p�nkYuN�;[y�]p0�3�շ63�{�K%�0p�mBEN>-��o���=�����v1���}ۉ����\n/�C-���s`I���(��J�¹�],^��|\"T-��f/����y��`e	Z�놻`��:�ޡ��6|5�,��F\0�vY���P��\0�o~�k6QS�\0Oq�S0g�s@q�D�u���t]GҼ�R)\0��\r\0�Xx�\n�yfx	��d�%����{$	:^\\�0r�T\nTU`�֗	��rI-�(���l�7s2��d2�V�.��b�ޣ�}w\'ɱ,��z.7�K������9J귣�������X<w�ǔ�(�t�D<� khޢ�H�65���e�YβV��X��)%�ي�zH���N��H�S�[��4�����ܠ0Y���`M͌Z^o��n���f|f&��)�3^.a\r�K3����_���}э�/u���Fs�a�ݕ˯�K30o�8���7Z���o$��vf��t|�Bs�a%Ss�pq:Ky�k\'�o\'B�7-�\n�q��C�iXn�2��f.�od61\'�y�I�}k����x��O>�9��M<n��*d�(@��h=j�>\0-��Vg�7M`^��q �8��u��s\"p	����`\\��\\��L`�\\R�jn�s�b�B��y\0\0\0\0IEND�B`�'),(6,'wifi_pink.png','image/png','1890','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0 \0\0\0%\0\0\0#��G\0\0)IDATX���Yl\\W�w_f��x�v��8&�&B�4\r���E5�P��\nP)B)f)ey���ʃ+!�P�������B�V��(J)�bҘ�Y���df<˝�_f�ĉ=I,�#}:W��{����,�E\0{��P��̭->.NMM�\0BE��\n�MS�\0�-�\0.`7͝���\\.��@G����x�,�ܬ�x�zS�wlz��X��2��t�1|!��%�������!L�Đ�[*\\l��b�>�dn|P\0��OH����(���CDl�AE$Q&}Rz� �Diſ��#@�g�Lc�c��V�GQ�xXN�@�`C��/P{�%�K%J����`wԑ�*I=�\"++�1�V�-�8�Z�.�z��S�*D�.�:�Jj��: a�(,�ݡ���w].����l��tU�aUoƚ+�DQ��8��Ͱ��2�\r+B��x�a��\Z�M�N��.�u�|�@��c��!M2�h�rE�7QQ(�H�#1<�Eb�J����U��m�rHz�A��e����_t�y��\'^�2��\"�^*��\n���X����Ԫ���Ɵuѱ[���e�ݻ�қ뾑��ב��A��\Z�_6�y�2�~T�/�l�e�\'%��D�>o�Q�T��?���n��~Ua�`��������E[/3�L��Or��*\"Ȱ�F�������{�m�5� \nX�X\n���٧ʨ��Ov�Cf�W��l\0�M2[_�a��)�Y��?���p�����\n�zju��S`���*��e��8g�=�@� s�2�|�h4�h4���y(�u�����柫��y�z�n;+\0��\r��y�v��@���>`R|�f�w�_K��y6�=�ѳ��2��\Z�c.\0��hx����\r�!��fo1@4�	��@f���6u���I�>�h�$�|@D��@D�N�=���{1ht8(�C�K�f))p�@����W�����5v:�|���$/\"�v3j��P>�\0�u�Nh��������8m�y\0�f��}Ф��G��ɝ�	_z�A����@C�:�S��Gר����\nsO��|�������X�?� r��˜?XA�6|?EP)����\0�<&YAB��5�����Z@uB&C���s}�щ\"`�5J/{8�$z2�O�p�ƙ0Dc�qw��;aJI2�\\��)���>�(�(6\"\"}{:p�>KKKly:��CT)���_�\"UM���PXv\Z��$�R���*�O�1�zP�{��(��.�Q�ºGuv??¹o�E7T��{��J�m�zIi��\Z\0d$��,JE��$Qd���\'���@�}\"..�}jc˟VX��;5Ȧ2�����H�>\0��Ҫ��edd�{��h4�����q��d\'����� \0I�l+��1`���EjTj�ȶm��i,׏=шO�����a��\rt�T�\n{^ފeY۵@8#��	*��I��)���J�Lw׍�\0�2�٘���B�N��3�,p���8l�k�T�4[d��\"�L��#D����֪��cKS�J�dX��`���\Z\"�B|�G��\0B�,w���j�=��#S;\"%�Z�l�jXU�m-��\n�\\N�@�IL���w0��/�-�g�8:�j[31YJ@5��M#]���婙06=�7A�ލׇX<��̍��*��kS3o&9m��Ǧ\'��z�}#�C,�,�7�̍��ձ�>9�Az�1�96=�������r5�3�c27~Gs��</X==�^i��4�$لxg۾!��7 ./0�����ۛ�զٱP�rC�6ɱ鉷�������WY��M��фx��J#�nZ|M\0�@�M�X��뭵��`D��R����q��ؕ��\n\r�\0\0\0\0IEND�B`�'),(7,'wifi_red.png','image/png','1903','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0 \0\0\0%\0\0\0#��G\0\06IDATX���[lT�\Z��:{�L/N崤)��	K�9$��i!���J�)�B��`���$&���1>���	zL�.V�J5J�s�3{���a���z�Yɗ�f�^��[���Z��`ݺu2 �[���R\0l ؽ��\0�qO\\4�T@�G���򽽽!�x�:P��\Z�@H�uޛ��������(ݑȿܦ\r�H$t�C=���]�$�\n�Eƶ�f�D�7�����\0tU-+n;�mcZ� �3MDQDE\n�M��a�6�8;t4Y˂l��L�)��gh>߬Ύ�`Z�\\SӰ-BX�����--�� �/�$[Y��H�4yviS�&5�\'S�%:L��i�_���������e�2r?�@`�V��ϓ9t����P��\"BIoz��զ8�C.��f,��T�؁��Ld�\\_�Ç�7oF��Bmi!�����M�8s���6��\0�9�D<�@Z���C�tvb������Zs3]]���3����5k0�Q�`��c�7���[֌1�����J�1U�������Jb����ɝ>M����ŋ�7nķj�3�0��I�����q���Ez�anNL�(�Ը�Ϸ�8�C2\'��K�V�\"��G���\'���T�܉���?{�����R�ze�rb���L��O	�����6�B��/�e��4��P�};��WI�ލ�p!U�va�b�_{\r㫯�]�.���a*^~����> �ى�z��&2��ZQQ��������=�52B`�6�E�H�ލ5:J��P�8��0�[�`R���դ\0����T�%�\r��������҂ ˘� ��M�N���3��??�%�o��0�}����𵶒?s\0���X���wp����56���H55._.�lÆ)��\\��t)��!\0��Z��q�B�4�r\"sH�u�Z�]_��H`ݸ��؈r��k�����N$Оx���_H�0�$a��S�(�@r�˴5k�0����=�8,^��b�f���F�x}�f�s����#js3\0�ӧ�����\n�����\r1\"��\'�gϒ��|O=�16�RWG��osk�No�	�0��Q�����4F_�7`9�\'�\"�H@��A��\Zj����	�l�&��T�� (\niU�<r��Q�-[�֮�8ykt�(�o\'aPQH8@��e\n���$���T�[@a|�[�n޳� �b��ǶI<�\Z�!�|�8	5m�TU��8Ɏ���h�BֲP;:E�aA 	h۶���y�UT���E��>����,�4DE�V�d�@�*J2I0F�e.��R�}�������s�)��m��݇���WT�i�\\W��\0P�\r^=�� ��v\0����בx\0��]�����/Y�^���^fǀ�����R[���@��$���y\0S�ʏS������u�!��p���1��!]��Or�^\0��Fҩ��\0�P\\��4�p�_1\"P�(\\?v�|W9�bɣ���:��!b;v`��+�[��?^r�F:�5\'5e��% �σߏ��l�&����?gd���t\0�+�kj�O�DH��T��3�S����OW�\"��\n�j�HL\ZZ[	�ח�kV�92�p��&�1 �<�%/i����\0=���(\n�ŋ��r���~�#������=53\0�n���o��h����k	-[VZ|p��S��DV23��\'�wHϽڃ�{�џ֯\'��C3�/]b��o�Dqg��t����\\��(�IЅ8���A���(>0���tG\"+\\�k�\'T���D�\'\Z����*\Z>~ܛy�y��5@	�J�\'�[���k�y����ݯy����G|�\0� ����������/A\\\0���p\0\0\0\0IEND�B`�');
/*!40000 ALTER TABLE `site_state_icons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `switch_types`
--

DROP TABLE IF EXISTS `switch_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `switch_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ports` int(10) DEFAULT '8',
  `name` varchar(255) NOT NULL,
  `manufacturer` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `watts` decimal(5,2) DEFAULT NULL,
  `value` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `switch_types`
--

LOCK TABLES `switch_types` WRITE;
/*!40000 ALTER TABLE `switch_types` DISABLE KEYS */;
INSERT INTO `switch_types` VALUES (1,8,'8-Port DC Switch','h3c','JD316A',15.00,500.00),(2,16,'16-Port DC Switch','h3c','JD314A',16.00,500.00),(3,24,'24-Port DC Switch','h3c','JD315A',17.00,500.00),(4,8,'8-Port AC Switch','h3c','JD318A',15.00,500.00),(5,16,'16-Port AC Switch','h3c','JD319A',16.00,500.00),(6,24,'24-Port AC Switch','h3c','JD320A',17.00,500.00);
/*!40000 ALTER TABLE `switch_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tower_types`
--

DROP TABLE IF EXISTS `tower_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tower_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tower_types`
--

LOCK TABLES `tower_types` WRITE;
/*!40000 ALTER TABLE `tower_types` DISABLE KEYS */;
INSERT INTO `tower_types` VALUES (1,1,'Freestanding'),(2,1,'Guyed'),(3,9,'Freestanding'),(4,4,'ALIN Container, Std 10m mast'),(5,4,'Freestanding, 15m'),(6,4,'Freestanding, 20m'),(7,4,'Freestanding, 25m'),(8,4,'Freestanding, 30m'),(9,4,'Freestanding, 35m'),(10,3,'Roofmount Pole, 2m'),(11,3,'Freestanding'),(12,10,'Freestanding, 20m'),(13,15,'Freestanding Tower'),(14,15,'CKC'),(15,16,'Freestanding Tower'),(16,16,'School'),(17,20,'Freestanding'),(18,21,'Small Office CSO'),(19,21,'Regional CKC'),(20,21,'Direct Care Site');
/*!40000 ALTER TABLE `tower_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tower_mounts`
--

DROP TABLE IF EXISTS `tower_mounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tower_mounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tower_mounts`
--

LOCK TABLES `tower_mounts` WRITE;
/*!40000 ALTER TABLE `tower_mounts` DISABLE KEYS */;
INSERT INTO `tower_mounts` VALUES (1,'Existing Standoffs'),(2,'Beam Clamps'),(3,'Custom Standoffs');
/*!40000 ALTER TABLE `tower_mounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tower_members`
--

DROP TABLE IF EXISTS `tower_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tower_members` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tower_members`
--

LOCK TABLES `tower_members` WRITE;
/*!40000 ALTER TABLE `tower_members` DISABLE KEYS */;
INSERT INTO `tower_members` VALUES (1,'L-Bar'),(2,'Round Bar');
/*!40000 ALTER TABLE `tower_members` ENABLE KEYS */;
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

--
-- Table structure for table `power_types`
--

DROP TABLE IF EXISTS `power_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `power_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `volts` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `power_types`
--

LOCK TABLES `power_types` WRITE;
/*!40000 ALTER TABLE `power_types` DISABLE KEYS */;
INSERT INTO `power_types` VALUES (6,'Other',0),(2,'Solar',0),(3,'120VAC',120),(4,'220VAC',220),(5,'-48VDC',-48),(7,'+24VDC',24);
/*!40000 ALTER TABLE `power_types` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `antenna_types`
--

LOCK TABLES `antenna_types` WRITE;
/*!40000 ALTER TABLE `antenna_types` DISABLE KEYS */;
INSERT INTO `antenna_types` VALUES (1,'16 dBi AirMax Sector'),(2,'30 dBi RocketDish'),(3,'34 dBi RocketDish'),(4,'17 dBi AirMax Sector'),(5,'20 dBi AirMax Sector'),(6,'25 dBi Grid Antenna'),(7,'22 dBi NanoBridge Antenna (integrated)'),(8,'25 dBi NanoBridge Antenna (integrated)'),(9,'16 dBi NanoStation Antenna (integrated)'),(10,'38dBi / 33dBi AirFiber antennas (integrated)'),(11,'26dBi PowerBridge Antenna (integrated)');
/*!40000 ALTER TABLE `antenna_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `antenna_types_radio_types`
--

DROP TABLE IF EXISTS `antenna_types_radio_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `antenna_types_radio_types` (
  `antenna_type_id` int(11) NOT NULL,
  `radio_type_id` int(11) NOT NULL,
  PRIMARY KEY (`antenna_type_id`,`radio_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `antenna_types_radio_types`
--

LOCK TABLES `antenna_types_radio_types` WRITE;
/*!40000 ALTER TABLE `antenna_types_radio_types` DISABLE KEYS */;
INSERT INTO `antenna_types_radio_types` VALUES (1,1),(1,7),(2,1),(2,7),(3,1),(3,7),(3,10),(4,1),(4,7),(5,1),(5,7),(6,9),(7,2),(8,2),(9,3);
/*!40000 ALTER TABLE `antenna_types_radio_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `build_item_types`
--

DROP TABLE IF EXISTS `build_item_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_item_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `build_item_types`
--

LOCK TABLES `build_item_types` WRITE;
/*!40000 ALTER TABLE `build_item_types` DISABLE KEYS */;
INSERT INTO `build_item_types` VALUES (1,'Consumable'),(2,'Electrical'),(3,'Mechanical'),(4,'Other');
/*!40000 ALTER TABLE `build_item_types` ENABLE KEYS */;
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
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `change_logs`
--

LOCK TABLES `change_logs` WRITE;
/*!40000 ALTER TABLE `change_logs` DISABLE KEYS */;
INSERT INTO `change_logs` VALUES (1,'1.0.0','        Release Notes - Poundcake - Version 1.0\r\n        \r\n<h2>        Bug\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-20\'>PC-20</a>] -         Delete school does not delete associated files\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-23\'>PC-23</a>] -         School map should center on school&#39;s GPS coordiantes\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-26\'>PC-26</a>] -         Edit District\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-34\'>PC-34</a>] -         Cascade Ajax events on select of Catchment/Area/Region on add/edit District view\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-52\'>PC-52</a>] -         Formatting of school listing on the view TRC page\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-60\'>PC-60</a>] -         UI on final page of paginated results\r\n</li>\r\n</ul>\r\n    \r\n<h2>        Improvement\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-18\'>PC-18</a>] -         GPS data validation\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-84\'>PC-84</a>] -         Move location to separate lat/lon float fields, MySQL trigger to make slave column for spatial data storage\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-85\'>PC-85</a>] -         Power field\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-86\'>PC-86</a>] -         List Contact Type\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-90\'>PC-90</a>] -         Site States and icon colors for overview map\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-91\'>PC-91</a>] -         default state icon is orange\r\n</li>\r\n</ul>\r\n        \r\n<h2>        New Feature\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-1\'>PC-1</a>] -         District Contact Info\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-2\'>PC-2</a>] -         Create person contact type\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-3\'>PC-3</a>] -         Add access instructions to school detail page\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-4\'>PC-4</a>] -         Add install date field\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-6\'>PC-6</a>] -         Search nearby feature\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-7\'>PC-7</a>] -         &quot;install team&quot; object\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-8\'>PC-8</a>] -         School search\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-10\'>PC-10</a>] -         Ajax select for Area, District on create new school\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-11\'>PC-11</a>] -         Update Google Map Helper on School Detail page\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-12\'>PC-12</a>] -         Remove Rajib Ahmed&#39;s Google map helper\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-14\'>PC-14</a>] -         Hierarchy of organizational units\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-15\'>PC-15</a>] -         Need final Catchment/Area/District matrix\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-17\'>PC-17</a>] -         Apache configuration\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-19\'>PC-19</a>] -         Add/edit school field-level vlidation\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-25\'>PC-25</a>] -         TCs/TRCs in a District\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-29\'>PC-29</a>] -         Re: TC/TRC staff\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-30\'>PC-30</a>] -         look into MapBox\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-37\'>PC-37</a>] -         Add top-level menu item for TC/TRCs\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-38\'>PC-38</a>] -         Add top-level menu item for Contacts\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-39\'>PC-39</a>] -         Permissions layer\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-41\'>PC-41</a>] -         add email field to Contact model\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-48\'>PC-48</a>] -         escape &quot;/&quot; on school code search\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-50\'>PC-50</a>] -         Add nearby schools to map on school detail page\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-51\'>PC-51</a>] -         Redirect logged in users\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-54\'>PC-54</a>] -         User edit of user details\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-61\'>PC-61</a>] -         Use virtual fields for User, Contact\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-62\'>PC-62</a>] -         drop InstallationState in favor of SiteState\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-63\'>PC-63</a>] -         virtual fields + displayField\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-64\'>PC-64</a>] -         Sort of TRCs on Contact edit\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-65\'>PC-65</a>] -         Sort of Districts on Contact edit\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-82\'>PC-82</a>] -         Replace Catchment/Area/District with Zones\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-89\'>PC-89</a>] -         Add NetworkRouter type\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-92\'>PC-92</a>] -         switch/index - sort alphabetically\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-93\'>PC-93</a>] -         radio/index - sort alphabetically\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-94\'>PC-94</a>] -         router/index - sort alphabetically\r\n</li>\r\n</ul>\r\n    \r\n<h2>        Question\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-27\'>PC-27</a>] -         Remove View for simple objects on admin page\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-28\'>PC-28</a>] -         Policy regarding Users\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-36\'>PC-36</a>] -         Region\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-87\'>PC-87</a>] -         Jérémie Aéroport\r\n</li>\r\n</ul>\r\n        \r\n<h2>        Task\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-21\'>PC-21</a>] -         Customize Cake&#39;s default error messages for missing controllers, views, etc.\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-22\'>PC-22</a>] -         Need partner logos for UI\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-24\'>PC-24</a>] -         Style CSS for AjaxMultiUpload plugin\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-31\'>PC-31</a>] -         Add Ajax on Catchment, Area selects to Add/Edit of School\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-32\'>PC-32</a>] -         Add Catchment, Area selects to Add/Edit of Region + Ajax update\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-33\'>PC-33</a>] -         Add Ajax on Catchment, Area selects to Add/Edit of District\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-35\'>PC-35</a>] -         School contacts\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-40\'>PC-40</a>] -         Review School model from Andris&#39; spreadsheet\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-42\'>PC-42</a>] -         Style CSS for Jquery calendar\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-43\'>PC-43</a>] -         Add school code to School search\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-44\'>PC-44</a>] -         Add Contact search\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-45\'>PC-45</a>] -         Add TC/TRC search\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-46\'>PC-46</a>] -         GPS Radius Search\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-53\'>PC-53</a>] -         Re-skin UI with Matt&#39;s CSS\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-66\'>PC-66</a>] -         Add new frields to views for TC/TRC model\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-68\'>PC-68</a>] -         Move map display code (for School, TRC view pages) into common file\r\n</li>\r\n</ul>\r\n    \r\n<h2>        Sub-task\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-16\'>PC-16</a>] -         Need final Catchment/Area/District matrix\r\n</li>\r\n</ul>\r\n','2012-09-13 00:00:00'),(2,'1.1.0','        Release Notes - Poundcake - Version 1.1\r\n                    \r\n<h2>        New Feature\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-111\'>PC-111</a>] -         Dynamically add up to 10 Radios with valid AntennaTypes on Site add/edit\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-112\'>PC-112</a>] -         Dynamically add 1 Switch on Site add/edit\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-113\'>PC-113</a>] -         Dynamically add 1 Router on Site add/edit\r\n</li>\r\n</ul>\r\n                \r\n- Bugfixes','2012-09-18 00:00:00'),(3,'1.2.0','        Release Notes - Poundcake - Version 1.2\r\n        \r\n<h2>        Bug\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-121\'>PC-121</a>] -         Add label for Contact type on Contact add/edit\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-122\'>PC-122</a>] -         Allow punctuation in passwords\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-124\'>PC-124</a>] -         GPS lat/lon not displaying on Site Edit\r\n</li>\r\n</ul>\r\n    \r\n<h2>        Improvement\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-101\'>PC-101</a>] -         make towerdb aware of equipment lists\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-105\'>PC-105</a>] -         poundcake should know about installation teams\r\n</li>\r\n</ul>\r\n        \r\n<h2>        New Feature\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-125\'>PC-125</a>] -         Make radio on Site Add/Edit default to RocketM5\r\n</li>\r\n</ul>\r\n                ','2012-09-20 00:00:00'),(4,'1.3.0','        Release Notes - Poundcake - Version 1.3\r\n        \r\n<h2>        Bug\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-131\'>PC-131</a>] -         Revisit sort of SwitchType in SwitchType controller getSwitchTypes()\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-132\'>PC-132</a>] -         Datepicker CSS needs more visible &lt;&lt; and &gt;&gt; buttons\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-134\'>PC-134</a>] -         Rename Radio does not fully disconnect previous link\r\n</li>\r\n</ul>\r\n    \r\n<h2>        Improvement\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-117\'>PC-117</a>] -         Make frequency a select list\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-129\'>PC-129</a>] -         add &quot;switchport number&quot; field to radios\r\n</li>\r\n</ul>\r\n        \r\n<h2>        New Feature\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-115\'>PC-115</a>] -         can towerdb be aware of how a site is &quot;wired&quot;\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-119\'>PC-119</a>] -         Link Radios\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-126\'>PC-126</a>] -         flash messages on Site Save\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-130\'>PC-130</a>] -         Add SwitchType\r\n</li>\r\n</ul>\r\n                ','2012-09-24 00:00:00'),(5,'1.4.0','        Release Notes - Poundcake - Version 1.4\r\n            \r\n<h2>        Improvement\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-102\'>PC-102</a>] -         towerdb integration with addrpool\r\n</li>\r\n</ul>\r\n        \r\n<h2>        New Feature\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-136\'>PC-136</a>] -         Create custom validation rule on NetworkRadio to ensure name is unique\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-138\'>PC-138</a>] -         Override HTML Helper\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-139\'>PC-139</a>] -         Default radio to RocketM5\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-140\'>PC-140</a>] -         Pull name as well as IP address on addrpool integration\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-143\'>PC-143</a>] -         Add Search on Radios\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-145\'>PC-145</a>] -         New fields for Site object\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-146\'>PC-146</a>] -         Radio codes can be 5 or 6 characters\r\n</li>\r\n</ul>\r\n    \r\n<h2>        Question\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-118\'>PC-118</a>] -         Unit for link distance\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-135\'>PC-135</a>] -         Format validation on radio name?\r\n</li>\r\n</ul>\r\n            \r\n<h2>        Sub-task\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-106\'>PC-106</a>] -         true/magnetic azimuth calculation\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-120\'>PC-120</a>] -         Link Distance\r\n</li>\r\n</ul>\r\n','2012-09-27 00:00:00'),(6,'1.5.0','        Release Notes - Poundcake - Version 1.5\r\n        \r\n<h2>        Bug\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-152\'>PC-152</a>] -         See if ExcelwriterXML supports embedding images\r\n</li>\r\n</ul>\r\n    \r\n<h2>        Improvement\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-104\'>PC-104</a>] -         towerdb should know how to print workorders\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-150\'>PC-150</a>] -         Round Azimuths on Work Order\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-151\'>PC-151</a>] -         See if ExcelwriterXML supports page breaks for clean printing\r\n</li>\r\n</ul>\r\n        \r\n<h2>        New Feature\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-147\'>PC-147</a>] -         Radio - Station or Access Point\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-149\'>PC-149</a>] -         Add Projects\r\n</li>\r\n</ul>\r\n            \r\n<h2>        Task\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-144\'>PC-144</a>] -         Open up port to reach MySQL on BOUTL-RADIUS\r\n</li>\r\n</ul>\r\n    \r\n<h2>        Sub-task\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-154\'>PC-154</a>] -         Add RouterType\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-155\'>PC-155</a>] -         Add Manufacturer, Model to SwitchType\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-156\'>PC-156</a>] -         Add minimum height to NetworkRadio\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-157\'>PC-157</a>] -         Create top-level Projects, with User HABTM Projects relationship\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-158\'>PC-158</a>] -         Create Site belongsTo Project relationship\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-159\'>PC-159</a>] -         Filter Site find results to just those Site that correspond to the Projects for a User\r\n</li>\r\n</ul>\r\n','2012-10-02 00:00:00'),(7,'1.6.0','        Release Notes - Poundcake - Version 1.6\r\n        \r\n<h2>        Bug\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-169\'>PC-169</a>] -         switch view displays &quot;ports&quot; multiple times\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-172\'>PC-172</a>] -         print workorder on HDO386 Fails\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-173\'>PC-173</a>] -         towerdb is suggesting wrong board in equipment list for HDO386\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-176\'>PC-176</a>] -         Workorder prints all technical contacts in system rather than restricting by tower owner\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-179\'>PC-179</a>] -         Azimuths and other empty values in workorder\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-180\'>PC-180</a>] -         BOUTL addrpool data showing up for HDO386?\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-188\'>PC-188</a>] -         Not all contacts are on install teams\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-192\'>PC-192</a>] -         Cant associate an existing site with an existing switch or router\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-197\'>PC-197</a>] -         Workorder populates erroneous IP info when no addrpool data is found\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-199\'>PC-199</a>] -         Verify that all SD* and HD* sites are owned by digicel\r\n</li>\r\n</ul>\r\n    \r\n<h2>        Improvement\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-162\'>PC-162</a>] -         Edit user w/o modifying password\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-198\'>PC-198</a>] -         left justify remote management vlan field\r\n</li>\r\n</ul>\r\n        \r\n<h2>        New Feature\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-164\'>PC-164</a>] -         Find a radio&#39;s gateway from addrpool\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-177\'>PC-177</a>] -         Ordered list of technical contacts\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-183\'>PC-183</a>] -         Add distance between sites\r\n</li>\r\n</ul>\r\n                ','2012-10-16 00:00:00'),(8,'1.7.0','        Release Notes - Poundcake - Version 1.7\r\n        \r\n<h2>        Bug\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-168\'>PC-168</a>] -         display degree symbol for elevation on radios\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-194\'>PC-194</a>] -         Notes section on xml workorder doesn&#39;t handle long text lines\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-203\'>PC-203</a>] -         Lost Sites\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-207\'>PC-207</a>] -         DLPCH-SDH010 linked to SDH010-DLPCH\r\n</li>\r\n</ul>\r\n    \r\n<h2>        Improvement\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-181\'>PC-181</a>] -         Change &quot;Inveneo Site install Workorder&quot; to &quot;HRBN Site Install Workorder&quot;\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-184\'>PC-184</a>] -         Show &quot;tower owner&quot; value on summary contact page\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-195\'>PC-195</a>] -         Rename four field labels on workorder template\r\n</li>\r\n</ul>\r\n        \r\n<h2>        New Feature\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-166\'>PC-166</a>] -         click legend icons on map to go to filtered search\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-167\'>PC-167</a>] -         thumbnails for images\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-174\'>PC-174</a>] -         Can equipment list calculate number of lightning arrestors \r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-185\'>PC-185</a>] -         Title field for contacts\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-189\'>PC-189</a>] -         print priority value before contact names on tower view?\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-190\'>PC-190</a>] -         add serial number field to radios, routers, and switches\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-202\'>PC-202</a>] -         can site states know their order?\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-205\'>PC-205</a>] -         Look into tool tips\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-210\'>PC-210</a>] -         Categorize build items\r\n</li>\r\n</ul>\r\n    \r\n<h2>        Question\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-186\'>PC-186</a>] -         should email and phone be mandatory for contact types\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-187\'>PC-187</a>] -         Maybe &quot;tower owners&quot; should be called &quot;organizations&quot;\r\n</li>\r\n</ul>\r\n            \r\n<h2>        Sub-task\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-163\'>PC-163</a>] -         Create project-level meta-data\r\n</li>\r\n</ul>\r\n','2012-10-25 00:00:00'),(9,'2.0.0','        Release Notes - Poundcake - Version 2.0\r\n        \r\n<h2>        Bug\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-204\'>PC-204</a>] -         Site Search\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-211\'>PC-211</a>] -         Allow for empty default values\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-213\'>PC-213</a>] -         allow underscores in usernames\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-214\'>PC-214</a>] -         change password not working\r\n</li>\r\n</ul>\r\n    \r\n<h2>        Improvement\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-178\'>PC-178</a>] -         how to handle azimuth for sector antennas\r\n</li>\r\n</ul>\r\n        \r\n<h2>        New Feature\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-148\'>PC-148</a>] -         Revisit all date formatting\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-165\'>PC-165</a>] -         Add polylines to maps to show links in-between sites\r\n</li>\r\n</ul>\r\n    \r\n<h2>        Question\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-160\'>PC-160</a>] -         Does poundcake allow point-to-multipoint?\r\n</li>\r\n</ul>\r\n            ','2012-11-06 00:00:00'),(10,'2.1.0','        Release Notes - Poundcake - Version 2.1\r\n        \r\n<h2>        Bug\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-161\'>PC-161</a>] -         Prevent empty site page for site outside project code\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-215\'>PC-215</a>] -         Admin change password\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-220\'>PC-220</a>] -         Make Save on Radio/Edit return to Radio/View\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-221\'>PC-221</a>] -         Map not drawing for specific site\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-222\'>PC-222</a>] -         Site/Edit should show orgs for current project only\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-223\'>PC-223</a>] -         Switching Project creates null entry in users table\r\n</li>\r\n</ul>\r\n    \r\n<h2>        Improvement\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-219\'>PC-219</a>] -         Sort sites on Quick Stats \r\n</li>\r\n</ul>\r\n        \r\n<h2>        New Feature\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-217\'>PC-217</a>] -         Can towerdb keep tower owners separate by project?\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-218\'>PC-218</a>] -         Separation of sites in different projects\r\n</li>\r\n</ul>\r\n                ','2012-11-14 00:00:00'),(11,'2.1.1','\r\n        Release Notes - Poundcake - Version 2.1.1\r\n        \r\n<h2>        Bug\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-224\'>PC-224</a>] -         Add Switch creates invisible switch without site or project\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-225\'>PC-225</a>] -         Quick stats on Site/View is not filtering sites to current project\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-226\'>PC-226</a>] -         Overview map not filtering sites by project id\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-227\'>PC-227</a>] -         Edit radio should filter switches to current project\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-232\'>PC-232</a>] -         azimuth (true and magnetic) not displayed on view page for sector\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-234\'>PC-234</a>] -         View of multipoint radio\r\n</li>\r\n</ul>\r\n    \r\n<h2>        Improvement\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-233\'>PC-233</a>] -         sort radios in site view and on workorder by switchport order?\r\n</li>\r\n</ul>\r\n        \r\n<h2>        New Feature\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-229\'>PC-229</a>] -         sort switch port list by port number\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-230\'>PC-230</a>] -         Add search to router index listing\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-231\'>PC-231</a>] -         Add search to switch index listing\r\n</li>\r\n</ul>\r\n                ','2012-11-20 00:00:00'),(12,'2.2.0','        Release Notes - Poundcake - Version 2.2\r\n        \r\n<h2>        Bug\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-238\'>PC-238</a>] -         New sites not getting project_id\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-239\'>PC-239</a>] -         &quot;Editor&quot; cannot save files\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-240\'>PC-240</a>] -         Removing a user&#39;s permission should clear or reset last accessed project_id\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-242\'>PC-242</a>] -         Undefined offset on View sector radio\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-245\'>PC-245</a>] -         true/mag azimuth has mag azimuth displayed incorrectly on radio view\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-249\'>PC-249</a>] -         Drop down menu doesn&#39;t work on Site/View\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-250\'>PC-250</a>] -         Upgrade Jquery, Bootstrap\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-251\'>PC-251</a>] -         Fatal error:  Allowed memory size of 201326592 bytes exhausted\r\n</li>\r\n</ul>\r\n            \r\n<h2>        New Feature\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-191\'>PC-191</a>] -         allow user to import and export .kml files for site GPS coordinates\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-243\'>PC-243</a>] -         Make work order show .xml in link?\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-248\'>PC-248</a>] -         Search Sites on multiple states\r\n</li>\r\n</ul>\r\n                \r\n<h2>        Sub-task\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-236\'>PC-236</a>] -         KML import\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-237\'>PC-237</a>] -         KML export\r\n</li>\r\n</ul>\r\n','2012-12-06 00:00:00'),(13,'2.2.1','\r\n        Release Notes - Poundcake - Version 2.2.1\r\n        \r\n<h2>        Bug\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-253\'>PC-253</a>] -         Site search by name not working\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-254\'>PC-254</a>] -         Radio:  True Azimuth not editable when Sector checked\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-258\'>PC-258</a>] -         Sites from other projects appear in main listing\r\n</li>\r\n</ul>\r\n            \r\n<h2>        New Feature\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-252\'>PC-252</a>] -         Make radio/router/switch search default to wildcard on end\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-255\'>PC-255</a>] -         Min height default value of 20\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-256\'>PC-256</a>] -         Log last logged in timestamp\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-257\'>PC-257</a>] -         Add Select All / Select None to Site Search\r\n</li>\r\n</ul>\r\n                ','2012-12-07 00:00:00'),(14,'2.2.2','\r\n        Release Notes - Poundcake - Version 2.2.2\r\n        \r\n<h2>        Bug\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-259\'>PC-259</a>] -         Check All / Check None stopped working\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-261\'>PC-261</a>] -         project_id not getting set for new user -- defaults to showing HRBN \r\n</li>\r\n</ul>\r\n    \r\n<h2>        Improvement\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-263\'>PC-263</a>] -         Revisit/cleanup flash messages, other UX/CSS\r\n</li>\r\n</ul>\r\n        \r\n<h2>        New Feature\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-235\'>PC-235</a>] -         Copy radio config button\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-247\'>PC-247</a>] -         Export based on current filter\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-260\'>PC-260</a>] -         Show last logged in date on user view page\r\n</li>\r\n</ul>\r\n                \r\n<h2>        Sub-task\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-264\'>PC-264</a>] -         Add opposite radio mode to radio mode configuration\r\n</li>\r\n</ul>\r\n','2012-12-12 00:00:00'),(15,'2.2.3','\r\n        Release Notes - Poundcake - Version 2.2.3\r\n        \r\n<h2>        Bug\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-262\'>PC-262</a>] -         Sites/View of attached files only shows images -- other file types lost by CSS formatting\r\n</li>\r\n</ul>\r\n    \r\n<h2>        Improvement\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-206\'>PC-206</a>] -         suggestion prevent switch port conflicts\r\n</li>\r\n</ul>\r\n        \r\n<h2>        New Feature\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-265\'>PC-265</a>] -         Change dialogs to Bootbox\r\n</li>\r\n</ul>\r\n                ','2012-12-13 00:00:00'),(19,'2.3.1','\r\n        Release Notes - Poundcake - Version 2.3.1\r\n        \r\n<h2>        Bug\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-277\'>PC-277</a>] -         Thumbnails / file list on sites/view/37?\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-303\'>PC-303</a>] -         Sticky site/switch issue on add new radio\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-307\'>PC-307</a>] -         Fields for monitoring system URL, user, etc. missing from project add page\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-308\'>PC-308</a>] -         sites to be imported into SFwifi project\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-309\'>PC-309</a>] -         editor permission does not allow kml import / export\r\n</li>\r\n</ul>\r\n    \r\n<h2>        Improvement\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-306\'>PC-306</a>] -         Ensure fully qualified URL and no trailing slash on monitor system URL\r\n</li>\r\n</ul>\r\n        \r\n<h2>        New Feature\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-269\'>PC-269</a>] -         projects should have Opennms related attributes\r\n</li>\r\n</ul>\r\n                \r\n<h2>        Sub-task\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-310\'>PC-310</a>] -         Restrict KML import to users with admin permission\r\n</li>\r\n</ul>\r\n','2013-01-17 00:00:00'),(17,'2.2.4','\r\n        Release Notes - Poundcake - Version 2.2.4\r\n        \r\n<h2>        Bug\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-270\'>PC-270</a>] -         Uncheck of SNMP override checkbox should clear SNMP fields\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-271\'>PC-271</a>] -         Uncheck of sector checkbox should clear true azimuth field\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-280\'>PC-280</a>] -         Jquery for Bootbox dialogs not working consistently on Chrome\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-281\'>PC-281</a>] -         Change admin routes for ChangeLog\r\n</li>\r\n</ul>\r\n            \r\n<h2>        New Feature\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-268\'>PC-268</a>] -         Store SNMP community information\r\n</li>\r\n</ul>\r\n            \r\n<h2>        Task\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-274\'>PC-274</a>] -         Refactor site_name into name\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-275\'>PC-275</a>] -         Refactor site_code into code\r\n</li>\r\n</ul>\r\n    \r\n<h2>        Sub-task\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-282\'>PC-282</a>] -         Change Delete on changeLog to BootBox format\r\n</li>\r\n</ul>\r\n','2012-12-21 00:00:00'),(18,'2.3.0','        Release Notes - Poundcake - Version 2.3\r\n        \r\n<h2>        Bug\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-278\'>PC-278</a>] -         Add request access to login page\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-283\'>PC-283</a>] -         Error message when navigating to Admin/Projects and Admin/Roles\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-284\'>PC-284</a>] -         error message on site edit view on site 195\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-285\'>PC-285</a>] -         Site/View errors when radios have no name\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-286\'>PC-286</a>] -         magnetic declination not working?\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-291\'>PC-291</a>] -         Switch project not resetting sticky site search\r\n</li>\r\n</ul>\r\n    \r\n<h2>        Improvement\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-290\'>PC-290</a>] -         Protect MySQL fields for SNMP password, monitoring system password\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-301\'>PC-301</a>] -         Make Provision button restricted to Administrators\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-302\'>PC-302</a>] -         Provision category: Radio/Router/Switch\r\n</li>\r\n</ul>\r\n        \r\n<h2>        New Feature\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-267\'>PC-267</a>] -         Create monitoring IP field for Radio, Switch and Router\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-272\'>PC-272</a>] -         Towerdb should be able to provision nodes in opennms\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-287\'>PC-287</a>] -         Create monitoring system types and allow them to be assigned to a project\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-292\'>PC-292</a>] -         Add SNMP querying information to node provision\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-293\'>PC-293</a>] -         Add primary IP field for each network device\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-297\'>PC-297</a>] -         add foreign_id to view (edit?) page for Radios/Routers/Switches\r\n</li>\r\n</ul>\r\n                \r\n<h2>        Sub-task\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-298\'>PC-298</a>] -         NetworkRadios\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-299\'>PC-299</a>] -         NetworkRouters\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-300\'>PC-300</a>] -         NetworkSwitch\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-305\'>PC-305</a>] -         Make network services a configurable item\r\n</li>\r\n</ul>\r\n','2013-01-15 00:00:00'),(20,'2.4.0','        Release Notes - Poundcake - Version 2.4\r\n        \r\n<h2>        Bug\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-314\'>PC-314</a>] -         Sites imported from KML don&#39;t show up on overview map\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-315\'>PC-315</a>] -         Sites import not working when placemarks are not in a root folder\r\n</li>\r\n</ul>\r\n    \r\n<h2>        Improvement\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-311\'>PC-311</a>] -         Incorporate Jasny&#39;s file upload\r\n</li>\r\n</ul>\r\n        \r\n<h2>        New Feature\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-273\'>PC-273</a>] -         query device up/down status from opennms\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-279\'>PC-279</a>] -         Prevent delete of projects with objects on them\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-288\'>PC-288</a>] -         make site status overridable at the project level\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-289\'>PC-289</a>] -         Make tower type overridable at the project level\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-295\'>PC-295</a>] -         Add an overview map showing links between sites and site status\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-313\'>PC-313</a>] -         Site status page with data from OpenNMS\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-316\'>PC-316</a>] -         Add Lessify support\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-317\'>PC-317</a>] -         Upgrade CakePHP core 2.2.2 to 2.2.5\r\n</li>\r\n</ul>\r\n                ','2013-01-22 00:00:00'),(21,'2.4.1','\r\n        Release Notes - Poundcake - Version 2.4.1\r\n        \r\n<h2>        Bug\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-318\'>PC-318</a>] -         Delete Site State not working\r\n</li>\r\n</ul>\r\n    \r\n<h2>        Improvement\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-319\'>PC-319</a>] -         Alphabetize the projects in Switch Project\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-320\'>PC-320</a>] -         Hide site nav (Map, Sites, etc...) when logged out / login page\r\n</li>\r\n</ul>\r\n                        ','2013-01-22 00:00:00'),(22,'2.4.2','\r\n        Release Notes - Poundcake - Version 2.4.2\r\n        \r\n<h2>        Bug\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-321\'>PC-321</a>] -         General scrub for $this-&gt;Form-&gt;postLink(&#39;Delete&#39;\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-322\'>PC-322</a>] -         Topology map blank when there are no links to/from a site\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-324\'>PC-324</a>] -         Edit site shows routers from another project\r\n</li>\r\n</ul>\r\n    \r\n<h2>        Improvement\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-326\'>PC-326</a>] -         auto reload topology map via HTML?\r\n</li>\r\n</ul>\r\n        \r\n<h2>        New Feature\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-294\'>PC-294</a>] -         Add a listing of Site status, ideally filterable\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-296\'>PC-296</a>] -         Add background process to collect device status\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-312\'>PC-312</a>] -         Overview map with all links drawn\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-323\'>PC-323</a>] -         Allow for blank install teams on a site\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-331\'>PC-331</a>] -         Sort index page for Radio Type, Antenna Type\r\n</li>\r\n</ul>\r\n                ','2013-01-24 00:00:00'),(23,'2.4.3','\r\n        Release Notes - Poundcake - Version 2.4.3\r\n        \r\n<h2>        Bug\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-334\'>PC-334</a>] -         Delete radio stopped working\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-335\'>PC-335</a>] -         Ajax listing of switches on Edit radio incorrect\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-336\'>PC-336</a>] -         cron setting is_down to 0 when no sites found in OpenNMS\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-346\'>PC-346</a>] -         install team should default to empty\r\n</li>\r\n</ul>\r\n    \r\n<h2>        Improvement\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-339\'>PC-339</a>] -         make default zoomlevel for a project settable\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-340\'>PC-340</a>] -         topology map zooms out to original zoom on auto reload\r\n</li>\r\n</ul>\r\n        \r\n<h2>        New Feature\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-332\'>PC-332</a>] -         Add device status icon to Radio/Router/Switch index and view pages\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-347\'>PC-347</a>] -         Restrict install teams to project\r\n</li>\r\n</ul>\r\n            \r\n<h2>        Task\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-276\'>PC-276</a>] -         Add proper full size image view popup\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-338\'>PC-338</a>] -         Upgrade Jquery 1.8.3 to 1.9.0\r\n</li>\r\n</ul>\r\n    ','2013-01-29 00:00:00'),(24,'2.5.0','        Release Notes - Poundcake - Version 2.5\r\n        \r\n<h2>        Bug\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-212\'>PC-212</a>] -         Ability to hide sites of certain status on the main map page\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-325\'>PC-325</a>] -         topology map probably shouldn&#39;t show links to sites in other projects\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-353\'>PC-353</a>] -         is_down being treated as a boolean\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-360\'>PC-360</a>] -         Delete of SiteStates not working from index page\r\n</li>\r\n</ul>\r\n            \r\n<h2>        New Feature\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-342\'>PC-342</a>] -         generate click through link to opennms page for node\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-348\'>PC-348</a>] -         Implement jquery-ui-map.js\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-349\'>PC-349</a>] -         add search on user page\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-354\'>PC-354</a>] -         Add field to track last update from network monitoring system\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-355\'>PC-355</a>] -         Track who provisioned an item into the monitoring system\r\n</li>\r\n</ul>\r\n    \r\n<h2>        Question\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-361\'>PC-361</a>] -         Remove Search, Legend from Overview page\r\n</li>\r\n</ul>\r\n            \r\n<h2>        Sub-task\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-341\'>PC-341</a>] -         Add fitBounds() to Google Maps Helper\r\n</li>\r\n</ul>\r\n','2013-01-31 00:00:00'),(25,'2.5.1','\r\n        Release Notes - Poundcake - Version 2.5.1\r\n        \r\n<h2>        Bug\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-362\'>PC-362</a>] -         two more kmls not handled by import\r\n</li>\r\n</ul>\r\n    \r\n<h2>        Improvement\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-350\'>PC-350</a>] -         remove up/down arrows from latitude and longitude fields\r\n</li>\r\n</ul>\r\n        \r\n<h2>        New Feature\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-343\'>PC-343</a>] -         window showing active alerts for network device node on node view page\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-344\'>PC-344</a>] -         kml import preview\r\n</li>\r\n</ul>\r\n                \r\n<h2>        Sub-task\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-356\'>PC-356</a>] -         Jquery to disable scroll in number field when focus\r\n</li>\r\n</ul>\r\n','2013-02-01 00:00:00'),(26,'2.5.2','\r\n        Release Notes - Poundcake - Version 2.5.2\r\n        \r\n<h2>        Bug\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-364\'>PC-364</a>] -         KML export of special characters\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-366\'>PC-366</a>] -         Multiple placemarks on jQuery map\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-367\'>PC-367</a>] -         Multiple lines on jQuery map\r\n</li>\r\n</ul>\r\n            \r\n<h2>        New Feature\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-345\'>PC-345</a>] -         kml import /export on site create page\r\n</li>\r\n</ul>\r\n                \r\n<h2>        Sub-task\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-363\'>PC-363</a>] -         Add KML export to site view page\r\n</li>\r\n</ul>\r\n','2013-02-03 00:00:00'),(27,'2.6.0','        Release Notes - Poundcake - Version 2.6\r\n        \r\n<h2>        Bug\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-352\'>PC-352</a>] -         Investigate why import was not called\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-374\'>PC-374</a>] -         Provisioned On / Provisioned By blank?\r\n</li>\r\n</ul>\r\n            \r\n<h2>        New Feature\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-365\'>PC-365</a>] -         Automatically give the admin user permissions to all projects\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-369\'>PC-369</a>] -         Upgrade jQuery UI to 1.10.0\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-375\'>PC-375</a>] -         Node status icons on site view page for switch, router\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-376\'>PC-376</a>] -         add basic OpenNMS graph to node view page\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-378\'>PC-378</a>] -         Add addrpool switch for non-HRBN projects\r\n</li>\r\n</ul>\r\n            \r\n<h2>        Task\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-370\'>PC-370</a>] -         Remove code &amp; references to PhpThumb - both component, helper\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-371\'>PC-371</a>] -         Remove code &amp; references to GoogleMapsHelper\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-373\'>PC-373</a>] -         Drop default_lat, default_lon, default_zoom from projects table\r\n</li>\r\n</ul>\r\n    ','2013-02-07 00:00:00'),(28,'2.6.1','\r\n        Release Notes - Poundcake - Version 2.6.1\r\n        \r\n<h2>        Bug\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-351\'>PC-351</a>] -         Site showing green in towerDB even though not in openms?\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-382\'>PC-382</a>] -         hide graphs link if element not in monitoring system\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-386\'>PC-386</a>] -         some links not showing on topology map\r\n</li>\r\n</ul>\r\n                \r\n<h2>        New Feature\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-385\'>PC-385</a>] -         default project lat/long to sane default\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-391\'>PC-391</a>] -         reverse view of permissions from projects to users\r\n</li>\r\n</ul>\r\n                        \r\n<h2>        Sub-task\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-383\'>PC-383</a>] -         Graph negotiated link rate\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-384\'>PC-384</a>] -         Graph RSSI\r\n</li>\r\n</ul>\r\n    ','2013-02-19 00:00:00'),(29,'2.6.2','\r\n        Release Notes - Poundcake - Version 2.6.2\r\n        \r\n<h2>        Bug\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-389\'>PC-389</a>] -         renaming a project breaks permissions on that project\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-392\'>PC-392</a>] -         display email address on site view page for contact if no phone number\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-393\'>PC-393</a>] -         contact view sort by organization does not work\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-394\'>PC-394</a>] -         line breaks not respected in description field?\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-395\'>PC-395</a>] -         the index mtxrWlStatIndex[7] is wrong, it&#39;s mtxrWlStatIndex[5] instead\r\n</li>\r\n</ul>\r\n                \r\n<h2>        New Feature\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-387\'>PC-387</a>] -         show major events on node view page\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-390\'>PC-390</a>] -         allow users to have different permissions on different projects\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-398\'>PC-398</a>] -         Add site maintenance feature\r\n</li>\r\n</ul>\r\n                            ','2013-02-26 00:00:00'),(30,'2.7.0','        Release Notes - Poundcake - Version 2.7\r\n        \r\n<h2>        Bug\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-399\'>PC-399</a>] -         unable to create new user\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-400\'>PC-400</a>] -         Users can exist without access to projects\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-401\'>PC-401</a>] -         unknown error on project create\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-403\'>PC-403</a>] -         no way to add system admins to new projects\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-404\'>PC-404</a>] -         KML import / permissions bug?\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-405\'>PC-405</a>] -         site view broken\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-407\'>PC-407</a>] -         Syntax error or access violation\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-409\'>PC-409</a>] -         Organizations tied to old project model\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-410\'>PC-410</a>] -         Import KML bug\r\n</li>\r\n</ul>\r\n                \r\n<h2>        New Feature\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-327\'>PC-327</a>] -         read only checkbox in project monitoring server settings?\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-330\'>PC-330</a>] -         radio and antenna compatiblity\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-402\'>PC-402</a>] -         checkbox label on user -&gt; permissions -&gt;view\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-406\'>PC-406</a>] -         Add jQuery to disable radio buttons for permissions on unchecked projects / toggle as appropriate\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-408\'>PC-408</a>] -         Add support for 2.4 GHz radios\r\n</li>\r\n</ul>\r\n                \r\n<h2>        Task\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-396\'>PC-396</a>] -         Upgrade core to CakePHP 2.3.0\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-397\'>PC-397</a>] -         app/tmp/logs/error.log\r\n</li>\r\n</ul>\r\n            ','2013-03-05 00:00:00'),(31,'2.7.1','\r\n        Release Notes - Poundcake - Version 2.7.1\r\n        \r\n<h2>        Bug\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-411\'>PC-411</a>] -         radioBands/index lists too many bands\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-412\'>PC-412</a>] -         Workorder crashing\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-415\'>PC-415</a>] -         &quot;create new switch&quot; field should not be mandatory on site creation\r\n</li>\r\n</ul>\r\n                \r\n<h2>        New Feature\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-417\'>PC-417</a>] -         add option &quot;unknown&quot; globally for some fields\r\n</li>\r\n</ul>\r\n                \r\n<h2>        Task\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-413\'>PC-413</a>] -         Code cleanup - getFrequenciesForRadioType\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-414\'>PC-414</a>] -         Code cleanup - getAntennaTypes\r\n</li>\r\n</ul>\r\n            ','2013-03-06 00:00:00'),(32,'3.0.0','\r\n        Release Notes - Poundcake - Version 3.0.0\r\n        \r\n<h2>        Bug\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-419\'>PC-419</a>] -         Can&#39;t Add Files\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-420\'>PC-420</a>] -         Issue adding radios\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-427\'>PC-427</a>] -         Site name is now required field on Site Search\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-430\'>PC-430</a>] -         IpSpace:  /32 giving IPs starting at .0\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-431\'>PC-431</a>] -         Add delete confirmation to IpSpaces\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-433\'>PC-433</a>] -         Save fails when NOAA website is down\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-436\'>PC-436</a>] -         Error when selecting a site for detailed view\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-437\'>PC-437</a>] -         IP spaces on towerdb-staging giving errors\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-438\'>PC-438</a>] -         Errors when creating sub-IP spaces\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-439\'>PC-439</a>] -         Delete of sub-IP space is deleting root IP space\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-441\'>PC-441</a>] -         First subnet within IP space starting at .1 not .0\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-443\'>PC-443</a>] -         Undefined index: Site\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-444\'>PC-444</a>] -         Site code should be auto-generated or required\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-446\'>PC-446</a>] -         Site/view offset issue\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-447\'>PC-447</a>] -         Delete of last Site State Icon not working\r\n</li>\r\n</ul>\r\n                \r\n<h2>        New Feature\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-266\'>PC-266</a>] -         towerdb should store IP addresses in its own IP address database\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-337\'>PC-337</a>] -         workorder when a site is missing elements\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-379\'>PC-379</a>] -         Change radio link trigger to use SSID\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-380\'>PC-380</a>] -         Add site link feature\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-429\'>PC-429</a>] -         Add delete root IP space to project/edit\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-442\'>PC-442</a>] -         Multiple IP spaces per project\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-445\'>PC-445</a>] -         keep a default gallery of site state icons?\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-448\'>PC-448</a>] -         disable addrpool integration for non-HRBN projects\r\n</li>\r\n</ul>\r\n                \r\n<h2>        Task\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-418\'>PC-418</a>] -         Upgrade jQuery to 1.9.1\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-435\'>PC-435</a>] -         Upgrade Bootbox from v2.5.1 to v3.2.0\r\n</li>\r\n</ul>\r\n        \r\n<h2>        Sub-task\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-425\'>PC-425</a>] -         Make addresses from IP spaces available to core objects\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-426\'>PC-426</a>] -         Allow for an arbitrary number of ISP-assigned public IPs\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-428\'>PC-428</a>] -         Allow for non-contiguous /32 ip addresses within a space\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-434\'>PC-434</a>] -         add check for dirty lat/lon fields before calling NOAA service\r\n</li>\r\n</ul>\r\n    ','2013-04-03 00:00:00'),(33,'3.0.1','\r\n        Release Notes - Poundcake - Version 3.0.1\r\n        \r\n<h2>        Bug\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-450\'>PC-450</a>] -          Undefined index: is_down\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-454\'>PC-454</a>] -         Radios can default link to radios in another project\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-456\'>PC-456</a>] -         poundcake-close-dialog.js 404 (Not Found)\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-458\'>PC-458</a>] -         IP spaces - cancel button feature request\r\n</li>\r\n</ul>\r\n                \r\n<h2>        New Feature\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-457\'>PC-457</a>] -         Redirect already logged in users into site, don&#39;t re-serve login page\r\n</li>\r\n</ul>\r\n                \r\n<h2>        Task\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-453\'>PC-453</a>] -         Multiple icons on topo map?\r\n</li>\r\n</ul>\r\n            ','2013-04-08 00:00:00'),(34,'3.0.2','\r\n        Release Notes - Poundcake - Version 3.0.2\r\n        \r\n<h2>        Bug\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-459\'>PC-459</a>] -         Allow manual editing of foreign ID field\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-463\'>PC-463</a>] -         notice(8) on login screen?\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-464\'>PC-464</a>] -         view not found error on projects -&gt; edit\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-474\'>PC-474</a>] -         Adding a radio creates a warning\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-475\'>PC-475</a>] -         Cardinality violation error on making radio multipoint end\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-476\'>PC-476</a>] -         SNMP Version not editable\r\n</li>\r\n</ul>\r\n                \r\n<h2>        New Feature\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-477\'>PC-477</a>] -         Primary IP flag to IP Spaces\r\n</li>\r\n</ul>\r\n                \r\n<h2>        Task\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-469\'>PC-469</a>] -         change two foreignids in towerdb\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-470\'>PC-470</a>] -         Re-add SiteStateIcon/edit\r\n</li>\r\n</ul>\r\n            ','2013-04-16 00:00:00'),(35,'3.0.3','\r\n        Release Notes - Poundcake - Version 3.0.3\r\n        \r\n<h2>        Bug\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-468\'>PC-468</a>] -         Site&#39;s is_down flag seems inconsistent\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-472\'>PC-472</a>] -         Site not red on topology map during current outage\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-479\'>PC-479</a>] -         IP Spaces not incrementing /32 IP\r\n</li>\r\n</ul>\r\n                \r\n<h2>        New Feature\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-461\'>PC-461</a>] -         Prototype ReST API on Tower DB to load radio/router/switch\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-473\'>PC-473</a>] -         Consider another color for links on topology map\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-480\'>PC-480</a>] -         Change foreignSource to use manufacturer name\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-484\'>PC-484</a>] -         Refactor cron() - only query OpenNMS for nodes that should already be in the provisioning system\r\n</li>\r\n</ul>\r\n                \r\n<h2>        Task\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-455\'>PC-455</a>] -         Fix TDB configs - post 3.0.0 upgrade\r\n</li>\r\n</ul>\r\n        \r\n<h2>        Sub-task\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-482\'>PC-482</a>] -         Add Manufacturer to Radio Types\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-483\'>PC-483</a>] -         Add field validation for &quot;manufacturer&quot; for RadioType/SwitchType/RouterType\r\n</li>\r\n</ul>\r\n    ','2013-04-19 00:00:00'),(36,'3.0.4','\r\n        Release Notes - Poundcake - Version 3.0.4\r\n        \r\n<h2>        Bug\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-485\'>PC-485</a>] -         image uploads failing\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-486\'>PC-486</a>] -         KML import not finding placemarks \r\n</li>\r\n</ul>\r\n                                            ','2013-04-26 00:00:00'),(37,'3.0.5','\r\n        Release Notes - Poundcake - Version 3.0.5\r\n        \r\n<h2>        Bug\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-462\'>PC-462</a>] -         getaddrinfo failed when the ReST API is invalid\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-489\'>PC-489</a>] -         On radio creation, default is bulletM5 with airmax sector\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-490\'>PC-490</a>] -         bug in radio status (red/green) of linked radio on radio view page\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-491\'>PC-491</a>] -         internet explorer bug with map\r\n</li>\r\n</ul>\r\n                \r\n<h2>        New Feature\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-493\'>PC-493</a>] -         Sites with no network devices show green on topology map\r\n</li>\r\n</ul>\r\n                            ','2013-05-07 00:00:00'),(38,'3.0.6','\r\n        Release Notes - Poundcake - Version 3.0.6\r\n        \r\n<h2>        Bug\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-497\'>PC-497</a>] -         IP Spaces: Assignment of first host in subnet not working right\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-498\'>PC-498</a>] -         Multiple POST forms submitted by href=&quot;#&quot;\r\n</li>\r\n</ul>\r\n                \r\n<h2>        New Feature\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-494\'>PC-494</a>] -         force site codes to be unique within projects\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-495\'>PC-495</a>] -         add ability to rename IP spaces\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-496\'>PC-496</a>] -         ip spaces - &quot;fill this space with host records&quot; automation\r\n</li>\r\n</ul>\r\n                            ','2013-05-14 00:00:00'),(39,'3.0.7','\r\n        Release Notes - Poundcake - Version 3.0.7\r\n                        \r\n<h2>        New Feature\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-499\'>PC-499</a>] -         Change default fill label\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-500\'>PC-500</a>] -         Investigate mouseover tooltips on IP Spaces\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-501\'>PC-501</a>] -         IP Spaces/Edit - Show the IP address of the space\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-502\'>PC-502</a>] -         Toggle IP Spaces subnets open/closed\r\n</li>\r\n</ul>\r\n                            ','2013-05-15 00:00:00'),(40,'3.0.8','\r\n        Release Notes - Poundcake - Version 3.0.8\r\n        \r\n<h2>        Bug\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-518\'>PC-518</a>] -         HRBN monitoring false green?\r\n</li>\r\n</ul>\r\n                \r\n<h2>        New Feature\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-492\'>PC-492</a>] -         Authentication handling for &quot;always-on&quot; display of topology map\r\n</li>\r\n</ul>\r\n                \r\n<h2>        Task\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-504\'>PC-504</a>] -         Upgrade:  jquery-ui-1.10.0 to jquery-ui-1.10.3\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-505\'>PC-505</a>] -         Upgrade Bootstrap 2.2.1 to 2.3.1\r\n</li>\r\n</ul>\r\n            ','2013-05-21 00:00:00'),(41,'3.1.0','\r\n        Release Notes - Poundcake - Version 3.1.0\r\n        \r\n<h2>        Bug\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-529\'>PC-529</a>] -         Network dropdown menu (main nav.) does not work on IpSpaces page\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-535\'>PC-535</a>] -         Overview page returning out of memory errors\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-541\'>PC-541</a>] -         Adding a TowerdB Contact\r\n</li>\r\n</ul>\r\n                \r\n<h2>        New Feature\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-488\'>PC-488</a>] -         simplify interface for creating / editing site states\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-507\'>PC-507</a>] -         Switch to a self-signed SSL certificate\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-512\'>PC-512</a>] -         Display attached file&#39;s name directly above or below it\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-514\'>PC-514</a>] -         New data fields\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-517\'>PC-517</a>] -         New data field: Site total, estimated Wh load per month\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-519\'>PC-519</a>] -         /32s should show parent CIDR\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-522\'>PC-522</a>] -         Show IP address/network address/subnet/gateway for network device\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-523\'>PC-523</a>] -         Add gateway field to IP address\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-524\'>PC-524</a>] -         Default gateway\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-525\'>PC-525</a>] -         Link from IP Space back to device assigned that IP\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-526\'>PC-526</a>] -         Change /32 to host\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-527\'>PC-527</a>] -         Allow variable IP Space fill\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-530\'>PC-530</a>] -         Allow Router/Switch/Radio to be assigned a Primary /32 in the project&#39;s IpSpace\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-534\'>PC-534</a>] -         add network devices cost field and associated totals\r\n</li>\r\n</ul>\r\n                \r\n<h2>        Task\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-532\'>PC-532</a>] -         Rename Interfaces to Interface Types\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-536\'>PC-536</a>] -         Upgrade CakePHP 2.3.0 to CakePHP 2.3.5\r\n</li>\r\n</ul>\r\n        \r\n<h2>        Sub-task\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-528\'>PC-528</a>] -         Default watt values\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-531\'>PC-531</a>] -         Allow for edit of gateway\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-543\'>PC-543</a>] -         Add interfaces for Radios, tie to IP Spaces\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-546\'>PC-546</a>] -         Drop primary IP, replace with primary interface\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-547\'>PC-547</a>] -         Enable/Disable InterfaceType fields on RadioType screens (add, edit)\r\n</li>\r\n</ul>\r\n    ','2013-06-06 00:00:00'),(42,'3.1.1','\r\n        Release Notes - Poundcake - Version 3.1.1\r\n        \r\n<h2>        Bug\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-550\'>PC-550</a>] -         Radio Search doesn&#39;t work for non-admins\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-551\'>PC-551</a>] -         Router Search doesn&#39;t work for non-admins\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-552\'>PC-552</a>] -         Copy site state tool reset all site states to lowest value in project\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-556\'>PC-556</a>] -         router type -&gt; edit view broken\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-557\'>PC-557</a>] -         error on router types -&gt; create new view\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-558\'>PC-558</a>] -         Power consumption for site with no network devices shows 19W\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-559\'>PC-559</a>] -         Site total equipment value / cost displays in wrong place and is non-zero for sites with no devices\r\n</li>\r\n</ul>\r\n                                \r\n<h2>        Task\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-549\'>PC-549</a>] -         Make edit interfaces available to editors and admins only\r\n</li>\r\n</ul>\r\n        \r\n<h2>        Sub-task\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-554\'>PC-554</a>] -         Add secure/insecure password feilds to Project model\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-560\'>PC-560</a>] -         Add primary/secondary nameserver field to Project\r\n</li>\r\n</ul>\r\n    ','2013-06-18 00:00:00'),(43,'3.1.2','\r\n        Release Notes - Poundcake - Version 3.1.2\r\n        \r\n<h2>        Bug\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-563\'>PC-563</a>] -         Display parent cidr on radio view\r\n</li>\r\n</ul>\r\n                \r\n<h2>        New Feature\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-555\'>PC-555</a>] -         project summary page\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-564\'>PC-564</a>] -         Add link from radio/view IP address into IP spaces\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-565\'>PC-565</a>] -         Allow for empty configuration template on radio/edit\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-569\'>PC-569</a>] -         add &quot;router type&quot; column to router summary view\r\n</li>\r\n</ul>\r\n                        \r\n<h2>        Sub-task\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-561\'>PC-561</a>] -         Add SNMP contact feild to Project model\r\n</li>\r\n</ul>\r\n    ','2013-06-20 00:00:00');
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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_types`
--

LOCK TABLES `contact_types` WRITE;
/*!40000 ALTER TABLE `contact_types` DISABLE KEYS */;
INSERT INTO `contact_types` VALUES (1,'Commercial Contact'),(2,'Technical Contact'),(3,'Installer');
/*!40000 ALTER TABLE `contact_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipment_spaces`
--

DROP TABLE IF EXISTS `equipment_spaces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipment_spaces` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment_spaces`
--

LOCK TABLES `equipment_spaces` WRITE;
/*!40000 ALTER TABLE `equipment_spaces` DISABLE KEYS */;
INSERT INTO `equipment_spaces` VALUES (1,'Cabinet'),(2,'Equipment Room');
/*!40000 ALTER TABLE `equipment_spaces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frequencies`
--

DROP TABLE IF EXISTS `frequencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frequencies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `frequency` int(10) NOT NULL,
  `radio_band_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frequencies`
--

LOCK TABLES `frequencies` WRITE;
/*!40000 ALTER TABLE `frequencies` DISABLE KEYS */;
INSERT INTO `frequencies` VALUES (1,'Channel 1',2412,1),(2,'Channel 2',2417,1),(3,'Channel 3',2422,1),(4,'Channel 4',2427,1),(5,'Channel 5',2432,1),(6,'Channel 6',2437,1),(7,'Channel 7',2442,1),(8,'Channel 8',2447,1),(9,'Channel 9',2452,1),(10,'Channel 10',2457,1),(11,'Channel 11',2462,1),(12,'Channel 12',2467,1),(13,'Channel 13',2472,1),(14,'Channel 14',2484,1),(15,'Channel 183',4915,2),(16,'Channel 184',4920,2),(17,'Channel 185',4925,2),(18,'Channel 187',4935,2),(19,'Channel 188',4940,2),(20,'Channel 189',4945,2),(21,'Channel 192',4960,2),(22,'Channel 196',4980,2),(23,'Channel 7',5035,2),(24,'Channel 8',5040,2),(25,'Channel 9',5045,2),(26,'Channel 11',5055,2),(27,'Channel 12',5060,2),(28,'Channel 16',5080,2),(29,'Channel 34',5170,2),(30,'Channel 36',5180,2),(31,'Channel 38',5190,2),(32,'Channel 40',5200,2),(33,'Channel 42',5210,2),(34,'Channel 44',5220,2),(35,'Channel 46',5230,2),(36,'Channel 48',5240,2),(37,'Channel 52',5260,2),(38,'Channel 56',5280,2),(39,'Channel 60',5300,2),(40,'Channel 64',5320,2),(41,'Channel 100',5500,2),(42,'Channel 104',5520,2),(43,'Channel 108',5540,2),(44,'Channel 112',5560,2),(45,'Channel 116',5580,2),(46,'Channel 120',5600,2),(47,'Channel 124',5620,2),(48,'Channel 128',5640,2),(49,'Channel 132',5660,2),(50,'Channel 136',5680,2),(51,'Channel 140',5700,2),(52,'Channel 149',5745,2),(53,'Channel 153',5765,2),(54,'Channel 157',5785,2),(55,'Channel 161',5805,2),(56,'Channel 165',5825,2),(57,'Channel 163',5815,2);
/*!40000 ALTER TABLE `frequencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monitoring_system_types`
--

DROP TABLE IF EXISTS `monitoring_system_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monitoring_system_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monitoring_system_types`
--

LOCK TABLES `monitoring_system_types` WRITE;
/*!40000 ALTER TABLE `monitoring_system_types` DISABLE KEYS */;
INSERT INTO `monitoring_system_types` VALUES (5,'Nagios'),(6,'Cacti'),(7,'OpenNMS'),(8,'Zabbix');
/*!40000 ALTER TABLE `monitoring_system_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `network_services`
--

DROP TABLE IF EXISTS `network_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `network_services` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `default` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `network_services`
--

LOCK TABLES `network_services` WRITE;
/*!40000 ALTER TABLE `network_services` DISABLE KEYS */;
/*!40000 ALTER TABLE `network_services` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-08-30 10:10:56
-- MySQL dump 10.13  Distrib 5.5.29, for osx10.6 (i386)
--
-- Host: localhost    Database: poundcake
-- ------------------------------------------------------
-- Server version	5.5.29

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
-- Table structure for table `site_states`
--

DROP TABLE IF EXISTS `site_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_states` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `sequence` int(10) DEFAULT NULL,
  `site_state_icon_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_states`
--
-- WHERE:  project_id=1

LOCK TABLES `site_states` WRITE;
/*!40000 ALTER TABLE `site_states` DISABLE KEYS */;
INSERT INTO `site_states` VALUES (20,1,'Decommissioned',7,3),(23,1,'Ready to Decommission',6,1),(18,1,'Deactivated',5,3),(16,1,'Power Complete',2,5),(15,1,'Active',4,2),(21,1,'Planned',1,6),(24,1,'Minor Repair Required',8,7),(51,1,'Preliminary',1,5);
/*!40000 ALTER TABLE `site_states` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-08-30 10:10:56
-- MySQL dump 10.13  Distrib 5.5.29, for osx10.6 (i386)
--
-- Host: localhost    Database: poundcake
-- ------------------------------------------------------
-- Server version	5.5.29

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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-08-30 10:10:56
INSERT INTO users(username,password,admin) VALUES ('admin','e9207779e97900bb506e145e2d383a90c0c7c2e6',1);
INSERT INTO projects(id,name,default_lat,default_lon) VALUES (1,'My Wi-Fi Project',45.52,-122.681944);
INSERT INTO project_memberships(project_id,user_id,role_id) VALUES (1,1,1);
