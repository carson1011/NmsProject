package com.example.demo.controller;


import com.example.demo.domain.TreeVO;
import com.example.demo.service.WorkspaceService;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.Console;
import java.util.List;


@Controller
@RequestMapping("/nms/*")
@RequiredArgsConstructor
public class NmsController {
    private static Logger Log = LoggerFactory.getLogger(NmsController.class);

    private final WorkspaceService workspaceService;


    @GetMapping(value = "/home")
    public void home(Model model){
        Log.info("home");
    }

    @GetMapping(value = "/treelist", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
    public ResponseEntity<List<TreeVO>> treelist(){
        Log.info("treelist.do");
        return new ResponseEntity(workspaceService.getTreeList(), HttpStatus.OK);
    }

    @PostMapping(value="/home")
    public void homepost(@RequestBody String body){
        System.out.println(body);
    }


}
