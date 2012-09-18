-- To be run on waldorf
alter table sites engine=INNODB;
alter table network_radios engine=INNODB;
alter table network_radios add column antenna_type_id int(10);

DROP TABLE IF EXISTS `radio_types`;
CREATE TABLE `radio_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

insert into radio_types(name) values ('RocketM5');
insert into radio_types(name) values ('NanoBridgeM5');
insert into radio_types(name) values ('NanoStationM5');
insert into radio_types(name) values ('NanoStationM2');
insert into radio_types(name) values ('NanoBridgeM2');
insert into radio_types(name) values ('RocketM2');
insert into radio_types(name) values ('RocketM5 Titanium');
insert into radio_types(name) values ('RocketM2 Titanium');

alter table network_radios add radio_type_id int(10) after site_id;

alter table network_radios add link_distance int(10);
alter table network_radios add true_azimuth int(10);
alter table network_radios add mag_azimuth int(10);
alter table network_radios add elevation SMALLINT;
alter table network_radios add frequency int(10);
alter table network_radios add ssid varchar(255);

DROP TABLE IF EXISTS `change_log`;
CREATE TABLE `change_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `version` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;