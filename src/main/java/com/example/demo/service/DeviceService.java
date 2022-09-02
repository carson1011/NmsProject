package com.example.demo.service;

import com.example.demo.domain.DeviceVO;

import java.util.List;

public interface DeviceService {
    public List<DeviceVO> getDeviceList(int tree_id);
    public int addDevice(DeviceVO cmtdata);
}
