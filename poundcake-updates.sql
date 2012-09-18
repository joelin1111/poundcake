-- To be run on waldorf
alter table sites engine=INNODB;
alter table network_radios engine=INNODB;
alter table antenna_types add column network_radio_id int(10);