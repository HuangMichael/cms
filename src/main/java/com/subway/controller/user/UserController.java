package com.subway.controller.user;


import com.subway.controller.common.BaseController;
import com.subway.dao.user.UserRepository;
import com.subway.domain.app.MyPage;
import com.subway.domain.user.User;
import com.subway.object.ReturnObject;
import com.subway.service.app.ResourceService;
import com.subway.service.commonData.CommonDataService;
import com.subway.service.user.UserSearchService;
import com.subway.service.user.UserService;
import com.subway.utils.*;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * Created by huangbin on 2015/12/23 0023.
 */
@Controller
@EnableAutoConfiguration
@RequestMapping("/user")
@Data
public class UserController extends BaseController {


    private static Integer SEARCH_PARAM_SIZE = 3;


    @Autowired
    UserRepository userRepository;

    @Autowired
    UserService userService;

    @Autowired
    UserSearchService userSearchService;


    @Autowired
    ResourceService resourceService;

    @Autowired
    CommonDataService commonDataService;


    /**
     * 分页查询
     *
     * @param request
     * @param current      当前页
     * @param rowCount     每页条数
     * @param searchPhrase 查询关键字
     * @return
     */
    @RequestMapping(value = "/data", method = RequestMethod.POST)
    @ResponseBody
    public MyPage data(HttpServletRequest request,
                       @RequestParam(value = "current", defaultValue = "0") int current,
                       @RequestParam(value = "rowCount", defaultValue = "10") Long rowCount,
                       @RequestParam(value = "searchPhrase", required = false) String searchPhrase) {
        Map<String, String[]> parameterMap = request.getParameterMap();
        Pageable pageable = new PageRequest(current - 1, rowCount.intValue(), super.getSort(parameterMap));
        return new PageUtils().searchBySortService(userSearchService, searchPhrase, SEARCH_PARAM_SIZE, current, rowCount, pageable);
    }


    @RequestMapping(value = "/personal")
    public String personal() {
        return "/user/personal";
    }


    @RequestMapping(value = "/create")
    public String create() {
        return "/user/create";
    }


    /**
     * 保存用户信息
     *
     * @param user 用户信息
     * @return
     */
    @RequestMapping(value = "/save", method = {RequestMethod.POST})
    @ResponseBody
    public ReturnObject save(User user) {
        return userService.save(user);
    }


    /**
     * @param session  当前会话
     * @param modelMap 显示个人信息
     * @return
     */
    @RequestMapping(value = "/profile")
    public String profile(HttpSession session, ModelMap modelMap) {
        User user = SessionUtil.getCurrentUserBySession(session);
        modelMap.put("user", user);
        return "/user/profile";
    }


    /**
     * @param id 用户id
     * @return 根据用户id查询
     */
    @RequestMapping(value = "/findById/{id}", method = RequestMethod.GET)
    @ResponseBody
    public User findById(@PathVariable("id") Long id) {
        return userService.findById(id);
    }


    /**
     * @return 修改密码
     */
    @RequestMapping(value = "/changePwd", method = RequestMethod.POST)
    @ResponseBody
    public ReturnObject changePwd(@RequestParam("userName") String userName, @RequestParam("newPwd") String newPwd) {
        ReturnObject returnObject = new ReturnObject();
        boolean result = userService.changePwd(userName, newPwd);
        returnObject.setResult(result);
        if (returnObject.getResult()) {
            returnObject.setResultDesc("用户密码修改成功!");
        } else {
            returnObject.setResultDesc("用户密码修改失败!");
        }
        return returnObject;
    }


    /**
     * 检查用户密码合法性
     */
    @RequestMapping(value = "/checkPwd", method = RequestMethod.POST)
    @ResponseBody
    public ReturnObject checkPwd(@RequestParam("userName") String userName, @RequestParam("oldPwd") String oldPwd) {
        ReturnObject returnObject = new ReturnObject();
        oldPwd = MD5Util.md5(oldPwd);
        User user = userService.findByUserNameAndPasswordAndStatus(userName, oldPwd, CommonStatusType.STATUS_YES);
        if (user != null) {
            returnObject.setResult(true);
            returnObject.setResultDesc("用户密码验证通过!");
        } else {
            returnObject.setResult(false);
            returnObject.setResultDesc("用户密码验证失败!");
        }
        return returnObject;

    }


    /**
     * @param request  请求
     * @param response 响应
     * @param param    查询关键字
     * @param docName  文档名称
     * @param titles   标题集合
     * @param colNames 列名称
     */
    @ResponseBody
    @RequestMapping(value = "/exportExcel", method = RequestMethod.GET)
    public void exportExcel(HttpServletRequest request, HttpServletResponse response, @RequestParam("param") String param, @RequestParam("docName") String docName, @RequestParam("titles") String titles[], @RequestParam("colNames") String[] colNames) {
        List<User> dataList = userSearchService.findByConditions(param, SEARCH_PARAM_SIZE);
        userService.setDataList(dataList);
        userService.exportExcel(request, response, docName, titles, colNames);
    }


    /**
     * @param id
     * @return 删除信息
     */
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    @ResponseBody
    public ReturnObject delete(@PathVariable("id") Long id) {
        return userService.delete(id);
    }


    /**
     * @param file       多媒体文件
     * @param mainObject
     * @param recordId
     * @return 上传多媒体文件 返回信息
     * @throws Exception
     */
    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    @ResponseBody
    public ReturnObject upload(@RequestParam("file") MultipartFile file, @RequestParam("mainObject") String mainObject, @RequestParam("recordId") Long recordId) throws Exception {
        Boolean result = userService.upload(file, mainObject, recordId);
        return getCommonDataService().getReturnType(result, "文件上传成功", "文件上传失败");
    }


    /**
     * @return 查询用户管理的用户
     */
    @RequestMapping(value = "/findAllByAuthKey", method = RequestMethod.GET)
    @ResponseBody
    public List<User> findAllByAuthKey(HttpSession session) {
        User user = SessionUtil.getCurrentUserBySession(session);
        return userService.findAllByAuthKey(ConstantUtils.STATUS_YES, user.getAuthKey());
    }


    /**
     * 取消用户数据授权信息
     */
    @RequestMapping(value = "/removeLoc", method = {RequestMethod.POST})
    @ResponseBody
    public ReturnObject removeLoc(@RequestParam("userId") Long userId) {
        return userService.removeLoc(userId);
    }

}
