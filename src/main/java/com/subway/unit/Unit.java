package com.subway.unit;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

/**
 * 单位信息
 */
@Entity
@Table(name = "T_UNIT")
@Data
public class Unit implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(length = 20, nullable = false)
    private String code;

    @Column(length = 50, nullable = false)
    private String name;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "parent_id", referencedColumnName = "id")
    private Unit parent;  //所属会员

    private Long sortNo;

    @Column(length = 1)
    private String status;

    @Column(length = 20)
    private String authKey;
}
