package com.example.demo.service;

import com.example.demo.domain.TreeVO;
import com.example.demo.mapper.WorkspaceMapper;
import com.example.demo.repository.TestDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class WorkspaceServiceImpl implements WorkspaceService {
    private final WorkspaceMapper workspaceMapper;

    @Override
    public List<TestDTO> getUserList(){
        return workspaceMapper.getUserList();
    }

    @Override
    public List<TreeVO> getTreeList(){
        return workspaceMapper.getTreeList();
    }

}
