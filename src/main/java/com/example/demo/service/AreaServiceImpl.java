package com.example.demo.service;

import com.example.demo.domain.MapVO;
import com.example.demo.mapper.MapMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class AreaServiceImpl implements AreaService{

    private final MapMapper mapMapper;

    public int addMap(MapVO cmtdata){
        return mapMapper.addMap(cmtdata);
    }

    public int modifyMapHead(MapVO cmtdata){
        return mapMapper.modifyMapHead(cmtdata);
    }

    public int removeMap(MapVO cmtdata){
        return mapMapper.removeMap(cmtdata);
    }
}
