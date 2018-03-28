package com.subway.pavilionAuthor;

import com.subway.controller.common.BaseController;
import com.subway.domain.app.MyPage;
import com.subway.memberWorks.MemberWorks;
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
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * 展馆作者信息
 *
 * @author huangbin
 * @generate by autoCode
 * @Date 2018-3-1
 */
@Controller
@EnableAutoConfiguration
@RequestMapping("/pavilionAuthor")
public class PavilionAuthorController extends BaseController {

    @Autowired
    ResourceService resourceService;
    @Autowired
    PavilionAuthorService pavilionAuthorService;
    @Autowired
    PavilionAuthorSearchService pavilionAuthorSearchService;


    @RequestMapping(value = "/data", method = RequestMethod.POST)
    @ResponseBody
    public MyPage data(HttpSession session, HttpServletRequest request, @RequestParam(value = "current", defaultValue = "0") int current, @RequestParam(value = "rowCount", defaultValue = "10") Long rowCount, @RequestParam(value = "searchPhrase", required = false) String searchPhrase) {
        Map
                <String, String[]> parameterMap = request.getParameterMap();
        Pageable pageable = new PageRequest(current - 1, rowCount.intValue(), super.getSort(parameterMap));
        return new PageUtils().searchBySortService(pavilionAuthorSearchService, searchPhrase, 1, current, rowCount, pageable);
    }


    /**
     * @param id
     * @return
     */
    @RequestMapping(value = "/findById/{id}", method = RequestMethod.GET)
    @ResponseBody
    public PavilionAuthor findById(@PathVariable("id") Long id) {
        return pavilionAuthorService.findById(id);
    }



    /**
     * @param id 记录id
     * @return 根据id 删除记录
     */
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    @ResponseBody
    public ReturnObject delete(@PathVariable("id") Long id) {
        return pavilionAuthorService.delete(id);
    }





    /**
     * @param pavilionAuthor 信息
     * @return 保存展馆作者信息
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public ReturnObject save(PavilionAuthor pavilionAuthor) {
        return pavilionAuthorService.save(pavilionAuthor);
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
        List<PavilionAuthor> dataList = pavilionAuthorSearchService.findByConditions(param, 2);
        pavilionAuthorService.setDataList(dataList);
        pavilionAuthorService.exportExcel(request, response, docName, titles, colNames);
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
        Boolean result = pavilionAuthorService.upload(file, mainObject, recordId);
        return getCommonDataService().getReturnType(result, "文件上传成功", "文件上传失败");
    }


}
