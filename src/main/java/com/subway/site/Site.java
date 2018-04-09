package com.subway.site;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

/**
 * 站点信息
 */
@Entity
@Table(name = "T_SITE")
@Data
public class Site implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(length = 50, nullable = false)
    private String name; //站点名称


    @Column(length = 20)
    private String siteDir; //协会目录

    @Column(length = 20, nullable = false)
    private String domainName;//域名

    @Column(length = 20, nullable = false)
    private String deployHost; //部署主机


    private String beginTime;//生效时间


    private String endTime;//失效时间


    @Column(length = 20)
    private String sortNo;//排序

    @Column(length = 1, nullable = false)
    private String status;
}
