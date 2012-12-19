#!/usr/bin/perl

# perl tz21parserl.pl schools.csv trcs.csv

use feature qw{ switch };
use Date::Manip;
use Geo::Coordinates::DecimalDegrees;

$input1 = $ARGV[0]; # remember to use unix line breaks
$input2 = $ARGV[1]; # remember to use unix line breaks
die "Input file \"$input1\" does not exist?!" unless (-f $input1);
die "Input file \"$input2\" does not exist?!" unless (-f $input2);

$output = "tz21-autogen.sql";
$converted = 0; # count the number of coordinate conversions

print "Using \"$input1\" for School data\n";
print "Using \"$input2\" for TRC data\n";
print "Writing SQL to \"$output\"\n\n";

open(SCHOOLS,"< $input1");
open(TRCS,"< $input2");
open(OUTPUT,"> $output");

print OUTPUT "--\n";
print OUTPUT &UnixDate("today","-- This file auto-generated at %T on %b %e, %Y.");
print OUTPUT "\n--\n";

print OUTPUT <<TABLEDEF; # print everything up until TABLEDEF
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


TABLEDEF

$id = 1;
while ( <TRCS> ) {
	chomp;
	$_ =~ s/\r\n$/\n/g; # cleanup any ^M end of line marks (if any)
	@fields = split /,/;

	$trc_name = $fields[0];
	$trc_code = $fields[1];
	
	# escape any apostrophes in the site name
	$trc_name =~ s/\'/\\\'/g;
	# capitalize the first letter, lowercase the rest
	$trc_name =~ s/([\w']+)/\u\L$1/g;
	
	given ($trc_name) {
		when (/Dunga/i) { $trcid = 1; }
		when (/Mkwajuni/i) { $trcid = 2; }
		when (/Michakaini/i) { $trcid = 3; }
		when (/Mitiulaya/i) { $trcid = 4; }
		when (/Wingwi'/i) { $trcid = 5; }
		when (/Mizingani/i) { $trcid = 6; }
		when (/Kitogani/i) { $trcid = 7; }
		when (/Bububu/i) { $trcid = 8; }
		when (/Kiembesamaki/i) { $trcid = 9; }
		when (/Luchingu/i) { $trcid = 10; }
		when (/Kiuta/i) { $trcid = 11; }
		when (/Mikumbi/i) { $trcid = 12; }
		when (/Kitangari/i) { $trcid = 13; }
		when (/Lengo/i) { $trcid = 14; }
		when (/Chiungutwa/i) { $trcid = 15; }
		when (/Luagala/i) { $trcid = 16; }
		when (/Mwitika/i) { $trcid = 17; }
		when (/Mwena/i) { $trcid = 18; }
		when (/Mkomaindo/i) { $trcid = 19; }
		when (/Lukuledi/i) { $trcid = 20; }
		when (/Mihambwe/i) { $trcid = 21; }
		when (/Matogoro/i) { $trcid = 22; }
		when (/Chikongola/i) { $trcid = 23; }
		when (/Mchichira/i) { $trcid = 24; }
		when (/Majengo/i) { $trcid = 25; }
		when (/Mitengo/i) { $trcid = 26; }
		when (/Libobe/i) { $trcid = 27; }
		when (/Madimba/i) { $trcid = 28; }
		when (/Nanguruwe/i) { $trcid = 29; }
		when (/Nanyamba/i) { $trcid = 30; }
		when (/Nanyumbu/i) { $trcid = 31; }
		when (/Nandete/i) { $trcid = 32; }
		when (/Mikangaula/i) { $trcid = 33; }
		when (/Mangaka/i) { $trcid = 34; }
		when (/Michiga/i) { $trcid = 35; }
		when (/Wingwi/i) { $trcid = 36; }

		default { die "Unknown TC/TRC \"$trc_name\" - Line # ". $. . "\n"; }
	}
	
	print OUTPUT "INSERT INTO \`trcs\` VALUES (\n";
	
	print OUTPUT "\t$id, -- ID\n";
	print OUTPUT "\t\'$trc_name\', -- name\n";
	print OUTPUT "\t\'$trc_code\', -- trc_code\n";
	print OUTPUT "\t\'\', -- status\n";
	print OUTPUT "\t\'\', -- intervention_type_id\n";
	print OUTPUT "\t\'\', -- location\n";
	print OUTPUT "\t\'\', -- power_type_id\n";
	print OUTPUT "\t\'\', -- connectivity_type_id\n";
	print OUTPUT "\t\'\', -- warning\n";
	print OUTPUT "\t\'\', -- install_date\n";
	print OUTPUT "\t\'\', -- access_instruction\n";
	print OUTPUT "\t\'\', -- site_state_id\n";
	print OUTPUT "\t\'\', -- service_provider_id\n";
	print OUTPUT "\t\'\', -- road_type_id\n";
  	print OUTPUT "\t\'\'  -- user_id\n";
  	print OUTPUT ");\n\n";
  	
  	$id++;
}

print OUTPUT "\n\n\nLOCK TABLES \`schools\` WRITE\;\n\n";

$id = 1;
while ( <SCHOOLS> ) {
	chomp;
	$_ =~ s/\r\n$/\n/g; # cleanup any ^M end of line marks (if any)
	
	@fields = split /,/;
	
	$catchment = $fields[0];
	$area = $fields[1];
	$district = $fields[2];
	$name = $fields[3];
	$school_code = $fields[4];
	$school_status = $fields[5];
	$trc = $fields[6];
	$site_type = $fields[7];
	$lat = $fields[8];
	$lon = $fields[9];
	$power_type = $fields[10];
	$internet_type = $fields[11];
	$warning = $fields[12];
	
	print OUTPUT "INSERT INTO \`schools\` VALUES (\n";
	
	print OUTPUT "\t$id, -- ID\n";
	
	# Catchments:
	# 1 - Zanzibar
	# 2 - Mtwara
	
	given ($catchment) {
		when (/Zanzibar/i) { print OUTPUT "\t1, -- Catchment\n"; }
		when (/Mtwara/i) { print OUTPUT "\t2, -- Catchment\n"; }
		
		default { die "Unknown catchment \"$catchment\" - Line # ". $. . "\n"; }
	}
	
	# Areas:
	# 1 - Unguja
	# 2 - Pemba
	# 3 - Mtwara
	
	given ($area) {
		when (/Unguja/i) { print OUTPUT "\t1, -- Area\n"; }
		when (/Pemba/i) { print OUTPUT "\t2, -- Area\n"; }
		when (/Mtwara/i) { print OUTPUT "\t3, -- Mtwara\n"; }
		
		default { die "Unknown area \"$area\" - Line # ". $. . "\n" }
	}
	
	# Districts:
	# 1 - Central
	# 2 - North 'A'
	# 3 - North 'B'
	# 4 - Chake Chake
	# 5 - Wete
	# 6 - Micheweni
	# 7 - Mkoani
	# 8 - South
	# 9 - West
	# 10 - Urban
	# 11 - Newala
	# 12 - Masasi
	# 13 - Tandahimba
	# 14 - Mtwara MC
	# 15 - Mtwara DC
	# 16 - Nanyumbu
	
	given ($district) {
		when (/Central/i) { print OUTPUT "\t1, -- District\n"; }
		when (/North\sA/i) { print OUTPUT "\t2, -- District\n"; }
		when (/North\sB/i) { print OUTPUT "\t3, -- District\n"; }
		# when (/North\s\'A\'/i) { print OUTPUT "\t2, -- District\n"; }
		# when (/North\s\'B\'/i) { print OUTPUT "\t3, -- District\n"; }
		when (/Chake\sChake/i) { print OUTPUT "\t4, -- District\n"; }
		when (/Wete/i) { print OUTPUT "\t5, -- District\n"; }
		when (/Micheweni/i) { print OUTPUT "\t6, -- District\n"; }
		when (/Mkoani/i) { print OUTPUT "\t7, -- District\n"; }
		when (/South/i) { print OUTPUT "\t8, -- District\n"; }
		when (/West/i) { print OUTPUT "\t9, -- District\n"; }
		when (/Urban/i) { print OUTPUT "\t10, -- District\n"; }
		when (/Newala/i) { print OUTPUT "\t11, -- District\n"; }
		when (/Masasi/i) { print OUTPUT "\t12, -- District\n"; }
		when (/Tandahimba/i) { print OUTPUT "\t13, -- District\n"; }
		when (/Mtwara\sMC/i) { print OUTPUT "\t14, -- District\n"; }
		when (/Mtwara\sDC/i) { print OUTPUT "\t15, -- District\n"; }
		when (/Nanyumbu/i) { print OUTPUT "\t16, -- District\n"; }
		
		default { die "Unknown district \"$district\" - Line # ". $. . "\n"; }
	}
	
	# site name
	# escape any apostrophes in the site name
	$name =~ s/\'/\\\'/g;
	# capitalize the first letter, lowercase the rest
	$name =~ s/([\w']+)/\u\L$1/g;
	
	print OUTPUT "\t\'$name\', -- Site Name\n";
	
	# school code
	print OUTPUT "\t\'$school_code\', -- School Code\n";
	
	# leave school status blank
	print OUTPUT "\t\'\', -- Status\n";
	
	# TCs/TRCs:
	# 1 - Dunga
	# 2 - Mkwajuni
	# 3 - Michakaini
	# 4 - Mitiulaya
	# 5 - Wingwi
	# 6 - Mizingani
	# 7 - Kitogani
	# 8 - Bububu
	# 9 - Kiembesamaki
	# 10 - Luchingu
	# 11 - Kiuta
	# 12 - Mikumbi
	# 13 - Kitangari
	# 14 - Lengo
	# 15 - Chiungutwa
	# 16 - Luagala
	# 17 - Mwitika
	# 18 - Mwena
	# 19 - Mkomaindo
	# 20 - Lukuledi
	# 21 - Mihambwe
	# 22 - Matogoro
	# 23 - Chikongola
	# 24 - Mchichira
	# 25 - Majengo
	# 26 - Mitengo
	# 27 - Libobe
	# 28 - Madimba
	# 29 - Nanguruwe
	# 30 - Nanyamba
	# 31 - Nanyumbu
	# 32 - Nandete
	# 33 - Mikangaula
	# 34 - Mangaka
	# 35 - Michiga
	# 36 - Wingwi
	
	given ($trc) {
		when (/Dunga/i) { print OUTPUT "\t1, -- TC/TRC\n"; }
		when (/Mkwajuni/i) { print OUTPUT "\t2, -- TC/TRC\n"; }
		when (/Michakaini/i) { print OUTPUT "\t3, -- TC/TRC\n"; }
		when (/Mitiulaya/i) { print OUTPUT "\t4, -- TC/TRC\n"; }
		when (/Wingwi/i) { print OUTPUT "\t5, -- TC/TRC\n"; }
		when (/Mizingani/i) { print OUTPUT "\t6, -- TC/TRC\n"; }
		when (/Kitogani/i) { print OUTPUT "\t7, -- TC/TRC\n"; }
		when (/Bububu/i) { print OUTPUT "\t8, -- TC/TRC\n"; }
		when (/Kiembesamaki/i) { print OUTPUT "\t9, -- TC/TRC\n"; }
		when (/Luchingu/i) { print OUTPUT "\t10, -- TC/TRC\n"; }
		when (/Kiuta/i) { print OUTPUT "\t11, -- TC/TRC\n"; }
		when (/Mikumbi/i) { print OUTPUT "\t12, -- TC/TRC\n"; }
		when (/Kitangari/i) { print OUTPUT "\t13, -- TC/TRC\n"; }
		when (/Lengo/i) { print OUTPUT "\t14, -- TC/TRC\n"; }
		when (/Chiungutwa/i) { print OUTPUT "\t15, -- TC/TRC\n"; }
		when (/Luagala/i) { print OUTPUT "\t16, -- TC/TRC\n"; }
		when (/Mwitika/i) { print OUTPUT "\t17, -- TC/TRC\n"; }
		when (/Mwena/i) { print OUTPUT "\t18, -- TC/TRC\n"; }
		when (/Mkomaindo/i) { print OUTPUT "\t19, -- TC/TRC\n"; }
		when (/Lukuledi/i) { print OUTPUT "\t20, -- TC/TRC\n"; }
		when (/Mihambwe/i) { print OUTPUT "\t21, -- TC/TRC\n"; }
		when (/Matogoro/i) { print OUTPUT "\t22, -- TC/TRC\n"; }
		when (/Chikongola/i) { print OUTPUT "\t23, -- TC/TRC\n"; }
		when (/Mchichira/i) { print OUTPUT "\t24, -- TC/TRC\n"; }
		when (/Majengo/i) { print OUTPUT "\t25, -- TC/TRC\n"; }
		when (/Mitengo/i) { print OUTPUT "\t26, -- TC/TRC\n"; }
		when (/Libobe/i) { print OUTPUT "\t27, -- TC/TRC\n"; }
		when (/Madimba/i) { print OUTPUT "\t28, -- TC/TRC\n"; }
		when (/Nanguruwe/i) { print OUTPUT "\t29, -- TC/TRC\n"; }
		when (/Nanyamba/i) { print OUTPUT "\t30, -- TC/TRC\n"; }
		when (/Nanyumbu/i) { print OUTPUT "\t31, -- TC/TRC\n"; }
		when (/Nandete/i) { print OUTPUT "\t32, -- TC/TRC\n"; }
		when (/Mikangaula/i) { print OUTPUT "\t33, -- TC/TRC\n"; }
		when (/Mangaka/i) { print OUTPUT "\t34, -- TC/TRC\n"; }
		when (/Michiga/i) { print OUTPUT "\t35, -- TC/TRC\n"; }
		when (/Wingwi/i) { print OUTPUT "\t36, -- TC/TRC\n"; }
		
		default { die "Unknown TC/TRC \"$trc\" - Line # ". $. . "\n"; }
	}
	
	# Site Types
	# 1 Bridge IT (B)
	# 2 EMIS Only (E)
	# 3 Mobile Lab (M)
	# 4 Desktop Lab (D) -- Not User Anymore
	# 5 District Office (DO)
	# 6 Regional Office (RO)

 	given ($site_type) {
        when (/^B/) { print OUTPUT "\t1, -- Intervention Type\n" }
        when (/^E/) { print OUTPUT "\t2, -- Intervention Type\n" }
        when (/^M/) { print OUTPUT "\t3, -- Intervention Type\n" }
        when (/^D/) { print OUTPUT "\t4, -- Intervention Type\n" }
        when (/^DO/) { print OUTPUT "\t5, -- Intervention Type\n" }
        when (/^RO/) { print OUTPUT "\t6, -- Intervention Type\n" }
        
        default { die "Unknown site type \"$site_type\" - Line # ". $. . "\n" }
    }
	
	# location
	# default to zeros if no lat/lon
	# ($lat eq "") ? $lat = "0.00000" : 1 ;
	# ($lon eq "") ? $lon = "0.00000" : 1 ;
	
	# if ($id eq 264) {
	if ( $lat =~ m/.*\'$/ ) {
		print "\nConverting coordinates for ID $id\n";
		print "Old: $lat $lon\n";
		
		# remove '
		#$lat =~ s/\'//g;
		#$lon =~ s/\'//g;
		
		# split seconds
		# -10 52.360
		if ($lat =~ /(-*\d+)\s+(\d+\.\d+).*/) {
			$lat_hh = $1;
			$lat_mm = $2;
			# $lat_ss = $3;
		}
		if ($lon =~ /(-*\d+)\s+(\d+\.\d+).*/) {
			$lon_hh = $1;
			$lon_mm = $2;
			# $lon_ss = $3;
		}
		
		# print "lat_hh:$lat_hh lat_mm:$lat_mm\n";
		# print "lon_hh:$lon_hh lon_mm:$lon_mm\n";
			
		# http://www.earthpoint.us/Convert.aspx
		
		# ($degrees, $minutes, $seconds, $sign) = decimal2dms($decimal_degrees);
  		# ($degrees, $minutes, $sign) = decimal2dm($decimal_degrees);
  		$lat_decimal = dms2decimal($lat_hh, $lat_mm, 0);
  		$lon_decimal = dms2decimal($lon_hh, $lon_mm, 0);
  		# $lat_decimal = dms2decimal($lat_hh, $lat_mm, $lat_ss);
  		# $lon_decimal = dms2decimal($lon_hh, $lon_mm, $lon_ss);
  		#$decimal_degrees = dm2decimal($degrees, $minutes);
  		
		print "New $lat_decimal $lon_decimal\n";
		$lat = $lat_decimal;
		$lon = $lon_decimal;
		$converted++;
	}
	
	#if ($id > 439 && $id < 445) {
		print "$id coordinates: ($lat,$lon)\n";
	#}
	
	# handle blank coordinates
	if ($lat eq "" && $lon eq "") {
		print OUTPUT "\t\'\',  -- Location\n";
	} elsif ( $lat =~ /\d+\.\d+/ && $lon =~ /\d+\.\d+/ ) {
		print OUTPUT "\tGeomFromText\(\'POINT\($lat $lon\)\'\),  -- Location\n";
	} else {
		die "Bad latitude! - Line # ". $. . "\n" unless ($lat =~ /\d+\.\d+/);
		die "Bad longitude! - Line # ". $. . "\n" unless ($lon =~ /\d+\.\d+/);
	}
	# print OUTPUT "\tGeomFromText\(\'POINT\($lat $lon\)\'\),  -- Location\n";
	
	# power type
	# TBD
	print OUTPUT "\t0, -- Power Type\n";
	
	# internet type
	# TBD
	print OUTPUT "\t0, -- Connectivity Type\n";
	
	# warning
	print OUTPUT "\t\'$warning\', -- Warning\n";
	
	# `install_date` datetime DEFAULT NULL,
  	print OUTPUT "\t\'2012-01-01 00:00:00\', -- Install date\n";
  	
  	# `access_instruction` TEXT DEFAULT NULL,
  	print OUTPUT "\t\'\', -- Access Instructions\n";
  	
  	# `site_state_id` int(10) NOT NULL,
  	print OUTPUT "\t0, -- Site State\n";
  	
  	# `service_provider_id` int(10) NOT NULL,
  	print OUTPUT "\t0, -- Service Provider\n";
  	
  	# `road_type_id` int(10) NOT NULL,
  	print OUTPUT "\t0, -- Road Type\n";
  	
  	# `user_id` int(11) DEFAULT NULL,
	print OUTPUT "\t0 -- User ID \n";
	
	print OUTPUT ")\;\n\n ";
	$id++;
}

print OUTPUT "UNLOCK TABLES\;\n\n";

print OUTPUT <<TABLEDEF; # print everything up until TABLEDEF


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
-- (2,'North\s\'A\'',1),
-- (3,'North\s\'B\'',1),
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
(1,'Clark','Ritchie','+1 (503) 936-2575','clarkritchie','critchie@inveneo.org',5,4,NULL),
(2,'Andris','Bjornson','+1 (415) 205-7802','andris.bjornson','abjornson@inveneo.org',2,1,NULL),
(3,'Jen','Overgaag','+1 (805) 440-9423','wyojeno','jovergaag@inveneo.org',2,5,NULL);
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
        SELECT id, school_code, school_name, CONCAT(school_code, " ", school_name) as school_vf,
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
-- CREATE INDEX schools_index2 ON schools(name);
-- CREATE INDEX school_idx ON schools(school_code,name);

-- Dummy data
UPDATE `trcs` SET location=GeomFromText('POINT(-10.7262833333333 39.8306833333333)');


TABLEDEF



close SCHOOLS;
close OUTPUT;

print "Converted #$converted coordinates to decimal\n";