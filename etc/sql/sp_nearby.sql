DROP PROCEDURE IF EXISTS sp_nearby;
-- Switch delimiter so the ; will work in the function body
DELIMITER ENDSPDEF
-- Create the procedure
-- GLength returns in degrees -- so multiply by 111.2 for Kms (69 for miles)
CREATE PROCEDURE sp_nearby(school_id int(10), max_schools int(10))
    BEGIN 
        SELECT id, school_code, school_name, CONCAT(school_code, " ", school_name) as school_vf,
        111.2*(GLength(LineStringFromWKB(LineString(location,(select location from schools where ID=school_id)))))
		AS distance,
		X(location) as lat,
		Y(location) as lon
		FROM schools
		WHERE location != '' -- IS NOT NULL -- locations may be null or empty, let's exclude those
		ORDER BY distance ASC		
		LIMIT 1, max_schools;  -- limit 1 here to exclude the school we're getting a distance from
    END ENDSPDEF
-- Switch the delimiter back to ;
DELIMITER ;