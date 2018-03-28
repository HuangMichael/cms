package com.subway.pavilionWorks;

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
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

/**
 * չ����Ʒ��Ϣ
 *
 * @author huangbin
 * @generate by autoCode
 * @Date 2018-3-1
 */
@Controller
@EnableAutoConfiguration
@RequestMapping("/pavilionWorks")
public class PavilionWorksController extends BaseController {

    private static final Integer SEARCH_PARAM_SIZE = 2;

    @Autowired
    ResourceService resourceService;
    @Autowired
    PavilionWorksService pavilionWorksService;
    @Autowired
    PavilionWorksSearchService pavilionWorksSearchService;


    @RequestMapping(value = "/data", method = RequestMethod.POST)
    @ResponseBody
    public MyPage data(HttpServletRequest request, @RequestParam(value = "current", defaultValue = "0") int current, @RequestParam(value = "rowCount", defaultValue = "10") Long rowCount, @RequestParam(value = "searchPhrase", required = false) String searchPhrase) {
        Map<String, String[]> parameterMap = request.getParameterMap();
        Pageable pageable = new PageRequest(current - 1, rowCount.intValue(), super.getSort(parameterMap));
        return new PageUtils().searchBySortService(pavilionWorksSearchService, searchPhrase, SEARCH_PARAM_SIZE, current, rowCount, pageable);
    }


    @RequestMapping(value = "/findById/{id}", method = RequestMethod.GET)
    @ResponseBody
    public PavilionWorks findById(@PathVariable("id") Long id) {
        return pavilionWorksService.findById(id);
    }


    /**
     * @param id 记录id
     * @return 根据id 删除记录
     */
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    @ResponseBody
    public ReturnObject delete(@PathVariable("id") Long id) {
        return pavilionWorksService.delete(id);
    }


    @ResponseBody
    @RequestMapping(value = "/exportExcel", method = RequestMethod.GET)
    public void exportExcel(HttpServletRequest request, HttpServletResponse response, @RequestParam("param") String param, @RequestParam("docName") String docName, @RequestParam("titles") String titles[], @RequestParam("colNames") String[] colNames) {
        List<PavilionWorks> dataList = pavilionWorksSearchService.findByConditions(param, SEARCH_PARAM_SIZE);
        pavilionWorksService.setDataList(dataList);
        pavilionWorksService.exportExcel(request, response, docName, titles, colNames);
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
        Boolean result = pavilionWorksService.upload(file, mainObject, recordId);
        return getCommonDataService().getReturnType(result, "文件上传成功", "文件上传失败");
    }


    /**
     * @param pavilionWorks
     * @return 保存栏目信息
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public ReturnObject save(PavilionWorks pavilionWorks) {
        return pavilionWorksService.save(pavilionWorks);
    }


}
