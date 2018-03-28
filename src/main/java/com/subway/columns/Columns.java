package com.subway.columns;


import com.subway.site.Site;
import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;


@Entity
@Table(name = "T_COLUMNS")
@Data
public class Columns implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "site_id", referencedColumnName = "id")
    private Site site;

    @Column(length = 20, nullable = false)
    private String name;

    @Column(length = 20, nullable = false)
    private String colDesc;

    @Column(length = 20, nullable = false)
    private String type;

    @Column(length = 20, nullable = false)
    private String beginTime;

    @Column(length = 20, nullable = false)
    private String endTime;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "parent_id", referencedColumnName = "id")
    private Columns parent;

    @Column(length = 20)
    private Long sortNo;

    @Column(length = 1, nullable = false)
    private String status;

    @Column(length = 20)
    private String authKey;
}

