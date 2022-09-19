package com.example.demo.service;

import com.example.demo.domain.MapVO;
import com.example.demo.mapper.MapMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MapServiceImpl implements MapService {
    private final MapMapper mapMapper;



    @Override
    public List<MapVO> getTreeList(){
        return mapMapper.getTreeList();
    }

}
