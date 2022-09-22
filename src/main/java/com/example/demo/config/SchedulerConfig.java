package com.example.demo.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.scheduling.annotation.SchedulingConfigurer;
import org.springframework.scheduling.concurrent.ThreadPoolTaskScheduler;
import org.springframework.scheduling.config.ScheduledTaskRegistrar;

@Configuration
public class SchedulerConfig implements SchedulingConfigurer {
    private final int POOL_SIZE = 10;
    @Override
    public void configureTasks(ScheduledTaskRegistrar scheduledTaskRegistrar) {
        ThreadPoolTaskScheduler threadPoolTaskScheduler = new ThreadPoolTaskScheduler();

        threadPoolTaskScheduler.setPoolSize(POOL_SIZE);
        threadPoolTaskScheduler.setThreadNamePrefix("my-scheduled-task-pool-");
        threadPoolTaskScheduler.initialize();

        scheduledTaskRegistrar.setTaskScheduler(threadPoolTaskScheduler);
    }
}


/**           *　　　　　　*　　　　　　*　　　　　　*　　　　　　*
 초(0-59)   분(0-59)　　시간(0-23)　　일(1-31)　　월(1-12)　　요일(0-7)
 각 별 위치에 따라 주기를 다르게 설정 할 수 있다.
 순서대로 초-분-시간-일-월-요일 순이다. 그리고 괄호 안의 숫자 범위 내로 별 대신 입력 할 수도 있다.
 요일에서 0과 7은 일요일이며, 1부터 월요일이고 6이 토요일이다.
 cron 속성 지정하여 사용.

 package 패키지위치;

 import java.text.SimpleDateFormat;
 import java.util.Date;
 import org.springframework.scheduling.annotation.Scheduled;
 import org.springframework.stereotype.Component;

 @Component
 public class Scheduler {
 @Scheduled(cron = "0 * 9 * * ?")
 public void cronJobSch() {
 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
 Date now = new Date();
 String strDate = sdf.format(now);
 System.out.println("Java cron job expression:: " + strDate);
 }
 }
 */