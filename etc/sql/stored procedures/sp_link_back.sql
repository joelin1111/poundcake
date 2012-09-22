DROP PROCEDURE IF EXISTS sp_link_back;
-- Switch delimiter so the ; will work in the function body
DELIMITER ENDSPDEF
-- Create the procedure
-- GLength returns in degrees -- so multiply by 111.2 for Kms (69 for miles)
CREATE PROCEDURE sp_link_back(src int(10), dest int(10))
    BEGIN 
        UPDATE network_radios
        SET link_id = src
        WHERE id = dest;
    END ENDSPDEF
-- Switch the delimiter back to ;
DELIMITER ;