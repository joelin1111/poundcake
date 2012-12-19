#!/usr/bin/perl

# perl tz21parserl.pl schools.csv trcs.csv

use feature qw{ switch };
use Date::Manip;
use Geo::Coordinates::DecimalDegrees;

$input1 = $ARGV[0]; # remember to use unix line breaks
die "Input file \"$input1\" does not exist?!" unless (-f $input1);

$output = "poundcake-autogen.sql";
$converted = 0; # count the number of coordinate conversions

print "Using \"$input1\" for Site data\n";
print "Writing SQL to \"$output\"\n\n";

open(SITES,"< $input1");
open(OUTPUT,"> $output");

print OUTPUT "--\n";
print OUTPUT &UnixDate("today","-- This file auto-generated at %T on %b %e, %Y.");
print OUTPUT "\n--\n";

print OUTPUT <<TABLEDEF; # print everything up until TABLEDEF
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

TABLEDEF

print OUTPUT "\n\n\nLOCK TABLES \`sites\` WRITE\;\n\n";

$id = 1;
while ( <SITES> ) {
	chomp;
	$_ =~ s/\r\n$/\n/g; # cleanup any ^M end of line marks (if any)
	
	@fields = split /\t/;
	# TowerID
	# Name
	# Owner
	# Latitude
	# Longitude
	# Zone
		
	# Contact
	# Power
	# StructureType
	# Description
	# Mounting
	# Access
	# Storage
	# Accommodations
	# Notes
	$TowerID = $fields[0];
	$Name = $fields[1];
	$Owner = $fields[2];
	$Latitude = $fields[3];
	$Longitude = $fields[4];
	$Zone = $fields[5];
	
	$Contact = $fields[6];
	$Power = $fields[7];
	$StructureType = $fields[8];
	$Mounting = $fields[9];
	$Access = $fields[10];
	$Storage = $fields[11];
	$Accommodations = $fields[12];
	$Notes = $fields[13];
	
	print "Tower ID: $TowerID \n";
	
	$id++;
}

print OUTPUT "UNLOCK TABLES\;\n\n";




close SITES;
close OUTPUT;

print "Converted #$converted coordinates to decimal\n";