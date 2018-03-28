package com.subway.tableConfig;

import com.subway.controller.common.BaseController;
import com.subway.domain.app.MyPage;
import com.subway.object.ReturnObject;
import com.subway.service.app.ResourceService;
import com.subway.utils.PageUtils;
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
 * 数据库配置查询业务类
 *
 * @author huangbin
 * @generate by autoCode
 * @Date 2018-3-1
 */
@Controller
@EnableAutoConfiguration
@RequestMapping("/tableConfig")
public class TableConfigController extends BaseController {

    @Autowired
    ResourceService resourceService;
    @Autowired
    TableConfigService tableConfigService;
    @Autowired
    TableConfigSearchService tableConfigSearchService;


    /**
     * @param session
     * @param request
     * @param current
     * @param rowCount
     * @param searchPhrase
     * @return
     */
    @RequestMapping(value = "/data", method = RequestMethod.POST)
    @ResponseBody
    public MyPage data(HttpSession session, HttpServletRequest request, @RequestParam(value = "current", defaultValue = "0") int current, @RequestParam(value = "rowCount", defaultValue = "10") Long rowCount, @RequestParam(value = "searchPhrase", required = false) String searchPhrase) {
        Map<String, String[]> parameterMap = request.getParameterMap();
        Pageable pageable = new PageRequest(current - 1, rowCount.intValue(), super.getSort(parameterMap));
        return new PageUtils().searchBySortService(tableConfigSearchService, searchPhrase, 2, current, rowCount, pageable);
    }


    /**
     * @param id
     * @return
     */
    @RequestMapping(value = "/findById/{id}", method = RequestMethod.GET)
    @ResponseBody
    public TableConfig findById(@PathVariable("id") Long id) {
        return tableConfigService.findById(id);
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
        List<TableConfig> dataList = tableConfigSearchService.findByConditions(param, 2);
        tableConfigService.setDataList(dataList);
        tableConfigService.exportExcel(request, response, docName, titles, colNames);
    }


    /**
     * @param id
     * @return
     */
    @RequestMapping(value = "/formatConfig/{id}", method = RequestMethod.GET)
    @ResponseBody
    public ReturnObject formatConfig(@PathVariable("id") Long id) {
        return tableConfigService.formatConfig(id);
    }


    /**
     * @param tableConfig 表配置信息
     * @return
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public ReturnObject save(TableConfig tableConfig) {
        return tableConfigService.save(tableConfig);
    }




    /**
     * @return
     */
    @RequestMapping(value = "findAll", method = RequestMethod.GET)
    @ResponseBody
    public List<TableConfig> findAll() {
        return tableConfigService.findAll();
    }





}
