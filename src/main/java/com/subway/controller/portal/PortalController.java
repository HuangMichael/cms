package com.subway.controller.portal;


import com.subway.service.portal.PortalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

/**
 * Created by huangbin on 2015/12/23 0023.
 */
@Controller
@EnableAutoConfiguration
@RequestMapping("/portal")
@SessionAttributes("menuList")
public class PortalController {

    @Autowired
    PortalService portalService;


    @RequestMapping(value = "/index")
    public String index(ModelMap modelMap) {

        return "/portal/index";
    }

    @RequestMapping(value = "/list")
    public String list(ModelMap modelMap) {

        return "/portal/list";
    }


//    /**
//     * @param reportMonth 月份
//     * @return
//     */
//    @RequestMapping(value = "/findTopEqClass/{reportMonth}", method = RequestMethod.GET)
//    @ResponseBody
//    public List<Object> findTopNReportCartByEqClass(@PathVariable(value = "reportMonth") String reportMonth) {
//        return portalService.findTopNReportByEqClass(reportMonth);
//    }
}

