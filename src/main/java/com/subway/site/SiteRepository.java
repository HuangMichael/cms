package com.subway.site;


import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


/**
 * 站点管理数据库访问接口
 *
 * @author huangbin
 * @generate by autoCode
 * @Date 2018-3-1
 */

public interface SiteRepository extends JpaRepository<Site, Long> {


    /**
     * @param name 根据名称查询
     * @return
     */
    List<Site> findByNameContaining(String name);


    /**
     * @param name     根据名称查询
     * @param pageable
     * @return
     */
    Page<Site> findByNameContaining(String name, Pageable pageable);


}
