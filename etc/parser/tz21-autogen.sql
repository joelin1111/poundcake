--
-- This file auto-generated at 00:00:00 on Aug 15, 2012.
--
DROP TABLE IF EXISTS `schools`;
CREATE TABLE `schools` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catchment_id` int(10) NOT NULL,
  `area_id` int(10) NOT NULL,
  `district_id` int(10) NOT NULL,
  `school_name` varchar(50) NOT NULL,
  `school_code` varchar(10) NOT NULL,
  `status` varchar(2),
  `trc_id` int(10) NOT NULL,
  `intervention_type_id` int(10) NOT NULL,
  `location` point NULL,
  `power_type_id` int(10) NOT NULL,
  `connectivity_type_id` int(10) NOT NULL,
  `warning` varchar(2),
  `install_date` datetime DEFAULT NULL,
  `access_instruction` TEXT DEFAULT NULL,
  `site_state_id` int(10) NOT NULL,
  `service_provider_id` int(10) NOT NULL,
  `road_type_id` int(10) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
-- For future use? location must be not null
-- SPATIAL INDEX(location)

DROP TABLE IF EXISTS `trcs`;
CREATE TABLE `trcs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  -- no Catchment, Area or District for a TRC
  `trc_name` varchar(50) NOT NULL,
  `trc_code` varchar(10) NOT NULL,
  `status` varchar(2),
  `intervention_type_id` int(10) NOT NULL,
  `location` point NULL,
  `power_type_id` int(10) NOT NULL,
  `connectivity_type_id` int(10) NOT NULL,
  `warning` varchar(2),
  `install_date` datetime DEFAULT NULL,
  `access_instruction` TEXT DEFAULT NULL,
  `site_state_id` int(10) NOT NULL,
  `service_provider_id` int(10) NOT NULL,
  `road_type_id` int(10) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;


INSERT INTO `trcs` VALUES (
	1, -- ID
	'Kitogani', -- site_name
	'TRC_0001', -- trc_code
	'', -- status
	'', -- intervention_type_id
	'', -- location
	'', -- power_type_id
	'', -- connectivity_type_id
	'', -- warning
	'', -- install_date
	'', -- access_instruction
	'', -- site_state_id
	'', -- service_provider_id
	'', -- road_type_id
	''  -- user_id
);

INSERT INTO `trcs` VALUES (
	2, -- ID
	'Dunga', -- site_name
	'TRC_0002', -- trc_code
	'', -- status
	'', -- intervention_type_id
	'', -- location
	'', -- power_type_id
	'', -- connectivity_type_id
	'', -- warning
	'', -- install_date
	'', -- access_instruction
	'', -- site_state_id
	'', -- service_provider_id
	'', -- road_type_id
	''  -- user_id
);

INSERT INTO `trcs` VALUES (
	3, -- ID
	'Bububu', -- site_name
	'TRC_0003', -- trc_code
	'', -- status
	'', -- intervention_type_id
	'', -- location
	'', -- power_type_id
	'', -- connectivity_type_id
	'', -- warning
	'', -- install_date
	'', -- access_instruction
	'', -- site_state_id
	'', -- service_provider_id
	'', -- road_type_id
	''  -- user_id
);

INSERT INTO `trcs` VALUES (
	4, -- ID
	'Mkwajuni', -- site_name
	'TRC_0004', -- trc_code
	'', -- status
	'', -- intervention_type_id
	'', -- location
	'', -- power_type_id
	'', -- connectivity_type_id
	'', -- warning
	'', -- install_date
	'', -- access_instruction
	'', -- site_state_id
	'', -- service_provider_id
	'', -- road_type_id
	''  -- user_id
);

INSERT INTO `trcs` VALUES (
	5, -- ID
	'Kiembesamaki', -- site_name
	'TRC_0005', -- trc_code
	'', -- status
	'', -- intervention_type_id
	'', -- location
	'', -- power_type_id
	'', -- connectivity_type_id
	'', -- warning
	'', -- install_date
	'', -- access_instruction
	'', -- site_state_id
	'', -- service_provider_id
	'', -- road_type_id
	''  -- user_id
);

INSERT INTO `trcs` VALUES (
	6, -- ID
	'Michakaini', -- site_name
	'TRC_0006', -- trc_code
	'', -- status
	'', -- intervention_type_id
	'', -- location
	'', -- power_type_id
	'', -- connectivity_type_id
	'', -- warning
	'', -- install_date
	'', -- access_instruction
	'', -- site_state_id
	'', -- service_provider_id
	'', -- road_type_id
	''  -- user_id
);

INSERT INTO `trcs` VALUES (
	7, -- ID
	'Mitiulaya', -- site_name
	'TRC_0007', -- trc_code
	'', -- status
	'', -- intervention_type_id
	'', -- location
	'', -- power_type_id
	'', -- connectivity_type_id
	'', -- warning
	'', -- install_date
	'', -- access_instruction
	'', -- site_state_id
	'', -- service_provider_id
	'', -- road_type_id
	''  -- user_id
);

INSERT INTO `trcs` VALUES (
	8, -- ID
	'Wingwi', -- site_name
	'TRC_0008', -- trc_code
	'', -- status
	'', -- intervention_type_id
	'', -- location
	'', -- power_type_id
	'', -- connectivity_type_id
	'', -- warning
	'', -- install_date
	'', -- access_instruction
	'', -- site_state_id
	'', -- service_provider_id
	'', -- road_type_id
	''  -- user_id
);

INSERT INTO `trcs` VALUES (
	9, -- ID
	'Mizingani', -- site_name
	'TRC_0009', -- trc_code
	'', -- status
	'', -- intervention_type_id
	'', -- location
	'', -- power_type_id
	'', -- connectivity_type_id
	'', -- warning
	'', -- install_date
	'', -- access_instruction
	'', -- site_state_id
	'', -- service_provider_id
	'', -- road_type_id
	''  -- user_id
);

INSERT INTO `trcs` VALUES (
	10, -- ID
	'Luchingu', -- site_name
	'TRC_0010', -- trc_code
	'', -- status
	'', -- intervention_type_id
	'', -- location
	'', -- power_type_id
	'', -- connectivity_type_id
	'', -- warning
	'', -- install_date
	'', -- access_instruction
	'', -- site_state_id
	'', -- service_provider_id
	'', -- road_type_id
	''  -- user_id
);

INSERT INTO `trcs` VALUES (
	11, -- ID
	'Kiuta', -- site_name
	'TRC_0011', -- trc_code
	'', -- status
	'', -- intervention_type_id
	'', -- location
	'', -- power_type_id
	'', -- connectivity_type_id
	'', -- warning
	'', -- install_date
	'', -- access_instruction
	'', -- site_state_id
	'', -- service_provider_id
	'', -- road_type_id
	''  -- user_id
);

INSERT INTO `trcs` VALUES (
	12, -- ID
	'Mikumbi', -- site_name
	'TRC_0012', -- trc_code
	'', -- status
	'', -- intervention_type_id
	'', -- location
	'', -- power_type_id
	'', -- connectivity_type_id
	'', -- warning
	'', -- install_date
	'', -- access_instruction
	'', -- site_state_id
	'', -- service_provider_id
	'', -- road_type_id
	''  -- user_id
);

INSERT INTO `trcs` VALUES (
	13, -- ID
	'Kitangari', -- site_name
	'TRC_0013', -- trc_code
	'', -- status
	'', -- intervention_type_id
	'', -- location
	'', -- power_type_id
	'', -- connectivity_type_id
	'', -- warning
	'', -- install_date
	'', -- access_instruction
	'', -- site_state_id
	'', -- service_provider_id
	'', -- road_type_id
	''  -- user_id
);

INSERT INTO `trcs` VALUES (
	14, -- ID
	'Lengo', -- site_name
	'TRC_0014', -- trc_code
	'', -- status
	'', -- intervention_type_id
	'', -- location
	'', -- power_type_id
	'', -- connectivity_type_id
	'', -- warning
	'', -- install_date
	'', -- access_instruction
	'', -- site_state_id
	'', -- service_provider_id
	'', -- road_type_id
	''  -- user_id
);

INSERT INTO `trcs` VALUES (
	15, -- ID
	'Chiungutwa', -- site_name
	'TRC_0015', -- trc_code
	'', -- status
	'', -- intervention_type_id
	'', -- location
	'', -- power_type_id
	'', -- connectivity_type_id
	'', -- warning
	'', -- install_date
	'', -- access_instruction
	'', -- site_state_id
	'', -- service_provider_id
	'', -- road_type_id
	''  -- user_id
);

INSERT INTO `trcs` VALUES (
	16, -- ID
	'Luagala', -- site_name
	'TRC_0016', -- trc_code
	'', -- status
	'', -- intervention_type_id
	'', -- location
	'', -- power_type_id
	'', -- connectivity_type_id
	'', -- warning
	'', -- install_date
	'', -- access_instruction
	'', -- site_state_id
	'', -- service_provider_id
	'', -- road_type_id
	''  -- user_id
);

INSERT INTO `trcs` VALUES (
	17, -- ID
	'Mwitika', -- site_name
	'TRC_0017', -- trc_code
	'', -- status
	'', -- intervention_type_id
	'', -- location
	'', -- power_type_id
	'', -- connectivity_type_id
	'', -- warning
	'', -- install_date
	'', -- access_instruction
	'', -- site_state_id
	'', -- service_provider_id
	'', -- road_type_id
	''  -- user_id
);

INSERT INTO `trcs` VALUES (
	18, -- ID
	'Mwena', -- site_name
	'TRC_0018', -- trc_code
	'', -- status
	'', -- intervention_type_id
	'', -- location
	'', -- power_type_id
	'', -- connectivity_type_id
	'', -- warning
	'', -- install_date
	'', -- access_instruction
	'', -- site_state_id
	'', -- service_provider_id
	'', -- road_type_id
	''  -- user_id
);

INSERT INTO `trcs` VALUES (
	19, -- ID
	'Mkomaindo', -- site_name
	'TRC_0019', -- trc_code
	'', -- status
	'', -- intervention_type_id
	'', -- location
	'', -- power_type_id
	'', -- connectivity_type_id
	'', -- warning
	'', -- install_date
	'', -- access_instruction
	'', -- site_state_id
	'', -- service_provider_id
	'', -- road_type_id
	''  -- user_id
);

INSERT INTO `trcs` VALUES (
	20, -- ID
	'Lukuledi', -- site_name
	'TRC_0020', -- trc_code
	'', -- status
	'', -- intervention_type_id
	'', -- location
	'', -- power_type_id
	'', -- connectivity_type_id
	'', -- warning
	'', -- install_date
	'', -- access_instruction
	'', -- site_state_id
	'', -- service_provider_id
	'', -- road_type_id
	''  -- user_id
);

INSERT INTO `trcs` VALUES (
	21, -- ID
	'Luagala', -- site_name
	'TRC_0021', -- trc_code
	'', -- status
	'', -- intervention_type_id
	'', -- location
	'', -- power_type_id
	'', -- connectivity_type_id
	'', -- warning
	'', -- install_date
	'', -- access_instruction
	'', -- site_state_id
	'', -- service_provider_id
	'', -- road_type_id
	''  -- user_id
);

INSERT INTO `trcs` VALUES (
	22, -- ID
	'Mihambwe', -- site_name
	'TRC_0022', -- trc_code
	'', -- status
	'', -- intervention_type_id
	'', -- location
	'', -- power_type_id
	'', -- connectivity_type_id
	'', -- warning
	'', -- install_date
	'', -- access_instruction
	'', -- site_state_id
	'', -- service_provider_id
	'', -- road_type_id
	''  -- user_id
);

INSERT INTO `trcs` VALUES (
	23, -- ID
	'Matogoro', -- site_name
	'TRC_0023', -- trc_code
	'', -- status
	'', -- intervention_type_id
	'', -- location
	'', -- power_type_id
	'', -- connectivity_type_id
	'', -- warning
	'', -- install_date
	'', -- access_instruction
	'', -- site_state_id
	'', -- service_provider_id
	'', -- road_type_id
	''  -- user_id
);

INSERT INTO `trcs` VALUES (
	24, -- ID
	'Chikongola', -- site_name
	'TRC_0024', -- trc_code
	'', -- status
	'', -- intervention_type_id
	'', -- location
	'', -- power_type_id
	'', -- connectivity_type_id
	'', -- warning
	'', -- install_date
	'', -- access_instruction
	'', -- site_state_id
	'', -- service_provider_id
	'', -- road_type_id
	''  -- user_id
);

INSERT INTO `trcs` VALUES (
	25, -- ID
	'Mchichira', -- site_name
	'TRC_0025', -- trc_code
	'', -- status
	'', -- intervention_type_id
	'', -- location
	'', -- power_type_id
	'', -- connectivity_type_id
	'', -- warning
	'', -- install_date
	'', -- access_instruction
	'', -- site_state_id
	'', -- service_provider_id
	'', -- road_type_id
	''  -- user_id
);

INSERT INTO `trcs` VALUES (
	26, -- ID
	'Majengo', -- site_name
	'TRC_0026', -- trc_code
	'', -- status
	'', -- intervention_type_id
	'', -- location
	'', -- power_type_id
	'', -- connectivity_type_id
	'', -- warning
	'', -- install_date
	'', -- access_instruction
	'', -- site_state_id
	'', -- service_provider_id
	'', -- road_type_id
	''  -- user_id
);

INSERT INTO `trcs` VALUES (
	27, -- ID
	'Mitengo', -- site_name
	'TRC_0027', -- trc_code
	'', -- status
	'', -- intervention_type_id
	'', -- location
	'', -- power_type_id
	'', -- connectivity_type_id
	'', -- warning
	'', -- install_date
	'', -- access_instruction
	'', -- site_state_id
	'', -- service_provider_id
	'', -- road_type_id
	''  -- user_id
);

INSERT INTO `trcs` VALUES (
	28, -- ID
	'Libobe', -- site_name
	'TRC_0028', -- trc_code
	'', -- status
	'', -- intervention_type_id
	'', -- location
	'', -- power_type_id
	'', -- connectivity_type_id
	'', -- warning
	'', -- install_date
	'', -- access_instruction
	'', -- site_state_id
	'', -- service_provider_id
	'', -- road_type_id
	''  -- user_id
);

INSERT INTO `trcs` VALUES (
	29, -- ID
	'Madimba', -- site_name
	'TRC_0029', -- trc_code
	'', -- status
	'', -- intervention_type_id
	'', -- location
	'', -- power_type_id
	'', -- connectivity_type_id
	'', -- warning
	'', -- install_date
	'', -- access_instruction
	'', -- site_state_id
	'', -- service_provider_id
	'', -- road_type_id
	''  -- user_id
);

INSERT INTO `trcs` VALUES (
	30, -- ID
	'Nanguruwe', -- site_name
	'TRC_0030', -- trc_code
	'', -- status
	'', -- intervention_type_id
	'', -- location
	'', -- power_type_id
	'', -- connectivity_type_id
	'', -- warning
	'', -- install_date
	'', -- access_instruction
	'', -- site_state_id
	'', -- service_provider_id
	'', -- road_type_id
	''  -- user_id
);

INSERT INTO `trcs` VALUES (
	31, -- ID
	'Nanyamba', -- site_name
	'TRC_0031', -- trc_code
	'', -- status
	'', -- intervention_type_id
	'', -- location
	'', -- power_type_id
	'', -- connectivity_type_id
	'', -- warning
	'', -- install_date
	'', -- access_instruction
	'', -- site_state_id
	'', -- service_provider_id
	'', -- road_type_id
	''  -- user_id
);

INSERT INTO `trcs` VALUES (
	32, -- ID
	'Nanyumbu', -- site_name
	'TRC_0032', -- trc_code
	'', -- status
	'', -- intervention_type_id
	'', -- location
	'', -- power_type_id
	'', -- connectivity_type_id
	'', -- warning
	'', -- install_date
	'', -- access_instruction
	'', -- site_state_id
	'', -- service_provider_id
	'', -- road_type_id
	''  -- user_id
);

INSERT INTO `trcs` VALUES (
	33, -- ID
	'Nandete', -- site_name
	'TRC_0033', -- trc_code
	'', -- status
	'', -- intervention_type_id
	'', -- location
	'', -- power_type_id
	'', -- connectivity_type_id
	'', -- warning
	'', -- install_date
	'', -- access_instruction
	'', -- site_state_id
	'', -- service_provider_id
	'', -- road_type_id
	''  -- user_id
);

INSERT INTO `trcs` VALUES (
	34, -- ID
	'Mikangaula', -- site_name
	'TRC_0034', -- trc_code
	'', -- status
	'', -- intervention_type_id
	'', -- location
	'', -- power_type_id
	'', -- connectivity_type_id
	'', -- warning
	'', -- install_date
	'', -- access_instruction
	'', -- site_state_id
	'', -- service_provider_id
	'', -- road_type_id
	''  -- user_id
);

INSERT INTO `trcs` VALUES (
	35, -- ID
	'Mangaka', -- site_name
	'TRC_0035', -- trc_code
	'', -- status
	'', -- intervention_type_id
	'', -- location
	'', -- power_type_id
	'', -- connectivity_type_id
	'', -- warning
	'', -- install_date
	'', -- access_instruction
	'', -- site_state_id
	'', -- service_provider_id
	'', -- road_type_id
	''  -- user_id
);

INSERT INTO `trcs` VALUES (
	36, -- ID
	'Michiga', -- site_name
	'TRC_0036', -- trc_code
	'', -- status
	'', -- intervention_type_id
	'', -- location
	'', -- power_type_id
	'', -- connectivity_type_id
	'', -- warning
	'', -- install_date
	'', -- access_instruction
	'', -- site_state_id
	'', -- service_provider_id
	'', -- road_type_id
	''  -- user_id
);




LOCK TABLES `schools` WRITE;

