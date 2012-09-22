-- **************************************************************************************
-- 
-- **************************************************************************************

DROP TRIGGER IF EXISTS network_radio_insert;
DELIMITER $$ 
CREATE TRIGGER network_radio_insert
BEFORE INSERT ON network_radios
FOR EACH ROW
BEGIN

	-- the user just entered a radio name "BAYCT-BELDR"
	-- grab "BAYCT" into @src
	SELECT SUBSTRING(NEW.name,1,5) INTO @src;
	
	-- now grab "BELDR" into @dest
	SELECT SUBSTRING(NEW.name,7,5) INTO @dest;
	
	-- now make @dest_name "BELDR-BAYCT"
	SELECT CONCAT(@dest, '-', @src) INTO @dest_name;
	
	-- get the ID of the corresponding radio
	SELECT id INTO @dest_radio_id
	FROM network_radios
	WHERE name = @dest_name;
	
	-- link the two radios
	IF ( @dest_radio_id > 0 ) THEN
		SET NEW.link_id = @dest_radio_id;
		
		-- UPDATE network_radios
		-- SET link_id = NEW.id
		-- WHERE id = @dest_radio_id;
		-- CALL sp_link_back(@dest_radio_id, NEW.id);
		-- INSERT INTO network_radios( link_id )
		-- VALUES ( @dest_radio_id );	
	END IF;
	
END $$
DELIMITER ;