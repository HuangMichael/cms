package com.subway.aop;


import com.subway.domain.log.UserLog;
import com.subway.domain.user.User;
import com.subway.domain.userLog.UserLogService;
import com.subway.object.ReturnObject;
import com.subway.service.user.UserService;
import com.subway.utils.ConstantUtils;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * 用户日志aop
 */
@Component
@Aspect
@Slf4j
public class UserLoginAop {
    @Autowired
    UserLogService userLogService;

    @Autowired
    UserService userService;

    /**
     * @param joinPoint   结合点
     * @param loginResult 登录结果
     */
    @AfterReturning(value = "execution(* com.subway.controller.app.LoginController.login(..))", returning = "loginResult")
    public void doAfterReturningAdvice(JoinPoint joinPoint, Object loginResult) {
        String userName = (String) joinPoint.getArgs()[1];
        log.info("userName------------" + userName);
        ReturnObject returnObject = (ReturnObject) loginResult;
        boolean result = returnObject.getResult();
        Object[] args = joinPoint.getArgs();
        HttpServletRequest request = (HttpServletRequest) args[0];
        String ip = request.getRemoteHost();
        UserLog userLog = new UserLog();
        userLog.setUserName(userName);
        userLog.setLoginIp(ip);
        userLog.setOperation("登录");
        userLog.setOperationTime(new Date());
        userLog.setStatus(result ? "登录成功" : "登录失败");
        userLogService.createUserLog(userLog);
    }

    /**
     * @param joinPoint
     */
    @Before(value = "execution(* com.subway.controller.user.UserController.save(..))")
    public void writeAuthKeyBeforeSaveUser(JoinPoint joinPoint) {
        Object[] args = joinPoint.getArgs();
        User user = (User) args[0];
        log.info(args[0].getClass().getName());
        if (user.getPassword() == null || user.getPassword().equals("")) {
            user.setPassword("e10adc3949ba59abbe56e057f20f883e");
        }
        user.setAuthKey("01");
        user.setStatus(ConstantUtils.STATUS_YES);
        log.info("set authKey before save");
    }


}
