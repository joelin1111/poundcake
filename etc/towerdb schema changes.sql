DROP TABLE IF EXISTS `monitoring_system_types`;
CREATE TABLE `monitoring_system_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

insert into monitoring_system_types(name) values ('Nagios');
insert into monitoring_system_types(name) values ('Cacti');
insert into monitoring_system_types(name) values ('OpenNMS');
insert into monitoring_system_types(name) values ('Zabbix');

alter table projects add monitoring_system_type_id int(10);

alter table projects add monitoring_system_username varchar(255);
alter table projects add monitoring_system_password varchar(255);
alter table projects add monitoring_system_url varchar(255);



alter table network_radios add foreign_id varchar(255);
alter table network_routers add foreign_id varchar(255);
alter table network_switches add foreign_id varchar(255);

alter table network_radios add column ip_address INT(4);