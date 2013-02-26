DROP TABLE IF EXISTS `project_memberships`;
CREATE TABLE `project_memberships` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `role_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

alter table users drop role_id;
alter table users add admin tinyint(1) after password;

-- take away all admin rights
update users set admin=0;
-- give admin rights to certain users
update users set admin=1 where id=1 or id=8 or id=11 or id=12 or id=30;
-- drop the permissions join table
drop table projects_users;

-- load new join table
insert into project_memberships(user_id,project_id,role_id) values (1,1,2);
insert into project_memberships(user_id,project_id,role_id) values (1,2,2);
insert into project_memberships(user_id,project_id,role_id) values (1,3,2);
insert into project_memberships(user_id,project_id,role_id) values (1,4,2);
insert into project_memberships(user_id,project_id,role_id) values (1,5,2);
insert into project_memberships(user_id,project_id,role_id) values (1,7,2);
insert into project_memberships(user_id,project_id,role_id) values (1,8,2);
insert into project_memberships(user_id,project_id,role_id) values (1,9,2);
insert into project_memberships(user_id,project_id,role_id) values (1,10,2);
insert into project_memberships(user_id,project_id,role_id) values (1,11,2);
insert into project_memberships(user_id,project_id,role_id) values (3,1,2);
insert into project_memberships(user_id,project_id,role_id) values (3,4,2);
insert into project_memberships(user_id,project_id,role_id) values (8,1,2);
insert into project_memberships(user_id,project_id,role_id) values (8,3,2);
insert into project_memberships(user_id,project_id,role_id) values (8,4,2);
insert into project_memberships(user_id,project_id,role_id) values (8,5,2);
insert into project_memberships(user_id,project_id,role_id) values (8,8,2);
insert into project_memberships(user_id,project_id,role_id) values (8,9,2);
insert into project_memberships(user_id,project_id,role_id) values (8,10,2);
insert into project_memberships(user_id,project_id,role_id) values (8,11,2);
insert into project_memberships(user_id,project_id,role_id) values (11,1,2);
insert into project_memberships(user_id,project_id,role_id) values (11,2,2);
insert into project_memberships(user_id,project_id,role_id) values (11,3,2);
insert into project_memberships(user_id,project_id,role_id) values (11,4,2);
insert into project_memberships(user_id,project_id,role_id) values (11,8,2);
insert into project_memberships(user_id,project_id,role_id) values (11,9,2);
insert into project_memberships(user_id,project_id,role_id) values (11,11,2);
insert into project_memberships(user_id,project_id,role_id) values (12,1,2);
insert into project_memberships(user_id,project_id,role_id) values (12,2,2);
insert into project_memberships(user_id,project_id,role_id) values (12,3,2);
insert into project_memberships(user_id,project_id,role_id) values (12,4,2);
insert into project_memberships(user_id,project_id,role_id) values (12,8,2);
insert into project_memberships(user_id,project_id,role_id) values (12,9,2);
insert into project_memberships(user_id,project_id,role_id) values (12,10,2);
insert into project_memberships(user_id,project_id,role_id) values (12,11,2);
insert into project_memberships(user_id,project_id,role_id) values (13,1,2);
insert into project_memberships(user_id,project_id,role_id) values (13,9,2);
insert into project_memberships(user_id,project_id,role_id) values (14,1,2);
insert into project_memberships(user_id,project_id,role_id) values (14,9,2);
insert into project_memberships(user_id,project_id,role_id) values (15,1,2);
insert into project_memberships(user_id,project_id,role_id) values (15,3,2);
insert into project_memberships(user_id,project_id,role_id) values (15,4,2);
insert into project_memberships(user_id,project_id,role_id) values (15,9,2);
insert into project_memberships(user_id,project_id,role_id) values (16,1,2);
insert into project_memberships(user_id,project_id,role_id) values (16,9,2);
insert into project_memberships(user_id,project_id,role_id) values (17,1,2);
insert into project_memberships(user_id,project_id,role_id) values (17,9,2);
insert into project_memberships(user_id,project_id,role_id) values (20,1,2);
insert into project_memberships(user_id,project_id,role_id) values (20,9,2);
insert into project_memberships(user_id,project_id,role_id) values (21,8,2);
insert into project_memberships(user_id,project_id,role_id) values (22,8,2);
insert into project_memberships(user_id,project_id,role_id) values (23,8,2);
insert into project_memberships(user_id,project_id,role_id) values (24,5,2);
insert into project_memberships(user_id,project_id,role_id) values (25,4,2);
insert into project_memberships(user_id,project_id,role_id) values (26,1,2);
insert into project_memberships(user_id,project_id,role_id) values (26,4,2);
insert into project_memberships(user_id,project_id,role_id) values (27,1,2);
insert into project_memberships(user_id,project_id,role_id) values (27,9,2);
insert into project_memberships(user_id,project_id,role_id) values (28,4,2);
insert into project_memberships(user_id,project_id,role_id) values (29,4,2);
insert into project_memberships(user_id,project_id,role_id) values (30,3,2);
insert into project_memberships(user_id,project_id,role_id) values (30,4,2);
insert into project_memberships(user_id,project_id,role_id) values (30,7,2);
insert into project_memberships(user_id,project_id,role_id) values (30,8,2);
insert into project_memberships(user_id,project_id,role_id) values (30,11,2);
insert into project_memberships(user_id,project_id,role_id) values (31,4,2);
insert into project_memberships(user_id,project_id,role_id) values (32,4,2);
insert into project_memberships(user_id,project_id,role_id) values (34,10,2);
insert into project_memberships(user_id,project_id,role_id) values (35,11,2);

-- Give these users edit permissions
update project_memberships set role_id=11 where
user_id=17 or
user_id=16 or
user_id=15 or
user_id=21 or
user_id=24 or
user_id=22 or
user_id=23 or
user_id=25;
