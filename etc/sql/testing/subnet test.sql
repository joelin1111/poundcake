
  
-- this goes onto the addrpool db
DROP PROCEDURE IF EXISTS sp_test;
-- Switch delimiter so the ; will work in the function body
DELIMITER ENDSPDEF
-- Create the procedure
CREATE PROCEDURE sp_test(site_code varchar(255))
BEGIN
	DECLARE addr char(15);
	DECLARE dest,src,ip char(15);
	DECLARE oct1, oct2, oct3, oct4 char(15);
	DECLARE base1, slash1 char(15);

	-- test data
	-- roughly yes.  So if you are looking for the gateway for BOUTL-OBLEO, you need to find a /32 IP in the same IP 				
	-- range as BOUTL-OBLEO that has the name BOUTL
	-- if you are looking for the gateway for OBLEO-BOUTL, you need to find a /32 IP in the same IP range as OBLEO boutl with the name OBELO
	
	 -- returns everything to the right of the '-'
	SELECT SUBSTRING_INDEX(site_code,'-',-1) INTO dest;
	-- returns everything to the left of the '-'
	SELECT SUBSTRING_INDEX(site_code,'-',+1) INTO src;
	
	SET ip = sp_get_ip_address(site_code);
	
	SELECT SUBSTRING_INDEX(SUBSTRING_INDEX(ip, '.', 1), ".", -1) INTO oct1;
	SELECT SUBSTRING_INDEX(SUBSTRING_INDEX(ip, '.', 2), ".", -1) INTO oct2;
	SELECT SUBSTRING_INDEX(SUBSTRING_INDEX(ip, '.', 3), ".", -1) INTO oct3;
	SELECT SUBSTRING_INDEX(SUBSTRING_INDEX(ip, '.', 4), ".", -1) INTO oct4;
	
	-- SELECT CONCAT(oct1,'.',oct2,'.',oct3,'.0');
	
	SELECT base, slash
	INTO base1, slash1
	FROM addrpool_subnet
	WHERE base = CONCAT(oct1,'.',oct2,'.',oct3,'.0')
	AND name = src;
	
	-- SELECT base1;
	-- SELECT slash1;
	
	SELECT SUBSTRING_INDEX(SUBSTRING_INDEX(base1, '.', 1), ".", -1) INTO oct1;
	SELECT SUBSTRING_INDEX(SUBSTRING_INDEX(base1, '.', 2), ".", -1) INTO oct2;
	SELECT SUBSTRING_INDEX(SUBSTRING_INDEX(base1, '.', 3), ".", -1) INTO oct3;
	SELECT SUBSTRING_INDEX(SUBSTRING_INDEX(base1, '.', 4), ".", -1) INTO oct4;
	
	-- SELECT oct1;
	-- SELECT oct2;
	-- SELECT oct3;
	-- SELECT oct4;
	-- SELECT slash1;
	-- SELECT src;
	SELECT CONCAT(oct1,'.',oct2,'.',oct3,'.',oct4,'/',slash1,' - ',src);
	CALL sp_cidr_to_ip_range(oct1, oct2, oct3, oct4, slash1, src);
	
END ENDSPDEF
-- Switch the delimiter back to ;
DELIMITER ;

-- http://social.msdn.microsoft.com/Forums/en-US/transactsql/thread/cc810f02-a12c-4c4f-afda-3ba5950da69f/
-- this goes onto the addrpool db
DROP PROCEDURE IF EXISTS sp_cidr_to_ip_range;
-- DROP FUNCTION IF EXISTS sp_cidr_to_ip_range;
-- Switch delimiter so the ; will work in the function body
DELIMITER ENDSPDEF
-- Create the procedure
CREATE PROCEDURE sp_cidr_to_ip_range(q1 INT, q2 INT, q3 INT, q4 INT, bitmask INT, src char(15))
-- CREATE FUNCTION sp_cidr_to_ip_range(q1 INT, q2 INT, q3 INT, q4 INT, bitmask INT, src char(15)) RETURNS char(15)
BEGIN
	DECLARE hosts, c int;
	DECLARE ret char(15);
	
	SELECT CONCAT(q1,'.',q2,'.',q3,'.',q4);
	SELECT bitmask;
	SELECT src;
	
	SET hosts = POWER(2,(32 - bitmask));
	SET c = 1;
	
	WHILE c < hosts DO
		IF q4 < 255 THEN
			SET q4 = q4 + 1;
		ELSE
		IF q3 < 255 THEN
			BEGIN
    			SET q4 = 0;
        		SET q3 = q3 + 1;
			END;
		ELSE
		IF q2 < 255 THEN
			BEGIN
    			SET q4 = 0;
    			SET q3 = 0;
   				SET q2 = q2 + 1;
			END;
		END IF; -- q2
		END IF; -- q3
		END IF; -- q4
		
		SET ret = NULL;
		
		-- SELECT CONCAT(q1,'.',q2,'.',q3,'.',q4);
		SELECT base
		INTO ret
		FROM addrpool_subnet
		WHERE base = CONCAT(q1,'.',q2,'.',q3,'.',q4)
		AND slash = 32
		AND name = src;
		
		IF ret IS NOT NULL THEN
			SELECT ret;
		END IF;
		
		SET c = c + 1; 
				
	END WHILE;
	
	
	
END ENDSPDEF
-- Switch the delimiter back to ;
DELIMITER ;