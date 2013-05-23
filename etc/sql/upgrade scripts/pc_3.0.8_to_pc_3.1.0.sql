-- alter table radio_types drop watts;
-- alter table switch_types drop watts;
-- alter table router_types drop watts;

alter table radio_types add watts decimal(5,2);
alter table switch_types add watts decimal(5,2);
alter table router_types add watts decimal(5,2);
update radio_types set watts=6.5;
update switch_types set watts=5.0;
update router_types set watts=6.0;

DROP TABLE IF EXISTS `network_interfaces`;
CREATE TABLE `network_interfaces` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

insert into network_interfaces(name) values ('eth');
insert into network_interfaces(name) values ('ath');
insert into network_interfaces(name) values ('wifi');
insert into network_interfaces(name) values ('br');
insert into network_interfaces(name) values ('vlan');
insert into network_interfaces(name) values ('lo');

DROP TABLE IF EXISTS `network_interfaces_switch_types`;
CREATE TABLE `network_interfaces_switch_types` (
  `switch_type_id` int(10) NOT NULL,
  `network_interface_id` int(10) NOT NULL,
  PRIMARY KEY (`switch_type_id`,`network_interface_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `network_interfaces_radio_types`;
CREATE TABLE `network_interfaces_radio_types` (
  `radio_type_id` int(10) NOT NULL,
  `network_interface_id` int(10) NOT NULL,
  PRIMARY KEY (`radio_type_id`,`network_interface_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `network_interfaces_router_types`;
CREATE TABLE `network_interfaces_router_types` (
  `router_type_id` int(10) NOT NULL,
  `network_interface_id` int(10) NOT NULL,
  PRIMARY KEY (`router_type_id`,`network_interface_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;