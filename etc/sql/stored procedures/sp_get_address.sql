-- this goes onto the addrpool db
DROP PROCEDURE IF EXISTS sp_get_address;
-- Switch delimiter so the ; will work in the function body
DELIMITER ENDSPDEF
-- Create the procedure
CREATE PROCEDURE sp_get_address(site_code varchar(255)  character set utf8) -- otherwise latin1
    BEGIN
    	-- IF (NULLIF(site_code,''))
    	-- THEN
        	SELECT base
        	FROM addrpool_subnet
        	WHERE name = site_code;
        -- END IF;
    END ENDSPDEF
-- Switch the delimiter back to ;
DELIMITER ;
