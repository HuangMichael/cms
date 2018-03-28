package com.subway.pavilionWorks;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


/**
 * 展馆作品查询接口
 *
 * @author huangbin
 * @generate by autoCode
 * @Date 2018-3-1
 */

public interface PavilionWorksRepository extends JpaRepository<PavilionWorks, Long> {

    /**
     * @param name   作品名称
     * @param status 作品状态
     * @return
     */
    List<PavilionWorks> findByNameContainingAndStatusAndAuthKeyStartingWith(String name, String status, String authKey);


    /**
     * @param name     作品名称
     * @param status   作品状态
     * @param pageable 分页
     * @return
     */
    Page<PavilionWorks> findByNameContainingAndStatusAndAuthKeyStartingWith(String name, String status, String authKey, Pageable pageable);
}
