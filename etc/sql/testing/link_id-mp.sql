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
	-- Radios are named XXXXX-YYYYY however there can be
	-- a different number of characters on each, e.g.
	-- XXXX-YYYYY
	-- YY-XXXXX
	-- Etc.
	
	-- Because network_radios.id is an auto-increment field, we can't get it as we would
	-- normally, e.g. NEW.id
	-- so we have to query MySQL for what the next auto-increment is then save that back
	DECLARE next_id INT;
	SET next_id = (SELECT AUTO_INCREMENT FROM information_schema.TABLES WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='network_radios');
	SET NEW.id=next_id;
	
	-- Parse the names
	-- returns everything to the right of the '-'
	SELECT SUBSTRING_INDEX(NEW.name,'-',-1) INTO @dest;
	-- returns everything to the left of the '-'
	SELECT SUBSTRING_INDEX(NEW.name,'-',+1) INTO @src;
	-- now swap them to find the opposite radio name as per our naming convention
	SELECT CONCAT(@dest, '-', @src) INTO @dest_name;
	
	-- INSERT INTO temp(src) VALUES(@src);
	-- INSERT INTO temp(src) VALUES(@dest);
	
	-- We have a ONE-to-ONE link
	IF ( @dest NOT LIKE '%_P2MP%' ) THEN
	
		-- get the ID of the corresponding radio
		SELECT id INTO @dest_radio_id
		FROM network_radios
		-- WHERE name = @dest_name;
		WHERE ( name = @dest_name ) OR ( name = CONCAT(@dest,'_P2MP%') );
	
		-- link the two radios in the join table
		IF ( @dest_radio_id > 0 ) THEN
		
			-- note this inserts two rows
			INSERT INTO radios_radios
			VALUES (NEW.id, @dest_radio_id,'one'),
			(@dest_radio_id, NEW.id,'two');
		
		END IF;
	ELSE
		INSERT INTO temp(src) VALUES(@dest);
		
		INSERT INTO radios_radios
		SELECT NEW.id, id, 'three'
		FROM network_radios
		-- WHERE name LIKE CONCAT('%-',@src);
		-- WHERE name LIKE CONCAT(@dest,'%_P2MP%');
		WHERE name LIKE @dest;
		
		INSERT INTO radios_radios
		SELECT id, NEW.id, 'four'
		FROM network_radios
		-- WHERE name LIKE CONCAT('%-',@src);
		-- WHERE name LIKE CONCAT(@dest,'%_P2MP%');
		WHERE name LIKE @dest;
		
		-- INSERT INTO temp(src) VALUES(CONCAT(@dest));
		
	END IF;
	
	SET NEW.id = null;
	SET @dest_radio_id = null;
	
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
	SELECT SUBSTRING_INDEX(NEW.name,'-',-1) INTO @dest;
	SELECT SUBSTRING_INDEX(NEW.name,'-',+1) INTO @src;
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