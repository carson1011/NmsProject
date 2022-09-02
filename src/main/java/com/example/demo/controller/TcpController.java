package com.example.demo.controller;

import com.example.demo.config.TcpSocketServer;
import org.springframework.stereotype.Controller;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

@Controller
public class TcpController {

    @PostConstruct
    private void start() {
        new Thread(new Runnable() {

            @Override
            public void run() {
                try {
                    new TcpSocketServer(8083).run();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }

        }).start();
    }

    @PreDestroy
    private void destory() {

    }
}
