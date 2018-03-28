package com.subway.role;


import com.fasterxml.jackson.annotation.JsonBackReference;
import com.subway.domain.app.resoure.Resource;
import com.subway.domain.user.User;
import lombok.Data;

import javax.persistence.*;
import java.util.List;
import java.util.Set;

/**
 * Created by huangbin on 2016/03/14 0023.
 * 角色信息
 */
@Entity
@Table(name = "T_ROLE")
@Data

public class Role {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
    @Column(length = 20, unique = true, nullable = false)
    private String roleName;
    @Column(length = 50, unique = true, nullable = false)
    private String roleDesc;
    @Column(scale = 1000)
    private long sortNo;
    @Column(nullable = false, length = 1, columnDefinition = "default 1")
    private String status;

    @JsonBackReference
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "t_role_user", joinColumns = {@JoinColumn(name = "role_id")}, inverseJoinColumns = {@JoinColumn(name = "user_id")})
    private Set<User> userSet;

    @JsonBackReference
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "t_role_resource", joinColumns = {@JoinColumn(name = "role_id")}, inverseJoinColumns = {@JoinColumn(name = "resource_id")})
    private List<Resource> resourceList;
}

