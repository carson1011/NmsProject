package com.example.demo.service;

import com.example.demo.domain.TreeVO;
import com.example.demo.repository.TestDTO;

import java.util.List;
public interface WorkspaceService {
    public List<TestDTO> getUserList();
    public List<TreeVO> getTreeList();
}
