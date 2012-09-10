DROP PROCEDURE IF EXISTS sp_nearby;
-- Switch delimiter so the ; will work in the function body
DELIMITER ENDSPDEF
-- Create the procedure
-- GLength returns in degrees -- so multiply by 111.2 for Kms (69 for miles)
CREATE PROCEDURE sp_nearby(site_id int(10), max_sites int(10))
    BEGIN 
        SELECT id, site_code, site_name, CONCAT(site_code, " ", site_name) as site_vf,
        111.2*(GLength(LineStringFromWKB(LineString(location,(select location from sites where ID=site_id)))))
		AS distance,
		X(location) as lat,
		Y(location) as lon
		FROM sites
		WHERE location != '' -- IS NOT NULL -- locations may be null or empty, let's exclude those
		ORDER BY distance ASC		
		LIMIT 1, max_sites;  -- limit 1 here to exclude the site we're getting a distance from
    END ENDSPDEF
-- Switch the delimiter back to ;
DELIMITER ;