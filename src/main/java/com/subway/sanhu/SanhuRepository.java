package com.subway.sanhu;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


/**
 * 散户信息表数据库访问接口
 *
 * @author huangbin
 * @generate by autoCode
 * @Date 2018-3-1
 */

public interface SanhuRepository extends JpaRepository<Sanhu, Long> {


    /**
     * @param name
     * @param status
     * @return
     */
    List<Sanhu> findByNameContainingAndStatus(String name, String status);



    /**
     * @param name
     * @param status
     * @param pageable
     * @return
     */
    Page<Sanhu> findByNameContainingAndStatus(String name, String status, Pageable pageable);


}
