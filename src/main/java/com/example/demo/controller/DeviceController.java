package com.example.demo.controller;

import com.example.demo.domain.DeviceVO;
import com.example.demo.domain.MapVO;
import com.example.demo.domain.Pagination;
import com.example.demo.service.DeviceService;
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
@RequestMapping("/device/*")
@RequiredArgsConstructor
public class DeviceController {
    private static Logger Log = LoggerFactory.getLogger(NmsController.class);
    private final DeviceService deviceService;
    private Pagination pagination;

    @GetMapping(value = "/devmngmt")
    public String dev(Model model
            , @RequestParam(required = false, defaultValue = "1") int page
            , @RequestParam(required = false, defaultValue = "1") int range){
        Log.info("devMgmnt.do");
        model.addAttribute("Url_location","Dev");
        model.addAttribute("getMap_dvArea", deviceService.getMap_dvArea());

        //전체 글 개수
        int Dev_Count = deviceService.getDev_Count();
        System.out.println(Dev_Count);
        //페이징 객체
        Pagination pagination = new Pagination();
        pagination.pageInfo(page,range,Dev_Count);
        model.addAttribute("pagination",pagination);
        model.addAttribute("getDev_table",deviceService.getDev_Table(pagination));
        return "/device/devMngmt";
    }

    @GetMapping(value = "/test", produces= {MediaType.APPLICATION_JSON_UTF8_VALUE})
    public ResponseEntity<List<DeviceVO>> test(){
        Log.info("test.do");
        return new ResponseEntity(deviceService.getDev(), HttpStatus.OK);
    }
    @GetMapping(value = "/devicelist/{tree_id}", produces= {MediaType.APPLICATION_JSON_UTF8_VALUE})
    public ResponseEntity<List<MapVO>> treelist(@PathVariable("tree_id")int tree_id){
        return new ResponseEntity(deviceService.getDeviceList(tree_id), HttpStatus.OK);
    }

    @PostMapping(value="/deviceinput",consumes="application/json",produces="application/text;charset=utf-8")
    public ResponseEntity<String>addDevice(@RequestBody DeviceVO cmtdata){//디바이스 등록
        int isOkDV = deviceService.addDevice(cmtdata);
        return isOkDV == 1? new ResponseEntity<>("정상등록 되었습니다.",HttpStatus.OK)
                :new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }

    @PostMapping(value="/devicemodify",consumes="application/json",produces="application/text;charset=utf-8")
    public ResponseEntity<String>modifyDevice(@RequestBody DeviceVO cmtdata){//디바이스 변경
        int isOkDV = deviceService.modifyDevice(cmtdata);
        return isOkDV == 1? new ResponseEntity<>("정상변경 되었습니다.",HttpStatus.OK)
                :new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }

    @PostMapping(value="/deviceremove",consumes="application/json",produces="application/text;charset=utf-8")
    public ResponseEntity<String>removeDevice(@RequestBody DeviceVO cmtdata){//디바이스 삭제
        int isOkDV = deviceService.removeDevice(cmtdata);
        return isOkDV == 1? new ResponseEntity<>("정상삭제 되었습니다.",HttpStatus.OK)
                :new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }
}
