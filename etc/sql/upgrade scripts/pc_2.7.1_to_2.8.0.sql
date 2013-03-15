alter table network_radios add p2mp tinyint(1) default 0 after ssid;
alter table network_radios add tmp tinyint(1) default 0; -- temporary column

DROP TRIGGER IF EXISTS tr_network_radio_insert;
DROP TRIGGER IF EXISTS tr_network_radio_update;
DROP TRIGGER IF EXISTS tr_network_radio_delete;
truncate table radios_radios;

update network_radios set ssid='CBRIT_MP1' where id=198; -- missing SSID
update network_radios set p2mp=1,sector=0 where id=198;

update network_radios set p2mp=1,sector=0 where id=263;
update network_radios set p2mp=1,sector=0 where id=264;

source /Users/clarkritchie/Desktop/poundcake/etc/sql/poundcake/tr_multipoint-links-SSID-key.sql

update network_radios set tmp=1; -- cause the trigger to fire
alter table network_radios drop tmp; -- remove our column

-- select id,name,p2mp from network_radios where name like '%_MP%';
select id,name,p2mp,sector,ssid from network_radios
where id = 198 or id = 263 or id = 264;