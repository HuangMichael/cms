package com.subway.controller.dev;


import com.subway.controller.common.BaseController;
import com.subway.domain.app.MyPage;
import com.subway.domain.dev.App;
import com.subway.object.ReturnObject;
import com.subway.service.commonData.CommonDataService;
import com.subway.service.dev.AppSearchService;
import com.subway.service.dev.AppService;
import com.subway.utils.PageUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;


/**
 * 应用控制器类
 */
@Controller
@EnableAutoConfiguration
@RequestMapping("/app")
@Slf4j
public class AppController extends BaseController {
    @Autowired
    AppService appService;

    @Autowired
    AppSearchService appSearchService;

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
    public MyPage data(HttpServletRequest request, @RequestParam(value = "current", defaultValue = "0") int current, @RequestParam(value = "rowCount", defaultValue = "10") Long rowCount, @RequestParam(value = "searchPhrase", required = false) String searchPhrase) {
        Map<String, String[]> parameterMap = request.getParameterMap();
        Pageable pageable = new PageRequest(current - 1, rowCount.intValue(), super.getSort(parameterMap));
        return new PageUtils().searchBySortService(appSearchService, searchPhrase, 2, current, rowCount, pageable);
    }


    /**
     * @param id
     * @return
     */
    @RequestMapping(value = "/findById/{id}", method = RequestMethod.GET)
    @ResponseBody
    public App findById(@PathVariable("id") Long id) {
        return appService.findById(id);
    }








    /**
     * @return
     */
    @RequestMapping(value = "/findAll", method = RequestMethod.GET)
    @ResponseBody
    public List<App> findAll() {
        return appService.findAll();
    }


    /**
     * @param app
     * @return 保存应用信息
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public ReturnObject save(App app) {
        return appService.save(app);
    }


    /**
     * @param appId
     * @return
     */
    @RequestMapping(value = "/autoCode", method = RequestMethod.POST)
    @ResponseBody
    public ReturnObject autoCode(@RequestParam("appId") Long appId) {
        //根据应用选择的应用配置信息
        boolean result = appService.autoCode(appId);
        return commonDataService.getReturnType(result, "应用生成成功", "应用生成失败");
    }


}
