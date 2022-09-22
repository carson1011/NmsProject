package com.example.demo.handler;

import com.example.demo.domain.CntAreaVO;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Component
public class ScheduleHandler {
    JavemysqlHandler javemysqlHandler = new JavemysqlHandler();
    @Scheduled(fixedRate = 10000)
    public void scheduleFixedRateTask() {
        System.out.println(
                "Fixed rate task - " + System.currentTimeMillis() / 1000);
    }
    @Scheduled(fixedRate = 3000)
    public void SetCntArea_Task() throws SQLException {
        List<CntAreaVO> cntAreaVOList = new ArrayList<>();
        cntAreaVOList = javemysqlHandler.getinstalled_imapid();
        for (CntAreaVO element: cntAreaVOList) {
            javemysqlHandler.upsert_CntArea(element);
        }
    }
}
