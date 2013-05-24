-- alter table radio_types drop watts;
-- alter table switch_types drop watts;
-- alter table router_types drop watts;

alter table radio_types add watts decimal(5,2);
alter table switch_types add watts decimal(5,2);
alter table router_types add watts decimal(5,2);
update radio_types set watts=8.5;
update switch_types set watts=15.0 where name like '8-Port%';
update switch_types set watts=16.0 where name like '16-Port%';
update switch_types set watts=17.0 where name like '24-Port%';
update router_types set watts=6.0 where name like '%RB750G%';
update router_types set watts=12.0 where name like '%1100%';


DROP TABLE IF EXISTS `network_interface_types`;
CREATE TABLE `network_interface_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

insert into network_interface_types(name) values ('eth');
insert into network_interface_types(name) values ('ath');
insert into network_interface_types(name) values ('wifi');
insert into network_interface_types(name) values ('br');
insert into network_interface_types(name) values ('vlan');
insert into network_interface_types(name) values ('lo');


-- TESTING

DROP TABLE IF EXISTS `network_interface_type_switch_types`;
CREATE TABLE `network_interface_type_switch_types` (
  `network_interface_type_id` int(10) NOT NULL,
  `switch_type_id` int(10) NOT NULL,
  `number` int(10),
  PRIMARY KEY (`network_interface_type_id`,`switch_type_id`,`number`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
