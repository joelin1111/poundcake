alter table radio_types drop watts;
alter table switch_types drop watts;
alter table router_types drop watts;

alter table radio_types add watts decimal(5,2);
alter table switch_types add watts decimal(5,2);
alter table router_types add watts decimal(5,2);

update radio_types set watts=6.5;
update switch_types set watts=5.0;
update router_types set watts=6.0;

select watts from radio_types;
select watts from switch_types;
select watts from router_types;