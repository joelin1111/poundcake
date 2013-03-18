DROP TABLE IF EXISTS `ip_spaces`;

CREATE TABLE ip_spaces (
    id INTEGER(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    parent_id INTEGER(10) DEFAULT NULL,
    lft INTEGER(10) DEFAULT NULL,
    rght INTEGER(10) DEFAULT NULL,
    name VARCHAR(255) DEFAULT '',
    ip_address int unsigned default 0,
    cidr int,
    project_id INTEGER(10) DEFAULT NULL,
    PRIMARY KEY  (id)
);


DROP TABLE IF EXISTS `ip_addresses`;
CREATE TABLE ip_addresses (
    id INTEGER(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    ip_address int unsigned default 0,
    project_id INTEGER(10) NOT NULL,
    PRIMARY KEY  (id)
);