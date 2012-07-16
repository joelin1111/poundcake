/* ************************************************************************************ */
/* ************************************************************************************ */
/* ************************************************************************************ */

DROP TABLE IF EXISTS `power_types`;
CREATE table power_types (
    id int(10) unsigned NOT NULL auto_increment,
    name varchar(255) NOT NULL,
    PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

LOCK TABLES `power_types` WRITE;
INSERT INTO `power_types` VALUES
(1,'Grid'),
(2,'Solar');
UNLOCK TABLES;

/* ************************************************************************************ */
/* ************************************************************************************ */
/* ************************************************************************************ */

DROP TABLE IF EXISTS `site_states`;
CREATE table site_states (
    id int(10) unsigned NOT NULL auto_increment,
    name varchar(255) NOT NULL,
    PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

LOCK TABLES `site_states` WRITE;
INSERT INTO `site_states` VALUES
(1,'Install Need Identified'),
(2,'Prerequisites Verified'),
(3,'ISP Installation Complete'),
(4,'Work Order Created'),
(5,'Installation Scheduled/Team Assigned'),
(6,'Team Pulls Equipment from Regional Hub'),
(7,'Install in Progress'),
(8,'Install Complete'),
(9,'Spot-check by Inveneo'),
(10,'School Accepted'),
(11,'Site Complete'),
(12,'Open Support Issue'),
(13,'Third Tier Support From ICT IPs');
UNLOCK TABLES;

/* ************************************************************************************ */
/* ************************************************************************************ */
/* ************************************************************************************ */

DROP TABLE IF EXISTS `service_providers`;
CREATE table service_providers (
    id int(10) unsigned NOT NULL auto_increment,
    name varchar(255) NOT NULL,
    PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

LOCK TABLES `service_providers` WRITE;
INSERT INTO `service_providers` VALUES
(1,'UhuruOne'),
(2,'Zantel');
UNLOCK TABLES;

/* ************************************************************************************ */
/* ************************************************************************************ */
/* ************************************************************************************ */

DROP TABLE IF EXISTS `intervention_types`;
CREATE table intervention_types (
    id int(10) unsigned NOT NULL auto_increment,
    name varchar(255) NOT NULL,
    PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

LOCK TABLES `intervention_types` WRITE;
INSERT INTO `intervention_types` VALUES
(1,'B - Bridge IT'),
(2,'E- EMIS Only'),
(3,'M - Mobile Lab'),
(4,'Bp - Unknown'),
(5,'?? - Desktop Lab'),
(6,'?? - District Office'),
(7,'?? - Regional Office');
UNLOCK TABLES;

/* ************************************************************************************ */
/* ************************************************************************************ */
/* ************************************************************************************ */

DROP TABLE IF EXISTS `connectivity_types`;
CREATE table connectivity_types (
    id int(10) unsigned NOT NULL auto_increment,
    name varchar(255) NOT NULL,
    PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

LOCK TABLES `connectivity_types` WRITE;
INSERT INTO `connectivity_types` VALUES
(1,'V - Vsat'),
(2,'G - GSM'),
(3,'P - P2P Wireless'),
(4,'C - CDMA ');
UNLOCK TABLES;

/* ************************************************************************************ */
/* ************************************************************************************ */
/* ************************************************************************************ */

DROP TABLE IF EXISTS `provinces`;
CREATE table provinces (
    id int(10) unsigned NOT NULL auto_increment,
    name varchar(255) NOT NULL,
    PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

LOCK TABLES `provinces` WRITE;
INSERT INTO `provinces` VALUES
(1,'Mtwara'),
(2,'Zanzibar');
UNLOCK TABLES;

/* ************************************************************************************ */
/* ************************************************************************************ */
/* ************************************************************************************ */

DROP TABLE IF EXISTS `schools`;
CREATE TABLE `schools` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `primary_school` varchar(50) NOT NULL,
  `district` varchar(50) NOT NULL,
  `trc` varchar(50) NOT NULL,
  `school_code` varchar(10) NOT NULL,
  `type` varchar(1) NOT NULL,
  `sn` varchar(3) NOT NULL,
  `location` Point,
  `province_id` int(10) NOT NULL, /* foreign key for province */
  `connectivity_type_id` int(10) NOT NULL, /* foreign key for connectivity type */
  `intervention_type_id` int(10) NOT NULL, /* foreign key for intervention type */
  `site_state_id` int(10) NOT NULL, /* foreign key for intervention type */
  `service_provider_id` int(10) NOT NULL, /* foreign key for service provider */
  `power_type_id` int(10) NOT NULL, /* foreign key for power type */
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/* at the moment we cannot create a SPATIAL INDEX(location) since location allows for nulls */

/*
InnoDB does not support spatial indexes
To be determined:  If there's value in putting spatial indexes into its own table,
(which would allow the table schools to remain as InnoDB)
*/

LOCK TABLES `schools` WRITE;
/*!40000 ALTER TABLE `schools` DISABLE KEYS */;
INSERT INTO `schools` VALUES
(1,'BUTIAMA','NEWALA','LUCHINGU','MT.04/093','E','1',GeomFromText('POINT(-5.29966	39.67422)'),1,1,1,4,1,2),
(2,'CHITANDI','','','MT.04/008','E','2',GeomFromText('POINT(-5.36322	39.64760)'),1,2,3,2,2,2),
(3,'JULIA','','','MT.04/091','E','3',GeomFromText('POINT(-5.36540	39.64703)'),1,2,6,1,2,2),
(4,'KARUME','','','MT.04/014','E','4',GeomFromText('POINT(-5.42375	39.65508)'),1,1,2,7,1,1),
(5,'CHIKOI','','LENGO','MT.04/005','E','1',GeomFromText('POINT(-5.41557	39.72810)'),1,4,7,12,1,1),
(6,'KUNGUNI','MIZINGANI','MKOANI','','E','1',GeomFromText('POINT(-5.38007	39.69742)'),2,3,3,11,1,1),
(7,'NG\'OMBENI \' A\'','MIZINGANI','MKOANI','','E','1',GeomFromText('POINT(-5.38212	39.02395)'),2,3,4,9,1,1),
(8,'NG\'OMBENI \' B\'','MIZINGANI','MKOANI','','M','1',GeomFromText('POINT(-5.43651	39.73611)'),2,4,4,5,1,1),
(9,'CHOKOCHO','MIZINGANI','MKOANI','','B','1',GeomFromText('POINT(-5.34756	39.76579)'),2,1,1,4,1,2),
(10,'BUTIAMA','NEWALA','LUCHINGU','MT.04/093','E','1',GeomFromText('POINT(-5.40167	39.64213)'),1,2,2,6,1,1),
(11,'CHITANDI','','','MT.04/008','E','2',GeomFromText('POINT(-5.30742	39.68546)'),1,1,5,7,2,1),
(12,'JULIA','','','MT.04/091','E','3',GeomFromText('POINT(-5.32271	39.74113)'),1,4,3,4,1,2);


/*!40000 ALTER TABLE `schools` ENABLE KEYS */;
UNLOCK TABLES;
