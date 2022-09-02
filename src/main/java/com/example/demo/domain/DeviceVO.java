package com.example.demo.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DeviceVO {
    private int iid;
    private String sname;

    public DeviceVO(){}

    public DeviceVO(int iid, String name) {
        this.iid = iid;
        this.sname = name;
    }
}
