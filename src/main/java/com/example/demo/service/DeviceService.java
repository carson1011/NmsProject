package com.example.demo.service;

import com.example.demo.domain.DeviceVO;
import com.example.demo.domain.MapVO;
import com.example.demo.domain.Pagination;

import java.util.List;

public interface DeviceService {
    public List<DeviceVO> getDeviceAllList();
    public List<DeviceVO> getDeviceList(int tree_id);
    public List<MapVO> getMap_dvArea();
    public int addDevice(DeviceVO cmtdata);
    public List<DeviceVO> getDev_Table(Pagination pagination);
    public int getDev_Count();

    public int modifyDevice(DeviceVO cmtdata);

    public int removeDevice(DeviceVO cmtdata);
}