INSERT INTO `schools` VALUES (
	1, -- ID
	1, -- Catchment
	1, -- Area
	8, -- District
	'Kikadini', -- Site Name
	'SK/MS/208', -- School Code
	'', -- Status
	7, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.32954 39.55142)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	2, -- ID
	1, -- Catchment
	1, -- Area
	8, -- District
	'Jambiani', -- Site Name
	'SK/MS/206', -- School Code
	'', -- Status
	7, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.32420 39.54930)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	3, -- ID
	1, -- Catchment
	1, -- Area
	8, -- District
	'Kiongoni', -- Site Name
	'SK/MS/56', -- School Code
	'', -- Status
	7, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.41294 39.55437)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	4, -- ID
	1, -- Catchment
	1, -- Area
	1, -- District
	'Charawe', -- Site Name
	'SK/MS/44', -- School Code
	'', -- Status
	7, -- TC/TRC
	1, -- Intervention Type
	GeomFromText('POINT(-6.18848 39.44058)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	5, -- ID
	1, -- Catchment
	1, -- Area
	8, -- District
	'Paje', -- Site Name
	'SK/MSS/05', -- School Code
	'', -- Status
	7, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.26482 39.53314)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	6, -- ID
	1, -- Catchment
	1, -- Area
	1, -- District
	'Michamvi', -- Site Name
	'SK/MS/45', -- School Code
	'', -- Status
	7, -- TC/TRC
	3, -- Intervention Type
	GeomFromText('POINT(-6.14495 39.50033)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	7, -- ID
	1, -- Catchment
	1, -- Area
	8, -- District
	'Kusini', -- Site Name
	'SK/MS/57', -- School Code
	'', -- Status
	7, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.42438 39.55445)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	8, -- ID
	1, -- Catchment
	1, -- Area
	1, -- District
	'Pete', -- Site Name
	'SK/MS/107', -- School Code
	'', -- Status
	7, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.28359 39.40592)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	9, -- ID
	1, -- Catchment
	1, -- Area
	8, -- District
	'Kizimkazi Dimbani', -- Site Name
	'SK/MSK/106', -- School Code
	'', -- Status
	7, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.45288 39.47190)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	10, -- ID
	1, -- Catchment
	1, -- Area
	1, -- District
	'Unguja Ukuu', -- Site Name
	'SK/MS/210', -- School Code
	'', -- Status
	7, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.28848 39.37037)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	11, -- ID
	1, -- Catchment
	1, -- Area
	1, -- District
	'Kikungwi', -- Site Name
	'SK/MS/157', -- School Code
	'', -- Status
	7, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.27407 39.34526)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	12, -- ID
	1, -- Catchment
	1, -- Area
	8, -- District
	'Miwaleni', -- Site Name
	'SK/MMSK/01', -- School Code
	'', -- Status
	7, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.41943 39.54459)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	13, -- ID
	1, -- Catchment
	1, -- Area
	8, -- District
	'Kitogani', -- Site Name
	'SK/MMS/02', -- School Code
	'', -- Status
	7, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	14, -- ID
	1, -- Catchment
	1, -- Area
	1, -- District
	'Bungi', -- Site Name
	'SK/MS/177', -- School Code
	'', -- Status
	7, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.24842 39.33256)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	15, -- ID
	1, -- Catchment
	1, -- Area
	8, -- District
	'Muungoni', -- Site Name
	'SK/MS/139', -- School Code
	'', -- Status
	7, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.31076 39.43050)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	16, -- ID
	1, -- Catchment
	1, -- Area
	8, -- District
	'Bwejuu', -- Site Name
	'SK/MSK/70', -- School Code
	'', -- Status
	7, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.24233 39.53336)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	17, -- ID
	1, -- Catchment
	1, -- Area
	8, -- District
	'Kibuteni', -- Site Name
	'SK/MS/74', -- School Code
	'', -- Status
	7, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.41776 39.49348)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	18, -- ID
	1, -- Catchment
	1, -- Area
	1, -- District
	'Uzi', -- Site Name
	'SK/MSK/50', -- School Code
	'', -- Status
	7, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.33668 39.40459)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	19, -- ID
	1, -- Catchment
	1, -- Area
	8, -- District
	'Kajengwa', -- Site Name
	'SK/MS/55', -- School Code
	'', -- Status
	7, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.40105 39.54710)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	20, -- ID
	1, -- Catchment
	1, -- Area
	8, -- District
	'Mtende', -- Site Name
	'SK/MSK/73', -- School Code
	'', -- Status
	7, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.44978 39.52643)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	21, -- ID
	1, -- Catchment
	1, -- Area
	8, -- District
	'Muyuni', -- Site Name
	'SK/MSK/75', -- School Code
	'', -- Status
	7, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.36592 39.45700)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	22, -- ID
	1, -- Catchment
	1, -- Area
	8, -- District
	'Kizimkazi', -- Site Name
	'SK/MSK/74', -- School Code
	'', -- Status
	7, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.45288 39.47190)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	23, -- ID
	1, -- Catchment
	1, -- Area
	1, -- District
	'Ukongoroni', -- Site Name
	'SK/MSK/79', -- School Code
	'', -- Status
	7, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.20319 39.48019)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	24, -- ID
	1, -- Catchment
	1, -- Area
	1, -- District
	'Bambi', -- Site Name
	'SK/MSK/54', -- School Code
	'', -- Status
	1, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.08185 39.34835)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	25, -- ID
	1, -- Catchment
	1, -- Area
	1, -- District
	'Cheju', -- Site Name
	'SK/MSK/122', -- School Code
	'', -- Status
	1, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.21116 39.38236)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	26, -- ID
	1, -- Catchment
	1, -- Area
	1, -- District
	'Chwaka', -- Site Name
	'SK/MSK/52', -- School Code
	'', -- Status
	1, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.16560 39.43624)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	27, -- ID
	1, -- Catchment
	1, -- Area
	1, -- District
	'Dunga', -- Site Name
	'SK/MS/194', -- School Code
	'', -- Status
	1, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	28, -- ID
	1, -- Catchment
	1, -- Area
	1, -- District
	'Ghana', -- Site Name
	'SK/MS/99', -- School Code
	'', -- Status
	1, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.04340 39.30108)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	29, -- ID
	1, -- Catchment
	1, -- Area
	1, -- District
	'Kidimni', -- Site Name
	'SK/MS/171', -- School Code
	'', -- Status
	1, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.11624 39.30476)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	30, -- ID
	1, -- Catchment
	1, -- Area
	1, -- District
	'Mwera', -- Site Name
	'SK/MS/128', -- School Code
	'', -- Status
	1, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.14377 39.27216)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	31, -- ID
	1, -- Catchment
	1, -- Area
	9, -- District
	'Regezamwendo', -- Site Name
	'SK/MS/204', -- School Code
	'', -- Status
	1, -- TC/TRC
	3, -- Intervention Type
	GeomFromText('POINT(-6.14972 39.25730)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	32, -- ID
	1, -- Catchment
	1, -- Area
	1, -- District
	'Umbuji', -- Site Name
	'SK/MS/43', -- School Code
	'', -- Status
	1, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.11847 39.37058)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	33, -- ID
	1, -- Catchment
	1, -- Area
	1, -- District
	'Ndijani', -- Site Name
	'SK/MS/95', -- School Code
	'', -- Status
	1, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.17744 39.34807)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	34, -- ID
	1, -- Catchment
	1, -- Area
	1, -- District
	'Ndijani Mseweni', -- Site Name
	'SK/MMS/07', -- School Code
	'', -- Status
	1, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.18988 39.35225)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	35, -- ID
	1, -- Catchment
	1, -- Area
	1, -- District
	'Uroa', -- Site Name
	'SK/MS/188', -- School Code
	'', -- Status
	1, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.09264 39.42505)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	36, -- ID
	1, -- Catchment
	1, -- Area
	1, -- District
	'Jendele', -- Site Name
	'SK/MS/42', -- School Code
	'', -- Status
	1, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.17861 39.37288)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	37, -- ID
	1, -- Catchment
	1, -- Area
	1, -- District
	'Mchangani', -- Site Name
	'SK/MS/76', -- School Code
	'', -- Status
	1, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.04325 39.33459)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	38, -- ID
	1, -- Catchment
	1, -- Area
	1, -- District
	'Marumbi', -- Site Name
	'SK/MS/140', -- School Code
	'', -- Status
	1, -- TC/TRC
	1, -- Intervention Type
	GeomFromText('POINT(-6.12795 39.42345)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	39, -- ID
	1, -- Catchment
	1, -- Area
	1, -- District
	'Machui', -- Site Name
	'SK/MS/105', -- School Code
	'', -- Status
	1, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.10119 39.28576)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	40, -- ID
	1, -- Catchment
	1, -- Area
	1, -- District
	'Ubago', -- Site Name
	'SK/MS/77', -- School Code
	'', -- Status
	1, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.11624 39.30476)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	41, -- ID
	1, -- Catchment
	1, -- Area
	1, -- District
	'Kiboje', -- Site Name
	'SK/MS/207', -- School Code
	'', -- Status
	1, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.08127 39.30689)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	42, -- ID
	1, -- Catchment
	1, -- Area
	1, -- District
	'Tunguu', -- Site Name
	'SK/MS/111', -- School Code
	'', -- Status
	1, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.18565 39.32711)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	43, -- ID
	1, -- Catchment
	1, -- Area
	1, -- District
	'Kibele', -- Site Name
	'SK/MSK/49', -- School Code
	'', -- Status
	1, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.13428 39.32057)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	44, -- ID
	1, -- Catchment
	1, -- Area
	1, -- District
	'Uzini', -- Site Name
	'SK/MS/85', -- School Code
	'', -- Status
	1, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.07189 39.32961)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	45, -- ID
	1, -- Catchment
	1, -- Area
	1, -- District
	'Pagali', -- Site Name
	'SK/MS/154', -- School Code
	'', -- Status
	1, -- TC/TRC
	3, -- Intervention Type
	GeomFromText('POINT(-6.10620 39.34683)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	46, -- ID
	1, -- Catchment
	1, -- Area
	1, -- District
	'Miwani', -- Site Name
	'SK/MS/153', -- School Code
	'', -- Status
	1, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.08187 39.27848)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	47, -- ID
	1, -- Catchment
	1, -- Area
	1, -- District
	'Pongwe Mwera', -- Site Name
	'SK/MS/147', -- School Code
	'', -- Status
	1, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.16110 39.28635)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	48, -- ID
	1, -- Catchment
	1, -- Area
	1, -- District
	'Pongwe Pwani', -- Site Name
	'SK/MMSK/02', -- School Code
	'', -- Status
	1, -- TC/TRC
	1, -- Intervention Type
	GeomFromText('POINT(-6.04490 39.40485)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	49, -- ID
	1, -- Catchment
	1, -- Area
	1, -- District
	'Jumbi', -- Site Name
	'SK/MS/143', -- School Code
	'', -- Status
	1, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.19655 39.30302)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	50, -- ID
	1, -- Catchment
	1, -- Area
	9, -- District
	'Bububu \'a\'', -- Site Name
	'SK/MSK/59', -- School Code
	'', -- Status
	8, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.10586 39.21657)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	51, -- ID
	1, -- Catchment
	1, -- Area
	9, -- District
	'Bububu \'b\'', -- Site Name
	'SK/MS/104', -- School Code
	'', -- Status
	8, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.10586 39.21657)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	52, -- ID
	1, -- Catchment
	1, -- Area
	3, -- District
	'Bumbwini', -- Site Name
	'SK/MSK/10', -- School Code
	'', -- Status
	8, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.97057 39.19697)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	53, -- ID
	1, -- Catchment
	1, -- Area
	10, -- District
	'Chumbuni', -- Site Name
	'SK/MS/49', -- School Code
	'', -- Status
	8, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.14402 39.21566)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	54, -- ID
	1, -- Catchment
	1, -- Area
	10, -- District
	'Darajani', -- Site Name
	'SK/MS/15', -- School Code
	'', -- Status
	8, -- TC/TRC
	3, -- Intervention Type
	GeomFromText('POINT(-6.16399 39.19294)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	55, -- ID
	1, -- Catchment
	1, -- Area
	9, -- District
	'Dole', -- Site Name
	'SK/MMS/01', -- School Code
	'', -- Status
	8, -- TC/TRC
	3, -- Intervention Type
	GeomFromText('POINT(-6.10455 39.25730)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	56, -- ID
	1, -- Catchment
	1, -- Area
	10, -- District
	'Kajificheni', -- Site Name
	'SK/MS/10', -- School Code
	'', -- Status
	8, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.16248 39.19027)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	57, -- ID
	1, -- Catchment
	1, -- Area
	9, -- District
	'Kibweni', -- Site Name
	'SK/MS/205', -- School Code
	'', -- Status
	8, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.11510 39.22690)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	58, -- ID
	1, -- Catchment
	1, -- Area
	9, -- District
	'Kidichi', -- Site Name
	'SK/MS/202', -- School Code
	'', -- Status
	8, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.09417 39.23285)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	59, -- ID
	1, -- Catchment
	1, -- Area
	10, -- District
	'Kilimahewa \'a\'', -- Site Name
	'SK/MS/48', -- School Code
	'', -- Status
	8, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.16017 39.22220)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	60, -- ID
	1, -- Catchment
	1, -- Area
	10, -- District
	'Kilimahewa \'b\'', -- Site Name
	'SK/MS/152', -- School Code
	'', -- Status
	8, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.16017 39.22220)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	61, -- ID
	1, -- Catchment
	1, -- Area
	9, -- District
	'Kizimbani', -- Site Name
	'SK/MS/218', -- School Code
	'', -- Status
	8, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.08584 39.26019)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	62, -- ID
	1, -- Catchment
	1, -- Area
	10, -- District
	'Makadara (Makadala)', -- Site Name
	'SK/MS/167', -- School Code
	'', -- Status
	8, -- TC/TRC
	3, -- Intervention Type
	GeomFromText('POINT(-6.15912 39.20677)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	63, -- ID
	1, -- Catchment
	1, -- Area
	3, -- District
	'Makoba', -- Site Name
	'SK/MS/2', -- School Code
	'', -- Status
	8, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.95555 39.19328)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	64, -- ID
	1, -- Catchment
	1, -- Area
	3, -- District
	'Mangapwani', -- Site Name
	'SK/MS/186', -- School Code
	'', -- Status
	8, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.98570 39.19716)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	65, -- ID
	1, -- Catchment
	1, -- Area
	9, -- District
	'Mtoni Kidatu', -- Site Name
	'SK/MS/187', -- School Code
	'', -- Status
	8, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.13490 39.23251)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	66, -- ID
	1, -- Catchment
	1, -- Area
	9, -- District
	'Mtopepo \'a\'', -- Site Name
	'SK/MSK/86', -- School Code
	'', -- Status
	8, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.14691 39.22154)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	67, -- ID
	1, -- Catchment
	1, -- Area
	9, -- District
	'Mtopepo \'b\'', -- Site Name
	'SK/MS/92', -- School Code
	'', -- Status
	8, -- TC/TRC
	1, -- Intervention Type
	GeomFromText('POINT(-6.14667 39.22095)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	68, -- ID
	1, -- Catchment
	1, -- Area
	10, -- District
	'Rahaleo', -- Site Name
	'SK/MS/19', -- School Code
	'', -- Status
	8, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.16471 39.20277)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	69, -- ID
	1, -- Catchment
	1, -- Area
	10, -- District
	'Shaurimoyo', -- Site Name
	'SK/MS/18', -- School Code
	'', -- Status
	8, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.15700 39.21315)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	70, -- ID
	1, -- Catchment
	1, -- Area
	9, -- District
	'Welezo', -- Site Name
	'SK/MS/190', -- School Code
	'', -- Status
	8, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.15698 39.23086)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	71, -- ID
	1, -- Catchment
	1, -- Area
	9, -- District
	'Mwachealale', -- Site Name
	'SK/MS/176', -- School Code
	'', -- Status
	8, -- TC/TRC
	3, -- Intervention Type
	GeomFromText('POINT(-6.03548 39.26422)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	72, -- ID
	1, -- Catchment
	1, -- Area
	9, -- District
	'Chuini', -- Site Name
	'SK/MS/69', -- School Code
	'', -- Status
	8, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.06775 39.22245)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	73, -- ID
	1, -- Catchment
	1, -- Area
	3, -- District
	'Fujoni', -- Site Name
	'SK/MSK/78', -- School Code
	'', -- Status
	8, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.01169 39.20197)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	74, -- ID
	1, -- Catchment
	1, -- Area
	9, -- District
	'Kama', -- Site Name
	'SK/MS/170', -- School Code
	'', -- Status
	8, -- TC/TRC
	1, -- Intervention Type
	GeomFromText('POINT(-6.04702 39.22200)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	75, -- ID
	1, -- Catchment
	1, -- Area
	3, -- District
	'Kiyongwe', -- Site Name
	'SK/MSK/114', -- School Code
	'', -- Status
	8, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.92245 39.19601)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	76, -- ID
	1, -- Catchment
	1, -- Area
	9, -- District
	'Langoni', -- Site Name
	'SK/MSK/62', -- School Code
	'', -- Status
	8, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.09735 39.25200)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	77, -- ID
	1, -- Catchment
	1, -- Area
	9, -- District
	'Mbuzini', -- Site Name
	'SK/MSK/101', -- School Code
	'', -- Status
	8, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.07043 39.23647)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	78, -- ID
	1, -- Catchment
	1, -- Area
	9, -- District
	'Mtoni Kigomeni', -- Site Name
	'SK/MS/102', -- School Code
	'', -- Status
	8, -- TC/TRC
	1, -- Intervention Type
	GeomFromText('POINT(-6.12608 39.22008)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	79, -- ID
	1, -- Catchment
	1, -- Area
	9, -- District
	'Mwenge', -- Site Name
	'SK/MS/078', -- School Code
	'', -- Status
	8, -- TC/TRC
	1, -- Intervention Type
	GeomFromText('POINT(-6.05862 39.25422)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	80, -- ID
	1, -- Catchment
	1, -- Area
	10, -- District
	'Mwembemakumbi', -- Site Name
	'SK/MS/04', -- School Code
	'', -- Status
	8, -- TC/TRC
	3, -- Intervention Type
	GeomFromText('POINT(-6.14873 39.21048)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	81, -- ID
	1, -- Catchment
	1, -- Area
	9, -- District
	'Kianga', -- Site Name
	'SK/MS/97', -- School Code
	'', -- Status
	8, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.13603 39.25603)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	82, -- ID
	1, -- Catchment
	1, -- Area
	9, -- District
	'Mfenesini', -- Site Name
	'SK/MSK/63', -- School Code
	'', -- Status
	8, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.04232 39.22939)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	83, -- ID
	1, -- Catchment
	1, -- Area
	2, -- District
	'Nungwi', -- Site Name
	'SK/MSK/07', -- School Code
	'', -- Status
	2, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.72888 39.29307)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	84, -- ID
	1, -- Catchment
	1, -- Area
	2, -- District
	'Kilindi', -- Site Name
	'SK/MSK/124', -- School Code
	'', -- Status
	2, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.75615 39.29976)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	85, -- ID
	1, -- Catchment
	1, -- Area
	2, -- District
	'Kigunda', -- Site Name
	'SK/MS/146', -- School Code
	'', -- Status
	2, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.77803 39.29943)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	86, -- ID
	1, -- Catchment
	1, -- Area
	2, -- District
	'Kidoti', -- Site Name
	'SK/MSK/6', -- School Code
	'', -- Status
	2, -- TC/TRC
	1, -- Intervention Type
	GeomFromText('POINT(-5.79127 39.30103)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	87, -- ID
	1, -- Catchment
	1, -- Area
	2, -- District
	'Fukuchani ', -- Site Name
	'SK/MS/61', -- School Code
	'', -- Status
	2, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.82112 39.29077)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	88, -- ID
	1, -- Catchment
	1, -- Area
	2, -- District
	'Potoa', -- Site Name
	'SK/MSK/5', -- School Code
	'', -- Status
	2, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.86448 39.28038)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	89, -- ID
	1, -- Catchment
	1, -- Area
	2, -- District
	'Mkwajuni ', -- Site Name
	'SK/MS/47', -- School Code
	'', -- Status
	2, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.88253 39.28456)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	90, -- ID
	1, -- Catchment
	1, -- Area
	2, -- District
	'Mkokotoni', -- Site Name
	'SK/MS/149', -- School Code
	'', -- Status
	2, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.87423 39.25779)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	91, -- ID
	1, -- Catchment
	1, -- Area
	2, -- District
	'Pale Msingi', -- Site Name
	'SM/MSK/2', -- School Code
	'', -- Status
	2, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.89994 39.25171)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	92, -- ID
	1, -- Catchment
	1, -- Area
	2, -- District
	'Jongowe ', -- Site Name
	'SK/MS/159', -- School Code
	'', -- Status
	2, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.85714 39.21742)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	93, -- ID
	1, -- Catchment
	1, -- Area
	2, -- District
	'Tumbatu ', -- Site Name
	'SK/MS/162', -- School Code
	'', -- Status
	2, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.83401 39.23327)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	94, -- ID
	1, -- Catchment
	1, -- Area
	2, -- District
	'Kibeni', -- Site Name
	'SK/MS/148', -- School Code
	'', -- Status
	2, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.87541 39.29169)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	95, -- ID
	1, -- Catchment
	1, -- Area
	2, -- District
	'Kibuyuni', -- Site Name
	'SK/MS/72', -- School Code
	'', -- Status
	2, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.88871 39.29929)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	96, -- ID
	1, -- Catchment
	1, -- Area
	2, -- District
	'Kijini', -- Site Name
	'SK/MSK/81', -- School Code
	'', -- Status
	2, -- TC/TRC
	1, -- Intervention Type
	GeomFromText('POINT(-5.83937 39.33003)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	97, -- ID
	1, -- Catchment
	1, -- Area
	2, -- District
	'Mbuyu Tende', -- Site Name
	'SK/MS/232', -- School Code
	'', -- Status
	2, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.82477 39.34797)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	98, -- ID
	1, -- Catchment
	1, -- Area
	2, -- District
	'Mfuru Matonga', -- Site Name
	'SK/MS/144', -- School Code
	'', -- Status
	2, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.88065 39.33345)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	99, -- ID
	1, -- Catchment
	1, -- Area
	2, -- District
	'Matemwe', -- Site Name
	'SK/MSK/09', -- School Code
	'', -- Status
	2, -- TC/TRC
	1, -- Intervention Type
	GeomFromText('POINT(-5.87548 39.35122)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	100, -- ID
	1, -- Catchment
	1, -- Area
	2, -- District
	'Kigomani', -- Site Name
	'SK/MS/164', -- School Code
	'', -- Status
	2, -- TC/TRC
	1, -- Intervention Type
	GeomFromText('POINT(-5.85210 39.35487)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	101, -- ID
	1, -- Catchment
	1, -- Area
	2, -- District
	'Kilimajuu', -- Site Name
	'SK/MS/231', -- School Code
	'', -- Status
	2, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.89602 39.35177)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	102, -- ID
	1, -- Catchment
	1, -- Area
	2, -- District
	'Pwani Mchangani', -- Site Name
	'SK/MSK/64', -- School Code
	'', -- Status
	2, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.92028 39.35569)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	103, -- ID
	1, -- Catchment
	1, -- Area
	2, -- District
	'Gamba', -- Site Name
	'SK/MS/71', -- School Code
	'', -- Status
	2, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.91160 39.30111)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	104, -- ID
	1, -- Catchment
	1, -- Area
	2, -- District
	'Moga', -- Site Name
	'SK/MS/219', -- School Code
	'', -- Status
	2, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.90630 39.29478)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	105, -- ID
	1, -- Catchment
	1, -- Area
	2, -- District
	'Chaani ', -- Site Name
	'SK/MS/173', -- School Code
	'', -- Status
	2, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.93005 39.29937)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	106, -- ID
	1, -- Catchment
	1, -- Area
	2, -- District
	'Kikobweni (Chaani Kikobweni)', -- Site Name
	'SK/MS/141', -- School Code
	'', -- Status
	2, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.94869 39.30543)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	107, -- ID
	1, -- Catchment
	1, -- Area
	2, -- District
	'Kinyasini', -- Site Name
	'SK/MS/70', -- School Code
	'', -- Status
	2, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.96946 39.30730)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	108, -- ID
	1, -- Catchment
	1, -- Area
	3, -- District
	'Kilombero', -- Site Name
	'SK/MS/151', -- School Code
	'', -- Status
	2, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.02266 39.32723)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	109, -- ID
	1, -- Catchment
	1, -- Area
	3, -- District
	'Upenja', -- Site Name
	'SK/MS/156', -- School Code
	'', -- Status
	2, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.98451 39.33165)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	110, -- ID
	1, -- Catchment
	1, -- Area
	3, -- District
	'Kiwengwa', -- Site Name
	'SK/MS/03', -- School Code
	'', -- Status
	2, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.99580 39.38021)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	111, -- ID
	1, -- Catchment
	1, -- Area
	2, -- District
	'Banda Maji', -- Site Name
	'SK/MS/145', -- School Code
	'', -- Status
	2, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.96183 39.29744)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	112, -- ID
	1, -- Catchment
	1, -- Area
	3, -- District
	'Mgambo', -- Site Name
	'SK/MS/174', -- School Code
	'', -- Status
	2, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.97601 39.29540)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	113, -- ID
	1, -- Catchment
	1, -- Area
	3, -- District
	'Kinduni', -- Site Name
	'SK/MS/193', -- School Code
	'', -- Status
	2, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.99049 39.26424)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	114, -- ID
	1, -- Catchment
	1, -- Area
	3, -- District
	'Mahonda', -- Site Name
	'SK/MS/158', -- School Code
	'', -- Status
	2, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.99355 39.25269)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	115, -- ID
	1, -- Catchment
	1, -- Area
	3, -- District
	'Kitope', -- Site Name
	'SK/MS/54', -- School Code
	'', -- Status
	2, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.01567 39.25198)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	116, -- ID
	1, -- Catchment
	1, -- Area
	3, -- District
	'Donge Karange', -- Site Name
	'SK/MS/161', -- School Code
	'', -- Status
	2, -- TC/TRC
	3, -- Intervention Type
	GeomFromText('POINT(-5.96342 39.24963)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	117, -- ID
	1, -- Catchment
	1, -- Area
	3, -- District
	'Donge Primary', -- Site Name
	'SK/MS/62', -- School Code
	'', -- Status
	2, -- TC/TRC
	1, -- Intervention Type
	GeomFromText('POINT(-5.94208 39.25193)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	118, -- ID
	1, -- Catchment
	1, -- Area
	3, -- District
	'Donge Mtambile', -- Site Name
	'SK/MS/163', -- School Code
	'', -- Status
	2, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.93026 39.25380)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	119, -- ID
	1, -- Catchment
	1, -- Area
	3, -- District
	'Mwanda', -- Site Name
	'SK/MS/125', -- School Code
	'', -- Status
	2, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.92294 39.24081)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	120, -- ID
	1, -- Catchment
	1, -- Area
	3, -- District
	'Donge Kipange', -- Site Name
	'SK/MMS/03', -- School Code
	'', -- Status
	2, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	121, -- ID
	1, -- Catchment
	1, -- Area
	2, -- District
	'Kandwi', -- Site Name
	'SK/MS/169', -- School Code
	'', -- Status
	2, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.92839 39.34060)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	122, -- ID
	1, -- Catchment
	1, -- Area
	9, -- District
	'Bwefum', -- Site Name
	'SK/MSK/60', -- School Code
	'', -- Status
	9, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.30999 39.29622)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	123, -- ID
	1, -- Catchment
	1, -- Area
	10, -- District
	'Mkunazini', -- Site Name
	'SK/MS/07', -- School Code
	'', -- Status
	9, -- TC/TRC
	3, -- Intervention Type
	GeomFromText('POINT(-6.16355 39.19333)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	124, -- ID
	1, -- Catchment
	1, -- Area
	10, -- District
	'Kisiwandui', -- Site Name
	'SK/MS/11', -- School Code
	'', -- Status
	9, -- TC/TRC
	1, -- Intervention Type
	GeomFromText('POINT(-6.16506 39.19483)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	125, -- ID
	1, -- Catchment
	1, -- Area
	10, -- District
	'Mwembeshauri', -- Site Name
	'SK/MS/05', -- School Code
	'', -- Status
	9, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.16489 39.20346)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	126, -- ID
	1, -- Catchment
	1, -- Area
	10, -- District
	'Muungano', -- Site Name
	'SK/MS/66', -- School Code
	'', -- Status
	9, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.16540 39.21407)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	127, -- ID
	1, -- Catchment
	1, -- Area
	10, -- District
	'Sebleni', -- Site Name
	'SK/MS/94', -- School Code
	'', -- Status
	9, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.16610 39.21547)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	128, -- ID
	1, -- Catchment
	1, -- Area
	10, -- District
	'Nyerere Msingi', -- Site Name
	'SK/MS/93', -- School Code
	'', -- Status
	9, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.16844 39.22515)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	129, -- ID
	1, -- Catchment
	1, -- Area
	9, -- District
	'Kinuni', -- Site Name
	'SK/MS/127', -- School Code
	'', -- Status
	9, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.17215 39.24797)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	130, -- ID
	1, -- Catchment
	1, -- Area
	9, -- District
	'Magogoni', -- Site Name
	'SK/MS/229', -- School Code
	'', -- Status
	9, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	131, -- ID
	1, -- Catchment
	1, -- Area
	9, -- District
	'Kijito Upele', -- Site Name
	'SK/MS/160', -- School Code
	'', -- Status
	9, -- TC/TRC
	3, -- Intervention Type
	GeomFromText('POINT(-6.18630 39.23985)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	132, -- ID
	1, -- Catchment
	1, -- Area
	9, -- District
	'Fuoni Msingi', -- Site Name
	'SK/MMS/106', -- School Code
	'', -- Status
	9, -- TC/TRC
	1, -- Intervention Type
	GeomFromText('POINT(-6.19653 39.26450)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	133, -- ID
	1, -- Catchment
	1, -- Area
	9, -- District
	'Kitongani', -- Site Name
	'SK/MMS/04', -- School Code
	'', -- Status
	9, -- TC/TRC
	1, -- Intervention Type
	GeomFromText('POINT(-6.21950 39.26060)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	134, -- ID
	1, -- Catchment
	1, -- Area
	9, -- District
	'Kibondeni', -- Site Name
	'SK/MSK/125', -- School Code
	'', -- Status
	9, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.22087 39.29074)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	135, -- ID
	1, -- Catchment
	1, -- Area
	9, -- District
	'Dimani', -- Site Name
	'SK/MSK/129', -- School Code
	'', -- Status
	9, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.26711 39.26653)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	136, -- ID
	1, -- Catchment
	1, -- Area
	9, -- District
	'Kombeni', -- Site Name
	'SK/MSK/61', -- School Code
	'', -- Status
	9, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.25905 39.26077)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	137, -- ID
	1, -- Catchment
	1, -- Area
	9, -- District
	'Maungani', -- Site Name
	'SK/MSK/112', -- School Code
	'', -- Status
	9, -- TC/TRC
	3, -- Intervention Type
	GeomFromText('POINT(-6.23217 39.24432)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	138, -- ID
	1, -- Catchment
	1, -- Area
	9, -- District
	'Kisauni', -- Site Name
	'SK/MS/50', -- School Code
	'', -- Status
	9, -- TC/TRC
	1, -- Intervention Type
	GeomFromText('POINT(-6.22115 39.23342)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	139, -- ID
	1, -- Catchment
	1, -- Area
	10, -- District
	'Kiembe Samaki ', -- Site Name
	'SK/MSK/04', -- School Code
	'', -- Status
	9, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	140, -- ID
	1, -- Catchment
	1, -- Area
	9, -- District
	'Chukwani', -- Site Name
	'SK/MSK/84', -- School Code
	'', -- Status
	9, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.22733 39.21663)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	141, -- ID
	1, -- Catchment
	1, -- Area
	10, -- District
	'Jang\'ombe Msingi \'a\'', -- Site Name
	'SK/MS/17', -- School Code
	'', -- Status
	9, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.17534 39.20580)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	142, -- ID
	1, -- Catchment
	1, -- Area
	10, -- District
	'Jang\'ombe Msingi \'b\'', -- Site Name
	'SK/MS/235', -- School Code
	'', -- Status
	9, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.17534 39.20580)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	143, -- ID
	1, -- Catchment
	1, -- Area
	10, -- District
	'Kidongochekundu \'a\'', -- Site Name
	'SK/MS/08', -- School Code
	'', -- Status
	9, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.17368 39.21183)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	144, -- ID
	1, -- Catchment
	1, -- Area
	10, -- District
	'Kidongochekundu \'b\'', -- Site Name
	'SK/MS/108', -- School Code
	'', -- Status
	9, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.17368 39.21183)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	145, -- ID
	1, -- Catchment
	1, -- Area
	9, -- District
	'Mwanakwerekwe \'b\'', -- Site Name
	'SK/MS/52', -- School Code
	'', -- Status
	9, -- TC/TRC
	1, -- Intervention Type
	GeomFromText('POINT(-6.17925 39.22288)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	146, -- ID
	1, -- Catchment
	1, -- Area
	9, -- District
	'Mwanakwerekwe \'c\'', -- Site Name
	'SK/MS/53', -- School Code
	'', -- Status
	9, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.18243 39.22634)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	147, -- ID
	1, -- Catchment
	1, -- Area
	9, -- District
	'Mwanakwerekwe \'d\'', -- Site Name
	'SK/MS/22', -- School Code
	'', -- Status
	9, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.18066 39.22213)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	148, -- ID
	1, -- Catchment
	1, -- Area
	9, -- District
	'Mwanakwerekwe \'e\'', -- Site Name
	'SK/MS/23', -- School Code
	'', -- Status
	9, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-6.17875 39.22266)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	149, -- ID
	1, -- Catchment
	2, -- Area
	4, -- District
	'Chanjamjawiri', -- Site Name
	'SK/MS/116', -- School Code
	'', -- Status
	3, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.29921 39.76083)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	150, -- ID
	1, -- Catchment
	2, -- Area
	5, -- District
	'Uwandani', -- Site Name
	'SK/MS/30', -- School Code
	'', -- Status
	3, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.19891 39.82372)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	151, -- ID
	1, -- Catchment
	2, -- Area
	4, -- District
	'Kilindi', -- Site Name
	'SK/MS/150', -- School Code
	'', -- Status
	3, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.26987 39.71228)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	152, -- ID
	1, -- Catchment
	2, -- Area
	4, -- District
	'Michakaini \'a\' Basic', -- Site Name
	'SK/MS/29', -- School Code
	'', -- Status
	3, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.24054 39.77227)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	153, -- ID
	1, -- Catchment
	2, -- Area
	4, -- District
	'Vitongoji', -- Site Name
	'SK/MS/138', -- School Code
	'', -- Status
	3, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.23065 39.82508)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	154, -- ID
	1, -- Catchment
	2, -- Area
	4, -- District
	'Wawi', -- Site Name
	'SK/MS/114', -- School Code
	'', -- Status
	3, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.25618 39.79104)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	155, -- ID
	1, -- Catchment
	2, -- Area
	5, -- District
	'Ole', -- Site Name
	'SK/MS/216', -- School Code
	'', -- Status
	3, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.18515 39.81114)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	156, -- ID
	1, -- Catchment
	2, -- Area
	4, -- District
	'Wesha', -- Site Name
	'SK/MSK/100', -- School Code
	'', -- Status
	3, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.22613 39.73211)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	157, -- ID
	1, -- Catchment
	2, -- Area
	5, -- District
	'Kangagani', -- Site Name
	'SK/MS/182', -- School Code
	'', -- Status
	3, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.16542 39.82595)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	158, -- ID
	1, -- Catchment
	2, -- Area
	4, -- District
	'Matale', -- Site Name
	'SK/MS/209', -- School Code
	'', -- Status
	3, -- TC/TRC
	1, -- Intervention Type
	GeomFromText('POINT(-5.30378 39.77775)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	159, -- ID
	1, -- Catchment
	2, -- Area
	4, -- District
	'Ziwani', -- Site Name
	'SK/MSK/22', -- School Code
	'', -- Status
	3, -- TC/TRC
	3, -- Intervention Type
	GeomFromText('POINT(-5.18092 39.81082)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	160, -- ID
	1, -- Catchment
	2, -- Area
	4, -- District
	'Furaha', -- Site Name
	'SK/MS/223', -- School Code
	'', -- Status
	3, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.26215 39.81974)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	161, -- ID
	1, -- Catchment
	2, -- Area
	4, -- District
	'Shungi', -- Site Name
	'SK/MS/112', -- School Code
	'', -- Status
	3, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.27039 39.73772)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	162, -- ID
	1, -- Catchment
	2, -- Area
	4, -- District
	'Pembeni', -- Site Name
	'SK/MS/166', -- School Code
	'', -- Status
	3, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.18849 39.74717)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	163, -- ID
	1, -- Catchment
	2, -- Area
	4, -- District
	'Dodo', -- Site Name
	'SK/MS/225', -- School Code
	'', -- Status
	3, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.30500 39.78996)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	164, -- ID
	1, -- Catchment
	2, -- Area
	4, -- District
	'Ndagoni', -- Site Name
	'SK/MSS/11', -- School Code
	'', -- Status
	3, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.21032 39.69272)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	165, -- ID
	1, -- Catchment
	2, -- Area
	4, -- District
	'Michakaini \'b\' Primary', -- Site Name
	'SK/MS/233', -- School Code
	'', -- Status
	3, -- TC/TRC
	1, -- Intervention Type
	GeomFromText('POINT(-5.24068 39.77207)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	166, -- ID
	1, -- Catchment
	2, -- Area
	4, -- District
	'Mbuzini', -- Site Name
	'SK/MS/86', -- School Code
	'', -- Status
	3, -- TC/TRC
	1, -- Intervention Type
	GeomFromText('POINT(-5.18307 39.79038)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	167, -- ID
	1, -- Catchment
	2, -- Area
	4, -- District
	'Vkunguni', -- Site Name
	'SK/MSK/103', -- School Code
	'', -- Status
	3, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.21420 39.79422)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	168, -- ID
	1, -- Catchment
	2, -- Area
	4, -- District
	'Madungu \'b\'', -- Site Name
	'SK/MS/234', -- School Code
	'', -- Status
	3, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.24847 39.77224)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	169, -- ID
	1, -- Catchment
	2, -- Area
	4, -- District
	'Al-Swadiq', -- Site Name
	'SK/MS/115', -- School Code
	'', -- Status
	3, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.26183 39.00770)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	170, -- ID
	1, -- Catchment
	2, -- Area
	4, -- District
	'Madungu \'a\'', -- Site Name
	'SK/MS/31', -- School Code
	'', -- Status
	3, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.24847 39.77224)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	171, -- ID
	1, -- Catchment
	2, -- Area
	4, -- District
	'Pondeani', -- Site Name
	'SK/MSK/87', -- School Code
	'', -- Status
	3, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.22567 39.76192)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	172, -- ID
	1, -- Catchment
	2, -- Area
	4, -- District
	'Ng\'ambwa', -- Site Name
	'SK/MS/222', -- School Code
	'', -- Status
	3, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.21530 39.78324)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	173, -- ID
	1, -- Catchment
	2, -- Area
	4, -- District
	'Kwale', -- Site Name
	'SK/MS/28', -- School Code
	'', -- Status
	3, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.21196 39.76940)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	174, -- ID
	1, -- Catchment
	2, -- Area
	4, -- District
	'Birikau', -- Site Name
	'SK/MS/134', -- School Code
	'', -- Status
	3, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.21208 39.74976)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	175, -- ID
	1, -- Catchment
	2, -- Area
	4, -- District
	'Pujini', -- Site Name
	'SK/MS/175', -- School Code
	'', -- Status
	3, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.29511 39.80180)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	176, -- ID
	1, -- Catchment
	2, -- Area
	5, -- District
	'Mjini Kiuyu', -- Site Name
	'SK/MSK/16', -- School Code
	'', -- Status
	4, -- TC/TRC
	1, -- Intervention Type
	GeomFromText('POINT(-5.13983 39.81608)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	177, -- ID
	1, -- Catchment
	2, -- Area
	5, -- District
	'Minungwini ', -- Site Name
	'SK/MSK/40', -- School Code
	'', -- Status
	4, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.15883 39.80718)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	178, -- ID
	1, -- Catchment
	2, -- Area
	5, -- District
	'Mchangamdogo ', -- Site Name
	'SK/MS/121', -- School Code
	'', -- Status
	4, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.12484 39.80951)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	179, -- ID
	1, -- Catchment
	2, -- Area
	5, -- District
	'Jojo', -- Site Name
	'SK/MS/124', -- School Code
	'', -- Status
	4, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.12742 39.79470)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	180, -- ID
	1, -- Catchment
	2, -- Area
	5, -- District
	'Chwale ', -- Site Name
	'SK/MSK/97', -- School Code
	'', -- Status
	4, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.98880 39.81736)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	181, -- ID
	1, -- Catchment
	2, -- Area
	5, -- District
	'Kojani', -- Site Name
	'SK/MSK/88', -- School Code
	'', -- Status
	4, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.09933 39.83767)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	182, -- ID
	1, -- Catchment
	2, -- Area
	5, -- District
	'Shengejuu', -- Site Name
	'SK/MSK/43', -- School Code
	'', -- Status
	4, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.06684 39.80995)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	183, -- ID
	1, -- Catchment
	2, -- Area
	5, -- District
	'Piki', -- Site Name
	'SK/MSK/42', -- School Code
	'', -- Status
	4, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.12492 39.76922)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	184, -- ID
	1, -- Catchment
	2, -- Area
	5, -- District
	'Bwagamoyo', -- Site Name
	'SK/MS/79', -- School Code
	'', -- Status
	4, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.10964 39.74808)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	185, -- ID
	1, -- Catchment
	2, -- Area
	5, -- District
	'Makongeni', -- Site Name
	'SK/MS/60', -- School Code
	'', -- Status
	4, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.13797 39.71341)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	186, -- ID
	1, -- Catchment
	2, -- Area
	5, -- District
	'Uondwe ', -- Site Name
	'SK/MSK/44', -- School Code
	'', -- Status
	4, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.08951 39.71489)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	187, -- ID
	1, -- Catchment
	2, -- Area
	5, -- District
	'Daya', -- Site Name
	'SK/MS/221', -- School Code
	'', -- Status
	4, -- TC/TRC
	3, -- Intervention Type
	GeomFromText('POINT(-5.11128 39.72075)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	188, -- ID
	1, -- Catchment
	2, -- Area
	5, -- District
	'Fundo', -- Site Name
	'SK/MS/41', -- School Code
	'', -- Status
	4, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.04749 39.65168)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	189, -- ID
	1, -- Catchment
	2, -- Area
	5, -- District
	'Uvinje', -- Site Name
	'SK/MS/226', -- School Code
	'', -- Status
	4, -- TC/TRC
	3, -- Intervention Type
	GeomFromText('POINT(-5.10685 39.63400)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	190, -- ID
	1, -- Catchment
	2, -- Area
	5, -- District
	'Mzambarauni', -- Site Name
	'SK/MS/113', -- School Code
	'', -- Status
	4, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.09685 39.77645)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	191, -- ID
	1, -- Catchment
	2, -- Area
	5, -- District
	'Mitiulaya ', -- Site Name
	'SK/MS/40', -- School Code
	'', -- Status
	4, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.05871 39.71933)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	192, -- ID
	1, -- Catchment
	2, -- Area
	5, -- District
	'Jadida', -- Site Name
	'SK/MS/39', -- School Code
	'', -- Status
	4, -- TC/TRC
	1, -- Intervention Type
	GeomFromText('POINT(-5.06002 39.73075)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	193, -- ID
	1, -- Catchment
	2, -- Area
	5, -- District
	'Limbani ', -- Site Name
	'SK/MSK/91', -- School Code
	'', -- Status
	4, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.06960 39.74224)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	194, -- ID
	1, -- Catchment
	2, -- Area
	5, -- District
	'Kizimbani ', -- Site Name
	'SK/MS/203', -- School Code
	'', -- Status
	4, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.05542 39.73459)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	195, -- ID
	1, -- Catchment
	2, -- Area
	5, -- District
	'Mabatini', -- Site Name
	'SK/MSK/128', -- School Code
	'', -- Status
	4, -- TC/TRC
	3, -- Intervention Type
	GeomFromText('POINT(-4.99205 39.69595)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	196, -- ID
	1, -- Catchment
	2, -- Area
	5, -- District
	'Mkote', -- Site Name
	'SK/MS/227', -- School Code
	'', -- Status
	4, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.02481 39.71222)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	197, -- ID
	1, -- Catchment
	2, -- Area
	5, -- District
	'Gando ', -- Site Name
	'SK/MS/181', -- School Code
	'', -- Status
	4, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.00240 39.70765)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	198, -- ID
	1, -- Catchment
	2, -- Area
	5, -- District
	'Ukunjwi', -- Site Name
	'SK/MSK/45', -- School Code
	'', -- Status
	4, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.03880 39.68779)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	199, -- ID
	1, -- Catchment
	2, -- Area
	5, -- District
	'Bopwe', -- Site Name
	'SK/MS/129', -- School Code
	'', -- Status
	4, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.05023 39.72414)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	200, -- ID
	1, -- Catchment
	2, -- Area
	6, -- District
	'Kinyasini ', -- Site Name
	'SK/MSS/06', -- School Code
	'', -- Status
	4, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.02139 39.74181)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	201, -- ID
	1, -- Catchment
	2, -- Area
	5, -- District
	'Kisiwani', -- Site Name
	'SK/MS/178', -- School Code
	'', -- Status
	4, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.15592 39.76351)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	202, -- ID
	1, -- Catchment
	2, -- Area
	5, -- District
	'Pandani ', -- Site Name
	'SK/MS/120', -- School Code
	'', -- Status
	4, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.05709 39.77643)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	203, -- ID
	1, -- Catchment
	2, -- Area
	6, -- District
	'Mgogoni Basic School', -- Site Name
	'SK/MS/58', -- School Code
	'', -- Status
	4, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-4.99198 39.73611)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	204, -- ID
	1, -- Catchment
	2, -- Area
	6, -- District
	'Shumba Vyamboni', -- Site Name
	'SK/MSK/13', -- School Code
	'', -- Status
	5, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.00320 39.77200)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	205, -- ID
	1, -- Catchment
	2, -- Area
	6, -- District
	'Kiuyu', -- Site Name
	'SK/MSK/16', -- School Code
	'', -- Status
	5, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-4.96412 39.85572)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	206, -- ID
	1, -- Catchment
	2, -- Area
	6, -- District
	'Mtemani', -- Site Name
	'SK/MS/200', -- School Code
	'', -- Status
	5, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.02913 39.81857)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	207, -- ID
	1, -- Catchment
	2, -- Area
	6, -- District
	'Kinowe', -- Site Name
	'SK/MSK/99', -- School Code
	'', -- Status
	5, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-4.95807 39.76434)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	208, -- ID
	1, -- Catchment
	2, -- Area
	6, -- District
	'Konde \'b\'', -- Site Name
	'SK/MS/189', -- School Code
	'', -- Status
	5, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-4.94169 39.74503)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	209, -- ID
	1, -- Catchment
	2, -- Area
	6, -- District
	'Kipangani', -- Site Name
	'SK/MS/199', -- School Code
	'', -- Status
	5, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-4.96619 39.71550)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	210, -- ID
	1, -- Catchment
	2, -- Area
	6, -- District
	'Karume', -- Site Name
	'SK/MS/191', -- School Code
	'', -- Status
	5, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-4.97330 39.82861)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	211, -- ID
	1, -- Catchment
	2, -- Area
	6, -- District
	'Sizini', -- Site Name
	'SK/MS/59', -- School Code
	'', -- Status
	5, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-4.99024 39.80824)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	212, -- ID
	1, -- Catchment
	2, -- Area
	6, -- District
	'Haroun', -- Site Name
	'SK/MS/197', -- School Code
	'', -- Status
	5, -- TC/TRC
	3, -- Intervention Type
	GeomFromText('POINT(-4.92552 39.74428)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	213, -- ID
	1, -- Catchment
	2, -- Area
	6, -- District
	'Msuka', -- Site Name
	'SK/MS/25', -- School Code
	'', -- Status
	5, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-4.92015 39.73491)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	214, -- ID
	1, -- Catchment
	2, -- Area
	6, -- District
	'Micheweni', -- Site Name
	'SK/MSK/18', -- School Code
	'', -- Status
	5, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-4.98283 39.83175)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	215, -- ID
	1, -- Catchment
	2, -- Area
	6, -- District
	'Konde \'a\'', -- Site Name
	'SK/MS/142', -- School Code
	'', -- Status
	5, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-4.94170 39.74525)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	216, -- ID
	1, -- Catchment
	2, -- Area
	6, -- District
	'Tumbe', -- Site Name
	'SK/MS/136', -- School Code
	'', -- Status
	5, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-4.96360 39.79399)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	217, -- ID
	1, -- Catchment
	2, -- Area
	6, -- District
	'Makangale', -- Site Name
	'SM/MSK/15', -- School Code
	'', -- Status
	5, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-4.92081 39.68888)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	218, -- ID
	1, -- Catchment
	2, -- Area
	6, -- District
	'Wingwi \'b\'', -- Site Name
	'SK/MS/195', -- School Code
	'', -- Status
	5, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.02597 39.81103)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	219, -- ID
	1, -- Catchment
	2, -- Area
	6, -- District
	'Wingwi \'a\'', -- Site Name
	'SK/MSK/17', -- School Code
	'', -- Status
	5, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.02597 39.81107)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	220, -- ID
	1, -- Catchment
	2, -- Area
	6, -- District
	'Simai', -- Site Name
	'SK/MS/224', -- School Code
	'', -- Status
	5, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	221, -- ID
	1, -- Catchment
	2, -- Area
	5, -- District
	'Finya', -- Site Name
	'SK/MS/81', -- School Code
	'', -- Status
	5, -- TC/TRC
	1, -- Intervention Type
	GeomFromText('POINT(-5.03420 39.76717)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	222, -- ID
	1, -- Catchment
	2, -- Area
	6, -- District
	'Mkiang\'ombe', -- Site Name
	'SK/MS/201', -- School Code
	'', -- Status
	5, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-4.95515 39.68983)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	223, -- ID
	1, -- Catchment
	2, -- Area
	7, -- District
	'Kunguni', -- Site Name
	'SK/MS/179', -- School Code
	'', -- Status
	6, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.29966 39.67422)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	224, -- ID
	1, -- Catchment
	2, -- Area
	7, -- District
	'Ng\'ombeni \' A\'', -- Site Name
	'SK/MS/215', -- School Code
	'', -- Status
	6, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.36322 39.64760)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	225, -- ID
	1, -- Catchment
	2, -- Area
	7, -- District
	'Ng\'ombeni \'b\'', -- Site Name
	'SK/MS/183', -- School Code
	'', -- Status
	6, -- TC/TRC
	3, -- Intervention Type
	GeomFromText('POINT(-5.36540 39.64703)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	226, -- ID
	1, -- Catchment
	2, -- Area
	7, -- District
	'Chokocho', -- Site Name
	'SK/MS/131', -- School Code
	'', -- Status
	6, -- TC/TRC
	1, -- Intervention Type
	GeomFromText('POINT(-5.42375 39.65508)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	227, -- ID
	1, -- Catchment
	2, -- Area
	7, -- District
	'Kengeja', -- Site Name
	'SK/MS/130', -- School Code
	'', -- Status
	6, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.41557 39.72810)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	228, -- ID
	1, -- Catchment
	2, -- Area
	7, -- District
	'Makombeni', -- Site Name
	'SK/MSK/30', -- School Code
	'', -- Status
	6, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.34238 39.65891)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	229, -- ID
	1, -- Catchment
	2, -- Area
	7, -- District
	'Mtuhaliwa', -- Site Name
	'SK/MS/213', -- School Code
	'', -- Status
	6, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.37703 39.67713)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	230, -- ID
	1, -- Catchment
	2, -- Area
	7, -- District
	'Chwaka', -- Site Name
	'SK/MSK/117', -- School Code
	'', -- Status
	6, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.38611 39.76489)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	231, -- ID
	1, -- Catchment
	2, -- Area
	7, -- District
	'Mizingani', -- Site Name
	'SK/MSK/29', -- School Code
	'', -- Status
	6, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.35553 39.71999)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	232, -- ID
	1, -- Catchment
	2, -- Area
	7, -- District
	'Kangani', -- Site Name
	'SK/MS/132', -- School Code
	'', -- Status
	6, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.41994 39.69012)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	233, -- ID
	1, -- Catchment
	2, -- Area
	7, -- District
	'Mjimbini', -- Site Name
	'SK/MS/211', -- School Code
	'', -- Status
	6, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.40118 39.69049)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	234, -- ID
	1, -- Catchment
	2, -- Area
	7, -- District
	'Mtangani', -- Site Name
	'SK/MS/220', -- School Code
	'', -- Status
	6, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.37370 39.78202)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	235, -- ID
	1, -- Catchment
	2, -- Area
	7, -- District
	'Kiwani', -- Site Name
	'SK/MS/117', -- School Code
	'', -- Status
	6, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.38414 39.74307)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	236, -- ID
	1, -- Catchment
	2, -- Area
	7, -- District
	'Tasini', -- Site Name
	'SK/MS/165', -- School Code
	'', -- Status
	6, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.39240 39.75536)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	237, -- ID
	1, -- Catchment
	2, -- Area
	7, -- District
	'Kisiwa Paza', -- Site Name
	'SK/MSK/28', -- School Code
	'', -- Status
	6, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.45892 39.64733)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	238, -- ID
	1, -- Catchment
	2, -- Area
	7, -- District
	'Mwambe', -- Site Name
	'SK/MSK/35', -- School Code
	'', -- Status
	6, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.41408 39.74611)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	239, -- ID
	1, -- Catchment
	2, -- Area
	7, -- District
	'Mtambile', -- Site Name
	'SK/MSK/37', -- School Code
	'', -- Status
	6, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.38007 39.69742)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	240, -- ID
	1, -- Catchment
	2, -- Area
	7, -- District
	'Mkanyangeni', -- Site Name
	'SK/MSK/33', -- School Code
	'', -- Status
	6, -- TC/TRC
	3, -- Intervention Type
	GeomFromText('POINT(-5.40648 39.65745)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	241, -- ID
	1, -- Catchment
	2, -- Area
	7, -- District
	'Makoongwe', -- Site Name
	'SK/MS/33', -- School Code
	'', -- Status
	6, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.38212 39.02395)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	242, -- ID
	1, -- Catchment
	2, -- Area
	7, -- District
	'Tironi', -- Site Name
	'SK/MS/90', -- School Code
	'', -- Status
	6, -- TC/TRC
	3, -- Intervention Type
	GeomFromText('POINT(-5.34567 39.66903)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	243, -- ID
	1, -- Catchment
	2, -- Area
	7, -- District
	'Chambani', -- Site Name
	'SK/MSK/27', -- School Code
	'', -- Status
	6, -- TC/TRC
	1, -- Intervention Type
	GeomFromText('POINT(-5.33393 39.77222)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	244, -- ID
	1, -- Catchment
	2, -- Area
	7, -- District
	'Shamiani - Mwambe', -- Site Name
	'SK/MS/12', -- School Code
	'', -- Status
	6, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.43651 39.73611)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	245, -- ID
	1, -- Catchment
	2, -- Area
	7, -- District
	'Ukutini', -- Site Name
	'SK/MS/135', -- School Code
	'', -- Status
	6, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.34756 39.76579)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	246, -- ID
	1, -- Catchment
	2, -- Area
	7, -- District
	'Michenzani', -- Site Name
	'SK/MS/35', -- School Code
	'', -- Status
	6, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.40167 39.64213)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	247, -- ID
	1, -- Catchment
	2, -- Area
	7, -- District
	'Wambaa', -- Site Name
	'SK/MSK/31', -- School Code
	'', -- Status
	6, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.30742 39.68546)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	248, -- ID
	1, -- Catchment
	2, -- Area
	7, -- District
	'Ngwachani', -- Site Name
	'SK/MSK/32', -- School Code
	'', -- Status
	6, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-5.32271 39.74113)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	249, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Butiama', -- Site Name
	'MT.04/093', -- School Code
	'', -- Status
	10, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	250, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Chitandi', -- Site Name
	'MT.04/008', -- School Code
	'', -- Status
	10, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	251, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Julia', -- Site Name
	'MT.04/091', -- School Code
	'', -- Status
	10, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	252, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Karume', -- Site Name
	'MT.04/014', -- School Code
	'', -- Status
	10, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	253, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Kiduni', -- Site Name
	'MT.04/015', -- School Code
	'', -- Status
	10, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	254, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Likuna', -- Site Name
	'MT.04/024', -- School Code
	'', -- Status
	10, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	255, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Kilidu', -- Site Name
	'MT.04/017', -- School Code
	'', -- Status
	10, -- TC/TRC
	2, -- Intervention Type
	GeomFromText('POINT(-10.84386111 39.73236111)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	256, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Luchingu', -- Site Name
	'MT.04/025', -- School Code
	'', -- Status
	10, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	257, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Magombo', -- Site Name
	'MT.04/026', -- School Code
	'', -- Status
	10, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	258, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Makonga', -- Site Name
	'MT.04/031', -- School Code
	'', -- Status
	10, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	259, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Mkoma       I', -- Site Name
	'MT.04/046', -- School Code
	'', -- Status
	10, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	260, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Mnaida     I', -- Site Name
	'MT.04/051', -- School Code
	'', -- Status
	10, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	261, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Mtangalanga', -- Site Name
	'MT.04/067', -- School Code
	'', -- Status
	10, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	262, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Mwongozo', -- Site Name
	'MT.04/069', -- School Code
	'', -- Status
	10, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	263, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Nambunga', -- Site Name
	'MT.04/074', -- School Code
	'', -- Status
	10, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	264, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Mandumba', -- Site Name
	'MT.04/041', -- School Code
	'', -- Status
	10, -- TC/TRC
	3, -- Intervention Type
	GeomFromText('POINT(-10.8726666666667 39.32175)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	265, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Nanyonda', -- Site Name
	'MT.04/083', -- School Code
	'', -- Status
	10, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	266, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Namiyonga   B', -- Site Name
	'MT.04/078', -- School Code
	'', -- Status
	10, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	267, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Newala', -- Site Name
	'MT.04/084', -- School Code
	'', -- Status
	10, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	268, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Twendepamoja', -- Site Name
	'MT.04/087', -- School Code
	'', -- Status
	10, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	269, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Namiyonga     A', -- Site Name
	'MT.04/077', -- School Code
	'', -- Status
	10, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	270, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Nachitulo', -- Site Name
	'MT.04/071', -- School Code
	'', -- Status
	10, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	271, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Chihanga', -- Site Name
	'MT.02/108', -- School Code
	'', -- Status
	11, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	272, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Chihwindi', -- Site Name
	'MT.02/090', -- School Code
	'', -- Status
	11, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	273, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Chikwaya', -- Site Name
	'MT.02/064', -- School Code
	'', -- Status
	11, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	274, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Chipitu', -- Site Name
	'MT.04/095', -- School Code
	'', -- Status
	11, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	275, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Kikuyu', -- Site Name
	'MT.04/016', -- School Code
	'', -- Status
	11, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	276, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Kipimi', -- Site Name
	'MT.04/020', -- School Code
	'', -- Status
	11, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	277, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Kiuta', -- Site Name
	'MT.04/021', -- School Code
	'', -- Status
	11, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	278, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Lidumbe', -- Site Name
	'MT.04/097', -- School Code
	'', -- Status
	11, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	279, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Magumchila', -- Site Name
	'MT.04/027', -- School Code
	'', -- Status
	11, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	280, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Mahumbika', -- Site Name
	'MT.04/028', -- School Code
	'', -- Status
	11, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	281, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Makondeko', -- Site Name
	'MT.04/030', -- School Code
	'', -- Status
	11, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	282, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Makote', -- Site Name
	'MT.04/032', -- School Code
	'', -- Status
	11, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	283, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Mapili', -- Site Name
	'MT.04/094', -- School Code
	'', -- Status
	11, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	284, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Mcholi Ii', -- Site Name
	'MT.04/101', -- School Code
	'', -- Status
	11, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	285, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Mcholi-Godwin', -- Site Name
	'MT.04/038', -- School Code
	'', -- Status
	11, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	286, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Mkunya', -- Site Name
	'MT.04/049', -- School Code
	'', -- Status
	11, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	287, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Mnalale', -- Site Name
	'MT.04/052', -- School Code
	'', -- Status
	11, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	288, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Mnanje', -- Site Name
	'MT.04/053', -- School Code
	'', -- Status
	11, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	289, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Mpilipili', -- Site Name
	'MT.04/063', -- School Code
	'', -- Status
	11, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	290, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Nanguruwe', -- Site Name
	'MT.04/081', -- School Code
	'', -- Status
	11, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	291, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Nangwanda', -- Site Name
	'MT.04/082', -- School Code
	'', -- Status
	11, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	292, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Samora', -- Site Name
	'MT.04/085', -- School Code
	'', -- Status
	11, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	293, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Tawala', -- Site Name
	'MT.04/108', -- School Code
	'', -- Status
	11, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	294, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Bahati', -- Site Name
	'MT.04/001', -- School Code
	'', -- Status
	12, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	295, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Chihangu', -- Site Name
	'MT.04/003', -- School Code
	'', -- Status
	12, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	296, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Chilangala', -- Site Name
	'MT.04/007', -- School Code
	'', -- Status
	12, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	297, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Chilende', -- Site Name
	'MT.04/118', -- School Code
	'', -- Status
	12, -- TC/TRC
	1, -- Intervention Type
	GeomFromText('POINT(-10.4518 39.3203333333333)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	298, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Hengapano', -- Site Name
	'MT.04/012', -- School Code
	'', -- Status
	12, -- TC/TRC
	3, -- Intervention Type
	GeomFromText('POINT(-10.72015 39.13455)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	299, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Lihanga', -- Site Name
	'MT.04/023', -- School Code
	'', -- Status
	12, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	300, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Mahoha', -- Site Name
	'MT.04/090', -- School Code
	'', -- Status
	12, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	301, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Majembe Juu', -- Site Name
	'MT.04/029', -- School Code
	'', -- Status
	12, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	302, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Mbonde', -- Site Name
	'MT.04/035', -- School Code
	'', -- Status
	12, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	303, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Meta', -- Site Name
	'MT.04/040', -- School Code
	'', -- Status
	12, -- TC/TRC
	3, -- Intervention Type
	GeomFromText('POINT(-10.59725 39.2585)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	304, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Mikumbi', -- Site Name
	'MT.04/042', -- School Code
	'', -- Status
	12, -- TC/TRC
	1, -- Intervention Type
	GeomFromText('POINT(-10.5653666666667 39.1743)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	305, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Miyuyu', -- Site Name
	'MT.04/115', -- School Code
	'', -- Status
	12, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	306, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Mkalenda', -- Site Name
	'MT.04/055', -- School Code
	'', -- Status
	12, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	307, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Mkoma     Ii', -- Site Name
	'MT.04/047', -- School Code
	'', -- Status
	12, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	308, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Mkoma Sokoni', -- Site Name
	'MT.04/089', -- School Code
	'', -- Status
	12, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	309, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Mkongi', -- Site Name
	'MT.04/048', -- School Code
	'', -- Status
	12, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	310, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Mnayope', -- Site Name
	'MT.04/054', -- School Code
	'', -- Status
	12, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	311, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Mnyambe', -- Site Name
	'MT.04/058', -- School Code
	'', -- Status
	12, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	312, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Namdimba', -- Site Name
	'MT.04/075', -- School Code
	'', -- Status
	12, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	313, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Namangudu', -- Site Name
	'MT.04/114', -- School Code
	'', -- Status
	12, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	314, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Nambali', -- Site Name
	'MT.04/073', -- School Code
	'', -- Status
	12, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	315, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Namihonga', -- Site Name
	'MT.04/076', -- School Code
	'', -- Status
	12, -- TC/TRC
	3, -- Intervention Type
	GeomFromText('POINT(-10.3638 39.3181166666667)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	316, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Chikunda-Lubido', -- Site Name
	'MT.04/110', -- School Code
	'', -- Status
	13, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	317, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Chiwonga', -- Site Name
	'MT.04/011', -- School Code
	'', -- Status
	13, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	318, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Kadengwa', -- Site Name
	'MT.04/013', -- School Code
	'', -- Status
	13, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	319, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Kitangali     B', -- Site Name
	'MT.04/018', -- School Code
	'', -- Status
	13, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	320, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Kitangali-Mazoezi', -- Site Name
	'MT.04/019', -- School Code
	'', -- Status
	13, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	321, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Madaba', -- Site Name
	'MT.04/119', -- School Code
	'', -- Status
	13, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	322, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Mbembele', -- Site Name
	'MT.04/034', -- School Code
	'', -- Status
	13, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	323, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Mbeya', -- Site Name
	'MT.04/117', -- School Code
	'', -- Status
	13, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	324, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Mitanga', -- Site Name
	'MT.04/045', -- School Code
	'', -- Status
	13, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	325, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Mnali', -- Site Name
	'MT.04/061', -- School Code
	'', -- Status
	13, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	326, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Mnauya', -- Site Name
	'MT.04/113', -- School Code
	'', -- Status
	13, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	327, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Mning\'aliye', -- Site Name
	'MT.04/056', -- School Code
	'', -- Status
	13, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	328, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Mmulunga', -- Site Name
	'MT.04/050', -- School Code
	'', -- Status
	13, -- TC/TRC
	1, -- Intervention Type
	GeomFromText('POINT(-10.58 39.3682)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	329, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Mnyeu', -- Site Name
	'MT.04/060', -- School Code
	'', -- Status
	13, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	330, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Mpotola', -- Site Name
	'MT.04/064', -- School Code
	'', -- Status
	13, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	331, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Mtongwele', -- Site Name
	'MT.04/070', -- School Code
	'', -- Status
	13, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	332, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Mtopwa', -- Site Name
	'MT.04/068', -- School Code
	'', -- Status
	13, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	333, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Muungano', -- Site Name
	'MT.04/112', -- School Code
	'', -- Status
	13, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	334, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Nanda', -- Site Name
	'MT.04/079', -- School Code
	'', -- Status
	13, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	335, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Nandwahi', -- Site Name
	'MT.04/080', -- School Code
	'', -- Status
	13, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	336, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Sijaona', -- Site Name
	'MT.04/086', -- School Code
	'', -- Status
	13, -- TC/TRC
	3, -- Intervention Type
	GeomFromText('POINT(-10.7008166666667 39.3902666666667)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	337, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Vihokoli', -- Site Name
	'MT.04/088', -- School Code
	'', -- Status
	13, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	338, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Chikoi', -- Site Name
	'MT.04/005', -- School Code
	'', -- Status
	14, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	339, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Chitenda', -- Site Name
	'MT.04/010', -- School Code
	'', -- Status
	14, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	340, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Chitekete', -- Site Name
	'MT.04/009', -- School Code
	'', -- Status
	14, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	341, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Chiule', -- Site Name
	'MT.04/111', -- School Code
	'', -- Status
	14, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	342, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Chiuta', -- Site Name
	'MT.04/096', -- School Code
	'', -- Status
	14, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	343, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Lengo', -- Site Name
	'MT.04/022', -- School Code
	'', -- Status
	14, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	344, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Makukwe    I', -- Site Name
	'MT.04/098', -- School Code
	'', -- Status
	14, -- TC/TRC
	1, -- Intervention Type
	GeomFromText('POINT(-10.77725 39.39535)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	345, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Makukwe    Ii', -- Site Name
	'MT.04/099', -- School Code
	'', -- Status
	14, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	346, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Malatu', -- Site Name
	'MT.04/033', -- School Code
	'', -- Status
	14, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	347, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Mbuyuni', -- Site Name
	'MT.04/100', -- School Code
	'', -- Status
	14, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	348, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Mchedebwa', -- Site Name
	'MT.04/036', -- School Code
	'', -- Status
	14, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	349, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Mchemo', -- Site Name
	'MT.04/037', -- School Code
	'', -- Status
	14, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	350, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Mdimba', -- Site Name
	'MT.04/039', -- School Code
	'', -- Status
	14, -- TC/TRC
	1, -- Intervention Type
	GeomFromText('POINT(-10.7745833333333 39.2955833333333)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	351, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Ngongo', -- Site Name
	'MT.04/107', -- School Code
	'', -- Status
	14, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	352, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Minjale', -- Site Name
	'MT.04/043', -- School Code
	'', -- Status
	14, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	353, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Mitahu', -- Site Name
	'MT.04/044', -- School Code
	'', -- Status
	14, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	354, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Mkwedu Tankini', -- Site Name
	'MT.04/102', -- School Code
	'', -- Status
	14, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	355, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Mnolela', -- Site Name
	'MT.04/057', -- School Code
	'', -- Status
	14, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	356, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Mnyambachi', -- Site Name
	'MT.04/103', -- School Code
	'', -- Status
	14, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	357, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Mpalu', -- Site Name
	'MT.04/062', -- School Code
	'', -- Status
	14, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	358, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Mpwapwa', -- Site Name
	'MT.04/065', -- School Code
	'', -- Status
	14, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	359, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Mtanda', -- Site Name
	'MT.04/066', -- School Code
	'', -- Status
	14, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	360, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Mtendachi', -- Site Name
	'MT.04/104', -- School Code
	'', -- Status
	14, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	361, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Mtunguru', -- Site Name
	'MT.04/105', -- School Code
	'', -- Status
	14, -- TC/TRC
	1, -- Intervention Type
	GeomFromText('POINT(-10.7684166666667 39.34525)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	362, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Mtengachi', -- Site Name
	'MT.04/104', -- School Code
	'', -- Status
	14, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	363, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Nakahako', -- Site Name
	'MT.04/072', -- School Code
	'', -- Status
	14, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	364, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Nambudi', -- Site Name
	'MT.04/092', -- School Code
	'', -- Status
	14, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	365, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Nankong\'o', -- Site Name
	'MT.04/106', -- School Code
	'', -- Status
	14, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	366, -- ID
	2, -- Catchment
	3, -- Mtwara
	11, -- District
	'Tengulengu', -- Site Name
	'MT.04/109', -- School Code
	'', -- Status
	14, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	367, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Chilimba', -- Site Name
	'MT.03/028', -- School Code
	'', -- Status
	15, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	368, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Chipembe', -- Site Name
	'MT.03/026', -- School Code
	'', -- Status
	15, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	369, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Chiungutwa', -- Site Name
	'MT.03/014', -- School Code
	'', -- Status
	15, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	370, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Huwe', -- Site Name
	'MT.03/016', -- School Code
	'', -- Status
	15, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	371, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Lipumburu', -- Site Name
	'MT.03/093', -- School Code
	'', -- Status
	15, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	372, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Lisanje', -- Site Name
	'MT.03/144', -- School Code
	'', -- Status
	15, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	373, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Lupaso', -- Site Name
	'MT.03/069', -- School Code
	'', -- Status
	15, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	374, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Makanyama', -- Site Name
	'MT.03/047', -- School Code
	'', -- Status
	15, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	375, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Masuburu Mtenga', -- Site Name
	'MT.03/056', -- School Code
	'', -- Status
	15, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	376, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Mbuyuni', -- Site Name
	'MT.05/021', -- School Code
	'', -- Status
	15, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	377, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Mdibwa (Ndibwa)', -- Site Name
	'MT.03/023', -- School Code
	'', -- Status
	15, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	378, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Milunda', -- Site Name
	'MT.03/215', -- School Code
	'', -- Status
	15, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	379, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Mitonji', -- Site Name
	'MT.03/216', -- School Code
	'', -- Status
	15, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	380, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Miundo', -- Site Name
	'TEMP_0010', -- School Code
	'', -- Status
	15, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	381, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Mjawara (Njawara)', -- Site Name
	'MT.03/064', -- School Code
	'', -- Status
	15, -- TC/TRC
	1, -- Intervention Type
	GeomFromText('POINT(-10.9932166666667 38.83725)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	382, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Mpeta', -- Site Name
	'MT.03/020', -- School Code
	'', -- Status
	15, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	383, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Mpulima', -- Site Name
	'MT.03/172', -- School Code
	'', -- Status
	15, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	384, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Nairombo', -- Site Name
	'MT.03/038', -- School Code
	'', -- Status
	15, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	385, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Nakachureni', -- Site Name
	'TEMP_0011', -- School Code
	'', -- Status
	15, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	386, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Nanjota', -- Site Name
	'MT.03/075', -- School Code
	'', -- Status
	15, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	387, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Nantona', -- Site Name
	'MT.03/171', -- School Code
	'', -- Status
	15, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	388, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Niesi (Miesi)', -- Site Name
	'MT.03/112', -- School Code
	'', -- Status
	15, -- TC/TRC
	1, -- Intervention Type
	GeomFromText('POINT(-11.1335166666667 38.9185833333333)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	389, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Tuleane', -- Site Name
	'MT.03/125', -- School Code
	'', -- Status
	15, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	390, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Umati', -- Site Name
	'MT.03/237', -- School Code
	'', -- Status
	15, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	391, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Utimbe', -- Site Name
	'MT.03/065', -- School Code
	'', -- Status
	15, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	392, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Chikundi Msanga', -- Site Name
	'MT.03/034', -- School Code
	'', -- Status
	16, -- TC/TRC
	3, -- Intervention Type
	GeomFromText('POINT(-10.5300333333333 38.9716666666667)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	393, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Chipango', -- Site Name
	'MT.03/131', -- School Code
	'', -- Status
	16, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	394, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Luagala', -- Site Name
	'MT.03/151', -- School Code
	'', -- Status
	16, -- TC/TRC
	1, -- Intervention Type
	GeomFromText('POINT(-10.87325 39.1177833333333)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	395, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Lulindi (Special Ed)', -- Site Name
	'MT.03/179', -- School Code
	'', -- Status
	16, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	396, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Lulindi    I', -- Site Name
	'MT.03/008', -- School Code
	'', -- Status
	16, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	397, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Lulindi      Ii', -- Site Name
	'MT.03/242', -- School Code
	'', -- Status
	16, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	398, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Majembe', -- Site Name
	'MT.03/009', -- School Code
	'', -- Status
	16, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	399, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Mbugo', -- Site Name
	'MT.03/217', -- School Code
	'', -- Status
	16, -- TC/TRC
	3, -- Intervention Type
	GeomFromText('POINT(-10.7743166666667 39.0792833333333)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	400, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Mdwika     I (Ndwika)', -- Site Name
	'MT.03/001', -- School Code
	'', -- Status
	16, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	401, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Mitesa', -- Site Name
	'MT.03/224', -- School Code
	'', -- Status
	16, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	402, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Miwale', -- Site Name
	'MT.03/158', -- School Code
	'', -- Status
	16, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	403, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Mkangaula', -- Site Name
	'MT.03/182', -- School Code
	'', -- Status
	16, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	404, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Mkolopola', -- Site Name
	'MT.03/115', -- School Code
	'', -- Status
	16, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	405, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Mkululu', -- Site Name
	'MT.03/048', -- School Code
	'', -- Status
	16, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	406, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Lusonje', -- Site Name
	'MT.03/027', -- School Code
	'', -- Status
	16, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	407, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Mtakuja     I', -- Site Name
	'MT.03/114', -- School Code
	'', -- Status
	16, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	408, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Nagaga', -- Site Name
	'MT.03/031', -- School Code
	'', -- Status
	16, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	409, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Nakalola', -- Site Name
	'MT.03/059', -- School Code
	'', -- Status
	16, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	410, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Namalenga', -- Site Name
	'MT.03/021', -- School Code
	'', -- Status
	16, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	411, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Chikoropola', -- Site Name
	'MT.03/015', -- School Code
	'', -- Status
	17, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	412, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Luatala', -- Site Name
	'MT.03/017', -- School Code
	'', -- Status
	17, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	413, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Makong\'onda', -- Site Name
	'MT.03/055', -- School Code
	'', -- Status
	17, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	414, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Manyuli', -- Site Name
	'MT.03/145', -- School Code
	'', -- Status
	17, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	415, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Maparawe', -- Site Name
	'MT.03/100', -- School Code
	'', -- Status
	17, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	416, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Mapili', -- Site Name
	'MT.03/103', -- School Code
	'', -- Status
	17, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	417, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Mchauru', -- Site Name
	'MT.03/023', -- School Code
	'', -- Status
	17, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	418, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Mgwagule', -- Site Name
	'MT.03/057', -- School Code
	'', -- Status
	17, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	419, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Mirewe', -- Site Name
	'MT.03/122', -- School Code
	'', -- Status
	17, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	420, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Mkachima', -- Site Name
	'MT.03/155', -- School Code
	'', -- Status
	17, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	421, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Mnavira', -- Site Name
	'MT.03/019', -- School Code
	'', -- Status
	17, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	422, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Mwitika', -- Site Name
	'MT.03/258', -- School Code
	'', -- Status
	17, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	423, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Nakarara', -- Site Name
	'MT.03/121', -- School Code
	'', -- Status
	17, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	424, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Naliongolo', -- Site Name
	'MT.03/110', -- School Code
	'', -- Status
	17, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	425, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Namyomyo', -- Site Name
	'MT.03/132', -- School Code
	'', -- Status
	17, -- TC/TRC
	3, -- Intervention Type
	GeomFromText('POINT(-11.0432333333333 39.3015333333333)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	426, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Ng\'uni', -- Site Name
	'MT.03/146', -- School Code
	'', -- Status
	17, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	427, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Rivango', -- Site Name
	'MT.03/033', -- School Code
	'', -- Status
	17, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	428, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Sindano', -- Site Name
	'MT.03/063', -- School Code
	'', -- Status
	17, -- TC/TRC
	1, -- Intervention Type
	GeomFromText('POINT(-11.0925666666667 39.0797666666667)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	429, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Chidya', -- Site Name
	'MT.03/019', -- School Code
	'', -- Status
	18, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	430, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Chigugu', -- Site Name
	'MT.03/094', -- School Code
	'', -- Status
	18, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	431, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Chigumi', -- Site Name
	'MT.03/169', -- School Code
	'', -- Status
	18, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	432, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Chikundi', -- Site Name
	'MT.03/077', -- School Code
	'', -- Status
	18, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	433, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Chikukwe', -- Site Name
	'MT.03/141', -- School Code
	'', -- Status
	18, -- TC/TRC
	1, -- Intervention Type
	GeomFromText('POINT(-10.5935166666667 38.8997833333333)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	434, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Chiwata', -- Site Name
	'MT.03/005', -- School Code
	'', -- Status
	18, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	435, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Liloya', -- Site Name
	'MT.03/046', -- School Code
	'', -- Status
	18, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	436, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Liputu', -- Site Name
	'MT.03/138', -- School Code
	'', -- Status
	18, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	437, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Mandiwa', -- Site Name
	'MT.03/186', -- School Code
	'', -- Status
	18, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	438, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Mbaju', -- Site Name
	'MT.03/130', -- School Code
	'', -- Status
	18, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	439, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Mbemba', -- Site Name
	'MT.03/002', -- School Code
	'', -- Status
	18, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	440, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Mdenga', -- Site Name
	'MT.03/204', -- School Code
	'', -- Status
	18, -- TC/TRC
	3, -- Intervention Type
	GeomFromText('POINT(-10.5935166666667 39.0769833333333)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	441, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Njenga', -- Site Name
	'MT.03/209', -- School Code
	'', -- Status
	18, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	442, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Mkalapa', -- Site Name
	'MT.03/095', -- School Code
	'', -- Status
	18, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	443, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Mkang\'u', -- Site Name
	'MT.03/185', -- School Code
	'', -- Status
	18, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	444, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Mkungu', -- Site Name
	'MT.03/180', -- School Code
	'', -- Status
	18, -- TC/TRC
	1, -- Intervention Type
	GeomFromText('POINT(-10.3768666666667 39.2595166666667)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	445, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Mkwera', -- Site Name
	'MT.03/085', -- School Code
	'', -- Status
	18, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	446, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Mpowora', -- Site Name
	'MT.03/178', -- School Code
	'', -- Status
	18, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	447, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Mtunungu', -- Site Name
	'MT.03/139', -- School Code
	'', -- Status
	18, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	448, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Mumburu', -- Site Name
	'MT.03/140', -- School Code
	'', -- Status
	18, -- TC/TRC
	3, -- Intervention Type
	GeomFromText('POINT(-10.4321333333333 39.12175)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	449, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Mwena', -- Site Name
	'MT.03/156', -- School Code
	'', -- Status
	18, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	450, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Mwongozo', -- Site Name
	'MT.03/161', -- School Code
	'', -- Status
	18, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	451, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Nanganga', -- Site Name
	'MT.03/078', -- School Code
	'', -- Status
	18, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	452, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Nangoo', -- Site Name
	'MT.03/082', -- School Code
	'', -- Status
	18, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	453, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Ndanda', -- Site Name
	'MT.03/079', -- School Code
	'', -- Status
	18, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	454, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Chakama', -- Site Name
	'TEMP_0012', -- School Code
	'', -- Status
	19, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	455, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Chanikanguo', -- Site Name
	'MT.03/159', -- School Code
	'', -- Status
	19, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	456, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Chipole', -- Site Name
	'MT.03/236', -- School Code
	'', -- Status
	19, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	457, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Chisegu', -- Site Name
	'MT.03/120', -- School Code
	'', -- Status
	19, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	458, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Kambarage', -- Site Name
	'MT.03/207', -- School Code
	'', -- Status
	19, -- TC/TRC
	3, -- Intervention Type
	GeomFromText('POINT(-10.26 40.1666666666667)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	459, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Kanyimbi', -- Site Name
	'MT.03/007', -- School Code
	'', -- Status
	19, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	460, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Maendeleo', -- Site Name
	'MT.03/206', -- School Code
	'', -- Status
	19, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	461, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Makulani', -- Site Name
	'MT.03/071', -- School Code
	'', -- Status
	19, -- TC/TRC
	3, -- Intervention Type
	GeomFromText('POINT(-10.8036833333333 38.6820333333333)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	462, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Marika', -- Site Name
	'MT.03/010', -- School Code
	'', -- Status
	19, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	463, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Masasi', -- Site Name
	'MT.03/097', -- School Code
	'', -- Status
	19, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	464, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Matawale', -- Site Name
	'MT.03/043', -- School Code
	'', -- Status
	19, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	465, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Mbonde', -- Site Name
	'MT.03/175', -- School Code
	'', -- Status
	19, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	466, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Migongo', -- Site Name
	'MT.03/073', -- School Code
	'', -- Status
	19, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	467, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Minjale', -- Site Name
	'MT.03/084', -- School Code
	'', -- Status
	19, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	468, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Mkapunda', -- Site Name
	'MT.03/167', -- School Code
	'', -- Status
	19, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	469, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Mkarakate', -- Site Name
	'MT.03/180', -- School Code
	'', -- Status
	19, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	470, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Mkarango', -- Site Name
	'MT.03/164', -- School Code
	'', -- Status
	19, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	471, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Mkomaindo', -- Site Name
	'MT.03/012', -- School Code
	'', -- Status
	19, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	472, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Mkuti', -- Site Name
	'MT.03/148', -- School Code
	'', -- Status
	19, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	473, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Mlimani', -- Site Name
	'MT.03/208', -- School Code
	'', -- Status
	19, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	474, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Mlundelunde', -- Site Name
	'MT.03/134', -- School Code
	'', -- Status
	19, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	475, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Moroko', -- Site Name
	'MT.03/222', -- School Code
	'', -- Status
	19, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	476, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Mpindimbi', -- Site Name
	'MT.03/013', -- School Code
	'', -- Status
	19, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	477, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Mtakuja   Ii', -- Site Name
	'MT.03/160', -- School Code
	'', -- Status
	19, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	478, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Mumbaka', -- Site Name
	'MT.03/136', -- School Code
	'', -- Status
	19, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	479, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Mwenge Mtapika', -- Site Name
	'MT.03/171', -- School Code
	'', -- Status
	19, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	480, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Mwiti', -- Site Name
	'MT.03/030', -- School Code
	'', -- Status
	19, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	481, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Namatunu', -- Site Name
	'MT.03/090', -- School Code
	'', -- Status
	19, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	482, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Namkungwi', -- Site Name
	'MT.03/108', -- School Code
	'', -- Status
	19, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	483, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Nangose', -- Site Name
	'MT.03/092', -- School Code
	'', -- Status
	19, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	484, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Namikunda', -- Site Name
	'MT.03/032', -- School Code
	'', -- Status
	19, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	485, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Nyasa', -- Site Name
	'MT.03/111', -- School Code
	'', -- Status
	19, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	486, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Saba Saba', -- Site Name
	'MT.03/205', -- School Code
	'', -- Status
	19, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	487, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Sululu', -- Site Name
	'MT.03/165', -- School Code
	'', -- Status
	19, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	488, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Temeke', -- Site Name
	'MT.03/239', -- School Code
	'', -- Status
	19, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	489, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Tukaewote', -- Site Name
	'MT.03/124', -- School Code
	'', -- Status
	19, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	490, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Azimio', -- Site Name
	'MT.03/210', -- School Code
	'', -- Status
	20, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	491, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Chikoweti', -- Site Name
	'MT.03/044', -- School Code
	'', -- Status
	20, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	492, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Chikunja    I', -- Site Name
	'MT.03/004', -- School Code
	'', -- Status
	20, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	493, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Chingulungulu', -- Site Name
	'MT.03/066', -- School Code
	'', -- Status
	20, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	494, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Chipunda', -- Site Name
	'MT.03/225', -- School Code
	'', -- Status
	20, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	495, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Chiroro', -- Site Name
	'MT.03/128', -- School Code
	'', -- Status
	20, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	496, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Chiwale', -- Site Name
	'MT.03/113', -- School Code
	'', -- Status
	20, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	497, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Kisiwani', -- Site Name
	'MT.03/183', -- School Code
	'', -- Status
	20, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	498, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Lilala', -- Site Name
	'MT.03/203', -- School Code
	'', -- Status
	20, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	499, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Lukuledi', -- Site Name
	'MT.03/068', -- School Code
	'', -- Status
	20, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	500, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Lukuledi (Special Ed)', -- Site Name
	'MT.03/223', -- School Code
	'', -- Status
	20, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	501, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Masiku', -- Site Name
	'MT.03/211', -- School Code
	'', -- Status
	20, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	502, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Nasindi', -- Site Name
	'MT.03/076', -- School Code
	'', -- Status
	20, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	503, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Ngalole      A', -- Site Name
	'MT.03/177', -- School Code
	'', -- Status
	20, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	504, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Ngalole      B', -- Site Name
	'MT.03/213', -- School Code
	'', -- Status
	20, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	505, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Mihima', -- Site Name
	'MT.03/104', -- School Code
	'', -- Status
	20, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	506, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Mkwapa', -- Site Name
	'MT.03/168', -- School Code
	'', -- Status
	20, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	507, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Mlingula', -- Site Name
	'MT.03/150', -- School Code
	'', -- Status
	20, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	508, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Mnazi Moja', -- Site Name
	'MT.03/188', -- School Code
	'', -- Status
	20, -- TC/TRC
	3, -- Intervention Type
	GeomFromText('POINT(-10.8770166666667 39.5059833333333)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	509, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Mpanyani', -- Site Name
	'MT.03/199', -- School Code
	'', -- Status
	20, -- TC/TRC
	1, -- Intervention Type
	GeomFromText('POINT(-10.5504 38.6875333333333)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	510, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Mraushi', -- Site Name
	'MT.03/088', -- School Code
	'', -- Status
	20, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	511, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Msikisi', -- Site Name
	'MT.03/166', -- School Code
	'', -- Status
	20, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	512, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Muungano', -- Site Name
	'MT.03/241', -- School Code
	'', -- Status
	20, -- TC/TRC
	3, -- Intervention Type
	GeomFromText('POINT(-10.59475 38.6726833333333)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	513, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Namalembo', -- Site Name
	'MT.03/089', -- School Code
	'', -- Status
	20, -- TC/TRC
	1, -- Intervention Type
	GeomFromText('POINT(-10.7590333333333 38.4566333333333)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	514, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Namajani', -- Site Name
	'MT.03/096', -- School Code
	'', -- Status
	20, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	515, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Namatutwe', -- Site Name
	'MT.03/060', -- School Code
	'', -- Status
	20, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	516, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Nambawala', -- Site Name
	'MT.03/081', -- School Code
	'', -- Status
	20, -- TC/TRC
	1, -- Intervention Type
	GeomFromText('POINT(-10.54405 38.7321333333333)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	517, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Namichi', -- Site Name
	'MT.03/212', -- School Code
	'', -- Status
	20, -- TC/TRC
	1, -- Intervention Type
	GeomFromText('POINT(-10.6964166666667 38.6714666666667)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	518, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Nanyindwa', -- Site Name
	'MT.03/041', -- School Code
	'', -- Status
	20, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	519, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Napata', -- Site Name
	'MT.03/087', -- School Code
	'', -- Status
	20, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	520, -- ID
	2, -- Catchment
	3, -- Mtwara
	12, -- District
	'Ufukoni', -- Site Name
	'MT.03/220', -- School Code
	'', -- Status
	20, -- TC/TRC
	1, -- Intervention Type
	GeomFromText('POINT(-10.5832 38.6156)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	521, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Chidede', -- Site Name
	'MT.05/002', -- School Code
	'', -- Status
	16, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	522, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Chaume', -- Site Name
	'MT.05/001', -- School Code
	'', -- Status
	16, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	523, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Libobe', -- Site Name
	'MT.05/112', -- School Code
	'', -- Status
	16, -- TC/TRC
	3, -- Intervention Type
	GeomFromText('POINT(-10.4908666666667 39.51985)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	524, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Likolombe', -- Site Name
	'MT.05/018', -- School Code
	'', -- Status
	16, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	525, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Liponde', -- Site Name
	'MT.05/113', -- School Code
	'', -- Status
	16, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	526, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Litehu', -- Site Name
	'MT.05/020', -- School Code
	'', -- Status
	16, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	527, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Luagala', -- Site Name
	'MT.05/022', -- School Code
	'', -- Status
	16, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	528, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Luagala       B', -- Site Name
	'MT.05/120', -- School Code
	'', -- Status
	16, -- TC/TRC
	1, -- Intervention Type
	GeomFromText('POINT(-10.53665 39.4701)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	529, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Luheya', -- Site Name
	'MT.05/128', -- School Code
	'', -- Status
	16, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	530, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Mabeti', -- Site Name
	'MT.05/028', -- School Code
	'', -- Status
	16, -- TC/TRC
	3, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	531, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Machedi', -- Site Name
	'MT.05/135', -- School Code
	'', -- Status
	16, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	532, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Ngunja', -- Site Name
	'MT.05/104', -- School Code
	'', -- Status
	16, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	533, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Mikuyu', -- Site Name
	'MT.05/051', -- School Code
	'', -- Status
	16, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	534, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Mkola Juu', -- Site Name
	'MT.05/133', -- School Code
	'', -- Status
	16, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	535, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Mkola Tankini', -- Site Name
	'MT.05/061', -- School Code
	'', -- Status
	16, -- TC/TRC
	1, -- Intervention Type
	GeomFromText('POINT(-10.4653666666667 39.4576833333333)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	536, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Mkonjowano', -- Site Name
	'MT.05/062', -- School Code
	'', -- Status
	16, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	537, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Mkuti', -- Site Name
	'MT.05/068', -- School Code
	'', -- Status
	16, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	538, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Mkwedu Luagala', -- Site Name
	'MT.05/063', -- School Code
	'', -- Status
	16, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	539, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Mkwiti', -- Site Name
	'MT.05/065', -- School Code
	'', -- Status
	16, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	540, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Mmeda', -- Site Name
	'MT.05/070', -- School Code
	'', -- Status
	16, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	541, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Mweru', -- Site Name
	'MT.05/086', -- School Code
	'', -- Status
	16, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	542, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Namindondi', -- Site Name
	'MT.05/095', -- School Code
	'', -- Status
	16, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	543, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Namyonga A (Namiyonga A)', -- Site Name
	'MT.04/077', -- School Code
	'', -- Status
	16, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	544, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Nangombya (Mangombya)', -- Site Name
	'MT.05/038', -- School Code
	'', -- Status
	16, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	545, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Nannala', -- Site Name
	'MT.05/100', -- School Code
	'', -- Status
	16, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	546, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Ulodaleo', -- Site Name
	'MT.05/109', -- School Code
	'', -- Status
	16, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	547, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Chikongo', -- Site Name
	'MT.05/004', -- School Code
	'', -- Status
	21, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	548, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Chilinda', -- Site Name
	'MT.05/006', -- School Code
	'', -- Status
	21, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	549, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Dinyeke', -- Site Name
	'MT.05/126', -- School Code
	'', -- Status
	21, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	550, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Kilidu-Mkoreha', -- Site Name
	'MT.05/014', -- School Code
	'', -- Status
	21, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	551, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Kitama       I', -- Site Name
	'MT.05/015', -- School Code
	'', -- Status
	21, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	552, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Michenjele', -- Site Name
	'MT.05/047', -- School Code
	'', -- Status
	21, -- TC/TRC
	1, -- Intervention Type
	GeomFromText('POINT(-10.4553833333333 39.9504833333333)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	553, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Mihambwe', -- Site Name
	'MT.05/048', -- School Code
	'', -- Status
	21, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	554, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Mitondi', -- Site Name
	'MT.05/056', -- School Code
	'', -- Status
	21, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	555, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Mitondi          A', -- Site Name
	'MT.05/114', -- School Code
	'', -- Status
	21, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	556, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Mitumbati', -- Site Name
	'MT.05/057', -- School Code
	'', -- Status
	21, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	557, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Mkaha', -- Site Name
	'MT.05/129', -- School Code
	'', -- Status
	21, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	558, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Mmalala', -- Site Name
	'MT.05/069', -- School Code
	'', -- Status
	21, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	559, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Mnyahi', -- Site Name
	'MT.05/073', -- School Code
	'', -- Status
	21, -- TC/TRC
	1, -- Intervention Type
	GeomFromText('POINT(-10.785 39.75415)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	560, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Mpunda', -- Site Name
	'MT.05/132', -- School Code
	'', -- Status
	21, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	561, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Mwangaza', -- Site Name
	'MT.05/084', -- School Code
	'', -- Status
	21, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	562, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Mwenge', -- Site Name
	'MT.05/085', -- School Code
	'', -- Status
	21, -- TC/TRC
	1, -- Intervention Type
	GeomFromText('POINT(-10.38555 40.1266666666667)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	563, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Namdwani', -- Site Name
	'MT.05/091', -- School Code
	'', -- Status
	21, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	564, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Namedi', -- Site Name
	'MT.05/130', -- School Code
	'', -- Status
	21, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	565, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Namunda', -- Site Name
	'MT.05/118', -- School Code
	'', -- Status
	21, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	566, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Naputa', -- Site Name
	'MT.05/102', -- School Code
	'', -- Status
	21, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	567, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Ngongo', -- Site Name
	'MT.05/103', -- School Code
	'', -- Status
	21, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	568, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Ng\'ongoro', -- Site Name
	'MT.05/123', -- School Code
	'', -- Status
	21, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	569, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Nyuta', -- Site Name
	'TEMP_0013', -- School Code
	'', -- Status
	21, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	570, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Ruvuma', -- Site Name
	'MT.05/116', -- School Code
	'', -- Status
	21, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	571, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Amani', -- Site Name
	'MT.05/119', -- School Code
	'', -- Status
	22, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	572, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Dinduma', -- Site Name
	'MT.05/124', -- School Code
	'', -- Status
	22, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	573, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Lienje', -- Site Name
	'MT.05/017', -- School Code
	'', -- Status
	22, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	574, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Madaba', -- Site Name
	'MT.05/029', -- School Code
	'', -- Status
	22, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	575, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Mahoha', -- Site Name
	'MT.05/125', -- School Code
	'', -- Status
	22, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	576, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Malamba', -- Site Name
	'MT.05/036', -- School Code
	'', -- Status
	22, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	577, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Matogoro', -- Site Name
	'TEMP_0014', -- School Code
	'', -- Status
	22, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	578, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Mbalala', -- Site Name
	'MT.05/042', -- School Code
	'', -- Status
	22, -- TC/TRC
	3, -- Intervention Type
	GeomFromText('POINT(-10.7323166666667 39.5990333333333)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	579, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Milongodi', -- Site Name
	'MT.05/053', -- School Code
	'', -- Status
	22, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	580, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Mitene', -- Site Name
	'MT.05/055', -- School Code
	'', -- Status
	22, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	581, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Miule', -- Site Name
	'MT.05/058', -- School Code
	'', -- Status
	22, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	582, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Mtinginda', -- Site Name
	'MT.05/115', -- School Code
	'', -- Status
	22, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	583, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Nachunyu', -- Site Name
	'MT.05/087', -- School Code
	'', -- Status
	22, -- TC/TRC
	1, -- Intervention Type
	GeomFromText('POINT(-10.6846833333333 39.5990333333333)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	584, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Nambahu', -- Site Name
	'MT.05/090', -- School Code
	'', -- Status
	22, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	585, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Namkomolela', -- Site Name
	'MT.05/096', -- School Code
	'', -- Status
	22, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	586, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Nanhyanga    A', -- Site Name
	'MT.05/097', -- School Code
	'', -- Status
	22, -- TC/TRC
	1, -- Intervention Type
	GeomFromText('POINT(-10.8155666666667 39.52135)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	587, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Nanhyanga     B', -- Site Name
	'MT.05/098', -- School Code
	'', -- Status
	22, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	588, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Nanyuwila', -- Site Name
	'MT.05/101', -- School Code
	'', -- Status
	22, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	589, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Nivanga (Mivanga)', -- Site Name
	'MT.05/060', -- School Code
	'', -- Status
	22, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	590, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Njimpya (Mjimpya)', -- Site Name
	'MT.05/117', -- School Code
	'', -- Status
	22, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	591, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Tandahimba', -- Site Name
	'MT.05/106', -- School Code
	'', -- Status
	22, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	592, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Ukombozi', -- Site Name
	'MT.05/110', -- School Code
	'', -- Status
	22, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	593, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Zambia', -- Site Name
	'MT.05/111', -- School Code
	'', -- Status
	22, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	594, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Chikongola', -- Site Name
	'MT.05/003', -- School Code
	'', -- Status
	23, -- TC/TRC
	3, -- Intervention Type
	GeomFromText('POINT(-10.2836166666667 40.1783333333333)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	595, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Chikunda', -- Site Name
	'MT.05/005', -- School Code
	'', -- Status
	23, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	596, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Chitoholi', -- Site Name
	'MT.05/008', -- School Code
	'', -- Status
	23, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	597, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Chitoholi A', -- Site Name
	'MT.05/134', -- School Code
	'', -- Status
	23, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	598, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Chungungwe', -- Site Name
	'MT.05/007', -- School Code
	'', -- Status
	23, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	599, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Dinembo', -- Site Name
	'MT.05/011', -- School Code
	'', -- Status
	23, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	600, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Lipalwe', -- Site Name
	'MT.05/019', -- School Code
	'', -- Status
	23, -- TC/TRC
	1, -- Intervention Type
	GeomFromText('POINT(-10.9451833333333 39.4717)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	601, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Lipalwe Chini', -- Site Name
	'MT.05/127', -- School Code
	'', -- Status
	23, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	602, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Lubangala', -- Site Name
	'MT.05/026', -- School Code
	'', -- Status
	23, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	603, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Mahuta Bondeni', -- Site Name
	'MT.05/031', -- School Code
	'', -- Status
	23, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	604, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Mahuta Mjini', -- Site Name
	'MT.05/032', -- School Code
	'', -- Status
	23, -- TC/TRC
	1, -- Intervention Type
	GeomFromText('POINT(-10.87845 39.4717)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	605, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Majengo', -- Site Name
	'MT.05/033', -- School Code
	'', -- Status
	23, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	606, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Makayaka (Nakayaka)', -- Site Name
	'MT.05/088', -- School Code
	'', -- Status
	23, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	607, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Mambamba', -- Site Name
	'MT.05/037', -- School Code
	'', -- Status
	23, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	608, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Mfyatula', -- Site Name
	'MT.05/122', -- School Code
	'', -- Status
	23, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	609, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Mikunda', -- Site Name
	'MT.05/050', -- School Code
	'', -- Status
	23, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	610, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Milumba', -- Site Name
	'MT.05/054', -- School Code
	'', -- Status
	23, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	611, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Mkulung\'ulu', -- Site Name
	'MT.05/066', -- School Code
	'', -- Status
	23, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	612, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Mkupete', -- Site Name
	'MT.05/067', -- School Code
	'', -- Status
	23, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	613, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Mndumbwe', -- Site Name
	'MT.05/072', -- School Code
	'', -- Status
	23, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	614, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Mtandavala', -- Site Name
	'MT.05/077', -- School Code
	'', -- Status
	23, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	615, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Mtegu', -- Site Name
	'MT.05/078', -- School Code
	'', -- Status
	23, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	616, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Mtenda', -- Site Name
	'MT.05/079', -- School Code
	'', -- Status
	23, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	617, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Mtoni', -- Site Name
	'MT.05/081', -- School Code
	'', -- Status
	23, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	618, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Mnyoma', -- Site Name
	'MT.05/076', -- School Code
	'', -- Status
	23, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	619, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Chiumo', -- Site Name
	'MT.05/009', -- School Code
	'', -- Status
	24, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	620, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Ghana', -- Site Name
	'MT.05/012', -- School Code
	'', -- Status
	24, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	621, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Jangwani', -- Site Name
	'MT.05/013', -- School Code
	'', -- Status
	24, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	622, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Kunandundu', -- Site Name
	'MT.05/016', -- School Code
	'', -- Status
	24, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	623, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Litemla', -- Site Name
	'MT.05/021', -- School Code
	'', -- Status
	24, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	624, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Lukokoda', -- Site Name
	'MT.05/027', -- School Code
	'', -- Status
	24, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	625, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Maheha', -- Site Name
	'MT.05/030', -- School Code
	'', -- Status
	24, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	626, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Maundo Juu', -- Site Name
	'MT.05/041', -- School Code
	'', -- Status
	24, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	627, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Mbuyuni', -- Site Name
	'MT.05/021', -- School Code
	'', -- Status
	24, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	628, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Mchichira        A', -- Site Name
	'MT.05/044', -- School Code
	'', -- Status
	24, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	629, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Mnazimmoja', -- Site Name
	'MT.05/071', -- School Code
	'', -- Status
	24, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	630, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Mnyawa', -- Site Name
	'MT.05/075', -- School Code
	'', -- Status
	24, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	631, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Mundamkulu', -- Site Name
	'MT.05/083', -- School Code
	'', -- Status
	24, -- TC/TRC
	3, -- Intervention Type
	GeomFromText('POINT(-10.8869166666667 39.5092)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	632, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Namahonga', -- Site Name
	'MT.05/089', -- School Code
	'', -- Status
	24, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	633, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Namikupa     I', -- Site Name
	'MT.05/092', -- School Code
	'', -- Status
	24, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	634, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Nanikupa     Ii', -- Site Name
	'MT.05/093', -- School Code
	'', -- Status
	24, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	635, -- ID
	2, -- Catchment
	3, -- Mtwara
	13, -- District
	'Shangani', -- Site Name
	'MT.05/105', -- School Code
	'', -- Status
	24, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	636, -- ID
	2, -- Catchment
	3, -- Mtwara
	14, -- District
	'Chikongola', -- Site Name
	'MT.01/001', -- School Code
	'', -- Status
	25, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	637, -- ID
	2, -- Catchment
	3, -- Mtwara
	14, -- District
	'Chuno', -- Site Name
	'MT.01/002', -- School Code
	'', -- Status
	25, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	638, -- ID
	2, -- Catchment
	3, -- Mtwara
	14, -- District
	'Kambarage', -- Site Name
	'MT.01/020', -- School Code
	'', -- Status
	25, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	639, -- ID
	2, -- Catchment
	3, -- Mtwara
	14, -- District
	'Likonde', -- Site Name
	'MT.01/004', -- School Code
	'', -- Status
	25, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	640, -- ID
	2, -- Catchment
	3, -- Mtwara
	14, -- District
	'Maendeleo', -- Site Name
	'MT.01/024', -- School Code
	'', -- Status
	25, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	641, -- ID
	2, -- Catchment
	3, -- Mtwara
	14, -- District
	'Majengo', -- Site Name
	'MT.01/008', -- School Code
	'', -- Status
	25, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	642, -- ID
	2, -- Catchment
	3, -- Mtwara
	14, -- District
	'Mangamba', -- Site Name
	'MT.01/009', -- School Code
	'', -- Status
	25, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	643, -- ID
	2, -- Catchment
	3, -- Mtwara
	14, -- District
	'Mazoezi Ligula', -- Site Name
	'MT.01/003', -- School Code
	'', -- Status
	25, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	644, -- ID
	2, -- Catchment
	3, -- Mtwara
	14, -- District
	'Misufini', -- Site Name
	'MT.01/026', -- School Code
	'', -- Status
	25, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	645, -- ID
	2, -- Catchment
	3, -- Mtwara
	14, -- District
	'Mlimani', -- Site Name
	'MT.01/013', -- School Code
	'', -- Status
	25, -- TC/TRC
	3, -- Intervention Type
	GeomFromText('POINT(-10.2847166666667 40.1888833333333)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	646, -- ID
	2, -- Catchment
	3, -- Mtwara
	14, -- District
	'Mtawanya', -- Site Name
	'MT.01/022', -- School Code
	'', -- Status
	25, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	647, -- ID
	2, -- Catchment
	3, -- Mtwara
	14, -- District
	'Namayanga', -- Site Name
	'MT.01/023', -- School Code
	'', -- Status
	25, -- TC/TRC
	1, -- Intervention Type
	GeomFromText('POINT(-10.35195 40.16805)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	648, -- ID
	2, -- Catchment
	3, -- Mtwara
	14, -- District
	'Raha Leo', -- Site Name
	'MT.01/016', -- School Code
	'', -- Status
	25, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	649, -- ID
	2, -- Catchment
	3, -- Mtwara
	14, -- District
	'Shangani', -- Site Name
	'MT.01/017', -- School Code
	'', -- Status
	25, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	650, -- ID
	2, -- Catchment
	3, -- Mtwara
	14, -- District
	'Tandika', -- Site Name
	'MT.01/028', -- School Code
	'', -- Status
	25, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	651, -- ID
	2, -- Catchment
	3, -- Mtwara
	14, -- District
	'Lilungu', -- Site Name
	'MT.01/005', -- School Code
	'', -- Status
	26, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	652, -- ID
	2, -- Catchment
	3, -- Mtwara
	14, -- District
	'Lwelu', -- Site Name
	'MT.01/006', -- School Code
	'', -- Status
	26, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	653, -- ID
	2, -- Catchment
	3, -- Mtwara
	14, -- District
	'Magomeni', -- Site Name
	'MT.01/007', -- School Code
	'', -- Status
	26, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	654, -- ID
	2, -- Catchment
	3, -- Mtwara
	14, -- District
	'Mangowela', -- Site Name
	'MT.01/025', -- School Code
	'', -- Status
	26, -- TC/TRC
	3, -- Intervention Type
	GeomFromText('POINT(-10.29055 40.1786166666667)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	655, -- ID
	2, -- Catchment
	3, -- Mtwara
	14, -- District
	'Mikindani', -- Site Name
	'MT.01/010', -- School Code
	'', -- Status
	26, -- TC/TRC
	1, -- Intervention Type
	GeomFromText('POINT(-10.2833333333333 40.1066666666667)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	656, -- ID
	2, -- Catchment
	3, -- Mtwara
	14, -- District
	'Mitengo', -- Site Name
	'MT.01/011', -- School Code
	'', -- Status
	26, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	657, -- ID
	2, -- Catchment
	3, -- Mtwara
	14, -- District
	'Mivinjeni', -- Site Name
	'MT.01/027', -- School Code
	'', -- Status
	26, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	658, -- ID
	2, -- Catchment
	3, -- Mtwara
	14, -- District
	'Mkangala', -- Site Name
	'MT.01/012', -- School Code
	'', -- Status
	26, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	659, -- ID
	2, -- Catchment
	3, -- Mtwara
	14, -- District
	'Mwenge', -- Site Name
	'MT.01/021', -- School Code
	'', -- Status
	26, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	660, -- ID
	2, -- Catchment
	3, -- Mtwara
	14, -- District
	'Mnaida', -- Site Name
	'MT.01/014', -- School Code
	'', -- Status
	26, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	661, -- ID
	2, -- Catchment
	3, -- Mtwara
	14, -- District
	'Naliendele', -- Site Name
	'MT.01/015', -- School Code
	'', -- Status
	26, -- TC/TRC
	1, -- Intervention Type
	GeomFromText('POINT(-10.358 40.1556666666667)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	662, -- ID
	2, -- Catchment
	3, -- Mtwara
	14, -- District
	'Singino', -- Site Name
	'MT.01/018', -- School Code
	'', -- Status
	26, -- TC/TRC
	1, -- Intervention Type
	GeomFromText('POINT(-10.1021666666667 40.0738333333333)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	663, -- ID
	2, -- Catchment
	3, -- Mtwara
	14, -- District
	'Ufukoni', -- Site Name
	'MT.01/019', -- School Code
	'', -- Status
	26, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	664, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Chemchem', -- Site Name
	'MT.02/062', -- School Code
	'', -- Status
	27, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	665, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Chihanga', -- Site Name
	'MT.02/108', -- School Code
	'', -- Status
	27, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	666, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Ilala', -- Site Name
	'TEMP_0015', -- School Code
	'', -- Status
	27, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	667, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Imekuwa', -- Site Name
	'MT.02/059', -- School Code
	'', -- Status
	27, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	668, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Kitere', -- Site Name
	'MT.02/011', -- School Code
	'', -- Status
	27, -- TC/TRC
	3, -- Intervention Type
	GeomFromText('POINT(-10.35435 39.78015)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	669, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Libobe', -- Site Name
	'MT.02/007', -- School Code
	'', -- Status
	27, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	670, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Likonde', -- Site Name
	'MT.02/092', -- School Code
	'', -- Status
	27, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	671, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Lipwidi', -- Site Name
	'MT.02/051', -- School Code
	'', -- Status
	27, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	672, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Lyowa', -- Site Name
	'MT.02/056', -- School Code
	'', -- Status
	27, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	673, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Mangopachanne', -- Site Name
	'MT.02/036', -- School Code
	'', -- Status
	27, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	674, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Mbuo', -- Site Name
	'MT.02/067', -- School Code
	'', -- Status
	27, -- TC/TRC
	1, -- Intervention Type
	GeomFromText('POINT(-10.2539833333333 39.9937666666667)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	675, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Ndumbwe', -- Site Name
	'MT.02/002', -- School Code
	'', -- Status
	27, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	676, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Mgao', -- Site Name
	'MT.02/055', -- School Code
	'', -- Status
	27, -- TC/TRC
	3, -- Intervention Type
	GeomFromText('POINT(-10.13785 39.9819666666667)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	677, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Mikonye', -- Site Name
	'MT.02/091', -- School Code
	'', -- Status
	27, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	678, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Mng\'wena', -- Site Name
	'MT.02/100', -- School Code
	'', -- Status
	27, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	679, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Mnyija', -- Site Name
	'MT.02/061', -- School Code
	'', -- Status
	27, -- TC/TRC
	3, -- Intervention Type
	GeomFromText('POINT(-10.2804666666667 39.8094666666667)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	680, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Mnima', -- Site Name
	'MT.02/009', -- School Code
	'', -- Status
	27, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	681, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Mnyundo', -- Site Name
	'MT.02/020', -- School Code
	'', -- Status
	27, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	682, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Mpapura', -- Site Name
	'MT.02/066', -- School Code
	'', -- Status
	27, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	683, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Msijute', -- Site Name
	'MT.02/069', -- School Code
	'', -- Status
	27, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	684, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Mtama', -- Site Name
	'MT.02/076', -- School Code
	'', -- Status
	27, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	685, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Mtukimango', -- Site Name
	'TEMP_0016', -- School Code
	'', -- Status
	27, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	686, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Muungano', -- Site Name
	'MT.02/057', -- School Code
	'', -- Status
	27, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	687, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Mwembetogwa', -- Site Name
	'MT.02/102', -- School Code
	'', -- Status
	27, -- TC/TRC
	3, -- Intervention Type
	GeomFromText('POINT(-10.3193 40.0033166666667)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	688, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Namambi', -- Site Name
	'MT.02/103', -- School Code
	'', -- Status
	27, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	689, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Namdimba', -- Site Name
	'MT.02/105', -- School Code
	'', -- Status
	27, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	690, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Namgogoli', -- Site Name
	'MT.02/017', -- School Code
	'', -- Status
	27, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	691, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Namuhi', -- Site Name
	'MT.02/044', -- School Code
	'', -- Status
	27, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	692, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Naumbu', -- Site Name
	'MT.02/018', -- School Code
	'', -- Status
	27, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	693, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Utende', -- Site Name
	'MT.02/065', -- School Code
	'', -- Status
	27, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	694, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Kihamba', -- Site Name
	'MT.02/073', -- School Code
	'', -- Status
	28, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	695, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Kihimika', -- Site Name
	'MT.02/079', -- School Code
	'', -- Status
	28, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	696, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Kilambo', -- Site Name
	'MT.02/080', -- School Code
	'', -- Status
	28, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	697, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Kilombero', -- Site Name
	'MT.02/029', -- School Code
	'', -- Status
	28, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	698, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Kitunguli', -- Site Name
	'MT.02/008', -- School Code
	'', -- Status
	28, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	699, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Kivava', -- Site Name
	'MT.02/094', -- School Code
	'', -- Status
	28, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	700, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Litembe', -- Site Name
	'MT.02/074', -- School Code
	'', -- Status
	28, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	701, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Madimba', -- Site Name
	'MT.02/033', -- School Code
	'', -- Status
	28, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	702, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Mayaya', -- Site Name
	'MT.02/081', -- School Code
	'', -- Status
	28, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	703, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Mitambo', -- Site Name
	'MT.02/111', -- School Code
	'', -- Status
	28, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	704, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Mkubiru', -- Site Name
	'MT.02/054', -- School Code
	'', -- Status
	28, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	705, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Moma', -- Site Name
	'MT.02/038', -- School Code
	'', -- Status
	28, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	706, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Mngoji', -- Site Name
	'MT.02/060', -- School Code
	'', -- Status
	28, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	707, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Mnomo', -- Site Name
	'MT.02/097', -- School Code
	'', -- Status
	28, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	708, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Msangamku', -- Site Name
	'MT.02/019', -- School Code
	'', -- Status
	28, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	709, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Msimbati', -- Site Name
	'MT.02/014', -- School Code
	'', -- Status
	28, -- TC/TRC
	1, -- Intervention Type
	GeomFromText('POINT(-10.35725 40.4229166666667)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	710, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Mtendachi', -- Site Name
	'MT.02/058', -- School Code
	'', -- Status
	28, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	711, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Nalingu', -- Site Name
	'MT.02/039', -- School Code
	'', -- Status
	28, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	712, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Nambeleketela', -- Site Name
	'MT.02/104', -- School Code
	'', -- Status
	28, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	713, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Tangazo', -- Site Name
	'MT.02/012', -- School Code
	'', -- Status
	28, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	714, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Ziwani', -- Site Name
	'MT.02/013', -- School Code
	'', -- Status
	28, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	715, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Bandari', -- Site Name
	'MT.02/048', -- School Code
	'', -- Status
	29, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	716, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Chawi', -- Site Name
	'MT.02/034', -- School Code
	'', -- Status
	29, -- TC/TRC
	1, -- Intervention Type
	GeomFromText('POINT(-10.5581833333333 40.10185)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	717, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Dihimba', -- Site Name
	'MT.02/003', -- School Code
	'', -- Status
	29, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	718, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Kawawa', -- Site Name
	'MT.02/028', -- School Code
	'', -- Status
	29, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	719, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Kiromba', -- Site Name
	'MT.02/016', -- School Code
	'', -- Status
	29, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	720, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Kiromba Chini', -- Site Name
	'MT.02/084', -- School Code
	'', -- Status
	29, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	721, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Kitaya', -- Site Name
	'MT.02/004', -- School Code
	'', -- Status
	29, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	722, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Maranje', -- Site Name
	'MT.02/049', -- School Code
	'', -- Status
	29, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	723, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Makome', -- Site Name
	'MT.02/075', -- School Code
	'', -- Status
	29, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	724, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Malamba', -- Site Name
	'MT.02/046', -- School Code
	'', -- Status
	29, -- TC/TRC
	1, -- Intervention Type
	GeomFromText('POINT(-10.6399833333333 39.9647666666667)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	725, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Mayembe Chini', -- Site Name
	'MT.02/053', -- School Code
	'', -- Status
	29, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	726, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Mayembe Juu', -- Site Name
	'MT.02/086', -- School Code
	'', -- Status
	29, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	727, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Mbawala', -- Site Name
	'MT.02/010', -- School Code
	'', -- Status
	29, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	728, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Mchanje', -- Site Name
	'MT.02/091', -- School Code
	'', -- Status
	29, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	729, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Ngonja', -- Site Name
	'MT.02/096', -- School Code
	'', -- Status
	29, -- TC/TRC
	1, -- Intervention Type
	GeomFromText('POINT(-10.5812833333333 40.1578166666667)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	730, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Misufini', -- Site Name
	'MT.02/063', -- School Code
	'', -- Status
	29, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	731, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Miuta', -- Site Name
	'MT.02/047', -- School Code
	'', -- Status
	29, -- TC/TRC
	3, -- Intervention Type
	GeomFromText('POINT(-10.4949833333333 39.9287166666667)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	732, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Mkomo', -- Site Name
	'MT.02/095', -- School Code
	'', -- Status
	29, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	733, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Mkunwa', -- Site Name
	'MT.02/042', -- School Code
	'', -- Status
	29, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	734, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Mkwajuni', -- Site Name
	'MT.02/043', -- School Code
	'', -- Status
	29, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	735, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Mpanyani', -- Site Name
	'MT.02/083', -- School Code
	'', -- Status
	29, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	736, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Mtiniko', -- Site Name
	'MT.02/015', -- School Code
	'', -- Status
	29, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	737, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Nachenjele', -- Site Name
	'MT.02/087', -- School Code
	'', -- Status
	29, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	738, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Namahyakata', -- Site Name
	'MT.02/052', -- School Code
	'', -- Status
	29, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	739, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Namanjele', -- Site Name
	'MT.02/085', -- School Code
	'', -- Status
	29, -- TC/TRC
	1, -- Intervention Type
	GeomFromText('POINT(-10.4553833333333 39.9504833333333)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	740, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Nanguruwe', -- Site Name
	'MT.02/005', -- School Code
	'', -- Status
	29, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	741, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Navikole', -- Site Name
	'MT.02/077', -- School Code
	'', -- Status
	29, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	742, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Tumaini', -- Site Name
	'MT.02/114', -- School Code
	'', -- Status
	29, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	743, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Azimio', -- Site Name
	'MT.02/107', -- School Code
	'', -- Status
	30, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	744, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Chikwaya', -- Site Name
	'MT.02/064', -- School Code
	'', -- Status
	30, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	745, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Chiwilo', -- Site Name
	'MT.02/109', -- School Code
	'', -- Status
	30, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	746, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Chiwindi', -- Site Name
	'MT.02/090', -- School Code
	'', -- Status
	30, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	747, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Dinyecha', -- Site Name
	'MT.02/065', -- School Code
	'', -- Status
	30, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	748, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Hinju', -- Site Name
	'MT.02/032', -- School Code
	'', -- Status
	30, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	749, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Kiwengulo', -- Site Name
	'MT.02/082', -- School Code
	'', -- Status
	30, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	750, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Kilimahewa', -- Site Name
	'MT.02/098', -- School Code
	'', -- Status
	30, -- TC/TRC
	1, -- Intervention Type
	GeomFromText('POINT(-10.8022333333333 39.9215333333333)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	751, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Kitamabondeni', -- Site Name
	'MT.02/035', -- School Code
	'', -- Status
	30, -- TC/TRC
	1, -- Intervention Type
	GeomFromText('POINT(-10.7158833333333 39.7368833333333)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	752, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Kiyanga', -- Site Name
	'MT.02/041', -- School Code
	'', -- Status
	30, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	753, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Majengo', -- Site Name
	'MT.02/099', -- School Code
	'', -- Status
	30, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	754, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Mbambakofi', -- Site Name
	'MT.02/071', -- School Code
	'', -- Status
	30, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	755, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Mbembaleo', -- Site Name
	'MT.02/022', -- School Code
	'', -- Status
	30, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	756, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Migombani', -- Site Name
	'MT.02/088', -- School Code
	'', -- Status
	30, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	757, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Mibobo', -- Site Name
	'MT.02/050', -- School Code
	'', -- Status
	30, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	758, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Milangominne', -- Site Name
	'MT.02/070', -- School Code
	'', -- Status
	30, -- TC/TRC
	1, -- Intervention Type
	GeomFromText('POINT(-10.7262833333333 39.8306833333333)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	759, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Miule', -- Site Name
	'TEMP_0017', -- School Code
	'', -- Status
	30, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	760, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Mkahara', -- Site Name
	'MT.02/101', -- School Code
	'', -- Status
	30, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	761, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Mnongodi', -- Site Name
	'MT.02/027', -- School Code
	'', -- Status
	30, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	762, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Mnyahi', -- Site Name
	'MT.02/045', -- School Code
	'', -- Status
	30, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	763, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Mnyawi', -- Site Name
	'MT.02/031', -- School Code
	'', -- Status
	30, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	764, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Mtimbwilimbwi', -- Site Name
	'MT.02/023', -- School Code
	'', -- Status
	30, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	765, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Mtopwa', -- Site Name
	'MT.02/112', -- School Code
	'', -- Status
	30, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	766, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Mwang\'anga', -- Site Name
	'MT.02/072', -- School Code
	'', -- Status
	30, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	767, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Nanjedya', -- Site Name
	'MT.02/030', -- School Code
	'', -- Status
	30, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	768, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Namisangi', -- Site Name
	'MT.02/106', -- School Code
	'', -- Status
	30, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	769, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Namkuku', -- Site Name
	'MT.02/078', -- School Code
	'', -- Status
	30, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	770, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Namtumbuka', -- Site Name
	'MT.02/024', -- School Code
	'', -- Status
	30, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	771, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Nang\'awanga', -- Site Name
	'MT.02/040', -- School Code
	'', -- Status
	30, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	772, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Nanyamba', -- Site Name
	'MT.02/021', -- School Code
	'', -- Status
	30, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	773, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Nanyamba      B', -- Site Name
	'MT.02/093', -- School Code
	'', -- Status
	30, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	774, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Narunga', -- Site Name
	'MT.02/113', -- School Code
	'', -- Status
	30, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	775, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Nitekela', -- Site Name
	'MT.02/025', -- School Code
	'', -- Status
	30, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	776, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Niyumba', -- Site Name
	'MT.02/089', -- School Code
	'', -- Status
	30, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	777, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Njengwa', -- Site Name
	'MT.02/006', -- School Code
	'', -- Status
	30, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	778, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Nyahi', -- Site Name
	'TEMP_0018', -- School Code
	'', -- Status
	30, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	779, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Nyundo      B', -- Site Name
	'TEMP_0019', -- School Code
	'', -- Status
	30, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	780, -- ID
	2, -- Catchment
	3, -- Mtwara
	15, -- District
	'Nyundo      Ii', -- Site Name
	'MT.02/026', -- School Code
	'', -- Status
	30, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	781, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Chitowe', -- Site Name
	'MT.06/083', -- School Code
	'', -- Status
	31, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	782, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Chungu', -- Site Name
	'MT.06/051', -- School Code
	'', -- Status
	31, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	783, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Lukula', -- Site Name
	'MT.06/053', -- School Code
	'', -- Status
	31, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	784, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Lukwika', -- Site Name
	'MT.06/054', -- School Code
	'', -- Status
	31, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	785, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Makanya', -- Site Name
	'MT.06/070', -- School Code
	'', -- Status
	31, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	786, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Maneme', -- Site Name
	'MT.06/118', -- School Code
	'', -- Status
	31, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	787, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Marumba', -- Site Name
	'MT.06/176', -- School Code
	'', -- Status
	31, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	788, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Masuguru', -- Site Name
	'MT.06/101', -- School Code
	'', -- Status
	31, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	789, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Mtambaswala', -- Site Name
	'MT.06/218', -- School Code
	'', -- Status
	31, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	790, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Mbangara-Mbuyuni', -- Site Name
	'MT.06/238', -- School Code
	'', -- Status
	31, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	791, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Mehiru', -- Site Name
	'MT.06/235', -- School Code
	'', -- Status
	31, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	792, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Mitumbati', -- Site Name
	'MT.06/187', -- School Code
	'', -- Status
	31, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	793, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Mtawatawa', -- Site Name
	'MT.06/192', -- School Code
	'', -- Status
	31, -- TC/TRC
	1, -- Intervention Type
	GeomFromText('POINT(-11.0519 38.60215)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	794, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Namaromba', -- Site Name
	'MT.06/197', -- School Code
	'', -- Status
	31, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	795, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Namijati', -- Site Name
	'MT.06/228', -- School Code
	'', -- Status
	31, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	796, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Nanderu', -- Site Name
	'MT.06/091', -- School Code
	'', -- Status
	31, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	797, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Nanyumbu     I', -- Site Name
	'MT.06/028', -- School Code
	'', -- Status
	31, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	798, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Nanyumbu     Ii', -- Site Name
	'MT.06/152', -- School Code
	'', -- Status
	31, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	799, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Nauru', -- Site Name
	'MT.06/137', -- School Code
	'', -- Status
	31, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	800, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Njisa', -- Site Name
	'MT.06/126', -- School Code
	'', -- Status
	31, -- TC/TRC
	3, -- Intervention Type
	GeomFromText('POINT(-11.0519 38.5472833333333)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	801, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Chivirikiti', -- Site Name
	'MT.06/050', -- School Code
	'', -- Status
	32, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	802, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Holola', -- Site Name
	'MT.06/173', -- School Code
	'', -- Status
	32, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	803, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Mikuva', -- Site Name
	'MT.06/162', -- School Code
	'', -- Status
	32, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	804, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Mnanje', -- Site Name
	'MT.06/163', -- School Code
	'', -- Status
	32, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	805, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Mtalikachau', -- Site Name
	'MT.06/049', -- School Code
	'', -- Status
	32, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	806, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Nakole', -- Site Name
	'MT.06/080', -- School Code
	'', -- Status
	32, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	807, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Nandete', -- Site Name
	'MT.06/061', -- School Code
	'', -- Status
	32, -- TC/TRC
	3, -- Intervention Type
	GeomFromText('POINT(-10.9056 38.8059)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	808, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Nandete      B', -- Site Name
	'MT.06/231', -- School Code
	'', -- Status
	32, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	809, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Ngupe', -- Site Name
	'MT.06/042', -- School Code
	'', -- Status
	32, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	810, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Ulanga', -- Site Name
	'MT.06/137', -- School Code
	'', -- Status
	32, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	811, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Chikunja      Ii', -- Site Name
	'MT.06/102', -- School Code
	'', -- Status
	33, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	812, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Kamundi', -- Site Name
	'MT.06/035', -- School Code
	'', -- Status
	33, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	813, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Kilosa', -- Site Name
	'MT.06/062', -- School Code
	'', -- Status
	33, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	814, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Lipupu', -- Site Name
	'MT.06/136', -- School Code
	'', -- Status
	33, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	815, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Malema', -- Site Name
	'MT.06/072', -- School Code
	'', -- Status
	33, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	816, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Mikangaula', -- Site Name
	'MT.06/157', -- School Code
	'', -- Status
	33, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	817, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Nangaramo', -- Site Name
	'MT.06/086', -- School Code
	'', -- Status
	33, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	818, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Mitimingi', -- Site Name
	'MT.06/045', -- School Code
	'', -- Status
	33, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	819, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Mkambata', -- Site Name
	'MT.06/196', -- School Code
	'', -- Status
	33, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	820, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Mkoromwana', -- Site Name
	'MT.06/232', -- School Code
	'', -- Status
	33, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	821, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Mkwajuni', -- Site Name
	'MT.06/191', -- School Code
	'', -- Status
	33, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	822, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Namatumbusi', -- Site Name
	'MT.06/185', -- School Code
	'', -- Status
	33, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	823, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Nahimba', -- Site Name
	'MT.06/006', -- School Code
	'', -- Status
	33, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	824, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Nawaje', -- Site Name
	'MT.06/200', -- School Code
	'', -- Status
	33, -- TC/TRC
	1, -- Intervention Type
	GeomFromText('POINT(-10.8145 38.6046666666667)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	825, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Chinyanyila', -- Site Name
	'MT.06/227', -- School Code
	'', -- Status
	34, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	826, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Chipuputa', -- Site Name
	'MT.06/096', -- School Code
	'', -- Status
	34, -- TC/TRC
	3, -- Intervention Type
	GeomFromText('POINT(-11.0015333333333 38.40105)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	827, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Chipuputa     B', -- Site Name
	'MT.06/226', -- School Code
	'', -- Status
	34, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	828, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Kilimanihewa', -- Site Name
	'MT.06/153', -- School Code
	'', -- Status
	34, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	829, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Magomeni', -- Site Name
	'MT.06/194', -- School Code
	'', -- Status
	34, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	830, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Mangaka', -- Site Name
	'MT.06/018', -- School Code
	'', -- Status
	34, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	831, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Mara', -- Site Name
	'MT.06/116', -- School Code
	'', -- Status
	34, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	832, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Masyalele', -- Site Name
	'MT.06/184', -- School Code
	'', -- Status
	34, -- TC/TRC
	3, -- Intervention Type
	GeomFromText('POINT(-10.8547333333333 38.3636166666667)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	833, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Mkoma', -- Site Name
	'MT.06/117', -- School Code
	'', -- Status
	34, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	834, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Mkumbaru', -- Site Name
	'MT.06/109', -- School Code
	'', -- Status
	34, -- TC/TRC
	1, -- Intervention Type
	GeomFromText('POINT(-10.7745166666667 38.2468166666667)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	835, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Mnemeka', -- Site Name
	'MT.06/169', -- School Code
	'', -- Status
	34, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	836, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Mnonia', -- Site Name
	'MT.06/226', -- School Code
	'', -- Status
	34, -- TC/TRC
	1, -- Intervention Type
	GeomFromText('POINT(-10.88865 38.4143166666667)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	837, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Mpwahia', -- Site Name
	'MT.06/106', -- School Code
	'', -- Status
	34, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	838, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Mtokora', -- Site Name
	'MT.06/202', -- School Code
	'', -- Status
	34, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	839, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Muungano', -- Site Name
	'MT.06/143', -- School Code
	'', -- Status
	34, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	840, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Mwambani', -- Site Name
	'MT.06/129', -- School Code
	'', -- Status
	34, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	841, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Nachiura', -- Site Name
	'MT.06/113', -- School Code
	'', -- Status
	34, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	842, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Nakatete', -- Site Name
	'MT.06/126', -- School Code
	'', -- Status
	34, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	843, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Namasogo', -- Site Name
	'MT.06/040', -- School Code
	'', -- Status
	34, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	844, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Nangomba', -- Site Name
	'MT.06/022', -- School Code
	'', -- Status
	34, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	845, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Nanjisa', -- Site Name
	'MT.06/142', -- School Code
	'', -- Status
	34, -- TC/TRC
	1, -- Intervention Type
	GeomFromText('POINT(-10.9895666666667 38.3686666666667)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	846, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Ndwika        Ii', -- Site Name
	'MT.06/201', -- School Code
	'', -- Status
	34, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	847, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Rukumbi', -- Site Name
	'MT.06/193', -- School Code
	'', -- Status
	34, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	848, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Sengenya', -- Site Name
	'MT.06/195', -- School Code
	'', -- Status
	34, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	849, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Changwale', -- Site Name
	'MT.06/219', -- School Code
	'', -- Status
	35, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	850, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Chigweje', -- Site Name
	'MT.06/147', -- School Code
	'', -- Status
	35, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	851, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Chimika', -- Site Name
	'MT.06/170', -- School Code
	'', -- Status
	35, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	852, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Kazamoyo', -- Site Name
	'MT.06/198', -- School Code
	'', -- Status
	35, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	853, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Likokona', -- Site Name
	'MT.06/052', -- School Code
	'', -- Status
	35, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	854, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Lumesule', -- Site Name
	'MT.06/066', -- School Code
	'', -- Status
	35, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	855, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Makong\'ondera', -- Site Name
	'MT.06/098', -- School Code
	'', -- Status
	35, -- TC/TRC
	1, -- Intervention Type
	GeomFromText('POINT(-11.0264666666667 39.2557)'),  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	856, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Mburusa', -- Site Name
	'MT.06/062', -- School Code
	'', -- Status
	35, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	857, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Mchenjeuka', -- Site Name
	'MT.06/190', -- School Code
	'', -- Status
	35, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	858, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Michiga', -- Site Name
	'MT.06/214', -- School Code
	'', -- Status
	35, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	859, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Michiga        B', -- Site Name
	'MT.06/127', -- School Code
	'', -- Status
	35, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	860, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Likokona        B', -- Site Name
	'MT.06/221', -- School Code
	'', -- Status
	35, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	861, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Mpombe', -- Site Name
	'MT.06/036', -- School Code
	'', -- Status
	35, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	862, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Msinyasi', -- Site Name
	'MT.06/154', -- School Code
	'', -- Status
	35, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	863, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Nakopi', -- Site Name
	'MT.06/139', -- School Code
	'', -- Status
	35, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	864, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Namaka', -- Site Name
	'MT.06/229', -- School Code
	'', -- Status
	35, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	865, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Nandembo', -- Site Name
	'MT.06/074', -- School Code
	'', -- Status
	35, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 INSERT INTO `schools` VALUES (
	866, -- ID
	2, -- Catchment
	3, -- Mtwara
	16, -- District
	'Ndechela', -- Site Name
	'MT.06/024', -- School Code
	'', -- Status
	35, -- TC/TRC
	2, -- Intervention Type
	'',  -- Location
	0, -- Power Type
	0, -- Connectivity Type
	'', -- Warning
	'2012-01-01 00:00:00', -- Install date
	'', -- Access Instructions
	0, -- Site State
	0, -- Service Provider
	0, -- Road Type
	0 -- User ID 
);

 UNLOCK TABLES;



--
-- Table structure for table `connectivity_types`
--

DROP TABLE IF EXISTS `connectivity_types`;
CREATE TABLE `connectivity_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `connectivity_types`
--

LOCK TABLES `connectivity_types` WRITE;
INSERT INTO `connectivity_types` VALUES (1,'Vsat'),(2,'GSM'),(3,'P2P Wireless'),(4,'CDMA ');
UNLOCK TABLES;

DROP TABLE IF EXISTS `districts`;
CREATE TABLE `districts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `area_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

LOCK TABLES `districts` WRITE;
INSERT INTO `districts` VALUES
(1,'Central',1),
-- (2,'Norths'A'',1),
-- (3,'Norths'B'',1),
(2,'North A',1),
(3,'North B',1),
(4,'Chake Chake',1),
(5,'Wete',1),
(6,'Micheweni',1),
(7,'Mkoani',1),
(8,'South',1),
(9,'West',1),
(10,'Urban',1),
(11,'Newala',1),
(12,'Masasi',1),
(13,'Tandahimba',1),
(14,'Mtwara MC',1),
(15,'Mtwara DC',1),
(16,'Nanyumbu',1);

UNLOCK TABLES;


DROP TABLE IF EXISTS `intervention_types`;
CREATE TABLE `intervention_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

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

DROP TABLE IF EXISTS `isps`;
CREATE TABLE `isps` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

LOCK TABLES `isps` WRITE;
INSERT INTO `isps` VALUES (1,'UhuruOne'),(2,'Zantel');
UNLOCK TABLES;

DROP TABLE IF EXISTS `power_types`;
CREATE TABLE `power_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;


LOCK TABLES `power_types` WRITE;
INSERT INTO `power_types` VALUES (1,'Grid'),(2,'Solar');
UNLOCK TABLES;

DROP TABLE IF EXISTS `catchments`;
CREATE TABLE `catchments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

LOCK TABLES `catchments` WRITE;
INSERT INTO `catchments` VALUES (1,'Zanzibar'),(2,'Mtwara');
UNLOCK TABLES;

DROP TABLE IF EXISTS `areas`;
CREATE TABLE `areas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `catchment_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

LOCK TABLES `areas` WRITE;
INSERT INTO `areas` VALUES
-- Zanzibar ID = 2
-- Mtwara ID = 1
(1,'Unguja',1),
(2,'Pemba',1),
(3,'Mtwara',2);;
UNLOCK TABLES;

DROP TABLE IF EXISTS `contacts`;
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

LOCK TABLES `contacts` WRITE;
INSERT INTO `contacts` VALUES
(1,'Clark','Ritchie','+1 (503) 936-2575','clarkritchie','critchie.org',5,4,NULL),
(2,'Andris','Bjornson','+1 (415) 205-7802','andris.bjornson','abjornson.org',2,1,NULL),
(3,'Jen','Overgaag','+1 (805) 440-9423','wyojeno','jovergaag.org',2,5,NULL);
UNLOCK TABLES;


DROP TABLE IF EXISTS `road_types`;
CREATE TABLE `road_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

LOCK TABLES `road_types` WRITE;
INSERT INTO `road_types` VALUES (1,'Unpaved, Poor'),(2,'Unpaved, Fair'),(3,'Unpaved, Good'),(4,'Paved, Poor'),(5,'Paved, Fair'),(6,'Paved, Good'),(7,'Road?  LOLs');
UNLOCK TABLES;

DROP TABLE IF EXISTS `service_providers`;
CREATE TABLE `service_providers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;


LOCK TABLES `service_providers` WRITE;
INSERT INTO `service_providers` VALUES (1,'UhuruOne'),(2,'Zantel');
UNLOCK TABLES;

DROP TABLE IF EXISTS `site_states`;
CREATE TABLE `site_states` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

LOCK TABLES `site_states` WRITE;
INSERT INTO `site_states` VALUES (1,'Install Need Identified'),(2,'Prerequisites Verified'),(3,'ISP Installation Complete'),(4,'Work Order Created'),(5,'Installation Scheduled/Team Assigned'),(6,'Team Pulls Equipment from Regional Hub'),(7,'Install in Progress'),(8,'Install Complete'),(9,'Spot-check by Inveneo'),(10,'School Accepted'),(11,'Site Complete'),(12,'Open Support Issue'),(13,'Third Tier Support From ICT IPs');
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `role_id` varchar(20) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
INSERT INTO `users` VALUES (1,'admin','c37948de525341d871f0550a1e0140752a95316a',1,'2012-07-18 20:09:51','2012-07-20 00:25:41'),
(2,'joe','acf16862470d5ca028de17722a5b72090d6259f4',1,'2012-07-18 21:52:44','2012-07-18 21:52:44'),
(3,'sue','ae1a12b6e634352e2a52bdc721da548b713f6cbb',2,'2012-07-18 21:56:14','2012-07-18 21:56:14'),
(4,'z
','b22cad3fb0a92d967353abbb3ef7399ca5a3034b',2,'2012-08-06 18:01:38','2012-08-06 18:01:38'),
(5,'zedit','6f0cfe47e87ae75ad5fd224e23656e546791b714',8,'2012-08-06 18:01:38','2012-08-06 18:01:38');
UNLOCK TABLES;


DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `rolealias` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
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
UNLOCK TABLES;

DROP PROCEDURE IF EXISTS sp_nearby;
-- Switch delimiter so the ; will work in the function body
DELIMITER ENDSPDEF
-- Create the procedure
-- GLength returns in degrees -- so multiply by 111.2 for Kms (69 for miles)
CREATE PROCEDURE sp_nearby(school_id int(10), max_schools int(10))
    BEGIN 
        SELECT id, school_code, school_name, 
        111.2*(GLength(LineStringFromWKB(LineString(location,(select location from schools where ID=school_id)))))
		AS distance,
		X(location) as lat,
		Y(location) as lon
		FROM schools
		WHERE location != '' -- IS NOT NULL -- locations may be null or empty, let's exclude those
		ORDER BY distance ASC		
		LIMIT 1, max_schools;  -- limit 1 here to exclude the school we're getting a distance from
    END ENDSPDEF
-- Switch the delimiter back to ;
DELIMITER ;

-- Update Districts to Areas
-- 1 Unguja
-- 2 Pemba
-- 3 Mtwara

-- ZANZIBAR	UNGUJA	SOUTH
-- ZANZIBAR	UNGUJA	CENTRAL
-- ZANZIBAR	UNGUJA	WEST
-- ZANZIBAR	UNGUJA	NORTH B
-- ZANZIBAR	UNGUJA	URBAN
-- ZANZIBAR	UNGUJA	NORTH A
UPDATE `districts` SET area_id=1 WHERE id=8; -- South
UPDATE `districts` SET area_id=1 WHERE id=1; -- Central
UPDATE `districts` SET area_id=1 WHERE id=9; -- West
UPDATE `districts` SET area_id=1 WHERE id=2; -- North A
UPDATE `districts` SET area_id=1 WHERE id=3; -- North B

-- ZANZIBAR	PEMBA	CHAKE CHAKE
-- ZANZIBAR	PEMBA	WETE
-- ZANZIBAR	PEMBA	MICHEWENI
-- ZANZIBAR	PEMBA	MKOANI
UPDATE `districts` SET area_id=2 WHERE id=4; -- Chake Chake
UPDATE `districts` SET area_id=2 WHERE id=5; -- Wete
UPDATE `districts` SET area_id=2 WHERE id=6; -- Micheweni
UPDATE `districts` SET area_id=2 WHERE id=7; -- Mkoani

-- MTWARA	MTWARA	NEWALA
-- MTWARA	MTWARA	MASASI
-- MTWARA	MTWARA	TANDAHIMBA
-- MTWARA	MTWARA	MTWARA MC
-- MTWARA	MTWARA	MTWARA DC
-- MTWARA	MTWARA	NANYUMBU
UPDATE `districts` SET area_id=3 WHERE id=11; -- Newala
UPDATE `districts` SET area_id=3 WHERE id=12; -- Masasi
UPDATE `districts` SET area_id=3 WHERE id=13; -- Tandahimba
UPDATE `districts` SET area_id=3 WHERE id=14; -- Mtwara MC
UPDATE `districts` SET area_id=3 WHERE id=15; -- Mtwara DC
UPDATE `districts` SET area_id=3 WHERE id=16; -- Nanyumbu

-- DROP INDEX school_code_idx ON schools;
-- CREATE INDEX school_code_idx ON schools(school_code);
-- CREATE INDEX schools_index2 ON schools(site_name);
-- CREATE INDEX school_idx ON schools(school_code,site_name);

