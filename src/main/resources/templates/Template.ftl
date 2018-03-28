package com.subway.${subDirName};

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

/**
* ${comment}实体类
*
* @author huangbin
* @generate by autoCode
* @Date 2018-3-1
*/
@Entity
@Table(name = "${tableName}")
@Data
public class ${className}  implements Serializable {


//表之间的关联注解  请自行添加判断
@Id
@GeneratedValue(strategy = GenerationType.AUTO)
private Long id;
<#list columns as c>
    <#if c.colName!='id'>
    @Column( length = ${c.length!0}<#if !c.isNull>,nullable = false</#if>)
    private ${c.classType} ${c.colName};
    </#if>
</#list>

}
