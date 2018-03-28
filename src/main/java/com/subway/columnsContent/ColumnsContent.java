package com.subway.columnsContent;


import com.subway.columns.Columns;
import com.subway.site.Site;
import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

/**
 * 栏目内容
 */
@Entity
@Table(name = "T_COLUMNS_CONTENT")
@Data
public class ColumnsContent implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;


    @Column(length = 20, nullable = false)
    private String title;


    @Column(length = 5000, nullable = false)
    private String content;


    @Column(length = 100, nullable = false)
    private String focusPicUrl;


    @Column(length = 20, nullable = false)
    private String createTime;

    @Column(length = 20, nullable = false)
    private String releaseTime;

    @Column(length = 20)
    private String creator;


    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "site_id", referencedColumnName = "id")
    private Site site;


    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "columns_id", referencedColumnName = "id")
    private Columns columns;


    @Column(length = 20)
    private Long sortNo;


    @Column(length = 1, nullable = false)
    private String auditStatus; //1未审核 2初审 3复审  4 发布


    @Column(length = 1, nullable = false)
    private String status;

    @Column(length = 20)
    private String authKey;
}

