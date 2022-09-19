package com.example.demo.controller;

import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/area/*")
@RequiredArgsConstructor
public class AreaController {
    private static Logger Log = LoggerFactory.getLogger(AreaController.class);

    @GetMapping(value = "/areamngmt")
    public String dev(Model model
            , @RequestParam(required = false, defaultValue = "1") int page
            , @RequestParam(required = false, defaultValue = "1") int range){
        Log.info("areaMgmnt.do");
        model.addAttribute("Url_location","Area");
        return "/area/areaMngmt";
    }

}
