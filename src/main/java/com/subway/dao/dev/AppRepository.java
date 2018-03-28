package com.subway.dao.dev;


import com.subway.domain.dev.App;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.util.List;

/**
 * Created by huangbin on 2016/1/8 0008.
 */
public interface AppRepository extends CrudRepository<App, Long>, PagingAndSortingRepository<App, Long> {
    /**
     * 查询所有菜单
     */
    List<App> findAll();

    /**
     * 根据状态查询所有菜单
     */
    List<App> findByStatus(String status);


    /**
     * 根据id查询会员信息
     */
    App findById(Long id);


    /**
     * @param name 会员名称
     * @return 根据会员名称模糊查询
     */
    List<App> findByNameContaining(String name);



    /**
     * @param name 会员名称
     * @return 根据会员名称模糊查询
     */
    Page<App> findByNameContaining(String name, Pageable pageable);

}
