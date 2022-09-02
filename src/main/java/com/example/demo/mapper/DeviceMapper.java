package com.example.demo.mapper;

import com.example.demo.domain.DeviceVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface DeviceMapper {
    List<DeviceVO> getDeviceList(int tree_id);
    int addDevice(DeviceVO cmtdata);
}
