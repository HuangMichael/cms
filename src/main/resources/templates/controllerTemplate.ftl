package com.subway.${subDirName};

import com.subway.controller.common.BaseController;
import com.subway.domain.app.MyPage;
import com.subway.service.app.ResourceService;
import com.subway.utils.PageUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import com.subway.object.ReturnObject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
* ${comment}
*
* @author huangbin
* @generate by autoCode
* @Date 2018-3-1
*/
@Controller
@EnableAutoConfiguration
@RequestMapping("/${subDirName}")
public class ${className}Controller extends BaseController {
private static Integer SEARCH_PARAM_SIZE = 2;

@Autowired
ResourceService resourceService;
@Autowired
${className}Service ${subDirName}Service;
@Autowired
${className}SearchService ${subDirName}SearchService;






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
public MyPage data(HttpSession session, HttpServletRequest request, @RequestParam(value = "current", defaultValue = "0") int current, @RequestParam(value = "rowCount", defaultValue = "10") Long rowCount, @RequestParam(value = "searchPhrase", required = false) String searchPhrase) {
Map<String, String[]> parameterMap = request.getParameterMap();
Pageable pageable = new PageRequest(current - 1, rowCount.intValue(), super.getSort(parameterMap));
return new PageUtils().searchBySortService(${subDirName}SearchService, searchPhrase, SEARCH_PARAM_SIZE, current, rowCount, pageable);
}

/**
* @param id 用户id
* @return 根据${comment}id查询
*/
@RequestMapping(value = "/findById/{id}", method = RequestMethod.GET)
@ResponseBody
public ${className} findById(@PathVariable("id") Long id) {
return ${subDirName}Service.findById(id);
}


/**
* @param id
* @return 删除${comment}信息
*/
@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
@ResponseBody
public ReturnObject delete(@PathVariable("id") Long id) {
return ${subDirName}Service.delete(id);
}


/**
* @param ${comment} 信息
* @return 保存${comment}信息
*/
@RequestMapping(value = "/save", method = RequestMethod.POST)
@ResponseBody
public ReturnObject save(${className} ${subDirName}) {
return ${subDirName}Service.save(${subDirName});
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
List< ${className}> dataList = ${subDirName}SearchService.findByConditions(param, SEARCH_PARAM_SIZE);
${subDirName}Service.setDataList(dataList);
${subDirName}Service.exportExcel(request, response, docName, titles, colNames);
}


}
