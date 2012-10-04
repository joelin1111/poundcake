USE addrpool;
BEGIN
DECLARE addr char(15);

SELECT ip AS sp_get_ip_address('BAYCT-120');

SELECT SPLIT_STR(ip, '.', 1) as first;

SELECT first AS "First";
END