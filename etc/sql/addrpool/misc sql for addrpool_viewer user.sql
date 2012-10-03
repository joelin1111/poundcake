mysql -uaddrpool_viewer -h200.113.226.67 -pu886u65J5C4VZQb addrpool
mysql --ssl -uaddrpool-viewer -h200.113.226.67 -pu886u65J5C4VZQb addrpool


mysql -uaddrpool-viewer -h200.113.226.67 -paddrpool-viewer addrpool
mysql --ssl -uaddrpool-viewer -h200.113.226.67 -paddrpool-viewer addrpool

DROP USER 'addrpool_viewer'@'50.112.241.133';
CREATE USER addrpool_viewer@'50.112.241.133' IDENTIFIED BY 'u886u65J5C4VZQb';

GRANT SELECT ON addrpool.addrpool_subnet TO addrpool_viewer@'50.112.241.133';   REQUIRE SSL;

GRANT EXECUTE ON PROCEDURE addrpool.sp_get_all_ip_addresses TO addrpool_viewer@'50.112.241.133';
GRANT EXECUTE ON FUNCTION `addrpool`.`sp_get_ip_address` TO 'addrpool_viewer'@'50.112.241.133'



REQUIRE SSL;
FlUSH PRIVILEGES;
