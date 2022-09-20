package com.example.demo.service;

import com.example.demo.domain.MapVO;

public interface AreaService {
    public int addMap(MapVO cmtdata);
    public int modifyMapHead(MapVO cmtdata);
    public int removeMap(MapVO cmtdata);
}
