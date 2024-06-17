package com.ou.pojo;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.LinkedHashSet;
import java.util.Set;

@Getter
@Setter
@Entity
@Table(name = "user")
@NamedQueries({
        @NamedQuery(name = "User.findById", query = "select u from User u where u.id = :id"),
        @NamedQuery(name = "User.findByUsername", query = "select u from User u where u.username = :username"),
        @NamedQuery(name = "User.findByIsActive", query = "select u from User u where u.isActive = :isActive")
})
public class User {
    @Id
    @Column(name = "id", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "username", nullable = false, length = 45)
    private String username;

    @Column(name = "password", nullable = false, length = 100)
    private String password;

    @Lob
    @Column(name = "role", nullable = false)
    private String role;

    @Column(name = "is_active")
    private Boolean isActive;

    @OneToOne(mappedBy = "user")
    private Profile profile;
}