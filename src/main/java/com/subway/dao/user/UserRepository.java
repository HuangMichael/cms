package com.subway.dao.user;


import com.subway.domain.user.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

/**
 * Created by huangbin on 2016/1/8 0008.
 */
public interface UserRepository extends JpaRepository<User, Long> {
    /**
     * 查询所有菜单
     */
    List<User> findAll();

    /**
     * 根据状态查询所有菜单
     */
    List<User> findByStatus(String status);


    /**
     * @param userName 根据用户名查询
     * @return
     */
    User findByUserName(String userName);

    /**
     * 根据id查询
     */
    User findById(long id);

    /**
     * 根据用户名和密码查询用户
     */
    User findByUserNameAndPasswordAndStatus(String userName, String password, String status);


    User save(User user);

    /**
     * @param userName 用户名
     * @param status   用户状态
     * @return
     */
    List<User> findByUserNameAndStatus(String userName, String status);

    /**
     * 查询不在当前角色中的用户信息
     */
    @Query(nativeQuery = true, value = "SELECT  u.id,u.user_name FROM t_user u WHERE u.id NOT IN (SELECT ur.user_id FROM  t_role_user ur  WHERE ur.role_id = :roleId) AND u.status = 1")
    List<Object> findUsersNotInRole(@Param("roleId") Long roleId);


    /**
     * 查询不在当前位置中的用户信息
     */
    @Query("SELECT  u FROM User u WHERE u.location.id <> :locationId AND u.status = 1")
    List<User> findUsersNotInLocation(@Param("locationId") Long locationId);


    /**
     * 查询在当前位置中的用户信息
     */
    @Query("SELECT  u FROM User u WHERE u.location.id = :locationId AND u.status = 1")
    List<User> findUsersInLocation(@Param("locationId") Long locationId);


    /**
     * @param userName
     * @param personName
     * @param status
     * @param authKey
     * @return
     */
    List<User> findByUserNameContainingAndPersonNameContainingAndStatusAndAuthKeyContaining(String userName, String personName, String status, String authKey);


    /**
     * @param userName
     * @param personName
     * @param status
     * @param pageable
     * @return
     */
    Page<User> findByUserNameContainingAndPersonNameContainingAndStatusAndAuthKeyContaining(String userName, String personName, String status, String authKey, Pageable pageable);


    /**
     * @param status  状态
     * @param authKey 授权码
     * @return 根据状态和授权码查询用户信息
     */
    List<User> findByStatusAndAuthKeyStartingWith(String status, String authKey);
}
