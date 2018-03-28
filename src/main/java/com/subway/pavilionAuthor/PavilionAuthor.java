package com.subway.pavilionAuthor;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

/**
 *
 * @author huangbin
 * @generate by autoCode
 * @Date 2018-3-1
 */
@Entity
@Table(name = "t_pavilion_author")
@Data
public class PavilionAuthor implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(length = 20)
    private String name;


    @Column(length = 200)
    private String photoUrl;


    @Column(length = 1)
    private String hasPhoto;


    @Column(length = 20)
    private String  createTime;


    private Long sortNo;


    @Column(length = 1)
    private String status;


    @Column(length = 20)
    private String authKey;//状态

}
