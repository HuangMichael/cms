package com.subway.tableColumnConfig;

import com.subway.tableConfig.TableConfig;
import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by huangbin on 2017/8/16.
 * 表字段配置表
 */
@Entity
@Table(name = "T_TABLE_COLUMN_CONFIG")
@Data
public class TableColumnConfig implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", length = 11, nullable = false)
    private Long id; //序号

    @Column(length = 50, nullable = false)
    private String colName; //基础表数据库字段名

    @Column(length = 100, nullable = false)
    private String colDesc; //基础表列的描述


    @Column(length = 50, nullable = false)
    private String dataType; //该列的数据类型


    @Column(length = 50)
    private String converter; //数据转换器


    @Column(length = 50)
    private String formatter; //数据格式化


    @Column(length = 100, nullable = false)
    private String classType; //对应的类的类型

    @Column(length = 4)
    private Long length; //数据长度如果有的话


    @Column(length = 1, nullable = false)
    private Boolean isNull;//表示该列属性是否为空

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "table_id", referencedColumnName = "id", nullable = false)
    private TableConfig tableConfig; //所对应的EtlTable


    @Column(length = 2)
    private Long sortNo; //排序

    @Column(length = 1, nullable = false)
    private String status; //状态


}
