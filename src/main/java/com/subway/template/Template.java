package com.subway.template;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

/**
 * 模板控制器类
 *
 * @author huangbin
 * @generate by autoCode
 * @Date 2018-3-1
 */
@Entity
@Table(name = "t_template")
@Data
@NoArgsConstructor
public class Template {


    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(length = 20, nullable = false)
    private String templateName; //模板名称

    @Column(length = 50, nullable = false)
    private String templateUrl;//模板路径

    @Column(length = 50, nullable = false)
    private String templateDesc;//模板描述


    @Column(length = 100, nullable = false)
    private String fileName; //模板名称

    @Column(length = 100, nullable = false)
    private String fileUrl; //模板名称


    @Column(length = 20, nullable = false)
    private String sortNo;//排序

    @Column(length = 1, nullable = false)
    private String status;//状态

    /**
     * @param templateName
     * @param fileName
     * @param fileUrl
     */
    public Template(String templateName, String fileName, String fileUrl) {
        this.templateName = templateName;
        this.fileName = fileName;
        this.fileUrl = fileUrl;
    }
}
