package com.example.demo.service;

import com.example.demo.domain.DeviceVO;
import com.example.demo.domain.MapVO;
import com.example.demo.domain.Pagination;
import com.example.demo.mapper.DeviceMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class DeviceServiceImpl implements DeviceService{

    private final DeviceMapper deviceMapper;


    @Override
    public List<DeviceVO> getDeviceAllList(){
        return deviceMapper.getDeviceAllList();
    }
    /**
     * do.getDeviceList dev
     * @param tree_id
     * @return
     */
    @Override
    public List<DeviceVO> getDeviceList(int tree_id){
        System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>ok");
        return deviceMapper.getDeviceList(tree_id);
    }

    public List<DeviceVO> getDev_Table(Pagination pagination){
        return deviceMapper.getDev_Table(pagination);
    }
    public int getDev_Count(){
        return deviceMapper.getDev_Count();
    }


    /**
     * do.insert dev
     * @param cmtdata dev struct
     * @return
     */
    @Override
    public int addDevice(DeviceVO cmtdata) {
        return deviceMapper.addDevice(cmtdata);
    }
    @Override
    public int modifyDevice(DeviceVO cmtdata) {
        return deviceMapper.modifyDevice(cmtdata);
    }

    @Override
    public int removeDevice(DeviceVO cmtdata) {
        return deviceMapper.removeDevice(cmtdata);
    }


    public List<MapVO> getMap_dvArea(){
        return deviceMapper.getMap_dvArea();
    }



}
