package com.example.demo.controller;

import com.example.demo.domain.MapVO;
import com.example.demo.service.MapService;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@Controller
@RequestMapping("/nms/*")
@RequiredArgsConstructor
public class NmsController {
    private static Logger Log = LoggerFactory.getLogger(NmsController.class);

    private final MapService mapService;

    @GetMapping(value = "/home")
    public String home(Model model){
        Log.info("home");
        model.addAttribute("Url_location","Home");
        return "/nms/home";
    }

    @GetMapping(value = "/treelist", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
    public ResponseEntity<List<MapVO>> treelist(){
        Log.info("treelist.do");
        return new ResponseEntity(mapService.getTreeList(), HttpStatus.OK);
    }

    @PostMapping(value="/home")
    public void homepost(@RequestBody String body){
        System.out.println(body);
    }


}
