DROP TABLE IF EXISTS `build_items_projects`;
CREATE TABLE `build_items_projects` (
  `build_item_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) NOT NULL,
  PRIMARY KEY (`build_item_id`,`project_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- make all existing build items for HRBN, which has a project id of 1
INSERT INTO build_items_projects (build_item_id,project_id)
  SELECT build_items.id,1 FROM build_items;