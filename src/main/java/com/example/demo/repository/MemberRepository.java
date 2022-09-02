package com.example.demo.repository;

import com.example.demo.domain.MemberVO;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface MemberRepository extends JpaRepository<MemberVO, Long> {
    Optional<MemberVO> findByUsername(String username);
}
