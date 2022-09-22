package com.example.demo.domain;

import lombok.Getter;
import lombok.Setter;

import java.awt.*;
import java.text.DateFormat;

@Getter
@Setter
public class DevHisVO {
    private String mac;
    private DateFormat stDateTime;
    private int incnt;
    private int outcnt;
    private String stempture;
    private String stempture_r;
    private Image img;
    private byte ablmg;
    private int imapid;
}
