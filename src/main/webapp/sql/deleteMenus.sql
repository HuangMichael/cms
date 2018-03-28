set sql_safe_updates =false;


DELETE FROM t_role_resource 
WHERE
    resource_id IN (SELECT 
        id
    FROM
        lzdt.t_resource
    
    WHERE
        resource_name IN ('保存记录' , '编辑记录', '删除记录'));



DELETE FROM t_resource 
WHERE
  
    
    
   
        resource_name IN ('保存记录' , '编辑记录', '删除记录')