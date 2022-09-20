package com.example.demo.mapper;

import com.example.demo.domain.DeviceVO;
import com.example.demo.domain.MapVO;
import com.example.demo.domain.Pagination;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface DeviceMapper {

    List<DeviceVO> getDeviceAllList();
    List<DeviceVO> getDeviceList(int tree_id);
    List<MapVO> getMap_dvArea();
    int addDevice(DeviceVO cmtdata);
    int modifyDevice(DeviceVO cmtdata);
    int removeDevice(DeviceVO cmtdata);

    List<DeviceVO> getDev_Table(Pagination pagination);
    int getDev_Count();
    List<DeviceVO> getDev();

}
