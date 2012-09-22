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
	END IF;
END $$
DELIMITER ;

DROP TRIGGER IF EXISTS network_radio_update;
DELIMITER $$ 
CREATE TRIGGER network_radio_update
BEFORE UPDATE ON network_radios
FOR EACH ROW
BEGIN
	-- see notes in trigger network_radio_insert
	SELECT SUBSTRING(NEW.name,1,5) INTO @src;
	SELECT SUBSTRING(NEW.name,7,5) INTO @dest;
	SELECT CONCAT(@dest, '-', @src) INTO @dest_name;
	
	-- get the ID of the corresponding radio
	SELECT id INTO @dest_radio_id
	FROM network_radios
	WHERE name = @dest_name;
	-- link the two radios
	IF ( @dest_radio_id > 0 ) THEN
		SET NEW.link_id = @dest_radio_id;
	END IF;
END $$
DELIMITER ;