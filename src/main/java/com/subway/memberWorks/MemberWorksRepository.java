package com.subway.memberWorks;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


/**
 * 会员作品
 *
 * @author huangbin
 * @generate by autoCode
 * @Date 2018-3-1
 */

public interface MemberWorksRepository extends JpaRepository<MemberWorks, Long> {


    /**
     * @param name   名称
     * @param status 状态
     * @param authKey
     * @return 根据名称模糊查询  根据状态过滤
     */
    List<MemberWorks> findByNameContainingAndStatusAndAuthKeyStartingWith(String name, String status,String authKey);


    /**
     * @param name     名称
     * @param status   状态
     * @param authKey
     * @param pageable 分页
     * @return 根据名称模糊查询  根据状态过滤
     */
    Page<MemberWorks> findByNameContainingAndStatusAndAuthKeyStartingWith(String name, String status,String authKey, Pageable pageable);


}
