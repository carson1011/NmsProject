package com.example.demo.controller;

import com.example.demo.domain.DeviceVO;
import com.example.demo.domain.MapVO;
import com.example.demo.service.AreaService;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/area/*")
@RequiredArgsConstructor
public class AreaController {
    private static Logger Log = LoggerFactory.getLogger(AreaController.class);
    private final AreaService areaService;

    @GetMapping(value = "/areamngmt")
    public String dev(Model model
            , @RequestParam(required = false, defaultValue = "1") int page
            , @RequestParam(required = false, defaultValue = "1") int range) {
        Log.info("areaMgmnt.do");
        model.addAttribute("Url_location", "Area");
        return "/area/areaMngmt";
    }

    @PostMapping(value = "/modifymaphead", consumes = "application/json", produces = "application/text;charset=utf-8")
    public ResponseEntity<String> modifyMap(@RequestBody MapVO cmtdata) {
        int isOkDV = areaService.modifyMapHead(cmtdata);
        return isOkDV == 1 ? new ResponseEntity<>("정상변경 되었습니다.", HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }

    @PostMapping(value = "/addmap", consumes = "application/json", produces = "application/text;charset=utf-8")
    public ResponseEntity<String> addMap(@RequestBody MapVO cmtdata) {
        Log.info("areaAddmap.do");
        int isOkDV = areaService.addMap(cmtdata);
        return isOkDV == 1 ? new ResponseEntity<>("정상변경 되었습니다.", HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }

    /*
     * 단일 Area만 삭제 No dev
     * */
    @PostMapping(value = "/removemap", consumes = "application/json", produces = "application/text;charset=utf-8")
    public ResponseEntity<String> removeMap(@RequestBody MapVO cmtdata) {
        Log.info("removemap.do");
        int isOkDV = areaService.removeMap(cmtdata);
        return isOkDV == 1 ? new ResponseEntity<>("정상변경 되었습니다.", HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }

    /*
     * 단일 Area와 등록되어 있는 Dev 모두 삭제
     * */
    @PostMapping(value = "/removemapwithdev", consumes = "application/json", produces = "application/text;charset=utf-8")
    public ResponseEntity<String> removeMapwithDev(@RequestBody MapVO cmtdata) {
        Log.info("removemapwithdev.do");
        int isOkDV = areaService.removeMapwithDev(cmtdata);
        Log.info("isOkDV : " + isOkDV);
        return isOkDV > 1 ? new ResponseEntity<>("정상변경 되었습니다.", HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }

    /*
     * Area와 등록되어 있는 하위 Area 모두 삭제
     * */
    @PostMapping(value = "/removemapwithundermap", consumes = "application/json", produces = "application/text;charset=utf-8")
    public ResponseEntity<String> removeMapwithUnderMap(@RequestBody MapVO cmtdata) {
        Log.info("removemapwithundermap.do");
        int isOkDV = areaService.removeMapwithUnderMap(cmtdata);
        Log.info("isOkDV : " + isOkDV);
        return isOkDV > 1 ? new ResponseEntity<>("정상변경 되었습니다.", HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }

    /*
     * Area와 등록되어 있는 하위 Area,Dev 모두 삭제
     * */
    @PostMapping(value = "/removemapwithundermapdev", consumes = "application/json", produces = "application/text;charset=utf-8")
    public ResponseEntity<String> removeMapwithUnderMapDev(@RequestBody MapVO cmtdata) {
        Log.info("removemapwithundermap.do");
        int isOkDV = areaService.removeMapwithUnderMapDev(cmtdata);
        Log.info("isOkDV : " + isOkDV);
        return isOkDV > 1 ? new ResponseEntity<>("정상변경 되었습니다.", HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }
}
