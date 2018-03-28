package com.subway.member;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

/**
* 会员信息表实体类
*
* @author huangbin
* @generate by autoCode
* @Date 2018-3-1
*/
@Entity
@Table(name = "t_member")
@Data
public class Member  implements Serializable {


//表之间的关联注解  请自行添加判断
@Id
@GeneratedValue(strategy = GenerationType.AUTO)
private Long id;
    @Column( length = 20,nullable = false)
    private String cardNo;
    @Column( length = 20,nullable = false)
    private String name;
    @Column( length = 20)
    private String createTime;
    @Column( length = 20)
    private String enterDate;
    @Column( length = 1)
    private String hasPhoto;
    @Column( length = 100)
    private String photoUrl;
    @Column( length = 1)
    private String memberType;
    @Column( length = 0)
    private Long sortNo;
    @Column( length = 1)
    private String status;
    @Column( length = 20)
    private String authKey;

}
