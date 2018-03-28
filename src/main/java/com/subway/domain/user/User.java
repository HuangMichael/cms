package com.subway.domain.user;


import com.subway.location.Location;
import com.subway.role.Role;
import lombok.Data;
import org.codehaus.jackson.annotate.JsonIgnore;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

/**
 * Created by huangbin on 2016/03/14 0023.
 * 用户信息
 */
@Entity
@Table(name = "T_USER")
@Data
public class User implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
    @Column(length = 20, unique = true, nullable = false, updatable = false)
    private String userName;
    @JsonIgnore
    @Column(length = 50)
    private String password;

    @Column(length = 100)
    private String photoUrl; //1男 0女

    @Column(length = 1)
    private String gender; //1男 0女

    @Column(length = 20)
    private String birthDate; //出生年月

    @Column(length = 20)
    private String personName;

    @Column(length = 20)
    private String idCard;

    @Column(length = 50)
    private String email;

    @Column(length = 20)
    private String telephone;


    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "location_id", referencedColumnName = "id")
    Location location;


    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "t_role_user", joinColumns = {@JoinColumn(name = "user_id")}, inverseJoinColumns = {@JoinColumn(name = "role_id")})
    private List<Role> roleList;


    @Column(length = 20)
    private String authKey;


    @Column(scale = 1000)
    private Long sortNo;

    @Column(nullable = false, length = 1, columnDefinition = "varchar(1) default '1'")
    private String status;


}

