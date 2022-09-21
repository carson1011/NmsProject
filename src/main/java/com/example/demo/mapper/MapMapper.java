package com.example.demo.mapper;

import com.example.demo.domain.MapVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MapMapper {
    List<MapVO> getTreeList();

    int addMap(MapVO cmtdata);
    int modifyMapHead(MapVO cmtdata);
    int removeMap(MapVO cmtdata);

    int removeMapwithDev(MapVO cmtdata);

    int removeMapwithUnderMap(MapVO cmtdata);

    int removeMapwithUnderMapDev(MapVO cmtdata);
}
