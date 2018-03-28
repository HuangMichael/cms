package com.subway.memberWorks;


import com.subway.member.Member;
import com.subway.unit.Unit;
import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

/**
 * 会员作品信息
 */
@Entity
@Table(name = "T_MEMBER_WORKS")
@Data
public class MemberWorks implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;//序号 主键

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "unit_id", referencedColumnName = "id")
    private Unit unit;//所属协会

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "member_id", referencedColumnName = "id")
    private Member member;  //所属会员

    @Column(length = 50, nullable = false)
    private String name;//作品名称

    @Column(length = 1, nullable = false)
    private String isFocus;//是否焦点作品

    @Column(length = 1)
    private String worksType; //作品类型

    @Column(length = 200)
    private String photoUrl;//作品路径

    @Column(length = 20)
    private String uploadTime;//上传时间

    @Column(length = 20)
    private String releaseTime;//发布时间

    private Long sortNo;

    @Column(length = 1, nullable = false)
    private String status;

    @Column(length = 20)
    private String authKey;//授权码
}
