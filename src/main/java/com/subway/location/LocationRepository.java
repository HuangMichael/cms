package com.subway.location;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;


/**
 * 位置名称数据接口类
 *
 * @author huangbin
 * @generate by autoCode
 * @Date 2018-3-12
 */

public interface LocationRepository extends JpaRepository<Location, Long> {


    /**
     * @param locName 位置名称
     * @param status  状态
     * @param authKey 授权码
     * @return
     */
    List<Location> findByLocNameContainingAndStatusAndAuthKeyStartingWith(String locName, String status, String authKey);


    /**
     * @param locName  位置名称
     * @param status   状态
     * @param authKey  授权码
     * @param pageable 分页
     * @return
     */
    Page<Location> findByLocNameContainingAndStatusAndAuthKeyStartingWith(String locName, String status, String authKey, Pageable pageable);


    /**
     * @param authKey 根据授权码查询授权结构
     * @return
     */
    @Query("SELECT  l.id,l.locCode, l.locDesc, '', l.parentId FROM Location l where l.locCode like :authKey ")
    List<Object> findTree(@Param("authKey") String authKey);


    /**
     * @param status
     * @param authKey
     * @return
     */
    List<Location> findByStatusAndAuthKeyStartingWith(String status, String authKey);

}
