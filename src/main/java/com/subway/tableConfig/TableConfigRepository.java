package com.subway.tableConfig;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


/**
 * 数据库表配置数据接口
 *
 * @author huangbin
 * @generate by autoCode
 * @Date 2018-3-1
 */

public interface TableConfigRepository extends JpaRepository<TableConfig, Long> {


    /**
     * @param tableName
     * @param status
     * @return
     */
    List<TableConfig> findByTableNameContainingAndStatus(String tableName, String status);


    /**
     * @param tableName
     * @param status
     * @return
     */
    Page<TableConfig> findByTableNameContainingAndStatus(String tableName, String status, Pageable pageable);
}
