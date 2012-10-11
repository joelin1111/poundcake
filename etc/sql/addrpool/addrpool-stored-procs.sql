-- this goes onto the addrpool db
DROP FUNCTION IF EXISTS sp_get_ip_address;
-- Switch delimiter so the ; will work in the function body
DELIMITER ENDSPDEF
-- Create the procedure
CREATE FUNCTION sp_get_ip_address(site_code varchar(255)) RETURNS char(15)
    BEGIN
    	-- SELECT base
		-- FROM addrpool_subnet
		-- WHERE  ( slash = 32 AND name = site_code );
		SELECT base INTO @base
		FROM addrpool_subnet
		WHERE  ( slash = 32 AND name = site_code );
		RETURN @base;
    END ENDSPDEF
-- Switch the delimiter back to ;
DELIMITER ;



-- this goes onto the addrpool db
DROP PROCEDURE IF EXISTS sp_get_all_ip_addresses;
-- Switch delimiter so the ; will work in the function body
DELIMITER ENDSPDEF
-- Create the procedure
CREATE PROCEDURE sp_get_all_ip_addresses(site_code varchar(255)  character set utf8) -- otherwise latin1
    BEGIN
    	SELECT base, name, slash
		FROM addrpool_subnet
		WHERE  ( slash = 32 AND name LIKE site_code )
		ORDER BY name;
    END ENDSPDEF
-- Switch the delimiter back to ;
DELIMITER ;
