-- this goes onto the addrpool db
DROP PROCEDURE IF EXISTS sp_get_address;
-- Switch delimiter so the ; will work in the function body
DELIMITER ENDSPDEF
-- Create the procedure
CREATE PROCEDURE sp_get_address(site_code varchar(255)  character set utf8) -- otherwise latin1
    BEGIN
    	SELECT base, name, slash
		FROM addrpool_subnet
		WHERE  ( slash = 32 AND name LIKE site_code )
		ORDER BY name;
    END ENDSPDEF
-- Switch the delimiter back to ;
DELIMITER ;



-- SELECT base, name, slash
-- FROM addrpool_subnet
-- WHERE  ( slash = 32 AND name LIKE 'BCARE%')
-- ORDER BY name;