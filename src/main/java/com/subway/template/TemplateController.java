package com.subway.template;

import com.subway.controller.common.BaseController;
import com.subway.domain.app.MyPage;
import com.subway.object.ReturnObject;
import com.subway.service.app.ResourceService;
import com.subway.service.dev.AppService;
import com.subway.site.Site;
import com.subway.utils.PageUtils;
import freemarker.template.TemplateException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * 模板管理控制器类
 *
 * @author huangbin
 * @generate by autoCode
 * @Date 2018-3-1
 */
@Controller
@EnableAutoConfiguration
@RequestMapping("/template")
public class TemplateController extends BaseController {

    @Autowired
    ResourceService resourceService;
    @Autowired
    TemplateService templateService;
    @Autowired
    TemplateSearchService templateSearchService;


    @Autowired
    AppService appService;


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
        return new PageUtils().searchBySortService(templateSearchService, searchPhrase, 2, current, rowCount, pageable);
    }


    /**
     * @param id
     * @return
     */
    @RequestMapping(value = "/findById/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Template findById(@PathVariable("id") Long id) {
        return templateService.findById(id);
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
        List<Template> dataList = templateSearchService.findByConditions(param, 2);
        templateService.setDataList(dataList);
        templateService.exportExcel(request, response, docName, titles, colNames);
    }


    /**
     * @param id
     * @return 删除信息
     */
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    @ResponseBody
    public ReturnObject delete(@PathVariable("id") Long id) {
        return templateService.delete(id);
    }


    /**
     * @param template
     * @return 保存模板信息
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public ReturnObject save(Template template) {
        return templateService.save(template);
    }


    /**
     * @param templateId
     * @return
     * @throws IOException
     * @throws TemplateException
     */
    @RequestMapping(value = "/genPage", method = RequestMethod.POST)
    @ResponseBody
    public ReturnObject genPage(@RequestParam("templateId") Long templateId) throws IOException, TemplateException {
        //根据应用选择的应用配置信息
        Boolean result = templateService.genPage(templateService.findById(templateId));
        return commonDataService.getReturnType(result, "应用生成成功", "应用生成失败");
    }


}
