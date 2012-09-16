DROP TABLE IF EXISTS `antenna_types`;
CREATE TABLE `antenna_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

insert into antenna_types(name) values ('16 dBi AirMax Sector');
insert into antenna_types(name) values ('30 dBi RocketDish');
insert into antenna_types(name) values ('34 dBi RocketDish');
insert into antenna_types(name) values ('17 dBi AirMax Sector');