package com.subway.member;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


/**
 * 会员信息表数据库访问接口
 *
 * @author huangbin
 * @generate by autoCode
 * @Date 2018-3-1
 */

public interface MemberRepository extends JpaRepository<Member, Long> {


    /**
     * @param name
     * @param status
     * @param authKey
     * @return
     */
    List<Member> findByNameContainingAndStatusAndAuthKeyStartingWith(String name, String status, String authKey);


    /**
     * @param name
     * @param status
     * @param authKey
     * @return
     */
    Page<Member> findByNameContainingAndStatusAndAuthKeyStartingWith(String name, String status, String authKey, Pageable pageable);
}
