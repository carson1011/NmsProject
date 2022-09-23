package com.example.demo.handler;

import com.example.demo.domain.CntAreaVO;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Component
public class ScheduleHandler {
    JavemysqlHandler javemysqlHandler = new JavemysqlHandler();
    String dtNow;
    @Scheduled(fixedRate = 1000)
    public void scheduleFixedRateTask() {
        LocalDate dt = LocalDate.now();
        dtNow = dt.toString();
        /*System.out.println(dtNow);*/
    }
    @Scheduled(fixedRate = 10000)
    public void SetCntArea_Task() throws SQLException {
        List<CntAreaVO> cntAreaVOList = new ArrayList<>();
        cntAreaVOList = javemysqlHandler.getinstalled_imapid(dtNow);
        for (CntAreaVO element: cntAreaVOList) {
            javemysqlHandler.upsert_CntArea(element);
        }
    }
}
