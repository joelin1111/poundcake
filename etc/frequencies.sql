alter table radio_types add radio_band_id int(10);
update radio_types set radio_band_id=2;

DROP TABLE IF EXISTS `radio_bands`;
CREATE TABLE `radio_bands` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

insert into radio_bands(id,name) values (1,"2.4 GHz");
insert into radio_bands(id,name) values (2,"5 GHz");


DROP TABLE IF EXISTS `frequencies`;
CREATE TABLE `frequencies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `frequency` int(10) NOT NULL,
  `radio_band_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

insert into frequencies(name,frequency,radio_band_id) values ("Channel 1",2412,1);
insert into frequencies(name,frequency,radio_band_id) values ("Channel 2",2417,1);
insert into frequencies(name,frequency,radio_band_id) values ("Channel 3",2422,1);
insert into frequencies(name,frequency,radio_band_id) values ("Channel 4",2427,1);
insert into frequencies(name,frequency,radio_band_id) values ("Channel 5",2432,1);
insert into frequencies(name,frequency,radio_band_id) values ("Channel 6",2437,1);
insert into frequencies(name,frequency,radio_band_id) values ("Channel 7",2442,1);
insert into frequencies(name,frequency,radio_band_id) values ("Channel 8",2447,1);
insert into frequencies(name,frequency,radio_band_id) values ("Channel 9",2452,1);
insert into frequencies(name,frequency,radio_band_id) values ("Channel 10",2457,1);
insert into frequencies(name,frequency,radio_band_id) values ("Channel 11",2462,1);
insert into frequencies(name,frequency,radio_band_id) values ("Channel 12",2467,1);
insert into frequencies(name,frequency,radio_band_id) values ("Channel 13",2472,1);
insert into frequencies(name,frequency,radio_band_id) values ("Channel 14",2484,1);

insert into frequencies(name,frequency,radio_band_id) values ("Channel 183",4915,2);
insert into frequencies(name,frequency,radio_band_id) values ("Channel 184",4920,2);
insert into frequencies(name,frequency,radio_band_id) values ("Channel 185",4925,2);
insert into frequencies(name,frequency,radio_band_id) values ("Channel 187",4935,2);
insert into frequencies(name,frequency,radio_band_id) values ("Channel 188",4940,2);
insert into frequencies(name,frequency,radio_band_id) values ("Channel 189",4945,2);
insert into frequencies(name,frequency,radio_band_id) values ("Channel 192",4960,2);
insert into frequencies(name,frequency,radio_band_id) values ("Channel 196",4980,2);
insert into frequencies(name,frequency,radio_band_id) values ("Channel 7",5035,2);
insert into frequencies(name,frequency,radio_band_id) values ("Channel 8",5040,2);
insert into frequencies(name,frequency,radio_band_id) values ("Channel 9",5045,2);
insert into frequencies(name,frequency,radio_band_id) values ("Channel 11",5055,2);
insert into frequencies(name,frequency,radio_band_id) values ("Channel 12",5060,2);
insert into frequencies(name,frequency,radio_band_id) values ("Channel 16",5080,2);
insert into frequencies(name,frequency,radio_band_id) values ("Channel 34",5170,2);
insert into frequencies(name,frequency,radio_band_id) values ("Channel 36",5180,2);
insert into frequencies(name,frequency,radio_band_id) values ("Channel 38",5190,2);
insert into frequencies(name,frequency,radio_band_id) values ("Channel 40",5200,2);
insert into frequencies(name,frequency,radio_band_id) values ("Channel 42",5210,2);
insert into frequencies(name,frequency,radio_band_id) values ("Channel 44",5220,2);
insert into frequencies(name,frequency,radio_band_id) values ("Channel 46",5230,2);
insert into frequencies(name,frequency,radio_band_id) values ("Channel 48",5240,2);
insert into frequencies(name,frequency,radio_band_id) values ("Channel 52",5260,2);
insert into frequencies(name,frequency,radio_band_id) values ("Channel 56",5280,2);
insert into frequencies(name,frequency,radio_band_id) values ("Channel 60",5300,2);
insert into frequencies(name,frequency,radio_band_id) values ("Channel 64",5320,2);
insert into frequencies(name,frequency,radio_band_id) values ("Channel 100",5500,2);
insert into frequencies(name,frequency,radio_band_id) values ("Channel 104",5520,2);
insert into frequencies(name,frequency,radio_band_id) values ("Channel 108",5540,2);
insert into frequencies(name,frequency,radio_band_id) values ("Channel 112",5560,2);
insert into frequencies(name,frequency,radio_band_id) values ("Channel 116",5580,2);
insert into frequencies(name,frequency,radio_band_id) values ("Channel 120",5600,2);
insert into frequencies(name,frequency,radio_band_id) values ("Channel 124",5620,2);
insert into frequencies(name,frequency,radio_band_id) values ("Channel 128",5640,2);
insert into frequencies(name,frequency,radio_band_id) values ("Channel 132",5660,2);
insert into frequencies(name,frequency,radio_band_id) values ("Channel 136",5680,2);
insert into frequencies(name,frequency,radio_band_id) values ("Channel 140",5700,2);
insert into frequencies(name,frequency,radio_band_id) values ("Channel 149",5745,2);
insert into frequencies(name,frequency,radio_band_id) values ("Channel 153",5765,2);
insert into frequencies(name,frequency,radio_band_id) values ("Channel 157",5785,2);
insert into frequencies(name,frequency,radio_band_id) values ("Channel 161",5805,2);
insert into frequencies(name,frequency,radio_band_id) values ("Channel 165",5825,2);