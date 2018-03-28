package com.subway.cangwei;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


/**
* 仓位信息表数据库访问接口
*
* @author huangbin
* @generate by autoCode
* @Date 2018-3-1
*/

public interface CangweiRepository extends JpaRepository<Cangwei, Long> {


    /**
     * @param name
     * @param status
     * @return
     */
    List<Cangwei> findByNameContainingAndStatus(String name, String status);



    /**
     * @param name
     * @param status
     * @param pageable
     * @return
     */
    Page<Cangwei> findByNameContainingAndStatus(String name, String status, Pageable pageable);



}
