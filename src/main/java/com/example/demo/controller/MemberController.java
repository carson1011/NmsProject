package com.example.demo.controller;

import com.example.demo.repository.MemberDTO;
import com.example.demo.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@RequiredArgsConstructor
@Controller
public class MemberController {

    private final MemberService memberService;

    @PostMapping("/user")
    public String signup(MemberDTO infoDto) { // 회원 추가
        memberService.save(infoDto);
        return "redirect:/login";
    }

    @GetMapping("/logout")
    public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
        new SecurityContextLogoutHandler().logout(request, response, SecurityContextHolder.getContext().getAuthentication());
        return "redirect:/login";
    }

    @RequestMapping({"/","/null"})
    public String GohomePage(Model model){
        return "redirect:/nms/home";
    }
    /*@GetMapping("/logout")
    public void logoutPage() throws Exception{}*/
    @RequestMapping("/logout")
    public String logout(HttpServletRequest request,
                         SessionStatus status,
                         HttpSession session,
                         HttpServletResponse httpServletResponse,
                         ModelMap model) throws Exception{
        Object URL = session.getAttribute("URL");

        status.setComplete();
        session.removeAttribute("MemberVO");
        session.invalidate();

        return "redirect:/login";
    }
}