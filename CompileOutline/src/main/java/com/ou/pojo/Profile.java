package com.ou.pojo;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.time.LocalDate;

@Getter
@Setter
@Entity
@Table(name = "profile")
public class Profile {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_id", nullable = false)
    private Integer id;

    @MapsId
    @OneToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @Column(name = "fullname", nullable = false, length = 45)
    private String fullname;

    @Column(name = "email", nullable = false, length = 45)
    private String email;

    @Column(name = "avatar", nullable = false, length = 100)
    private String avatar;

    @Column(name = "date_joined")
    private LocalDate dateJoined;

    @Column(name = "phone", length = 15)
    private String phone;

    @Column(name = "gender")
    private Boolean gender;

}