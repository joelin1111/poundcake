DROP PROCEDURE IF EXISTS sp_get_remote_links;
DELIMITER ENDSPDEF
-- return the IDs of any radios attached to this radio
-- if this is a multipoint link, there may be many radios attached to it
CREATE PROCEDURE sp_get_remote_links(radio_id int(10))
    BEGIN 
    	SELECT dest_radio_id, network_radios.name
		FROM radios_radios, network_radios
		WHERE src_radio_id = radio_id
		AND network_radios.id = dest_radio_id;
    END ENDSPDEF
-- Switch the delimiter back to ;
DELIMITER ;