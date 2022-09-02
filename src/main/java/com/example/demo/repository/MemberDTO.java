package com.example.demo.repository;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberDTO {
    private String username;
    private String password;
    private String auth;
}