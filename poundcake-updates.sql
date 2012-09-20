-- Old

DROP TABLE IF EXISTS `build_items`;
CREATE TABLE `build_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `quantity` int(10),
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

insert into build_items(quantity,name) values (100,'RJ45, Indoor');
insert into build_items(quantity,name) values (100,'RJ45, Shielded, Toughconnector');
insert into build_items(quantity,name) values (25,'Ring Connectors');
insert into build_items(quantity,name) values (50,'Fork Connectors');



DROP TABLE IF EXISTS `install_teams`;
CREATE TABLE `install_teams` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

insert into install_teams(id,name) values (1,'Not Assigned');
insert into install_teams(id,name) values (2,'Red Team');
insert into install_teams(id,name) values (3,'Blue Team');
insert into install_teams(id,name) values (4,'Green Team');

alter table sites add install_team_id int(10) after tower_guard;

alter table contacts add install_team_id int(10) after tower_owner_id;

-- TO-DO:  Add a default install_team_id of 1 to sites table using PHPMyAdmin

insert into tower_owners('name') values ('N/A');



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

DROP TABLE IF EXISTS `change_logs`;
CREATE TABLE `change_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `version` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;