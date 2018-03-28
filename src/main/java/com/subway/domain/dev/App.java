package com.subway.domain.dev;

import com.subway.tableConfig.TableConfig;
import lombok.Data;

import javax.persistence.*;

/**
 * 应用信息
 */
@Entity
@Table(name = "T_APP")
@Data
public class App {


    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(length = 20, nullable = false)
    private String name; //应用名称

    @Column(length = 50, nullable = false)
    private String appDesc;//应用描述

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "table_config_id", referencedColumnName = "id", nullable = false)
    private TableConfig tableConfig;

    @Column(length = 20)
    private Long sortNo;//排序

    @Column(length = 1, nullable = false)
    private String status;//状态
}
