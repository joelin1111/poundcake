--
-- This file auto-generated at 00:00:00 on Sep 10, 2012.
--
DROP TABLE IF EXISTS `sites`;
CREATE TABLE `sites` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `code` varchar(10) NOT NULL,
  `lat` decimal(17,14) DEFAULT NULL,
  `lon` decimal(17,14) DEFAULT NULL,
  `install_date` datetime DEFAULT NULL,
  `access_instruction` text,
  `zone_id` int(10) NOT NULL,
  `trc_id` int(10) NOT NULL,
  `connectivity_type_id` int(10) NOT NULL,
  `intervention_type_id` int(10) NOT NULL,
  `site_state_id` int(10) NOT NULL,
  `service_provider_id` int(10) NOT NULL,
  `power_type_id` int(10) NOT NULL,
  `road_type_id` int(10) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `warning_flag` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `locations`;
CREATE TABLE `locations` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `location` point NOT NULL,
  PRIMARY KEY (`id`),
  SPATIAL KEY `location` (`location`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;




LOCK TABLES `sites` WRITE;

UNLOCK TABLES;

