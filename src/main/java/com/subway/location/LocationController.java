package com.subway.location;

import com.subway.controller.common.BaseController;
import com.subway.domain.app.MyPage;
import com.subway.domain.user.User;
import com.subway.object.ReturnObject;
import com.subway.service.app.ResourceService;
import com.subway.utils.ConstantUtils;
import com.subway.utils.PageUtils;
import com.subway.utils.SessionUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * 位置信息
 *
 * @author huangbin
 * @generate by autoCode
 * @Date 2018-3-12
 */
@Controller
@EnableAutoConfiguration
@RequestMapping("/location")
@Slf4j
public class LocationController extends BaseController {

    private static Integer SEARCH_PARAM_SIZE = 3;

    @Autowired
    ResourceService resourceService;
    @Autowired
    LocationService locationService;
    @Autowired
    LocationSearchService locationSearchService;


    /**
     * @param request
     * @param current
     * @param rowCount
     * @param searchPhrase
     * @return
     */
    @RequestMapping(value = "/data", method = RequestMethod.POST)
    @ResponseBody
    public MyPage data(HttpServletRequest request, @RequestParam(value = "current", defaultValue = "0") int current, @RequestParam(value = "rowCount", defaultValue = "10") Long rowCount, @RequestParam(value = "searchPhrase", required = false) String searchPhrase) {
        Map<String, String[]> parameterMap = request.getParameterMap();
        Pageable pageable = new PageRequest(current - 1, rowCount.intValue(), super.getSort(parameterMap));
        return new PageUtils().searchBySortService(locationSearchService, searchPhrase, SEARCH_PARAM_SIZE, current, rowCount, pageable);
    }


    /**
     * @param id
     * @return
     */
    @RequestMapping(value = "/findById/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Location findById(@PathVariable("id") Long id) {
        return locationService.findById(id);
    }


    /**
     * @param location 位置信息
     * @return 保存位置信息
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public ReturnObject save(Location location) {
        location.setAuthKey("01");
        location.setLocLevel(1l);
        location.setStatus("1");
        System.out.println("location--------------" + location.toString());
        return locationService.save(location);
    }


    /**
     * @param id
     * @return
     */
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    @ResponseBody
    public ReturnObject delete(@PathVariable("id") Long id) {
        return locationService.delete(id);
    }


    /**
     * @param request
     * @param response
     * @param param
     * @param docName
     * @param titles
     * @param colNames
     */
    @ResponseBody
    @RequestMapping(value = "/exportExcel", method = RequestMethod.GET)
    public void exportExcel(HttpServletRequest request, HttpServletResponse response, @RequestParam("param") String param, @RequestParam("docName") String docName, @RequestParam("titles") String titles[], @RequestParam("colNames") String[] colNames) {
        List<Location> dataList = locationSearchService.findByConditions(param, SEARCH_PARAM_SIZE);
        locationService.setDataList(dataList);
        locationService.exportExcel(request, response, docName, titles, colNames);
    }


    /**
     * @param httpSession 当前会话
     * @return 查询的位置树节点集合
     */
    @RequestMapping(value = "/findTree")
    @ResponseBody
    public List<Object> findTree(HttpSession httpSession) {
        User user = SessionUtil.getCurrentUserBySession(httpSession);
        return locationService.findTree(user.getAuthKey());
    }


    /**
     * @return 查询我的位置
     */
    @RequestMapping(value = "/findMyLocations", method = RequestMethod.GET)
    @ResponseBody
    public List<Location> findMyLocations(HttpServletRequest request) {
//        User user = SessionUtil.getCurrentUserBySession(session);

        User user = SessionUtil.getCurrentUserBySession(request.getSession());
        return locationService.findByStatusAndAuthKeyStartingWith(ConstantUtils.STATUS_YES, user.getAuthKey());
    }

}
