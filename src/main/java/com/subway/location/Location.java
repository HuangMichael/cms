package com.subway.location;


import lombok.Data;

import javax.persistence.*;

/**
 * Created by huangbin on 2018/03/17 0023.
 * 设备位置信息
 */
@Entity
@Table(name = "T_LOCATION")
@Data
public class Location implements java.io.Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(length = 30, updatable = false)
    private String locCode;//位置编码

    @Column(length = 100)
    private String locName;//位置描述

    @Column(length = 100)
    private String locDesc;//位置描述

    @Column(length = 1, nullable = false)
    private Long locLevel;

    @Column(length = 1)
    private String locType;  //位置类型  1段区 2站区

    @Column(length = 5)
    private Long parentId;

    @Column(length = 20, nullable = false) //默认位置正常
    private String authKey;//状态

    @Column(length = 1, nullable = false) //默认位置正常
    private String status;//状态


}