package com.example.demo.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TreeVO {
    private int id;
    private String parent;
    private String text;
    private String icon;

    public TreeVO() {}

    public TreeVO(int id, String name) {
        this.id = id;
        this.text = name;
    }

    public TreeVO(int id, String parent, String name, String icon) {
        this.id = id;
        this.parent = parent;
        this.text = name;
        this.icon = icon;
    }
}
