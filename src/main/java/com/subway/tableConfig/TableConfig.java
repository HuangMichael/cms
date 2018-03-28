package com.subway.tableConfig;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by huangbin on 2018-3-3
 * 数据库表配置
 */
@Entity
@Table(name = "T_TABLE_CONFIG")
@Data
public class TableConfig implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", length = 11, nullable = false)
    private Long id; //序号

    @Column(length = 50, nullable = false)
    private String tableName; //表的名称

    @Column(length = 100, nullable = false)
    private String tableDesc; //表的描述

    @Column(length = 100, nullable = false)
    private String domainName; //实体类名称

    @Column(length = 50, nullable = false)
    private String shortName; //实体类名称

    @Column(length = 100, nullable = false)
    private String serviceName; //业务类名称

    @Column(length = 100, nullable = false)
    private String searchServiceName; //查询业务类名称

    @Column(length = 100, nullable = false)
    private String repositoryName; //数据库接口业务类名称

    @Column(length = 1)
    private Long sortNo; //状态

    @Column(length = 1, nullable = false)
    private String status; //状态


}

