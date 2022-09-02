package com.example.demo.mapper;

import com.example.demo.domain.TreeVO;
import com.example.demo.repository.TestDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface WorkspaceMapper {
    List<TestDTO> getUserList();
    List<TreeVO> getTreeList();
}
