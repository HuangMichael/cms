package com.subway.role;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


/**
 * 角色信息数据库访问接口
 *
 * @author huangbin
 * @generate by autoCode
 * @Date 2018-3-1
 */


/**
 * Created by huangbin on 2016/1/8 0008.
 */
interface RoleRepository extends JpaRepository<Role, Long> {


    /**
     * @param status
     * @return
     */
    List<Role> findByStatus(String status);


    /**
     * @param roleName
     * @param roleDesc
     * @return
     */
    List<Role> findByRoleNameContainingAndRoleDescContainingAndStatus(String roleName, String roleDesc, String status);

    /**
     * @param roleName
     * @param roleDesc
     * @param pageable
     * @return
     */
    Page<Role> findByRoleNameContainingAndRoleDescContainingAndStatus(String roleName, String roleDesc, String status, Pageable pageable);


}
