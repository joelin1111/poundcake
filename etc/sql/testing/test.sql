truncate table network_radios;
truncate table radios_radios;
truncate table temp;

-- delete from network_radios;
-- delete from radios_radios;

-- insert into network_radios(name) values ('FOO-BAR');
-- insert into network_radios(name) values ('BAR-FOO');

-- insert into network_radios(name) values ('AA-BB'); -- id 1
-- insert into network_radios(name) values ('BB-MP'); -- id 2
-- insert into network_radios(name) values ('CC-BB'); -- id 3
-- insert into network_radios(name) values ('DD-EE'); -- id 4
-- insert into network_radios(name) values ('EE-DD'); -- id 5

insert into network_radios(name) values ('HDC263-SDH010');
insert into network_radios(name) values ('HDC264-SDH010');
insert into network_radios(name) values ('HDC280-SDH010');
insert into network_radios(name) values ('SDH010-MP1');
insert into network_radios(name) values ('AA-SDH010');
insert into network_radios(name) values ('BB-SDH010');

select id,name from network_radios;
select * from radios_radios;
-- select * from temp;

-- 1, 2
-- 2, 1
-- 2, 3