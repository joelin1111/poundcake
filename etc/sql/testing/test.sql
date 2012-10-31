

-- delete from network_radios;
-- delete from radios_radios;

-- insert into network_radios(name) values ('FOO-BAR');
-- insert into network_radios(name) values ('BAR-FOO');

-- insert into network_radios(name) values ('AA-BB'); -- id 1
-- insert into network_radios(name) values ('BB-MP'); -- id 2
-- insert into network_radios(name) values ('CC-BB'); -- id 3
-- insert into network_radios(name) values ('DD-EE'); -- id 4
-- insert into network_radios(name) values ('EE-DD'); -- id 5

-- Link #1:
-- HILARE-MP1
-- PSOND-HILARE-MP1

-- Link #2:
-- HILARE-MP1
-- LIANC-HILARE-MP1

-- Link #3:
-- HILARE-MP1
-- PRIVA-HILARE-MP1

-- Link #4:
-- HILARE-STMRC
-- STMRC-HILARE

-- Link #5:
-- HILARE-OBLEO
-- OBLEO-HILARE

truncate table network_radios;
truncate table radios_radios;
truncate table temp;
insert into network_radios(name) values ('HILARE_P2MP');
insert into network_radios(name) values ('PSOND-HILARE_P2MP');
insert into network_radios(name) values ('HILARE-STMRC');
insert into network_radios(name) values ('STMRC-HILARE');
insert into network_radios(name) values ('PRIVA-HILARE_P2MP');

select id,name from network_radios;
select * from radios_radios;
select * from temp;

-- insert into network_radios(name) values ('PRIVA-HILARE-MP1');

-- insert into network_radios(name) values ('HILARE-OBLEO');
-- insert into network_radios(name) values ('OBLEO-HILARE');

-- insert into network_radios(name) values ('LIANC-HILARE-MP1');
