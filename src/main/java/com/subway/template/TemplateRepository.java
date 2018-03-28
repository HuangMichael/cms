package com.subway.template;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


/**
* 模板管理数据库访问接口
*
* @author huangbin
* @generate by autoCode
* @Date 2018-3-1
*/

public interface TemplateRepository extends JpaRepository<Template, Long> {


    /**
     * @param templateDesc
     * @param status
     * @return
     */
    List<Template> findByTemplateDescContainingAndStatus(String templateDesc, String status);



    /**
     * @param templateDesc
     * @param status
     * @return
     */
    Page<Template> findByTemplateDescContainingAndStatus(String templateDesc, String status, Pageable pageable);

}
