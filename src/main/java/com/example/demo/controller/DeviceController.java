package com.example.demo.controller;

import com.example.demo.domain.DeviceVO;
import com.example.demo.domain.TreeVO;
import com.example.demo.service.DeviceService;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/device/*")
@RequiredArgsConstructor
public class DeviceController {
    private static Logger Log = LoggerFactory.getLogger(NmsController.class);
    private final DeviceService deviceService;

    @GetMapping(value = "/devicelist/{tree_id}", produces= {MediaType.APPLICATION_JSON_UTF8_VALUE})
    public ResponseEntity<List<TreeVO>> treelist(@PathVariable("tree_id")int tree_id){

        return new ResponseEntity(deviceService.getDeviceList(tree_id), HttpStatus.OK);
    }

    @PostMapping(value="/deviceinput",consumes="application/json",produces="application/text;charset=utf-8")
    public ResponseEntity<String>addDevice(@RequestBody DeviceVO cmtdata){//디바이스 등록
        int isOkDV = deviceService.addDevice(cmtdata);
        return isOkDV == 1? new ResponseEntity<>("정상등록 되었습니다.",HttpStatus.OK)
                :new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }

}
