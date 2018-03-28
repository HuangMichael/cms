package com.subway.pavilionWorks;

import com.subway.columns.Columns;
import com.subway.pavilionAuthor.PavilionAuthor;
import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

/**
 * 展馆作品信息
 */
@Entity
@Table(name = "T_PAVILION_WORKS")
@Data
public class PavilionWorks implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;//序号 主键


    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "columns_id", referencedColumnName = "id")
    private Columns columns;  //所属栏目名称


    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "author_id", referencedColumnName = "id")
    private PavilionAuthor author;  //作者


    @Column(length = 20, nullable = false)
    private String name;//作品名称


    @Column(length = 1)
    private String isFocus;//是否焦点图片


    @Column(length = 200)
    private String photoUrl;//作品路径


    @Column(length = 1)
    private String hasPhoto;//是否有会员照片


    @Column(length = 20)
    private String  uploadTime;//上传时间

    @Column(length = 20)
    private String releaseTime;//发布时间

    private Long sortNo;//排序

    @Column(length = 1)
    private String status;//状态

    @Column(length = 20)
    private String authKey;//状态
}
