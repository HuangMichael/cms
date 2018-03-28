package com.subway.appSearch;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.subway.domain.dev.App;
import com.subway.tableColumnConfig.TableColumnConfig;
import lombok.Data;

import javax.persistence.*;
import java.util.Set;

/**
 * 应用查询配置
 **/
@Entity
@Table(name = "T_APP_SEARCH")
@Data

public class AppSearch {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;  //id

    @Column(length = 20)
    private String searchDesc;// 描述


    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "app_id", referencedColumnName = "id")
    private App app; //应用名称

    @JsonBackReference
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "t_search_config", joinColumns = {@JoinColumn(name = "search_id")}, inverseJoinColumns = {@JoinColumn(name = "config_id")})
    private Set<TableColumnConfig> columnConfigSet;

    @Column(length = 1)
    private String hasAuthKey; //授权码

    @Column(length = 1)
    private String status; //状态

}
