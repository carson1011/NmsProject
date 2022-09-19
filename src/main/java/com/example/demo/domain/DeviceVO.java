package com.example.demo.domain;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class DeviceVO {
    private String mac;
    private String module_note;
    private double fref_low;
    private double fref_high;
    private int isid;
    private int iid;
    private String sname;
    private double f_init_ref;
    private double real_fref_low;
    private double real_fref_high;
    private int iout;
    private int iin;
    private String sip;
    private Date receive_time;
}
