package com.example.demo.mapper;

import com.example.demo.domain.MapVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MapMapper {

    List<MapVO> getTreeList();
}
