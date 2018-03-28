package com.subway.cangwei;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

/**
 * 仓位信息表实体类
 *
 * @author huangbin
 * @generate by autoCode
 * @Date 2018-3-1
 */
@Entity
@Table(name = "t_cangwei")
@Data
public class Cangwei implements Serializable {
    //表之间的关联注解  请自行添加判断
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @Column(length = 20)
    private String rq;
    @Column(length = 20)
    private String code;
    @Column(length = 20)
    private String name;
    @Column(length = 0)
    private Long cgs;
    @Column(length = 0)
    private Long mc;
    @Column(length = 20)
    private String gdmc;
    @Column(length = 0)
    private Double bdbl;
    @Column(length = 0)
    private Long zj;
    @Column(length = 20)
    private String gflx;
    @Column(length = 0)
    private Double zltgbcgbl;
    @Column(length = 20)
    private String gdxz;
    @Column(length = 1)
    private String status;

}
