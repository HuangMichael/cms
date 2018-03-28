package com.subway.appSearch;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


/**
* 应用查询配置表数据库访问接口
*
* @author huangbin
* @generate by autoCode
* @Date 2018-3-1
*/

public interface AppSearchRepository extends JpaRepository<AppSearch, Long> {


    /**
     * @param searchDesc
     * @param status
     * @return
     */
    List<AppSearch> findBySearchDescContainingAndStatus(String searchDesc,String status);



    /**
     * @param searchDesc
     * @param status
     * @param pageable
     * @return
     */
    Page<AppSearch> findBySearchDescContainingAndStatus(String searchDesc, String status, Pageable pageable);
}
