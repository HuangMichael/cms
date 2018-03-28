package com.subway.tasks;

import com.subway.service.org.SysInfoService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 * 维修任务状态定时更新
 *
 * @author huangbin
 * @create 2016-09-05 14:08
 **/
@Component
public class BatchGeneratePmOrderTask {

    private static final Logger log = LoggerFactory.getLogger(BatchGeneratePmOrderTask.class);

    @Autowired
    SysInfoService sysInfoService;

    @Scheduled(cron = "0 0 1 * * *")
    public void updateFixTaskStatus() {

    }
}
