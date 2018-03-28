package com.subway.controller.statistics;/**
 * Created by Administrator on 2016/11/4.
 */

import com.subway.controller.common.BaseController;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 外委单位完工统计
 *
 * @author
 * @create 2016-11-04 14:01
 **/
@Controller
@EnableAutoConfiguration
@RequestMapping("/unitsStatistics")
public class UnitsStatisticsController extends BaseController {

//    @Autowired
//    UnitsStatisticsService unitsStatisticsService;
//
//
//    @RequestMapping(value = "/list")
//    public String list(HttpSession httpSession, ModelMap modelMap) {
//
//        return "/unitsStatistics/list";
//    }
//
//
//
//    /**
//     * @return 按照年查询有报修数据的月份
//     */
//    @RequestMapping(value = "/getDataYear")
//    @ResponseBody
//    public List<String> getDataYear() {
//        return unitsStatisticsService.getDataYear();
//
//    }
//
//
//
//    /**
//     * @param year 年份
//     * @return 按照年查询有报修数据的月份
//     */
//    @RequestMapping(value = "/getDataMonthByYear/{year}")
//    @ResponseBody
//    public List<String> getDataMonthByYear(@PathVariable("year") Long year) {
//        return unitsStatisticsService.getDataMonthByYear(year);
//
//    }
//
//
//    /**
//     * @param year 年份
//     * @return 按照年查询有报修数据的月份
//     */
//    @RequestMapping(value = "/getDataDistributed/{unitId}/{year}")
//    @ResponseBody
//    public List<StatisticsDistributedObject> getOrderDistributedDataYearAndUnit(@PathVariable("unitId") Long unitId, @PathVariable("year") Long year) {
//        return unitsStatisticsService.getDistributedOrderCountByYearAndUnit(year, unitId);
//
//    }
//
//
//    /**
//     * @param year 年份
//     * @return 按照年查询有报修数据的月份
//     */
//    @RequestMapping(value = "/getDataFinished/{unitId}/{year}")
//    @ResponseBody
//    public List<StatisticsFinishedObject> getOrderFinishedDataYearAndUnit(@PathVariable("unitId") Long unitId, @PathVariable("year") Long year) {
//        return unitsStatisticsService.getFinishedOrderCountByYearAndUnit(year, unitId);
//
//    }

}
