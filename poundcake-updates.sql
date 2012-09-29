alter table network_radios add link_distance DECIMAL(5,2);

DROP TABLE IF EXISTS `projects`;
CREATE TABLE `projects` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `user_to_projects`;
CREATE TABLE `user_to_projects` (
  `user_id` int(10) not null,
  `project_id` int(10) not null,
  PRIMARY KEY (`user_id`,`project_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

insert into projects('name') values ('Haiti (HRBN)');
insert into projects('name') values ('Mfangano Island (OHR)');

-- Old


alter table sites add declination decimal(17,14) after lon;
alter table network_radios drop link_distance;
alter table network_radios drop true_azimuth;
alter table network_radios drop mag_azimuth;
update network_radios set ssid='';
alter table sites drop road_type_id;
alter table sites add tower_type_id int(10) after tower_owner_id;
alter table sites add tower_member_id int(10) after tower_type_id;
alter table sites add tower_equipment_id int(10) after tower_member_id;
alter table sites add tower_mount_id int(10) after tower_equipment_id;

DROP TABLE IF EXISTS `tower_equipment`;
CREATE TABLE `tower_equipment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tower_members`;
CREATE TABLE `tower_members` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tower_mounts`;
CREATE TABLE `tower_mounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tower_types`;
CREATE TABLE `tower_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

insert into tower_equipment(name) values ('Freestanding');
insert into tower_equipment(name) values ('Guyed');

insert into tower_members(name) values ('L-Bar');
insert into tower_members(name) values ('Round Bar');

insert into tower_mounts(name) values ('Existing Standoffs');
insert into tower_mounts(name) values ('Beam Clamps');

insert into tower_types(name) values ('Space Cabinet');
insert into tower_types(name) values ('Equipment Room');


-- alter table network_switches drop num_ports;
-- alter table network_switches add num_ports int(10) default '8';
alter table network_radios add switch_port int(10);
alter table sites drop column connectivity_type_id;
alter table network_radios add network_switch_id int(10) after site_id;

DROP TABLE IF EXISTS `switch_types`;
CREATE TABLE `switch_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ports` int(10) default '8',
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

insert into switch_types(ports,name) values (8,'8-Port Switch');
insert into switch_types(ports,name) values (16,'16-Port Switch');
insert into switch_types(ports,name) values (24,'24-Port Switch');

alter table network_switches add switch_type_id int(10) default '1' after name;

alter table network_radios add link_id int(10);

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