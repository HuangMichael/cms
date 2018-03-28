package com.subway.tableColumnConfig;

import com.subway.controller.common.BaseController;
import com.subway.domain.app.MyPage;
import com.subway.service.app.ResourceService;
import com.subway.tableConfig.TableConfig;
import com.subway.tableConfig.TableConfigService;
import com.subway.utils.ConstantUtils;
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
 * 数据列配置控制器类
 *
 * @author huangbin
 * @generate by autoCode
 * @Date 2018-3-1
 */
@Controller
@EnableAutoConfiguration
@RequestMapping("/tableColumnConfig")
public class TableColumnConfigController extends BaseController {

    @Autowired
    ResourceService resourceService;
    @Autowired
    TableColumnConfigService tableColumnConfigService;
    @Autowired
    TableConfigService tableConfigService;

    @Autowired
    TableColumnConfigSearchService tableColumnConfigSearchService;


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
        return new PageUtils().searchBySortService(tableColumnConfigSearchService, searchPhrase, 1, current, rowCount, pageable);
    }


    /**
     * @param id
     * @return
     */
    @RequestMapping(value = "/findById/{id}", method = RequestMethod.GET)
    @ResponseBody
    public TableColumnConfig findById(@PathVariable("id") Long id) {
        return tableColumnConfigService.findById(id);
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
        List<TableColumnConfig> dataList = tableColumnConfigSearchService.findByConditions(param, 2);
        tableColumnConfigService.setDataList(dataList);
        tableColumnConfigService.exportExcel(request, response, docName, titles, colNames);
    }


    /**
     * @return
     */
    @RequestMapping(value = "/findByTable/{tableId}", method = RequestMethod.GET)
    @ResponseBody
    public List<TableColumnConfig> findByTable(@PathVariable("tableId") Long tableId) {
        TableConfig tableConfig = tableConfigService.findById(tableId);
        return tableColumnConfigService.findByTableConfigAndStatus(tableConfig, ConstantUtils.STATUS_YES);
    }


}
