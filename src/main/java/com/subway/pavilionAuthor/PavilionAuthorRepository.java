package com.subway.pavilionAuthor;

import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;


/**
 * 展馆作者信息数据库访问接口
 *
 * @author huangbin
 * @generate by autoCode
 * @Date 2018-3-1
 */

public interface PavilionAuthorRepository extends JpaRepository<PavilionAuthor, Long> {


    /**
     * @param name
     * @param status
     * @return
     */
    List<PavilionAuthor> findByNameContainingAndStatus(String name, String status);


    /**
     * @param name
     * @param status
     * @param pageable
     * @return
     */
    Page<PavilionAuthor> findByNameContainingAndStatus(String name, String status, Pageable pageable);


}
