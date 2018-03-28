insert into lzdt.t_eq_class select 
    id,
    description AS name,
    level AS class_level,
    has_child,
    limit_hours,
    parent_id,
    sort_no,
    status
FROM
    dev.t_equipments_classification