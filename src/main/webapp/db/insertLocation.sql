insert into t_location
SELECT 
    id,
    l.location AS loc_code,
    l.description loc_name,
    l.description loc_desc,
    l.loc_level loc_level,
    l.location_type loc_type,
    parent AS parent_id,
    status,
    '01' AS auth_key
FROM
    dev.t_locations l