package com.subway.basicMenu;

import lombok.Data;

import javax.persistence.*;

/**
 * Created by HUANGBIN on 2016/4/15.
 * 菜单信息
 */

@Entity
@Table(name = "T_BASIC_MENU")
@Data
public class BasicMenu {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(length = 10, nullable = false)
    private String menuCode;//编号

    @Column(length = 20, nullable = false)
    private String menuName;//资源名称

    @Column(length = 100)
    private String menuUrl;//资源路径

    @Column(length = 100)
    private String iconClass;//资源描述

    @Column(length = 1)
    private Long menuLevel;//资源级别

    @Column(length = 100)
    private String appName;//应用名称


    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "parent_id", referencedColumnName = "id")
    BasicMenu parent;

    @Column(length = 1)
    private String status;

    private Long sortNo; //排序

    @Column(length = 1)
    private boolean staticFlag;//是否静态资源
}

