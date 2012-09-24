-- **************************************************************************************
-- This trigger looks for a radio that corresponds to the newly inserted radio, then
-- links them via the link_id field -- since a trigger cannot update rows in the same
-- table, the procedure sp_add_link_id is also called immediately after this -- that
-- links the other radio back to the new radio
-- Radios are named in the format XXXXX-YYYYY; a corresponding radio would be YYYYY-XXXXX
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

-- **************************************************************************************
-- This trigger updates the link_id for an updated radio, or clears it if there's
-- no match
-- **************************************************************************************

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
	ELSE
		SET NEW.link_id = NULL;
	END IF;
END $$
DELIMITER ;