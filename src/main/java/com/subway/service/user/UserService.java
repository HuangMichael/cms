package com.subway.service.user;

import com.subway.dao.user.UserRepository;
import com.subway.domain.user.User;
import com.subway.object.ReturnObject;
import com.subway.service.app.BaseService;
import com.subway.service.commonData.CommonDataService;
import com.subway.utils.CommonStatusType;
import com.subway.utils.ConstantUtils;
import com.subway.utils.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by huangbin  on 2016/4/14.
 */

@Service
@CacheConfig
public class UserService extends BaseService {

    @Autowired
    UserRepository userRepository;


    @Autowired
    CommonDataService commonDataService;

    /**
     * 根据状态查询用户
     */
    @Cacheable(key = "'userList'", value = "userList")
    public List<User> findByStatus(String status) {
        return userRepository.findByStatus(status);
    }


    /**
     * 根据状态查询用户
     */
    public User findById(Long id) {
        return userRepository.findById(id);
    }


    /**
     * @param user
     * @return 保存用户信息
     */
    public ReturnObject save(User user) {
        user = userRepository.save(user);
        return commonDataService.getReturnType(user != null, ConstantUtils.SAVE_SUCCESS, ConstantUtils.SAVE_FAILURE);
    }


    /**
     * @param userName 用户名
     * @param password 密码密文
     * @param status   用户状态
     * @return
     */
    public ReturnObject findByUserNameAndPasswordAndStatus(HttpServletRequest request, String userName, String password, String status) {
        User userFound = userRepository.findByUserName(userName);
        String failMessage = "";
        Boolean result = false;
        User user;
        if (userFound == null) {
            failMessage = "用户名不存在，请联系管理员!";
        } else {
            user = userFound;
            if (user.getPassword() == null || user.getStatus() == null) {
                failMessage = "用户密码或状态为空,请重新输入";
            } else if (user.getPassword() != null && !user.getPassword().equals(password)) {
                failMessage = "用户密码有误,请重新输入";
            } else if (user.getStatus() != null && !user.getStatus().equals(status)) {
                failMessage = "用户信息为锁定状态,请联系管理员!";
            } else {
                result = true;
                //将用户人员信息放入session.
                HttpSession session = request.getSession();
                session.setAttribute("currentUser", user);
            }
        }
        return commonDataService.getReturnType(result, "用户登录成功", failMessage);
    }


    /**
     * @param userName
     * @param password
     * @param status
     * @return
     */
    public User findByUserNameAndPasswordAndStatus(String userName, String password, String status) {
        return userRepository.findByUserNameAndPasswordAndStatus(userName, password, status);
    }


    /**
     * 修改用户密码
     */
    public boolean changePwd(String userName, String password) {
        List<User> userList = userRepository.findByUserNameAndStatus(userName, CommonStatusType.STATUS_YES);
        if (!userList.isEmpty()) {
            User user = userList.get(0);
            user.setPassword(MD5Util.md5(password));
            user = userRepository.save(user);
            return user != null;
        } else {
            return false;
        }
    }


    /**
     * @param id id
     * @return 根据id删除对象
     */
    public ReturnObject delete(Long id) {
        userRepository.delete(id);
        User user = userRepository.getOne(id);
        return commonDataService.getReturnType(user == null, "记录删除成功", "记录删除失败");
    }


    /**
     * @param recordId 记录id
     * @param filePath 文件的路径
     */
    public void writeUploadLog(String filePath, Long recordId) {
        super.writeUploadLog(filePath, recordId);
        User user = userRepository.getOne(recordId);
        user.setPhotoUrl(filePath);
        userRepository.save(user);
    }


    /**
     * @param status  状态
     * @param authKey 授权码
     * @return 根据状态和授权查询用户
     */
    @Cacheable(key = "'myUsers'", value = "myUsers")
    public List<User> findAllByAuthKey(String status, String authKey) {
        return userRepository.findByStatusAndAuthKeyStartingWith(status, authKey);
    }


    /**
     * @param locationId
     * @return 查询在当前位置的用户信息
     */
    public List<User> findUsersInLocation(Long locationId) {
        return userRepository.findUsersInLocation(locationId);
    }


    /**
     * @param userId 用户id
     * @return 移除用户数据授权
     */
    public ReturnObject removeLoc(Long userId) {
        User user = userRepository.findById(userId);
        if (user != null) {
            user.setLocation(null);
            user = userRepository.save(user);
        }
        return commonDataService.getReturnType(user.getLocation() == null, "数据取消授权成功", "数据取消授权失败");
    }

}
