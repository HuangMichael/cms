set sql_safe_updates = false;


UPDATE t_equipment e
        JOIN
    t_location l ON e.location_id = l.id 
SET 
    e.auth_key = l.loc_code;