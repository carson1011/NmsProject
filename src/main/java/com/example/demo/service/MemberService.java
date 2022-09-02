package com.example.demo.service;

import com.example.demo.domain.MemberVO;
import com.example.demo.repository.MemberDTO;
import com.example.demo.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class MemberService implements UserDetailsService {

    private final MemberRepository memberRepository;

    /**
     * Spring Security 필수 메소드 구현
     *
     * @param username
     * @return UserDetails
     * @throws UsernameNotFoundException 유저가 없을 때 예외 발생
     */
    @Override // 기본적인 반환 타입은 UserDetails, UserDetails를 상속받은 UserInfo로 반환 타입 지정 (자동으로 다운 캐스팅됨)
    public MemberVO loadUserByUsername(String username) throws UsernameNotFoundException { // 시큐리티에서 지정한 서비스이기 때문에 이 메소드를 필수로 구현
        return memberRepository.findByUsername(username)
                .orElseThrow(() -> new UsernameNotFoundException((username)));
    }
    /**
     * 회원정보 저장
     *
     * @param infoDto 회원정보가 들어있는 DTO
     * @return 저장되는 회원의 PK
     */
    public Long save(MemberDTO infoDto) {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        infoDto.setPassword(encoder.encode(infoDto.getPassword()));

        return memberRepository.save(MemberVO.builder()
                .username(infoDto.getUsername())
                .auth(infoDto.getAuth())
                .password(infoDto.getPassword()).build()).getId();
    }
}