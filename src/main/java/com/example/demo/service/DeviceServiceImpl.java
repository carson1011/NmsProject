package com.example.demo.service;

import com.example.demo.domain.DeviceVO;
import com.example.demo.mapper.DeviceMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class DeviceServiceImpl implements DeviceService{

    private final DeviceMapper deviceMapper;
    @Override
    public List<DeviceVO> getDeviceList(int tree_id){
        System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>ok");
        return deviceMapper.getDeviceList(tree_id);
    }

    @Override
    public int addDevice(DeviceVO cmtdata) {
        return deviceMapper.addDevice(cmtdata);
    }

}
