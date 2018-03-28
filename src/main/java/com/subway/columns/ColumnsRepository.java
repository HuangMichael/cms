package com.subway.columns;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


/**
 * 栏目信息数据库访问接口
 *
 * @author huangbin
 * @generate by autoCode
 * @Date 2018-3-1
 */

public interface ColumnsRepository extends JpaRepository<Columns, Long> {

    /**
     * @param name
     * @param status
     * @param authKey
     * @return
     */
    List<Columns> findByNameContainingAndStatusAndAuthKeyStartingWith(String name, String status, String authKey);


    /**
     * @param name
     * @param status
     * @param authKey
     * @param pageable
     * @return
     */
    Page<Columns> findByNameContainingAndStatusAndAuthKeyStartingWith(String name, String status, String authKey, Pageable pageable);


}
